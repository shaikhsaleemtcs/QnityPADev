@isTest
public class PANetPriceDetail_UT{
      
      
      static testMethod void paRequestItemTestMethod() {

        IntegrationLoginCredentials__c pr4 = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
        insert pr4;                
        
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
        erpPricingProcedure.SAP_Application_Id__c = '510';
        erpPricingProcedure.SAP_Client_Id__c = 'V';
        erpPricingProcedure.SAP_Cluster__c = 'CB1';
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
       // orgGrpItem.Approval_Escalation_Price_Requests = 23;
        orgGrpItem.ERP_Currency__c = 'USD;RUB';
        orgGrpItem.ERP_UoM__c = 'EA;SH';
        orgGrpItem.Include_Customer_Currency__c = true;
        orgGrpItem.Latest_Valid_From_Offset_Non_Cust_Spec__c = 90;
        orgGrpItem.Latest_Valid_To_Offset_Cust_Spec__c = 12;
        orgGrpItem.Latest_Valid_To_Offset_Non_Cust_Spec__c = 12;
        orgGrpItem.Max_Valid_From_Offset_Cust_Spec__c = 90;
        orgGrpItem.Non_Customer_Permanent_Request_Reasons__c = 'Extending current prices;New materials;Periodic price review;Other reason;Pricing Compaign;Seasonal price';
        orgGrpItem.Retroactive_Limit__c = 0;
        orgGrpItem.Customer_Request_Reasons__c = 'Seasonal price;Pricing campaign;Slow moving inventory;Customer negotiation;New customer;New materials;Competitive pricing;Extending current prices;Other reason';
        orgGrpItem.Pricing_Task_Reasons__c = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        //orgGrpItem.Project_Reasons__c = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        insert orgGrpItem;

        List<ERP_Sales_Prices_SAP__c> erpSAPPriceList = new List<ERP_Sales_Prices_SAP__c>();
        ERP_Sales_Prices_SAP__c erpSAPPrice1 = new ERP_Sales_Prices_SAP__c();
        erpSAPPriceList.add(erpSAPPrice1);
        insert erpSAPPriceList;



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
        /*Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.SoldTo_Code__c = 'T001';

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
        pricingRequestList.add(pricingRequest9); */
        insert pricingRequestList;



        List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
        Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
        priReqItem1.Pricing_Request__c = pricingRequest1.Id;
        priReqItem1.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem1.Scaled_Price_Flag__c = true;
        priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem1.Key_Combination_Code__c = 'A580';
        priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
        priReqItem1.Customer_Specific__c=true;        
        Date d = Date.valueOf(System.now());
        priReqItem1.New_Valid_To__c = d;
        priReqItem1.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        priReqItem1.SAP_Cluster__c = 'CB1';
        pricingReqItemList.add(priReqItem1);
       /* Pricing_Request_Item__c priReqItem9 = new Pricing_Request_Item__c();
        priReqItem9.Pricing_Request__c = pricingRequest1.Id;
        priReqItem9.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem9.Scaled_Price_Flag__c = true;
        priReqItem9.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem9.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem9.Key_Combination_Code__c = 'A580';
        priReqItem9.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';        
        priReqItem9.Gap__c = true;
        priReqItem9.New__c = true;

        pricingReqItemList.add(priReqItem9);
        Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
        priReqItem2.Pricing_Request__c = pricingRequest1.Id;
        priReqItem2.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem2.Scaled_Price_Flag__c = true;
        priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem2.Key_Combination_Code__c = 'A580';
        priReqItem2.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem2);
        Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
        priReqItem3.Pricing_Request__c = pricingRequest5.Id;
        priReqItem3.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem3.Scaled_Price_Flag__c = true;
        priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem3.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem3.Key_Combination_Code__c = 'A580';
        priReqItem3.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem3);
        Pricing_Request_Item__c priReqItem4 = new Pricing_Request_Item__c();
        priReqItem4.Pricing_Request__c = pricingRequest6.Id;
        priReqItem4.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem4.Scaled_Price_Flag__c = true;
        priReqItem4.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem4.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem4.Key_Combination_Code__c = 'A821';
        priReqItem4.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment'; 
        pricingReqItemList.add(priReqItem4);
        Pricing_Request_Item__c priReqItem5 = new Pricing_Request_Item__c();
        priReqItem5.Pricing_Request__c = pricingRequest7.Id;
        priReqItem5.Scaled_Price_Flag__c = true;
        priReqItem5.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem5.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem5.Key_Combination_Code__c = 'A821';
        priReqItem5.SAP_Cluster__c = 'CB1';
        priReqItem5.SAP_Application_Id__c = '510';
        priReqItem5.SAP_Client_Id__c = 'V';
        priReqItem5.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment'; 
        pricingReqItemList.add(priReqItem5);
        Pricing_Request_Item__c priReqItem6 = new Pricing_Request_Item__c();
        priReqItem6.Pricing_Request__c = pricingRequest8.Id;
        priReqItem6.Scaled_Price_Flag__c = true;
        priReqItem6.Pricing_Condition_Code__c = 'ZPNB';
        priReqItem6.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem6.Key_Combination_Code__c = 'A821';
        priReqItem6.SAP_Cluster__c = 'CB1';
        priReqItem6.SAP_Application_Id__c = '510';
        priReqItem6.SAP_Client_Id__c = 'V';
        priReqItem6.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment'; 
        pricingReqItemList.add(priReqItem6);
        Pricing_Request_Item__c priReqItem7 = new Pricing_Request_Item__c();
        priReqItem7.Pricing_Request__c = pricingRequest6.Id;
        priReqItem7.Scaled_Price_Flag__c = true;
        priReqItem7.Pricing_Condition_Code__c = 'ZPNB';
        priReqItem7.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem7.Key_Combination_Code__c = 'A580';
        priReqItem7.SAP_Cluster__c = 'CB1';
        priReqItem7.SAP_Application_Id__c = '510';
        priReqItem7.SAP_Client_Id__c = 'V';
        priReqItem7.Key_Combination__c = 'Sold To/Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem7);
        Pricing_Request_Item__c priReqItem8 = new Pricing_Request_Item__c();
        priReqItem8.Pricing_Request__c = pricingRequest3.Id;
        priReqItem8.Scaled_Price_Flag__c = true;
        priReqItem8.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem8.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem8.Key_Combination_Code__c = 'A580';
        priReqItem8.SAP_Cluster__c = 'CB1';
        priReqItem8.SAP_Application_Id__c = '510';
        priReqItem8.SAP_Client_Id__c = 'V';
        priReqItem8.Key_Combination__c = 'Sold To/Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem8); */
        insert pricingReqItemList;

        List<ERP_Customer__c> erpCustomerList = new List<ERP_Customer__c>(); 
        ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
        erpCustomer1.Customer_Code__c = 'T001';
        erpCustomer1.Sales_Org_Code__c = 'A640';
        erpCustomer1.Distribution_Channel_Code__c = '10';
        erpCustomer1.Division_Code__c = '02';
        erpCustomer1.Currency_Code__c = 'USD';
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
        pricingCondition1.Calculation_Type__c = 'A - Percentage';
        pricingCondition1.Check_Scale_Code__c = 'A';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingConditionsList.add(pricingCondition1);
        ERP_Pricing_Condition__c pricingCondition2 = new ERP_Pricing_Condition__c();
        pricingCondition2.Pricing_Condition_Code__c = 'ZPNB';
        pricingCondition2.Pricing_Condition__c = 'ZPNB';
        pricingCondition2.SAP_Cluster__c = 'CB1';
        pricingCondition2.SAP_Application_Id__c = '510';
        pricingCondition2.SAP_Client_Id__c = 'V';
        pricingCondition2.Price_Types__c = 'Standard;Spot;Project';
        pricingCondition2.SAP_Condition_Type__c = true;
        pricingCondition2.Condition_class__c = 'Discount';
        pricingCondition2.Calculation_Type__c = 'B - Fixed Amount';
        pricingCondition2.Check_Scale_Code__c = 'A';
        pricingCondition2.Check_Scale__c = 'Descending';
        pricingConditionsList.add(pricingCondition2);
        ERP_Pricing_Condition__c pricingCondition3 = new ERP_Pricing_Condition__c();
        pricingCondition3.Pricing_Condition_Code__c = 'ZD91';
        pricingCondition3.Pricing_Condition__c = 'ZD91';
        pricingCondition3.SAP_Cluster__c = 'CB1';
        pricingCondition3.SAP_Application_Id__c = '510';
        pricingCondition3.SAP_Client_Id__c = 'V';
        pricingCondition3.Price_Types__c = 'Standard;Spot;Project';
        pricingCondition3.SAP_Condition_Type__c = true;
        pricingCondition3.Condition_class__c = 'Discount';
        pricingCondition3.Calculation_Type__c = 'C - Quantity';
        pricingCondition3.Check_Scale_Code__c = 'A';
        pricingCondition3.Check_Scale__c = 'Ascending';
        pricingConditionsList.add(pricingCondition3);
        insert pricingConditionsList;

        List<ERP_Key_Combination__c> erpKCList = new List<ERP_Key_Combination__c>();
        ERP_Key_Combination__c erpKC1 = new ERP_Key_Combination__c();
        erpKC1.Key_Combination_Code__c = 'A821';
        erpKC1.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment';
        erpKCList.add(erpKC1);
        insert erpKCList;


        List<ERP_Access_Sequence__c> erpAccList = new List<ERP_Access_Sequence__c>();
        ERP_Access_Sequence__c erpAcc1 = new ERP_Access_Sequence__c();
        erpAcc1.Pricing_Condition__c = pricingCondition1.Id;
        erpAcc1.Sales_Pricing_Procedure__c = orgGrpItem.ERP_Pricing_Procedure__c;
        erpAcc1.Pricing_Key_Combination__c = erpKC1.Id;
        erpAccList.add(erpAcc1);
        ERP_Access_Sequence__c erpAcc2 = new ERP_Access_Sequence__c();
        erpAcc2.Pricing_Condition__c = pricingCondition2.Id;
        erpAcc2.Sales_Pricing_Procedure__c = orgGrpItem.ERP_Pricing_Procedure__c;
        erpAcc2.Pricing_Key_Combination__c = erpKC1.Id;
        erpAccList.add(erpAcc2);
        ERP_Access_Sequence__c erpAcc3 = new ERP_Access_Sequence__c();
        erpAcc3.Pricing_Condition__c = pricingCondition3.Id;
        erpAcc3.Sales_Pricing_Procedure__c = orgGrpItem.ERP_Pricing_Procedure__c;
        erpAcc3.Pricing_Key_Combination__c = erpKC1.Id;
        erpAccList.add(erpAcc3);
        insert erpAccList;

        List<ERP_Procedure_Conditions__c> erpProcedureConditionsList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c erpProcedureCond1 = new ERP_Procedure_Conditions__c();
        erpProcedureCond1.Sales_Pricing_Procedure__c = erpPricingProcedure.Id;
        erpProcedureCond1.Pricing_Condition__c = pricingCondition1.Id;
        erpProcedureCond1.Sales_Pricing_Procedure_Condition_Config__c = 'Enable Scale';
        erpProcedureConditionsList.add(erpProcedureCond1);
        ERP_Procedure_Conditions__c erpProcedureCond2 = new ERP_Procedure_Conditions__c();
        erpProcedureCond2.Sales_Pricing_Procedure__c = erpPricingProcedure.Id;
        erpProcedureCond2.Pricing_Condition__c = pricingCondition2.Id;
        erpProcedureConditionsList.add(erpProcedureCond2);
        insert erpProcedureConditionsList;

        PAServiceState paServiceState = new PAServiceState();
        PARequestItem paRequestItem;

        //paPricingConditionTest = new PAPricingCondition(paServiceState);

        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup1.Id;
        paOrgGroupItems.isProjectGroupMember = true;
        paOrgGroupItems.orgGroupItems = orgGrpItem;
        paServiceState.ogItems = paOrgGroupItems;

        PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
        paERPCustomer.paERPCustomer = erpCustomer1;
        paServiceState.erpCustomer = paERPCustomer;

        PARequest paRequest = new PARequest(paServiceState);
        paServiceState.currentRequest = paRequest;

        paServiceState.currentRequest.pricingRequest = pricingRequest1;
        paServiceState.currentRequest.customer = paERPCustomer;

        PAPricingCondition paPricingCondition = new PAPricingCondition(paServiceState);
        //paPricingCondition.pricingCondition = pricingCondition1;
        paServiceState.currentRequest.pricingCondition = paPricingCondition;

        PAKeyCombination paKeyCombination = new PAKeyCombination(paServiceState);
        paServiceState.currentRequest.keyCombination = paKeyCombination;
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();

     //   paRequestItem = new PARequestItem(paServiceState);
        paServiceState.currentRequest.pricingRequest = pricingRequest1;
     //   paRequestItem = new PARequestItem(paServiceState);
        //paServiceState.currentRequest.pricingRequest = pricingRequest8;
        //paRequestItem = new PARequestItem(paServiceState);

		 PAService PAService1 = new PAService();      //added on may26
         paService1.paServiceState = paServiceState;	//added on may26

     //   paRequestItem = new PARequestItem(paServiceState);
        //paRequestItem.requestServiceState.currentRequestItem.pricingReqItem = priReqItem1;
        // paRequestItem = new PARequestItem(paServiceState);
       
/*
        Attachment att = paRequestItem.document;
        List<SelectOption> erpScaleCurrencyList = paRequestItem.erpScaleCurrencyList;

       
        paRequestItem.request.requestServiceState.currentRequest.pricingCondition.pricingCondition = pricingCondition2;
        paRequestItem.request.requestServiceState.currentRequest.pricingCondition.selectedPricingCondition = pricingCondition2.Id;
        


            paRequestItem = new PARequestItem(paServiceState); */
            
        paServiceState.currentRequestItem=paRequestItem;
   //     paServiceState.currentRequestItem.pricingReqItem= priReqItem1;
        
   //     PAService1.paServiceState.currentRequestItem = new PARequestItem(paServiceState);		//added on 26th May 
       
   //     paRequestItem = new PARequestItem(paServiceState);


        String errMessage; 
        //String errMessage = paRequestItem.validate('SaveRebate');
        //errMessage = paRequestItem.validate('CancelTask');
        //errMessage = paRequestItem.validate('GapCheckImport');
        //paRequestItem.pricingRequestItemId = 'Exp-'+priReqItem2.Id;
          /*  PANetPriceDetail netPrice=new PANetPriceDetail(paServiceState);
            List<NPC_Request__c> npcReqList=new List<NPC_Request__c>();
            
                  NPC_Request__c npc=new NPC_Request__c();
                  npc.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc.Status__c='Active';
                  npcReqList.add(npc);
                  NPC_Request__c npc1=new NPC_Request__c();
                  npc1.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc1.Status__c='Active';
                  npcReqList.add(npc1);
                  NPC_Request__c npc2=new NPC_Request__c();
                  npc2.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc2.Status__c='Active';
                  npcReqList.add(npc2);
                  NPC_Request__c npc3=new NPC_Request__c();
                  npc3.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc3.Status__c='Active';
                  npcReqList.add(npc3);
                  NPC_Request__c npc4=new NPC_Request__c();
                  npc4.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc4.Status__c='Active';
                  npcReqList.add(npc4);
                  
                  insert npcReqList;
                  
         List<NPC_Response__c> npcResponseInsertList =new List<NPC_Response__c>(); 
          NPC_Response__c npcResp=new NPC_Response__c();//ZPSE:292.000000000:EUR:1:EA
                  npcResp.Condition_Rate_Key__c='ZPSE:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
                  npcResp.NPC_Message_Type__c='S';
                  npcResp.NPC_Request__c=npcReqList[0].Id;//npcReq.Id;
                 npcResponseInsertList.add(npcResp);
                   NPC_Response__c npcResp1=new NPC_Response__c();//ZPSE:292.000000000:EUR:1:EA
                  npcResp1.Condition_Rate_Key__c='ZPSE:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
                  npcResp1.NPC_Message_Type__c='E';
                  npcResp1.NPC_Request__c=npcReqList[1].Id;//npcReq.Id;
                 npcResponseInsertList.add(npcResp1);
                   NPC_Response__c npcResp2=new NPC_Response__c();//ZPSE:292.000000000:EUR:1:EA
                  npcResp2.Condition_Rate_Key__c='ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
                  npcResp2.NPC_Message_Type__c='S';
                  npcResp2.NPC_Request__c=npcReqList[2].Id;//npcReq.Id;
                 npcResponseInsertList.add(npcResp2);
                 
                  insert npcResponseInsertList;
                 
           paRequestItem.pricingReqItem=pricingReqItemList[0];    
                  netPrice.getListWrappers();
                  netPrice.calNet= new PACalculateNetPrice();
                  String tempSep=netPrice.separatorOnPage;
                  netPrice.validate('Sample');
                  try{
                        netPrice.npcrequestId=npcReqList[0].Id;
                  netPrice.action('PAMaterialNet', 'PAMaterialDetail', 'ViewNetPriceDetailsAsynch');
                  }
                  catch(Exception e){
                  
                  }
                  try{
                        netPrice.npcrequestId=npcReqList[1].Id;
                  netPrice.action('PAMaterialNet', 'PAMaterialDetail', 'ViewNetPriceDetailsAsynch');
                  }
                  catch(Exception e){
                  
                  }
                  Test.startTest();
                  try{
                        netPrice.npcrequestId=npcReqList[2].Id;
                  		netPrice.action('PAMaterialNet', 'PAMaterialDetail', 'ViewNetPriceDetailsAsynch');
                  }
                  catch(Exception e){
                  
                  }
                  netPrice.action('PAMaterialDetail', 'PAEditReqITem', 'SkipToEditReqItem');
                  netPrice.action('PAMaterialDetail', 'PAEditReqITem', 'TEst');
                  netPrice.deleteRecord();
                  netPrice.getName();
                  netPrice.save();
                  netPrice.getListOptions();
                  netPrice.getListBusinessComponents();
                  Boolean hasPrevious=netPrice.hasPrevious;
                  Boolean hasNext=netPrice.hasNext;
                  List<NPC_Request__c> npcList=netPrice.NPCRequests;
                  Integer currentPageNumber=    netPrice.currentPageNumber;
                  Integer resultSize=netPrice.resultSize;
                  INteger totalNoOfPages=netPrice.totalNoOfPages ;
                  //Integer currentPageSize=netPrice.currentPageSize; 
                  String noOfRecordsDisplayed=netPrice.noOfRecordsDisplayed ;*/
                  
      }
                  
