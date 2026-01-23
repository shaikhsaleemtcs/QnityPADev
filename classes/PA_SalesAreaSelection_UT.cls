/*
Date : 29/12/2016
Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest
public class PA_SalesAreaSelection_UT{
    

   static testMethod void PASalesAreaSelection_UT() { 
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
        Profile p1 = [Select id From Profile where Name Like 'System Administrator' LIMIT 1];
        /*
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Envelopes'];  
        system.debug('roleeeeeeeeee'+r);                   
        User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                            User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                            External_ERP_ID__c='123353',UserRoleId=r.id,profileid = p1.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');              
           
        User u4= new User(Firstname='test2test2',Alias='Hill', Email='ambili_vinay@infosys.com', 
                          User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                          External_ERP_ID__c='123353',profileid = p.id,
                           Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User usr1 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User1 FirstName','User1 LastName');
        usr1.External_ERP_ID__c='DummyTest1';
        insert usr1;
        User usr2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        usr2.External_ERP_ID__c='DummyTest2';
        insert usr2;
        system.runAs(usr1){
            
        Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.Id;
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
        erpPricingProcedure.SAP_Cluster__c = 'WB1';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
      
        OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '2';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
        orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
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
            list<Organizational_Group_Item__c> ogilist = new Organizational_Group_Item__c[]{orgGrpItem};
        
        Organizational_Group_User__c orgGroupUser=new Organizational_Group_User__c();
        orgGroupUser.Access_Level__c='';
        orgGroupUser.Description__c='';
        orgGroupUser.OrgGroup__c=(orgGroup).id;
        orgGroupUser.Related_Public_Group_Id__c='';
        orgGroupUser.Related_User__c=usr2.id;
        orgGroupUser.Organizational_Group_Item__c=orgGrpItem .id;
        insert orgGroupUser;
            //Added by Sumida on 10/09/24 to increase code coverage
            PAHelpLinks__c helpcust = new PAHelpLinks__c();
            helpcust.Name = 'TestLink';
            helpcust.Help_Link__c = 'www.google.com';
            insert helpcust;
        
            PASalesAreaSelection SalesAreaSelection=new PASalesAreaSelection();
            SalesAreaSelection.salesOrgSelected = orgGroup1.ERP_Sales_Org_Code__c;
            SalesAreaSelection.divisionSelected =  orgGroup1.ERP_Division_Code__c;
            SalesAreaSelection.distChannelSelected = orgGroup1.ERP_Distribution_Channel_Code__c;
            SalesAreaSelection.enablePopUpBoolean = true;
            SalesAreaSelection.label = 'TestLink';
            SalesAreaSelection.buCode = orgGrpItem.Business__c;
            SalesAreaSelection.salesAreaId = orgGroup1.ERP_Sales_Org_Code__c;
            SalesAreaSelection.buIdComponent=orgGrpItem.Business__c;
            SalesAreaSelection.salesAreaSelected = orgGroup1.ERP_Sales_Org_Code__c;
            SalesAreaSelection.buOrgList = ogilist;
            SalesAreaSelection.salesArea = ogilist;
            SalesAreaSelection.action();
            SalesAreaSelection.displayPopUpWindow();
            SalesAreaSelection.dosearch();
            SalesAreaSelection.returnData();
            SalesAreaSelection.closeWindow();
             //Added by Sumida on 10/09/24 to increase code coverage
            SalesAreaSelection.helpLink();
        }
   }
}