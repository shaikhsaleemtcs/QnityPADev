/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 12th Feb 2020
Description: This is the test class for all batch class which are being used for PostRefreshSandbox requirement.
**********************************************************************************************/
@isTest
public class SandBoxRefreshUpdateBatch_UT {
    @testSetup 
    static void setup() {
        List<ERP_Customer__c> erpcList = new List<ERP_Customer__c>();
        List<Material__c> matList = new List<Material__c>();
        List<ERP_Material_Conversion_Factor__c> matcList = new List<ERP_Material_Conversion_Factor__c>();
        List<ERP_Relationship__c> erprList = new List<ERP_Relationship__c>();
        List<ERP_Pricing_Procedure__c> ppList = new List<ERP_Pricing_Procedure__c>();
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();
		List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
        List<ERP_Customer_Localization__c> clList = new List<ERP_Customer_Localization__c>();
		List<Material_Localization__c> mlList = new List<Material_Localization__c>();
        List<ERP_Export_to_SAP__c> etList = new List<ERP_Export_to_SAP__c>();
        List<Sales_Prices__c> spList = new List<Sales_Prices__c>();
        List<ERP_Sales_Prices_SAP__c> psList = new List<ERP_Sales_Prices_SAP__c>();

        for (Integer i=0;i<3;i++) {
                erpcList.add(new ERP_Customer__c(name='TestERP '+i, 
                    Source_Cluster__c='P23', External_ERP_ID__c='P23-ExtERP'+i));
                
                matList.add(new Material__c(name='TestMat'+i, 
                    ERP_Source_Cluster__c='P23', External_ERP_ID__c='P23-ExtERP'+i));
                
                ppList.add(new ERP_Pricing_Procedure__c(Pricing_Procedure__c ='TestPP'+i, 
                    SAP_Cluster__c='P23'));
                
                pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition__c ='TestPC'+i, 
                    SAP_Cluster__c='P23'));
                
                kcList.add(new ERP_Key_Combination__c(Key_Combination__c ='TestKC'+i, 
                    SAP_Cluster__c='P23'));
                
                prList.add(new Pricing_Request__c(Project_Name__c ='TestKC'+i, 
                    SAP_Cluster__c='P23', BU__c = 'TestBU'+i));
                
                etList.add(new ERP_Export_to_SAP__c(Material__c ='TestMaterial'+i, 
                    SAP_Cluster__c='P23'));
                
                spList.add(new Sales_Prices__c(Material__c ='TestMaterial'+i, 
                    SAP_Cluster__c='P23', BU__c = 'TestBU'+i));
            
