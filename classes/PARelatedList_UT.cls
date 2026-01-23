@isTest 
public class PARelatedList_UT {


    static testMethod void paRequestTestMethod() {
            
      Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
      
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Project';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        pr.is_End_User_Rebate__c=true;
        //pr.UoM__c=null;
        //pr.Per__c=null;
        //pr.Unit__c=null;
        insert pr;
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.New_Unit__c = 'USD';
        prItem.Distributor_Code__c='Y7';
        prItem.Distributor_Name__c='XYZ';
        prItem.isNPCApplicable__c = true;
        prItem.Pricing_Condition_Code__c = 'ZPSE';
        prItem.SAP_Cluster__c = 'CB1';
        prItem.SAP_Client_Id__c = 'V';
        prItem.SAP_Application_Id__c = '510';
        prItem.Rate_one__c = '100';
        prItem.Floor_Price_in_USD__c= '12.33';
        prItem.Ref_Price_in_USD__c= '13.22';
        //prItem.key_combination__c = 'Material/PH';
        prItem.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
        prItem.Scaled_Price_Flag__c = true;
        prItem.Rate__c = '10';
        prItem.New_Rate__c = '20';
        prItem.Rate__c= '10';
        prItem.UoM__c=NULL;
        prItem.Per__c=NULL;
        prItem.Unit__c=NULL;
        prItem.New_Volume_UoM__c='KG';
        prItem.New_UOM__c='KG';
        prItem.New_Per__c=1;
        //prItem.BU__c='DPP Polymers EMEA';        
        insert prItem;
        //update prItem;
        
        
        Sales_Prices__c salprice=new Sales_Prices__c ();
        salprice.isPriceHolder__c= true;
        salprice.Valid_From__c=Date.Today();
        salprice.Valid_To__c=Date.Today();
        salprice.Pricing_Condition_Code__c= 'ZPSE';
        salprice.Sales_Org_Code__c= 'test';
        salprice.Dist_Channel_Code__c = 'data';
        salprice.Division_Code__c = 'dsfhsadfha';
        salprice.Sold_To_Code__c = 'dsfhsadfha';
        salprice.Material_Code__c = 'dsfhsadfha';
        salprice.PH1_Code__c = 'ds';
        salprice.PH2_Code__c = 'd';
        salprice.PH3_Code__c = 'ds';
        salprice.PH4_Code__c = 'ds';
        salprice.PH5_Code__c = 'ha';
        salprice.PH6_Code__c = 'ha';
        salprice.PH7_Code__c = 'da';
        salprice.PH8_Code__c = 'da';
        salprice.PH9_Code__c = 'a';
        salprice.ShipTo_Code__c = 'dsf';
        salprice.Sales_Office_Code__c = 'dsfhsadfha';
        salprice.Customer_Price_Group_Code__c = 'dsfhsadfha';
        salprice.Material_Price_Group_Code__c = 'dsfhsadfha';
        salprice.Price_List_Type_Code__c = 'dsfhsadfha';
        salprice.Terms_of_Payment_Code__c = 'dsfhsadfha';
        salprice.End_Use_Code__c = 'dsfhsadfha';
        salprice.Market_Segment_Code__c = 'dsfhsadfha';
        salprice.Variant_Code__c = 'dsfhsadfha';
        salprice.Sales_Order_Type_Code__c = 'dsfhsadfha';
        salprice.Country_Code__c = 'dsfhsadfha';
        salprice.Profit_Center_Code__c = 'dsfhsadfha';
        salprice.Incoterms_1_Code__c = 'dsfhsadfha';
        salprice.Ship_To_Country_Code__c ='teste';
        salprice.ComPartner_Code__c = 'testing';
        salprice.Key_Combination__c = 'Landing Cost';
        salprice.Landing_Cost__c = true;
        insert salprice;
      
        PAUtil.insertProfileRecordId();
        
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
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingCondition1.Scale_Type__c = 'Test';
        pricingConditionsList.add(pricingCondition1);
        
        insert pricingConditionsList;
        
        paRList.pricingRequestId = pr.id;
        paRList.PricingRequestIdfortask = pr.id;

        paRList.selectAllFlag = true;
        paRList.wrapperList = new List<PAWrapper>();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        String a = PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM;
        a = PARelatedList.SOBJECTTYPE_ADMINMASTER;
        a = PARelatedList.SOBJECTTYPE_BUPH;
        a = PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP;
        a = PARelatedList.SOBJECTTYPE_MATERIAL;
        a = PARelatedList.SOBJECTTYPE_ORGGROUPITEM;
        a = PARelatedList.SOBJECTTYPE_PAORGGROUP;
        a = PARelatedList.SOBJECTTYPE_PH;
        a = PARelatedList.SOBJECTTYPE_PRICINGREQUEST;
        a = PARelatedList.SOBJECTTYPE_PROJECTPRICE;
        boolean b = PARelatedList.BOOLEAN_TRUE;
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.sobjectRecord = prItem;
            wrap.quantity='100';            
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.selectAll();
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.stringMap.put('changeVolume', 'true');
            wrap.sobjectRecord = prItem;
            wrap.quantity='100';
            
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.deleteSelected();
        paRList.selectAll();
        paRList.selectUnedited();
        paRList.deleteSelected();
        paRList.loadPage();
        
        paRList.requestBUSalesArea = 'Test-Test-Test-Test';
        OrgGroup__c org = new OrgGroup__c();
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c = 'Sales Area Config';
        orgItem.Customer_Price_Payment_Terms__c = 'test;test';
        orgItem.Customer_Price_Fixed_Date_Payment_Terms__c='test;test';
        orgItem.ERP_UoM__c='KG';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pr;
            wrap.isSelected =  true;           
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.applyChanges();
    
        Project_Price__c project = new Project_Price__c();
        insert project;
        pr = new Pricing_Request__c(Sales_Org_Code__c = 'A134',BU__c = 'DCP AP');
        pr.Project_Id__c = [SELECT Project_Id__c FROM Project_Price__c WHERE id=:project.Id].Project_Id__c;
        insert pr;
        Pricing_Request__c prProj = new Pricing_Request__c(Project_Id__c = pr.Id,Sales_Org_Code__c = 'A134',BU__c = 'DCP AP');
        insert prProj;
        paRList.ProjectPriceId = pr.Id;
        paRList.getProjectVolume();
        
        paRList.ProjectPriceId = project.Id;
        //apac
        paRList.getProjectRequestId();
        
        paRList.getsoldToNameForCSRNotification();
        
        Task task = new Task();
        task.WhatId = pr.Id;
        insert task;
        Task task1 = new Task();
        task1.WhatId = project.Id;
        insert task1;
        paRList.getProjectTaskId();
        paRList.PricingRequestIdfortask = pr.Id;
        paRList.getTaskComments();
        paRList.getTaskId();
        paRList.cancelInLineVolChanges();
        paRList.applyChangesPaymentTerms(); 
        paRList.enableFixedDateMethod();
        paRList.selectAllVolume();    
        paRList.selectAllVolumeFlag=false;
        paRList.scUoM = 'Select';
         for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('changeVolume', 'true');
            wrap.sobjectRecord = prItem;
            wrap.quantity='100';
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.saveInLineVolChangesMassive();
        paRList.rateType = 'Select';
        paRList.scUoM = 'Test';
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.changeVolume = false;
            wrap.changeScale = true;
            wrap.sobjectRecord = prItem;
            wrap.quantity='100';            
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.plusMinus1 = 'Negative';
        paRList.saveInLineVolChangesMassive();
        paRList.scaleCheck = 'Ascending';
        paRList.saveScale();
        paRList.scaleCheck = 'Descending';
        paRList.rateType = 'New Rate';
        paRList.saveScale();
        paRList.rateType = 'Absolute';
        paRList.saveScale();
        paRList.rateType = 'Percentage';
        paRList.saveScale();
        
        /*Organizational_Group_Item__c orgItem1 = new Organizational_Group_Item__c();
        orgItem1.OrgGroup__c = org.Id;
        orgItem1.ERP_Pricing_Procedure__c = epp.Id;
        orgItem1.Business__c = org.Id;
        orgItem1.Enable_Material_Group_5__c = true;
        orgItem1.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem1.Customer_Price_Payment_Terms__c = 'test;test';
        orgItem1.Customer_Price_Fixed_Date_Payment_Terms__c='test;test';
        orgItem1.ERP_UoM__c='KG';
        insert orgItem1;*/
        
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request__c = pr.Id;
        
        prItem1.New_Unit__c = '%';
        prItem1.isNPCApplicable__c = true;
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.SAP_Cluster__c = 'CB1';
        prItem1.SAP_Client_Id__c = 'V';
        prItem1.SAP_Application_Id__c = '510';
        prItem1.key_combination__c = 'Material';
        prItem1.Scaled_Price_Flag__c = true;
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.changeVolume=true;
            wrap.changeScale =true;
            wrap.isSelected = true;
            wrap.sobjectRecord = prItem1;
            wrap.quantity='100';
            //wrap.xpLishowEnk =true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.saveInLineVolChanges();
        paRList.changeToNonScale();
        
        paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
        //prItem.New_Unit__c = null;
        //prItem.Key_Combination__c = 'PH';
        //update prItem;
        orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem.Default_SalesArea_UoM__c=null;
        orgItem.Default_Per_Value__c=null;
        update orgItem;
        paRList.saveScale();
        paRList.applyChanges();
    }
    
