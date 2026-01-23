/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  This class updates the license consumed for license object record when user record is updated.This class is called from trigger trigUser/UserHandler.
Caveats:
1. Need batch to reverify permission set license assignment as its a separate table and the trigger is currently not available on the object
permission set license assignment
2. Assumption is there should only be 1 Licenses__c record for procuring business and license combination. License procurement is handled through child object Licenses Procurement. 


Change Log
//AB<20210305> - To not send mail to original list if the org is not production or if it is test run
//AB<20210305>2 - To attach Org Name in Mail Subject
//AB<20210305>3 - To remove record Id from threshold mail
//AB<20210305>4 - Total Licenses Procured instead of Total Licenses
//AB<20210305>5 - Remaining Licenses Available / Make it Red instead of Remaining Licenses
//AB<20210318>6 - Updated for error in licenses consumed when max are consumed
//AB<20210408>  - Updated to track only the Licenses tracked via Custom Metadata Type
********************************************************************************/

public WITHOUT SHARING class ctrlUpdateLicensesOnUserChange {
    public static String[] adminEmailAddresses = Label.License_Tracking_Admin_Email_List.split(',');//Custom Label providing functionality admin list when licenses are not found or not available. 
    public static Boolean isFirstTime = true;
    public static boolean isProductionOrg = false;//AB<20210305>
    public static boolean isRunningTest = false;//AB<20210305>
    public static String[] testMailArray= new String[]{'test@SpecPA.test','test123@specpa.test','abhinav.bhatnagar@dupont.com'};//AB<20210305>
    
    //Entry method which is called from trigger when user record is changed.    
    public static void userRecordChanged(List<User> oldUserList, List<User> newUserList,Boolean isInsert, Boolean isUpdate){
        boolean isActiveChanged = false; //Check whether active status is changed.        
        boolean isProcuringBusinessChanged = false; //Check whether procuring business status is changed.        
        boolean isUserLicenseChanged = false; //Check whether user licence is changed.
        
        //Capturing data of user object.        
        string userObjCurrentProcuringBusiness = newUserList[0].procuring_business__c;
        string userObjPastProcuringBusiness = isInsert?'':oldUserList[0].procuring_business__c;
        string userObjName = newUserList[0].FirstName;
        string userObjId = newUserList[0].Id;
        string userObjCurrentLicenseType =  [Select id,Profile.UserLicense.Name from User where Id=: userObjId  LIMIT 1][0].Profile.UserLicense.Name;
        string userObjPastLicenseType = isInsert?'':[Select id, UserLicense.Name from Profile where Id=: oldUserList[0].profileId  LIMIT 1][0].UserLicense.Name;
        boolean userObjCurrentIsActive = newUserList[0].isActive;
        boolean userObjPastIsActive =  isInsert?false:olduserlist[0].isActive;
        
        isProductionOrg = isProduction();//AB<20210305>
        isRunningTest = Test.isRunningTest();//AB<20210305>
        
        isActiveChanged = (userObjCurrentIsActive!=userObjPastIsActive)?true:false;
        isProcuringBusinessChanged = (userObjCurrentProcuringBusiness!=userObjPastProcuringBusiness)?true:false;
        isUserLicenseChanged = (userObjCurrentLicenseType!=userObjPastLicenseType)?true:false;
        
        Try{
            //Logic to call different methods to fetch and udpate licenses            
            
            if(!isActiveChanged && userObjCurrentIsActive && (isProcuringBusinessChanged || isUserLicenseChanged)){  //If active status is not changed and the user is currently active and the procuring business or the licence is changed. 
                fetchAndUpdateLicenseRecord(userObjCurrentProcuringBusiness, userObjPastProcuringBusiness, userObjName, userObjId, userObjCurrentLicenseType, userObjPastLicenseType); //Then fetch the correct licence record and update it based on current procuring business and decreased the license from past procuring business.
                
                fetchAndUpdatePermissionSetLicense(userObjCurrentProcuringBusiness, userObjPastProcuringBusiness, userObjName, userObjId); //Fetch the permission set licence for current procuring business and pass procuring business and update the past permission set licence. 
            }else if(isActiveChanged){ //If active status is changed from the active user 
                if(userObjCurrentIsActive){ //inactive user to active 
                    fetchAndIncreaseLicenseRecord(userObjCurrentProcuringBusiness, userObjName, userObjId, userObjCurrentLicenseType); //then fetch and increased a licence for the current procuring business.
                    fetchAndIncreasePermissionSetLicense(userObjCurrentProcuringBusiness, userObjName, userObjId); //fetch and increase Permission Set Licenses for current procuring business
                }else{ //User status Active to Inactive
                    if(isProcuringBusinessChanged || isUserLicenseChanged){
                        fetchAndDecreaseLicenseRecord(userObjPastProcuringBusiness, userObjPastLicenseType); //Then fetch and decrease the past procuring business licence.
                        fetchAndDecreasePermissionSetLicense(userObjPastProcuringBusiness,userObjId); //Fetch and decrease the permission set licence.
                    }else{ //If user active status is changed from active to in active and procuring business and user licence is not changed 
                        fetchAndDecreaseLicenseRecord(userObjCurrentProcuringBusiness, userObjCurrentLicenseType); //then decrease the licence for the current procuring business. 
                        fetchAndDecreasePermissionSetLicense(userObjCurrentProcuringBusiness,userObjId); //And decrease the permission set licence for current procuring business.
                    }                
                }            
            }
        }Catch(Exception e){
            System.debug('Error Occured While Updating Licenses: '+ e.getStackTraceString());
        }
        
    }
    
    //Future method to avoid mixed dml operation error for setup object user and non setup object licences is not allowed to perform DML/SOQL operations
    //Call out is set to true because method will call send mail once the record is updated or no licence record is found.
    @future(callout=true)
    private static void fetchAndUpdatePermissionSetLicense(string userObjCurrentProcuringBusiness, string userObjPastProcuringBusiness, string userObjName, string userObjId){
        boolean isMailSend = false;
        Licenses__c[] licenseObjRecords = null;
        Licenses__c[] licenseObjPastRecords = null;
        Licenses__c[] licenseObjRecordsToUpdate = new Licenses__c[]{};
            
            //Fetch the permission set licence assign record for the User.
            PermissionSetLicenseAssign[] pslaObjRecords =  [SELECT AssigneeId,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,PermissionSetLicenseId,PermissionSetLicense.MasterLabel,SystemModstamp FROM PermissionSetLicenseAssign WHERE AssigneeId =: userObjId   LIMIT 100];
        
        if(pslaObjRecords!=null && pslaObjRecords.size()>0){ //Permission set licence assign record is found 
            string[] pslaObjRecordsName = new string[]{};
                string[] pslaObjRecordsNameNotFound = new string[]{};
                    
                    for(PermissionSetLicenseAssign pslaObjRecord:pslaObjRecords){ //then for each permission set licence assigned record, add it to list.
                        pslaObjRecordsName.add(pslaObjRecord.PermissionSetLicense.MasterLabel);
                    }
            //Fetch the licence record for current procuring business and all the permission set licence assigned to user.
            licenseObjRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjCurrentProcuringBusiness AND Available_Licenses_Name__c IN : pslaObjRecordsName AND fRemaining_Licenses__c>0    ORDER BY Id DESC NULLS LAST limit 1];
            
            if(userObjPastProcuringBusiness!=null){ //If past procuring business is not null which is in the case of user is already active and procuring business is set not to null then fetch the past licence for the user.
                licenseObjPastRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjPastProcuringBusiness AND Available_Licenses_Name__c IN :pslaObjRecordsName     ORDER BY Id DESC NULLS LAST limit 1];
            }
            
            if(licenseObjRecords!=null && licenseObjRecords.size()>0){ //If Licenses found
                for(Licenses__c licenseObjCurrentRecord: licenseObjRecords){ //Then for each license
                    
                    licenseObjCurrentRecord.Licenses_Consumed__c += 1; //Increment the license consumed
                    licenseObjRecordsToUpdate.add(licenseObjCurrentRecord); //Add to license list to update
                    isMailSend = ((licenseObjCurrentRecord.Number_of_licenses_procured__c-licenseObjCurrentRecord.Licenses_Consumed__c)<=licenseObjCurrentRecord.Threshold_Limit__c)?sendThresholdEmail(licenseObjCurrentRecord):false; //Send mail if license consumed is more or equal to threshold limit.
                    pslaObjRecordsName.remove(pslaObjRecordsName.indexof(licenseObjCurrentRecord.Available_Licenses_Name__c)); //Remove from Permission Set License Assign List as the license record is found and assigned.
                }                
                isMailSend = (pslaObjRecordsName.size()>0)?sendLicenseNotFoundMail(string.join(pslaObjRecordsName,', '),userObjCurrentProcuringBusiness,userObjName,userObjId):false; //Send mail to admin if there are some Permission Set License Assign cannot be assigned to License Record due to all licenses consumed or Licenses record not found.
            }else{                    
                isMailSend = sendLicenseNotFoundMail(string.join(pslaObjRecordsName,', '),userObjCurrentProcuringBusiness,userObjName,userObjId); //Send mail to admin if there are some Permission Set License Assign cannot be assigned to License Record due to Licenses record not found.
            }
            
            if(licenseObjPastRecords!=null && licenseObjPastRecords.size()>0){ //If past last licenses assigned
                for(Licenses__c licenseObjPastRecord: licenseObjPastRecords){ //For each past licenses assigned
                    licenseObjPastRecord.Licenses_Consumed__c= (licenseObjPastRecord.Licenses_Consumed__c>0)?licenseObjPastRecord.Licenses_Consumed__c-1:0;//AB<20210318>6// Decrement the licenses consumed 
                    licenseObjRecordsToUpdate.add(licenseObjPastRecord); //Add record to list of records to be updated.                    
                }  
            }
            
            if(Schema.sObjectType.Licenses__c.isUpdateable()){ //If object is updatable
                update licenseObjRecordsToUpdate; //Update the license records
            }            
        }        
    }
    
    //Future method to avoid mixed dml operation error for setup object user and non setup object licences is not allowed to perform DML/SOQL operations
    //Call out is set to true because method will call send mail once the record is updated or no licence record is found.
    //Fetch the permission set license Assign record of user and fetch the license record  and increase the licenses consumed.
    @future(callout=true)
    private static void fetchAndIncreasePermissionSetLicense(string userObjCurrentProcuringBusiness, string userObjName, string userObjId){
        boolean isMailSend = false;
        
        Licenses__c[] licenseObjRecords = null;
        Licenses__c[] licenseObjRecordsToUpdate = new Licenses__c[]{};
            
            //Fetch permission set licence assignment for current user.
            PermissionSetLicenseAssign[] pslaObjRecords =  [SELECT AssigneeId,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,PermissionSetLicenseId,PermissionSetLicense.MasterLabel,SystemModstamp FROM PermissionSetLicenseAssign WHERE AssigneeId =: userObjId  LIMIT 100];
        
        if(pslaObjRecords!=null && pslaObjRecords.size()>0){  //If permission set licence record found          
            string[] pslaObjRecordsName = new string[]{};
                string[] pslaObjRecordsNameNotFound = new string[]{};
                    
                    for(PermissionSetLicenseAssign pslaObjRecord:pslaObjRecords){
                        pslaObjRecordsName.add(pslaObjRecord.PermissionSetLicense.MasterLabel); //Then for each permission set license assign record add the name of permission set license to list.
                    }
            //Fetch licences record for current procuring business and where the licence name is permission set licence assign name in the list of records and also where the remaining licence is greater than zero.
            licenseObjRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjCurrentProcuringBusiness AND Available_Licenses_Name__c IN :pslaObjRecordsName AND fRemaining_Licenses__c>0    ORDER BY Id DESC NULLS LAST limit 1];
            
            if(licenseObjRecords!=null && licenseObjRecords.size()>0){  //If licences are found then for each licence increment the current.                  
                for(Licenses__c licenseObjCurrentRecord: licenseObjRecords){ // For each license record found
                    licenseObjCurrentRecord.Licenses_Consumed__c += 1; //Increment the license consumed
                    licenseObjRecordsToUpdate.add(licenseObjCurrentRecord); //Add to license to be updated list                    
                    isMailSend = ((licenseObjCurrentRecord.Number_of_licenses_procured__c-licenseObjCurrentRecord.Licenses_Consumed__c)<=licenseObjCurrentRecord.Threshold_Limit__c)?sendThresholdEmail(licenseObjCurrentRecord):false; //Send mail to threshold email list if threshold 
                    pslaObjRecordsName.remove(pslaObjRecordsName.indexof(licenseObjCurrentRecord.Available_Licenses_Name__c));//Remove the record from Permission Set License Assign List
                }
                isMailSend = (pslaObjRecordsName.size()>0)?sendLicenseNotFoundMail(string.join(pslaObjRecordsName,', '),userObjCurrentProcuringBusiness,userObjName,userObjId):false; //If records are there in PSLA list that means that licenses not found, if so send mail to functionality admins
            }else{                    
                isMailSend = sendLicenseNotFoundMail(string.join(pslaObjRecordsName,', '),userObjCurrentProcuringBusiness,userObjName,userObjId); //No records found for PSLA, send mail to functionality admins.
            }
            
            if(Schema.sObjectType.Licenses__c.isUpdateable()){ //If the licence record is updatable then update the licence record List. 
                update licenseObjRecordsToUpdate;
            }
        }
    }
    
    //Future method to avoid mixed dml operation error for setup object user and non setup object licences is not allowed to perform DML/SOQL operations
    //Call out is set to true because method will call send mail once the record is updated or no licence record is found.
    //Fetch the permission set license Assign record of user and fetch the license record  and decrease the licenses consumed.
    @future
    private static void fetchAndDecreasePermissionSetLicense(string userObjProcuringBusiness, string userObjId){
        Licenses__c[] licenseObjRecords = null;
        Licenses__c[] licenseObjRecordsToUpdate = new Licenses__c[]{};
            //Fetch permission set license assign records for current user
            PermissionSetLicenseAssign[] pslaObjRecords =  [SELECT AssigneeId,CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,LastModifiedDate,PermissionSetLicenseId,PermissionSetLicense.MasterLabel,SystemModstamp FROM PermissionSetLicenseAssign WHERE AssigneeId =: userObjId    LIMIT 100];
        
        if(pslaObjRecords!=null && pslaObjRecords.size()>0){ //Permission set licence assign record found for current user
            string[] pslaObjRecordsName = new string[]{}; 
                
                for(PermissionSetLicenseAssign pslaObjRecord:pslaObjRecords){ //For each PSLA record add to list
                    pslaObjRecordsName.add(pslaObjRecord.PermissionSetLicense.MasterLabel);
                }
            //Fetch licence record for current user where licence procuring business if the current business and available licence name is from the map and remaining licence is greater than zero.
            licenseObjRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjProcuringBusiness AND Available_Licenses_Name__c IN :pslaObjRecordsName ORDER BY Id DESC NULLS LAST limit 1];
            
            if(licenseObjRecords!=null && licenseObjRecords.size()>0){//If licence record found then decrement the licence consumed for each record.
                for(Licenses__c licenseObjRecord:licenseObjRecords){
                    licenseObjRecord.Licenses_Consumed__c= (licenseObjRecord.Licenses_Consumed__c>0)?(licenseObjRecord.Licenses_Consumed__c-1):0;//AB<20210318>6// Decrement the licenses consumed
                    licenseObjRecordsToUpdate.add(licenseObjRecord);
                }
                
                if(Schema.sObjectType.Licenses__c.isUpdateable()){//If the licence record is updatable then update the licence record list.
                    update licenseObjRecordsToUpdate;   
                }
            }
        }
    }
    
    
    //Future method to avoid mixed dml operation error for setup object user and non setup object licences is not allowed to perform DML/SOQL operations
    //Call out is set to true because method will call send mail once the record is updated or no licence record is found.
    //Fetch the user license record of user and fetch the license record  and increase the licenses consumed.
    @future(callout=true)
    private static void fetchAndIncreaseLicenseRecord(string userObjCurrentProcuringBusiness, string userObjName, string userObjId, string userObjCurrentLicenseType){
        boolean isMailSend = false;
        
        string mappedLicenseTypeCurrent = (userObjCurrentLicenseType == 'Salesforce')?'Service Cloud':userObjCurrentLicenseType; //Assign current license type in map as service cloud because the picklist value in licence record is service cloud and not salesforce.
        
        Licenses__c[] licenseObjRecords = null;
        Licenses__c licenseObjCurrentRecord = null;
        //Fetch licence record for current user for where licence procuring business in the current business and available licence name is from the map the licence and remaining licence is greater than zero.
        licenseObjRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjCurrentProcuringBusiness AND Available_Licenses_Name__c=:mappedLicenseTypeCurrent AND fRemaining_Licenses__c>0    ORDER BY Id DESC NULLS LAST limit 1];
        
        if(licenseObjRecords!=null && licenseObjRecords.size()>0){ //If licence record found then increment the licence consumed for the current record.
            licenseObjCurrentRecord = licenseObjRecords[0];
            licenseObjCurrentRecord.Licenses_Consumed__c += 1;
            update licenseObjCurrentRecord;
            
            //Send Threshold Email if licenses remaining are less then threshold
            isMailSend = ((licenseObjCurrentRecord.Number_of_licenses_procured__c-licenseObjCurrentRecord.Licenses_Consumed__c)<=licenseObjCurrentRecord.Threshold_Limit__c)?sendThresholdEmail(licenseObjCurrentRecord):false;
        }else{                    
            isMailSend = sendLicenseNotFoundMail(mappedLicenseTypeCurrent,userObjCurrentProcuringBusiness,userObjName,userObjId); //Licenses records not found then send mail to functionality admin //<AB20210408>
        }
    }
    
    //Future method to avoid mixed dml operation error for setup object user and non setup object licences is not allowed to perform DML/SOQL operations
    //Fetch the user license record of user and fetch the license record  and decrease the licenses consumed.    
    @future
    private static void fetchAndDecreaseLicenseRecord(string userObjProcuringBusiness, string userObjLicenseType){
        string mappedLicenseType = (userObjLicenseType == 'Salesforce')?'Service Cloud':userObjLicenseType; // Map between Licenses record License name and user object user license name
        
        Licenses__c[] licenseObjRecords = null;
        Licenses__c licenseObjRecord = null;
        
        //Fetch licenses for procuring business and license type where remaining licenses are greater then 0.
        licenseObjRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjProcuringBusiness AND Available_Licenses_Name__c=:mappedLicenseType    ORDER BY Id DESC NULLS LAST limit 1];
        
        if(licenseObjRecords!=null && licenseObjRecords.size()>0){ //If records found then decrement the licenses consumed     
            licenseObjRecord = licenseObjRecords[0];
            licenseObjRecord.Licenses_Consumed__c= (licenseObjRecord.Licenses_Consumed__c>0)?licenseObjRecord.Licenses_Consumed__c-1:0;//AB<20210318>6// Decrement the licenses consumed
            
            
            if(Schema.sObjectType.Licenses__c.isUpdateable()){ //If Licenses are udpatable.
                update licenseObjRecord;    
            }
        }        
    }
    
    //Future method to avoid mixed dml operation error for setup object user and non setup object licences is not allowed to perform DML/SOQL operations
    //Call out is set to true because method will call send mail once the record is updated or no licence record is found.
    //Fetch the user record of user and fetch the license record  and increase current licenses and decrease the past licenses consumed
    @future(callout=true)
    private static void fetchAndUpdateLicenseRecord(string userObjCurrentProcuringBusiness, string userObjPastProcuringBusiness, string userObjName, string userObjId, string userObjCurrentLicenseType, string userObjPastLicenseType){
        boolean isMailSend = false;
        
        string mappedLicenseTypeCurrent = (userObjCurrentLicenseType == 'Salesforce')?'Service Cloud':userObjCurrentLicenseType; // Map between Licenses record License name and user object user license name
        string mappedLicenseTypePast = (userObjPastLicenseType == 'Salesforce')?'Service Cloud':userObjPastLicenseType; // Map between Licenses record License name and user object user previous license name
        
        Licenses__c[] licenseObjRecords = null;
        Licenses__c licenseObjCurrentRecord = null;
        Licenses__c licenseObjPastRecord = null;
        Licenses__c[] licenseObjPastRecords = null;
        
        //Fetch license record based on current procuring business and current license type and remaining licenses are greater than 0
        licenseObjRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjCurrentProcuringBusiness AND Available_Licenses_Name__c=:mappedLicenseTypeCurrent AND fRemaining_Licenses__c>0    ORDER BY Id DESC NULLS LAST limit 1];
        if(licenseObjRecords!=null && licenseObjRecords.size()>0){
            licenseObjCurrentRecord = licenseObjRecords[0];
            licenseObjCurrentRecord.Licenses_Consumed__c += 1;
            if(Schema.sObjectType.Licenses__c.isUpdateable()){
                update licenseObjCurrentRecord;
            }
            
            isMailSend = ((licenseObjCurrentRecord.Number_of_licenses_procured__c - licenseObjCurrentRecord.Licenses_Consumed__c)<=licenseObjCurrentRecord.Threshold_Limit__c)?sendThresholdEmail(licenseObjCurrentRecord):false; //Send mails to threshold admins if threshold limit is reached for remaining licenses
        }else{                    
            isMailSend = sendLicenseNotFoundMail(mappedLicenseTypeCurrent,userObjCurrentProcuringBusiness,userObjName,userObjId); //Send mail to functionality admin if licenses records not found to assign user//<AB20210408>
        }
        
        if(userObjPastProcuringBusiness!=null){//If previous procuring business of user is available.
            //fetch user past licenses
            licenseObjPastRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c where procuring_business__c=: userObjPastProcuringBusiness AND Available_Licenses_Name__c=:mappedLicenseTypePast    ORDER BY Id DESC NULLS LAST limit 1];
            if(licenseObjPastRecords!=null && licenseObjPastRecords.size()>0){//If previous license record found then decrement the licenses consumed for previous procuring business
                licenseObjPastRecord = licenseObjPastRecords[0];
                licenseObjPastRecord.Licenses_Consumed__c= (licenseObjPastRecord.Licenses_Consumed__c>0)?licenseObjPastRecord.Licenses_Consumed__c-1:0;//AB<20210318>6// Decrement the licenses consumed
                
                if(Schema.sObjectType.Licenses__c.isUpdateable()){ //If licenses are udpatable then update the licenses
                    update licenseObjPastRecord;
                }
            }
        }
    }
    
    
    //<AB20210408> Start
    private static boolean isLicenseTracked(String strLicenseName){
        Licenses_Tracked_For_mailing__mdt [] licensesTracked = [SELECT MasterLabel,License_Catagories__c FROM Licenses_Tracked_For_mailing__mdt];
        
        String[] strLicensesNamesLst = new String[] {};
            for(Licenses_Tracked_For_mailing__mdt licenseTracked: licensesTracked){
                strLicensesNamesLst.add(licenseTracked.MasterLabel);
            }
        
        return strLicensesNamesLst.contains(strLicenseName);
    }
    //<AB20210408> End//////    
    
    //Send Mail when the matching license is not found
    private static boolean sendLicenseNotFoundMail(string userObjLicenseType,string userObjProcuringBusiness, string userObjName, string userObjId){
        //<AB20210408> Start
        if(!isLicenseTracked(userObjLicenseType)){
            return false;
        }
        //<AB20210408> End////// 
        String strSubject = 'License Information PA Org: '+userObjLicenseType+', License Record Not Found For '+userObjProcuringBusiness+', business'; //AB<20210305>2
        String strBody = 'Hi Admin(s),<br>&nbsp;&nbsp;&nbsp;This is to inform you that Licenses Record Not Found for <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Business: <b>'
            +userObjProcuringBusiness+'</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. User License Type : <b>'
            +userObjLicenseType+'</b><br><br> Either, record is not available or all licenses are consumed.<br> License Allocation request was raised for user: '
            +userObjName+' ('
            +userObjId+').<br> Please procure more licenses to assign. <br><br>PS: User is not deactivated.<br><br>Regards,<br>License Manager';
        String strFrom = 'License Manager (Salesforce)';
        isProductionOrg = isProduction();//AB<20210305>
        isRunningTest = Test.isRunningTest();//AB<20210305>
        String []strTo = (isProductionOrg && !isRunningTest)?adminEmailAddresses:testMailArray;//AB<20210305>
        return sendMail(strFrom,strTo,strSubject,strBody);//AB<20210305>          
    }
    
    //Send Mail to Threshold Email List when the License Limit is reached to threshold
    private static boolean sendThresholdEmail(Licenses__c licenseObjCurrentRecord){
        //<AB20210408> Start
        if(!isLicenseTracked(licenseObjCurrentRecord.Available_Licenses_Name__c)){
            return false;
        }
        //<AB20210408> End////// 
        isProductionOrg = isProduction();//AB<20210305>
        isRunningTest = Test.isRunningTest();//AB<20210305>
        String[] strLstToAddresses =  (isProductionOrg && !isRunningTest)?licenseObjCurrentRecord.Threshold_Email_Notifications__c.split(','):testMailArray; //AB<20210305>
        String strSubject = 'License Below Threshold PA Org:  '+licenseObjCurrentRecord.Name+' Licenses Below Threshold'; //AB<20210305>2
        String strBody = 'Hi,<br>&nbsp;&nbsp;&nbsp;This is to inform you that Licenses for <b>'
            +licenseObjCurrentRecord.Name+'</b>, are below threshold limit of '
            +licenseObjCurrentRecord.Threshold_Limit__c+' Licenses. Please find the details below -   <br><br><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; License Record : </b>'
            +licenseObjCurrentRecord.Name+'<br><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; License Type : </b>'
            +licenseObjCurrentRecord.Available_Licenses_Name__c+'<br><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Procuring Business : </b>'
            +licenseObjCurrentRecord.Procuring_Business__c+'<br><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Threshold Limit : </b>'
            +licenseObjCurrentRecord.Threshold_Limit__c+'<br><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total Licenses Procured : </b>' 
            +licenseObjCurrentRecord.Number_of_licenses_procured__c+'<br><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Licenses Consumed : </b>'
            +licenseObjCurrentRecord.Licenses_Consumed__c+'<br><b style="color:Red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Remaining Licenses Available : </b> '
            +(licenseObjCurrentRecord.Number_of_licenses_procured__c - licenseObjCurrentRecord.Licenses_Consumed__c)+'<br><br>  Regards, <br>License Manager '; //AB<20210305>3 //AB<20210305>4 //AB<20210305>5
        String strFrom = 'License Manager (Salesforce)';
        return sendMail(strFrom, strLstToAddresses,strSubject,strBody);       
    }
    
    //Send Mail Method called from sendThresholdEmail & sendLicenseNotFoundMail
    private static boolean sendMail(string strFrom, string[] strTos, string strSubject, string strBody){
        
        try {
            Messaging.reserveSingleEmailCapacity(1);
            Messaging.reserveMassEmailCapacity(1);
        } catch (System.NoAccessException e) {
            System.debug(LoggingLevel.ERROR, e.getStackTraceString());
            return false;
        }
        
        
        
        try{
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            mail.setToAddresses(strTos);
            mail.setSenderDisplayName(strFrom);
            mail.setSubject(strSubject);
            mail.setHtmlBody(strBody);            
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
            return true;
        }catch(Exception e){
            System.debug(LoggingLevel.ERROR, e.getStackTraceString());
            return false;
        }
    }
    
    /// Is Current instance production?//AB<20210305>
    public static boolean isProduction() {        
        Organization currOrg = [select id, name, isSandbox, instanceName from Organization limit 1];
        boolean isProd = false;
        if (currOrg != null && currOrg.isSandbox != null) 
            isProd = !currOrg.isSandbox;
        return isProd;
    }
}