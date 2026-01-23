@isTest
Public Class PARelatedList_UT1 {
  static testMethod void paRequestTestMethod13() {
        //apac
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;      
        
        
        PAUtil.insertProfileRecordId();
     
        
        RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D12345',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=r.id,
                                    ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                    ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                    ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                    ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                    ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                    ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
       
        ERP_Material_Conversion_Factor__c mcf = new ERP_Material_Conversion_Factor__c(Numerator_Y__c = '1',Denominator_X__c = '1',
                                                Base_UoM__c = 'EA',Alternative_UoM__c = 'SH', Material__c = material.Id); 
        insert mcf;
        ERP_Material_Conversion_Factor__c mcf1 = new ERP_Material_Conversion_Factor__c(Numerator_Y__c = '1',Denominator_X__c = '1',
                                                Base_UoM__c = 'EA',Alternative_UoM__c = 'EA', Material__c = material.Id); 
        insert mcf1;
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c='A640';
        pr.Division_Code__c='02';
        pr.Dist_Channel_Code__c = '10';
        pr.BU__c='DPP Polymers EMEA';
        
        insert pr;

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        //paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        //paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        insert erp1;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Price_Holder__c =erp1.Id;
        erp.Valid_From__c = system.now().date()-50;
        erp.Valid_To__c = system.now().date()+100;
        insert erp;
        
        paRList.rateChange = '10';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
        prItem1.New_Unit__c = 'USD';
        prItem1.Distributor_Code__c='Y7';
        prItem1.Distributor_Name__c='XYZ';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.Valid_From__c = system.now().date()+10;
        prItem1.Valid_To__c = system.now().date()+12;
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';   
        prItem1.ScaleRate10__c = '10';
        prItem1.New_Rate__c = '10';
        prItem1.Key_Combination__c = 'PH';
        prItem1.Scaled_Price_Flag__c = true;
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.Material_Code__c = 'D12345';
        prItem1.Pricing_Condition__c = 'ZPSE';
        prItem1.Customer_Specific__c = true;
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Permanent';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Quantity__c = '10';
        prItem.Unit__c = 'EA';
        prItem.New_Unit__c = '%';
        prItem.ScaleRate1__c = '10'; 
        prItem.ScaleRate2__c = '10';
        prItem.ScaleRate3__c = '10';
        prItem.Customer_Specific__c = true;
        prItem.Valid_From__c = system.now().date()+23;
        prItem.Valid_To__c = system.now().date()+25;
        prItem.ScaleRate4__c = '10';
        prItem.ScaleRate5__c = '10';
        prItem.ScaleRate6__c = '10';
        prItem.ScaleRate7__c = '10';
        prItem.ScaleRate8__c = '10';
        prItem.ScaleRate9__c = '10';    
        prItem.ScaleRate10__c = '10';
        prItem.New_Rate__c = '10';
        prItem.Scaled_Price_Flag__c = true;
        prItem.Pricing_Condition__c = 'ZPSE';
        prItem.ERP_Sales_Prices_SAP__c = erp.Id;
         
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
        insert prItem;
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request_Type__c = 'Permanent';
        prItem2.Pricing_Request__c = pr.Id;
        prItem2.Quantity__c = '10';
        prItem2.Unit__c = 'EA';
        prItem2.New_Unit__c = 'EA';
        prItem2.ScaleRate1__c = '10'; 
        prItem2.ScaleRate2__c = '10';
        prItem2.ScaleRate3__c = '10';
        prItem2.Valid_From__c = system.now().date()+26;
        prItem2.Valid_To__c = system.now().date()+28;
        prItem2.ScaleRate4__c = '10';
        prItem2.ScaleRate5__c = '10';
        prItem2.ScaleRate6__c = '10';
        prItem2.ScaleRate7__c = '10';
        prItem2.ScaleRate8__c = '10';
        prItem2.ScaleRate9__c = '10';   
        prItem2.ScaleRate10__c = '10';
        prItem2.New_Rate__c = '10';
        prItem2.Pricing_Condition__c = 'ZPSE';
        prItem2.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem2.Customer_Specific__c = true;
         
        prItem2.UoM__c=null;
        prItem2.Per__c=null;
        prItem2.Unit__c=null;
        insert prItem2;
        
        
        
        paRList.requestBUSalesArea = 'BI-A640-10-02-Massive';
        
        
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
      //  orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.Enable_Material_Group_5__c = true;
        orgGrpItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgGrpItem;
        
        //apac
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
        pricingCondition1.Calculation_Type__c = 'B - Quantity';
        pricingCondition1.Check_Scale_Code__c = 'B';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingConditionsList.add(pricingCondition1);
        
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
       
        insert erpAccList;

        List<ERP_Procedure_Conditions__c> erpProcedureConditionsList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c erpProcedureCond1 = new ERP_Procedure_Conditions__c();
        erpProcedureCond1.Sales_Pricing_Procedure__c = erpPricingProcedure.Id;
        erpProcedureCond1.Pricing_Condition__c = pricingCondition1.Id;
        erpProcedureCond1.Sales_Pricing_Procedure_Condition_Config__c = 'Enable Scale';
        erpProcedureConditionsList.add(erpProcedureCond1);
       
        insert erpProcedureConditionsList;
        
        
        PAWrapper wrap = new PAWrapper();
        wrap.stringMap.put('disableCheckBox', 'false');
        wrap.sobjectRecord = prItem1;
        wrap.isSelected =  true;
        paRList.wrapperList.add(wrap);
        
        paRlist.pricingRequestId = pr.Id;
            paRlist.rateType = '--Select--';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+1;
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
            paRList.applyChanges();
            paRlist.rateType = '--Select--';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            paRList.requestBUSalesArea = 'BI-A640-10-02-Massive';
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()-1000;
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+1000;
            paRList.applyChanges();
            paRList.requestBUSalesArea = 'BI-A640-10-02-Non Customer Specific';
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()-1000;
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+1000;
            paRList.applyChanges();
            
            paRList.wrapperList.clear();            
            wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem;
            wrap.isSelected =  true;            
            paRList.wrapperList.add(wrap);
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+4;
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = null;
            paRList.rateChange = null;
            paRList.rateChangeType = null;
            paRList.applyChanges();
            
            
            
            paRList.wrapperList.clear();            
            wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem2;
            wrap.isSelected =  true;            
            paRList.wrapperList.add(wrap);
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+4;
            
            paRlist.rateTypeChange=True; 
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = '--Select--';
            paRList.rateChange = null;
            paRList.rateChangeType = null;
            paRList.applyChanges();
            PageReference pg = new PageReference('/apex/PAExportPrices');
            test.setCurrentPage(pg);
            boolean b = paRList.displayTmLn;
            pg = new PageReference('');
            b = paRList.displayTmLn;
            String newUnit = paRList.newUnit;
            String newUoM = paRList.newUoM;
            decimal newPer = paRList.newPer;
            boolean scaleView = paRList.scaleView;
            String scaleBase1 = paRList.scaleBase1;
            map<ID,List<String>> idQuant =paRList.idQuant;
            map<ID,List<String>> idRate = paRList.idRate;
            String nQTY = paRList.nQTY;
            boolean showPRColumn = paRList.showPRColumn;
            
             paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            orgGrpItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgGrpItem.Default_SalesArea_UoM__c=null;
        orgGrpItem.Default_Per_Value__c=null;
        update orgGrpItem;
        //paRList.saveScale();
        paRList.applyChanges();
            
        }
        static testMethod void paRequestTestMethod14() {
        //apac
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;      
        
        
        PAUtil.insertProfileRecordId();
      
        
        RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D12345',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=r.id,
                                    ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                    ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                    ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                    ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                    ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                    ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
       
        ERP_Material_Conversion_Factor__c mcf = new ERP_Material_Conversion_Factor__c(Numerator_Y__c = '1',Denominator_X__c = '1',
                                                Base_UoM__c = 'EA',Alternative_UoM__c = 'SH', Material__c = material.Id); 
        insert mcf;
        ERP_Material_Conversion_Factor__c mcf1 = new ERP_Material_Conversion_Factor__c(Numerator_Y__c = '1',Denominator_X__c = '1',
                                                Base_UoM__c = 'EA',Alternative_UoM__c = 'EA', Material__c = material.Id); 
        insert mcf1;
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c='A640';
        pr.Division_Code__c='02';
        pr.Dist_Channel_Code__c = '10';
        pr.BU__c='DPP Polymers EMEA';
        
        insert pr;

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        //paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        //paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        insert erp1;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Price_Holder__c =erp1.Id;
        erp.Valid_From__c = system.now().date()-50;
        erp.Valid_To__c = system.now().date()+100;
        insert erp;
        
        paRList.rateChange = '10';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
        prItem1.New_Unit__c = 'USD';
        prItem1.Distributor_Code__c='Y7';
        prItem1.Distributor_Name__c='XYZ';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.Valid_From__c = system.now().date()+10;
        prItem1.Valid_To__c = system.now().date()+12;
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';   
        prItem1.ScaleRate10__c = '10';
        prItem1.New_Rate__c = '10';
        prItem1.Key_Combination__c = ' ';
        prItem1.Scaled_Price_Flag__c = true;
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.Material_Code__c = 'D12345';
        prItem1.Pricing_Condition__c = 'ZPSE';
        prItem1.Customer_Specific__c = true;
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.Key_Combination__c = 'Material';
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Permanent';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Quantity__c = '10';
        prItem.Unit__c = 'EA';
        prItem.New_Unit__c = '%';
        prItem.ScaleRate1__c = '10'; 
        prItem.ScaleRate2__c = '10';
        prItem.ScaleRate3__c = '10';
        prItem.Customer_Specific__c = true;
        prItem.Valid_From__c = system.now().date()+23;
        prItem.Valid_To__c = system.now().date()+25;
        prItem.ScaleRate4__c = '10';
        prItem.ScaleRate5__c = '10';
        prItem.ScaleRate6__c = '10';
        prItem.ScaleRate7__c = '10';
        prItem.ScaleRate8__c = '10';
        prItem.ScaleRate9__c = '10';    
        prItem.ScaleRate10__c = '10';
        prItem.New_Rate__c = '10';
        prItem.Scaled_Price_Flag__c = true;
        prItem.Pricing_Condition__c = 'ZPSE';
        prItem.ERP_Sales_Prices_SAP__c = erp.Id;
          prItem.Key_Combination__c = 'Material';
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
        insert prItem;
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request_Type__c = 'Permanent';
        prItem2.Pricing_Request__c = pr.Id;
        prItem2.Quantity__c = '10';
        prItem2.Unit__c = 'EA';
        prItem2.New_Unit__c = 'EA';
        prItem2.ScaleRate1__c = '10'; 
        prItem2.ScaleRate2__c = '10';
        prItem2.ScaleRate3__c = '10';
        prItem2.Valid_From__c = system.now().date()+26;
        prItem2.Valid_To__c = system.now().date()+28;
        prItem2.ScaleRate4__c = '10';
        prItem2.ScaleRate5__c = '10';
        prItem2.ScaleRate6__c = '10';
        prItem2.ScaleRate7__c = '10';
        prItem2.ScaleRate8__c = '10';
        prItem2.ScaleRate9__c = '10';   
        prItem2.ScaleRate10__c = '10';
        prItem2.New_Rate__c = '10';
        prItem2.Pricing_Condition__c = 'ZPSE';
        prItem2.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem2.Customer_Specific__c = true;
          prItem2.Key_Combination__c = 'Material';
        prItem2.UoM__c=null;
        prItem2.Per__c=null;
        prItem2.Unit__c=null;
        insert prItem2;
        
        
        
        paRList.requestBUSalesArea = 'BI-A640-10-02-Massive';
        
        
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
      //  orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.Enable_Material_Group_5__c = true;
        orgGrpItem.Default_Per_UoM_Setup__c='Product Hierarchy Config';
        insert orgGrpItem;
        
        //apac
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
        pricingCondition1.Calculation_Type__c = 'B - Quantity';
        pricingCondition1.Check_Scale_Code__c = 'B';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingConditionsList.add(pricingCondition1);
        
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
       
        insert erpAccList;

        List<ERP_Procedure_Conditions__c> erpProcedureConditionsList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c erpProcedureCond1 = new ERP_Procedure_Conditions__c();
        erpProcedureCond1.Sales_Pricing_Procedure__c = erpPricingProcedure.Id;
        erpProcedureCond1.Pricing_Condition__c = pricingCondition1.Id;
        erpProcedureCond1.Sales_Pricing_Procedure_Condition_Config__c = 'Enable Scale';
        erpProcedureConditionsList.add(erpProcedureCond1);
       
        insert erpProcedureConditionsList;
        
        
        PAWrapper wrap = new PAWrapper();
        wrap.stringMap.put('disableCheckBox', 'false');
        wrap.sobjectRecord = prItem1;
        wrap.isSelected =  true;
        paRList.wrapperList.add(wrap);
        
        paRlist.pricingRequestId = pr.Id;
            paRlist.rateType = '--Select--';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+1;
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
            paRList.applyChanges();
            paRlist.rateType = '--Select--';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            paRList.requestBUSalesArea = 'BI-A640-10-02-Massive';
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()-1000;
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+1000;
            paRList.applyChanges();
            paRList.requestBUSalesArea = 'BI-A640-10-02-Non Customer Specific';
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()-1000;
            paRList.applyChanges();
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+1000;
            paRList.applyChanges();
            
            paRList.wrapperList.clear();            
            wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem;
            wrap.isSelected =  true;            
            paRList.wrapperList.add(wrap);
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+4;
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = null;
            paRList.rateChange = null;
            paRList.rateChangeType = null;
            paRList.applyChanges();
            
            
            
            paRList.wrapperList.clear();            
            wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem2;
            wrap.isSelected =  true;            
            paRList.wrapperList.add(wrap);
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+4;
            
            paRlist.rateTypeChange=True; 
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01.25';
            paRList.rateChangeType = '(-)';
            paRList.applyChanges();
            paRlist.rateType = '--Select--';
            paRList.rateChange = null;
            paRList.rateChangeType = null;
            paRList.applyChanges();
            PageReference pg = new PageReference('/apex/PAExportPrices');
            test.setCurrentPage(pg);
            boolean b = paRList.displayTmLn;
            pg = new PageReference('');
            b = paRList.displayTmLn;
            String newUnit = paRList.newUnit;
            String newUoM = paRList.newUoM;
            decimal newPer = paRList.newPer;
            boolean scaleView = paRList.scaleView;
            String scaleBase1 = paRList.scaleBase1;
            map<ID,List<String>> idQuant =paRList.idQuant;
            map<ID,List<String>> idRate = paRList.idRate;
            String nQTY = paRList.nQTY;
            boolean showPRColumn = paRList.showPRColumn;
            
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
        }
    }