    static testMethod void paRequestTestMethod1() {
       Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
       
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Project';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Project';
        prItem.Pricing_Request__c = pr.Id;
        prItem.isNPCApplicable__c= true;
        
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
        insert prItem;
        NPC_Request__c npcReq =new NPC_Request__c();
        npcReq.isSynchronous__c=true;
        npcReq.Status__c='Active';
        npcReq.Pricing_Request_Item__c=prItem.Id;
        insert npcReq;
        paRList.pricingRequestId = pr.id;
        paRList.PricingRequestIdfortask = pr.id;
        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = priTem;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.selectAll();
        paRList.selectUnedited();
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Pricing Task';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.isNPCApplicable__c=true;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Unit__c = '%';
        prItem1.New_Valid_To__c =  system.now().date()- 1;
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        NPC_Request__c npcReq1 =new NPC_Request__c();
        npcReq1.isSynchronous__c=true;
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=prItem1.Id;
        insert npcReq1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.wrapperList.clear();
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.selectUnedited();
        paRList.requestBUSalesArea = 'Test-Test-Test-Test';
        OrgGroup__c org = new OrgGroup__c();
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pr;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.applyChanges();
        paRList.deleteSelected();
        paRList.selectAllVolume();    
        paRList.selectAllVolumeFlag=true;
        
        paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem.Default_SalesArea_UoM__c=null;
        orgItem.Default_Per_Value__c=null;
        update orgItem;
        //paRList.saveScale();
        paRList.applyChanges();
    }
    