             static testMethod void paRequestItemTestMethod1() {    
             	 PAServiceState paServiceState = new PAServiceState(); 
             	 PARequestItem paRequestItem = new PARequestItem(paServiceState);
             	/*  paRequestItem = new PARequestItem(paServiceState);
             	 paServiceState.currentRequestItem=paRequestItem;*/
             	 
             	
               // paServiceState.currentRequestItem.pricingReqItem= priReqItem1;
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
        /*Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
        pricingRequest2.Pricing_Request_Type__c = 'Project Pricing';
        pricingRequest2.Request_Type__c = 'Customer Specific';
        pricingRequest2.SoldTo_Code__c = 'T001';

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
        pricingRequestList.add(pricingRequest9); */
        insert pricingRequestList;
        
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = 'test';
        erpPricingProcedure.Pricing_Procedure__c = 'Test';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'Test';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'Test';
        erpPricingProcedure.Pricing_Procedure__c = 'Test';
        erpPricingProcedure.SAP_Application_Id__c = '510';
        erpPricingProcedure.SAP_Client_Id__c = 'V';
        erpPricingProcedure.SAP_Cluster__c = 'CB1';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
            List<ERP_Sales_Prices_SAP__c> erpSAPPriceList = new List<ERP_Sales_Prices_SAP__c>();
        ERP_Sales_Prices_SAP__c erpSAPPrice1 = new ERP_Sales_Prices_SAP__c();
        erpSAPPriceList.add(erpSAPPrice1);
        insert erpSAPPriceList;
                
        List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
        Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
        priReqItem1.Pricing_Request__c = pricingRequest1.Id;
        priReqItem1.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem1.Scaled_Price_Flag__c = true;
        priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem1.Key_Combination_Code__c = 'A580';
        priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
        priReqItem1.Customer_Specific__c=true;        
        Date d = Date.valueOf(System.now());
        priReqItem1.New_Valid_To__c = d;
        priReqItem1.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        priReqItem1.SAP_Cluster__c = 'CB1';
        priReqItem1.FixValDate__c = d;
        pricingReqItemList.add(priReqItem1);
        
       /* Pricing_Request_Item__c priReqItem9 = new Pricing_Request_Item__c();
        priReqItem9.Pricing_Request__c = pricingRequest1.Id;
        priReqItem9.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem9.Scaled_Price_Flag__c = true;
        priReqItem9.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem9.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem9.Key_Combination_Code__c = 'A580';
        priReqItem9.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';        
        priReqItem9.Gap__c = true;
        priReqItem9.New__c = true;

        pricingReqItemList.add(priReqItem9);
        Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
        priReqItem2.Pricing_Request__c = pricingRequest1.Id;
        priReqItem2.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem2.Scaled_Price_Flag__c = true;
        priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem2.Key_Combination_Code__c = 'A580';
        priReqItem2.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem2);
        Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
        priReqItem3.Pricing_Request__c = pricingRequest5.Id;
        priReqItem3.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem3.Scaled_Price_Flag__c = true;
        priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem3.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem3.Key_Combination_Code__c = 'A580';
        priReqItem3.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem3);
        Pricing_Request_Item__c priReqItem4 = new Pricing_Request_Item__c();
        priReqItem4.Pricing_Request__c = pricingRequest6.Id;
        priReqItem4.ERP_Sales_Prices_SAP__c = erpSAPPrice1.Id;
        priReqItem4.Scaled_Price_Flag__c = true;
        priReqItem4.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem4.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem4.Key_Combination_Code__c = 'A821';
        priReqItem4.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment'; 
        pricingReqItemList.add(priReqItem4);
        Pricing_Request_Item__c priReqItem5 = new Pricing_Request_Item__c();
        priReqItem5.Pricing_Request__c = pricingRequest7.Id;
        priReqItem5.Scaled_Price_Flag__c = true;
        priReqItem5.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem5.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem5.Key_Combination_Code__c = 'A821';
        priReqItem5.SAP_Cluster__c = 'CB1';
        priReqItem5.SAP_Application_Id__c = '510';
        priReqItem5.SAP_Client_Id__c = 'V';
        priReqItem5.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment'; 
        pricingReqItemList.add(priReqItem5);
        Pricing_Request_Item__c priReqItem6 = new Pricing_Request_Item__c();
        priReqItem6.Pricing_Request__c = pricingRequest8.Id;
        priReqItem6.Scaled_Price_Flag__c = true;
        priReqItem6.Pricing_Condition_Code__c = 'ZPNB';
        priReqItem6.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem6.Key_Combination_Code__c = 'A821';
        priReqItem6.SAP_Cluster__c = 'CB1';
        priReqItem6.SAP_Application_Id__c = '510';
        priReqItem6.SAP_Client_Id__c = 'V';
        priReqItem6.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment'; 
        pricingReqItemList.add(priReqItem6);
        Pricing_Request_Item__c priReqItem7 = new Pricing_Request_Item__c();
        priReqItem7.Pricing_Request__c = pricingRequest6.Id;
        priReqItem7.Scaled_Price_Flag__c = true;
        priReqItem7.Pricing_Condition_Code__c = 'ZPNB';
        priReqItem7.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem7.Key_Combination_Code__c = 'A580';
        priReqItem7.SAP_Cluster__c = 'CB1';
        priReqItem7.SAP_Application_Id__c = '510';
        priReqItem7.SAP_Client_Id__c = 'V';
        priReqItem7.Key_Combination__c = 'Sold To/Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem7);
        Pricing_Request_Item__c priReqItem8 = new Pricing_Request_Item__c();
        priReqItem8.Pricing_Request__c = pricingRequest3.Id;
        priReqItem8.Scaled_Price_Flag__c = true;
        priReqItem8.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem8.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem8.Key_Combination_Code__c = 'A580';
        priReqItem8.SAP_Cluster__c = 'CB1';
        priReqItem8.SAP_Application_Id__c = '510';
        priReqItem8.SAP_Client_Id__c = 'V';
        priReqItem8.Key_Combination__c = 'Sold To/Material/Material Price Group/PH1/PH2/PH3/PH4'; 
        pricingReqItemList.add(priReqItem8); */
        insert pricingReqItemList;
        
          paServiceState.currentRequestItem=paRequestItem;
                  paServiceState.currentRequestItem.pricingReqItem= priReqItem1;
                 
             	 
                  PANetPriceDetail netPrice=new PANetPriceDetail(paServiceState);
            List<NPC_Request__c> npcReqList=new List<NPC_Request__c>();
            
                  NPC_Request__c npc=new NPC_Request__c();
                  npc.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc.Status__c='Active';
                  npcReqList.add(npc);
                  NPC_Request__c npc1=new NPC_Request__c();
                  npc1.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc1.Status__c='Active';
                  npcReqList.add(npc1);
                  NPC_Request__c npc2=new NPC_Request__c();
                  npc2.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc2.Status__c='Active';
                  npcReqList.add(npc2);
                  NPC_Request__c npc3=new NPC_Request__c();
                  npc3.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc3.Status__c='Active';
                  npcReqList.add(npc3);
                  NPC_Request__c npc4=new NPC_Request__c();
                  npc4.Pricing_Request_Item__c=paRequestItem.pricingReqItem.Id;
                  npc4.Status__c='Active';
                  npcReqList.add(npc4);
                  
                  insert npcReqList;
                  
         List<NPC_Response__c> npcResponseInsertList =new List<NPC_Response__c>(); 
          NPC_Response__c npcResp=new NPC_Response__c();//ZPSE:292.000000000:EUR:1:EA
                  npcResp.Condition_Rate_Key__c='ZPSE:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
                  npcResp.NPC_Message_Type__c='S';
                  npcResp.NPC_Request__c=npcReqList[0].Id;//npcReq.Id;
                 npcResponseInsertList.add(npcResp);
                   NPC_Response__c npcResp1=new NPC_Response__c();//ZPSE:292.000000000:EUR:1:EA
                  npcResp1.Condition_Rate_Key__c='ZPSE:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
                  npcResp1.NPC_Message_Type__c='E';
                  npcResp1.NPC_Request__c=npcReqList[1].Id;//npcReq.Id;
                 npcResponseInsertList.add(npcResp1);
                   NPC_Response__c npcResp2=new NPC_Response__c();//ZPSE:292.000000000:EUR:1:EA
                  npcResp2.Condition_Rate_Key__c='ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
                  npcResp2.NPC_Message_Type__c='S';
                  npcResp2.NPC_Request__c=npcReqList[2].Id;//npcReq.Id;
                 npcResponseInsertList.add(npcResp2);
                 
                  insert npcResponseInsertList;
                 
           paRequestItem.pricingReqItem=pricingReqItemList[0];    
                  netPrice.getListWrappers();
                  netPrice.calNet= new PACalculateNetPrice();
                  String tempSep=netPrice.separatorOnPage;
                  netPrice.validate('Sample');
                  try{
                        netPrice.npcrequestId=npcReqList[0].Id;
                  netPrice.action('PAMaterialNet', 'PAMaterialDetail', 'ViewNetPriceDetailsAsynch');
                  }
                  catch(Exception e){
                  
                  }
                  try{
                        netPrice.npcrequestId=npcReqList[1].Id;
                  netPrice.action('PAMaterialNet', 'PAMaterialDetail', 'ViewNetPriceDetailsAsynch');
                  }
                  catch(Exception e){
                  
                  }
                  Test.startTest();
                  try{
                        netPrice.npcrequestId=npcReqList[2].Id;
                  		netPrice.action('PAMaterialNet', 'PAMaterialDetail', 'ViewNetPriceDetailsAsynch');
                  }
                  catch(Exception e){
                  
                  }
                  netPrice.action('PAMaterialDetail', 'PAEditReqITem', 'SkipToEditReqItem');
                  netPrice.action('PAMaterialDetail', 'PAEditReqITem', 'TEst');
                  netPrice.deleteRecord();
                  netPrice.getName();
                  netPrice.save();
                  netPrice.getListOptions();
                  netPrice.getListBusinessComponents();
                  Boolean hasPrevious=netPrice.hasPrevious;
                  Boolean hasNext=netPrice.hasNext;
                  List<NPC_Request__c> npcList=netPrice.NPCRequests;
                  Integer currentPageNumber=    netPrice.currentPageNumber;
                  Integer resultSize=netPrice.resultSize;
                  INteger totalNoOfPages=netPrice.totalNoOfPages ;
                  //Integer currentPageSize=netPrice.currentPageSize; 
                  String noOfRecordsDisplayed=netPrice.noOfRecordsDisplayed ;
      }

}