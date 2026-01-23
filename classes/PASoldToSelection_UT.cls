/*
 * Name      :   PASoldToSelection_UT
 * Description  :   This is the test class for PASoldToSelection
 * Author      :   Infosys Limited
 * Created Date :   
 *
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */


@isTest
private class PASoldToSelection_UT {

static testMethod void PASoldToSelectionTestMethod() { 
Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
      //UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_D630'];  
      // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
      
 // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
      User u= TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');
      insert u;     
      system.runAs(u){
       try{
       Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.id;
        orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
        orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup.ERP_DIVISION_CODE__C='02';
        orgGroup.ERP_DIVISION__C='GSD Standard';
        orgGroup.ERP_SALES_ORG_CODE__C='D630';
        orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup.OWNING_BUSINESS__C='';
        orgGroup.OWNING_ORG__C='';
        orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
        insert orgGroup;
        
        
        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = '';
        erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
        erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.SAP_Application_Id__c = 'V';
        erpPricingProcedure.SAP_Client_Id__c = '510';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
      
        
        
         OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '02';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
       /* OrgGroup__c orgGroup4 = new orgGroup__c();
        orgGroup4.Business__c = 'BI EMEA Envelopes';
        orgGroup4.RecordTypeId = recType.Id;
        orgGroup4.ERP_Distribution_Channel_Code__c = '10';
        orgGroup4.ERP_Sales_Org_Code__c = 'D639';
        orgGroup4.ERP_Division_Code__c = '02';
        orgGroup4.OWNING_BUSINESS__C='Building Innovations';
        orgGroup4.TYPE__C='ERP';
        insert orgGroup4;
        
        OrgGroup__c orgGroup3 = new orgGroup__c();
        orgGroup3.Business__c = 'BI EMEA Envelopes';
        orgGroup3.RecordTypeId = recType.Id;
        orgGroup3.ERP_Distribution_Channel_Code__c = '20';
        orgGroup3.ERP_Sales_Org_Code__c = 'D693';
        orgGroup3.ERP_Division_Code__c = '01';
        orgGroup3.OWNING_BUSINESS__C='Building Innovations';
        orgGroup3.TYPE__C='ERP';
        insert orgGroup3;*/
        
        OrgGroup__c orgGroup2 = new orgGroup__c();
        orgGroup2.CURRENCYISOCODE='USD';
        orgGroup2.RECORDTYPEID=recType.Id;
        orgGroup2.ERP_DISTRIBUTION_CHANNEL_CODE__C='20';
        orgGroup2.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup2.ERP_DIVISION_CODE__C='01';
        orgGroup2.ERP_DIVISION__C='GSD Standard';
        orgGroup2.ERP_SALES_ORG_CODE__C='D630';
        orgGroup2.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup2.OWNING_BUSINESS__C='';
        orgGroup2.OWNING_ORG__C='';
        
        insert orgGroup2;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
       // orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
        orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem.ERP_UOM__C = 'EA;SH';
        orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem.RETROACTIVE_LIMIT__C =30;
        orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem.Rebate_Agreement__c='';
        orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem;
        
            Organizational_Group_Item__c orgGrpItem1= new Organizational_Group_Item__c();
        orgGrpItem1.Business__c = (orgGroup1).id;
        orgGrpItem1.OrgGroup__c = (orgGroup2).id;
        orgGrpItem1.CURRENCYISOCODE = 'USD';
     //   orgGrpItem1.APPROVAL_ESCALATION_DURATION__C = 23;
        orgGrpItem1.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem1.ERP_UOM__C = 'EA;SH';
        orgGrpItem1.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem1.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem1.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem1.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem1.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem1.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem1.RETROACTIVE_LIMIT__C =30;
        orgGrpItem1.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem1.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem1.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem1.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem1.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem1.Rebate_Agreement__c='';
        orgGrpItem1.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem1;
        
        Organizational_Group_User__c orgGroupUser=new Organizational_Group_User__c();
        orgGroupUser.Access_Level__c='';
        orgGroupUser.Description__c='';
        orgGroupUser.OrgGroup__c=(orgGroup).id;
        orgGroupUser.Related_Public_Group_Id__c='';
        orgGroupUser.Related_User__c=u.id;
        orgGroupUser.Organizational_Group_Item__c=orgGrpItem .id;
        insert orgGroupUser;
        Organizational_Group_User__c orgGroupUser1=new Organizational_Group_User__c();
        orgGroupUser1.Access_Level__c='';
        orgGroupUser1.Description__c='';
        orgGroupUser1.OrgGroup__c=(orgGroup).id;
        orgGroupUser1.Related_Public_Group_Id__c='';
        orgGroupUser1.Related_User__c=u.id;
        orgGroupUser1.Organizational_Group_Item__c=orgGrpItem .id;
        insert orgGroupUser1;
        Organizational_Group_User__c orgGroupUser2=new Organizational_Group_User__c();
        orgGroupUser2.Access_Level__c='';
        orgGroupUser2.Description__c='';
        orgGroupUser2.OrgGroup__c=(orgGroup2).id;
        orgGroupUser2.Related_Public_Group_Id__c='';
        orgGroupUser2.Related_User__c=u.id;
        orgGroupUser2.Organizational_Group_Item__c=orgGrpItem1.id;
        insert orgGroupUser2;
        
        ERP_Customer_Material_Key__c custMaterialKey=new ERP_Customer_Material_Key__c();
        custMaterialKey.Status__c='Active';
        custMaterialKey.Type__c='Country';
        custMaterialKey.Code__c='AD';
        custMaterialKey.Name__c='Andorra';
        custMaterialKey.Field_Name__c='COUNTRY__C';
        insert custMaterialKey;          
        
        ERP_Customer_Material_Key__c custMaterialKey1=new ERP_Customer_Material_Key__c();
        custMaterialKey1.Status__c='Active';
        custMaterialKey1.Type__c='Country';
        custMaterialKey1.Code__c='AD1';
        custMaterialKey1.Name__c='Andorra1';
        custMaterialKey1.Field_Name__c='COUNTRY__C';
        insert custMaterialKey1;             
        
        
        Org_Group_ERP_Key__c orgGroupKey=new Org_Group_ERP_Key__c();
        orgGroupKey.Organizational_Group_Item__c=orgGrpItem.id;
        orgGroupKey.ERP_Cus_Mat_Compt_Key__c=custMaterialKey.id;
        insert orgGroupKey;
        
        Org_Group_ERP_Key__c orgGroupKey1=new Org_Group_ERP_Key__c();
        orgGroupKey1.Organizational_Group_Item__c=orgGrpItem.id;
        orgGroupKey1.ERP_Cus_Mat_Compt_Key__c=custMaterialKey1.id;
        insert orgGroupKey1;
        
         Org_Group_ERP_Key__c orgGroupKey2=new Org_Group_ERP_Key__c();
        orgGroupKey2.ERP_Cus_Mat_Compt_Key__c=custMaterialKey1.id;
        insert orgGroupKey2;
        
         ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='Sample-0001';
         //customer.Sales_Area__c='D6931002'; -- Shiva
         customer.Sales_Org_Code__c='D693';
         customer.Distribution_Channel_Code__c='20';
         customer.Division_Code__c='01';         
         customer.name='Test Customer';      
         customer.country__c='GERMANY';
         customer.Sales_Office_Code__c='salesoffice1';
         customer.Street__c='street1';
         customer.State_Province__c='state1';
         customer.City__c='city1';
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');      
         insert customer;
         ERP_Customer__c customer1=new ERP_Customer__c();
         customer1.Account_Group_Code__c='Z001';
         customer1.Customer_Code__c='Sample-0001';
         //customer1.Sales_Area__c='D6301002'; -- Shiva
         customer1.Sales_Org_Code__c='D630';
         customer1.Distribution_Channel_Code__c='10';
         customer1.Division_Code__c='02';
         customer1.street__c='street1';
         customer1.name='Test Customer';
         
         customer1.country__c='GERMANY';
         customer1.Sales_Office_Code__c='salesoffice1';
         customer1.State_Province__c='state1';
         customer1.City__c='city1';
         customer1.Deletion_Flag__c=false;
         customer1.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');   
             
         insert customer1;
         
          ERP_Customer__c customer2=new ERP_Customer__c();
         customer2.Account_Group_Code__c='Z001';
         customer2.Customer_Code__c='Sample-0001';
         //customer2.Sales_Area__c='D6301002'; -- Shiva
         customer2.Sales_Org_Code__c='A640';
         customer2.Distribution_Channel_Code__c='10';
         customer2.Division_Code__c='02';
         customer2.street__c='street1';
         customer2.name='FREE OF CHARGE CUST - NOW LUX';
         
         customer2.country__c='GERMANY';
         customer2.Sales_Office_Code__c='salesoffice1';
         customer2.State_Province__c='state1';
         customer2.City__c='city1';
         customer2.Source_Cluster__c='WB1';  
         customer2.Deletion_Flag__c=true;
         customer2.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');     
          insert customer2;
          ERP_Customer__c customer3=new ERP_Customer__c();
         insert customer3;
         
       ERP_Relationship__c relationship=new ERP_Relationship__c();
      relationship.ERP_Customer__c=customer1.id;
      relationship.Partner_Function_Code__c='ZU';
      relationship.User__c=u.id;
      insert relationship;
         ERP_Relationship__c relationship1=new ERP_Relationship__c();
      relationship1.ERP_Customer__c=customer.id;
      relationship1.Partner_Function_Code__c='ZU';
      relationship1.User__c=u.id;
      insert relationship1;
      
       ERP_Relationship__c relationship2=new ERP_Relationship__c();
      relationship2.ERP_Customer__c=customer2.id;
      relationship2.Partner_Function_Code__c='ZU';
      relationship2.User__c=u.id;
      insert relationship2;
      
         ERP_Relationship__c relationship3=new ERP_Relationship__c();
      relationship3.ERP_Customer__c=customer2.id;
      relationship3.Partner_Function_Code__c='ZU';
      relationship3.User__c=u.id;
      insert relationship3;
        PASoldToSelection SoldToSelection= new PASoldToSelection();
        SoldToSelection.desiredAction='populateDcDDiv';
        SoldToSelection.BUSelectedFromPage =orgGroup1.id;
        //SoldToSelection.BUSelectedFromPage ='BI EMEA Envelopes';
        SoldToSelection.soldToCodeFromPage='Sample-0001';
        SoldToSelection.filter_salesOrg='D630';
        SoldToSelection.filter_distChannel='10';
        SoldToSelection.filter_division='02';
        SoldToSelection.filter_soldToCode='Sample-0001';        
        soldtoSelection.filter_soldTo='FREE OF CHARGE CUST - NOW LUXy';
        soldtoSelection.filter_country='GERMANY';
        soldtoSelection.filter_state='state1';
        soldtoselection.filter_street='street1';
        soldToSelection.filter_city='city1';
        SoldToSelection.filter_salesOffice='salesoffice1';    
        SoldToSelection.displayPopUpWindow();
        SoldToSelection.dosearch();
        SoldToSelection.returnData();
        SoldToSelection.closeWindow();
        SoldToSelection.action();
        SoldToSelection.getName();
     
        
        PASoldToSelection SoldToSelection1= new PASoldToSelection();
        SoldToSelection1.desiredAction='populateDcDDiv';
        SoldToSelection1.BUSelectedFromPage =null;
        SoldToSelection1.soldToCodeFromPage='Sample-0001';
        SoldToSelection1.filter_salesOrg='D630';
        SoldToSelection1.filter_distChannel='10';
        SoldToSelection1.filter_division='02';
        SoldToSelection1.filter_soldToCode='Sample-0001';
        SoldToSelection1.filter_salesOffice='';
        soldtoSelection1.filter_soldTo='Test Customer';
        soldtoSelection1.filter_country='GERMANY';
        soldtoSelection1.filter_state='state1';
        soldtoselection1.filter_street='street1';
        soldToSelection1.filter_city='city1';
        SoldToSelection1.filter_salesOffice='salesoffice1';   
        SoldToSelection1.displayPopUpWindow();
        SoldToSelection1.dosearch();
        SoldToSelection1.returnData();
        SoldToSelection1.closeWindow();
        SoldToSelection1.action();
        SoldToSelection1.getName();
        
        
        
        
        PASoldToSelection SoldToSelection2= new PASoldToSelection();
        SoldToSelection2.desiredAction='populateDcDDiv';
        SoldToSelection2.BUSelectedFromPage =orgGroup1.id;
        SoldToSelection2.soldToCodeFromPage='Sample-0001';
         SoldToSelection2.displayPopUpWindow();
        SoldToSelection2.dosearch();
        SoldToSelection2.returnData();
        SoldToSelection2.closeWindow();
        SoldToSelection2.action();
        SoldToSelection2.getName();
        SoldToSelection2.getname();
        PASoldToSelection SoldToSelection3= new PASoldToSelection();
        SoldToSelection3.desiredAction='populateDcDDiv';
        SoldToSelection3.BUSelectedFromPage =null;
        SoldToSelection3.soldToCodeFromPage='';
        SoldToSelection3.displayPopUpWindow();
        SoldToSelection3.dosearch();
        SoldToSelection3.returnData();
        SoldToSelection3.closeWindow();
        SoldToSelection3.action();
        SoldToSelection3.getName();
        PASoldToSelection SoldToSelection4= new PASoldToSelection();
        SoldToSelection4.desiredAction='populateDcDDiv';
        SoldToSelection4.BUSelectedFromPage =orgGroup1.id;
        SoldToSelection4.soldToCodeFromPage='Sample-0001';
        SoldToSelection4.filter_salesOrg='d693';
        SoldToSelection4.filter_distChannel='10';
        SoldToSelection4.filter_division='02';
        SoldToSelection4.filter_soldToCode='Sample-0001';       
        soldtoSelection4.filter_soldTo='Test Customer';
        soldtoSelection4.filter_country='GERMANY';
        soldtoSelection4.filter_state='state1';
        soldtoselection4.filter_street='street1';
        soldToSelection4.filter_city='city1';
        SoldToSelection4.filter_salesOffice='salesoffice1';   
        SoldToSelection4.displayPopUpWindow();
        SoldToSelection4.dosearch();
        SoldToSelection4.returnData();
        SoldToSelection4.closeWindow();
        SoldToSelection4.action();
        SoldToSelection4.getName();
       
       }
       catch(exception e){
       } 
      }
}

//pooja

static testMethod void PASoldToSelectionTestMethod1() { 
Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
      //UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_D630'];
      // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
         
       //[12232016] Merge&Spin : Changed External ERP Id to Dummy
       // Merge&Spin -Updated the test  class to update the insert of UserRole and User
      User u= TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');
      insert u;
      system.runAs(u){
       try{
       Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.id;
        orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
        orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup.ERP_DIVISION_CODE__C='02';
        orgGroup.ERP_DIVISION__C='GSD Standard';
        orgGroup.ERP_SALES_ORG_CODE__C='D630';
        orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup.OWNING_BUSINESS__C='';
        orgGroup.OWNING_ORG__C='';
        orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
        insert orgGroup;
        
        
        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = '';
        erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
        erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.SAP_Application_Id__c = 'V';
        erpPricingProcedure.SAP_Client_Id__c = '510';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
      
        
        
         OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '02';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
     
        
        OrgGroup__c orgGroup2 = new orgGroup__c();
        orgGroup2.CURRENCYISOCODE='USD';
        orgGroup2.RECORDTYPEID=recType.Id;
        orgGroup2.ERP_DISTRIBUTION_CHANNEL_CODE__C='20';
        orgGroup2.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup2.ERP_DIVISION_CODE__C='01';
        orgGroup2.ERP_DIVISION__C='GSD Standard';
        orgGroup2.ERP_SALES_ORG_CODE__C='D630';
        orgGroup2.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup2.OWNING_BUSINESS__C='';
        orgGroup2.OWNING_ORG__C='';
        
        insert orgGroup2;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
       // orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
        orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem.ERP_UOM__C = 'EA;SH';
        orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem.RETROACTIVE_LIMIT__C =30;
        orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem.Rebate_Agreement__c='';
        orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem;
        
            Organizational_Group_Item__c orgGrpItem1= new Organizational_Group_Item__c();
        orgGrpItem1.Business__c = (orgGroup1).id;
        orgGrpItem1.OrgGroup__c = (orgGroup2).id;
        orgGrpItem1.CURRENCYISOCODE = 'USD';
     //   orgGrpItem1.APPROVAL_ESCALATION_DURATION__C = 23;
        orgGrpItem1.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem1.ERP_UOM__C = 'EA;SH';
        orgGrpItem1.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem1.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem1.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem1.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem1.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem1.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem1.RETROACTIVE_LIMIT__C =30;
        orgGrpItem1.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem1.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem1.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem1.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem1.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem1.Rebate_Agreement__c='';
        orgGrpItem1.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem1;
        
        Organizational_Group_User__c orgGroupUser=new Organizational_Group_User__c();
        orgGroupUser.Access_Level__c='';
        orgGroupUser.Description__c='';
        orgGroupUser.OrgGroup__c=(orgGroup).id;
        orgGroupUser.Related_Public_Group_Id__c='';
        orgGroupUser.Related_User__c=u.id;
        orgGroupUser.Organizational_Group_Item__c=orgGrpItem .id;
        insert orgGroupUser;
        Organizational_Group_User__c orgGroupUser1=new Organizational_Group_User__c();
        orgGroupUser1.Access_Level__c='';
        orgGroupUser1.Description__c='';
        orgGroupUser1.OrgGroup__c=(orgGroup).id;
        orgGroupUser1.Related_Public_Group_Id__c='';
        orgGroupUser1.Related_User__c=u.id;
        orgGroupUser1.Organizational_Group_Item__c=orgGrpItem .id;
        insert orgGroupUser1;
        Organizational_Group_User__c orgGroupUser2=new Organizational_Group_User__c();
        orgGroupUser2.Access_Level__c='';
        orgGroupUser2.Description__c='';
        orgGroupUser2.OrgGroup__c=(orgGroup2).id;
        orgGroupUser2.Related_Public_Group_Id__c='';
        orgGroupUser2.Related_User__c=u.id;
        orgGroupUser2.Organizational_Group_Item__c=orgGrpItem1.id;
        insert orgGroupUser2;
        
        ERP_Customer_Material_Key__c custMaterialKey=new ERP_Customer_Material_Key__c();
        custMaterialKey.Status__c='Active';
        custMaterialKey.Type__c='Country';
        custMaterialKey.Code__c='AD';
        custMaterialKey.Name__c='Andorra';
        custMaterialKey.Field_Name__c='COUNTRY__C';
        insert custMaterialKey;          
        
        ERP_Customer_Material_Key__c custMaterialKey1=new ERP_Customer_Material_Key__c();
        custMaterialKey1.Status__c='Active';
        custMaterialKey1.Type__c='Country';
        custMaterialKey1.Code__c='AD1';
        custMaterialKey1.Name__c='Andorra1';
        custMaterialKey1.Field_Name__c='COUNTRY__C';
        insert custMaterialKey1;             
        
        
        Org_Group_ERP_Key__c orgGroupKey=new Org_Group_ERP_Key__c();
        orgGroupKey.Organizational_Group_Item__c=orgGrpItem.id;
        orgGroupKey.ERP_Cus_Mat_Compt_Key__c=custMaterialKey.id;
        insert orgGroupKey;
        
        Org_Group_ERP_Key__c orgGroupKey1=new Org_Group_ERP_Key__c();
        orgGroupKey1.Organizational_Group_Item__c=orgGrpItem.id;
        orgGroupKey1.ERP_Cus_Mat_Compt_Key__c=custMaterialKey1.id;
        insert orgGroupKey1;
        
         Org_Group_ERP_Key__c orgGroupKey2=new Org_Group_ERP_Key__c();
        orgGroupKey2.ERP_Cus_Mat_Compt_Key__c=custMaterialKey1.id;
        insert orgGroupKey2;
        
         ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='Sample-0001';
         //customer.Sales_Area__c='D6931002'; -- Shiva
         customer.Sales_Org_Code__c='D693';
         customer.Distribution_Channel_Code__c='20';
         customer.Division_Code__c='01';         
         customer.name='Test Customer';      
         customer.country__c='GERMANY';
         customer.Sales_Office_Code__c='salesoffice1';
         customer.Street__c='street1';
         customer.State_Province__c='state1';
         customer.City__c='city1';
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');      
         insert customer;
         ERP_Customer__c customer1=new ERP_Customer__c();
         customer1.Account_Group_Code__c='Z001';
         customer1.Customer_Code__c='Sample-0001';
         //customer1.Sales_Area__c='D6301002'; -- Shiva
         customer1.Sales_Org_Code__c='D630';
         customer1.Distribution_Channel_Code__c='10';
         customer1.Division_Code__c='02';
         customer1.street__c='street1';
         customer1.name='Test Customer';
         
         customer1.country__c='GERMANY';
         customer1.Sales_Office_Code__c='salesoffice1';
         customer1.State_Province__c='state1';
         customer1.City__c='city1';
         customer1.Deletion_Flag__c=false;
         customer1.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');   
             
         insert customer1;
         
          ERP_Customer__c customer2=new ERP_Customer__c();
         customer2.Account_Group_Code__c='Z001';
         customer2.Customer_Code__c='Sample-0001';
         //customer2.Sales_Area__c='D6301002'; -- Shiva
         customer2.Sales_Org_Code__c='A640';
         customer2.Distribution_Channel_Code__c='10';
         customer2.Division_Code__c='02';
         customer2.street__c='street1';
         customer2.name='FREE OF CHARGE CUST - NOW LUX';
         
         customer2.country__c='GERMANY';
         customer2.Sales_Office_Code__c='salesoffice1';
         customer2.State_Province__c='state1';
         customer2.City__c='city1';
         customer2.Source_Cluster__c='WB1';  
         customer2.Deletion_Flag__c=true;
         customer2.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__C','ERP_Customer_Extended_Data');     
          insert customer2;
          ERP_Customer__c customer3=new ERP_Customer__c();
         insert customer3;
         
       ERP_Relationship__c relationship=new ERP_Relationship__c();
      relationship.ERP_Customer__c=customer1.id;
      relationship.Partner_Function_Code__c='ZU';
      relationship.User__c=u.id;
      insert relationship;
         ERP_Relationship__c relationship1=new ERP_Relationship__c();
      relationship1.ERP_Customer__c=customer.id;
      relationship1.Partner_Function_Code__c='ZU';
      relationship1.User__c=u.id;
      insert relationship1;
      
       ERP_Relationship__c relationship2=new ERP_Relationship__c();
      relationship2.ERP_Customer__c=customer2.id;
      relationship2.Partner_Function_Code__c='ZU';
      relationship2.User__c=u.id;
      insert relationship2;
      
         ERP_Relationship__c relationship3=new ERP_Relationship__c();
      relationship3.ERP_Customer__c=customer2.id;
      relationship3.Partner_Function_Code__c='ZU';
      relationship3.User__c=u.id;
      insert relationship3;
        PASoldToSelection SoldToSelection= new PASoldToSelection();
        SoldToSelection.desiredAction='populateDcDDiv';
        SoldToSelection.BUSelectedFromPage =orgGroup1.id;
        //SoldToSelection.BUSelectedFromPage ='BI EMEA Envelopes';
        SoldToSelection.soldToCodeFromPage='Sample-0001';
        SoldToSelection.filter_salesOrg='D630';
        SoldToSelection.filter_distChannel='10';
        SoldToSelection.filter_division='02';
        SoldToSelection.filter_soldToCode='Sample-0001';        
        soldtoSelection.filter_soldTo='FREE OF CHARGE CUST - NOW LUXy';
        soldtoSelection.filter_country='GERMANY';
        soldtoSelection.filter_state='state1';
        soldtoselection.filter_street='street1';
        soldToSelection.filter_city='city1';
        SoldToSelection.filter_salesOffice='salesoffice1';    
        //pooja
        SoldToSelection.whereClause='where';
        SoldToSelection.query='query';
        Organizational_Group_Item__c ogi1 = SoldToSelection.orgGroupItem;
        boolean a = SoldToSelection.reqClassFlag;
        List<String> lString = SoldToSelection.reqClassList;
        SoldToSelection.dispCount=null;
        SoldToSelection.currentPageLabel='label';
        SoldToSelection.newPageLabel='label1';
        SoldToSelection.label='label2';
        SoldToSelection.displayPopUpWindow1();
        string nameget = SoldToSelection.getName();
        SoldToSelection.displayPopUpWindow();
        SoldToSelection.dosearch();
        SoldToSelection.returnData();
        SoldToSelection.closeWindow();
        SoldToSelection.action();
        SoldToSelection.getName();
        Boolean c = SoldToSelection.changeSAFlag;
        SoldToSelection.helpLink();
     
        
        PASoldToSelection SoldToSelection1= new PASoldToSelection();
        SoldToSelection1.desiredAction='populateDcDDiv';
        SoldToSelection1.BUSelectedFromPage =null;
        SoldToSelection1.soldToCodeFromPage='Sample-0001';
        SoldToSelection1.filter_salesOrg='D630';
        SoldToSelection1.filter_distChannel='10';
        SoldToSelection1.filter_division='02';
        SoldToSelection1.filter_soldToCode='Sample-0001';
        SoldToSelection1.filter_salesOffice='';
        soldtoSelection1.filter_soldTo='Test Customer';
        soldtoSelection1.filter_country='GERMANY';
        soldtoSelection1.filter_state='state1';
        soldtoselection1.filter_street='street1';
        soldToSelection1.filter_city='city1';
        SoldToSelection1.filter_salesOffice='salesoffice1';   
        SoldToSelection1.displayPopUpWindow();
        //pooja
        SoldToSelection1.action();
        SoldToSelection1.dosearch();
        SoldToSelection1.returnData();
        SoldToSelection1.closeWindow();
        SoldToSelection1.action();
        SoldToSelection1.getName();
        SoldToSelection1.helpLink();  
        
        
        
        PASoldToSelection SoldToSelection2= new PASoldToSelection();
        SoldToSelection2.desiredAction='populateDcDDiv';
        SoldToSelection2.BUSelectedFromPage =orgGroup1.id;
        SoldToSelection2.soldToCodeFromPage='Sample-0001';
         SoldToSelection2.displayPopUpWindow();
        SoldToSelection2.dosearch();
        SoldToSelection2.returnData();
        SoldToSelection2.closeWindow();
        SoldToSelection2.action();
        SoldToSelection2.getName();
        SoldToSelection2.getname();
        PASoldToSelection SoldToSelection3= new PASoldToSelection();
        SoldToSelection3.desiredAction='populateDcDDiv';
        SoldToSelection3.BUSelectedFromPage =null;
        SoldToSelection3.soldToCodeFromPage='';
        SoldToSelection3.displayPopUpWindow();
        SoldToSelection3.dosearch();
        SoldToSelection3.returnData();
        SoldToSelection3.closeWindow();
        SoldToSelection3.action();
        SoldToSelection3.getName();
        PASoldToSelection SoldToSelection4= new PASoldToSelection();
        SoldToSelection4.desiredAction='populateDcDDiv';
        SoldToSelection4.BUSelectedFromPage =orgGroup1.id;
        SoldToSelection4.soldToCodeFromPage='Sample-0001';
        SoldToSelection4.filter_salesOrg='d693';
        SoldToSelection4.filter_distChannel='10';
        SoldToSelection4.filter_division='02';
        SoldToSelection4.filter_soldToCode='Sample-0001';       
        soldtoSelection4.filter_soldTo='Test Customer';
        soldtoSelection4.filter_country='GERMANY';
        soldtoSelection4.filter_state='state1';
        soldtoselection4.filter_street='street1';
        soldToSelection4.filter_city='city1';
        SoldToSelection4.filter_salesOffice='salesoffice1';   
        SoldToSelection4.displayPopUpWindow();
        SoldToSelection4.dosearch();
        SoldToSelection4.returnData();
        SoldToSelection4.closeWindow();
        SoldToSelection4.action();
        SoldToSelection4.getName();
        SoldToSelection4.helpLink();
       
       }
       catch(exception e){
       } 
      }
}
}