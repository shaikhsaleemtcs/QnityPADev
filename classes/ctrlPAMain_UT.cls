/*
 * Name      :   ctrlPAMain_UT
 * Description  :   This is the test class for ctrlPAMain
 * Author      :   Infosys Limited
 * Created Date :   19-03-2013
 *Date : 29/12/2016
  Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class ctrlPAMain_UT
{
   
    static testMethod void ctrlPAMainTestMethod()
    {
        List<PAPageComponentMapping__c> pageComponentMappingList = new List<PAPageComponentMapping__c>();
        PAPageComponentMapping__c pageComputingCS1 = new PAPageComponentMapping__c();
        pageComputingCS1.Name = 'PAHOME';
        pageComputingCS1.ComponentName__c = 'OrganizationalGroupItem';
        PAPageComponentMapping__c pageComputingCS2 = new PAPageComponentMapping__c();
        pageComputingCS2.Name = 'PAPRICINGREQUEST';
        pageComputingCS2.ComponentName__c = 'RequestItems';
        PAPageComponentMapping__c pageComputingCS3 = new PAPageComponentMapping__c();
        pageComputingCS3.Name = 'PACUSTOMERDETAIL';
        pageComputingCS3.ComponentName__c = 'ERPCustomer';
        pageComponentMappingList.add(pageComputingCS3);
        PAPageComponentMapping__c pageComputingCS4 = new PAPageComponentMapping__c();
        pageComputingCS4.Name = 'a0a';
        pageComputingCS4.ComponentName__c = 'RequestItems';
        pageComponentMappingList.add(pageComputingCS4);

        PAPageComponentMapping__c pageComputingCS5 = new PAPageComponentMapping__c();
        pageComputingCS5.Name = 'a0I';
        pageComputingCS5.ComponentName__c = 'OrganizationalGroupItem';
        pageComponentMappingList.add(pageComputingCS5);
        PAPageComponentMapping__c pageComputingCS6 = new PAPageComponentMapping__c();
        pageComputingCS6.Name = '00T';
        pageComputingCS6.ComponentName__c = 'RequestItems';
        pageComponentMappingList.add(pageComputingCS6);
        PAPageComponentMapping__c pageComputingCS7 = new PAPageComponentMapping__c();
        pageComputingCS7.Name = 'a0c';
        pageComputingCS7.ComponentName__c = 'RequestItems';
        pageComponentMappingList.add(pageComputingCS7);
        insert pageComponentMappingList;

        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'BI EMEA SURFACES';
        insert orgGroup;

        ERP_Customer__c erpCustomer = new ERP_Customer__c();
        insert erpCustomer;

        Pricing_Request__c pricingRequest = new Pricing_Request__c();
        pricingRequest.BU__c = orgGroup.Business__c;
        pricingRequest.Pricing_Request_Type__c = 'Permanent';
        pricingRequest.Request_Type__c = 'Customer Specific';
        insert pricingRequest;

        List<PAProfilePermissions__c> paProfilePermissionsList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Sales Admin';
        paProfilePermissionsList.add(paProfilePermissions1);


        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'Approver';
        paProfilePermissionsList.add(paProfilePermissions2);

        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        paProfilePermissionsList.add(paProfilePermissions3);

        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        paProfilePermissionsList.add(paProfilePermissions4);

        insert paProfilePermissionsList;
        List<PricingRequestTypeOrder__c> pricingReqTypeOrderList = new List<PricingRequestTypeOrder__c>();
        PricingRequestTypeOrder__c pricingReqTypeOrder1 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder1.Name = '1';
        pricingReqTypeOrder1.Request_Type__c = 'Customer Price';
        pricingReqTypeOrderList.add(pricingReqTypeOrder1);
        PricingRequestTypeOrder__c pricingReqTypeOrder2 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder2.Name = '2';
        pricingReqTypeOrder2.Request_Type__c = 'Project';
        pricingReqTypeOrderList.add(pricingReqTypeOrder2);
        PricingRequestTypeOrder__c pricingReqTypeOrder3 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder3.Name = '3';
        pricingReqTypeOrder3.Request_Type__c = 'Pricing Task';
        pricingReqTypeOrderList.add(pricingReqTypeOrder3);
        PricingRequestTypeOrder__c pricingReqTypeOrder4 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder4.Name = '4';
        pricingReqTypeOrder4.Request_Type__c = 'Import';
        pricingReqTypeOrderList.add(pricingReqTypeOrder4);
        PricingRequestTypeOrder__c pricingReqTypeOrder5 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder5.Name = '5';
        pricingReqTypeOrder5.Request_Type__c = 'Massive Change';
        pricingReqTypeOrderList.add(pricingReqTypeOrder5);
        PricingRequestTypeOrder__c pricingReqTypeOrder6 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder6.Name = '6';
        pricingReqTypeOrder6.Request_Type__c = 'Non Customer Specific';
        pricingReqTypeOrderList.add(pricingReqTypeOrder6);

        insert pricingReqTypeOrderList;

        ctrlPAMain ctrlPAMainTest = new ctrlPAMain();
        String currentPageLabel = ctrlPAMainTest.currentPageLabel;
        ctrlPAMainTest.currentPageLabel = 'PAHome';
        currentPageLabel = ctrlPAMainTest.currentPageLabel;
        ctrlPAMainTest.businessAction = 'customerPrices';
        String businessAction = ctrlPAMainTest.businessAction;
        ctrlPAMainTest.setNewPageLabel('PACustomerDetail');
        String newPage = ctrlPAMainTest.newPageLabel;
        newPage = ctrlPAMainTest.getNewPageLabel();
        ctrlPAMainTest.onLoadCall();
        PageReference pageRef1 = ctrlPAMainTest.loadPage();
        PageReference pageRef2 = ctrlPAMainTest.businessComponentAction();
        ctrlPAMainTest.businessComponentActionForRerender();
        ApexPages.currentPage().getParameters().put('id',pricingRequest.Id);
        ctrlPAMainTest.businessComponentAction();
        ctrlPAMainTest.onLoadCall();
        ctrlPAMainTest.businessAction = ctrlPAMainTest.businessAction+'Next';
        if(businessAction.contains('PCL'))
        {
            ctrlPAMainTest.setNewPageLabel('PAPclTemplateSelectionPCO');
        }
        else
        {
            ctrlPAMainTest.setNewPageLabel('PACustomerRequests');
        }
        pageRef2 = ctrlPAMainTest.businessComponentAction();
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.currentPageLabel = '';
        ctrlPAMainTest.setNewPageLabel('');
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'Price Request Clone';
        ctrlPAMainTest.pageName = 'PACustomerDetail';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'Price Request Clone';
        ctrlPAMainTest.pageName = 'Sales Representative List';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'Price Request Clone';
        ctrlPAMainTest.pageName = 'Sales Representative List';
        ctrlPAMainTest.backflow = false;
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'PACustomerDetail';
        ctrlPAMainTest.pageName = 'PACustomerDetail';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        
        
        
        ctrlPAMainTest.businessAction = ctrlPAMainTest.businessAction+'Next';
        
        PAHelpLinks__c linkObj = new PAHelpLinks__c();
        linkObj.Name = 'test';
        linkObj.Help_Link__c = 'test';
        insert linkObj;
        try{
            ctrlPAMainTest.helpLink(); 
        }catch(Exception e){}       
    }
    
    
    //subbu
    static testMethod void ctrlPAMainTestMethod01()
    {
        List<PAPageComponentMapping__c> pageComponentMappingList = new List<PAPageComponentMapping__c>();
        PAPageComponentMapping__c pageComputingCS1 = new PAPageComponentMapping__c();
        pageComputingCS1.Name = 'PAHOME';
        pageComputingCS1.ComponentName__c = 'OrganizationalGroupItem';
        PAPageComponentMapping__c pageComputingCS2 = new PAPageComponentMapping__c();
        pageComputingCS2.Name = 'PAPRICINGREQUEST';
        pageComputingCS2.ComponentName__c = 'RequestItems';
        PAPageComponentMapping__c pageComputingCS3 = new PAPageComponentMapping__c();
        pageComputingCS3.Name = 'PACUSTOMERDETAIL';
        pageComputingCS3.ComponentName__c = 'ERPCustomer';
        pageComponentMappingList.add(pageComputingCS3);
        PAPageComponentMapping__c pageComputingCS4 = new PAPageComponentMapping__c();
        pageComputingCS4.Name = 'a0a';
        pageComputingCS4.ComponentName__c = 'RequestItems';
        pageComponentMappingList.add(pageComputingCS4);

        PAPageComponentMapping__c pageComputingCS5 = new PAPageComponentMapping__c();
        pageComputingCS5.Name = 'a0I';
        pageComputingCS5.ComponentName__c = 'OrganizationalGroupItem';
        pageComponentMappingList.add(pageComputingCS5);
        PAPageComponentMapping__c pageComputingCS6 = new PAPageComponentMapping__c();
        pageComputingCS6.Name = '00T';
        pageComputingCS6.ComponentName__c = 'RequestItems';
        pageComponentMappingList.add(pageComputingCS6);
        PAPageComponentMapping__c pageComputingCS7 = new PAPageComponentMapping__c();
        pageComputingCS7.Name = 'a0c';
        pageComputingCS7.ComponentName__c = 'RequestItems';
        pageComponentMappingList.add(pageComputingCS7);
        insert pageComponentMappingList;

        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'BI EMEA SURFACES';
        insert orgGroup;

        ERP_Customer__c erpCustomer = new ERP_Customer__c();
        insert erpCustomer;

        Pricing_Request__c pricingRequest = new Pricing_Request__c();
        pricingRequest.BU__c = orgGroup.Business__c;
        pricingRequest.Pricing_Request_Type__c = 'Permanent';
        pricingRequest.Request_Type__c = 'Customer Specific';
        insert pricingRequest;

        List<PAProfilePermissions__c> paProfilePermissionsList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Sales Admin';
        paProfilePermissionsList.add(paProfilePermissions1);


        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'Approver';
        paProfilePermissionsList.add(paProfilePermissions2);

        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        paProfilePermissionsList.add(paProfilePermissions3);

        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        paProfilePermissionsList.add(paProfilePermissions4);

        insert paProfilePermissionsList;
        List<PricingRequestTypeOrder__c> pricingReqTypeOrderList = new List<PricingRequestTypeOrder__c>();
        PricingRequestTypeOrder__c pricingReqTypeOrder1 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder1.Name = '1';
        pricingReqTypeOrder1.Request_Type__c = 'Customer Price';
        pricingReqTypeOrderList.add(pricingReqTypeOrder1);
        PricingRequestTypeOrder__c pricingReqTypeOrder2 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder2.Name = '2';
        pricingReqTypeOrder2.Request_Type__c = 'Project';
        pricingReqTypeOrderList.add(pricingReqTypeOrder2);
        PricingRequestTypeOrder__c pricingReqTypeOrder3 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder3.Name = '3';
        pricingReqTypeOrder3.Request_Type__c = 'Pricing Task';
        pricingReqTypeOrderList.add(pricingReqTypeOrder3);
        PricingRequestTypeOrder__c pricingReqTypeOrder4 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder4.Name = '4';
        pricingReqTypeOrder4.Request_Type__c = 'Import';
        pricingReqTypeOrderList.add(pricingReqTypeOrder4);
        PricingRequestTypeOrder__c pricingReqTypeOrder5 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder5.Name = '5';
        pricingReqTypeOrder5.Request_Type__c = 'Massive Change';
        pricingReqTypeOrderList.add(pricingReqTypeOrder5);
        PricingRequestTypeOrder__c pricingReqTypeOrder6 = new PricingRequestTypeOrder__c();
        pricingReqTypeOrder6.Name = '6';
        pricingReqTypeOrder6.Request_Type__c = 'Non Customer Specific';
        pricingReqTypeOrderList.add(pricingReqTypeOrder6);

        insert pricingReqTypeOrderList;

        ctrlPAMain ctrlPAMainTest = new ctrlPAMain();
        String currentPageLabel = ctrlPAMainTest.currentPageLabel;
        ctrlPAMainTest.currentPageLabel = 'PAHome1';
        
        currentPageLabel = ctrlPAMainTest.currentPageLabel;
        ctrlPAMainTest.businessAction = 'customerPrices';
        String businessAction = ctrlPAMainTest.businessAction;
        ctrlPAMainTest.setNewPageLabel('PACustomerDetail');
        String newPage = ctrlPAMainTest.newPageLabel;
        newPage = ctrlPAMainTest.getNewPageLabel();
        ctrlPAMainTest.onLoadCall();
        PageReference pageRef1 = ctrlPAMainTest.loadPage();
        PageReference pageRef2 = ctrlPAMainTest.businessComponentAction();
        ctrlPAMainTest.businessComponentActionForRerender();
        ApexPages.currentPage().getParameters().put('id',pricingRequest.Id);
        ctrlPAMainTest.businessComponentAction();
        ctrlPAMainTest.onLoadCall();
        ctrlPAMainTest.businessAction = ctrlPAMainTest.businessAction+'Next';
        if(businessAction.contains('PCL'))
        {
            ctrlPAMainTest.setNewPageLabel('PAPclTemplateSelectionPCO');
        }
        else
        {
            ctrlPAMainTest.setNewPageLabel('PACustomerRequests');
        }
        
        //subbu
        /*
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
            PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
            PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
            PRProc1.SAP_Application_Id__c='V';
            PRProc1.SAP_Client_Id__c='510';
            PRProc1.SAP_Cluster__c='CB1';
            PRProc1.Status__C='Active';
            insert PRProc1;
        
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
            
            Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
            orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
            orgGrpUser1.OrgGroup__c = orgGrp1.Id;
            orgGrpUser1.Related_User__c = user1.Id;
            orgGrpUser1.Access_Level__c = 'Read-Write';
            insert orgGrpUser1;
        
        
        PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
            paOGItems.selectedBU = orgGrp.id; 
            paOGItems.selectedUser =User1.id;     
        
        PAServiceState paSS = new PAServiceState();
            paSS.ogItems=paOGItems;
            PAService paService = new PAService();
            paService.paServiceState = paSS;
            paService.paServiceState.currentRequest = new PARequest(paSS);
            paService.paServiceState.currentRequest.keyCombination = new PAKeyCombination(paSS);
          //  paService.paServiceState.currentRequest.keyCombination.keyCombinationID = kcList[0].id;
            paService.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(paSS);
            
            */
        
        pageRef2 = ctrlPAMainTest.businessComponentAction();
        ctrlPAMainTest.onLoadCall();
        //edited-subbu
        ctrlPAMainTest.currentPageLabel = 'PAHome1';
        ctrlPAMainTest.setNewPageLabel('PACustomerDetail');
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'Price Request Clone PACustomerDetail Price Request Clone Clone PACustomerDetail';
        ctrlPAMainTest.pageName = 'PACustomerDetail';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'Price Request Clone PACustomerDetail Price Request Clone Clone PACustomerDetail';
        ctrlPAMainTest.pageName = 'PACustomerDetail';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        
      /*  ctrlPAMainTest.navigationText = 'Price Request Clone';
        ctrlPAMainTest.pageName = 'Sales Representative List';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'Price Request Clone';
        ctrlPAMainTest.pageName = 'Sales Representative List';
        ctrlPAMainTest.backflow = false;
        ctrlPAMainTest.onLoadCall();
        
        ctrlPAMainTest.navigationText = 'PACustomerDetail';
        ctrlPAMainTest.pageName = 'PACustomerDetail';
        ctrlPAMainTest.backflow = true;
        ctrlPAMainTest.onLoadCall();
        */
        
        
        ctrlPAMainTest.businessAction = ctrlPAMainTest.businessAction+'Next';
        
        PAHelpLinks__c linkObj = new PAHelpLinks__c();
        linkObj.Name = 'test';
        linkObj.Help_Link__c = 'test';
        insert linkObj;
        try{
            ctrlPAMainTest.helpLink();
        }catch(Exception e){}        
    }
    
    
    static testMethod void ctrlPAMainTestMethod1(){
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
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'Manager FirstName','Manager LastName');
        insert managerUser;
        User usr = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        usr.managerId = managerUser.id;
        insert usr;
         //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(usr){
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
            PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
            PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
            PRProc1.SAP_Application_Id__c='V';
            PRProc1.SAP_Client_Id__c='510';
            PRProc1.SAP_Cluster__c='CB1';
            PRProc1.Status__C='Active';
            insert PRProc1;
            
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
            
            Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
            orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
            orgGrpUser1.OrgGroup__c = orgGrp1.Id;
            orgGrpUser1.Related_User__c = usr.Id;
            orgGrpUser1.Access_Level__c = 'Read-Write';
            insert orgGrpUser1;
            
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                 Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
            paOGItems.selectedBU = orgGrp.id; 
            paOGItems.selectedUser =Usr.id;         
            
                
            PAServiceState paSS = new PAServiceState();
            paSS.ogItems=paOGItems;
            PAService paService = new PAService();
            paService.paServiceState = paSS;
            paService.paServiceState.currentRequest = new PARequest(paSS);
            paService.paServiceState.currentRequest.keyCombination = new PAKeyCombination(paSS);
            paService.paServiceState.currentRequest.keyCombination.keyCombinationID = kcList[0].id;
            paService.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(paSS);
            
            ctrlPAMain ctrlPAMainTest = new ctrlPAMain();
            ctrlPAMainTest.service = paService;
            ctrlPAMainTest.disableDone();
            paService.paServiceState.currentRequest.keyCombination.keyCombinationID = '--Select--';
            ctrlPAMainTest.disableDone();
        }  
    }
    
    
    //july09_Subbu
     static testMethod void ctrlPAMainTestMethod2(){
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
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'Manager FirstName','Manager LastName');
        insert managerUser;
        User usr = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        usr.managerId = managerUser.id;
        insert usr;
         //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(usr){
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
            PRProc1.Pricing_Procedure_Code__c='MCM AP Paste F418,F429,F442,F474,F478,F4B1,F4F1 Sales Pricing Procedure';
            PRProc1.Pricing_Procedure_Description__c='MCM AP Paste';
            PRProc1.SAP_Application_Id__c='V';
            PRProc1.SAP_Client_Id__c='510';
            PRProc1.SAP_Cluster__c='CB1';
            PRProc1.Status__C='Active';
            insert PRProc1;
            
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
            
            Organizational_Group_User__c orgGrpUser1 = new Organizational_Group_User__c();
            orgGrpUser1.Organizational_Group_Item__c = orgGrpItm.Id; 
            orgGrpUser1.OrgGroup__c = orgGrp1.Id;
            orgGrpUser1.Related_User__c = usr.Id;
            orgGrpUser1.Access_Level__c = 'Read-Write';
            insert orgGrpUser1;
            
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                 Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
            paOGItems.selectedBU = orgGrp.id; 
            paOGItems.selectedUser =Usr.id;         
            
                
            PAServiceState paSS = new PAServiceState();
            paSS.ogItems=paOGItems;
            PAService paService = new PAService();
            paService.paServiceState = paSS;
            paService.paServiceState.currentRequest = new PARequest(paSS);
            paService.paServiceState.currentRequest.keyCombination = new PAKeyCombination(paSS);
            paService.paServiceState.currentRequest.keyCombination.keyCombinationID = kcList[0].id;
            paService.paServiceState.currentRequest.keyCombination.pckcconcat = 'test';
            
            paService.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(pass);
            
            ctrlPAMain ctrlPAMainTest = new ctrlPAMain();
            ctrlPAMainTest.service = paService;
            ctrlPAMainTest.disableDone();
            paService.paServiceState.currentRequest.keyCombination.keyCombinationID = '--Select--';
            ctrlPAMainTest.disableDone();
            ctrlPAMainTest.dummyFunction();
            ctrlPAMainTest.keyComb = 'test';
            ctrlPAMainTest.BUName = 'test1';
            ctrlPAMainTest.newlink = 'test2';
            ctrlPAMainTest.sVolume = 'test3';
            ctrlPAMainTest.saveStateflag = true;
            
            ctrlPAMainTest.getValiditySetDates();
            ctrlPAMainTest.getValidityGetDates();
            
            PAPageComponentMapping__c pageComputingCS1 = new PAPageComponentMapping__c(Name = 'PAHOME',ComponentName__c = 'OrganizationalGroupItem');
            insert pageComputingCS1;
            activePrices active=new activePrices();
            ctrlPAMain ctrlPAMainTest1=new ctrlPAMain (active);
            ctrlPAMainTest1.currentPageLabel = 'PAHome';
            String currentPageLabel = ctrlPAMainTest1.currentPageLabel;
            ctrlPAMainTest1.businessAction = 'ActivePrices';
            String businessAction = ctrlPAMainTest1.businessAction;
            ctrlPAMainTest1.NewPageLabel='Active_Prices_Batch';
            String newPageLabel = ctrlPAMainTest1.newPageLabel;
            ctrlPAMainTest1.onLoadCall();
            PageReference pageRef2 = ctrlPAMainTest1.businessComponentAction();
            PageReference pageRef3=new PageReference('/apex/Active_Prices_Batch?BuName=null');
            system.assertEquals(pageRef3.getUrl(),pageRef2.getUrl());
        }  
    }
}