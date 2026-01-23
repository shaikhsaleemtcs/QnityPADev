/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  This test class to test functionality of updating the licenses consumed for license object record when user record is updated. This class test, trigUser, UserHandler, batchUpdateLicenseOnUserChanges & ctrlUpdateLicensesOnUserChange

//<AB03182021> Resolved batch execution issue
********************************************************************************/
@isTest
public class ctrlUpdateLicensesOnUserChange_UT {//Test Class to verify the test conditions and coverage
    public static testMethod void LoadData() { //Entry Method
        Licenses__c[] licensesRecords = createLicensesRecords(); //Method to create Test Licenses
        createLicenseProcurement(licensesRecords); //Method to create and link Test License procurement record to Licenses
        
        createUpdateUserRecord(); //Create and update User record to test trigger for User, User Handler and controller
        
    }
    
    //Method to create Test Licenses
    private static Licenses__c[] createLicensesRecords(){
        Licenses__c[] licensesRecords = new Licenses__c[]{};

		//Test Licenses, this procuring business and license name will be different for each org like E&I, T&I, S&C Water, S&C Shelter, S&C Safety. This is dependent of type of license procured by business and global picklist enabled values in org         
        Licenses__c licensesRecord1 = new Licenses__c(Available_Licenses_Name__c='Service Cloud',License_Catagories__c='User Licenses',Name='S&C Water UL Service Cloud Licenses Jan 2021',Procuring_Business__c='S&C Water',Threshold_Email_Notifications__c='test@test.com.invalid',Threshold_Limit__c=1);
        Licenses__c licensesRecord2 = new Licenses__c(Available_Licenses_Name__c='CRM User',License_Catagories__c='Permission Set Licenses',Name='S&C Safety PSL CRM User Licenses Jan 2021',Procuring_Business__c='S&C Safety',Threshold_Email_Notifications__c='test@test.com.invalid',Threshold_Limit__c=4);
        Licenses__c licensesRecord3 = new Licenses__c(Available_Licenses_Name__c='CRM User',License_Catagories__c='Permission Set Licenses',Name='S&C Shelter PSL CRM User Licenses Jan 2021',Procuring_Business__c='S&C Shelter',Threshold_Email_Notifications__c='test@test.com.invalid',Threshold_Limit__c=4);
        Licenses__c licensesRecord4 = new Licenses__c(Available_Licenses_Name__c='Service Cloud',License_Catagories__c='User Licenses',Name='S&C Safety UL Service Cloud Licenses Jan 2021',Procuring_Business__c='S&C Safety',Threshold_Email_Notifications__c='test@test.com.invalid',Threshold_Limit__c=4);
        Licenses__c licensesRecord5 = new Licenses__c(Available_Licenses_Name__c='CRM User',License_Catagories__c='Permission Set Licenses',Name='S&C Water PSL CRM User Licenses Jan 2021',Procuring_Business__c='S&C Water',Threshold_Email_Notifications__c='test@test.com.invalid',Threshold_Limit__c=4);
        
        
        
        licensesRecords.add(licensesRecord1);
        licensesRecords.add(licensesRecord2);
        licensesRecords.add(licensesRecord3);
        licensesRecords.add(licensesRecord4);
        licensesRecords.add(licensesRecord5);
        
        insert licensesRecords;
        
        return licensesRecords;
    }
    
