/*
 * Name      :   PAPricingCondition_UT
 * Description  :   This is the test class for PAPricingCondition
 * Author      :   Infosys Limited
 * Created Date :   21-03-2013
 *
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class PAPricingCondition_UT
{
    static testMethod void paPricingConditionTestMethod()
    {
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
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'IT Admin';
        paProfilePermissionsList.add(paProfilePermissions5);

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

        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = 'test';
        erpPricingProcedure.Pricing_Procedure__c = 'Test';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'Test';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'Test';
        erpPricingProcedure.Pricing_Procedure__c = 'Test';
        erpPricingProcedure.SAP_Application_Id__c = 'Test';
        erpPricingProcedure.SAP_Client_Id__c = 'Test';
        erpPricingProcedure.SAP_Cluster__c = 'test';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;

        RecordType buRecType = [select Id,Name from Recordtype where Name = 'Business'];
        RecordType salesAreaRecType = [select Id,Name from Recordtype where Name = 'ERP Sales Area'];
        List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>();
        OrgGroup__c orgGroup1 = new OrgGroup__c(); 
        orgGroup1.Business__c = 'BI';
        orgGroup1.RecordTypeId = buRecType.Id;
        orgGroupList.add(orgGroup1);
        OrgGroup__c orgGroup2 = new OrgGroup__c();
        orgGroup2.ERP_Distribution_Channel_Code__c = '10';
        orgGroup2.ERP_Sales_Org_Code__c = 'A640';
        orgGroup2.ERP_Division_Code__c = '02';
        orgGroup2.RecordTypeId = salesAreaRecType.Id;
        orgGroupList.add(orgGroup2);
        insert orgGroupList;

        Organizational_Group_Item__c orgGrpItem = new Organizational_Group_Item__c();
        orgGrpItem.Business__c = orgGroup1.Id;
        orgGrpItem.OrgGroup__c = orgGroup2.Id;
        orgGrpItem.CurrencyIsoCode = 'USD';
        //orgGrpItem.Approval_Escalation_Price_Requests = 23;
        orgGrpItem.ERP_Currency__c = 'USD;RUB';
        orgGrpItem.ERP_UoM__c = 'EA;SH';
        orgGrpItem.Include_Customer_Currency__c = false;
        orgGrpItem.Latest_Valid_From_Offset_Non_Cust_Spec__c = 90;
        orgGrpItem.Latest_Valid_To_Offset_Cust_Spec__c = 12;
        orgGrpItem.Latest_Valid_To_Offset_Non_Cust_Spec__c = 12;
        orgGrpItem.Max_Valid_From_Offset_Cust_Spec__c = 90;
        orgGrpItem.Non_Customer_Permanent_Request_Reasons__c = 'Extending current prices;New materials;Periodic price review;Other reason;Pricing Compaign;Seasonal price';
        orgGrpItem.Retroactive_Limit__c = 0;
        orgGrpItem.Customer_Request_Reasons__c = 'Seasonal price;Pricing campaign;Slow moving inventory;Customer negotiation;New customer;New materials;Competitive pricing;Extending current prices;Other reason';
        orgGrpItem.Pricing_Task_Reasons__c = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        insert orgGrpItem;

        List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); 
        Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
        pricingRequest1.Pricing_Request_Type__c = 'Permanent';
        pricingRequest1.Request_Type__c = 'Customer Specific';
        pricingRequest1.BU__c='TEST1';
        pricingRequestList.add(pricingRequest1);
        Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.BU__c='TEST2';
        pricingRequestList.add(pricingRequest2);
        Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
        pricingRequest3.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest3.Request_Type__c = 'Customer Specific';
        pricingRequest3.Spot_Type__c = 'Spot Price';
        pricingRequest3.BU__c='TEST3';
        pricingRequestList.add(pricingRequest3);
        Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
        pricingRequest4.Request_Type__c = 'Non Customer Specific';
        pricingRequest4.BU__c='TEST4';
        pricingRequestList.add(pricingRequest4);
        Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
        pricingRequest5.BU__c='TEST5';
        pricingRequestList.add(pricingRequest5);
        Pricing_Request__c pricingRequest6 = new Pricing_Request__c();
        pricingRequest6.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest6.Request_Type__c = 'Customer Specific';
        pricingRequest6.Spot_Type__c = 'Free of Charge';
        pricingRequest6.BU__c='TEST6';
        pricingRequestList.add(pricingRequest6);
        Pricing_Request__c pricingRequest7 = new Pricing_Request__c();
        pricingRequest7.Pricing_Request_Type__c = 'Pricing Task';
        pricingRequest7.Request_Type__c = 'Customer Specific';
        pricingRequest7.Spot_Type__c = 'Display';
        pricingRequest7.BU__c='TEST7';
        pricingRequestList.add(pricingRequest7);
        insert pricingRequestList;

        List<ERP_Customer__c> erpCustomerList = new List<ERP_Customer__c>(); 
        ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Customer_Code__c = 'T001';
        erpCustomer1.Sales_Org_Code__c = 'A640';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        erpCustomerList.add(erpCustomer1);
        ERP_Customer__c erpCustomer2 = new ERP_Customer__c();
        erpCustomerList.add(erpCustomer2);
        insert erpCustomerList;

        List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
        pricingCondition1.Pricing_Condition_Code__c = 'ZPSE';
        pricingCondition1.Pricing_Condition__c = 'ZPSE';
        pricingCondition1.SAP_Cluster__c = 'CB1';
        pricingCondition1.SAP_Application_Id__c = '510';
        pricingCondition1.SAP_Client_Id__c = 'V';
        pricingCondition1.Price_Types__c = 'Standard;Spot;Project';
        pricingCondition1.SAP_Condition_Type__c = true;
        pricingCondition1.Condition_class__c = 'Price';
        pricingConditionsList.add(pricingCondition1);
        ERP_Pricing_Condition__c pricingCondition2 = new ERP_Pricing_Condition__c();
        pricingCondition2.Pricing_Condition_Code__c = 'ZPNB';
        pricingCondition2.Pricing_Condition__c = 'ZPNB';
        pricingCondition2.SAP_Cluster__c = 'CB1';
        pricingCondition2.SAP_Application_Id__c = '510';
        pricingCondition2.SAP_Client_Id__c = 'V';
        pricingCondition1.Price_Types__c = 'Standard;Spot;Project';
        pricingCondition1.Condition_class__c = 'Discount';
        pricingConditionsList.add(pricingCondition2);
        insert pricingConditionsList;

        List<ERP_Procedure_Conditions__c> erpProcedureConditionsList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c erpProcedureCond1 = new ERP_Procedure_Conditions__c();
        erpProcedureCond1.Sales_Pricing_Procedure__c = erpPricingProcedure.Id;
        erpProcedureCond1.Pricing_Condition__c = pricingCondition1.Id;
        erpProcedureConditionsList.add(erpProcedureCond1);
        ERP_Procedure_Conditions__c erpProcedureCond2 = new ERP_Procedure_Conditions__c();
        erpProcedureCond2.Sales_Pricing_Procedure__c = erpPricingProcedure.Id;
        erpProcedureCond2.Pricing_Condition__c = pricingCondition2.Id;
        erpProcedureConditionsList.add(erpProcedureCond2);
        insert erpProcedureConditionsList;

        PAServiceState paServiceState = new PAServiceState();
        PAServiceState paServiceState1 = new PAServiceState();
        PAPricingCondition paPricingConditionTest;
        PAPricingCondition paPricingConditionTest1;

        paPricingConditionTest = new PAPricingCondition(paServiceState);

        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup1.Id;
        paOrgGroupItems.isProjectGroupMember = true;
        paServiceState.ogItems = paOrgGroupItems;

        PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
        paERPCustomer.paERPCustomer = erpCustomer1;
        paServiceState.erpCustomer = paERPCustomer;

        PARequest paRequest = new PARequest(paServiceState);
        paServiceState.currentRequest = paRequest;
        paServiceState.currentRequest.pricingRequest = pricingRequest1;
        paServiceState.currentRequest.customer = paERPCustomer;
        paPricingConditionTest = new PAPricingCondition(paRequest);


        paPricingConditionTest = new PAPricingCondition(paServiceState);
        paPricingConditionTest.getListOptions();
        paPricingConditionTest.getListWrappers();
        paPricingConditionTest.getPCFromCodeAndCluster('ZPSE','CB1');
        paPricingConditionTest.getPCFromCodeAndSAPCluster('ZPSE','CB1','510','V');

        paPricingConditionTest.getPCFromName('ZPSE');
        paPricingConditionTest.setSelectedPricingConditionName('ZPSE');
        paPricingConditionTest.PCLselectedPricingCondition = new List<String>();
        paPricingConditionTest.PCLselectedPricingCondition.add(pricingCondition1.Id);
        paPricingConditionTest.PCLselectedPricingCondition.add(pricingCondition2.Id);
        paPricingConditionTest.getSelectedPricingConditionName();
        paPricingConditionTest.save();
        paPricingConditionTest.add();
        paPricingConditionTest.deleteRecord();
        String name = paPricingConditionTest.getName();
        List<sObject> sObjList = paPricingConditionTest.getListBusinessComponents();    
        String validate = paPricingConditionTest.validate('desiredAction');
        String action = paPricingConditionTest.action('newPageLabel','currentPageLabel','desiredAction');

        paPricingConditionTest.pricingConditionState.currentRequest.pricingRequest = pricingRequest2;
        paPricingConditionTest.getListOptions();

        paPricingConditionTest.pricingConditionState.currentRequest.pricingRequest = pricingRequest3;
        paPricingConditionTest.getListOptions();
        paPricingConditionTest.pricingConditionState.currentRequest.pricingRequest = pricingRequest6;
        paPricingConditionTest.getListOptions();
        paPricingConditionTest.pricingConditionState.currentRequest.pricingRequest = pricingRequest7;
        paPricingConditionTest.getListOptions();

        paPricingConditionTest.pricingConditionState.currentRequest.pricingRequest = pricingRequest4;
        paPricingConditionTest.getListOptions();

        PAOrganizationalGroupItems paOrgGroupItems1 = new PAOrganizationalGroupItems();
        paOrgGroupItems1.selectedBU = orgGroup1.Id;
        paOrgGroupItems1.isProjectGroupMember = true;
        paServiceState1.ogItems = paOrgGroupItems1;

        PARequest paRequest1 = new PARequest(paServiceState1);
        paServiceState1.currentRequest = paRequest1;

        paPricingConditionTest1 = new PAPricingCondition(paServiceState1);
        paPricingConditionTest1.getListOptions();       

    }
}