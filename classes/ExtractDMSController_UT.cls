/*******************************************************************************
Copyright © 2014 DuPont. All rights reserved. 
Author: Nishanth H
Email: nishanth_h@infosys.com
Description: Test class for ExtractDMSController
 ********************************************************************************/ 

@isTest
public class ExtractDMSController_UT {
 public static final string CompanyCodeCountry_Rule_Rtype = Rtype.getIdByDevName('Business_Rules__c','Country_Selling_Company_Code_Rules');

 static testmethod void exportExcelRender() {
      test.starttest();
      Business_Rules__c bus = new Business_Rules__c(Selling_Company_Code__c = '0003 - E.I. DuPont India Private Limited', Sold_to_Country__c='IN - India',recordtypeid=CompanyCodeCountry_Rule_Rtype );
      insert bus;
      Customer_Data_Request__c testCust = new Customer_Data_Request__c();
      Id custDataRecId = [Select Id, Name from RecordType where DeveloperName = 'Extend_Existing_Customer' limit 1].Id;
       testCust.Request_Description__c='Test Record';
            testCust.Request_Status__c = 'Awaiting Destination Credit Approval - DCA';
            testCust.Requestor_Name__c = UserInfo.getUserId();
            testCust.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            testCust.SF_Region__c ='Asia Pacific';
            testCust.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
            testCust.Group_Key__c ='6000000';
            testCust.Distribution_Channel__c = '10-Dupont Std';
            testCust.Account_Group__c='Z001(Sold-to Party)';
            testCust.Division__c = '01-Product Division 01';
            testCust.Customer_Name__c='Test Customer';
            testCust.Sold_to_Street__c='Walters Street';
            testCust.Sold_to_City__c='New Jersey';
            testCust.Sold_to_Country__c='IN - India';
            testCust.Sold_to_e_mail__c='sam@gmail.com';
            testCust.RecordTypeId = custDataRecId;
            testCust.Proposed_Terms_of_Payment__c='15 PROX';
            testCust.Proposed_Credit_Limit__c='100';
            testCust.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            testCust.Default_Incoterms_2__c='Test Term';
            testCust.Estimated_Average_Monthly_Purchases__c=100;
            testCust.Estimated_Number_of_Orders_per_Month__c=20;
            testCust.Registration_number__c='458889';
            testCust.Sold_To_Office_House_Number__c = '124';
            testCust.Sold_to_State_Province__c ='Michigun';
            testCust.Record_Locked__c=false;
            testCust.Relevant_for_POD__c=false;
            testCust.Local_Version__c='';
            testCust.Relevant_for_POD__c=true;
            testCust.Fields_Modified_1__c='Activity Code';
            testCust.Fields_Modified_2__c='Ship-to Street';
            insert testCust;
            
    Customer_Data_Request_Line_Item__c cli=new Customer_Data_Request_Line_Item__c();
     cli.Customer_Name__c='TestA';
     cli.Customer_Name_2__c='TestB';
     cli.Customer_Data_Request__c=testCust.id;
     cli.Local_Version__c='Arabic';
     cli.Country__c='AD - Andorran';
     cli.Local_Language_Country__c='AF - Afghanistan';
     insert cli;
     
    Apexpages.currentPage().getParameters().put('param',testCust.id);  

     ExtractDMSController pdf=new ExtractDMSController(); 
     pdf.exportAll();
     pdf.RecordTypeName='Extend Existing Customer';
     pdf.editFields();
      

      test.stoptest();
        }
    }