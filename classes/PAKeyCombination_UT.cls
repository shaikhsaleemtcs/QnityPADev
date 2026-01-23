// Please dont edit this class - if this is throwing any error please inform nitin_s01@infosys.com
@isTest
private class PAKeyCombination_UT {
    static testMethod void paKeyCombinationTestMethod() {
        PAProfilePermissions__c proPermission1 = new PAProfilePermissions__c(Name='Sales Admin',Name__c='Price Approval-Sales Admin',API_Name__c='Price_Approval_Sales_Admin');
        PAProfilePermissions__c proPermission2 = new PAProfilePermissions__c(Name='Approver',Name__c='Price Approval-Approver',API_Name__c='Price_Approval_Approver');
        PAProfilePermissions__c proPermission3 = new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin');
        PAProfilePermissions__c proPermission4 = new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester');
        PAProfilePermissions__c proPermission5 = new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin');
        PAProfilePermissions__c proPermission6 = new PAProfilePermissions__c(Name='Floor section',Name__c='Floor_section_enabler');
        Insert proPermission1;
        Insert proPermission2;
        Insert proPermission3;
        Insert proPermission4;
        Insert proPermission5;
        Insert proPermission6;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',recordtypeId=rtypes[0].Id);
        OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
        Insert orgGroup1;
        Insert orgGroup2;
        
        ERP_Pricing_Procedure__c priProcedure = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DA640',Pricing_Procedure_Description__c='BI EMEA Surfaces');
        Insert priProcedure;
        
        Organizational_Group_Item__c orgGroupItem = new Organizational_Group_Item__c(Business__c=orgGroup1.id,OrgGroup__c=orgGroup2.id,ERP_Pricing_Procedure__c=priProcedure.id);
        Insert orgGroupItem;
        
        ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
        ERP_Key_Combination__c keyCombObj3 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=true,Key_Combination_type__c='Spot');
        Insert keyCombObj1;
        Insert keyCombObj2;
        Insert keyCombObj3;
        
        ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
        ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
        Insert priCondObj1;
        Insert priCondObj2;
        
        ERP_Procedure_Conditions__c proCond1 = new ERP_Procedure_Conditions__c(Pricing_Condition__c=priCondObj1.id,Sales_Pricing_Procedure__c=priProcedure.id);
        ERP_Procedure_Conditions__c proCond2 = new ERP_Procedure_Conditions__c(Pricing_Condition__c=priCondObj2.id,Sales_Pricing_Procedure__c=priProcedure.id);
        ERP_Procedure_Conditions__c proCond3 = new ERP_Procedure_Conditions__c(Pricing_Condition__c=priCondObj2.id,Sales_Pricing_Procedure__c=priProcedure.id);
        Insert proCond1;
        Insert proCond2;
        Insert proCond3;
        
