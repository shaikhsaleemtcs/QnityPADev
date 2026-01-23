/******************************************************************************* 
Copyright © 2021 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  Batch Class for updating License Records based on user changes

Change Log
//AB<20210305> - To not send mail to original list if the org is not production or if it is test run.
//AB<20210305>1 - To not send mail when no records are found. Don't send empty mail.
//AB<20210305>2 - To attach Org Name in Mail Subject
//AB<20210408>  - Updated to track only the Licenses tracked via Custom Metadata Type
********************************************************************************/

global class batchUpdateLicenseOnUserChanges implements Database.Batchable<sObject>,Database.Stateful  {
    private static final integer MAXROWS = Limits.getLimitQueryRows(); //Governor limit to limit query from fetching allowed number of rows
    public Map<string,integer> mapLicenseCount; //Map to maintain procuring business, license type and associated licenses consumed
    public Map<string,integer> mapUnAssignedUsersCount; //Map to maintain procuring business, license type and associated licenses consumed which are not assigned to licenses record
    public static String[] adminEmailAddresses = Label.License_Tracking_Admin_Email_List.split(',');//Custom Label providing functionality admin list when licenses are not found or not available. 
    public static String strFrom = 'License Manager (Salesforce)'; //Name from which the mails will be send to functionality admins or threshold email list.
    public static boolean isProductionOrg = false;//AB<20210305>
    public static boolean isRunningTest = false;//AB<20210305>
    public static String[] testMailArray= new String[]{'test@SpecPA.test','test123@specpa.test','abhinav.bhatnagar@dupont.com'};//AB<20210305>
   
    //Default constructor to initialize the maps
    public batchUpdateLicenseOnUserChanges(){
        mapLicenseCount = new Map<string, integer>();
        mapUnAssignedUsersCount = new Map<string, integer>();        
    }
    
    //Entry method of batch
    global Database.QueryLocator start(Database.BatchableContext bc) {
        try{ 
            isProductionOrg = isProduction();//AB<20210305>
            isRunningTest = Test.isRunningTest();//AB<20210305>
            
            if(!Test.isRunningTest()){ //Fetch all users with procuring business available (Active status is not considered because the we have to unassign the licenses from the users deactivated)         
                return Database.getQueryLocator([SELECT FirstName,Id,IsActive,LastName,Name,ProfileId,Profile.UserLicense.Name,Username,UserType,Procuring_Business__c FROM User where isActive=true AND Procuring_Business__c!='' LIMIT :MAXROWS]);        
            }else{ //Fetch all test users with limited number
                return Database.getQueryLocator([SELECT FirstName,Id,IsActive,LastName,Name,ProfileId,Profile.UserLicense.Name,Username,UserType,Procuring_Business__c FROM User where isActive=true AND Procuring_Business__c!='' LIMIT 50]);        
            }
        }catch(Exception e){
            system.debug(e.getStackTraceString());
            return null;
        }
    }
    
    //Method to calculate the licenses for each user fetched in start method
    global void execute(Database.BatchableContext bc, List<User> userRecords) {
        try{
            calculateLicensesCount(userRecords);
        }catch(Exception e){
            system.debug(e.getStackTraceString());            
        }
    }
    
    //Exist method of batch
    global void finish(Database.BatchableContext bc) {
        try{
            updateLicenses();//Method to update licenses when licenses are calculated
            if(mapUnAssignedUsersCount.size()>0){ //if batch is not able to assign users to licenses
                sendRecordNotFoundMail(); //Send mail to functionality admins
            }                   
        }catch(Exception e){
            system.debug(e.getStackTraceString());            
        }
    }
    
    //Method to update licenses once calculated
    private void updateLicenses(){
        Licenses__c [] licensesToUpdate = new Licenses__c[]{};
            
            for(string licenseProcuringBusinessKey: mapLicenseCount.keySet()){//For each License in Map
                string licenseName =  licenseProcuringBusinessKey.split(':::')[0]; //Get current license name
                string procuringBusiness =  licenseProcuringBusinessKey.split(':::')[1]; //Get current procuring business
                //Fetch license record for current license name and current procuring business
                Licenses__c[] licenseRecords = [select id,Licenses_Consumed__c,Number_of_licenses_procured__c from Licenses__c where Available_Licenses_Name__c=:licenseName AND Procuring_Business__c=:procuringBusiness ORDER BY CreatedDate DESC LIMIT 1];
                if(licenseRecords!=null && licenseRecords.size()>0){ //If licenses found
                    if(licenseRecords[0].Number_of_licenses_procured__c>=mapLicenseCount.get(licenseProcuringBusinessKey)){ // And licenses available is greater than licenses required
                        licenseRecords[0].Licenses_Consumed__c = mapLicenseCount.get(licenseProcuringBusinessKey); //Assign required licenses to consumed licenses
                        licensesToUpdate.add(licenseRecords[0]); 
                    }else{ //Required licenses are greater than licenses available
                        licenseRecords[0].Licenses_Consumed__c = licenseRecords[0].Number_of_licenses_procured__c; //Assign maximum available to licenses consumed
                        licensesToUpdate.add(licenseRecords[0]);
                        mapUnAssignedUsersCount.put(licenseProcuringBusinessKey,(mapLicenseCount.get(licenseProcuringBusinessKey)-licenseRecords[0].Number_of_licenses_procured__c).intValue()); //For remaining unassigned licenses add to unassigned map
                    }
                }else{
                    mapUnAssignedUsersCount.put(licenseProcuringBusinessKey,mapLicenseCount.get(licenseProcuringBusinessKey)); //If licenses are not found altogether then put all required licenses to unassigned map
                }
            }
        
        if(Schema.sObjectType.Licenses__c.isUpdateable()){ //If licenses are udpatable then update the licenses
            update licensesToUpdate;
        }
        
        sendConsolidatedMail(); //Send Consolidated Report in Mail
    }
    
    //Method to calculate licenses consumed
    private void calculateLicensesCount(List<User> userRecords){
        For(User userRecord: userRecords){//For each user record 
            string userLicense = (userRecord.Profile.UserLicense.Name=='Salesforce')?'Service Cloud':userRecord.Profile.UserLicense.Name; //Fetch user license
            string userProcuringBusiness = userRecord.Procuring_Business__c;
            string[] userLicenseAssignments = getUserLicenseAssignments(userRecord.Id);//Fetch permission set license assignments
            
            updateLicenseMap(userLicense+':::'+userProcuringBusiness+':::User License', mapLicenseCount); //Store in license map
            
            For(string userLicenseAssignment:userLicenseAssignments){// For every permission set license assignments
                updateLicenseMap(userLicenseAssignment+':::'+userProcuringBusiness+':::Permission Set License', mapLicenseCount); //Store in license map
            }            
        }
    }
    
    //Method to store and update the licenses consumend for both user licenses and permission set licenses
    private void updateLicenseMap(string licenseKey, Map<string,integer> mapLicenseCountValue){
        if(!mapLicenseCountValue.containsKey(licenseKey)){ //If key/ license and procuring business pair is not in map
            mapLicenseCountValue.put(licenseKey, 1); //create the key and license consumed to 1
        }else{                
            mapLicenseCountValue.put(licenseKey,mapLicenseCountValue.get(licenseKey)+ 1); // Increment the license consumed by 1
        }
    }
    
    //Method to fetch all name of permission set licenses for user in string array
    private string[] getUserLicenseAssignments(string userId){
        PermissionSetLicenseAssign [] pslaRecords = [SELECT AssigneeId,PermissionSetLicenseId,PermissionSetLicense.MasterLabel FROM PermissionSetLicenseAssign WHERE AssigneeId =: userId ];
        
        string []pslaRecordsName = new string[]{};
            for(PermissionSetLicenseAssign pslaRecord: pslaRecords){//For each record
                pslaRecordsName.add(pslaRecord.PermissionSetLicense.MasterLabel); //Fetch Permission Set License Name and add to String Array
            }
        return pslaRecordsName;        
    }
    
    //Method to send Mail to Functionality Admins if License record not found
    private void sendRecordNotFoundMail(){
        try{
            if(mapUnAssignedUsersCount.size()<=0){
                return;
            }//AB<20210305>1
            
            //<AB20210408> Start
            boolean isMailEmpty = True;
            Licenses_Tracked_For_mailing__mdt [] licensesTracked = [SELECT MasterLabel,License_Catagories__c FROM Licenses_Tracked_For_mailing__mdt];
            
            String[] strLicensesNamesLst = new String[] {};
                for(Licenses_Tracked_For_mailing__mdt licenseTracked: licensesTracked){
                    strLicensesNamesLst.add(licenseTracked.MasterLabel);
                }
            //<AB20210408> End////// 
            
            string recordNotFoundDetails ='<table style="border:1px solid black;text-align:center" cellspacing="1" cellpadding="1"><tr style="border:0px solid black;text-align:center"><th style="border:0px solid black;text-align:center">Sr.No.</th><th style="border:0px solid black;text-align:center">License Name</th><th style="border:0px solid black;text-align:center">Business</th><th style="border:0px solid black;text-align:center">Type</th><th style="border:0px solid black;text-align:center"># Unassignable Licenses</th></tr>';
            integer srno = 1;
            for(string keyValue:mapUnAssignedUsersCount.keySet()){
                string licName = keyValue.split(':::')[0];
                string procBusiness = keyValue.split(':::')[1];
                string licType = keyValue.split(':::')[2];
                //<AB20210408> Start
                if(strLicensesNamesLst.contains(licName)){
                    recordNotFoundDetails += '<tr>'+'<td><b>'+srno+'</b></td>'+'<td>'+licName+'</td>'+'<td>'+procBusiness+'</td>'+'<td>'+licType+'</td>'+'<td>'+mapUnAssignedUsersCount.get(keyValue)+'</td>'+'</tr>';
                    srno+=1;
                    isMailEmpty = False;
                }
            }
            
            If(isMailEmpty){
                return;
            }
            //<AB20210408> End//////
            
            recordNotFoundDetails+='</table>';
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            isProductionOrg = isProduction();//AB<20210305>
        	isRunningTest = Test.isRunningTest();//AB<20210305>
            mail.setToAddresses((isProductionOrg && !isRunningTest)?adminEmailAddresses:testMailArray);//AB<20210305>
            mail.setSenderDisplayName(strFrom);
            mail.setSubject('Batch License Summary PA Org: Not Able to Assign Licenses'); //AB<20210305>2
            mail.setHtmlBody('Hi Admin(s),<br><br>While executing the batch, we are not able to find licenses for following -'+recordNotFoundDetails+'<br> Regards,<br>License Manager Salesforce');            
            
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }catch(Exception e){
            System.debug(LoggingLevel.ERROR, e.getStackTraceString());
        }
    }
    
    //Send final consolidated mail of threshold to funtionality admins
    private void sendConsolidatedMail(){
        
        boolean canSendMail = False;
        boolean isRecordEmpty = True;//AB<20210305>1

        try {
                Messaging.reserveSingleEmailCapacity(1);
                Messaging.reserveMassEmailCapacity(1);
                canSendMail = True;
            } catch (System.NoAccessException e) {
                System.debug(LoggingLevel.ERROR, e.getStackTraceString());
            }
        
        if(canSendMail){
                try{
                
                Licenses__c[] licensesThresholdLimitReached = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c ORDER BY Id DESC NULLS LAST];
                    if(licensesThresholdLimitReached.size()<=0){
                        return;
                    }//AB<20210305>1
                    
                string recordTable = '<table style="border:1px solid black;text-align:center" cellspacing="1" cellpadding="1"><tr><th>Sr.No.</th><th>Id</th><th>Name</th><th>Business</th><th>License Type</th><th>License Name</th><th>Total Licenses</th><th># Consumed</th><th># Remaining</th><th>Threshold</th></tr>';
                integer srno = 1;
                
                //<AB20210408> Start
                
                Licenses_Tracked_For_mailing__mdt [] licensesTracked = [SELECT MasterLabel,License_Catagories__c FROM Licenses_Tracked_For_mailing__mdt];
                
                String[] strLicensesNamesLst = new String[] {};
                    for(Licenses_Tracked_For_mailing__mdt licenseTracked: licensesTracked){
                        strLicensesNamesLst.add(licenseTracked.MasterLabel);
                    }
                //<AB20210408> End////// 
                
                
                For(Licenses__c licenseRecord : licensesThresholdLimitReached){
                    if(licenseRecord.fRemaining_Licenses__c <= licenseRecord.Threshold_Limit__c && strLicensesNamesLst.contains(licenseRecord.Available_Licenses_Name__c)){//<AB20210408>
                        recordTable +='<tr>'+'<td><b>'+srno+'</b></td>'+'<td>'+licenseRecord.id+'</td>'+'<td>'+licenseRecord.Name+'</td>'+'<td>'+licenseRecord.Procuring_Business__c+'</td>'+'<td>'+licenseRecord.License_Catagories__c+'</td>'+'<td>'+licenseRecord.Available_Licenses_Name__c+'</td>'+'<td>'+licenseRecord.Number_of_licenses_procured__c+'</td>'+'<td>'+licenseRecord.Licenses_Consumed__c+'</td>'+'<td>'+licenseRecord.fRemaining_Licenses__c+'</td>'+'<td>'+licenseRecord.Threshold_Limit__c+'</td>'+'</tr>';
                        srno+=1;
                        isRecordEmpty = false;//AB<20210305>1

                    }
                }
                recordTable+='</table>';
                if(isRecordEmpty){//AB<20210305>1
                     return;//AB<20210305>1
                }//AB<20210305>1
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                isProductionOrg = isProduction();//AB<20210305>
        		isRunningTest = Test.isRunningTest();//AB<20210305>
                mail.setToAddresses((isProductionOrg && !isRunningTest)?adminEmailAddresses:testMailArray);//AB<20210305>
                mail.setSenderDisplayName(strFrom);
                mail.setSubject('Batch License Summary PA Org: Licenses On/Below Threshold Limit'); //AB<20210305>2
                mail.setHtmlBody('Hi Admin(s),<br>While executing batch, we found out that following licenses are consumed are on or more than threshold limit. Here is the consolidated list.<br>'+recordTable+'<br> Regards,<br>License Manager Salesforce');            
                
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }catch(Exception e){
                System.debug(LoggingLevel.ERROR, e.getStackTraceString());
            }        
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