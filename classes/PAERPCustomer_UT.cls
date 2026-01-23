// Please dont edit this class - if this is throwing any error please inform nitin_s01@infosys.com
/*
Date : 29/12/2016
Change : Mergre & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest()
private class PAERPCustomer_UT 
{       
    static testMethod void paERPCustomerTestMethod() 
    {
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(FirstName='ABC',LastName='XYZ',E_Pass_ID__c='uh1234',External_ERP_ID__c='12345',User_Country__c='India',Email='test@dupont.com',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id,IsActive = true);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId=managerUser.Id;
        insert user1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(user1){
       
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;

        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;

        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='CPM NA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D693';
        orgGrp1.ERP_Sales_Org_Code__c='D693';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        orgGrp1.ERP_Division__c='D693';
        insert orgGrp1;
                
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Attachments_on_Customer_Prices__c=true;
        orgGrpItm.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm.Customer_Request_Reasons__c ='New customer';
        orgGrpItm.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm;    
 
        // Organizational_Group_User__c orgGrpUserList = new List<Organizational_Group_User__c>();
        Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
        //orgGrpUser1.Name = 'OGU-10442';
        orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
        orgGrpUser1.OrgGroup__c = orgGrp1.Id;
        orgGrpUser1.Related_User__c = user1.Id;
        orgGrpUser1.Access_Level__c = 'Read-Write';
        orgGrpUser1.Description__c = 'ZU';
        insert orgGrpUser1;
        
        Organization_Group_Users_Frequent__c oguf = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Customer',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf;
        
        Organization_Group_Users_Frequent__c oguf1 = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Sales Rep',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf1;
        
        
        PADummycustomerMapping__c pacustmap = new PADummycustomerMapping__c();
        pacustmap.Name='CPM';
        pacustmap.Business__c='CPM NA';
        pacustmap.Customer_Code__c='52323';
        pacustmap.Sales_Org__c='F240';
        insert pacustmap;
        
        List<PAProfilePermissions__c> profilePSList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        paProfilePermissions.API_Name__c = 'Price_Approval_Sales_Admin';
        profilePSList.add(paProfilePermissions); //insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        profilePSList.add(paProfilePermissions1); //insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        profilePSList.add(paProfilePermissions2); //insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        profilePSList.add(paProfilePermissions3); //insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        profilePSList.add(paProfilePermissions4);  //insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        profilePSList.add(paProfilePermissions5); //insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        profilePSList.add(paProfilePermissions6); //insert paProfilePermissions6;
        insert profilePSList;
        
        PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;
        
        // Load the test Pricing Request data from the static resource
        List<ERP_Customer__c> erpCustomerList = new List<ERP_Customer__c>();
        ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'soldto';
        erpCustomer1.Customer_Code__c = 'soldtocode';
        erpCustomer1.Sales_Org_Code__c = 'D693';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        erpCustomer1.Country__c='India';
        erpCustomer1.Account_Group_Code__c ='Z001';
        erpCustomer1.Deletion_Flag__c=false;
        erpCustomer1.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer1.City__c = 'Blore';
        insert erpCustomer1;
        
        ERP_Customer__c erpCustomer2 = new ERP_Customer__c();
        erpCustomer2.Name= 'soldto';
        erpCustomer2.Customer_Code__c = 'soldtocode';
        erpCustomer2.Sales_Org_Code__c = 'D693';
        erpCustomer2.Distribution_Channel_Code__c = '10';
        erpCustomer2.Division_Code__c = '02';
        erpCustomer2.Country__c='India';
        erpCustomer2.Account_Group_Code__c ='Z001';
        erpCustomer2.Deletion_Flag__c=false;
        erpCustomer2.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer2.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer2.City__c = 'Blore';
        insert erpCustomer2;
        
        ERP_Customer__c erpCustomer3 = new ERP_Customer__c();
        erpCustomer3.Name= 'soldto';
        erpCustomer3.Customer_Code__c = 'soldtocode';
        erpCustomer3.Sales_Org_Code__c = 'D693';
        erpCustomer3.Distribution_Channel_Code__c = '10';
        erpCustomer3.Division_Code__c = '02';
        erpCustomer3.Country__c='India';
        erpCustomer3.Account_Group_Code__c ='Z001';
        erpCustomer3.Deletion_Flag__c=false;
        erpCustomer3.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer3.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer3.City__c = 'Blore';
        insert erpCustomer3;
        
        ERP_Customer__c erpCustomer4 = new ERP_Customer__c();
        erpCustomer4.Name= 'soldto';
        erpCustomer4.Customer_Code__c = '10';
        erpCustomer4.Sales_Org_Code__c = 'D693';
        erpCustomer4.Distribution_Channel_Code__c = '10';
        erpCustomer4.Division_Code__c = '02';
        erpCustomer4.Country__c='India';
        erpCustomer4.Account_Group_Code__c ='Z001';
        erpCustomer4.Deletion_Flag__c=false;
        erpCustomer4.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer4.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer4.City__c = 'Blore';
        insert erpCustomer4;
        
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship.External_ERP_ID__c = 'Test1234';
        erpRelationship.Name__c = 'Test';
        erpRelationship.Partner_Code__c = '10';
        erpRelationship.Partner_Counter__c = '10';
        erpRelationship.Partner_Function__c = 'Test';
        erpRelationship.Partner_Function_Code__c = 'ZR';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship.Related_ERP_Customer__c = NULL;
        erpRelationship.User__c = Userinfo.getUserId();
        insert erpRelationship;
        
        ERP_Relationship__c erpRelationship1 = new ERP_Relationship__c();
        erpRelationship1.ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.External_ERP_ID__c = 'Test12345';
        erpRelationship1.Name__c = 'Test1';
        erpRelationship1.Partner_Code__c = '10';
        erpRelationship1.Partner_Counter__c = '10';
        erpRelationship1.Partner_Function__c = 'Test';
        erpRelationship1.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.Related_ERP_Customer__c = NULL;
        erpRelationship1.User__c = Userinfo.getUserId();
        insert erpRelationship1;
        
        ERP_Relationship__c erpRelationship2 = new ERP_Relationship__c();
        erpRelationship2.ERP_Customer__c = ((ERP_Customer__c)erpCustomer3).Id;
        erpRelationship2.External_ERP_ID__c = 'Test123456';
        erpRelationship2.Name__c = 'Test2';
        erpRelationship2.Partner_Code__c = '10';
        erpRelationship2.Partner_Counter__c = '10';
        erpRelationship2.Partner_Function__c = 'Test';
        erpRelationship2.Partner_Function_Code__c = 'ZU';
       // erpRelationship2.Customer_Code__c = '10';
        
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship2.Related_ERP_Customer__c = NULL;
        erpRelationship2.User__c = Userinfo.getUserId();
        insert erpRelationship2; 
        
        ERP_Relationship__c erpRelationship3 = new ERP_Relationship__c();
        erpRelationship3.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship3.External_ERP_ID__c = 'Test1234567';
        erpRelationship3.Name__c = 'Test3';
        erpRelationship3.Partner_Code__c = '10';
        erpRelationship3.Partner_Counter__c = '10';
        erpRelationship3.Partner_Function__c = 'Test';
        erpRelationship3.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship3.Related_ERP_Customer__c = NULL;
        erpRelationship3.User__c = Userinfo.getUserId();
        try{
        
        insert erpRelationship3;               
        }catch(exception e){
        system.debug('The exception is'+e);
        }
        List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); 
        Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
        pricingRequest1.Pricing_Request_Type__c = 'Permanent';
        pricingRequest1.Request_Type__c = 'Customer Specific';
        pricingRequest1.BU__c = 'BI';
        pricingRequest1.Sales_Org_Code__c = 'A640';
        pricingRequest1.Dist_Channel_Code__c = '10';
        pricingRequest1.Division_Code__c = '02';
        pricingRequest1.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest1);
        Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.SoldTo_Code__c = 'T001';
        //pavan
        pricingRequest2.BU__c = 'TEST';

        pricingRequestList.add(pricingRequest2);
        Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
        pricingRequest3.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest3.Request_Type__c = 'Customer Specific';
        pricingRequest3.BU__c = 'BI';
        pricingRequest3.Sales_Org_Code__c = 'A640';
        pricingRequest3.Dist_Channel_Code__c = '10';
        pricingRequest3.Division_Code__c = '02';
        pricingRequest3.SoldTo_Code__c = 'T001';
        pricingRequest3.Spot_Type__c = 'Free of Charge';
        pricingRequestList.add(pricingRequest3);
        Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
        pricingRequest4.Request_Type__c = 'Non Customer Specific';
        pricingRequest4.Pricing_Request_Type__c = 'Permanent';
        pricingRequest4.BU__c = 'BI';
        pricingRequest4.Sales_Org_Code__c = 'A640';
        pricingRequest4.Dist_Channel_Code__c = '10';
        pricingRequest4.Division_Code__c = '02';
        pricingRequestList.add(pricingRequest4);
        Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
        //pavan
        pricingRequest5.BU__c='TESTME';
        pricingRequestList.add(pricingRequest5);
        Pricing_Request__c pricingRequest6 = new Pricing_Request__c();
        pricingRequest6.Request_Type__c = 'Massive';
        pricingRequest6.BU__c = 'BI';
        pricingRequest6.Sales_Org_Code__c = 'A640';
        pricingRequest6.Dist_Channel_Code__c = '10';
        pricingRequest6.Division_Code__c = '02';
        pricingRequest6.Pricing_Request_Type__c = 'Permanent';
        pricingRequestList.add(pricingRequest6);
        Pricing_Request__c pricingRequest7 = new Pricing_Request__c();
        pricingRequest7.Request_Type__c = 'Import';
        pricingRequest7.BU__c = 'BI';
        pricingRequest7.Sales_Org_Code__c = 'A640';
        pricingRequest7.Dist_Channel_Code__c = '10';
        pricingRequest7.Division_Code__c = '02';
        pricingRequest7.Pricing_Request_Type__c = 'Import';
        //pricingRequest7.On_Behalf_Of__c = 'TestUserID';
        pricingRequestList.add(pricingRequest7);
        Pricing_Request__c pricingRequest8 = new Pricing_Request__c();
        pricingRequest8.Request_Type__c = 'Import';
        pricingRequest8.BU__c = 'BI';
        pricingRequest8.Sales_Org_Code__c = 'A640';
        pricingRequest8.Dist_Channel_Code__c = '10';
        pricingRequest8.Division_Code__c = '02';
        pricingRequest8.Pricing_Request_Type__c = 'Import';
        pricingRequestList.add(pricingRequest8);
        Pricing_Request__c pricingRequest9 = new Pricing_Request__c();
        pricingRequest9.Pricing_Request_Type__c = 'Permanent';
        pricingRequest9.Request_Type__c = 'Customer Specific';
        pricingRequest9.BU__c = 'BI';
        pricingRequest9.Sales_Org_Code__c = 'A640';
        pricingRequest9.Dist_Channel_Code__c = '10';
        pricingRequest9.Division_Code__c = '02';
        pricingRequest9.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest9);
        insert pricingRequestList;
        
        paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;  
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOGItems;
              
        
        Map<Id,String>  buIdToNameMap = new Map<Id,String>();
        buIdToNameMap.put(orgGrp.id,orgGrp.id);
         
        PAERPCustomer paERPCust = new PAERPCustomer(); 
         
        PAServiceState paSS = new PAServiceState();
        paSS.ogItems=paOGItems;
        
        PARequestItem paRequestItem;
//        <Monika>
          PARequest paRequest = new PARequest(paSS);
          paSS.currentRequest = paRequest;
          paSS.currentRequest.pricingRequest = pricingRequest6;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paSS);
        paERPCustomer.ogitems = paOGItems;
        paERPCustomer.paERPCustomer = erpCustomer1;
        
        PAERPCustomer.allCustomersWrapList= new List<PAwrapper>();
        PAERPCustomer.allCustomersWrapList.add(new paWrapper());
        PAERPCustomer.allCustomersWrapList.add(new paWrapper());
        PAERPCustomer.allCustomersWrapList.add(new paWrapper());
        PAERPCustomer.allCustomersWrapList[0].isselected=true;
        PAERPCustomer.allCustomersWrapList[1].isselected=true;
        PAERPCustomer.allCustomersWrapList[2].isselected=False;
      //  system.debug('........................'+PAERPCustomer.allCustomersWrapList.size());
        
        paSS.erpCustomer = paERPCustomer;
        paERPCustomer.paERPCustomer=(ERP_Customer__c)erpCustomer1;
        paERPCustomer.Incotems='';
        String incoterms = paERPCustomer.Incotems;
        List<SelectOption> incotermsList = paERPCustomer.incoterms;
        List<SelectOption> paymentTermsList = paERPCustomer.paymentTerms;
        List<SelectOption> salesAreaList = paERPCustomer.listOfSalesArea;
        paERPCustomer.setPAERPCustomer((ERP_Customer__c)erpCustomer1);
        ERP_Customer__c erpCust = paERPCustomer.getPAERPCustomer();
        paERPCustomer.setChangeSAFlag(true);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getListWrappers();
        paERPCustomer.save();
        paERPCustomer.deleteRecord();
        paERPCustomer.getName();
        paERPCustomer.validate('Next');
        paERPCustomer.customerCode = 'Test';
        paERPCustomer.validate('Next');
              
        paERPCustomer.action('abc','abc','abc') ;
        paERPCustomer.City = 'Bangalore';
        String city = paERPCustomer.City;
        paERPCustomer.customerName = 'customer';
        String customerName=paERPCustomer.customerName;
        paERPCustomer.Country = 'India';
        String country = paERPCustomer.Country;
        paERPCustomer.StateProvince = 'BTM';
        String stateProvince = paERPCustomer.StateProvince;
        paERPCustomer.street = 'Micolayout';
        String street = paERPCustomer.street;
        
                
        paERPCustomer.customerCode = '10';
        paERPCustomer.shipToCustomerCode = '10';
        paERPCustomer.shipToCode = '10';
        paERPCustomer.salesOrgCode = 'A640';
        paERPCustomer.distCode = 'D160';
        paERPCustomer.divCode = '10';
        
        paERPCustomer.searchSoldToCode='soldtocode';  
        paERPCustomer.searchSoldTo='soldto';
        paERPCustomer.searchCity='Blore';
        paERPCustomer.searchCountry='India';
                     
        paERPCustomer.setCustomerCode('10');
        paERPCustomer.getCustomerCode();
     
        

        paERPCustomer.action('PAHome','PAHome','customerPrices');
        paERPCustomer.action('PAHome','PAHome','cancel');
      
     
        paERPCustomer.action('PAHome','PAHome','Next');
        paERPCustomer.action('PAHome','PAHome','ShipTo');
           
        paERPCustomer.getAllSRList();
        //paERPCustomer.searchcustomermethod();
        
           
        paERPCustomer.getAllSoldToList();
        
        paOGItems.isViewCustomerPrices='--Select--';
        paERPCustomer.setChangeSAFlag(True);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getName();
        paERPCustomer.validate('searchCustomer');
        paERPCustomer.validate('Next');
        paERPCustomer.validate('ViewAllCustomerPrices');
        paERPCustomer.validate('customerPrices');
        
        paERPCustomer.salesArea = 'Multiple';
        paERPCustomer.salesAreaSelected = '--Select--';
        
        paOGItems.getListOptions();
        
        paERPCustomer.action('PAHome','PAHome','onBehalfOf');
        paERPCustomer.action('PAHome','PAHome','landingpage');
        
        paERPCustomer.action('PAHome','PAHome','searchCustomer');
        paERPCustomer.action('PAHome','PAHome','CancelBack');
        
        paERPCustomer.salesArea = 'Multiple';
        paERPCustomer.salesAreaSelected = 'D693-10-02';
        
        paERPCustomer.validate('Next');
        
        
        Organizational_Group_Item__c orgGrpItm1 = new Organizational_Group_Item__c();
        orgGrpItm1.Business__c=orgGrp.id;
        orgGrpItm1.OrgGroup__c=orgGrp1.id;
        orgGrpItm1.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm1.Display_Standardized_Rate__c=true;
        orgGrpItm1.Display_Standardized_Rate__c=true;
        orgGrpItm1.Attachments_on_Customer_Prices__c=true;
        orgGrpItm1.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm1.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm1.Latest_Valid_From_Offset_Non_Cust_Spec__c=1234;
        orgGrpItm1.Customer_Request_Reasons__c ='New customer';
        orgGrpItm1.Rebate_Agreement__c='test';
        orgGrpItm1.Retroactive_Limit__c=12;
        orgGrpItm1.ERP_Currency__c='test';
        orgGrpItm1.ERP_UoM__c='kg';
        orgGrpItm1.Non_Customer_Permanent_Request_Reasons__c='test';
        orgGrpItm1.Pricing_Task_Type__c='test';
        orgGrpItm1.Pricing_Task_Reasons__c='test';
        orgGrpItm1.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm1;         
        
        //paERPCustomer.action('PAHome','PAHome','customerPricessoldtoChange');
        paERPCustomer.action('PAHome','PAHome','soldtoChange');    
        paERPCustomer.action('PAHome','PAHome','PCL'); 
        List<PAWrapper> paw = new List<PAWrapper>();
        
            
       try{
              paERPCustomer.action('PAHome','PAHome','markCustomerFreq');
              paERPCustomer.action('PAHome','PAHome','markSalesRepFreq');
          }
          catch(Exception e){
              Boolean excep=e.getMessage().contains('Selected Sales Reps have been marked as Frequent')?true:false;
              Boolean excep1=e.getMessage().contains('Selected Customers have been marked as Frequent')?true:false;
            }
                
      }
    }
    
    static testMethod void paERPCustomerTestMethod2()
    {
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12',managerId=managerUser.Id);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId=managerUser.Id;
        insert user1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(user1){
       
        
       
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;

        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;

        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='BI EMEA Envelopes';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        

        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        

        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D693';
        orgGrp1.ERP_Sales_Org_Code__c='D693';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        orgGrp1.ERP_Division__c='D693';
        insert orgGrp1;
                
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Attachments_on_Customer_Prices__c=true;
        orgGrpItm.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm.Customer_Request_Reasons__c ='New customer';
        orgGrpItm.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm;    
 
        // Organizational_Group_User__c orgGrpUserList = new List<Organizational_Group_User__c>();
        Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
        //orgGrpUser1.Name = 'OGU-10442';
        orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
        orgGrpUser1.OrgGroup__c = orgGrp1.Id;
        orgGrpUser1.Related_User__c = user1.Id;
        orgGrpUser1.Access_Level__c = 'Read-Write';
        orgGrpUser1.Description__c = 'ZU';
        insert orgGrpUser1;

        Organizational_Group_User__c orgGrpUser2 = new Organizational_Group_User__c();
        //orgGrpUser1.Name = 'OGU-10442';
        orgGrpUser2.Organizational_Group_Item__c = orgGrpItm.Id; 
        orgGrpUser2.OrgGroup__c = orgGrp1.Id;
        orgGrpUser2.Related_User__c = UserInfo.getUserID();
        orgGrpUser2.Access_Level__c = 'Read-Write';
        orgGrpUser2.Description__c = 'ZU';
        insert orgGrpUser2;
        
        Organization_Group_Users_Frequent__c oguf = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Customer',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf;
        
        Organization_Group_Users_Frequent__c oguf1 = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Sales Rep',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf1;
        
        List<PAProfilePermissions__c> profilePSList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        paProfilePermissions.API_Name__c = 'Price_Approval_Sales_Admin';
        profilePSList.add(paProfilePermissions); //insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        profilePSList.add(paProfilePermissions1); //insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        profilePSList.add(paProfilePermissions2); //insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        profilePSList.add(paProfilePermissions3); //insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        profilePSList.add(paProfilePermissions4);  //insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        profilePSList.add(paProfilePermissions5); //insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        profilePSList.add(paProfilePermissions6); //insert paProfilePermissions6;
        insert profilePSList;
        
        PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;


        PADummycustomerMapping__c pacustmap = new PADummycustomerMapping__c();
        pacustmap.Name='BI EMEA Envelopes';
        pacustmap.Business__c='BI EMEA Envelopes';
        pacustmap.Customer_Code__c='52323';
        pacustmap.Sales_Org__c='D693';
        insert pacustmap;
        
        // Load the test Pricing Request data from the static resource
        List<ERP_Customer__c> erpCustomerList = new List<ERP_Customer__c>();
        ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'soldto';
        erpCustomer1.Customer_Code__c = 'soldtocode';
        erpCustomer1.Sales_Org_Code__c = 'D693';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        erpCustomer1.Country__c='India';
        erpCustomer1.Account_Group_Code__c ='Z001';
        erpCustomer1.Deletion_Flag__c=false;
        erpCustomer1.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer1.City__c = 'Blore';
        insert erpCustomer1;
        
        ERP_Customer__c erpCustomer2 = new ERP_Customer__c();
        erpCustomer2.Name= 'soldto';
        erpCustomer2.Customer_Code__c = 'soldtocode';
        erpCustomer2.Sales_Org_Code__c = 'D693';
        erpCustomer2.Distribution_Channel_Code__c = '10';
        erpCustomer2.Division_Code__c = '02';
        erpCustomer2.Country__c='India';
        erpCustomer2.Account_Group_Code__c ='Z001';
        erpCustomer2.Deletion_Flag__c=false;
        erpCustomer2.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer2.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer2.City__c = 'Blore';
        insert erpCustomer2;
        
        ERP_Customer__c erpCustomer3 = new ERP_Customer__c();
        erpCustomer3.Name= 'soldto';
        erpCustomer3.Customer_Code__c = 'soldtocode';
        erpCustomer3.Sales_Org_Code__c = 'D693';
        erpCustomer3.Distribution_Channel_Code__c = '10';
        erpCustomer3.Division_Code__c = '02';
        erpCustomer3.Country__c='India';
        erpCustomer3.Account_Group_Code__c ='Z001';
        erpCustomer3.Deletion_Flag__c=false;
        erpCustomer3.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer3.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer3.City__c = 'Blore';
        insert erpCustomer3;
        
        ERP_Customer__c erpCustomer4 = new ERP_Customer__c();
        erpCustomer4.Name= 'soldto';
        erpCustomer4.Customer_Code__c = '10';
        erpCustomer4.Sales_Org_Code__c = 'D693';
        erpCustomer4.Distribution_Channel_Code__c = '10';
        erpCustomer4.Division_Code__c = '02';
        erpCustomer4.Country__c='India';
        erpCustomer4.Account_Group_Code__c ='Z001';
        erpCustomer4.Deletion_Flag__c=false;
        erpCustomer4.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer4.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer4.City__c = 'Blore';
        insert erpCustomer4;

        ERP_Customer__c erpCustomer5 = new ERP_Customer__c();
        erpCustomer5.Name= 'soldto';
        erpCustomer5.Customer_Code__c = '52323';
        erpCustomer5.Sales_Org_Code__c = 'D693';
        erpCustomer5.Distribution_Channel_Code__c = '10';
        erpCustomer5.Division_Code__c = '02';
        erpCustomer5.Country__c='India';
        erpCustomer5.Account_Group_Code__c ='Z001';
        erpCustomer5.Deletion_Flag__c=false;
        erpCustomer5.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer5.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer5.City__c = 'Blore';
        insert erpCustomer5;
        
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship.External_ERP_ID__c = 'Test1234';
        erpRelationship.Name__c = 'Test';
        erpRelationship.Partner_Code__c = '10';
        erpRelationship.Partner_Counter__c = '10';
        erpRelationship.Partner_Function__c = 'Test';
        erpRelationship.Partner_Function_Code__c = 'ZR';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship.Related_ERP_Customer__c = NULL;
        erpRelationship.User__c = Userinfo.getUserId();
        insert erpRelationship;        
        
        ERP_Relationship__c erpRelationship1 = new ERP_Relationship__c();
        erpRelationship1.ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.External_ERP_ID__c = 'Test12345';
        erpRelationship1.Name__c = 'Test1';
        erpRelationship1.Partner_Code__c = '10';
        erpRelationship1.Partner_Counter__c = '10';
        erpRelationship1.Partner_Function__c = 'Test';
        erpRelationship1.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.Related_ERP_Customer__c = NULL;
        erpRelationship1.User__c = Userinfo.getUserId();
        insert erpRelationship1;
        
        ERP_Relationship__c erpRelationship2 = new ERP_Relationship__c();
        erpRelationship2.ERP_Customer__c = ((ERP_Customer__c)erpCustomer3).Id;
        erpRelationship2.External_ERP_ID__c = 'Test123456';
        erpRelationship2.Name__c = 'Test2';
        erpRelationship2.Partner_Code__c = '10';
        erpRelationship2.Partner_Counter__c = '10';
        erpRelationship2.Partner_Function__c = 'Test';
        erpRelationship2.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship2.Related_ERP_Customer__c = NULL;
        erpRelationship2.User__c = Userinfo.getUserId();
        insert erpRelationship2; 
        
        ERP_Relationship__c erpRelationship3 = new ERP_Relationship__c();
        erpRelationship3.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship3.External_ERP_ID__c = 'Test1234567';
        erpRelationship3.Name__c = 'Test3';
        erpRelationship3.Partner_Code__c = '10';
        erpRelationship3.Partner_Counter__c = '10';
        erpRelationship3.Partner_Function__c = 'Test';
        erpRelationship3.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship3.Related_ERP_Customer__c = NULL;
        erpRelationship3.User__c = Userinfo.getUserId();
        try{
        
        insert erpRelationship3;               
        }catch(exception e){
        system.debug('The exception is'+e);
        }               
        

        
        List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); 
        Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
        pricingRequest1.Pricing_Request_Type__c = 'Permanent';
        pricingRequest1.Request_Type__c = 'Customer Specific';
        pricingRequest1.BU__c = 'BI';
        pricingRequest1.Sales_Org_Code__c = 'A640';
        pricingRequest1.Dist_Channel_Code__c = '10';
        pricingRequest1.Division_Code__c = '02';
        pricingRequest1.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest1);
        Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.SoldTo_Code__c = 'T001';
        //pavan
        pricingRequest2.BU__c='TEST23';
        pricingRequestList.add(pricingRequest2);
        Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
        pricingRequest3.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest3.Request_Type__c = 'Customer Specific';
        pricingRequest3.BU__c = 'BI';
        pricingRequest3.Sales_Org_Code__c = 'A640';
        pricingRequest3.Dist_Channel_Code__c = '10';
        pricingRequest3.Division_Code__c = '02';
        pricingRequest3.SoldTo_Code__c = 'T001';
        pricingRequest3.Spot_Type__c = 'Free of Charge';
        pricingRequestList.add(pricingRequest3);
        Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
        pricingRequest4.Request_Type__c = 'Non Customer Specific';
        pricingRequest4.Pricing_Request_Type__c = 'Permanent';
        pricingRequest4.BU__c = 'BI';
        pricingRequest4.Sales_Org_Code__c = 'A640';
        pricingRequest4.Dist_Channel_Code__c = '10';
        pricingRequest4.Division_Code__c = '02';
        pricingRequestList.add(pricingRequest4);
        Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
        //pavan
        pricingRequest5.BU__c='TEST32';
        pricingRequestList.add(pricingRequest5);
        Pricing_Request__c pricingRequest6 = new Pricing_Request__c();
        pricingRequest6.Request_Type__c = 'Massive';
        pricingRequest6.BU__c = 'BI';
        pricingRequest6.Sales_Org_Code__c = 'A640';
        pricingRequest6.Dist_Channel_Code__c = '10';
        pricingRequest6.Division_Code__c = '02';
        pricingRequest6.Pricing_Request_Type__c = 'Permanent';
        pricingRequestList.add(pricingRequest6);
        Pricing_Request__c pricingRequest7 = new Pricing_Request__c();
        pricingRequest7.Request_Type__c = 'Import';
        pricingRequest7.BU__c = 'BI';
        pricingRequest7.Sales_Org_Code__c = 'A640';
        pricingRequest7.Dist_Channel_Code__c = '10';
        pricingRequest7.Division_Code__c = '02';
        pricingRequest7.Pricing_Request_Type__c = 'Import';
        //pricingRequest7.On_Behalf_Of__c = 'TestUserID';
        pricingRequestList.add(pricingRequest7);
        Pricing_Request__c pricingRequest8 = new Pricing_Request__c();
        pricingRequest8.Request_Type__c = 'Import';
        pricingRequest8.BU__c = 'BI';
        pricingRequest8.Sales_Org_Code__c = 'A640';
        pricingRequest8.Dist_Channel_Code__c = '10';
        pricingRequest8.Division_Code__c = '02';
        pricingRequest8.Pricing_Request_Type__c = 'Import';
        pricingRequestList.add(pricingRequest8);
        Pricing_Request__c pricingRequest9 = new Pricing_Request__c();
        pricingRequest9.Pricing_Request_Type__c = 'Permanent';
        pricingRequest9.Request_Type__c = 'Customer Specific';
        pricingRequest9.BU__c = 'BI';
        pricingRequest9.Sales_Org_Code__c = 'A640';
        pricingRequest9.Dist_Channel_Code__c = '10';
        pricingRequest9.Division_Code__c = '02';
        pricingRequest9.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest9);
        insert pricingRequestList;
            
        paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;   
        
        
       
        Map<Id,String>  buIdToNameMap = new Map<Id,String>();
        buIdToNameMap.put(orgGrp.id,orgGrp.id);      
        
        PAServiceState paSS = new PAServiceState();
        paSS.ogItems=paOGItems;
        
         PARequestItem paRequestItem;
         //<Monika>
         
          PARequest paRequest = new PARequest(paSS);
          paSS.currentRequest = paRequest;
          paSS.currentRequest.pricingRequest = pricingRequest6;
         
        PAERPCustomer paERPCust = new PAERPCustomer(); 
                

        PAERPCustomer paERPCustomer = new PAERPCustomer(paSS);
        paERPCustomer.ogitems = paOGItems;
        paERPCustomer.paERPCustomer = erpCustomer1;
         paSS.erpCustomer = paERPCustomer;
        paERPCustomer.paERPCustomer=(ERP_Customer__c)erpCustomer1;
        paERPCustomer.Incotems='';
        String incoterms = paERPCustomer.Incotems;
        List<SelectOption> incotermsList = paERPCustomer.incoterms;
        List<SelectOption> paymentTermsList = paERPCustomer.paymentTerms;
        List<SelectOption> salesAreaList = paERPCustomer.listOfSalesArea;
        paERPCustomer.setPAERPCustomer((ERP_Customer__c)erpCustomer1);
        ERP_Customer__c erpCust = paERPCustomer.getPAERPCustomer();
        paERPCustomer.setChangeSAFlag(true);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getListWrappers();
        paERPCustomer.save();
        paERPCustomer.deleteRecord();
        paERPCustomer.getName();
        paERPCustomer.validate('Next');
        paERPCustomer.customerCode = 'Test';
        paERPCustomer.validate('Next');
        
        paERPCustomer.City = 'Bangalore';
        String city = paERPCustomer.City;
        paERPCustomer.customerName = 'customer';
        String customerName=paERPCustomer.customerName;
        paERPCustomer.Country = 'India';
        String country = paERPCustomer.Country;
        paERPCustomer.StateProvince = 'BTM';
        String stateProvince = paERPCustomer.StateProvince;
        paERPCustomer.street = 'Micolayout';
        String street = paERPCustomer.street;
        
        paERPCustomer.customerCode = '10';
        paERPCustomer.shipToCustomerCode = '10';
        paERPCustomer.shipToCode = '10';
        paERPCustomer.salesOrgCode = 'A640';
        paERPCustomer.distCode = 'D160';
        paERPCustomer.divCode = '10';
        
        paERPCustomer.searchSoldTo='';
        paERPCustomer.searchSoldToCode='';
        paERPCustomer.searchCity='';
        paERPCustomer.searchCountry='';
        paERPCustomer.ogItems.selectedUser='';
        
        paERPCustomer.setCustomerCode('10');
        paERPCustomer.getCustomerCode();
        
        paERPCustomer.action('PAHome','PAHome','customerPrices');
        paERPCustomer.action('PAHome','PAHome','cancel');
      
           
        //paERPCustomer.shipToCode = '';
        paERPCustomer.action('PAHome','PAHome','Next');
        paERPCustomer.action('PAHome','PAHome','ShipTo');
        try{
            paERPCustomer.action('PAHome','PAHome','searchCustomer');
        }
        catch(Exception e){
            Boolean excep=e.getMessage().contains('Please enter values to search')?true:false;
        }
        paERPCustomer.getAllSRList();
        
        paOGItems.getListOptions();
        
        paERPCustomer.getAllSoldToList();
        paOGItems.isViewCustomerPrices='--Select--';
        //paOGItems.isViewCustomerPrices='true';
        paERPCustomer.setChangeSAFlag(True);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getName();
        paERPCustomer.validate('searchCustomer');
        paERPCustomer.validate('Next');
        paERPCustomer.validate('ViewAllCustomerPrices');
        paERPCustomer.validate('customerPrices');
        
        paERPCustomer.salesArea = 'Multiple';
        paERPCustomer.salesAreaSelected = '';
        
        paERPCustomer.action('PAHome','PAHome','onBehalfOf');
        paERPCustomer.action('PAHome','PAHome','landingpage');
        
        paERPCustomer.action('PAHome','PAHome','searchCustomer');
        paERPCustomer.action('PAHome','PAHome','CancelBack');
        paERPCustomer.action('PAHome','PAHome','soldtoChange');
        paERPCustomer.action('PAHome','PAHome','soldtoChange');    
        paERPCustomer.action('PAHome','PAHome','PCL'); 
        List<PAWrapper> paw = new List<PAWrapper>();
        
       try{
              paERPCustomer.action('PAHome','PAHome','markCustomerFreq');
              paERPCustomer.action('PAHome','PAHome','markSalesRepFreq');
          }
          catch(Exception e){
              Boolean excep=e.getMessage().contains('Selected Sales Reps have been marked as Frequent')?true:false;
              Boolean excep1=e.getMessage().contains('Selected Customers have been marked as Frequent')?true:false;
            }
                
      
     
    }
   }
   
   static testMethod void paERPCustomerTestMethod3() 
    {
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(FirstName='ABC',LastName='XYZ',E_Pass_ID__c='uh1234',External_ERP_ID__c='12345',User_Country__c='India',Email='test@dupont.com',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id,IsActive = true);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId=managerUser.Id;
        insert user1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(user1){
       
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;

        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;

        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='CPM NA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D693';
        orgGrp1.ERP_Sales_Org_Code__c='D693';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        orgGrp1.ERP_Division__c='D693';
        insert orgGrp1;
                
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Attachments_on_Customer_Prices__c=true;
        orgGrpItm.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm.Customer_Request_Reasons__c ='New customer';
        orgGrpItm.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm;    
 
        // Organizational_Group_User__c orgGrpUserList = new List<Organizational_Group_User__c>();
        Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
        //orgGrpUser1.Name = 'OGU-10442';
        orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
        orgGrpUser1.OrgGroup__c = orgGrp1.Id;
        orgGrpUser1.Related_User__c = user1.Id;
        orgGrpUser1.Access_Level__c = 'Read-Write';
        orgGrpUser1.Description__c = 'ZU';
        insert orgGrpUser1;
        
        Organization_Group_Users_Frequent__c oguf = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Customer',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf;
        
        Organization_Group_Users_Frequent__c oguf1 = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Sales Rep',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf1;
        
        
        PADummycustomerMapping__c pacustmap = new PADummycustomerMapping__c();
        pacustmap.Name='CPM';
        pacustmap.Business__c='CPM NA';
        pacustmap.Customer_Code__c='52323';
        pacustmap.Sales_Org__c='F240';
        insert pacustmap;
        
        List<PAProfilePermissions__c> profilePSList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        paProfilePermissions.API_Name__c = 'Price_Approval_Sales_Admin';
        profilePSList.add(paProfilePermissions); //insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        profilePSList.add(paProfilePermissions1); //insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        profilePSList.add(paProfilePermissions2); //insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        profilePSList.add(paProfilePermissions3); //insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        profilePSList.add(paProfilePermissions4);  //insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        profilePSList.add(paProfilePermissions5); //insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        profilePSList.add(paProfilePermissions6); //insert paProfilePermissions6;
        insert profilePSList;
        
        PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;
        
        // Load the test Pricing Request data from the static resource
        List<ERP_Customer__c> erpCustomerList = new List<ERP_Customer__c>();
        ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'soldto';
        erpCustomer1.Customer_Code__c = 'soldtocode';
        erpCustomer1.Sales_Org_Code__c = 'D693';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        erpCustomer1.Country__c='India';
        erpCustomer1.Account_Group_Code__c ='Z001';
        erpCustomer1.Deletion_Flag__c=false;
        erpCustomer1.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer1.City__c = 'Blore';
        insert erpCustomer1;
        
        ERP_Customer__c erpCustomer2 = new ERP_Customer__c();
        erpCustomer2.Name= 'soldto';
        erpCustomer2.Customer_Code__c = 'soldtocode';
        erpCustomer2.Sales_Org_Code__c = 'D693';
        erpCustomer2.Distribution_Channel_Code__c = '10';
        erpCustomer2.Division_Code__c = '02';
        erpCustomer2.Country__c='India';
        erpCustomer2.Account_Group_Code__c ='Z001';
        erpCustomer2.Deletion_Flag__c=false;
        erpCustomer2.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer2.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer2.City__c = 'Blore';
        insert erpCustomer2;
        
        ERP_Customer__c erpCustomer3 = new ERP_Customer__c();
        erpCustomer3.Name= 'soldto';
        erpCustomer3.Customer_Code__c = 'soldtocode';
        erpCustomer3.Sales_Org_Code__c = 'D693';
        erpCustomer3.Distribution_Channel_Code__c = '10';
        erpCustomer3.Division_Code__c = '02';
        erpCustomer3.Country__c='India';
        erpCustomer3.Account_Group_Code__c ='Z001';
        erpCustomer3.Deletion_Flag__c=false;
        erpCustomer3.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer3.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer3.City__c = 'Blore';
        insert erpCustomer3;
        
        ERP_Customer__c erpCustomer4 = new ERP_Customer__c();
        erpCustomer4.Name= 'soldto';
        erpCustomer4.Customer_Code__c = '10';
        erpCustomer4.Sales_Org_Code__c = 'D693';
        erpCustomer4.Distribution_Channel_Code__c = '10';
        erpCustomer4.Division_Code__c = '02';
        erpCustomer4.Country__c='India';
        erpCustomer4.Account_Group_Code__c ='Z001';
        erpCustomer4.Deletion_Flag__c=false;
        erpCustomer4.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer4.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer4.City__c = 'Blore';
        insert erpCustomer4;
        
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship.External_ERP_ID__c = 'Test1234';
        erpRelationship.Name__c = 'Test';
        erpRelationship.Partner_Code__c = '10';
        erpRelationship.Partner_Counter__c = '10';
        erpRelationship.Partner_Function__c = 'Test';
        erpRelationship.Partner_Function_Code__c = 'ZR';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship.Related_ERP_Customer__c = NULL;
        erpRelationship.User__c = Userinfo.getUserId();
        insert erpRelationship;
        
        ERP_Relationship__c erpRelationship1 = new ERP_Relationship__c();
        erpRelationship1.ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.External_ERP_ID__c = 'Test12345';
        erpRelationship1.Name__c = 'Test1';
        erpRelationship1.Partner_Code__c = '10';
        erpRelationship1.Partner_Counter__c = '10';
        erpRelationship1.Partner_Function__c = 'Test';
        erpRelationship1.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.Related_ERP_Customer__c = NULL;
        erpRelationship1.User__c = Userinfo.getUserId();
        insert erpRelationship1;
        
        ERP_Relationship__c erpRelationship2 = new ERP_Relationship__c();
        erpRelationship2.ERP_Customer__c = ((ERP_Customer__c)erpCustomer3).Id;
        erpRelationship2.External_ERP_ID__c = 'Test123456';
        erpRelationship2.Name__c = 'Test2';
        erpRelationship2.Partner_Code__c = '10';
        erpRelationship2.Partner_Counter__c = '10';
        erpRelationship2.Partner_Function__c = 'Test';
        erpRelationship2.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship2.Related_ERP_Customer__c = NULL;
        erpRelationship2.User__c = Userinfo.getUserId();
        insert erpRelationship2;
        
        ERP_Relationship__c erpRelationship3 = new ERP_Relationship__c();
        erpRelationship3.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship3.External_ERP_ID__c = 'Test1234567';
        erpRelationship3.Name__c = 'Test3';
        erpRelationship3.Partner_Code__c = '10';
        erpRelationship3.Partner_Counter__c = '10';
        erpRelationship3.Partner_Function__c = 'Test';
        erpRelationship3.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship3.Related_ERP_Customer__c = NULL;
        erpRelationship3.User__c = Userinfo.getUserId();
        try{
        
        insert erpRelationship3;               
        }catch(exception e){
        system.debug('The exception is'+e);
        }                
        
        List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); 
        Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
        pricingRequest1.Pricing_Request_Type__c = 'Permanent';
        pricingRequest1.Request_Type__c = 'Customer Specific';
        pricingRequest1.BU__c = 'BI';
        pricingRequest1.Sales_Org_Code__c = 'A640';
        pricingRequest1.Dist_Channel_Code__c = '10';
        pricingRequest1.Division_Code__c = '02';
        pricingRequest1.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest1);
        Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.SoldTo_Code__c = 'T001';
        //pavan
        pricingRequest2.BU__c='TEMP';

        pricingRequestList.add(pricingRequest2);
        Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
        pricingRequest3.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest3.Request_Type__c = 'Customer Specific';
        pricingRequest3.BU__c = 'BI';
        pricingRequest3.Sales_Org_Code__c = 'A640';
        pricingRequest3.Dist_Channel_Code__c = '10';
        pricingRequest3.Division_Code__c = '02';
        pricingRequest3.SoldTo_Code__c = 'T001';
        pricingRequest3.Spot_Type__c = 'Free of Charge';
        pricingRequestList.add(pricingRequest3);
        Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
        pricingRequest4.Request_Type__c = 'Non Customer Specific';
        pricingRequest4.Pricing_Request_Type__c = 'Permanent';
        pricingRequest4.BU__c = 'BI';
        pricingRequest4.Sales_Org_Code__c = 'A640';
        pricingRequest4.Dist_Channel_Code__c = '10';
        pricingRequest4.Division_Code__c = '02';
        pricingRequestList.add(pricingRequest4);
        Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
        //pavan
        pricingRequest5.BU__c='TEMP5';
        pricingRequestList.add(pricingRequest5);
        Pricing_Request__c pricingRequest6 = new Pricing_Request__c();
        pricingRequest6.Request_Type__c = 'Massive';
        pricingRequest6.BU__c = 'BI';
        pricingRequest6.Sales_Org_Code__c = 'A640';
        pricingRequest6.Dist_Channel_Code__c = '10';
        pricingRequest6.Division_Code__c = '02';
        pricingRequest6.Pricing_Request_Type__c = 'Permanent';
        pricingRequestList.add(pricingRequest6);
        Pricing_Request__c pricingRequest7 = new Pricing_Request__c();
        pricingRequest7.Request_Type__c = 'Import';
        pricingRequest7.BU__c = 'BI';
        pricingRequest7.Sales_Org_Code__c = 'A640';
        pricingRequest7.Dist_Channel_Code__c = '10';
        pricingRequest7.Division_Code__c = '02';
        pricingRequest7.Pricing_Request_Type__c = 'Import';
        //pricingRequest7.On_Behalf_Of__c = 'TestUserID';
        pricingRequestList.add(pricingRequest7);
        Pricing_Request__c pricingRequest8 = new Pricing_Request__c();
        pricingRequest8.Request_Type__c = 'Import';
        pricingRequest8.BU__c = 'BI';
        pricingRequest8.Sales_Org_Code__c = 'A640';
        pricingRequest8.Dist_Channel_Code__c = '10';
        pricingRequest8.Division_Code__c = '02';
        pricingRequest8.Pricing_Request_Type__c = 'Import';
        pricingRequestList.add(pricingRequest8);
        Pricing_Request__c pricingRequest9 = new Pricing_Request__c();
        pricingRequest9.Pricing_Request_Type__c = 'Permanent';
        pricingRequest9.Request_Type__c = 'Customer Specific';
        pricingRequest9.BU__c = 'BI';
        pricingRequest9.Sales_Org_Code__c = 'A640';
        pricingRequest9.Dist_Channel_Code__c = '10';
        pricingRequest9.Division_Code__c = '02';
        pricingRequest9.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest9);
        insert pricingRequestList;
        
        paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;  
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOGItems;
              
        
        Map<Id,String>  buIdToNameMap = new Map<Id,String>();
        buIdToNameMap.put(orgGrp.id,orgGrp.id);
         
        PAServiceState paSS = new PAServiceState();
        paSS.ogItems=paOGItems;
        
        PARequestItem paRequestItem;
          PARequest paRequest = new PARequest(paSS);
          paSS.currentRequest = paRequest;
          paSS.currentRequest.pricingRequest = pricingRequest6;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paSS);
        paERPCustomer.ogitems = paOGItems;
          paERPCustomer.paERPCustomer = erpCustomer1;
        
         paSS.erpCustomer = paERPCustomer;
        paERPCustomer.paERPCustomer=(ERP_Customer__c)erpCustomer1;
        paERPCustomer.Incotems='';
        String incoterms = paERPCustomer.Incotems;
        List<SelectOption> incotermsList = paERPCustomer.incoterms;
        List<SelectOption> paymentTermsList = paERPCustomer.paymentTerms;
        List<SelectOption> salesAreaList = paERPCustomer.listOfSalesArea;
        paERPCustomer.setPAERPCustomer((ERP_Customer__c)erpCustomer1);
        ERP_Customer__c erpCust = paERPCustomer.getPAERPCustomer();
        paERPCustomer.setChangeSAFlag(true);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getListWrappers();
        paERPCustomer.save();
        paERPCustomer.deleteRecord();
        paERPCustomer.getName();
        paERPCustomer.validate('Next');
        paERPCustomer.customerCode = 'Test';
        paERPCustomer.validate('Next');
        
        paERPCustomer.City = 'Bangalore';
        String city = paERPCustomer.City;
        paERPCustomer.customerName = 'customer';
        String customerName=paERPCustomer.customerName;
        paERPCustomer.Country = 'India';
        String country = paERPCustomer.Country;
        paERPCustomer.StateProvince = 'BTM';
        String stateProvince = paERPCustomer.StateProvince;
        paERPCustomer.street = 'Micolayout';
        String street = paERPCustomer.street;
        
                
        paERPCustomer.customerCode = '10';
        paERPCustomer.shipToCustomerCode = '10';
        paERPCustomer.shipToCode = '10';
        paERPCustomer.salesOrgCode = 'A640';
        paERPCustomer.distCode = 'D160';
        paERPCustomer.divCode = '10';
        
        paERPCustomer.searchSoldToCode='soldtocode';  
        paERPCustomer.searchSoldTo='soldto';
        paERPCustomer.searchCity='Blore';
        paERPCustomer.searchCountry='India';
                     
        paERPCustomer.setCustomerCode('10');
        paERPCustomer.getCustomerCode();       
        
        Organizational_Group_Item__c orgGrpItm1 = new Organizational_Group_Item__c();
        orgGrpItm1.Business__c=orgGrp.id;
        orgGrpItm1.OrgGroup__c=orgGrp1.id;
        orgGrpItm1.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm1.Display_Standardized_Rate__c=true;
        orgGrpItm1.Display_Standardized_Rate__c=true;
        orgGrpItm1.Attachments_on_Customer_Prices__c=true;
        orgGrpItm1.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm1.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm1.Latest_Valid_From_Offset_Non_Cust_Spec__c=1234;
        orgGrpItm1.Customer_Request_Reasons__c ='New customer';
        orgGrpItm1.Rebate_Agreement__c='test';
        orgGrpItm1.Retroactive_Limit__c=12;
        orgGrpItm1.ERP_Currency__c='test';
        orgGrpItm1.ERP_UoM__c='kg';
        orgGrpItm1.Non_Customer_Permanent_Request_Reasons__c='test';
        orgGrpItm1.Pricing_Task_Type__c='test';
        orgGrpItm1.Pricing_Task_Reasons__c='test';
        orgGrpItm1.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm1;         
        
        paERPCustomer.action('PAHome','PAHome','customerPricessoldtoChange');
        paERPCustomer.allSalesRepsWrapList = new List<PAWrapper>();
        try{
            paERPCustomer.action('PAHome','PAHome','markSalesRepFreq');
        }catch(Exception e){
        }
       }         
    }
     static testMethod void paERPCustomerTestMethod4() 
    {
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(FirstName='ABC',LastName='XYZ',E_Pass_ID__c='uh1234',External_ERP_ID__c='12345',User_Country__c='India',Email='test@dupont.com',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',LocaleSidKey='en_US',LanguageLocaleKey='en_US',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id,IsActive = true);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId=managerUser.Id;
        insert user1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(user1){
       
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;

        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;

        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='CPM NA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='D693';
        orgGrp1.ERP_Sales_Org_Code__c='D693';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        orgGrp1.ERP_Division__c='D693';
        insert orgGrp1;
                
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Display_Standardized_Rate__c=true;
        orgGrpItm.Attachments_on_Customer_Prices__c=true;
        orgGrpItm.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm.Customer_Request_Reasons__c ='New customer';
        orgGrpItm.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm;    
 
        // Organizational_Group_User__c orgGrpUserList = new List<Organizational_Group_User__c>();
        Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
        //orgGrpUser1.Name = 'OGU-10442';
        orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
        orgGrpUser1.OrgGroup__c = orgGrp1.Id;
        orgGrpUser1.Related_User__c = user1.Id;
        orgGrpUser1.Access_Level__c = 'Read-Write';
        orgGrpUser1.Description__c = 'ZU';
        insert orgGrpUser1;
        
        Organization_Group_Users_Frequent__c oguf = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Customer',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf;
        
        Organization_Group_Users_Frequent__c oguf1 = new Organization_Group_Users_Frequent__c(Name__c='Test',Type__c='Sales Rep',Organizational_Group_Users__c=orgGrpUser1.id);
        insert oguf1;
        
        
        PADummycustomerMapping__c pacustmap = new PADummycustomerMapping__c();
        pacustmap.Name='CPM';
        pacustmap.Business__c='CPM NA';
        pacustmap.Customer_Code__c='52323';
        pacustmap.Sales_Org__c='F240';
        insert pacustmap;
        
        List<PAProfilePermissions__c> profilePSList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        paProfilePermissions.API_Name__c = 'Price_Approval_Sales_Admin';
        profilePSList.add(paProfilePermissions); //insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        profilePSList.add(paProfilePermissions1); //insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        profilePSList.add(paProfilePermissions2); //insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        profilePSList.add(paProfilePermissions3); //insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        profilePSList.add(paProfilePermissions4);  //insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        profilePSList.add(paProfilePermissions5); //insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        profilePSList.add(paProfilePermissions6); //insert paProfilePermissions6;
        insert profilePSList;
        
        PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;
        
        
        // Load the test Pricing Request data from the static resource
        List<ERP_Customer__c> erpCustomerList = new List<ERP_Customer__c>();
        ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Name= 'soldto';
        erpCustomer1.Customer_Code__c = 'soldtocode';
        erpCustomer1.Sales_Org_Code__c = 'D693';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        erpCustomer1.Country__c='India';
        erpCustomer1.Account_Group_Code__c ='Z001';
        erpCustomer1.Deletion_Flag__c=false;
        erpCustomer1.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer1.City__c = 'Blore';
        insert erpCustomer1;
        
        ERP_Customer__c erpCustomer2 = new ERP_Customer__c();
        erpCustomer2.Name= 'soldto';
        erpCustomer2.Customer_Code__c = 'soldtocode';
        erpCustomer2.Sales_Org_Code__c = 'D693';
        erpCustomer2.Distribution_Channel_Code__c = '10';
        erpCustomer2.Division_Code__c = '02';
        erpCustomer2.Country__c='India';
        erpCustomer2.Account_Group_Code__c ='Z001';
        erpCustomer2.Deletion_Flag__c=false;
        erpCustomer2.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer2.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer2.City__c = 'Blore';
        insert erpCustomer2;
        
        ERP_Customer__c erpCustomer3 = new ERP_Customer__c();
        erpCustomer3.Name= 'soldto';
        erpCustomer3.Customer_Code__c = 'soldtocode';
        erpCustomer3.Sales_Org_Code__c = 'D693';
        erpCustomer3.Distribution_Channel_Code__c = '10';
        erpCustomer3.Division_Code__c = '02';
        erpCustomer3.Country__c='India';
        erpCustomer3.Account_Group_Code__c ='Z001';
        erpCustomer3.Deletion_Flag__c=false;
        erpCustomer3.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer3.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer3.City__c = 'Blore';
        insert erpCustomer3;
        
        ERP_Customer__c erpCustomer4 = new ERP_Customer__c();
        erpCustomer4.Name= 'soldto';
        erpCustomer4.Customer_Code__c = '10';
        erpCustomer4.Sales_Org_Code__c = 'D693';
        erpCustomer4.Distribution_Channel_Code__c = '10';
        erpCustomer4.Division_Code__c = '02';
        erpCustomer4.Country__c='India';
        erpCustomer4.Account_Group_Code__c ='Z001';
        erpCustomer4.Deletion_Flag__c=false;
        erpCustomer4.RecordtypeId = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        erpCustomer4.Customer_General_Data__c = erpCustomer1.Id;
        erpCustomer4.City__c = 'Blore';
        insert erpCustomer4;
        
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship.External_ERP_ID__c = 'Test1234';
        erpRelationship.Name__c = 'Test';
        erpRelationship.Partner_Code__c = '10';
        erpRelationship.Partner_Counter__c = '10';
        erpRelationship.Partner_Function__c = 'Test';
        erpRelationship.Partner_Function_Code__c = 'ZR';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship.Related_ERP_Customer__c = NULL;
        erpRelationship.User__c = Userinfo.getUserId();
        insert erpRelationship;
        
        ERP_Relationship__c erpRelationship1 = new ERP_Relationship__c();
        erpRelationship1.ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.External_ERP_ID__c = 'Test12345';
        erpRelationship1.Name__c = 'Test1';
        erpRelationship1.Partner_Code__c = '10';
        erpRelationship1.Partner_Counter__c = '10';
        erpRelationship1.Partner_Function__c = 'Test';
        erpRelationship1.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship1.Related_ERP_Customer__c = NULL;
        erpRelationship1.User__c = Userinfo.getUserId();
        insert erpRelationship1;
        
        ERP_Relationship__c erpRelationship2 = new ERP_Relationship__c();
        erpRelationship2.ERP_Customer__c = ((ERP_Customer__c)erpCustomer3).Id;
        erpRelationship2.External_ERP_ID__c = 'Test123456';
        erpRelationship2.Name__c = 'Test2';
        erpRelationship2.Partner_Code__c = '10';
        erpRelationship2.Partner_Counter__c = '10';
        erpRelationship2.Partner_Function__c = 'Test';
        erpRelationship2.Partner_Function_Code__c = 'ZU';
          
       // erpRelationship2.Customer_Code__c = '10';
        
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship2.Related_ERP_Customer__c = NULL;
        erpRelationship2.User__c = Userinfo.getUserId();
        insert erpRelationship2; 
        
        ERP_Relationship__c erpRelationship3 = new ERP_Relationship__c();
        erpRelationship3.ERP_Customer__c = ((ERP_Customer__c)erpCustomer4).Id;
        erpRelationship3.External_ERP_ID__c = 'Test1234567';
        erpRelationship3.Name__c = 'Test3';
        erpRelationship3.Partner_Code__c = '10';
        erpRelationship3.Partner_Counter__c = '10';
        erpRelationship3.Partner_Function__c = 'Test';
        erpRelationship3.Partner_Function_Code__c = 'ZU';
        //erpRelationship.Related_ERP_Customer__c = ((ERP_Customer__c)erpCustomer2).Id;
        erpRelationship3.Related_ERP_Customer__c = NULL;
        erpRelationship3.User__c = Userinfo.getUserId();
        try{
        
        insert erpRelationship3;               
        }catch(exception e){
        system.debug('The exception is'+e);
        }
        List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); 
        Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
        pricingRequest1.Pricing_Request_Type__c = 'Permanent';
        pricingRequest1.Request_Type__c = 'Customer Specific';
        pricingRequest1.BU__c = 'BI';
        pricingRequest1.Sales_Org_Code__c = 'A640';
        pricingRequest1.Dist_Channel_Code__c = '10';
        pricingRequest1.Division_Code__c = '02';
        pricingRequest1.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest1);
        Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.SoldTo_Code__c = 'T001';
        //pavan
        pricingRequest2.BU__c = 'TEST';

        pricingRequestList.add(pricingRequest2);
        Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
        pricingRequest3.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest3.Request_Type__c = 'Customer Specific';
        pricingRequest3.BU__c = 'BI';
        pricingRequest3.Sales_Org_Code__c = 'A640';
        pricingRequest3.Dist_Channel_Code__c = '10';
        pricingRequest3.Division_Code__c = '02';
        pricingRequest3.SoldTo_Code__c = 'T001';
        pricingRequest3.Spot_Type__c = 'Free of Charge';
        pricingRequestList.add(pricingRequest3);
        Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
        pricingRequest4.Request_Type__c = 'Non Customer Specific';
        pricingRequest4.Pricing_Request_Type__c = 'Permanent';
        pricingRequest4.BU__c = 'BI';
        pricingRequest4.Sales_Org_Code__c = 'A640';
        pricingRequest4.Dist_Channel_Code__c = '10';
        pricingRequest4.Division_Code__c = '02';
        pricingRequestList.add(pricingRequest4);
        Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
        //pavan
        pricingRequest5.BU__c='TESTME';
        pricingRequestList.add(pricingRequest5);
        Pricing_Request__c pricingRequest6 = new Pricing_Request__c();
        pricingRequest6.Request_Type__c = 'Massive';
        pricingRequest6.BU__c = 'BI';
        pricingRequest6.Sales_Org_Code__c = 'A640';
        pricingRequest6.Dist_Channel_Code__c = '10';
        pricingRequest6.Division_Code__c = '02';
        pricingRequest6.Pricing_Request_Type__c = 'Permanent';
        pricingRequestList.add(pricingRequest6);
        Pricing_Request__c pricingRequest7 = new Pricing_Request__c();
        pricingRequest7.Request_Type__c = 'Import';
        pricingRequest7.BU__c = 'BI';
        pricingRequest7.Sales_Org_Code__c = 'A640';
        pricingRequest7.Dist_Channel_Code__c = '10';
        pricingRequest7.Division_Code__c = '02';
        pricingRequest7.Pricing_Request_Type__c = 'Import';
        //pricingRequest7.On_Behalf_Of__c = 'TestUserID';
        pricingRequestList.add(pricingRequest7);
        Pricing_Request__c pricingRequest8 = new Pricing_Request__c();
        pricingRequest8.Request_Type__c = 'Import';
        pricingRequest8.BU__c = 'BI';
        pricingRequest8.Sales_Org_Code__c = 'A640';
        pricingRequest8.Dist_Channel_Code__c = '10';
        pricingRequest8.Division_Code__c = '02';
        pricingRequest8.Pricing_Request_Type__c = 'Import';
        pricingRequestList.add(pricingRequest8);
        Pricing_Request__c pricingRequest9 = new Pricing_Request__c();
        pricingRequest9.Pricing_Request_Type__c = 'Permanent';
        pricingRequest9.Request_Type__c = 'Customer Specific';
        pricingRequest9.BU__c = 'BI';
        pricingRequest9.Sales_Org_Code__c = 'A640';
        pricingRequest9.Dist_Channel_Code__c = '10';
        pricingRequest9.Division_Code__c = '02';
        pricingRequest9.SoldTo_Code__c = 'T001';
        pricingRequestList.add(pricingRequest9);
        insert pricingRequestList;
        
        paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = orgGrp.id; 
        paOGItems.selectedUser =User1.id;  
  paOGItems.isViewCustomerPrices='true';
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOGItems;
              
        
        Map<Id,String>  buIdToNameMap = new Map<Id,String>();
        buIdToNameMap.put(orgGrp.id,orgGrp.id);
         
        PAERPCustomer paERPCust = new PAERPCustomer(); 
         
        PAServiceState paSS = new PAServiceState();
        paSS.ogItems=paOGItems;
   
        
        PARequestItem paRequestItem;
//        <Monika>
          PARequest paRequest = new PARequest(paSS);
          paSS.currentRequest = paRequest;
          paSS.currentRequest.pricingRequest = pricingRequest6;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paSS);
        paERPCustomer.ogitems = paOGItems;
        paERPCustomer.paERPCustomer = erpCustomer1;
            
        
        PAERPCustomer.allCustomersWrapList= new List<PAwrapper>();
        PAERPCustomer.allCustomersWrapList.add(new paWrapper());
        PAERPCustomer.allCustomersWrapList.add(new paWrapper());
        PAERPCustomer.allCustomersWrapList.add(new paWrapper());
        PAERPCustomer.allCustomersWrapList[0].isselected=true;
        PAERPCustomer.allCustomersWrapList[1].isselected=true;
        PAERPCustomer.allCustomersWrapList[2].isselected=False;
      //  system.debug('........................'+PAERPCustomer.allCustomersWrapList.size());
        
        paSS.erpCustomer = paERPCustomer;
        paERPCustomer.paERPCustomer=(ERP_Customer__c)erpCustomer1;
        paERPCustomer.Incotems='';
        String incoterms = paERPCustomer.Incotems;
        List<SelectOption> incotermsList = paERPCustomer.incoterms;
        List<SelectOption> paymentTermsList = paERPCustomer.paymentTerms;
        List<SelectOption> salesAreaList = paERPCustomer.listOfSalesArea;
        paERPCustomer.setPAERPCustomer((ERP_Customer__c)erpCustomer1);
        ERP_Customer__c erpCust = paERPCustomer.getPAERPCustomer();
        paERPCustomer.setChangeSAFlag(true);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getListWrappers();
        paERPCustomer.save();
        paERPCustomer.deleteRecord();
        paERPCustomer.getName();
        paERPCustomer.validate('Next');
        paERPCustomer.customerCode = 'Test';
        paERPCustomer.validate('Next');
              
        paERPCustomer.action('abc','abc','abc') ;
        paERPCustomer.City = 'Bangalore';
        String city = paERPCustomer.City;
        paERPCustomer.customerName = 'customer';
        String customerName=paERPCustomer.customerName;
        paERPCustomer.Country = 'India';
        String country = paERPCustomer.Country;
        paERPCustomer.StateProvince = 'BTM';
        String stateProvince = paERPCustomer.StateProvince;
        paERPCustomer.street = 'Micolayout';
        String street = paERPCustomer.street;
        
                
        paERPCustomer.customerCode = '10';
        paERPCustomer.shipToCustomerCode = '10';
        paERPCustomer.shipToCode = '10';
        paERPCustomer.salesOrgCode = 'A640';
        paERPCustomer.distCode = 'D160';
        paERPCustomer.divCode = '10';
        
        paERPCustomer.searchSoldToCode='soldtocode';  
        paERPCustomer.searchSoldTo='soldto';
        paERPCustomer.searchCity='Blore';
        paERPCustomer.searchCountry='India';
                     
        paERPCustomer.setCustomerCode('10');
        paERPCustomer.getCustomerCode();
     
        

        paERPCustomer.action('PAHome','PAHome','customerPrices');
        paERPCustomer.action('PAHome','PAHome','cancel');
      
     
        paERPCustomer.action('PAHome','PAHome','Next');
        paERPCustomer.action('PAHome','PAHome','ShipTo');
           
        paERPCustomer.getAllSRList();
        //paERPCustomer.searchcustomermethod();
        
           
        paERPCustomer.getAllSoldToList();
        
        paOGItems.isViewCustomerPrices='--Select--';
        paERPCustomer.setChangeSAFlag(True);
        paERPCustomer.getchangeSAFlag();
        paERPCustomer.getListBusinessComponents();
        paERPCustomer.getListOptions();
        paERPCustomer.getName();
        paERPCustomer.validate('searchCustomer');
        paERPCustomer.validate('Next');
        paERPCustomer.validate('ViewAllCustomerPrices');
        paERPCustomer.validate('customerPrices');
        
        paERPCustomer.salesArea = 'Multiple';
        paERPCustomer.salesAreaSelected = '--Select--';
        
        paOGItems.getListOptions();
        
        paERPCustomer.action('PAHome','PAHome','onBehalfOf');
        paERPCustomer.action('PAHome','PAHome','landingpage');
        
        paERPCustomer.action('PAHome','PAHome','searchCustomer');
        paERPCustomer.action('PAHome','PAHome','CancelBack');
        
        paERPCustomer.salesArea = 'Multiple';
        paERPCustomer.salesAreaSelected = 'D693-10-02';
        
        paERPCustomer.validate('Next');
        
        
        Organizational_Group_Item__c orgGrpItm1 = new Organizational_Group_Item__c();
        orgGrpItm1.Business__c=orgGrp.id;
        orgGrpItm1.OrgGroup__c=orgGrp1.id;
        orgGrpItm1.ERP_Pricing_Procedure__c=PRProc1.id;
        orgGrpItm1.Display_Standardized_Rate__c=true;
        orgGrpItm1.Display_Standardized_Rate__c=true;
        orgGrpItm1.Attachments_on_Customer_Prices__c=true;
        orgGrpItm1.Max_Valid_From_Offset_Cust_Spec__c=234;
        orgGrpItm1.Latest_Valid_To_Offset_Cust_Spec__c=1234;
        orgGrpItm1.Latest_Valid_From_Offset_Non_Cust_Spec__c=1234;
        orgGrpItm1.Customer_Request_Reasons__c ='New customer';
        orgGrpItm1.Rebate_Agreement__c='test';
        orgGrpItm1.Retroactive_Limit__c=12;
        orgGrpItm1.ERP_Currency__c='test';
        orgGrpItm1.ERP_UoM__c='kg';
        orgGrpItm1.Non_Customer_Permanent_Request_Reasons__c='test';
        orgGrpItm1.Pricing_Task_Type__c='test';
        orgGrpItm1.Pricing_Task_Reasons__c='test';
        orgGrpItm1.Non_Standard_Payment_Terms__c = 'U000-Credit Note';
        insert orgGrpItm1;         
    
        //paERPCustomer.action('PAHome','PAHome','customerPricessoldtoChange');
        paERPCustomer.action('PAHome','PAHome','soldtoChange');    
        paERPCustomer.action('PAHome','PAHome','PCL'); 
        paERPCustomer.action('PAHome','PAHome','customerPricesViewAllCustomerPricesNext'); 
        List<PAWrapper> paw = new List<PAWrapper>();
        
            
       try{
              paERPCustomer.action('PAHome','PAHome','markCustomerFreq');
              paERPCustomer.action('PAHome','PAHome','markSalesRepFreq');
          }
          catch(Exception e){
              Boolean excep=e.getMessage().contains('Selected Sales Reps have been marked as Frequent')?true:false;
              Boolean excep1=e.getMessage().contains('Selected Customers have been marked as Frequent')?true:false;
            }
                
      }
    }
  }