        ERP_Access_Sequence__c accSeq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=priProcedure.id,Pricing_Condition__c=priCondObj1.id,Pricing_Key_Combination__c=keyCombObj1.id);
        ERP_Access_Sequence__c accSeq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=priProcedure.id,Pricing_Condition__c=priCondObj2.id,Pricing_Key_Combination__c=keyCombObj2.id);
        ERP_Access_Sequence__c accSeq3 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=priProcedure.id,Pricing_Condition__c=priCondObj2.id,Pricing_Key_Combination__c=keyCombObj3.id);
        Insert accSeq1;
        Insert accSeq2;
        Insert accSeq3;
        Test.StartTest();
        
        PAServiceState serviceState = new PAServiceState();
        //PAOrganizationalGroupItems ogItem = new PAOrganizationalGroupItems();
        serviceState.ogItems = new PAOrganizationalGroupItems();
        serviceState.ogItems.selectedBU = orgGroup1.id;
        serviceState.ogItems.isProjectGroupMember = false;
        
        
        serviceState.currentRequest = new PARequest(serviceState);
        serviceState.currentRequest.pricingRequest = new Pricing_Request__c(Sales_Org_Code__c='A640-SurfDip',Dist_Channel_Code__c='10',Division_Code__c='02');
        serviceState.currentRequest.pricingCondition = new PAPricingCondition(serviceState);
        //serviceState.currentRequest.requestServicestate = serviceState;
        PAKeyCombination keyComb = new PAKeyCombination(serviceState);
        
        
        
        serviceState.currentRequest.salesPriceSAP  = new PASalesPriceSAP(serviceState);
        
        keyComb.setkeyCombinationID(keyCombObj1.id);
        keyComb.PCLselectedKeyCombination = new List<string>();
        keyComb.PCLselectedKeyCombination.add(keyCombObj1.id);
        keyComb.PCLselectedKeyCombination.add(keyCombObj2.id);
        keyComb.getKeyCombinationName();
       // KeyComb.pckcList();
        keyComb.getkeyCombinationID();
        keyComb.getKCFromName(keyCombObj1.Key_Combination_Code__c);
        keyComb.getKCFromCodeAndCluster(keyCombObj1.Key_Combination_Code__c,'CB1');
        PAKeyCombination.canRunFromTestClass = true;
        //keyComb.pc = new PAPricingCondition(serviceState);
        keyComb.pc.PCLselectedPricingCondition = new List<string>();
        keyComb.pc.PCLselectedPricingCondition.add(priCondObj1.id);
        keyComb.pc.PCLselectedPricingCondition.add(priCondObj2.id);
        keyComb.getKCFromCodeAndSAPCluster(keyCombObj1.Key_Combination_Code__c,keyCombObj1.SAP_Cluster__c,keyCombObj1.SAP_Application_Id__c, keyCombObj1.SAP_Client_Id__c);
        keyComb.getPCKCFromCodeAndSAPCluster(priCondObj1.Pricing_Condition_Code__c,keyCombObj1.Key_Combination_Code__c,keyCombObj1.SAP_Cluster__c,keyCombObj1.SAP_Application_Id__c, keyCombObj1.SAP_Client_Id__c);
        keyComb.keyCombinationServiceState.ogItems.selectedBU = orgGroup1.id;
        keyComb.pc.selectedPricingCondition = priCondObj1.id;
        keyComb.getListOptions();
        keyComb.pc.selectedPricingCondition = '--Select--';
        keyComb.getListOptions();
        keyComb.pc.selectedPricingCondition = priCondObj2.id;
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = true;
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Project Pricing';
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Pricing Task';
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Floor';
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.ogItems = new PAOrganizationalGroupItems();
        keyComb.keyCombinationServiceState.ogItems.value = 'NonCustReasons';
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Non Customer Specific';
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c = 'Non Customer Specific';
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Permanent';     
        keyComb.keyCombinationServiceState.ogItems.value = 'Export';
        keyComb.getListOptions();
      //  keyComb.getListPcKc();
        //apac
        keyComb.setkeyCombinationID('callKCSetter');
        
        
        keyComb.getListWrappers();
        keyComb.add();
        keyComb.save();
        keyComb.deleteRecord();
        keyComb.validate('test');
        keyComb.action('newPageLabel','currentPageLabel','desiredAction');
        keyComb.getName();
        keyComb.getType();
        //keyComb.pckcList();
        keyComb.setKeyCombinationName(keyCombObj1.Key_Combination__c);
        keyComb.keyComb = keyCombObj1.Key_Combination__c;
        String ksc = keyComb.keyComb;
        keyComb.accSequence = accSeq1;
        List<HideFloorSection__mdt> hfs = HideFloorSection__mdt.getAll().values();
        keyComb.Floorpricepermission = true;
        keyComb.pckcconcat = 'test-test: test-test';
        keyComb.keyCombinationServiceState.ogItems.value = 'Ship to';
        //keyComb.getListPcKc();
        keyComb.setKCFromPCKCConcat();
        keyComb.getListBusinessComponents();
        //apac
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c = null;
        keyComb.keyCombinationServiceState.erpCustomer = new PAERPCustomer(keyComb.keyCombinationServiceState);
        keyComb.keyCombinationServiceState.erpCustomer.paERPCustomer = new ERP_Customer__c(Sales_Org_Code__c = 'test');
        keyComb.keyCombinationServiceState.currentRequest.customer = keyComb.keyCombinationServiceState.erpCustomer;
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest = null;
        keyComb.keyCombinationServiceState.erpCustomer = null;
        keyComb.getListOptions();
     //   keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
       // keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Non Customer Specific';
      //  keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c = 'Non Customer Specific';
       // keyComb.getListPcKc();
                
        keyComb.setKeyCombinationName(keyCombObj1.Key_Combination__c);
        
        Test.StopTest();
    }
    
     static testMethod void paKeyCombinationTestMethod2() {
        PAProfilePermissions__c proPermission1 = new PAProfilePermissions__c(Name='Sales Admin',Name__c='Price Approval-Sales Admin',API_Name__c='Price_Approval_Sales_Admin');
        PAProfilePermissions__c proPermission2 = new PAProfilePermissions__c(Name='Approver',Name__c='Price Approval-Approver',API_Name__c='Price_Approval_Approver');
        PAProfilePermissions__c proPermission3 = new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin');
        PAProfilePermissions__c proPermission4 = new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester');
        PAProfilePermissions__c proPermission5 = new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin');
        Insert proPermission1;
        Insert proPermission2;
        Insert proPermission3;
        Insert proPermission4;
        Insert proPermission5;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',recordtypeId=rtypes[0].Id);
        OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
        Insert orgGroup1;
        Insert orgGroup2;
        
        ERP_Pricing_Procedure__c priProcedure = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DA640',Pricing_Procedure_Description__c='BI EMEA Surfaces');
        Insert priProcedure;
        
        Organizational_Group_Item__c orgGroupItem = new Organizational_Group_Item__c(Business__c=orgGroup1.id,OrgGroup__c=orgGroup2.id,ERP_Pricing_Procedure__c=priProcedure.id);
        Insert orgGroupItem;
        
        ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
        ERP_Key_Combination__c keyCombObj3 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=true,Key_Combination_type__c='Spot');
        Insert keyCombObj1;
        Insert keyCombObj2;
        Insert keyCombObj3;
        
        ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
        ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
        Insert priCondObj1;
        Insert priCondObj2;
        
        ERP_Procedure_Conditions__c proCond1 = new ERP_Procedure_Conditions__c(Pricing_Condition__c=priCondObj1.id,Sales_Pricing_Procedure__c=priProcedure.id);
        ERP_Procedure_Conditions__c proCond2 = new ERP_Procedure_Conditions__c(Pricing_Condition__c=priCondObj2.id,Sales_Pricing_Procedure__c=priProcedure.id);
        ERP_Procedure_Conditions__c proCond3 = new ERP_Procedure_Conditions__c(Pricing_Condition__c=priCondObj2.id,Sales_Pricing_Procedure__c=priProcedure.id);
        Insert proCond1;
        Insert proCond2;
        Insert proCond3;
        
        ERP_Access_Sequence__c accSeq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=priProcedure.id,Pricing_Condition__c=priCondObj1.id,Pricing_Key_Combination__c=keyCombObj1.id);
        ERP_Access_Sequence__c accSeq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=priProcedure.id,Pricing_Condition__c=priCondObj2.id,Pricing_Key_Combination__c=keyCombObj2.id);
        ERP_Access_Sequence__c accSeq3 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=priProcedure.id,Pricing_Condition__c=priCondObj2.id,Pricing_Key_Combination__c=keyCombObj3.id);
        Insert accSeq1;
        Insert accSeq2;
        Insert accSeq3;
       
        Test.StartTest();
        
        PAServiceState serviceState = new PAServiceState();
        //PAOrganizationalGroupItems ogItem = new PAOrganizationalGroupItems();
        serviceState.ogItems = new PAOrganizationalGroupItems();
        serviceState.ogItems.selectedBU = orgGroup1.id;
        serviceState.ogItems.isProjectGroupMember = false;
        
        
        serviceState.currentRequest = new PARequest(serviceState);
        serviceState.currentRequest.pricingRequest = new Pricing_Request__c(Sales_Org_Code__c='A640-SurfDip',Dist_Channel_Code__c='10',Division_Code__c='02');
        serviceState.currentRequest.pricingCondition = new PAPricingCondition(serviceState);
        //serviceState.currentRequest.requestServicestate = serviceState;
        PAKeyCombination keyComb = new PAKeyCombination(serviceState);
        
        
        
        serviceState.currentRequest.salesPriceSAP  = new PASalesPriceSAP(serviceState);
        
        keyComb.setkeyCombinationID(keyCombObj1.id);
        keyComb.PCLselectedKeyCombination = new List<string>();
        keyComb.PCLselectedKeyCombination.add(keyCombObj1.id);
        keyComb.PCLselectedKeyCombination.add(keyCombObj2.id);
        keyComb.getKeyCombinationName();
        keyComb.getkeyCombinationID();
        keyComb.getKCFromName(keyCombObj1.Key_Combination_Code__c);
        keyComb.getKCFromCodeAndCluster(keyCombObj1.Key_Combination_Code__c,'CB1');
        
        //keyComb.pc = new PAPricingCondition(serviceState);
        keyComb.pc.PCLselectedPricingCondition = new List<string>();
        keyComb.pc.PCLselectedPricingCondition.add(priCondObj1.id);
        keyComb.pc.PCLselectedPricingCondition.add(priCondObj2.id);
        keyComb.getKCFromCodeAndSAPCluster(keyCombObj1.Key_Combination_Code__c,keyCombObj1.SAP_Cluster__c,keyCombObj1.SAP_Application_Id__c, keyCombObj1.SAP_Client_Id__c);
        keyComb.getPCKCFromCodeAndSAPCluster(priCondObj1.Pricing_Condition_Code__c,keyCombObj1.Key_Combination_Code__c,keyCombObj1.SAP_Cluster__c,keyCombObj1.SAP_Application_Id__c, keyCombObj1.SAP_Client_Id__c);
        keyComb.keyCombinationServiceState.ogItems.selectedBU = orgGroup1.id;
        keyComb.pc.selectedPricingCondition = priCondObj1.id;
        keyComb.getListOptions();
        keyComb.pc.selectedPricingCondition = '--Select--';
        keyComb.getListOptions();
        keyComb.pc.selectedPricingCondition = priCondObj2.id;
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = true;
        keyComb.getListOptions();
        /*keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Project Pricing';
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Pricing Task';
        keyComb.getListOptions();*/
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c = false;
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Non Customer Specific';
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c = 'Non Customer Specific';
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Permanent';  
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Spot_Type__c ='Display';
        keyComb.keyCombinationServiceState.ogItems.value = 'Export';
     //   keyComb.keyCombinationServiceState.currentRequest.filtercode = '';
        keyComb.getListOptions();
       // keyComb.getListPcKc();
        //apac
        keyComb.setkeyCombinationID('callKCSetter');
        
        
        keyComb.getListWrappers();
        keyComb.add();
        keyComb.save();
        keyComb.deleteRecord();
        keyComb.validate('test');
        keyComb.action('newPageLabel','currentPageLabel','desiredAction');
        keyComb.getName();
        keyComb.getType();
        //keyComb.pckcList();
        keyComb.setKeyCombinationName(keyCombObj1.Key_Combination__c);
        keyComb.keyComb = keyCombObj1.Key_Combination__c;
        keyComb.pckcconcat = 'test-test: test-test';
        keyComb.keyCombinationServiceState.ogItems.value = 'Ship to';
       // keyComb.getListPcKc();
        keyComb.setKCFromPCKCConcat();
        keyComb.getListBusinessComponents();
        //apac
        keyComb.keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c = null;
        keyComb.keyCombinationServiceState.erpCustomer = new PAERPCustomer(keyComb.keyCombinationServiceState);
        keyComb.keyCombinationServiceState.erpCustomer.paERPCustomer = new ERP_Customer__c(Sales_Org_Code__c = 'test');
        keyComb.keyCombinationServiceState.currentRequest.customer = keyComb.keyCombinationServiceState.erpCustomer;
        keyComb.getListOptions();
        keyComb.keyCombinationServiceState.currentRequest = null;
        //keyComb.keyCombinationServiceState.erpCustomer = null;
        PAKeyCombination.canRunFromTestClass = false;
        keyComb.getListOptions();
        
                
        keyComb.setKeyCombinationName(keyCombObj1.Key_Combination__c);
        
        Test.StopTest();
    }
    
    public static testMethod void paRequestTestMethod1_1_1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                     Price_Types__c = 'Pricing Task-FOC', Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            
            
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640');
            service.paServiceState.currentRequest.action('','','NewPricingRequestsaveNon Customer Specific');
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer');
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            
            //Exception NewPricingRequessave
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq');
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            }
            catch(Exception e){}
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Terms_Of_Payment__c='Other',Due_Date__c=eqVT.addDays(-1));
                service.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Incoterm__c='Other',Due_Date__c=eqVT.addDays(-1));
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            //cloned req
            
            try
            {
                /* Pricing_Request__c pr = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640',on_Behalf_Of__c=u1.Id,
Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div1',Dist_Channel__c='Dist',Sales_Org__c='salesOrg'
);
insert pr; 
service.paServiceState.currentRequest.pricingRequest = pr;                                                       
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c(Pricing_Request__c=pr.id);
insert prItem;*/
                service.paServiceState.currentRequest.action('','','Clonesave');
            }
            catch(Exception e)
            {
                
            }
            
            Test.startTest();
            //Next spot type !=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');

//Next spot type !=FOC
service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='Other',Terms_Of_Payment__c='None-1',
Non_Standard_Incoterm__c='NonStd',Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');*/
            
            
            //Next spot type=FOC
            service.paServiceState.currentRequest.userSelected = u1.id;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
                                                                                          due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
            service.paServiceState.currentRequest.action('','','Next'); 

            //NewPricingReqItem
            /*service.paServiceState.currentRequest.action('','','NewPricingReqItem');*/
            
           service.paServiceState.currentRequest.userSelected = u1.id;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Display',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
                                                                                          due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
            service.paServiceState.currentRequest.action('','','Next'); 
            Test.stopTest();
            
            
            
        }
        
    }
    
    
}