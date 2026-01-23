@IsTest
private class ExporterCSV_UT
{

    static testMethod void ExporterCSVTest(){
        System.Schedulable schedulable;
        SchedulableContext sc;
        ExporterCSV exporterCSV=new ExporterCSV();


        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        User u = new User(Alias = 'nagend', Email='nagendra@testorg.com',
                EmailEncodingKey='UTF-8', LastName='Babu', LanguageLocaleKey='en_US',
                LocaleSidKey='en_US', ProfileId = p.Id,
                TimeZoneSidKey='America/Los_Angeles', UserName='nagendra@testorg.com');

        System.runAs(u){
            Customer_Data_Request__c testCust = new Customer_Data_Request__c();
            Id custDataRecId = [Select Id, Name from RecordType where DeveloperName = 'New_Customer_Creation' limit 1].Id;
            testCust.Request_Description__c='Test Record';
            testCust.Request_Status__c = 'Closed';
            testCust.Requestor_Name__c = UserInfo.getUserId();
            testCust.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            testCust.SF_Region__c ='Asia Pacific';
            testCust.Company_Code__c = '9999-Dummy China Value';
            testCust.Group_Key__c ='6000000';
            testCust.Distribution_Channel__c = '10-Dupont Std';
            testCust.Account_Group__c='Z001(Sold-to Party)';
            testCust.Division__c = '01-Product Division 01';
            testCust.Customer_Name__c='Test Customer';
            testCust.Sold_to_Street__c='Walters Street';
            testCust.Sold_to_City__c='New Jersey';
            testCust.Sold_to_Country__c='US';
            testCust.Sold_to_e_mail__c='sam@gmail.com';
            testCust.RecordTypeId = custDataRecId ;
            testCust.Customer_Contact_Name__c='Test1';
            testCust.Customer_Contact_Telephone__c='123232323';
            testCust.Proposed_Terms_of_Payment__c='15 PROX';
            testCust.Proposed_Credit_Limit__c='100';
            testCust.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            testCust.Default_Incoterms_2__c='Test Term';
            testCust.Estimated_Average_Monthly_Purchases__c=100;
            testCust.Estimated_Number_of_Orders_per_Month__c=20;
            //       testCust.Registration_number__c='458889';
            testCust.Sold_To_Office_House_Number__c = '124';
            testCust.Sold_to_State_Province__c ='Michigun';
            testCust.Record_Locked__c=false;
            testCust.Relevant_for_POD__c=false;
            testCust.Clerk_AP_contact_email__c='test@requestor.com';
            testCust.Clerk_AP_contact_fax__c='323232332';
            testCust.Clerk_AP_contact_name__c='Test User';
            testCust.Clerk_AP_contact_telephone_number__c='323232323';
            testCust.Local_Version__c='';

            insert testCust;


            Customer_Data_Request__c testCust1 = new Customer_Data_Request__c();
            testCust1.Request_Description__c='Test Record';
            testCust1.Request_Status__c = 'Closed';
            testCust1.Requestor_Name__c = UserInfo.getUserId();
            testCust1.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            testCust1.SF_Region__c ='Asia Pacific';
            testCust1.Company_Code__c = '9999-Dummy China Value';
            testCust1.Group_Key__c ='6000000';
            testCust1.Distribution_Channel__c = '10-Dupont Std';
            testCust1.Account_Group__c='Z001(Sold-to Party)';
            testCust1.Division__c = '01-Product Division 01';
            testCust1.Customer_Name__c='Test Customer';
            testCust1.Sold_to_Street__c='Walters Street';
            testCust1.Sold_to_City__c='New Jersey';
            testCust1.Sold_to_Country__c='US';
            testCust1.Sold_to_e_mail__c='sam@gmail.com';
            testCust1.RecordTypeId = custDataRecId ;
            testCust1.Customer_Contact_Name__c='Test1';
            testCust1.Customer_Contact_Telephone__c='123232323';
            testCust1.Proposed_Terms_of_Payment__c='15 PROX';
            testCust1.Proposed_Credit_Limit__c='100';
            testCust1.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            testCust1.Default_Incoterms_2__c='Test Term';
            testCust1.Estimated_Average_Monthly_Purchases__c=100;
            testCust1.Estimated_Number_of_Orders_per_Month__c=20;
            //testCust1.Registration_number__c='458889';
            testCust1.Sold_To_Office_House_Number__c = '124';
            testCust1.Sold_to_State_Province__c ='Michigun';
            testCust1.Record_Locked__c=false;
            testCust1.Relevant_for_POD__c=false;
            testCust1.Clerk_AP_contact_email__c='test@requestor.com';
            testCust1.Clerk_AP_contact_fax__c='323232332';
            testCust1.Clerk_AP_contact_name__c='Test User';
            testCust1.Clerk_AP_contact_telephone_number__c='323232323';
            testCust1.Local_Version__c='';

            insert testCust1;

            Test.startTest();

            exporterCSV.execute(sc);
        }
    }
}