            	psList.add(new ERP_Sales_Prices_SAP__c(Material__c ='TestMaterial'+i, 
                    SAP_Cluster__c='P23', BU__c = 'TestBU'+i));
            }

        	insert erpcList;
        	insert matList;
        	insert ppList;
        	insert pcList;
        	insert kcList;
        	insert prList;
        	insert etList;
        	insert spList;
        	insert psList;
        
            for (Integer j=0;j<2;j++) {
                matcList.add(new ERP_Material_Conversion_Factor__c(External_ERP_ID__c='P23-ExtERP'+j,
                    Material__c = matList[0].id, Base_UOM_Text__c = 'TestBaseUOM' +j));
                
                erprList.add(new ERP_Relationship__c(External_ERP_ID__c='P23-ExtERP'+j,
                    ERP_Customer__c = erpcList[0].id, Name__c = 'TestERPRelationship' +j));
                
                priList.add(new Pricing_Request_Item__c(Pricing_Condition__c='TestPriceCon'+j,
                    Pricing_Request__c = prList[0].id, SAP_Cluster__c='P23'));
                
                clList.add(new ERP_Customer_Localization__c(External_ERP_ID__c='P23-ExtERP'+j,
                    ERP_Customer__c = erpcList[0].id, Customer_Name__c='TestCustomer'+j));
                
                mlList.add(new Material_Localization__c(External_ERP_ID__c='P23-ExtERP'+j,
                    Material__c = matList[0].id, Material_Name__c='TestMaterial'+j));
            }
        
        	insert matcList;
        	insert erprList;
        	insert priList;
        	insert clList;
        	insert mlList;        
    }    
    
    @isTest
    static void testBatchUpdate_ERPCustomer() {
        Test.startTest();
            BatchUpdate_ERPCustomer erpc = new BatchUpdate_ERPCustomer();
            Id batchId = Database.executeBatch(erpc);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from ERP_Customer__c where name like '%TestERP%']);
    }
    
    @isTest
    static void testBatchUpdate_Materials() {
        Test.startTest();
            BatchUpdate_Materials mat = new BatchUpdate_Materials();
            Id batchId = Database.executeBatch(mat);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from Material__c where name like '%TestMat%']);
    }
    
    @isTest
    static void testBatchUpdate_MaterialConversion() {
        Test.startTest();
            BatchUpdate_MaterialConversion matc = new BatchUpdate_MaterialConversion();
            Id batchId = Database.executeBatch(matc);
        Test.stopTest();
        
        System.assertEquals(2, [select count() from ERP_Material_Conversion_Factor__c where Base_UOM_Text__c like '%TestBaseUOM%']);
    }
    
    @isTest
    static void testBatchUpdate_ERPRelationship() {
        Test.startTest();
            BatchUpdate_ERPRelationship erpr = new BatchUpdate_ERPRelationship();
            Id batchId = Database.executeBatch(erpr);
        Test.stopTest();
        
        System.assertEquals(2, [select count() from ERP_Relationship__c where Name__c like '%TestERPRelationship%']);
    }
    
    @isTest
    static void testBatchUpdate_PricingProcedure() {
        Test.startTest();
            BatchUpdate_PricingProcedure pp = new BatchUpdate_PricingProcedure();
            Id batchId = Database.executeBatch(pp);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from ERP_Pricing_Procedure__c where Pricing_Procedure__c like '%TestPP%']);
    }
    
    @isTest
    static void testBatchUpdate_PricingCondition() {
        Test.startTest();
            BatchUpdate_PricingCondition pc = new BatchUpdate_PricingCondition();
            Id batchId = Database.executeBatch(pc);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from ERP_Pricing_Condition__c where Pricing_Condition__c like '%TestPC%']);
    }
    
    @isTest
    static void testBatchUpdate_KeyCombinition() {
        Test.startTest();
            BatchUpdate_KeyCombinition kc = new BatchUpdate_KeyCombinition();
            Id batchId = Database.executeBatch(kc);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from ERP_Key_Combination__c where Key_Combination__c like '%TestKC%']);
    }
    
    @isTest
    static void testBatchUpdate_PricingRequest() {
        Test.startTest();
            BatchUpdate_PricingRequest pr = new BatchUpdate_PricingRequest();
            Id batchId = Database.executeBatch(pr);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from Pricing_Request__c where Project_Name__c like '%TestKC%']);
    }
    
    @isTest
    static void testBatchUpdate_PricingRequestItem() {
        Test.startTest();
            BatchUpdate_PricingRequestItem pri = new BatchUpdate_PricingRequestItem();
            Id batchId = Database.executeBatch(pri);
        Test.stopTest();
        
        System.assertEquals(2, [select count() from Pricing_Request_Item__c where Pricing_Condition__c like '%TestPriceCon%']);
    }
    
    @isTest
    static void testBatchUpdate_CustomerLocalization() {
        Test.startTest();
            BatchUpdate_CustomerLocalization cl = new BatchUpdate_CustomerLocalization();
            Id batchId = Database.executeBatch(cl);
        Test.stopTest();
        
        System.assertEquals(2, [select count() from ERP_Customer_Localization__c where Customer_Name__c like '%TestCustomer%']);
    }
    
    @isTest
    static void testBatchUpdate_MaterialLocalization() {
        Test.startTest();
            BatchUpdate_MaterialLocalization ml = new BatchUpdate_MaterialLocalization();
            Id batchId = Database.executeBatch(ml);
        Test.stopTest();
        
        System.assertEquals(2, [select count() from Material_Localization__c where Material_Name__c like '%TestMaterial%']);
    }
    
    @isTest
    static void testBatchUpdate_ExportSap_Timeline() {
        Test.startTest();
            BatchUpdate_ExportSap_Timeline et = new BatchUpdate_ExportSap_Timeline();
            Id batchId = Database.executeBatch(et);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from ERP_Export_to_SAP__c where Material__c like '%TestMaterial%']);
    }
    
    @isTest
    static void testBatchUpdate_SalesPriceNonSAP() {
        Test.startTest();
            BatchUpdate_SalesPriceNonSAP sp = new BatchUpdate_SalesPriceNonSAP();
            Id batchId = Database.executeBatch(sp);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from Sales_Prices__c where Material__c like '%TestMaterial%']);
    }
    
    @isTest
    static void testBatchUpdate_PricesSAP() {
        Test.startTest();
            BatchUpdate_PricesSAP ps = new BatchUpdate_PricesSAP();
            Id batchId = Database.executeBatch(ps);
        Test.stopTest();
        
        System.assertEquals(3, [select count() from ERP_Sales_Prices_SAP__c where Material__c like '%TestMaterial%']);
    }
}