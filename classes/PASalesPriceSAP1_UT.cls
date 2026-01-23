/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 

Updates:
<AB20210301> Updated to avoid SOQL Governer limit error due independent DML Statements

********************************************************************************/

@isTest
private class PASalesPriceSAP1_UT{
    
    
    static testMethod void PASalesPriceSAPTestMethod() {  
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            //Date vDue = system.today().addDays(-2);
            
            // Used Util class for inserting custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList ;
            
            PAUtil.insertProfileRecordId();
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
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
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            Insert orgGroup1;
            Insert orgGroup2;
            Insert orgGroup3;
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            Insert priCondObj1;
            Insert priCondObj2;
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material');
            
            insert acSq2;
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            
            insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            insert pricingRequest2;
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
            insert pricingRequest3;
            
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
            buOrgGroup.Business__c=orgGroup1.id;
            buOrgGroup.OrgGroup__c=orgGroup2.id;
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup;
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());                                                                       
            ERP_Sales_Prices_SAP__c childRecord2=childRecord.clone(false,true);
            //neeha
            
            m.add(childRecord);
            m.add(childRecord2);
            insert m;
            ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c=priCondObj1.id,
                                                                               Key_Combination_code__c=keyCombObj1.id,Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1;                                       
            
            PAServiceState paSS = new PAServiceState();
            
            paSS.ogitems=new PAOrganizationalGroupItems(); 
            paSS.ogitems.selectedBU=orgGroup1.Id;
            
            
            
            Material__c mat = new Material__c(ERP_Material_Code__c='a123',ERP_IsConfigurable__c=true,External_ERP_ID__c='CB1',ERP_Deletion_Flag__c=false,RecordTypeId='012a0000001ZMHy');
            
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            PARequest request= new PARequest(paSS);
            
            request.pricingCondition=new PAPricingCondition(paSS);
            request.keyCombination=new PAKeyCombination(paSS);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Massive';
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.viewCustomerPrices='ViewCustomerPrices';
            request.currentPricesSelection = 'Last Valid Prices';
            request.validOnDateViewCustomerprices = System.today();
            
            paSS.currentRequest=request;
            request.customer.paERPCustomer = paERPCustomer;
            
            PASalesPriceSAP sap1=new PASalesPriceSAP(paSS);
            
            sap1.pcKCSelected='--Select--';
            
            
            sap1.retrievePriceRecords(buOrgGroup1);  
            
            
            
            PARequest request1= new PARequest(paSS);
            request1.currentPricesSelection = 'Expired Prices';
            
            sap1.retrievePriceRecords(buOrgGroup1);
            
            PARequest request2= new PARequest(paSS);
            request2.currentPricesSelection = '30';
            