    static testMethod void paRequestTestMethod3() {
       Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
       
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Project';
        pr.Sales_Org_Code__c = 'A250';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Project';
        prItem.Pricing_Request__c = pr.Id;
        prItem.isNPCApplicable__c=true;
        prItem.New_Unit__c = '%';
        
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
        insert prItem;
        paRList.pricingRequestId = pr.id;
        paRList.PricingRequestIdfortask = pr.id;

        PAUtil.insertProfileRecordId();
        
        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Pricing Task';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.isNPCApplicable__c=true;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test';
        OrgGroup__c org = new OrgGroup__c();
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;  
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';  
        insert orgItem;
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pr;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.applyChanges();
        paRList.deleteSelected();
        paRList.selectAllVolume();    
        paRList.selectAllVolumeFlag=true;
        
        paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem.Default_SalesArea_UoM__c=null;
        orgItem.Default_Per_Value__c=null;
        update orgItem;
        //paRList.saveScale();
        paRList.applyChanges();
    }
    static testMethod void paRequestTestMethod4() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');   
        insert u1;
        system.runas(u1){
          
        Price_Visibility__c pr23 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr23; 
        PAProfilePermissions__c pr4 = new PAProfilePermissions__c (Name='BU Admin', Name__c='Price Approval-BU Admin');
        insert pr4;
        
        PAProfilePermissions__c pr5 = new PAProfilePermissions__c (Name='IT Admin', Name__c='Price Approval-IT Admin');
        insert pr5;
          
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A250';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();
        
        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Pricing Task';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.isNPCApplicable__c=true;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
         
        insert prItem1;
        NPC_Request__c npcReq =new NPC_Request__c();
        npcReq.isSynchronous__c=true;
        npcReq.Status__c='Active';
        npcReq.Pricing_Request_Item__c=prItem1.Id;
        insert npcReq;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Massive';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'DPT AP';
        org.ERP_Sales_Org_Code__c = 'A250';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        //system.RunAs(u1){
        //}
            paRlist.rateType = '--Select--';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
           paRList.templatePricingRequestId=pr.Id;
           
           orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem.Default_SalesArea_UoM__c=null;
        orgItem.Default_Per_Value__c=null;
        update orgItem;
       // paRList.saveScale();
        paRList.applyChanges();
        }
        
    }
    
    static testMethod void paRequestTestMethod5() {
       
                
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        
       // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
       User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        system.runas(u1){
        Price_Visibility__c pr23 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr23; 
        
        PAProfilePermissions__c pr4 = new PAProfilePermissions__c (Name='BU Admin', Name__c='Price Approval-BU Admin');
        insert pr4;
        
        PAProfilePermissions__c pr5 = new PAProfilePermissions__c (Name='IT Admin', Name__c='Price Approval-IT Admin');
        insert pr5;  
          
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Sales_Org_Code__c = 'A250';
        pr.BU__c = 'DPP Polymers EMEA';
        pr.Pricing_Request_Type__c = 'Permanent';
        insert pr;
        
        
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        paRList.templatePricingRequestId=pr.Id;
        
        PAUtil.insertProfileRecordId();
        
        
        //apac
        RecordType r1 = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D123',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=r1.id,
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

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.Quantity__c = '10';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.Material_Code__c = 'D123';
        prItem1.isNPCApplicable__c=true;
         
        insert prItem1;
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request_Type__c = 'Permanent';
        prItem2.Pricing_Request__c = pr.Id;
        prItem2.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem2.New_Valid_From__c = system.now().date()+3;
        prItem2.New_Valid_To__c =  system.now().date()+5;
        prItem2.New_Rate__c = '10';
        prItem2.Rate__c = '10';
        prItem2.New_Unit__c = '%';
        prItem2.Quantity__c = '10';
        prItem2.ScaleRate1__c = '10'; 
        prItem2.ScaleRate2__c = '10';
        prItem2.ScaleRate3__c = '10';
        prItem2.ScaleRate4__c = '10';
        prItem2.ScaleRate5__c = '10';
        prItem2.ScaleRate6__c = '10';
        prItem2.ScaleRate7__c = '10';
        prItem2.ScaleRate8__c = '10';
        prItem2.ScaleRate9__c = '10';
        prItem2.ScaleRate10__c = '10';
        prItem2.Material_Code__c = 'D123';
        prItem2.isNPCApplicable__c=true;
         
        prItem2.UoM__c=null;
        prItem2.Per__c=null;
        prItem2.Unit__c=null;
        insert prItem2;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        //system.RunAs(u1){
        //}
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem.Default_SalesArea_UoM__c=null;
        orgItem.Default_Per_Value__c=null;
        update orgItem;
       // paRList.saveScale();
        paRList.applyChanges();
            
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
            paRList.templatePricingRequestId=pr.Id;
        }
        
    }
    
    static testMethod void paRequestTestMethod2() {
       
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        //12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
       User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');        
        insert u1;
        system.runas(u1){
          
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A250';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;

        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        insert erp;
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.Key_Combination_Code__c = 'A821';
        prItem1.isNPCApplicable__c=true;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
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
    
    static testMethod void paRequestTestMethod6() {
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';        
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        insert erp;
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
        prItem1.Distributor_Code__c='Y7';
        prItem1.Distributor_Name__c='XYZ';
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
         
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  false;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
        }
        static testMethod void paRequestTestMethod7() {
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        insert erp;
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = NULL;
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
        }
        
        static testMethod void paRequestTestMethod8() {
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        insert erp;
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  NULL;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
        }
        
        static testMethod void paRequestTestMethod9() {
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        insert erp;
        
        paRList.rateChange = '10';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = NULL;
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';   
        prItem1.ScaleRate10__c = '10';
        prItem1.Customer_Specific__c = true;
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            prItem1.Customer_Specific__c = false;
            upsert prItem1;
            paRList.applyChanges();
            paRList.rateChange = NULL;
            paRList.applyChanges();
        }
        
        
        static testMethod void paRequestTestMethod10() {
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        PAUtil.insertProfileRecordId();
        
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;       
        

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Valid_To__c = system.now().date();
        insert erp1;
        
                
        
        List<ERP_Key_Combination__c> erpKCList = new List<ERP_Key_Combination__c>();
        ERP_Key_Combination__c erpKC1 = new ERP_Key_Combination__c();
        erpKC1.Key_Combination_Code__c = 'A821';
        erpKC1.Key_Combination_Type__c='floor';
        erpKC1.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment';
        erpKCList.add(erpKC1);
        insert erpKCList;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Price_Holder__c =erp1.Id;
        insert erp;
        
        paRList.rateChange = '10';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.Key_Combination_Code__c = 'A821';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
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
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        
        
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Permanent';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Gap_Pricing_Request_Item__c = prItem.Id;
        prItem.Rate__c = '10';
        prItem.Quantity__c = '10';
        prItem.Unit__c = '%';
        prItem.Valid_From__c = system.now().date()+10;
        prItem.Valid_To__c = system.now().date()+12;
        prItem.ScaleRate1__c = '10'; 
        prItem.ScaleRate2__c = '10';
        prItem.ScaleRate3__c = '10';
        prItem.ScaleRate4__c = '10';
        prItem.ScaleRate5__c = '10';
        prItem.ScaleRate6__c = '10';
        prItem.ScaleRate7__c = '10';
        prItem.ScaleRate8__c = '10';
        prItem.ScaleRate9__c = '10';    
        prItem.ScaleRate10__c = '10';
        prItem.Key_Combination_Code__c = 'A821';
        prItem.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem.isNPCApplicable__c=true; 
        
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;        
        insert prItem;
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
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
    //    orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        pricingCondition1.Calculation_Type__c = 'A - Percentage';
        pricingCondition1.Check_Scale_Code__c = 'A';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingConditionsList.add(pricingCondition1);
        
        insert pricingConditionsList;

        


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
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.applyChanges();
            
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
            paRList.applyChanges();
            paRlist.pricingRequestId = pr.Id;
            
            ctrlPAMain test = new ctrlPAMain();
            paRlist = new paRelatedList(test);
        }
        
        static testMethod void paRequestTestMethod11() {
        //apac
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        
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
        pr.BU__c='BI';
        
        insert pr;

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        //paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
       // paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        
        PAUtil.insertProfileRecordId();
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Valid_From__c = system.now().date()-50;
        erp1.Valid_To__c = system.now().date()+100;
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
        prItem1.New_Unit__c = '%';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.Distributor_Code__c='Y7';
        prItem1.Distributor_Name__c='XYZ';
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
        prItem1.Key_Combination__c = 'Material';
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.Material_Code__c = 'D12345';
        prItem1.Pricing_Condition__c = 'ZPSE';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
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
        prItem.isNPCApplicable__c=true;
        
        
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
        prItem2.isNPCApplicable__c=true;
        
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
       // orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        pricingCondition1.Condition_class__c = 'Discount or Surcharge';
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
        
            
        }
        //apac
        static testMethod void paRequestTestMethod12() {
        Price_Visibility__c pr23 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr23;  
        PAUtil.insertProfileRecordId();
        
        PAProfilePermissions__c pr4 = new PAProfilePermissions__c (Name='BU Admin', Name__c='Price Approval-BU Admin');
        insert pr4;
        
        PAProfilePermissions__c pr5 = new PAProfilePermissions__c (Name='IT Admin', Name__c='Price Approval-IT Admin');
        insert pr5;
        
        PARelatedList paRList = new PARelatedList();
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c='A640';
        pr.Division_Code__c='02';
        pr.Dist_Channel_Code__c = '10';
        pr.BU__c='BI';
        insert pr;
       // prList.add(pr);
        
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Non Customer Specific';
        pr1.Pricing_Request_Type__c = 'Permanent';
        pr1.Sales_Org_Code__c='A640';
        pr1.Division_Code__c='02';
        pr1.Dist_Channel_Code__c = '10';
        pr1.BU__c='BI';
        //prList.add(pr1);
        
        insert pr1;
        //insert prList;
        
       
        
       
        
        List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
        
        for(Integer j = 0; j <= 202 ; j = j+2)
        {
            Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
            prItem.Pricing_Request__c = pr.Id;
            prItem.Valid_From__c = system.now().date()+j;
            prItem.Valid_To__c = system.now().date()+j+1;
            prItem.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
            prItem.Key_Combination_Code__c = 'A821';
            prItem.Material_Code__c = 'D123';
            
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
            priList.add(prItem);            
        }
        
        List<ERP_Key_Combination__c> erpKCList = new List<ERP_Key_Combination__c>();
        ERP_Key_Combination__c erpKC1 = new ERP_Key_Combination__c();
        erpKC1.Key_Combination_Code__c = 'A821';
        erpKC1.Key_Combination_Type__c='floor';
        erpKC1.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment';
        erpKCList.add(erpKC1);
        insert erpKCList;
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request__c = pr1.Id;
        prItem1.Pricing_Request_Type__c='Floor';
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        priList.add(prItem1);   
        insert priList;
        
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();         
        paRList.templatePricingRequestId=pr1.Id;
        
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request__c = pr1.Id;
        prItem2.Gap__c = true;
        prItem2.Key_Combination_Code__c = 'A821';
        prItem2.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
        prItem2.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem2.Valid_From__c = system.now().date();
        prItem2.Valid_To__c = system.now().date()+10;
        prItem2.Material_Code__c = 'D123';
        prItem2.isNPCApplicable__c=true;
        prItem2.Pricing_Request_Type__c='Floor';
        prItem2.UoM__c=null;
        prItem2.Per__c=null;
        prItem2.Unit__c=null;
        insert prItem2;
        
        paRList.wrapperList = new List<PAWrapper>();
        
        PAWrapper wrap = new PAWrapper();
        wrap.stringMap.put('disableCheckBox', 'false');
        wrap.sobjectRecord = prItem1;
        wrap.isSelected =  true;
        paRList.wrapperList.add(wrap);
        wrap = new PAWrapper();
        wrap.stringMap.put('disableCheckBox', 'true');
        wrap.sobjectRecord = prItem2;
        paRList.wrapperList.add(wrap);  
        paRList.deleteSelected();
        
        paRList.rejectionComments = pr.Id;
        paRList.Rname = pr.Id;
        paRList.getApprovalSteps();
        paRList.getApprovalName();          
        }
        
        static testMethod void paRequestTestMethod13() {
        //apac
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        
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
        pr.BU__c='BI';
        
        insert pr;
        
        PAUtil.insertProfileRecordId();

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
        prItem1.New_Unit__c = '%';
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
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.Material_Code__c = 'D12345';
        prItem1.Pricing_Condition__c = 'ZPSE';
        prItem1.Customer_Specific__c = true;
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
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
        prItem.isNPCApplicable__c=true;         
        
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
        prItem2.isNPCApplicable__c=true;
         
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
        
            
        }
        
        static testMethod void paRequestTestMethod14() {
        //apac
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
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
        pr.BU__c='BI';
        
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        //paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        //paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Valid_From__c = system.now().date()+100;
        erp1.Valid_To__c = system.now().date()+200;
        erp1.isPriceHolder__c = true;
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
        prItem1.Rate__c = ' ';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
        prItem1.New_Unit__c = '%';
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
        prItem1.Key_Combination__c = 'Material';
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.Material_Code__c = 'D12345';
        prItem1.Pricing_Condition__c = 'ZPSE';
        prItem1.Customer_Specific__c = true;
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
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
        prItem.isNPCApplicable__c=true;
        
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
        prItem2.isNPCApplicable__c=true;
        
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
       // orgGrpItem.Approval_Escalation_Duration__c = 23;
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
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+22;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+24;
            
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
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+10;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+12;
            
            paRlist.rateType = 'Expire';
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
            paRList.selectAllVolume();    
            paRList.selectAllVolumeFlag=false;
            paRList.selectAllScale();
            paRList.selectAllScaleFlag=true;
           
try
{
            paRList.deleteSelectedId='12a';
            }
            catch(Exception e)
            {
            System.debug('Error:'+e);
            }
        }
        
        static testMethod void paRequestTestMethod15() {
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
        
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Valid_To__c = system.now().date();
        insert erp1;
        
        List<ERP_Key_Combination__c> erpKCList = new List<ERP_Key_Combination__c>();
        ERP_Key_Combination__c erpKC1 = new ERP_Key_Combination__c();
        erpKC1.Key_Combination_Code__c = 'A821';
        erpKC1.Key_Combination_Type__c='floor';
        erpKC1.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment';
        erpKCList.add(erpKC1);
        insert erpKCList;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Price_Holder__c =erp1.Id;
        insert erp;
        
        paRList.rateChange = '10';  
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.Key_Combination_Code__c = 'A821';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
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
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
        pritem1.Condition_Class__c='Discount or Surcharge';
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        
        
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Permanent';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Gap_Pricing_Request_Item__c = prItem.Id;
        prItem.Rate__c = '10';
        prItem.Quantity__c = '10';
        prItem.Unit__c = '%';
        prItem.Valid_From__c = system.now().date()+10;
        prItem.Valid_To__c = system.now().date()+12;
        prItem.ScaleRate1__c = '10'; 
        prItem.ScaleRate2__c = '10';
        prItem.ScaleRate3__c = '10';
        prItem.ScaleRate4__c = '10';
        prItem.ScaleRate5__c = '10';
        prItem.ScaleRate6__c = '10';
        prItem.ScaleRate7__c = '10';
        prItem.ScaleRate8__c = '10';
        prItem.ScaleRate9__c = '10';    
        prItem.ScaleRate10__c = '10';
        prItem.Key_Combination_Code__c = 'A821';
        //prItem.Key_Combination__c = 'Material';
        prItem.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
        prItem.Pricing_Condition_Code__c = 'ZPSE';
        prItem.Material_Code__c = 'D12345';
        prItem.Pricing_Condition__c = 'ZPSE';
        prItem.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem.SAP_Cluster__c = 'CB1';
        prItem.SAP_Client_Id__c = 'V';
        prItem.SAP_Application_Id__c = '510';
        prItem.isNPCApplicable__c=true;
        pritem.Condition_Class__c='Discount or Surcharge';
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
        insert prItem;
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
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
    //    orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        pricingCondition1.Calculation_Type__c = 'A - Percentage';
        pricingCondition1.Check_Scale_Code__c = 'A';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingConditionsList.add(pricingCondition1);
        
        insert pricingConditionsList;

        


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

        Pricing_Request_Item__c pricRequestItem = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, Rate_One__c, Floor_Price_in_USD__c, Ref_Price_in_USD__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:prItem.id];



        Pricing_Request_Item__c pricRequestItem1 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, Rate_One__c, Floor_Price_in_USD__c, Ref_Price_in_USD__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:prItem1.id];

        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pricRequestItem;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
      /*  for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pricRequestItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        */
             paRlist.rateType = 'New Rate';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();

            
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
            paRList.applyChanges();

            paRlist.pricingRequestId = pr.Id;
            
            ctrlPAMain test = new ctrlPAMain();
            paRlist = new paRelatedList(test);
        }



    static testMethod void paRequestTestMethod16() {
       Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
       
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Valid_To__c = system.now().date();
        insert erp1;
        
        List<ERP_Key_Combination__c> erpKCList = new List<ERP_Key_Combination__c>();
        ERP_Key_Combination__c erpKC1 = new ERP_Key_Combination__c();
        erpKC1.Key_Combination_Code__c = 'A821';
        erpKC1.Key_Combination_Type__c='floor';
        erpKC1.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment';
        erpKCList.add(erpKC1);
        insert erpKCList;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Price_Holder__c =erp1.Id;
        insert erp;
        
        paRList.rateChange = '10';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.Key_Combination_Code__c = 'A821';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
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
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
         
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        
        
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Permanent';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Gap_Pricing_Request_Item__c = prItem.Id;
        prItem.Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Unit__c = '%';
        prItem.Valid_From__c = system.now().date()+10;
        prItem.Valid_To__c = system.now().date()+12;
        prItem.ScaleRate1__c = '10'; 
        prItem.ScaleRate2__c = '10';
        prItem.ScaleRate3__c = '10';
        prItem.ScaleRate4__c = '10';
        prItem.ScaleRate5__c = '10';
        prItem.ScaleRate6__c = '10';
        prItem.ScaleRate7__c = '10';
        prItem.ScaleRate8__c = '10';
        prItem.ScaleRate9__c = '10';    
        prItem.ScaleRate10__c = '10';
        prItem.Key_Combination_Code__c = 'A821';
        //prItem.Key_Combination__c = 'Material';
        prItem.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
        prItem.Pricing_Condition_Code__c = 'ZPSE';
        prItem.Material_Code__c = 'D12345';
        prItem.Pricing_Condition__c = 'ZPSE';
        prItem.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem.SAP_Cluster__c = 'CB1';
        prItem.SAP_Client_Id__c = 'V';
        prItem.SAP_Application_Id__c = '510';
        prItem.isNPCApplicable__c=true;
        
        
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
        insert prItem;
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
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
        orgGrpItem.Default_Per_UoM_Setup__c='Sales Area Config';
        orgGrpItem.CurrencyIsoCode = 'USD';
    //    orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        pricingCondition1.Calculation_Type__c = 'A - Percentage';
        pricingCondition1.Check_Scale_Code__c = 'A';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingConditionsList.add(pricingCondition1);
        
        insert pricingConditionsList;

        


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

        Pricing_Request_Item__c pricRequestItem = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, Rate_One__c, Floor_Price_in_USD__c, Ref_Price_in_USD__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:prItem.id];



        Pricing_Request_Item__c pricRequestItem1 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, Rate_One__c, Floor_Price_in_USD__c, Ref_Price_in_USD__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:prItem1.id];

        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pricRequestItem;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
      /*  for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pricRequestItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
    */
            system.Test.startTest();
            
            PAWrapper wrap1 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap1.stringMap.put('disableCheckBox', 'false');
            wrap1.stringMap.put('showExpLink', 'true');
            wrap1.sobjectRecord = pricRequestItem;
            wrap1.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap1.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap1);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();
            


            PAWrapper wrap2 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap2.stringMap.put('disableCheckBox', 'false');
            wrap2.stringMap.put('showExpLink', 'false');
            wrap2.sobjectRecord = pricRequestItem;
            wrap2.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap2.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap2);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();
            
            
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();

            system.Test.stopTest();
            /*
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
            paRList.applyChanges();

            paRlist.pricingRequestId = pr.Id;
            */
            ctrlPAMain test = new ctrlPAMain();
            paRlist = new paRelatedList(test);
        }
   
   static testMethod void paRequestTestMethod17() {
        Price_Visibility__c pr23 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr23;  
        PAProfilePermissions__c pr4 = new PAProfilePermissions__c (Name='BU Admin', Name__c='Price Approval-BU Admin');
        insert pr4;
        
        PAProfilePermissions__c pr5 = new PAProfilePermissions__c (Name='IT Admin', Name__c='Price Approval-IT Admin');
        insert pr5;
        
        
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Non Customer Specific';
        pr.Standardized_Currency__c = 'USD';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+23;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+25;
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Valid_To__c = system.now().date();
        insert erp1;
        
        List<ERP_Key_Combination__c> erpKCList = new List<ERP_Key_Combination__c>();
        ERP_Key_Combination__c erpKC1 = new ERP_Key_Combination__c();
        erpKC1.Key_Combination_Code__c = 'A821';
        erpKC1.Key_Combination_Type__c='floor';
        erpKC1.Key_Combination__c = 'Material Price Group/Customer Price Group/Material/PH1/PH2/Price List Type/Market Segment/End Use/Country/Sales Office/Terms Of Payment';
        erpKCList.add(erpKC1);
        insert erpKCList;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Price_Holder__c =erp1.Id;
        insert erp;
        
        paRList.rateChange = '10';
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.Key_Combination_Code__c = 'A821';
        prItem1.Rate__c = '10';
        prItem1.Quantity__c = '10';
        prItem1.Unit__c = '%';
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
        prItem1.Key_Combination_Code__c = 'A821';
        prItem1.Key_Combination__c = 'PH';
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.Material_Code__c = 'D12345';
        prItem1.Pricing_Condition__c = 'ZPSE';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.SAP_Cluster__c = 'CB1';
        prItem1.SAP_Client_Id__c = 'V';
        prItem1.SAP_Application_Id__c = '510';
        prItem1.Sales_Org_Code__c = 'A134';
        prItem1.isNPCApplicable__c=true;
        prItem1.Distributor_Code__c='Y7';
        prItem1.Distributor_Name__c='XYZ';
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        
        
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request_Type__c = 'Permanent';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Gap_Pricing_Request_Item__c = prItem.Id;
        prItem.Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Unit__c = '%';
        prItem.Valid_From__c = system.now().date()+10;
        prItem.Valid_To__c = system.now().date()+12;
        prItem.ScaleRate1__c = '10'; 
        prItem.ScaleRate2__c = '10';
        prItem.ScaleRate3__c = '10';
        prItem.ScaleRate4__c = '10';
        prItem.ScaleRate5__c = '10';
        prItem.ScaleRate6__c = '10';
        prItem.ScaleRate7__c = '10';
        prItem.ScaleRate8__c = '10';
        prItem.ScaleRate9__c = '10';    
        prItem.ScaleRate10__c = '10';
        prItem.Key_Combination_Code__c = 'A821';
        //prItem.Key_Combination__c = 'Material';
        prItem.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
        prItem.Pricing_Condition_Code__c = 'ZPSE';
        prItem.Material_Code__c = 'D12345';
        prItem.Pricing_Condition__c = 'ZPSE';
        prItem.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem.SAP_Cluster__c = 'CB1';
        prItem.SAP_Client_Id__c = 'V';
        prItem.SAP_Application_Id__c = '510';
        prItem.isNPCApplicable__c=true;
        prItem.UoM__c=null;
        prItem.Per__c=null;
        prItem.Unit__c=null;
         
         
        insert prItem;
        paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
        paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
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
        orgGrpItem.Default_Per_UoM_Setup__c='Product Hierarchy Config';
        orgGrpItem.CurrencyIsoCode = 'USD';
    //    orgGrpItem.Approval_Escalation_Duration__c = 23;
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
        pricingCondition1.Calculation_Type__c = 'A - Percentage';
        pricingCondition1.Check_Scale_Code__c = 'A';
        pricingCondition1.Check_Scale__c = 'Descending';
        pricingCondition1.Plus_Minus_Code__c = 'X';


        ERP_Pricing_Condition__c pricingCondition2 = new ERP_Pricing_Condition__c();
        pricingCondition2.Pricing_Condition_Code__c = 'ZPSE';
        pricingCondition2.Pricing_Condition__c = 'ZPSE';
        pricingCondition2.SAP_Cluster__c = 'CB1';
        pricingCondition2.SAP_Application_Id__c = '510';
        pricingCondition2.SAP_Client_Id__c = 'V';
        pricingCondition2.Price_Types__c = 'Standard;Spot;Project';
        pricingCondition2.SAP_Condition_Type__c = true;
        pricingCondition2.Condition_class__c = 'Price';
        pricingCondition2.Calculation_Type__c = 'A - Fixed Amount';
        pricingCondition2.Check_Scale_Code__c = 'A';
        pricingCondition2.Check_Scale__c = 'Descending';
        pricingCondition2.Plus_Minus_Code__c = 'X';

        pricingConditionsList.add(pricingCondition1);
        pricingConditionsList.add(pricingCondition2);
        
        insert pricingConditionsList;

        


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

        Pricing_Request_Item__c pricRequestItem = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, Rate_One__c, Floor_Price_in_USD__c, Ref_Price_in_USD__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:prItem.id];



        Pricing_Request_Item__c pricRequestItem1 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, Rate_One__c, Floor_Price_in_USD__c, Ref_Price_in_USD__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