    //Method to create and link Test License procurement record to Licenses
    private static void createLicenseProcurement(Licenses__c[] licensesRecords){
        License_Procurement__c[] licensesProcurementRecords = new License_Procurement__c[]{};
        
        //Test License Procurement record, procurement name and Available License will be different for each org like E&I, T&I, S&C Water, S&C Shelter, S&C Safety. This is dependent of type of license procured by business and global picklist enabled values in org         
		License_Procurement__c licensesProcurementRecord1 = new License_Procurement__c(Available_Licenses_Name__c='Service Cloud',License_Catagories__c='User Licenses',Name='S&C Water UL Service Cloud Licenses Jan 2021',Procuring_Business__c='S&C Water',Licenses__c=licensesRecords[0].id,Number_of_licenses_procured__c=1,Status__c='Active',Procurement_Date__c=system.today(),License_Expiry_Date__c=system.today());
        License_Procurement__c licensesProcurementRecord2 = new License_Procurement__c(Available_Licenses_Name__c='CRM User',License_Catagories__c='Permission Set Licenses',Name='S&C Safety PSL CRM User Licenses Jan 2021',Procuring_Business__c='S&C Safety',Licenses__c=licensesRecords[1].id,Number_of_licenses_procured__c=5,Status__c='Active',Procurement_Date__c=system.today(),License_Expiry_Date__c=system.today());
        License_Procurement__c licensesProcurementRecord3 = new License_Procurement__c(Available_Licenses_Name__c='CRM User',License_Catagories__c='Permission Set Licenses',Name='S&C Shelter PSL CRM User Licenses Jan 2021',Procuring_Business__c='S&C Shelter',Licenses__c=licensesRecords[2].id,Number_of_licenses_procured__c=5,Status__c='Active',Procurement_Date__c=system.today(),License_Expiry_Date__c=system.today());
        License_Procurement__c licensesProcurementRecord4 = new License_Procurement__c(Available_Licenses_Name__c='Service Cloud',License_Catagories__c='User Licenses',Name='S&C Safety UL Service Cloud Licenses Jan 2021',Procuring_Business__c='S&C Safety',Licenses__c=licensesRecords[3].id,Number_of_licenses_procured__c=5,Status__c='Active',Procurement_Date__c=system.today(),License_Expiry_Date__c=system.today());
        License_Procurement__c licensesProcurementRecord5 = new License_Procurement__c(Available_Licenses_Name__c='CRM User',License_Catagories__c='Permission Set Licenses',Name='S&C Water PSL CRM User Licenses Jan 2021',Procuring_Business__c='S&C Water',Licenses__c=licensesRecords[4].id,Number_of_licenses_procured__c=5,Status__c='Active',Procurement_Date__c=system.today(),License_Expiry_Date__c=system.today());
        
        
        licensesProcurementRecords.add(licensesProcurementRecord1);
        licensesProcurementRecords.add(licensesProcurementRecord2);
        licensesProcurementRecords.add(licensesProcurementRecord3);
        licensesProcurementRecords.add(licensesProcurementRecord4);
        licensesProcurementRecords.add(licensesProcurementRecord5);
        
        insert licensesProcurementRecords;
        
    }
    
    //Method to Create and Udpate User Record for License Testing
    private static void createUpdateUserRecord(){
        Test.startTest();
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()]; //Run the test from current user context
        