            sap1.retrievePriceRecords(buOrgGroup1);
            
            
            
        }
    }
    
    
    //subbu
    static testMethod void PASalesPriceSAPTestMethod_noOfDays60() {  
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            //Date vDue = system.today().addDays(-2);
            
            // Used Util class for inserting custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList ;
            
            PAUtil.insertProfileRecordId();
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
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
            
            List<ERP_Access_Sequence__c> acSqList = new List<ERP_Access_Sequence__c>();  //<AB20210301>
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            acSqList.add(acSq) ;//<AB20210301>
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            acSqList.add(acSq1) ;//<AB20210301>
            insert acSqList;//<AB20210301>
            
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            orgGroupList.add(orgGroup1) ;//<AB20210301>
            orgGroupList.add(orgGroup2) ;//<AB20210301>
            orgGroupList.add(orgGroup3) ; //<AB20210301>
            insert orgGroupList;//<AB20210301>
            
            List<ERP_Key_Combination__c> keyCombObjList = new List<ERP_Key_Combination__c>(); //<AB20210301>
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            keyCombObjList.add(keyCombObj1) ;//<AB20210301>
            keyCombObjList.add(keyCombObj2) ;//<AB20210301>
            
            insert keyCombObjList;//<AB20210301>
            
            List<ERP_Pricing_Condition__c> priCondObjList = new List<ERP_Pricing_Condition__c>(); //<AB20210301>

            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            priCondObjList.add(priCondObj1) ;//<AB20210301>
            priCondObjList.add(priCondObj2) ;//<AB20210301>
            insert priCondObjList;//<AB20210301>
            
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material');
            
            insert acSq2;
            
            List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); //<AB20210301>

            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            pricingRequestList.add(pricingRequest1) ;//<AB20210301>
            
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            pricingRequestList.add(pricingRequest2) ;//<AB20210301>
            
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
            pricingRequestList.add(pricingRequest3) ;//<AB20210301>
            
            insert pricingRequestList;//<AB20210301>
            
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
            buOrgGroup.Business__c=orgGroup1.id;
            buOrgGroup.OrgGroup__c=orgGroup2.id;
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup;
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());                                                                       
            ERP_Sales_Prices_SAP__c childRecord2=childRecord.clone(false,true);
            //neeha
            
            m.add(childRecord);
            m.add(childRecord2);
            insert m;
            ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c=priCondObj1.id,
                                                                               Key_Combination_code__c=keyCombObj1.id,Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;              
            buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1; 
            
            Organizational_Group_Item__c buOrgGroup2=new  Organizational_Group_Item__c();
            buOrgGroup2.Business__c=orgGroup1.id;
            buOrgGroup2.OrgGroup__c=orgGroup3.id;
            buOrgGroup2.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup2.Retroactive_Limit__c=30;              
            //buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup2;                                      
            
            PAServiceState paSS = new PAServiceState();
            
            paSS.ogitems=new PAOrganizationalGroupItems(); 
            paSS.ogitems.selectedBU=orgGroup1.Id;
            
            
            
            Material__c mat = new Material__c(ERP_Material_Code__c='a123',ERP_IsConfigurable__c=true,External_ERP_ID__c='CB1',ERP_Deletion_Flag__c=false,RecordTypeId='012a0000001ZMHy');
            
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            PARequest request= new PARequest(paSS);
            
            request.pricingCondition=new PAPricingCondition(paSS);
            request.keyCombination=new PAKeyCombination(paSS);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            //request.pricingRequest.Request_Type__c = 'Massive';
            //request.requestServiceState.ogItems.isEndUserRebate=true;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.viewCustomerPrices='ViewCustomerPrices';
            request.currentPricesSelection = 'Current Prices';
            //request.currentPricesSelection = 'Last Valid Prices';
            
            request.validOnDateViewCustomerprices = System.today();
            
            paSS.currentRequest=request;
            request.customer.paERPCustomer = paERPCustomer;
            test.startTest();  
            PASalesPriceSAP sap1=new PASalesPriceSAP(paSS);
            
            sap1.pcKCSelected='--Select--';
            sap1.searchedMaterial='M1';
            
            sap1.searchedItem='M1';
            
            sap1.retrievePriceRecords(buOrgGroup1);  
            
            //request.currentPricesSelection = 'Current Prices';
            sap1.retrievePriceRecords(buOrgGroup2);
            
            request.currentPricesSelection = 'Last Valid Prices';
            sap1.retrievePriceRecords(buOrgGroup1);  
            sap1.retrievePriceRecords(buOrgGroup2);
            
            
            //PARequest request1= new PARequest(paSS);
            request.currentPricesSelection = 'Expired Prices';
            
            sap1.retrievePriceRecords(buOrgGroup1);
            //test.stopTest();    
            sap1.retrievePriceRecords(buOrgGroup2);
            // sap1.retrievePriceRecords(buOrgGroup1);
            
            test.stopTest(); 
            //test.startTest(); 
            sap1.retrievePriceRecords(buOrgGroup2);
            //test.stopTest(); 
            request.currentPricesSelection = 'Expiring';
            sap1.retrievePriceRecords(buOrgGroup1);
            sap1.retrievePriceRecords(buOrgGroup2);
            
            PARequest request2= new PARequest(paSS);
            request2.currentPricesSelection = '60';
            
        }
    }
    
    
    
    //Monika - Test Method2
    static testMethod void PASalesPriceSAPTestMethod2() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // Used Util class for inserting custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList ;
            
            PAUtil.insertProfileRecordId();
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            //Date vDue = system.today().addDays(-2);
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
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

            List<ERP_Access_Sequence__c> acSqList = new List<ERP_Access_Sequence__c>(); //<AB20210301  
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            acSqList.add(acSq) ;//<AB20210301
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            acSqList.add(acSq1) ;//<AB20210301
            
            insert acSqList;//<AB20210301
            
            
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301  

            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            orgGroupList.add(orgGroup1) ;//<AB20210301  
            orgGroupList.add(orgGroup2) ;//<AB20210301  
            orgGroupList.add(orgGroup3) ;//<AB20210301  
            insert orgGroupList;//<AB20210301  
            
            List<ERP_Key_Combination__c> keyCombObjList = new List<ERP_Key_Combination__c>(); //<AB20210301  
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            keyCombObjList.add(keyCombObj1) ;//<AB20210301 
            keyCombObjList.add(keyCombObj2) ;//<AB20210301 
            insert keyCombObjList;//<AB20210301 

            List<ERP_Pricing_Condition__c> priCondObjList = new List<ERP_Pricing_Condition__c>(); //<AB20210301  
            
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            priCondObjList.add(priCondObj1) ; //<AB20210301  
            priCondObjList.add(priCondObj2) ; //<AB20210301  
            insert priCondObjList; //<AB20210301  
            
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material');
            
            insert acSq2;
            
            List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>(); //<AB20210301  
            
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            
            pricingRequestList.add(pricingRequest1) ;//<AB20210301  
            
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            pricingRequestList.add(pricingRequest2) ;//<AB20210301  
            
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
            pricingRequestList.add(pricingRequest3) ;//<AB20210301  
            
            insert pricingRequestList;//<AB20210301  
            
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
            buOrgGroup.Business__c=orgGroup1.id;
            buOrgGroup.OrgGroup__c=orgGroup2.id;
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Enable_Variable_Config_Materials__c=false;
            insert buOrgGroup;
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());                                                                       
            ERP_Sales_Prices_SAP__c childRecord2=childRecord.clone(false,true);
            //neeha
            
            m.add(childRecord);
            m.add(childRecord2);
            insert m;
            ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c=priCondObj1.id,
                                                                               Key_Combination_code__c=keyCombObj1.id,Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            buOrgGroup1.Enable_Variable_Config_Materials__c=false;
            insert buOrgGroup1;                                                                  
            
            
            PAServiceState paSS = new PAServiceState();
            
            paSS.ogitems=new PAOrganizationalGroupItems(); 
            paSS.ogitems.selectedBU=orgGroup1.Id;
            
            
            
            Material__c mat = new Material__c(ERP_Material_Code__c='a123',ERP_IsConfigurable__c=true,External_ERP_ID__c='CB1',ERP_Deletion_Flag__c=false,RecordTypeId='012a0000001ZMHy');
            
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            PARequest request= new PARequest(paSS);
            
            request.pricingCondition=new PAPricingCondition(paSS);
            request.keyCombination=new PAKeyCombination(paSS);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Massive';
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.viewCustomerPrices='ViewCustomerPrices';
            request.currentPricesSelection = 'Valid On';
            request.validOnDateViewCustomerprices = System.today();
            
            paSS.currentRequest=request;
            request.customer.paERPCustomer = paERPCustomer;
            
            PASalesPriceSAP sap1=new PASalesPriceSAP(paSS);
            
            sap1.pcKCSelected='--Select--';
            
            
            sap1.retrievePriceRecords(buOrgGroup1); 
            PASalesPriceSAP sap=new PASalesPriceSAP(paSS);
            
            PARequest request3= new PARequest(paSS);
            request3.currentPricesSelection = '60';
            
            sap1.retrievePriceRecords(buOrgGroup1);
            
            PARequest request4= new PARequest(paSS);
            request4.currentPricesSelection = '90';
            
            sap1.retrievePriceRecords(buOrgGroup1);
            
            PARequest request5= new PARequest(paSS);
            request5.currentPricesSelection = 'Expiring By';
            test.startTest();         
            sap1.retrievePriceRecords(buOrgGroup1); 
            
        }
    }
    static testMethod void PASalesPriceSAPTestMethod3() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            
            PAUtil.insertProfileRecordId();
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
            //Test.startTest();
            
            
            // Used Util class for inserting custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList ;
            
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            //Date vDue = system.today().addDays(-2);
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
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
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            Insert orgGroup1;
            Insert orgGroup2;
            Insert orgGroup3;
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            Insert priCondObj1;
            Insert priCondObj2;
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material');
            
            insert acSq2;
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            
            insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            insert pricingRequest2;
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
            insert pricingRequest3;
            
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
            buOrgGroup.Business__c=orgGroup1.id;
            buOrgGroup.OrgGroup__c=orgGroup2.id;
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Enable_Variable_Config_Materials__c=false;
            insert buOrgGroup;
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());                                                                       
            ERP_Sales_Prices_SAP__c childRecord2=childRecord.clone(false,true);
            //neeha
            
            m.add(childRecord);
            m.add(childRecord2);
            insert m;
            ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c=priCondObj1.id,
                                                                               Key_Combination_code__c=keyCombObj1.id,Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            buOrgGroup1.Enable_Variable_Config_Materials__c=false;
            insert buOrgGroup1;                                                                  
            
            
            PAServiceState paSS = new PAServiceState();
            
            paSS.ogitems=new PAOrganizationalGroupItems(); 
            paSS.ogitems.selectedBU=orgGroup1.Id;
            
            
            
            Material__c mat = new Material__c(ERP_Material_Code__c='a123',ERP_IsConfigurable__c=true,External_ERP_ID__c='CB1',ERP_Deletion_Flag__c=false,RecordTypeId='012a0000001ZMHy');
            
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            PARequest request= new PARequest(paSS);
            
            request.pricingCondition=new PAPricingCondition(paSS);
            request.keyCombination=new PAKeyCombination(paSS);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Request_Type__c = 'Non Customer Specific';
            request.requestServiceState.ogItems.isEndUserRebate=true;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.viewCustomerPrices='ViewCustomerPrices';
            request.currentPricesSelection = 'Valid On';
            request.validOnDateViewCustomerprices = System.today();
            
            paSS.currentRequest=request;
            request.customer.paERPCustomer = paERPCustomer;
            PARequest request5= new PARequest(paSS);
            request5.currentPricesSelection = 'Expiring By';
            //    request5.currentPricesSelection = '90';
            PASalesPriceSAP sap=new PASalesPriceSAP(paSS);
            sap.retrievePriceRecords(buOrgGroup1);
        }
    }
    
     
    static testMethod void PASalesPriceSAPTestMethod4() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            
            PAUtil.insertProfileRecordId();
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
            //Test.startTest();
            
            
            // Used Util class for inserting custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList ;
            
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            //Date vDue = system.today().addDays(-2);
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
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
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            Insert orgGroup1;
            Insert orgGroup2;
            Insert orgGroup3;
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            Insert priCondObj1;
            Insert priCondObj2;
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material');
            
            insert acSq2;
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            
            insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            insert pricingRequest2;
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
            insert pricingRequest3;
            
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
            buOrgGroup.Business__c=orgGroup1.id;
            buOrgGroup.OrgGroup__c=orgGroup2.id;
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Enable_Variable_Config_Materials__c=false;
            insert buOrgGroup;
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());                                                                       
            ERP_Sales_Prices_SAP__c childRecord2=childRecord.clone(false,true);
            //neeha
            
            m.add(childRecord);
            m.add(childRecord2);
            insert m;
            ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c=priCondObj1.id,
                                                                               Key_Combination_code__c=keyCombObj1.id,Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            buOrgGroup1.Enable_Variable_Config_Materials__c=false;
            insert buOrgGroup1;                                                                  
            
            
            PAServiceState paSS = new PAServiceState();
            
            paSS.ogitems=new PAOrganizationalGroupItems(); 
            paSS.ogitems.selectedBU=orgGroup1.Id;
            
            
            
            Material__c mat = new Material__c(ERP_Material_Code__c='a123',ERP_IsConfigurable__c=true,External_ERP_ID__c='CB1',ERP_Deletion_Flag__c=false,RecordTypeId='012a0000001ZMHy');
            
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            PARequest request= new PARequest(paSS);
            
            request.pricingCondition=new PAPricingCondition(paSS);
            request.keyCombination=new PAKeyCombination(paSS);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Request_Type__c = 'Non Customer Specific';
            request.requestServiceState.ogItems.isEndUserRebate=true;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.viewCustomerPrices='ViewCustomerPrices';
            request.currentPricesSelection = 'Valid On';
            request.validOnDateViewCustomerprices = System.today();
            
            paSS.currentRequest=request;
            request.customer.paERPCustomer = paERPCustomer;
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(pass);  
            SalesPriceSAP.request=request;
            
            try
            {
                request.currentPricesSelection = 'Expiring By';
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
        }
    }
}