PCKC__c, PH1_Code__c, PH1__c, PH2_Code__c, PH2__c, PH3_Code__c, PH3__c, PH4_Code__c, PH4__c, PH5_Code__c, PH5__c, PH6_Code__c, PH6__c, PH7_Code__c, PH7__c, 
PH8_Code__c, PH8__c, PH9_Code__c, PH9__c, Per__c, Plus_Minus_Code__c, Plus_Minus__c, Price_List_Type_Code__c, Price_List_Type__c, Price_Ref_Partner_Code__c, 
Price_Ref_Partner__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request_Type__c, Pricing_Task_UoM__c, Product_Hierarchy_Code__c, 
Product_Hierarchy__c, Profit_Center_Code__c, Profit_Center__c, Quantity__c, Rate__c, SAP_Application_Id__c, SAP_Client_Id__c, SAP_Cluster__c, 
Sales_Office_Code__c, Sales_Office__c, Sales_Org_Code__c, Sales_Org__c, ScaleRate10__c, ScaleRate1__c, ScaleRate2__c, ScaleRate3__c, ScaleRate4__c, 
ScaleRate5__c, ScaleRate6__c, ScaleRate7__c, ScaleRate8__c, ScaleRate9__c, Scale_Basis_Code__c, Scale_Basis__c, Scale_Quantity_Scale_Value10__c, 
Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value5__c, 
Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value9__c, Scale_Type_Code__c, 
Scale_Type__c, Scale_UoM_Scale_Unit__c, Scaled_Price_Flag__c, ShipTo_Code__c, ShipTo__c, Sold_To_Code__c, Sold_To__c, Stamp_Converted_Current_Price__c, 
Stamp_Current_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Floor_Price__c, Stamp_New_Net_Price__c, Stamp_Reference_Net_Price__c, Stamp_Reference_Price__c, 
Terms_Of_Payment_Code__c, Terms_Of_Payment__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Integration_Error_Message__c, Net_Price_Status__c, 
Total_Materials__c, Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c, Materials_Below_Net_Reference__c, Materials_with_Error_Response__c, 
Net_Price_Calculated_Materials__c, Number_of_Material_with_Gross_Price__c, Base_UoM__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c, USD_Rate__c, 
Ship_To_Country_Code__c, Ship_To_Country__c, Customer_Price_Payment_Terms__c, Error_Indicator__c, Exchange_Rate__c, New_Customer_Price_Payment_Terms__c, 
New_Payment_Terms_Fixed_Date__c, New_Volume_UoM__c, New_Volume__c, Payment_Terms_Fixed_Date__c, Sales_Order_Type_Code__c, Sales_Order_Type__c, 
UOM_Conversion_Factors__c, Variant_Code__c, Variant__c, Volume_UoM__c, Volume__c, isFloorApplicable__c, isNPCApplicable__c, isPaymentTermsApplicable__c, 
isVolumeApplicable__c, External_ERP_ID__c, ComPartner_Code__c, ComPartner__c, Destination_Country_Code__c, Destination_Country__c, Material_Group_5_Code__c, 
Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:prItem1.id];

        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pricRequestItem;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
      /*  for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = pricRequestItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
    */
            system.Test.startTest();
            
            PAWrapper wrap1 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap1.stringMap.put('disableCheckBox', 'false');
            wrap1.stringMap.put('showExpLink', 'true');
            wrap1.sobjectRecord = pricRequestItem;
            wrap1.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap1.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap1);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();
            


            PAWrapper wrap2 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap2.stringMap.put('disableCheckBox', 'false');
            wrap2.stringMap.put('showExpLink', 'false');
            wrap2.sobjectRecord = pricRequestItem;
            wrap2.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap2.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap2);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();

            PAWrapper wrap3 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap3.stringMap.put('disableCheckBox', 'false');
            wrap3.stringMap.put('showExpLink', 'false');
            wrap3.sobjectRecord = pricRequestItem1;
            wrap3.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap3.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap3);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.applyChanges();
            
            PAWrapper wrap4 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap4.stringMap.put('disableCheckBox', 'false');
            wrap4.stringMap.put('showExpLink', 'true');
            wrap4.sobjectRecord = pricRequestItem1;
            wrap4.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap4.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap4);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.plusMinus1 = 'Negative';
            paRList.rate1 = '2.0';
            //paRList.applyChanges();
            paRList.saveScale();
            paRList.applyChangesPaymentTerms();

            PAWrapper wrap5 = new PAWrapper();
            //wrap.stringMap.put('disableCheckBox', 'true');
            wrap5.stringMap.put('disableCheckBox', 'false');
            wrap5.stringMap.put('showExpLink', 'true');
            wrap5.sobjectRecord = pricRequestItem1;
            wrap5.isSelected =  false;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap5.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap5);
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01.25';
            paRList.rateTypeChange = false;
            paRList.plusMinus1 = 'Negative';
            paRList.rate1 = '2.0';
            paRList.applyChangesPaymentTerms();
            paRList.isFixedDateApplicable = true;
            paRList.applyChangesPaymentTerms();
            paRList.wrapperPricingReqItem.New_Payment_Terms_Fixed_Date__c = system.now().date()-2;
            paRList.applyChangesPaymentTerms();
            paRList.selectAllVolumeFlag = true;
            paRList.selectAllVolume();
            paRList.saveInLineVolChangesMassive();
            paRList.selectAllVolumeFlag = false;
            paRList.selectAllVolume();
            paRList.selectAllScaleFlag = true;
            paRList.selectAllScale();
            paRList.selectAllScaleFlag = false;
            paRList.selectAllScale();
            
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();

            system.Test.stopTest();
            /*
            paRList.wrapperPricingReqItem.New_Valid_From__c = system.now().date()+2;
            paRList.wrapperPricingReqItem.New_Valid_To__c = system.now().date()+7;
            paRList.applyChanges();
            */
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
            paRlist.templatePricingRequestId = pr.Id;
            
            ctrlPAMain test = new ctrlPAMain();
            paRlist = new paRelatedList(test);
        }
        
        static testMethod void paRequestTestMethod345() {
            
      Price_Visibility__c pr4 = new Price_Visibility__c (Name='A640-10-02', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr4;  
      OrgGroup__c org = new OrgGroup__c();
        RecordType recordType = [SELECT id, Name From RecordType WHERE DeveloperName = 'Business' LIMIT 1];
        RecordType recordType1 = [SELECT id, Name From RecordType WHERE DeveloperName = 'ERP_Sales_Area' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        //org.RecordTypeName= recordType.Name;
        org.Business__c = 'DPP Polymers EMEA';        
        insert org;
        OrgGroup__c org1=new OrgGroup__c();
        org1.RecordTypeId = recordType1.Id;
        org1.ERP_Sales_Org_Code__c = 'A134';
        org1.ERP_Distribution_Channel_Code__c = '10';
        org1.ERP_Division_Code__c = '02';
        //org1.RecordTypeName= recordType1.Name;
        insert org1;
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        orgItem.OrgGroup__c = org1.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c = 'Sales Area Config';
        orgItem.Customer_Price_Payment_Terms__c = 'test;test';
        orgItem.Customer_Price_Fixed_Date_Payment_Terms__c='test;test';
        orgItem.ERP_UoM__c='KG';
        insert orgItem;
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Project';
        pr.Sales_Org_Code__c = 'A134';
        pr.BU__c = 'DPP Polymers EMEA';
        pr.is_End_User_Rebate__c=true;
        //pr.UoM__c=null;
        //pr.Per__c=null;
        //pr.Unit__c=null;
        insert pr;
        
        CurrencyType Rate = new CurrencyType();
        Rate = [SELECT ID, ConversionRate from CurrencyType WHERE ISOCode='CNY' LIMIT 1];
        Decimal ExchangeRate = Rate.ConversionRate;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        Decimal z = 20 * 1.13 * ExchangeRate;
        
        prItem.Pricing_Request__c = pr.Id;
        prItem.New_Unit__c = 'USD';
        prItem.isNPCApplicable__c = true;
        prItem.Pricing_Condition_Code__c = 'ZPSE';
        prItem.SAP_Cluster__c = 'CB1';
        prItem.SAP_Client_Id__c = 'V';
        prItem.SAP_Application_Id__c = '510';
        prItem.Distributor_Code__c='Y7';
        prItem.Distributor_Name__c='XYZ';
        //prItem.key_combination__c = 'Material/PH';
        prItem.Key_Combination__c = 'Material/Material Price Group/PH/Customer Price Group/End User/End Use/Sold To/FRB';
        prItem.Scaled_Price_Flag__c = true;
        prItem.Rate__c = '10';
        prItem.New_Rate__c = '20';
        prItem.UoM__c='KG';
        prItem.Per__c=1;
        prItem.Unit__c='USD';
        prItem.New_Volume_UoM__c='KG';
        prItem.New_UOM__c='KG';
        prItem.New_Per__c=1;
        prItem.Rate_One__c = String.valueOf(z);
        prItem.Floor_Price_in_USD__c= '12.33';
        prItem.Ref_Price_in_USD__c= '13.22';
        prItem.New_Valid_to__c=Date.Today();
        prItem.New_Valid_From__c=Date.Today();
        //prItem.BU__c='DPP Polymers EMEA';        
        insert prItem;
        //update prItem;
        List<Schema.FieldSetMember> keyCombinationColumns = paRList.keyCombinationColumns;
             List<Schema.FieldSetMember> soldToColumns = paRList.soldToColumns;
             List<Schema.FieldSetMember> newValueColumns = paRList.newValueColumns;
            List<Schema.FieldSetMember> RPQColumns = paRList.RPQColumns;
             List<Schema.FieldSetMember> RPQApproverColumns = paRList.RPQApproverColumns;
            List<Schema.FieldSetMember> volumeColumns = paRList.volumeColumns;
            
        // RecordType r1 = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data' LIMIT 100];
        
        
        Sales_Prices__c salprice=new Sales_Prices__c ();
        salprice.isPriceHolder__c= true;
        salprice.Valid_From__c=Date.Today();
        salprice.Valid_To__c=Date.Today();
        salprice.Pricing_Condition_Code__c= 'ZPSE';
        salprice.Sales_Org_Code__c= 'test';
        salprice.Dist_Channel_Code__c = 'data';
        salprice.Division_Code__c = 'dsfhsadfha';
        salprice.Sold_To_Code__c = 'dsfhsadfha';
        salprice.Material_Code__c = 'dsfhsadfha';
        salprice.PH1_Code__c = 'ds';
        salprice.PH2_Code__c = 'd';
        salprice.PH3_Code__c = 'ds';
        salprice.PH4_Code__c = 'ds';
        salprice.PH5_Code__c = 'ha';
        salprice.PH6_Code__c = 'ha';
        salprice.PH7_Code__c = 'da';
        salprice.PH8_Code__c = 'da';
        salprice.PH9_Code__c = 'a';
        salprice.ShipTo_Code__c = 'dsf';
        salprice.Sales_Office_Code__c = 'dsfhsadfha';
        salprice.Customer_Price_Group_Code__c = 'dsfhsadfha';
        salprice.Material_Price_Group_Code__c = 'dsfhsadfha';
        salprice.Price_List_Type_Code__c = 'dsfhsadfha';
        salprice.Terms_of_Payment_Code__c = 'dsfhsadfha';
        salprice.End_Use_Code__c = 'dsfhsadfha';
        salprice.Market_Segment_Code__c = 'dsfhsadfha';
        salprice.Variant_Code__c = 'dsfhsadfha';
        salprice.Sales_Order_Type_Code__c = 'dsfhsadfha';
        salprice.Country_Code__c = 'dsfhsadfha';
        salprice.Profit_Center_Code__c = 'dsfhsadfha';
        salprice.Incoterms_1_Code__c = 'dsfhsadfha';
        salprice.Ship_To_Country_Code__c ='teste';
        salprice.ComPartner_Code__c = 'testing';
        salprice.Key_Combination__c = 'Landing Cost';
        salprice.Landing_Cost__c = true;
        insert salprice;
      
        PAUtil.insertProfileRecordId();
        
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
        pricingCondition1.Plus_Minus_Code__c = 'X';
        pricingCondition1.Scale_Type__c = 'Test';
        pricingConditionsList.add(pricingCondition1);
        
        insert pricingConditionsList;
        
        paRList.pricingRequestId = pr.id;
        paRList.PricingRequestIdfortask = pr.id;
    paRList.requestBUSalesArea='DPP Polymers EMEA-A134-10-02-Massive';
        paRList.selectAllFlag = true;
        paRList.wrapperPricingReqItem=prItem;
        paRList.wrapperList = new List<PAWrapper>();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        String a = PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM;
        a = PARelatedList.SOBJECTTYPE_ADMINMASTER;
        a = PARelatedList.SOBJECTTYPE_BUPH;
        a = PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP;
        a = PARelatedList.SOBJECTTYPE_MATERIAL;
        a = PARelatedList.SOBJECTTYPE_ORGGROUPITEM;
        a = PARelatedList.SOBJECTTYPE_PAORGGROUP;
        a = PARelatedList.SOBJECTTYPE_PH;
        a = PARelatedList.SOBJECTTYPE_PRICINGREQUEST;
        a = PARelatedList.SOBJECTTYPE_PROJECTPRICE;
        boolean b = PARelatedList.BOOLEAN_TRUE;
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.sobjectRecord = prItem;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.selectAll();
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.stringMap.put('changeVolume', 'true');
            wrap.sobjectRecord = prItem;
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.deleteSelected();
        paRList.selectAll();
        paRList.selectUnedited();
        paRList.deleteSelected();
        paRList.loadPage();
        
        //paRList.requestBUSalesArea = 'Test-Test-Test-Test';
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        paRList.applyChanges();
    
        Project_Price__c project = new Project_Price__c();
        insert project;
        pr = new Pricing_Request__c(Sales_Org_Code__c = 'A134',BU__c = 'DCP AP');
        pr.Project_Id__c = [SELECT Project_Id__c FROM Project_Price__c WHERE id=:project.Id].Project_Id__c;
        insert pr;
        Pricing_Request__c prProj = new Pricing_Request__c(Project_Id__c = pr.Id,Sales_Org_Code__c = 'A134',BU__c = 'DCP AP');
        insert prProj;
        paRList.ProjectPriceId = pr.Id;
        paRList.getProjectVolume();
        
        paRList.ProjectPriceId = project.Id;
        //apac
        paRList.getProjectRequestId();
        
        paRList.getsoldToNameForCSRNotification();
        
        Task task = new Task();
        task.WhatId = pr.Id;
        insert task;
        Task task1 = new Task();
        task1.WhatId = project.Id;
        insert task1;
        paRList.getProjectTaskId();
        paRList.PricingRequestIdfortask = pr.Id;
        paRList.getTaskComments();
        paRList.getTaskId();
        paRList.cancelInLineVolChanges();
        paRList.applyChangesPaymentTerms(); 
        paRList.enableFixedDateMethod();
        paRList.selectAllVolume();    
        paRList.selectAllVolumeFlag=false;
        paRList.scUoM = 'Select';
         for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('changeVolume', 'true');
            wrap.sobjectRecord = prItem;
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.saveInLineVolChangesMassive();
        paRList.rateType = 'Select';
        paRList.scUoM = 'Test';
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.changeVolume = false;
            wrap.changeScale = true;
            wrap.sobjectRecord = prItem;
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.plusMinus1 = 'Negative';
        paRList.saveInLineVolChangesMassive();
        paRList.scaleCheck = 'Ascending';
       paRList.saveScale();
        paRList.scaleCheck = 'Descending';
        paRList.rateType = 'New Rate';
        paRList.saveScale();
        paRList.rateType = 'Absolute';
       paRList.saveScale();
        paRList.rateType = 'Percentage';
        orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        upsert orgItem;
        paRList.saveScale();
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.New_Unit__c = '%';
        prItem1.isNPCApplicable__c = true;
        prItem1.Pricing_Condition_Code__c = 'ZPSE';
        prItem1.SAP_Cluster__c = 'CB1';
        prItem1.SAP_Client_Id__c = 'V';
        prItem1.SAP_Application_Id__c = '510';
        prItem1.key_combination__c = 'Material';
        prItem1.Scaled_Price_Flag__c = true;
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
        insert prItem1;
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.changeVolume=true;
            wrap.changeScale =true;
            wrap.isSelected = true;
            wrap.sobjectRecord = prItem;
            PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.clear();
            paRList.wrapperList.add(wrap);
        }
        paRList.saveInLineVolChanges();
       
        //paRList.changeToNonScale();
        
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
     static testMethod void paRequestTestMethod5A() {
       
                
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        
       // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
       User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        system.runas(u1){
        Price_Visibility__c pr23 = new Price_Visibility__c (Name='A640-10-02#BI EMEA Surfaces', BU__c='BI EMEA Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent;Net Floor',Request_Type__c='Customer Specific',Sales_Org_Code__c='A640');
        insert pr23; 
        
        PAProfilePermissions__c pr4 = new PAProfilePermissions__c (Name='BU Admin', Name__c='Price Approval-BU Admin');
        insert pr4;
        
        PAProfilePermissions__c pr5 = new PAProfilePermissions__c (Name='IT Admin', Name__c='Price Approval-IT Admin');
        insert pr5;  
          
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Sales_Org_Code__c = 'A640';
        pr.Dist_Channel_Code__c='10';
        pr.Division_Code__c='02';
        pr.BU__c = 'BI EMEA Surfaces';
        pr.Pricing_Request_Type__c = 'Net Floor';
        insert pr;
        
        
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        paRList.templatePricingRequestId=pr.Id;
        
        PAUtil.insertProfileRecordId();
        
        
        //apac
        RecordType r1 = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D123',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=r1.id,
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

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
            paRlist.rateType = 'Expire';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Condition_Class__c = 'Discount or Surcharge';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.New_Unit__c = '%';
        prItem1.Quantity__c = '10';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.Material_Code__c = 'D123';
        prItem1.isNPCApplicable__c=true;
         
        insert prItem1;
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request_Type__c = 'Permanent';
        prItem2.Condition_Class__c = 'Discount or Surcharge';
        prItem2.Pricing_Request__c = pr.Id;
        prItem2.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem2.New_Valid_From__c = system.now().date()+3;
        prItem2.New_Valid_To__c =  system.now().date()+5;
        prItem2.New_Rate__c = '10';
        prItem2.Rate__c = '10';
        prItem2.New_Unit__c = '%';
        prItem2.Quantity__c = '10';
        prItem2.ScaleRate1__c = '10'; 
        prItem2.ScaleRate2__c = '10';
        prItem2.ScaleRate3__c = '10';
        prItem2.ScaleRate4__c = '10';
        prItem2.ScaleRate5__c = '10';
        prItem2.ScaleRate6__c = '10';
        prItem2.ScaleRate7__c = '10';
        prItem2.ScaleRate8__c = '10';
        prItem2.ScaleRate9__c = '10';
        prItem2.ScaleRate10__c = '10';
        prItem2.Material_Code__c = 'D123';
        prItem2.isNPCApplicable__c=true;
         
        prItem2.UoM__c=null;
        prItem2.Per__c=null;
        prItem2.Unit__c=null;
        insert prItem2;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        orgItem.Default_Per_UoM_Setup__c='Sales Area Config';
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('showExpLink', 'true');
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  true;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
        //system.RunAs(u1){
        //}
            paRlist.rateType = 'New Rate';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Absolute';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            paRlist.rateType = 'Percentage';
            paRList.rateChange = '01,25';
            paRList.applyChanges();
            
            //paRlist.errorMsg2=null;
            
            
            orgItem.Default_Per_UoM_Setup__c = 'Product Hierarchy Config';
        orgItem.Default_SalesArea_UoM__c=null;
        orgItem.Default_Per_Value__c=null;
        update orgItem;
       // paRList.saveScale();
        paRList.applyChanges();
            
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
            paRList.templatePricingRequestId=pr.Id;
            
        paRList.displayText='test';
        paRList.selAllFalse=True;
        paRList.requestType='Customer Specific';
        paRList.applyVolChange=True;
        paRList.rateTypeChange=True;
            paRList.hasScaledRecordFlag=True;
              paRList.hasApproverPermissionFlag=True;
                paRList.scaleView=True;
            paRList.newUnit='test';
            paRList.newUoM='test';
            paRList.scaleBase1='test';
            map<ID,List<String>> idQuant=paRList.idQuant;
            map<ID,List<String>> idRate=paRList.idRate;
            paRList.nQTY='test';
            try{
            boolean a=paRList.displayTmLn;
            }
            catch(exception e){
                
            }
            
        paRList.priceType='True';
            paRList.isScalePrice=True;
               paRList.projectPC=True;
            paRList.isVolumeApplicable =True;
            List<Schema.FieldSetMember> keyCombinationColumns = paRList.keyCombinationColumns;
             List<Schema.FieldSetMember> soldToColumns = paRList.soldToColumns;
             List<Schema.FieldSetMember> newValueColumns = paRList.newValueColumns;
            List<Schema.FieldSetMember> RPQColumns = paRList.RPQColumns;
             List<Schema.FieldSetMember> RPQApproverColumns = paRList.RPQApproverColumns;
            List<Schema.FieldSetMember> volumeColumns = paRList.volumeColumns;
           
        List<String> val1=new List<String>();
        val1.add('test');
        paRList.val=val1;
            
            paRList.deleteSelectedId=prItem1.id;
            paRList.deleteSelected();
            
        }
        
    }
		

     static testMethod void paRequestTestMethod999() {
        Price_Visibility__c pr4 = new Price_Visibility__c (Name='A618-10-02', BU__c='BI AP Surfaces',Dist_Channel_Code__c='10',Division_Code__c='02',Price_Type__c='Net Floor',Pricing_Request_Type__c='Project Pricing;Permanent',Request_Type__c='Customer Specific',Sales_Org_Code__c='A618');
        insert pr4;  
        
        PARelatedList paRList = new PARelatedList();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Sales_Org_Code__c = 'A618';
        pr.BU__c = 'BI AP Surfaces';        
        insert pr;
        
        PAUtil.insertProfileRecordId();

        paRList.selectAllFlag = false;
        paRList.wrapperList = new List<PAWrapper>();
        paRList.wrapperPricingReqItem = new Pricing_Request_Item__c();
        PARelatedList.SOBJECTTYPE_PRICINGREQUESTITEM = 'Pricing_Request_Item__c';
        PARelatedList.BOOLEAN_TRUE = true;
        PARelatedList.SOBJECTTYPE_ADMINMASTER = 'Test';
        PARelatedList.SOBJECTTYPE_BUPH = 'Test';
        PARelatedList.SOBJECTTYPE_ERPSALESPRICESSAP = 'Test';
        PARelatedList.SOBJECTTYPE_MATERIAL = 'Test';
        PARelatedList.SOBJECTTYPE_ORGGROUPITEM = 'Test';
        PARelatedList.SOBJECTTYPE_PAORGGROUP = 'Test';
        PARelatedList.SOBJECTTYPE_PH = 'Test';
        PARelatedList.SOBJECTTYPE_PRICINGREQUEST = 'Test';
        PARelatedList.SOBJECTTYPE_PROJECTPRICE = 'Test';
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        insert erp;
        paRlist.rateType = 'New Rate';
        CurrencyType Rate = new CurrencyType();
        Rate = [SELECT ID, ConversionRate from CurrencyType WHERE ISOCode='CNY' LIMIT 1];
        Decimal ExchangeRate = Rate.ConversionRate;
        Decimal VatValue = 1.13;
        Decimal rateChangeNum = 1.11;

        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        Decimal z = 20 * VatValue * ExchangeRate;
        prItem1.Pricing_Request_Type__c = 'Permanent';
        prItem1.Pricing_Request__c = pr.Id;
        prItem1.Gap_Pricing_Request_Item__c = prItem1.Id;
        prItem1.New_Valid_From__c = system.now().date();
        prItem1.New_Valid_To__c =  system.now().date()+1;
        prItem1.Scaled_Price_Flag__c = false;
        
        prItem1.New_Unit__c = 'CNY';
        prItem1.New_Rate__c = '10';
        prItem1.Rate__c = '10';
        prItem1.Rate_One__c = String.valueOf(z);
        prItem1.Stamp_Floor_Price__c = '20';
        prItem1.Stamp_Reference_Price__c = '30';
        Decimal x = Decimal.valueOf(prItem1.Stamp_Floor_Price__c) * ExchangeRate;
        Decimal y = Decimal.valueOf(prItem1.Stamp_Reference_Price__c) * ExchangeRate;
        prItem1.Floor_Price_in_USD__c= String.valueOf(x);
        prItem1.Ref_Price_in_USD__c= String.valueOf(y);
        prItem1.Quantity__c = '10';
        prItem1.ScaleRate1__c = '10'; 
        prItem1.ScaleRate2__c = '10';
        prItem1.ScaleRate3__c = '10';
        prItem1.ScaleRate4__c = '10';
        prItem1.ScaleRate5__c = '10';
        prItem1.ScaleRate6__c = '10';
        prItem1.ScaleRate7__c = '10';
        prItem1.ScaleRate8__c = '10';
        prItem1.ScaleRate9__c = '10';
        prItem1.ScaleRate10__c = '10';
        prItem1.ERP_Sales_Prices_SAP__c = erp.Id;
        prItem1.isNPCApplicable__c=true;
        prItem1.Distributor_Code__c='Y7';
        prItem1.Distributor_Name__c='XYZ';
        
        prItem1.UoM__c=null;
        prItem1.Per__c=null;
        prItem1.Unit__c=null;
         
        insert prItem1;
        paRList.wrapperPricingReqItem = prItem1;
        paRList.requestBUSalesArea = 'Test-Test-Test-Test-Permanent';
        
        OrgGroup__c org = new OrgGroup__c();
        
        RecordType recordType = [SELECT id, Name From RecordType WHERE Name = 'Business' LIMIT 1];
        org.RecordTypeId = recordType.Id;
        org.Business__c = 'Test';
        org.ERP_Sales_Org_Code__c = 'Test';
        org.ERP_Distribution_Channel_Code__c = 'Test';
        org.ERP_Division_Code__c = 'Test';
        insert org;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        orgItem.OrgGroup__c = org.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        orgItem.Business__c = org.Id;
        orgItem.Enable_Material_Group_5__c = true;
        insert orgItem;
        
        for(Integer i=0; i<1; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('disableCheckBox', 'true');
            wrap.stringMap.put('disableCheckBox', 'false');
            wrap.sobjectRecord = prItem1;
            wrap.isSelected =  false;
            PARelatedList.SOBJECTTYPE_PRICINGREQUEST = wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
            paRList.wrapperList.add(wrap);
        }
            paRlist.rateType = 'New Rate';
         	paRlist.NewRateColumnDisplay = true;
         	paRList.rateChange = '1.25';
         	rateChangeNum = Decimal.valueOf(paRList.rateChange);
         	paRlist.isNetFloorVisible = true;
            paRList.rateChange = '01.25';
         	Decimal c = 20 * VatValue * ExchangeRate;
         	prItem1.Rate_One__c = String.valueOf(c);
            paRList.applyChanges();
        }
       
       
}