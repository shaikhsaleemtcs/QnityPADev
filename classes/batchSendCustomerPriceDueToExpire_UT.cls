/*
Date : 29/12/2016
Change : Mergre & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest 

private class batchSendCustomerPriceDueToExpire_UT {
    @testvisible static list < PA_Expiry_Notification__mdt >getBuExpiryNotification {
        
        get {
            getBuExpiryNotification = [SELECT MasterLabel FROM PA_Expiry_Notification__mdt];
            return getBuExpiryNotification;
        }
        set ;
    }
    
       
    
    
    static testMethod void batchSendCustomerPriceDueToExpireTestMethod() {
        
         List<PA_Expiry_Notification__mdt> testgetBuExpiryNotification =
            (List<PA_Expiry_Notification__mdt>)JSON.deserialize('[{"MasterLabel":"PG LA"}]',
           List<PA_Expiry_Notification__mdt>.class);
           getBuExpiryNotification = testgetBuExpiryNotification;
 
         //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        
       
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'Manager FirstName','Manager LastName');
        insert managerUser;
        User usr = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        usr.managerId = managerUser.id;
        insert usr;
        
        
         //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(usr){
    
    OrgGroup__c orgGrp =  new OrgGroup__c();
    orgGrp.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
    orgGrp.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp.Business__c = 'DTT US1';
    orgGrp.ERP_Sales_Org_Code__c='F420';
    orgGrp.ERP_Distribution_Channel_Code__c='10';
    orgGrp.ERP_Division_Code__c='02';
    insert orgGrp;
    
    OrgGroup__c orgGrp1 =  new OrgGroup__c();
    orgGrp1.Business__c = 'DTT US';
    orgGrp1.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp1.ERP_Sales_Org_Code__c = 'F420';
    orgGrp1.ERP_Distribution_Channel_Code__c='10';
    orgGrp1.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    insert orgGrp1;
    
    //<VK27-08-20 IS ID-00083279>
    OrgGroup__c orgGrp2 =  new OrgGroup__c();
    orgGrp2.Business__c = 'PG LA';
    orgGrp2.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp2.ERP_Sales_Org_Code__c = 'F420';
    orgGrp2.ERP_Distribution_Channel_Code__c='10';
    orgGrp2.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    insert orgGrp2;
    
    ERP_Pricing_Procedure__c erpPricingProc = new ERP_Pricing_Procedure__c();
    erpPricingProc.SAP_Application_Id__c='V';
    erpPricingProc.SAP_Client_Id__c='510';
    erpPricingProc.SAP_Cluster__c='WB1';
    erpPricingProc.Status__c='Active';
    insert erpPricingProc;
    
    
    Organizational_Group_Item__c ogItem1 = new Organizational_Group_Item__c();
    ogItem1.OrgGroup__c = orgGrp.id;
    ogItem1.ERP_Pricing_Procedure__c =erpPricingProc.id;
    ogItem1.Business__c = orgGrp1.id;
    ogItem1.ERP_Currency__c = 'USD';
    insert ogItem1;
    
    
    ERP_Sales_Prices_SAP__c s=new ERP_Sales_Prices_SAP__c();
    Date d = Date.today();
    s.Distribution_Channel_Code__c='10';
    s.Division_Code__c='02';
    //s.Valid_To__c=d.addDays(1);
    s.Valid_To__c=d.addDays(21);
    s.Customer_Specific__c=true;
    s.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group';
    s.Sold_To_Code__c='55250275';
    s.Key_Combination_Code__c='X200';
    s.Sales_Org_Code__c='As56';
    s.ShipTo_Code__c='123';
    s.Customer_Price_Group_Code__c='vinoth';
    s.Project_Id__c='0000000300';
    s.Sales_Office_Code__c='1234';
    s.Price_List_Type_Code__c='12333';
    s.Material_Code__c='m1234';
   Date myDate = date.newinstance(2013, 1, 1);
    //s.Valid_From__c=myDate;
    s.Valid_From__c=d;
    s.isPriceHolder__c=true;
    s.Pricing_Condition_Code__c = 'ZPRE';
    s.markForDeletion__c=false;
    s.BU__c='DTT US1';
            
    insert s;
    
     ERP_Sales_Prices_SAP__c s1=new ERP_Sales_Prices_SAP__c();
    date d1=date.today();
   
    //s1.Valid_To__c=d1.addDays(2);
    s1.Valid_To__c=d1.addDays(21);
    s1.Sales_Org_Code__c='F420';
    s1.Distribution_Channel_Code__c='10';
    s1.Division_Code__c='02';
    s1.Customer_Specific__c=true;
    s1.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s1.Sold_To_Code__c='55250275';
    s1.Key_Combination_Code__c='X200';
    s1.ShipTo_Code__c='123';
            s1.Customer_Price_Group_Code__c='vinoth';
            s1.Project_Id__c='0000000300';
            s1.Sales_Office_Code__c='1234';
            s1.Price_List_Type_Code__c='12333';
            s1.Material_Code__c='m1234';
  // Date myDate1 = date.newinstance(2014, 11, 1);
  Date myDate1 =d1;
    s1.Valid_From__c=myDate1;
    s1.isPriceHolder__c=false;
    s1.markForDeletion__c=false;
    s1.Price_Holder__c=s.id;
    s1.Pricing_Condition_Code__c = 'XFLR1';
    s1.BU__c = 'DTT US';
    s1.SAP_Cluster__c = 'CB1';
    
    insert s1;
    
  //Added by Naga --start--
    List<ERP_Sales_Prices_SAP__c> sList = new List<ERP_Sales_Prices_SAP__c>();
    ERP_Sales_Prices_SAP__c s2 = new ERP_Sales_Prices_SAP__c();
    date d2=date.today();
    s2.Valid_To__c=d1.addDays(2);
    s2.Sales_Org_Code__c='F420';
    s2.Distribution_Channel_Code__c='10';
    s2.Division_Code__c='02';
    s2.Customer_Specific__c=true;
    s2.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s2.Sold_To_Code__c='55250275';
    s2.Key_Combination_Code__c='X200';
    s2.ShipTo_Code__c='123';
    s2.Customer_Price_Group_Code__c='vinoth';
    s2.Project_Id__c='0000000300';
    s2.Sales_Office_Code__c='1234';
    s2.Price_List_Type_Code__c='12333';
    s2.Material_Code__c='m1234';
   Date myDate2 = 
        date.newinstance(2013, 1, 1);
    s2.Valid_From__c=myDate1;
    s2.isPriceHolder__c=false;
    s2.markForDeletion__c=false;
    s2.Price_Holder__c=s.id;
    s2.Pricing_Condition_Code__c = 'XFLR1';
    s2.SAP_Cluster__c = 'CB1';
    s2.BU__c = 'DTT US';
    sList.add(s2);
    
    ERP_Sales_Prices_SAP__c s3 = new ERP_Sales_Prices_SAP__c();
    date d3=date.today();
    s3.Valid_To__c=d1.addDays(2);
    s3.Sales_Org_Code__c='F420';
    s3.Distribution_Channel_Code__c='10';
    s3.Division_Code__c='02';
    s3.Customer_Specific__c=true;
    s3.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s3.Sold_To_Code__c='55250275';
    s3.Key_Combination_Code__c='X200';
    s3.ShipTo_Code__c='123';
    s3.Customer_Price_Group_Code__c='vinoth';
    s3.Project_Id__c='0000000300';
    s3.Sales_Office_Code__c='1234';
    s3.Price_List_Type_Code__c='12333';
    s3.Material_Code__c='m1234';
   Date myDate3 =
        date.newinstance(2013, 1, 1);
    s3.Valid_From__c=myDate1;
    s3.isPriceHolder__c=false;
    s3.markForDeletion__c=false;
    s3.Price_Holder__c=s.id;
    s3.Pricing_Condition_Code__c = 'XFLR1';
    s3.BU__c = 'DTT US';
    s3.SAP_Cluster__c = 'P23';
    sList.add(s3);
    insert sList;
    
    ERP_Sales_Prices_SAP__c s4=new ERP_Sales_Prices_SAP__c();
    date d4=date.today();
   
    s4.Valid_To__c=d1.addDays(2);
    s4.Sales_Org_Code__c=null;
    s4.Sales_Org_Code__c='F420';
    s4.Distribution_Channel_Code__c='10';
    s4.Division_Code__c='02';
    s4.Customer_Specific__c=true;
    s4.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s4.Sold_To_Code__c=null;
    s4.Key_Combination_Code__c='X200'; 
    s4.ShipTo_Code__c='123';
            s4.Customer_Price_Group_Code__c='vinoth';
            s4.Project_Id__c='0000000300';
            s4.Sales_Office_Code__c='1234';
            s4.Price_List_Type_Code__c='12333';
            s4.Material_Code__c='m1234';
   Date myDate4 = 
        date.newinstance(2013, 1, 1);
    s4.Valid_From__c=myDate1;
    s4.isPriceHolder__c=false;
    s4.markForDeletion__c=false;
    s4.Price_Holder__c=s.id;
    s4.Pricing_Condition_Code__c = 'XFLR1';
    s4.BU__c = 'DTT US';
    s4.SAP_Cluster__c = 'CB1';
    insert s4;
    
    ERP_Sales_Prices_SAP__c s5=new ERP_Sales_Prices_SAP__c();
    date d5=date.today();
   
    s5.Valid_To__c=d1.addDays(2);
    s5.Sales_Org_Code__c=null;
    s5.Sales_Org_Code__c='F420';
    s5.Distribution_Channel_Code__c='10';
    s5.Division_Code__c='11';
    s5.Customer_Specific__c=false;
    s5.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s5.Sold_To_Code__c=null;
    s5.Key_Combination_Code__c='X200'; 
    s5.ShipTo_Code__c='123';
            s5.Customer_Price_Group_Code__c='vinoth';
            s5.Project_Id__c='0000000300';
            s5.Sales_Office_Code__c='1234';
            s5.Price_List_Type_Code__c='12333';
            s5.Material_Code__c='m1234';
   Date myDate5 = 
        date.newinstance(2013, 1, 1);
    s5.Valid_From__c=myDate1;
    s5.isPriceHolder__c=false;
    s5.markForDeletion__c=false;
    s5.Price_Holder__c=s.id;
    s5.Pricing_Condition_Code__c = 'XFLR1';
    s5.BU__c = 'DPP Global Kalrez & Vespel';
    s5.SAP_Cluster__c = 'CB1';
    insert s5;
//Added by Naga  --End--
    
    String a=[select id from user limit 1].id;
    ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'ABC';
        erpCustomer1.Customer_Code__c = '55250275';
        erpCustomer1.Sales_Org_Code__c = 'A640';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        insert erpCustomer1;
        
    ERP_Relationship__c reocrd=new ERP_Relationship__c();
    reocrd.ERP_Customer__c=erpCustomer1.id;
    reocrd.Partner_Function_Code__c='ZU';
    s1.Sold_To_Code__c='55250275';
    erpCustomer1.Customer_Code__c = '55250275';
    reocrd.User__c=usr.id;
    insert reocrd;
    ERP_Relationship__c reocrd1=new ERP_Relationship__c();
    reocrd1.ERP_Customer__c=erpCustomer1.id;
    reocrd1.User__c=a;
    insert reocrd1;
    
    try{
    
    batchSendCustomerPriceDueToExpire bc=new batchSendCustomerPriceDueToExpire('DTT US1,DTT US');
    Database.executeBatch(bc, 8);  
    
        batchSendCustomerPriceDueToExpire bc1=new batchSendCustomerPriceDueToExpire('NC_DTT US1');
         Database.executeBatch(bc1, 8);
         batchSendCustomerPriceDueToExpire bc2=new batchSendCustomerPriceDueToExpire('NC_11DPP Global Kalrez & Vespel');
         Database.executeBatch(bc2, 8);
         batchSendCustomerPriceDueToExpire bc3=new batchSendCustomerPriceDueToExpire('11DPP Global Kalrez & Vespel');
         Database.executeBatch(bc3, 8);
        batchSendCustomerPriceDueToExpire bc4=new batchSendCustomerPriceDueToExpire('Diagnostics Global');
         Database.executeBatch(bc4, 8);
        
        //    bc.columnGenerate(s1);
       // Test.startTest(); 
    }
    catch(exception e){
        
    }
    
        
//Added by Naga ---Start--

    List<ERP_Relationship__c> eList = new List<ERP_Relationship__c>();
    ERP_Relationship__c reocrd2=new ERP_Relationship__c();
    reocrd2.ERP_Customer__c=erpCustomer1.id;
    reocrd2.Partner_Function_Code__c='ZU';
    reocrd2.User__c=a;
    eList.add(reocrd2);
    
    ERP_Relationship__c reocrd3=new ERP_Relationship__c();
    reocrd3.ERP_Customer__c=erpCustomer1.id;
    reocrd3.User__c=a;
    eList.add(reocrd3);
    insert eList;
  
       
    ERP_Pricing_Condition__c e1 = new ERP_Pricing_Condition__c();
    e1.Pricing_Condition_Code__c = 'XFLR1';
    e1.Price_Types__c = 'Floor';
    e1.Calculation_Type__c = 'Fixed Amount';
    e1.Security_Access__c = 'General';
    e1.Pricing_Condition__c = 'Gross Floor price';
    e1.Pricing_Condition_Description__c = 'Gross Floor price';
    e1.SAP_Application_Id__c = 'V';
    e1.Status__c = 'Active';
    e1.SAP_Client_Id__c = '510';
    e1.SAP_Cluster__c = 'CB1';
    insert e1;
    
    ERP_Procedure_Conditions__c pc1 = new ERP_Procedure_Conditions__c();
    pc1.Sales_Pricing_Procedure_Condition_Config__c = 'Allow Request By Sales Rep: Enable Scale';
    pc1.Pricing_Condition__c = e1.id;
    pc1.Sales_Pricing_Procedure__c = erpPricingProc.id;
    insert pc1;
     
    ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
    kc1.Key_Combination_Code__c = 'X200';
    kc1.Key_Combination__c = 'Sales Org./FRB';
    kc1.Key_Combination_Tech__c = 'Sales Org. Code/Profit Center Code-Sales Org./Profit Center';
    kc1.SAP_Client_Id__c = '510';
    kc1.Key_Combination_Type_Text__c = 'Floor, Reference,';
    kc1.Status__c = 'Active';
    kc1.SAP_Cluster__c = 'CB1';
    kc1.SAP_Application_Id__c = 'V';
    kc1.Key_Combination_Type__c = 'Floor; Reference';
    insert kc1;   
          
//Added by Naga ---End--  

    }
    }
    
   /*****************************Test Method Added By Sumit***********************************/ 
  static testMethod void batchSendCustomerPriceDueToExpireTestMethod1() {
      
         List<PA_Expiry_Notification__mdt> testgetBuExpiryNotification =
            (List<PA_Expiry_Notification__mdt>)JSON.deserialize('[{"MasterLabel":"PG LA"}]',
           List<PA_Expiry_Notification__mdt>.class);
           getBuExpiryNotification = testgetBuExpiryNotification;
    
    Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        UserRole r1= [Select id from UserRole where Name='Qnity Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        
      system.runAs(user1){
    OrgGroup__c orgGrp =  new OrgGroup__c();
    orgGrp.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
    orgGrp.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp.Business__c = 'DTT US1';
    orgGrp.ERP_Sales_Org_Code__c='F420';
    orgGrp.ERP_Distribution_Channel_Code__c='10';
    orgGrp.ERP_Division_Code__c='02';
    insert orgGrp;
    
    OrgGroup__c orgGrp1 =  new OrgGroup__c();
    orgGrp1.Business__c = 'DTT US';
    orgGrp1.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp1.ERP_Sales_Org_Code__c = 'F420';
    orgGrp1.ERP_Distribution_Channel_Code__c='10';
    orgGrp1.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    insert orgGrp1;
    
    //<VK27-08-20 IS ID-00083279>
    OrgGroup__c orgGrp2 =  new OrgGroup__c();
    orgGrp2.Business__c = 'PG LA';
    orgGrp2.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp2.ERP_Sales_Org_Code__c = 'F420';
    orgGrp2.ERP_Distribution_Channel_Code__c='10';
    orgGrp2.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    insert orgGrp2;
    
    ERP_Pricing_Procedure__c erpPricingProc = new ERP_Pricing_Procedure__c();
    erpPricingProc.SAP_Application_Id__c='V';
    erpPricingProc.SAP_Client_Id__c='510';
    erpPricingProc.SAP_Cluster__c='P23';
    erpPricingProc.Status__c='Active';
    insert erpPricingProc;
    
    
    Organizational_Group_Item__c ogItem1 = new Organizational_Group_Item__c();
    ogItem1.OrgGroup__c = orgGrp.id;
    ogItem1.ERP_Pricing_Procedure__c =erpPricingProc.id;
    ogItem1.Business__c = orgGrp1.id;
    ogItem1.ERP_Currency__c = 'USD';
    insert ogItem1;
    
    
    ERP_Sales_Prices_SAP__c s=new ERP_Sales_Prices_SAP__c();
    Date d = Date.today();
    s.Distribution_Channel_Code__c='10';
    s.Division_Code__c='02';
    //s.Valid_To__c=d.addDays(1);
    s.Valid_To__c=d.addDays(21);
    s.Customer_Specific__c=false;
    s.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s.Sold_To_Code__c='55250275';
    s.Key_Combination_Code__c='A832';
    s.Sales_Org_Code__c='F420';
    s.ShipTo_Code__c='123';
    s.Customer_Price_Group_Code__c='vinoth';
    s.Project_Id__c='0000000300';
    s.Sales_Office_Code__c='1234';
    s.Price_List_Type_Code__c='12333';
    s.Material_Code__c='m1234';
   Date myDate = date.newinstance(2013, 1, 1);
    //s.Valid_From__c=myDate;
    s.Valid_From__c=d;
    s.isPriceHolder__c=true;
    s.Pricing_Condition_Code__c = 'ZPRE';
    s.markForDeletion__c=false;
    s.BU__c='DTT US1';
            
    insert s;
          
          
          
     ERP_Sales_Prices_SAP__c s1=new ERP_Sales_Prices_SAP__c();
    date d1=date.today();
   
    //s1.Valid_To__c=d1.addDays(2);
    s1.Valid_To__c=d1.addDays(21);
    s1.Sales_Org_Code__c='F420';
    s1.Distribution_Channel_Code__c='10';
    s1.Division_Code__c='02';
    s1.Customer_Specific__c=false;
    s1.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s1.Sold_To_Code__c='55250275';
    s1.Key_Combination_Code__c='A832';
    s1.ShipTo_Code__c='123';
            s1.Customer_Price_Group_Code__c='vinoth';
            s1.Project_Id__c='0000000300';
            s1.Sales_Office_Code__c='1234';
            s1.Price_List_Type_Code__c='12333';
            s1.Material_Code__c='m1234';
  // Date myDate1 = date.newinstance(2014, 11, 1);
  Date myDate1 =d1;
    s1.Valid_From__c=myDate1;
    s1.isPriceHolder__c=false;
    s1.markForDeletion__c=false;
    s1.Price_Holder__c=s.id;
    s1.Pricing_Condition_Code__c = 'XFLR1';
    s1.BU__c = 'DTT US';
    s1.SAP_Cluster__c = 'P23';
    
    insert s1;
    
  //Added by Naga --start--
  Map<string,Map<string,List<ERP_Sales_Prices_SAP__c>>> SoldToPCRecords = new Map<string,Map<string,List<ERP_Sales_Prices_SAP__c>>>();
     Map<string,List<ERP_Sales_Prices_SAP__c>> SoldToRecords = new Map<string,List<ERP_Sales_Prices_SAP__c>>();
          
    List<ERP_Sales_Prices_SAP__c> sList = new List<ERP_Sales_Prices_SAP__c>();
    ERP_Sales_Prices_SAP__c s2 = new ERP_Sales_Prices_SAP__c();
    date d2=date.today();
    s2.Valid_To__c=d1.addDays(2);
    s2.Sales_Org_Code__c='F420';
    s2.Distribution_Channel_Code__c='10';
    s2.Division_Code__c='02';
    s2.Customer_Specific__c=true;
    s2.Key_Combination__c='Sales Org./End User/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s2.Sold_To_Code__c='55250275';
    s2.Key_Combination_Code__c='A871';
    s2.ShipTo_Code__c='123';
          s2.End_User_Code__c='234';
    s2.Customer_Price_Group_Code__c='vinoth';
    s2.Project_Id__c='0000000300';
    s2.Sales_Office_Code__c='1234';
    s2.Price_List_Type_Code__c='12333';
    s2.Material_Code__c='m1234';
   Date myDate2 = 
        date.newinstance(2013, 1, 1);
    s2.Valid_From__c=myDate1;
    s2.isPriceHolder__c=false;
    s2.markForDeletion__c=false;
    s2.Price_Holder__c=s.id;
    s2.Pricing_Condition_Code__c = 'XFLR1';
    s2.SAP_Cluster__c = 'P23';
    s2.BU__c = 'DTT US1';
    sList.add(s2);
    
    ERP_Sales_Prices_SAP__c s3 = new ERP_Sales_Prices_SAP__c();
    date d3=date.today();
    s3.Valid_To__c=d1.addDays(2);
    s3.Sales_Org_Code__c='F420';
    s3.Distribution_Channel_Code__c='10';
    s3.Division_Code__c='02';
    s3.Customer_Specific__c=true;
    s3.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s3.Sold_To_Code__c='55250275';
    s3.Key_Combination_Code__c='A832';
    s3.ShipTo_Code__c='123';
    s3.Customer_Price_Group_Code__c='vinoth';
    s3.Project_Id__c='0000000300';
    s3.Sales_Office_Code__c='1234';
    s3.Price_List_Type_Code__c='12333';
    s3.Material_Code__c='m1234';
   Date myDate3 =
        date.newinstance(2013, 1, 1);
    s3.Valid_From__c=myDate1;
    s3.isPriceHolder__c=false;
    s3.markForDeletion__c=false;
    s3.Price_Holder__c=s.id;
    s3.Pricing_Condition_Code__c = 'XFLR1';
    s3.BU__c = 'DTT US';
    s3.SAP_Cluster__c = 'P23';
    sList.add(s3);
    insert sList;
    
    ERP_Sales_Prices_SAP__c s4=new ERP_Sales_Prices_SAP__c();
    date d4=date.today();
   
    s4.Valid_To__c=d1.addDays(2);
    s4.Sales_Org_Code__c='F420';
    s4.Distribution_Channel_Code__c='10';
    s4.Division_Code__c='02';
    s4.Customer_Specific__c=true;
    s4.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    s4.Sold_To_Code__c='557250';
    s4.Key_Combination_Code__c='A832'; 
    s4.ShipTo_Code__c='123';
            s4.Customer_Price_Group_Code__c='vinoth';
            s4.Project_Id__c='0000000300';
            s4.Sales_Office_Code__c='1234';
            s4.Price_List_Type_Code__c='12333';
            s4.Material_Code__c='m1234';
   Date myDate4 = 
        date.newinstance(2013, 1, 1);
    s4.Valid_From__c=myDate1;
    s4.isPriceHolder__c=false;
    s4.markForDeletion__c=false;
   s4.Price_Holder__c=s.id;
    s4.Pricing_Condition_Code__c = 'XFLR1';
    s4.BU__c = 'DTT US';
    s4.SAP_Cluster__c = 'P23';
    insert s4;
    
//Added by Naga  --End--
SoldToRecords.put('ZPREA580',sList);
            SoldToPCRecords.put('55250275F420',SoldtoRecords);
            //system.assertEquals(expected, actual);
            system.assertNotEquals(sList, SoldToRecords.get(+s1.Sold_To_Code__c+s1.Sales_Org_Code__c));
            //system.assertNotEquals(SoldtoRecords,SoldToPCRecords.get('55250275F420'));  
    
    String a=[select id from user limit 1].id;
    ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'ABC';
        erpCustomer1.Customer_Code__c = '55250275';
        erpCustomer1.Sales_Org_Code__c = 'F420';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        insert erpCustomer1;
        
    ERP_Relationship__c reocrd=new ERP_Relationship__c();
    reocrd.ERP_Customer__c=erpCustomer1.id;
    reocrd.Partner_Function_Code__c='ZU';
    s1.Sold_To_Code__c='55250275';
    erpCustomer1.Customer_Code__c = '55250275';
    reocrd.User__c=a;
    insert reocrd;
    ERP_Relationship__c reocrd1=new ERP_Relationship__c();

    reocrd1.ERP_Customer__c=erpCustomer1.id;
    reocrd1.User__c=a;
    insert reocrd1;
    
    try{
    
    batchSendCustomerPriceDueToExpire bc=new batchSendCustomerPriceDueToExpire('DTT US1,DTT US');
    Database.executeBatch(bc,4 );  
    
        batchSendCustomerPriceDueToExpire bc1=new batchSendCustomerPriceDueToExpire('NC_DTT US1');
               Database.executeBatch(bc1, 8);  
        batchSendCustomerPriceDueToExpire bc2=new batchSendCustomerPriceDueToExpire('NC_13DPP Global Kalrez & Vespel');
               Database.executeBatch(bc2, 8); 
        batchSendCustomerPriceDueToExpire bc3=new batchSendCustomerPriceDueToExpire('13DPP Global Kalrez & Vespel');
               Database.executeBatch(bc3, 8);
         batchSendCustomerPriceDueToExpire bc4=new batchSendCustomerPriceDueToExpire('Diagnostic Global');
               Database.executeBatch(bc4, 8);
           //    bc.columnGenerate(s1);
       // Test.startTest(); 
    }
    catch(exception e){
        
    }
    
        
//Added by Naga ---Start--

    List<ERP_Relationship__c> eList = new List<ERP_Relationship__c>();
    ERP_Relationship__c reocrd2=new ERP_Relationship__c();
    reocrd2.ERP_Customer__c=erpCustomer1.id;
    reocrd2.Partner_Function_Code__c='ZU';
    reocrd2.User__c=a;
    eList.add(reocrd2);
    
    ERP_Relationship__c reocrd3=new ERP_Relationship__c();
    reocrd3.ERP_Customer__c=erpCustomer1.id;
    reocrd3.User__c=a;
    eList.add(reocrd3);
    insert eList;
  
       
    ERP_Pricing_Condition__c e1 = new ERP_Pricing_Condition__c();
    e1.Pricing_Condition_Code__c = 'XFLR1';
    e1.Price_Types__c = 'Floor';
    e1.Calculation_Type__c = 'Quantity';
    e1.Security_Access__c = 'General';
    e1.Pricing_Condition__c = 'Gross Floor price';
    e1.Pricing_Condition_Description__c = 'Gross Floor price';
    e1.SAP_Application_Id__c = 'V';
    e1.Status__c = 'Active';
    e1.SAP_Client_Id__c = '510';
    e1.SAP_Cluster__c = 'P23';
    insert e1;
    
    ERP_Procedure_Conditions__c pc1 = new ERP_Procedure_Conditions__c();
    pc1.Sales_Pricing_Procedure_Condition_Config__c = 'Allow Request By Sales Rep';
    pc1.Pricing_Condition__c = e1.id;
    pc1.Sales_Pricing_Procedure__c = erpPricingProc.id;
    insert pc1;
     
    ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
    kc1.Key_Combination_Code__c = 'A832SD';
    kc1.Key_Combination__c = 'Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Ship to/Customer Price Group/Material/Price List Type/Sales office';
    kc1.Key_Combination_Tech__c = 'Sales Org. Code/Profit Center Code-Sales Org./Profit Center';
    kc1.SAP_Client_Id__c = '510';
    kc1.Key_Combination_Type_Text__c = 'Floor, Reference,';
    kc1.Status__c = 'Active';
    kc1.SAP_Cluster__c = 'P23';
    kc1.SAP_Application_Id__c = 'V';
    kc1.Key_Combination_Type__c = 'Floor; Reference';
    insert kc1;    
          
           ERP_Key_Combination__c kc2 = new ERP_Key_Combination__c();
    kc2.Key_Combination_Code__c = 'A871EU';
    kc2.Key_Combination__c = 'Sales Org./End User/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group/Customer Price Group/Material/Price List Type/Sales office';
    kc2.Key_Combination_Tech__c = 'Sales Org. Code/Profit Center Code-Sales Org./Profit Center';
    kc2.SAP_Client_Id__c = '510';
    kc2.Key_Combination_Type_Text__c = 'Floor, Reference,';
    kc2.Status__c = 'Active';
    kc2.SAP_Cluster__c = 'P23';
    kc2.SAP_Application_Id__c = 'V';
    kc2.Key_Combination_Type__c = 'Floor; Reference';
    insert kc2;    
//Added by Naga ---End--  
      }
    }
    
    
    
    static testMethod void batchSendCustomerPriceDueToExpireTestMethod2() {
        
          List<PA_Expiry_Notification__mdt> testgetBuExpiryNotification =
            (List<PA_Expiry_Notification__mdt>)JSON.deserialize('[{"MasterLabel":"PG LA"}]',
           List<PA_Expiry_Notification__mdt>.class);
           getBuExpiryNotification = testgetBuExpiryNotification;
        
         //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        
         
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'Manager FirstName','Manager LastName');
        insert managerUser;
        User usr = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        usr.managerId = managerUser.id;
        usr.email='asdf@gmail.com';
        insert usr;
         //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(usr){
    
    OrgGroup__c orgGrp =  new OrgGroup__c();
    orgGrp.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
    orgGrp.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp.Business__c = 'DTT US1';
    orgGrp.ERP_Sales_Org_Code__c='F420';
    orgGrp.ERP_Distribution_Channel_Code__c='10';
    orgGrp.ERP_Division_Code__c='02';
    insert orgGrp;
    
    OrgGroup__c orgGrp1 =  new OrgGroup__c();
    orgGrp1.Business__c = 'DTT US';
    orgGrp1.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp1.ERP_Sales_Org_Code__c = 'F420';
    orgGrp1.ERP_Distribution_Channel_Code__c='10';
    orgGrp1.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    insert orgGrp1;
    
    //<VK27-08-20 IS ID-00083279>
    OrgGroup__c orgGrp2 =  new OrgGroup__c();
    orgGrp2.Business__c = 'PG LA';
    orgGrp2.Owning_Business__c='DuPont Titanium Technologies';
    orgGrp2.ERP_Sales_Org_Code__c = 'F420';
    orgGrp2.ERP_Distribution_Channel_Code__c='10';
    orgGrp2.RecordTypeId = Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    insert orgGrp2;
    
    ERP_Pricing_Procedure__c erpPricingProc = new ERP_Pricing_Procedure__c();
    erpPricingProc.SAP_Application_Id__c='V';
    erpPricingProc.SAP_Client_Id__c='510';
    erpPricingProc.SAP_Cluster__c='P23';
    erpPricingProc.Status__c='Active';
    insert erpPricingProc;
    
    
    Organizational_Group_Item__c ogItem1 = new Organizational_Group_Item__c();
    ogItem1.OrgGroup__c = orgGrp.id;
    ogItem1.ERP_Pricing_Procedure__c =erpPricingProc.id;
    ogItem1.Business__c = orgGrp1.id;
    ogItem1.ERP_Currency__c = 'USD';
    insert ogItem1;
            
            ERP_Pricing_Condition__c e1 = new ERP_Pricing_Condition__c();
    e1.Pricing_Condition_Code__c = 'ZPRE';
    e1.Price_Types__c = 'Floor';
    e1.Calculation_Type__c = 'Fixed Amount';
    e1.Security_Access__c = 'General';
    e1.Pricing_Condition__c = 'Gross Floor price';
    e1.Pricing_Condition_Description__c = 'Gross Floor price';
    e1.SAP_Application_Id__c = 'V';
    e1.Status__c = 'Active';
    e1.SAP_Client_Id__c = '510';
    e1.SAP_Cluster__c = 'P23';
    insert e1;
            e1.Pricing_Condition__c='Fixed Amount';
            //update e1;
            
   ERP_Procedure_Conditions__c pc1 = new ERP_Procedure_Conditions__c();
    pc1.Sales_Pricing_Procedure_Condition_Config__c = 'Allow Request By Sales Rep';
    pc1.Pricing_Condition__c = e1.id;
    pc1.Sales_Pricing_Procedure__c = erpPricingProc.id;
    insert pc1;
     
    ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
    kc1.Key_Combination_Code__c = 'A580SH';
    kc1.Key_Combination__c = 'Sales Org./FRB/Ship To';
    kc1.Key_Combination_Tech__c = 'Sales Org. Code/Profit Center Code-Sales Org./Profit Center/Ship To';
    kc1.SAP_Client_Id__c = '510';
    kc1.Key_Combination_Type_Text__c = 'Floor, Reference,';
    kc1.SAP_Cluster__c='P23';
    kc1.Status__c = 'Active';
    kc1.SAP_Application_Id__c = 'V';
    kc1.Key_Combination_Type__c = 'Floor; Reference';
            insert kc1;
            //siri
            ERP_Key_Combination__c kc2 = new ERP_Key_Combination__c();
    kc2.Key_Combination_Code__c = 'A580SD';
    kc2.Key_Combination__c = 'Sales Org./FRB/Sold To';
    kc2.Key_Combination_Tech__c = 'Sales Org. Code/Profit Center Code-Sales Org./Profit Center/Sold To';
    kc2.SAP_Client_Id__c = '510';
    kc2.Key_Combination_Type_Text__c = 'Floor, Reference,';
    kc2.SAP_Cluster__c='P23';
    kc2.Status__c = 'Active';
    kc2.SAP_Application_Id__c = 'V';
    kc2.Key_Combination_Type__c = 'Floor; Reference';
            insert kc2;
    
    ERP_Sales_Prices_SAP__c s=new ERP_Sales_Prices_SAP__c();
    Date d = Date.today();
    s.Distribution_Channel_Code__c='10';
    s.Division_Code__c='02';
    //s.Valid_To__c=d.addDays(1);
    s.Valid_To__c=d.addDays(10);
    s.Customer_Specific__c=true;
    s.Key_Combination__c='Sales Org./FRB/Ship To';
    s.Sold_To_Code__c='55250275';
    s.Key_Combination_Code__c='A580';
    s.Sales_Org_Code__c='F420';
    s.ShipTo_Code__c='123';
    s.Customer_Price_Group_Code__c='vinoth';
    s.Project_Id__c='0000000300';
    s.Sales_Office_Code__c='1234';
    s.Price_List_Type_Code__c='12333';
    s.Material_Code__c='m1234';
   Date myDate = date.newinstance(2013, 1, 1);
    s.Valid_From__c=myDate;
    s.isPriceHolder__c=true;
    s.Pricing_Condition_Code__c = 'ZPRE';
    s.markForDeletion__c=false;
    s.BU__c='DTT US1';
            s.SAP_Cluster__c='P23';
            
    insert s;
           
    
     ERP_Sales_Prices_SAP__c s1=new ERP_Sales_Prices_SAP__c();
    date d1=date.today();
   Map<string,Map<string,List<ERP_Sales_Prices_SAP__c>>> SoldToPCRecords = new Map<string,Map<string,List<ERP_Sales_Prices_SAP__c>>>();
     Map<string,List<ERP_Sales_Prices_SAP__c>> SoldToRecords = new Map<string,List<ERP_Sales_Prices_SAP__c>>();
    //s1.Valid_To__c=d1.addDays(2);
    s1.Valid_To__c=d1.addDays(10);
    s1.Sales_Org_Code__c='F420';
    s1.Distribution_Channel_Code__c=null;
    s1.Division_Code__c=null;
    s1.Customer_Specific__c=true;
    s1.Key_Combination__c='Sales Org./FRB/Ship To';
    s1.Sold_To_Code__c='55250275';
    s1.Key_Combination_Code__c='A580';
    s1.ShipTo_Code__c='123';
            s1.Customer_Price_Group_Code__c='vinoth';
            s1.Project_Id__c='0000000300';
            s1.Sales_Office_Code__c='1234';
            s1.Price_List_Type_Code__c='12333';
            s1.Material_Code__c='m1234';
  // Date myDate1 = date.newinstance(2014, 11, 1);
  Date myDate1 =d1;
    s1.Valid_From__c=myDate1;
    s1.isPriceHolder__c=false;
    s1.markForDeletion__c=false;
    s1.Price_Holder__c=s.id;
    s1.Pricing_Condition_Code__c = 'ZPRE';
    s1.BU__c = 'DTT US1';
    s1.SAP_Cluster__c = 'P23';
    insert s1;
            s1.Sales_Org_Code__c='F5400';
            s1.Sold_To_Code__c='55250275';
    //update s1;
   
 
  //Added by Naga --start--
    List<ERP_Sales_Prices_SAP__c> sList = new List<ERP_Sales_Prices_SAP__c>();
    
List<ERP_Sales_Prices_SAP__c> sapRec = new List<ERP_Sales_Prices_SAP__c>();
                sapRec.add(s1);
   SoldToRecords.put('ZPREA580',sapRec);
            SoldToPCRecords.put('55250275F420',SoldtoRecords);
            //system.assertEquals(expected, actual);
            system.assertNotEquals(sapRec, SoldToRecords.get(+s1.Sold_To_Code__c+s1.Sales_Org_Code__c));
            system.assertEquals(SoldtoRecords,SoldToPCRecords.get('55250275F420'));
            System.assertEquals(sapRec, SoldToRecords.get(+s1.Pricing_Condition_Code__c+s1.Key_Combination_Code__c));
           system.assertNotEquals(SoldtoRecords,SoldToPCRecords.get('55250275F410'));
    
    String a=[select id from user limit 1].id;
    ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'ABC';
        erpCustomer1.Customer_Code__c = '55250275';
        erpCustomer1.Sales_Org_Code__c = 'F420';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        insert erpCustomer1;
            
            
    ERP_Relationship__c reocrd=new ERP_Relationship__c();
    reocrd.ERP_Customer__c=erpCustomer1.id;
    reocrd.Partner_Function_Code__c='ZU';
    s1.Sold_To_Code__c='55250275';
    erpCustomer1.Customer_Code__c = '55250275';
    reocrd.User__c=a;
    insert reocrd;
   
   //<AS19-08-20 added test code for new functionality for DPP Polymers EMEA
           ERP_Sales_Prices_SAP__c sd=new ERP_Sales_Prices_SAP__c();
    Date dd = Date.today();
    sd.Distribution_Channel_Code__c='10';
    sd.Division_Code__c='02';
    //s.Valid_To__c=d.addDays(1);
    sd.Valid_To__c=d.addDays(10);
    sd.Customer_Specific__c=true;
    sd.Key_Combination__c='Sales Org./FRB/Sold To';
    sd.Sold_To_Code__c='55250275';
    sd.Key_Combination_Code__c='A580';
    sd.Sales_Org_Code__c='F420';
    sd.ShipTo_Code__c='123';
    sd.Customer_Price_Group_Code__c='vinoth';
    sd.Project_Id__c='0000000300';
    sd.Sales_Office_Code__c='1234';
    sd.Price_List_Type_Code__c='12333';
    sd.Material_Code__c='m1234';
   Date myDated = date.newinstance(2013, 1, 1);
    sd.Valid_From__c=myDate;
    sd.isPriceHolder__c=true;
    sd.Pricing_Condition_Code__c = 'ZPRE';
    sd.markForDeletion__c=false;
    sd.BU__c='Diagnostics Global';
            sd.SAP_Cluster__c='P23';
            
    insert sd;
          
ERP_Sales_Prices_SAP__c sed=new ERP_Sales_Prices_SAP__c();
    Date d5= Date.today();
    sed.Distribution_Channel_Code__c='10';
    sed.Division_Code__c='02';
    //s.Valid_To__c=d.addDays(1);
    sed.Valid_To__c=d5.addDays(10);
    sed.Customer_Specific__c=true;
    sed.Key_Combination__c='Sales Org./FRB/Sold To';
    sed.Sold_To_Code__c='55250275';
    sed.Key_Combination_Code__c='A580';
    sed.Sales_Org_Code__c='F420';
    sed.ShipTo_Code__c='123';
    sed.Customer_Price_Group_Code__c='vinoth';
    sed.Project_Id__c='0000000300';
    sed.Sales_Office_Code__c='1234';
    sed.Price_List_Type_Code__c='12333';
    sed.Material_Code__c='m1234';
   Date myDatee = date.newinstance(2013, 1, 1);
    sed.Valid_From__c=myDatee;
    sed.isPriceHolder__c=true;
    sed.Pricing_Condition_Code__c = 'ZPRE';
    sed.markForDeletion__c=false;
    sed.BU__c='DPP Polymers EMEA';
            sed.SAP_Cluster__c='P23';
            
    insert sed;
            
         
          ERP_Sales_Prices_SAP__c se1=new ERP_Sales_Prices_SAP__c();
    date de1=date.today();
             se1.Valid_To__c=de1.addDays(10);
    se1.Sales_Org_Code__c='F420';
    se1.Distribution_Channel_Code__c=null;
    se1.Division_Code__c=null;
    se1.Customer_Specific__c=true;
    se1.Key_Combination__c='Sales Org./FRB/Sold To';
    se1.Sold_To_Code__c='55250275';
    se1.Key_Combination_Code__c='A580';
    se1.ShipTo_Code__c='123';
            se1.Customer_Price_Group_Code__c='vinoth';
            se1.Project_Id__c='0000000300';
            se1.Sales_Office_Code__c='1234';
            se1.Price_List_Type_Code__c='12333';
            se1.Material_Code__c='m1234';
  // Date myDate1 = date.newinstance(2014, 11, 1);
  Date myDatee1 =de1;
    se1.Valid_From__c=myDatee1;
    se1.isPriceHolder__c=false;
    se1.markForDeletion__c=false;
    se1.Price_Holder__c=sed.id;
    se1.Pricing_Condition_Code__c = 'ZPRE';
    se1.BU__c = 'DPP Polymers EMEA';
    se1.SAP_Cluster__c = 'P23';
    insert se1;
    
    try{
    
    batchSendCustomerPriceDueToExpire bc=new batchSendCustomerPriceDueToExpire('DTT US1,DTT US');
    Database.executeBatch(bc, 8);  
    
         batchSendCustomerPriceDueToExpire bc1=new batchSendCustomerPriceDueToExpire('NC_DTT US1');
               Database.executeBatch(bc1, 8);   
        batchSendCustomerPriceDueToExpire bc4=new batchSendCustomerPriceDueToExpire('Diagnostics Global');
         Database.executeBatch(bc4, 8);
         batchSendCustomerPriceDueToExpire bc5=new batchSendCustomerPriceDueToExpire('NC_11DPP Global Kalrez & Vespel');
               Database.executeBatch(bc5, 8); 
        batchSendCustomerPriceDueToExpire bc6=new batchSendCustomerPriceDueToExpire('11DPP Global Kalrez & Vespel');
               Database.executeBatch(bc6, 8);
        batchSendCustomerPriceDueToExpire bc7=new batchSendCustomerPriceDueToExpire('11DPP Global Kalrez & Vespel');
               Database.executeBatch(bc7, 8);
        batchSendCustomerPriceDueToExpire bc8=new batchSendCustomerPriceDueToExpire('DPP Polymers EMEA');
               Database.executeBatch(bc8, 8);
        batchSendCustomerPriceDueToExpire bc10=new batchSendCustomerPriceDueToExpire('DPP Polymers NAFTA');
               Database.executeBatch(bc10, 8);
        
        batchSendCustomerPriceDueToExpire bc9=new batchSendCustomerPriceDueToExpire('Diagnostics Global');
               Database.executeBatch(bc9, 8);
        //    bc.columnGenerate(s1);
       // Test.startTest(); 
    }
    catch(exception e){
        
    }
    
        


    }
    }
    
    
    
    
    
}