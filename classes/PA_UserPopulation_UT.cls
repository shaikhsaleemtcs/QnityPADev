/*
Date : 29/12/2016
Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@IsTest
public class PA_UserPopulation_UT{
    
   static testMethod void PAUserPopulation_UT() { 
     //Start: Updated as a part of Merge & Spin to the change the UserRole name.
     /* Profile p =[SELECT Id FROM Profile WHERE Name = 'Price Approval-Price Requester']; 
      User u2 = new User(Alias='MHill', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='723353',profileid = p.id);*/
      Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      Profile p1 = [Select id From Profile where Name Like 'System Administrator' LIMIT 1];
      //UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_D630_UK_Ireland']; 
      /*
      UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Envelopes']; 
      system.debug('roleeeeeeeeee'+r); 
       
       User u4 =  new User();               
       User u3 =  new User(Firstname='werner',Alias='pcopp', Email='ambili_vinay12344@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr5847',
                         External_ERP_ID__c='820353',UserRoleId=r.id,profileid = p.id,
                         Username='pa_werner1231@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='frrqwer2', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US',IsActive=true);               
      insert u3;
      List<User> userList=new list<user>();
      u4= new User(Firstname='Mark',Alias='Hill', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='923353',profileid = p.id,
                         Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US',IsActive=true);
     
   
     insert u4;
     */
       UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
       insert Ur;
       User usr1 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User1 FirstName','User1 LastName');
       insert usr1;
       User usr2 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User2 FirstName','User2 LastName');
       insert usr2;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
     //  
     
      System.runAs(usr2) { 
      
        PAProfilePermissions__c custm1 =  new PAProfilePermissions__c();
        custm1.Name='BU Admin';
        custm1.Name__c = 'Price Approval-BU Admin';
        custm1.API_Name__c='';
        insert custm1;
      
      
          Recordtype recType = [select id,name from Recordtype where name = 'Business'];
      List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
           profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
           profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
           insert profilePermissionList;
           
           PermissionSet ps = [select id from PermissionSet where Name='Price_Approval_Approver'];
           
            
           PermissionSetAssignment psa = new PermissionSetAssignment(AssigneeId=usr1.Id,PermissionSetId=ps.id);
           insert psa; 
      
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
    orgGroup1.ERP_Division_Code__c = '02';
    orgGroup1.OWNING_BUSINESS__C='Building Innovations';
    orgGroup1.TYPE__C='ERP';
    insert orgGroup1;
    
    Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
    orgGrpItem.Business__c = (orgGroup1).id;
    orgGrpItem.OrgGroup__c = (orgGroup).id;
    orgGrpItem.CURRENCYISOCODE = 'USD';
   // orgGrpItem.Approval_Escalation_Price_Requests = 23;
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
    
    Organizational_Group_User__c orgGroupUser=new Organizational_Group_User__c();
    orgGroupUser.Access_Level__c='';
    orgGroupUser.Description__c='ZU';
    orgGroupUser.OrgGroup__c=(orgGroup).id;
    orgGroupUser.Related_Public_Group_Id__c='';
    orgGroupUser.Related_User__c=usr2.id;
     system.debug('@@@@@@@@@orgGroupUser.Related_User__c'+orgGroupUser.Related_User__c);
    orgGroupUser.Organizational_Group_Item__c=orgGrpItem .id;
    insert orgGroupUser; 
    system.debug('@@@@@@@@@orgGroupUser.Related_User__c'+orgGroupUser.Related_User__c);
    system.debug('@@@@@@@@@ogu'+orgGroupUser);
    //  system.debug('@@@@@@@@@userlist'+userlist);
        
             
        PAUserPopulation  userPopulation=new PAUserPopulation();        
        userPopulation.action();
        userPopulation.displayPopUpWindow();
        userPopulation.dosearch();
        userPopulation.returnData();
        userPopulation.closeWindow();
        PAUserPopulation  userPopulation2=new PAUserPopulation();   
         userPopulation2.salesOrgCodeFromPage='D630';
        userPopulation2.distCodeFromPage='10';
        userPopulation2.divisionCodeFromPage='02';         
        userPopulation2.assignedToFromPage='reassign';
        userPopulation2.buSelectedFromPage=(orgGroup1).id;   
        userPopulation2.action();
        userPopulation2.displayPopUpWindow();
        userPopulation2.dosearch();
        userPopulation2.returnData();
        userPopulation2.closeWindow();   
       
        PAUserPopulation  userPopulation1=new PAUserPopulation();
        userPopulation1.filter_name='Mark';
        userPopulation1.filter_email='ambili_vinay@infosys.com';
        userPopulation1.filter_country='UNITED KINGDOM';
        userPopulation1.filter_sapId='123353';
        userPopulation1.filter_epassId='rr9847';
        userPopulation1.salesOrgCodeFromPage='D630';
        userPopulation1.distCodeFromPage='10';
        userPopulation1.divisionCodeFromPage='02';
        userPopulation1.assignedToFromPage='assignedToFromPage';
        userPopulation1.buSelectedFromPage=(orgGroup1).id;
        userPopulation1.action();
        userPopulation1.displayPopUpWindow();
        userPopulation1.dosearch();
        userPopulation1.returnData();
        userPopulation1.closeWindow();  
        PAUserPopulation  userPopulation3=new PAUserPopulation();
        userPopulation3.filter_epassId='epass';
        userPopulation3.salesOrgCodeFromPage='D630';
        userPopulation3.distCodeFromPage='10';
        userPopulation3.divisionCodeFromPage='02';
        userPopulation3.assignedToFromPage='assignedToFromPage';
        userPopulation3.buSelectedFromPage=(orgGroup1).id;
        userPopulation3.action();
        userPopulation3.displayPopUpWindow();
        userPopulation3.dosearch();
        userPopulation3.returnData();
        userPopulation3.closeWindow();      
      } 
   }
}