        system.runAs(thisUser){
            User userRecord = new User(FirstName = 'Test', Procuring_Business__c = 'S&C Safety', LastName = 'Test User 20211', ProfileId = getProfileId('Standard User'), Alias = 'Test0001', Email = 'testEmail1@salesforce.com.invalid', Username = 'testUserName1@salesforce.com.invalid.devab1', CommunityNickname = 'TestUser1', IsActive = TRUE, EmailEncodingKey = 'UTF-8',  User_Country__c = 'UNITED STATES', User_Region__c = 'Asia Pacific', User_Owning_Org__c = 'M&S-IT', UserOwningSBUOrg__c = 'Corporate', Approving_Business__c = 'Corporate - IT-PA',  TimeZoneSidKey = 'America/New_York', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', CurrencyIsoCode = 'USD', DefaultCurrencyIsoCode = 'USD', ReceivesAdminInfoEmails = FALSE, ReceivesInfoEmails = FALSE);
            insert userRecord;
            
            PermissionSetLicense pslRecord = [Select id from PermissionSetLicense where DeveloperName='CRMUserPsl'];            
            PermissionSetLicenseAssign pslaRecord = new PermissionSetLicenseAssign(AssigneeId=userRecord.id,PermissionSetLicenseId=pslRecord.id);
            insert pslaRecord;
            
            pslRecord = [Select id from PermissionSetLicense where DeveloperName='SalesConsoleUser'];
            pslaRecord = new PermissionSetLicenseAssign(AssigneeId=userRecord.id,PermissionSetLicenseId=pslRecord.id);
            insert pslaRecord;
            
            userRecord.Procuring_Business__c = 'S&C Water';
            update userRecord;
            userRecord.IsActive = FALSE;
            update userRecord;
            
            User userRecord1 = new User(FirstName = 'Test1', Procuring_Business__c = 'S&C Safety', LastName = 'Test User 20212', ProfileId = getProfileId('Standard User'), Alias = 'Test0002', Email = 'testEmail2@salesforce.com.invalid', Username = 'testUserName2@salesforce.com.invalid.devab1', CommunityNickname = 'TestUser2', IsActive = TRUE, EmailEncodingKey = 'UTF-8',  User_Country__c = 'UNITED STATES', User_Region__c = 'Asia Pacific', User_Owning_Org__c = 'S&C', UserOwningSBUOrg__c = 'Corporate', Approving_Business__c = 'Corporate - IT-PA',  TimeZoneSidKey = 'America/New_York', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', CurrencyIsoCode = 'USD', DefaultCurrencyIsoCode = 'USD', ReceivesAdminInfoEmails = FALSE, ReceivesInfoEmails = FALSE);
            insert userRecord1;
            userRecord1.IsActive = FALSE;
            userRecord1.Procuring_Business__c = 'S&C Shelter';
            update userRecord1;
            
            User userRecord2 = new User(FirstName = 'Test2', Procuring_Business__c = 'S&C Safety', LastName = 'Test User 20213', ProfileId = getProfileId('Standard User'), Alias = 'Test0003', Email = 'testEmail3@salesforce.com.invalid', Username = 'testUserName3@salesforce.com.invalid.devab1', CommunityNickname = 'TestUser3', IsActive = TRUE, EmailEncodingKey = 'UTF-8',  User_Country__c = 'UNITED STATES',  User_Region__c = 'Asia Pacific', User_Owning_Org__c = 'S&C', UserOwningSBUOrg__c = 'Corporate', Approving_Business__c = 'Corporate - IT-PA',  TimeZoneSidKey = 'America/New_York', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', CurrencyIsoCode = 'USD', DefaultCurrencyIsoCode = 'USD', ReceivesAdminInfoEmails = FALSE, ReceivesInfoEmails = FALSE);
            insert userRecord2;
            pslaRecord = new PermissionSetLicenseAssign(AssigneeId=userRecord2.id,PermissionSetLicenseId=pslRecord.id);
            insert pslaRecord;
            userRecord2.Procuring_Business__c = 'S&C Shelter';
            update userRecord2;
            userRecord2.IsActive = FALSE;
            update userRecord2;
            userRecord2.IsActive = TRUE;
            update userRecord2;            
            
            User userRecord3 = new User(FirstName = 'Test3', Procuring_Business__c = 'S&C Water', LastName = 'Test User 20213', ProfileId = getProfileId('Standard User'), Alias = 'Test0004', Email = 'testEmail4@salesforce.com.invalid', Username = 'testUserName4@salesforce.com.invalid.devab1', CommunityNickname = 'TestUser4', IsActive = TRUE, EmailEncodingKey = 'UTF-8',  User_Country__c = 'UNITED STATES',  User_Region__c = 'Asia Pacific', User_Owning_Org__c = 'S&C', UserOwningSBUOrg__c = 'Corporate', Approving_Business__c = 'Corporate - IT-PA', TimeZoneSidKey = 'America/New_York', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', CurrencyIsoCode = 'USD', DefaultCurrencyIsoCode = 'USD', ReceivesAdminInfoEmails = FALSE, ReceivesInfoEmails = FALSE);
            insert userRecord3;
            userRecord.IsActive = TRUE;
            update userRecord;
            
            batchUpdateLicenseOnUserChanges obj = new batchUpdateLicenseOnUserChanges();
            DataBase.executeBatch(obj); 
            Test.stopTest(); //<AB03182021>
            Licenses__c[] licensesUpdatedRecords = [Select Available_Licenses_Name__c,CreatedById,CreatedDate,fRemaining_Licenses__c,Id,IsDeleted,Licenses_Consumed__c,License_Catagories__c,License_Number__c,Name,Number_of_licenses_procured__c,OwnerId,Procuring_Business__c,SystemModstamp,Threshold_Email_Notifications__c,Threshold_Limit__c FROM Licenses__c ORDER BY Id DESC NULLS LAST limit 1];
            for(Licenses__c licensesRecord:licensesUpdatedRecords){
                if(licensesRecord.Procuring_Business__c=='S&C Water' && licensesRecord.Available_Licenses_Name__c=='Service Cloud'){
                    System.assertEquals(0, licensesRecord.fRemaining_Licenses__c);// No Licenses should remain from total 2 procured licenses as both are assigned to userRecord and userRecord3 as both are active
                }else if(licensesRecord.Procuring_Business__c=='S&C Safety' && licensesRecord.Available_Licenses_Name__c=='Service Cloud'){
                    System.assertEquals(5, licensesRecord.fRemaining_Licenses__c); // All 5 licenses are free as earlier assigned procuring business is changed
                }else if(licensesRecord.Procuring_Business__c=='S&C Shelter' && licensesRecord.Available_Licenses_Name__c=='Service Cloud'){
                    System.assertEquals(4, licensesRecord.fRemaining_Licenses__c); //Only 1 license is assigned to UserRecord2
                }
            }
            
            
            String scheduledOn = '0 0 2 * * ?';
            system.schedule('Test License Schedule', scheduledOn, new schedUpdateLicenseOnUserChanges()); 
        }
    }
    
    //Method to fetch profile Id based on name
    private static Id getProfileId(string profileName){
        return [Select id from Profile where name =: profileName LIMIT 1].Id;
    }
    
}