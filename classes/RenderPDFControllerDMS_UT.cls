/*******************************************************************************
Copyright © 2015 DuPont. All rights reserved. 
Author: Nishanth H
Email: nishanth_h@infosys.com
Description:  Test class for RenderPDFControllerDMS
 ********************************************************************************/

@isTest
public class RenderPDFControllerDMS_UT {

 static testmethod void exportRender() {
   test.starttest();
      Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator']; 
        User u = new User(Alias = 'standt45', Email='1@testorg.com', 
                EmailEncodingKey='UTF-8', LastName='Testing1212', LanguageLocaleKey='en_US', 
                LocaleSidKey='en_US', ProfileId = p.Id, 
                TimeZoneSidKey='America/Los_Angeles', UserName='1@testorg.com');

        System.runAs(u){
       
            
        Customer_Data_Request__c testCust1 = new Customer_Data_Request__c();
          Id custDataRecId1 = [Select Id, Name from RecordType where DeveloperName = 'New_Customer_Creation' limit 1].Id;
           testCust1.Request_Description__c='Test Record';
      
            testCust1.Request_Status__c = 'Awaiting Destination Credit Approval';
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
            testCust1.RecordTypeId = custDataRecId1;
            testCust1.Proposed_Terms_of_Payment__c='15 PROX';
            testCust1.Proposed_Credit_Limit__c='100';
            testCust1.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            testCust1.Default_Incoterms_2__c='Test Term';
            testCust1.Estimated_Average_Monthly_Purchases__c=100;
            testCust1.Estimated_Number_of_Orders_per_Month__c=20;
            testCust1.Registration_number__c='458889';
            testCust1.Sold_To_Office_House_Number__c = '124';
            testCust1.Sold_to_State_Province__c ='Michigun';
            testCust1.Record_Locked__c=false;
            testCust1.Relevant_for_POD__c=false;
            testCust1.Local_Version__c='';
            testCust1.Relevant_for_POD__c=true;
            testCust1.Fields_Modified_1__c='Activity Code';
            testCust1.Fields_Modified_2__c='Ship-to Street';
            insert testCust1;
            
     Customer_Data_Request_Line_Item__c cli=new Customer_Data_Request_Line_Item__c();
            cli.Customer_Name__c='TestA';
            cli.Customer_Name_2__c='TestB';
            cli.Customer_Data_Request__c=testCust1.id;
            cli.Local_Version__c='Arabic';
            cli.Country__c='AD - Andorran';
            cli.Local_Language_Country__c='AF - Afghanistan';
            insert cli;
      Apexpages.currentPage().getParameters().put('param',testCust1.id);  
      
      RenderPDFControllerDMS render=new RenderPDFControllerDMS(); 
      render.exportAll();
      render.RecordTypeName='Extend Existing Customer';
      render.editFields();
       Id custDataRecId2 = [Select Id, Name from RecordType where DeveloperName = 'Miscellaneous_customer_data_request' limit 1].Id;
       testCust1.RecordTypeId = custDataRecId2 ;
       testCust1.Request_Status__c = 'Awaiting Credit Approval';
       update testcust1;
       RenderPDFControllerDMS render1=new RenderPDFControllerDMS(); 
       
       Id custDataRecId3 = [Select Id, Name from RecordType where DeveloperName = 'Modify_Credit_Data' limit 1].Id;
       testCust1.RecordTypeId = custDataRecId3 ;
       update testcust1;
       RenderPDFControllerDMS render2=new RenderPDFControllerDMS();
       
       test.stoptest();
        }
      }
    }