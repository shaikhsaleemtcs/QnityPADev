//created by sanjib

@isTest
private class PASalesPriceSAP_UT{
    
    static testMethod void PASalesPriceSAPTestMethod() {
        
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();
            //insert org grp
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
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
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
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
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            insert buOrgGroup1;
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                                       
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest2.Division_Code__c;
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D146181,materialused';
            request.pricingRequest.Sales_Org_Code__c=pricingRequest3.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            paServiceState.currentRequest=request;
            
            
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombObj1.id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request2.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request2.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request3.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request3.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request3.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request3.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request4= new PARequest(paServiceState);
            request4.pricingCondition=new PAPricingCondition(paServiceState);
            request4.keyCombination=new PAKeyCombination(paServiceState);
            request4.keyCombination.keyCombinationId=keyCombObj1.id;
            request4.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request4.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request4.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request4.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request4.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request4.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombObj2.id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest3.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest3.Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c =pricingRequest3.Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c= 'Customer Specific';
            request1.pricingRequest.Due_date__c=pricingRequest3.Due_date__c;
            
            PARequest request6= new PARequest(paServiceState);
            request6.pricingCondition=new PAPricingCondition(paServiceState);
            request6.keyCombination=new PAKeyCombination(paServiceState);
            request6.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request6.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request6.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request6.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request6.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request6.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request6.customer.paERPCustomer.Division_Code__c='02';
            request6.customer.paERPCustomer.Customer_code__c='123456';
            request6.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request6.keyCombination.PCLselectedKeyCombination=new list<String>();
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj2.id);
            request6.pricingRequest.Due_date__c=system.today();
            
            PARequest request7= new PARequest(paServiceState);
            
            request7.pricingCondition=new PAPricingCondition(paServiceState);
            request7.keyCombination=new PAKeyCombination(paServiceState);
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            
            request7.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request7.keyCombination.PCLselectedKeyCombination=new list<String>();
            request7.pricingRequest.Due_date__c=system.today();
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request7.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request7.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request7.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request7.customer.paERPCustomer.Division_Code__c='02';
            request7.customer.paERPCustomer.Customer_code__c='123456';
            
            
            request.selectedBU=[select Business__c FROM OrgGroup__c WHERE id=:orgGroup1.id].id;
            
            test.startTest();
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP.request=request;
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            SalesPriceSAP.getMaterialGroup5KeyList();
            SalesPriceSAP.setMaterialGroup5KeyList(SalesPriceSAP.getMaterialGroup5KeyList());
            SalesPriceSAP.getSalesDistrictList();
            SalesPriceSAP.setSalesDistrictList(SalesPriceSAP.getSalesDistrictList());
            SalesPriceSAP.getMatlGrp1List();      
            SalesPriceSAP.setMatlGrp1List(SalesPriceSAP.getMatlGrp1List());
            SalesPriceSAP.getdistributorList();
            SalesPriceSAP.setdistributorList(SalesPriceSAP.getdistributorList());
            SalesPriceSAP.getContractList();
            SalesPriceSAP.getPlantList();
            SalesPriceSAP.getShippingConditionList();
            SalesPriceSAP.setShippingConditionList(SalesPriceSAP.getShippingConditionList());   //<SS20230501>
            SalesPriceSAP.getDestinationCountryList();
            SalesPriceSAP.getCampaignList();        
            SalesPriceSAP.setCampaignList(SalesPriceSAP.getCampaignList());
            SalesPriceSAP.getDocumentCurrencyList();
            SalesPriceSAP.setDocumentCurrencyList(SalesPriceSAP.getDocumentCurrencyList());
            SalesPriceSAP.getStateList();
            SalesPriceSAP.setStateList(SalesPriceSAP.getStateList());
            SalesPriceSAP.getsalesOrderItemList();                                      //<SS20230501> - START
            SalesPriceSAP.setsalesOrderItemList(SalesPriceSAP.getsalesOrderItemList());
            SalesPriceSAP.getvalueCenterList();                                                  
            SalesPriceSAP.setvalueCenterList(SalesPriceSAP.getvalueCenterList());
            SalesPriceSAP.getextMaterialGroupList();
            SalesPriceSAP.setextMaterialGroupList(SalesPriceSAP.getextMaterialGroupList());
            SalesPriceSAP.getmaterialGroup2List();
            SalesPriceSAP.setmaterialGroup2List(SalesPriceSAP.getmaterialGroup2List());
            SalesPriceSAP.getpriceZoneList();
            SalesPriceSAP.setpriceZoneList(SalesPriceSAP.getpriceZoneList());   //<SS20230501> - END
            
            
            
            //test.startTest();
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            try{
                SalesPriceSAP.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            
            //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            
            
            SalesPriceSAP.save();
            SalesPriceSAP.getMpgList();
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request6;
            try{
                SalesPriceSAP1.getListWrappers();
                
            }
            
            catch(Exception e){
                
            }
            
            
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request7;
            try{
                SalesPriceSAP2.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            PARelatedList rel = new PARelatedList();
            rel.wrapperList = new List<PAWrapper>();
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord = new ERP_Sales_Prices_SAP__c(Pricing_Condition_Code__c='ZPSE');
            wrap.isSelected = true;
            rel.wrapperList.add(wrap);
            SalesPriceSAP.relatedWrappersList.add(rel);
            try{
                SalesPriceSAP.action('','','AddRequestItems');
            }
            
            catch(Exception e){
                
            }
            
            test.stopTest();
        }
    }
    
    static testMethod void relatedlist(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        //Profile p1 =[SELECT Id FROM Profile where name='System Administrator'];
        
        
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        
        
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        
        
        
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            
            PAUtil.insertProfileRecordId();
            
            
            //insert org grp
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
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
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
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
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            insert buOrgGroup1;
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                                       
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1;
            Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
            priReqItem1.Pricing_Request__c = pricingRequest1.Id;
            priReqItem1.ERP_Sales_Prices_SAP__c = childRecord1.Id;
            priReqItem1.Scaled_Price_Flag__c = true;
            priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem1.Key_Combination_Code__c = 'A580';
            priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
            priReqItem1.Customer_Specific__c=true;      
            Date d = Date.valueOf(System.now());
            priReqItem1.New_Valid_To__c = d;
            priReqItem1.SAP_Cluster__c='CB1';
            insert priReqItem1;
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest3.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D146181,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.requestServiceState.ogItems.listSelectedSO=a;
            paServiceState.currentRequest=request;
            
            
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombObj1.id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request2.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Massive';
            request2.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request3.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request3.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request3.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request3.pricingRequest.Request_Type__c = 'Massive';
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request4= new PARequest(paServiceState);
            request4.pricingCondition=new PAPricingCondition(paServiceState);
            request4.keyCombination=new PAKeyCombination(paServiceState);
            request4.keyCombination.keyCombinationId=keyCombObj1.id;
            request4.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request4.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request4.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request4.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request4.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request4.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombObj2.id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest3.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest3.Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c =pricingRequest3.Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c= 'Customer Specific';
            request1.pricingRequest.Due_date__c=pricingRequest3.Due_date__c;
            
            PARequest request6= new PARequest(paServiceState);
            request6.pricingCondition=new PAPricingCondition(paServiceState);
            request6.keyCombination=new PAKeyCombination(paServiceState);
            request6.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request6.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request6.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request6.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request6.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request6.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request6.customer.paERPCustomer.Division_Code__c='02';
            request6.customer.paERPCustomer.Customer_code__c='123456';
            request6.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request6.keyCombination.PCLselectedKeyCombination=new list<String>();
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj2.id);
            request6.pricingRequest.Due_date__c=system.today();
            test.startTest();   
            PARequest request7= new PARequest(paServiceState);
            
            request7.pricingCondition=new PAPricingCondition(paServiceState);
            request7.keyCombination=new PAKeyCombination(paServiceState);
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            
            request7.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request7.keyCombination.PCLselectedKeyCombination=new list<String>();
            request7.pricingRequest.Due_date__c=system.today();
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request7.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request7.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request7.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request7.customer.paERPCustomer.Division_Code__c='02';
            request7.customer.paERPCustomer.Customer_code__c='123456'; 
            
            
            request.selectedBU=[select Business__c FROM OrgGroup__c WHERE id=:orgGroup1.id].id;
            
            //Pooja  
            List<Organizational_Group_Item__c> chkOrgGroupItemsList= new List<Organizational_Group_Item__c>();
            
            Organizational_Group_Item__c ChkOrgGroupItem=new  Organizational_Group_Item__c();
            ChkOrgGroupItem.Business__c=orgGroup1.id;
            ChkOrgGroupItem.OrgGroup__c=orgGroup2.id;
            //ChkOrgGroupItem.OrgGroup__r.ERP_Sales_Org__c='A640';
            //ChkOrgGroupItem.OrgGroup__r.ERP_Distribution_Channel_Code__c='10';
            //ChkOrgGroupItem.OrgGroup__r.ERP_Division_Code__c='02';
            ChkOrgGroupItem.ERP_Pricing_Procedure__c=pp.id; 
            ChkOrgGroupItem.Retroactive_Limit__c=30;
            chkOrgGroupItemsList.add(ChkOrgGroupItem);
            
            insert chkOrgGroupItemsList;
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP.request=request;
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            
            
            // SalesPriceSAP.request.requestServiceState.ogItems.listSelectedCPG.add('Sanjib');
            //  SalesPriceSAP.request.requestServiceState.ogItems.listSelectedCPG.add('dabba');
            
            //test.startTest();
            
            
            SalesPriceSAP.getCpgList();
            SalesPriceSAP.setCpgList(SalesPriceSAP.getCpgList());
            
            SalesPriceSAP.getCountryList();
            SalesPriceSAP.setCountryList(SalesPriceSAP.getCountryList());
            SalesPriceSAP.getPriceListTypeList();
            SalesPriceSAP.setPriceListTypeList(SalesPriceSAP.getPriceListTypeList());
            SalesPriceSAP.getEndUseList();
            SalesPriceSAP.setEndUseList(SalesPriceSAP.getEndUseList());
            SalesPriceSAP.getTermsOfPaymentList();
            SalesPriceSAP.setTermsOfPaymentList(SalesPriceSAP.getTermsOfPaymentList());
            SalesPriceSAP.getListOptions();
            SalesPriceSAP.getMarketSegmentList();
            SalesPriceSAP.setMarketSegmentList(SalesPriceSAP.getMarketSegmentList());
            SalesPriceSAP.deleteRecord();
            SalesPriceSAP.getName();
            SalesPriceSAP.getType();
            SalesPriceSAP.getSalesOfficeList();
            SalesPriceSAP.setSalesOfficeList(SalesPriceSAP.getSalesOfficeList());
            SalesPriceSAP.getListBusinessComponents();
            SalesPriceSAP.setMpgList(SalesPriceSAP.getSalesOfficeList());
            SalesPriceSAP.add();
            
            SalesPriceSAP.save();
            SalesPriceSAP.getMpgList();
            
            
            
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request6;
            
            
            
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request7;
            
            
            /*  SalesPriceSAP.relatedWrappersList=SalesPriceSAP2.getListWrappers();


for(PARelatedList wRec1 :SalesPriceSAP.relatedWrappersList)
{    
for( PAWrapper w :  wRec1.wrapperList) 
{

w.isSelected=true;

}
}  */
            PARelatedList rel = new PARelatedList();
            rel.wrapperList = new List<PAWrapper>();
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord = new ERP_Sales_Prices_SAP__c(Pricing_Condition_Code__c='ZPSE');
            wrap.isSelected = true;
            rel.wrapperList.add(wrap);
            SalesPriceSAP.relatedWrappersList.add(rel);
            
            
            try{
                SalesPriceSAP.relatedWrappersList = SalesPriceSAP2.getListWrappers();
                SalesPriceSAP.relatedWrappersList[0].wrapperList[0].isSelected = true;
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e){
                
            }
            
            test.stopTest();
            
        }
    }
    
    
    
    
    
    static testMethod void PASalesPriceSAPTestMethod1(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();
            
            //insert org grp
            
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            Insert orgGroup1;
            Insert orgGroup2;
            Insert orgGroup3;
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
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
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
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
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            insert buOrgGroup1;
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                    
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1; 
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request;
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP.request=request;
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombObj1.id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request1.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request1.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request1;
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request1;
            SalesPriceSAP1.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP1.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombObj1.id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request2.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Import';
            request2.requestServiceState.ogItems.selectedUser=userinfo.getUserId();
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request2.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request2.phFilter='ph1';
            request.lastPHLevelSelected=0;
            
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request2;
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request2;
            SalesPriceSAP2.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP2.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            /* TCS Team_001
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            //request.customer.paERPCustomer.Distribution_Channel_Code__c
            request3.customer.paERPCustomer.Distribution_Channel_Code__c='10-';
            request3.customer.paERPCustomer.Division_Code__c='02-';
            request3.customer.paERPCustomer.Sales_Org_Code__c='A640-';
            //request3.pricingRequest.Request_Type__c = 'Import';
            request3.requestServiceState.ogItems.selectedUser=userinfo.getUserId();
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.phFilter='ph1';
            
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request3;
            PASalesPriceSAP SalesPriceSAP3=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP3.request=request3;
            SalesPriceSAP3.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP3.getListWrappers();
                
            }
            catch(Exception e){
                
            }*/
            
            
        }
    }
    static testMethod void PASalesPriceSAPTestMethod2(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //rType.Name='--Master--';
        //rType.sObjectType='OrgGroup__c';
        
        //Test.startTest();
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            
            //insert org grp
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
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            Insert orgGroup1;
            Insert orgGroup2;
            Insert orgGroup3;
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
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
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
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
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            insert buOrgGroup1;
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                    
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1; 
            
            
            
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            
            paServiceState.currentRequest=request;
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP.request=request;
            
            
            
            
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombObj1.id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request1.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request1.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request1;
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request1;
            SalesPriceSAP1.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP1.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombObj1.id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request2.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Import';
            request2.requestServiceState.ogItems.selectedUser=userinfo.getUserId();
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request2.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request2.phFilter='ph1';
            
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request2;
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request2;
            SalesPriceSAP2.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP2.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            /* TCS Team Comments
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            //request.customer.paERPCustomer.Distribution_Channel_Code__c
            request3.customer.paERPCustomer.Distribution_Channel_Code__c='10-';
            request3.customer.paERPCustomer.Division_Code__c='02-';
            request3.customer.paERPCustomer.Sales_Org_Code__c='A640-';
            //request3.pricingRequest.Request_Type__c = 'Import';
            request3.requestServiceState.ogItems.selectedUser=userinfo.getUserId();
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.phFilter='ph1';
            
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request3;
            PASalesPriceSAP SalesPriceSAP3=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP3.request=request3;
            SalesPriceSAP3.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP3.getListWrappers();
                
            }
            catch(Exception e){
                
            }*/
            
            
        }
    }
    //PoojaSubbu
    static testMethod void relatedlist1(){
        
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        //Profile p1 =[SELECT Id FROM Profile where name='System Administrator'];
        
        
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        
        
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        
        
        
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            
            PAUtil.insertProfileRecordId();
            
            //insert org grp
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
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
            pricingRequest1.BU__c = 'BI EMEA Surfaces';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            
            insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI EMEA Surfaces';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            insert pricingRequest2;
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI EMEA Surfaces';
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
            insert buOrgGroup;
            /*Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
buOrgGroup1.Business__c=orgGroup1.id;
buOrgGroup1.OrgGroup__c=orgGroup3.id;
buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
buOrgGroup1.Retroactive_Limit__c=30;
insert buOrgGroup1;*/
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                                       
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1;
            Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
            priReqItem1.Pricing_Request__c = pricingRequest1.Id;
            priReqItem1.ERP_Sales_Prices_SAP__c = childRecord1.Id;
            priReqItem1.Scaled_Price_Flag__c = true;
            priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem1.Key_Combination_Code__c = 'A580';
            priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
            priReqItem1.Customer_Specific__c=true;      
            Date d = Date.valueOf(System.now());
            priReqItem1.New_Valid_To__c = d;
            priReqItem1.SAP_Cluster__c='CB1';
            insert priReqItem1;
            
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest3.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D146181,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.requestServiceState.ogItems.listSelectedSO=a;
            paServiceState.currentRequest=request;
            
            
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombObj1.id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request2.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Massive';
            request2.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request3.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request3.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request3.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request3.pricingRequest.Request_Type__c = 'Massive';
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request4= new PARequest(paServiceState);
            request4.pricingCondition=new PAPricingCondition(paServiceState);
            request4.keyCombination=new PAKeyCombination(paServiceState);
            request4.keyCombination.keyCombinationId=keyCombObj1.id;
            request4.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request4.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request4.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request4.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request4.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request4.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombObj2.id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest3.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest3.Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c =pricingRequest3.Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c= 'Customer Specific';
            request1.pricingRequest.Due_date__c=pricingRequest3.Due_date__c;
            
            PARequest request6= new PARequest(paServiceState);
            request6.pricingCondition=new PAPricingCondition(paServiceState);
            request6.keyCombination=new PAKeyCombination(paServiceState);
            request6.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request6.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request6.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request6.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request6.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request6.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request6.customer.paERPCustomer.Division_Code__c='02';
            request6.customer.paERPCustomer.Customer_code__c='123456';
            request6.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request6.keyCombination.PCLselectedKeyCombination=new list<String>();
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj2.id);
            request6.pricingRequest.Due_date__c=system.today();
            test.startTest();   
            PARequest request7= new PARequest(paServiceState);
            
            request7.pricingCondition=new PAPricingCondition(paServiceState);
            request7.keyCombination=new PAKeyCombination(paServiceState);
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            
            request7.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request7.keyCombination.PCLselectedKeyCombination=new list<String>();
            request7.pricingRequest.Due_date__c=system.today();
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request7.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request7.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request7.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request7.customer.paERPCustomer.Division_Code__c='02';
            request7.customer.paERPCustomer.Customer_code__c='123456'; 
            
            
            request.selectedBU=[select Business__c FROM OrgGroup__c WHERE id=:orgGroup1.id].id;
            
            //Pooja  
            List<Organizational_Group_Item__c> chkOrgGroupItemsList= new List<Organizational_Group_Item__c>();
            
            Organizational_Group_Item__c ChkOrgGroupItem=new  Organizational_Group_Item__c();
            ChkOrgGroupItem.Business__c=orgGroup1.id;
            ChkOrgGroupItem.OrgGroup__c=orgGroup2.id;
            //ChkOrgGroupItem.OrgGroup__r.ERP_Sales_Org__c='A640';
            //ChkOrgGroupItem.OrgGroup__r.ERP_Distribution_Channel_Code__c='10';
            //ChkOrgGroupItem.OrgGroup__r.ERP_Division_Code__c='02';
            ChkOrgGroupItem.ERP_Pricing_Procedure__c=pp.id; 
            ChkOrgGroupItem.Retroactive_Limit__c=30;
            chkOrgGroupItemsList.add(ChkOrgGroupItem);
            
            insert chkOrgGroupItemsList;
            
            //PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(request);
            //SalesPriceSAP.request=request;
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            
            
            // SalesPriceSAP.request.requestServiceState.ogItems.listSelectedCPG.add('Sanjib');
            //  SalesPriceSAP.request.requestServiceState.ogItems.listSelectedCPG.add('dabba');
            
            //test.startTest();
            
            SalesPriceSAP.toSet=0;
            SalesPriceSAP.nextPage=false;
            SalesPriceSAP.prevPage=false;
            SalesPriceSAP.displayRelatedList=false;
            
            
            SalesPriceSAP.getCpgList();
            SalesPriceSAP.setCpgList(SalesPriceSAP.getCpgList());
            
            SalesPriceSAP.getIncotermsList();
            SalesPriceSAP.setIncotermsList(SalesPriceSAP.getIncotermsList());
            
            SalesPriceSAP.getVariantList();
            SalesPriceSAP.getsalesOrderTypeList();
            
            
            
            SalesPriceSAP.getCountryList();
            SalesPriceSAP.setCountryList(SalesPriceSAP.getCountryList());
            SalesPriceSAP.getPriceListTypeList();
            SalesPriceSAP.setPriceListTypeList(SalesPriceSAP.getPriceListTypeList());
            SalesPriceSAP.getEndUseList();
            SalesPriceSAP.setEndUseList(SalesPriceSAP.getEndUseList());
            SalesPriceSAP.getTermsOfPaymentList();
            SalesPriceSAP.setTermsOfPaymentList(SalesPriceSAP.getTermsOfPaymentList());
            SalesPriceSAP.getListOptions();
            SalesPriceSAP.getMarketSegmentList();
            SalesPriceSAP.setMarketSegmentList(SalesPriceSAP.getMarketSegmentList());
            SalesPriceSAP.deleteRecord();
            SalesPriceSAP.getName();
            SalesPriceSAP.getType();
            SalesPriceSAP.getSalesOfficeList();
            SalesPriceSAP.setSalesOfficeList(SalesPriceSAP.getSalesOfficeList());
            SalesPriceSAP.getListBusinessComponents();
            SalesPriceSAP.setMpgList(SalesPriceSAP.getSalesOfficeList());
            SalesPriceSAP.add();
            
            SalesPriceSAP.save();
            SalesPriceSAP.getMpgList();
            
            
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request6;
            
            
            
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request7;
            
            
            /*  SalesPriceSAP.relatedWrappersList=SalesPriceSAP2.getListWrappers();


for(PARelatedList wRec1 :SalesPriceSAP.relatedWrappersList)
{    
for( PAWrapper w :  wRec1.wrapperList) 
{

w.isSelected=true;

}
}  */
            PARelatedList rel = new PARelatedList();
            rel.wrapperList = new List<PAWrapper>();
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord = new ERP_Sales_Prices_SAP__c(Pricing_Condition_Code__c='ZPSE');
            wrap.isSelected = true;
            rel.wrapperList.add(wrap);
            SalesPriceSAP.relatedWrappersList.add(rel);
            
            
            try{
                SalesPriceSAP.relatedWrappersList = SalesPriceSAP2.getListWrappers();
                SalesPriceSAP.relatedWrappersList[0].wrapperList[0].isSelected = true;
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e){
                
            }
            
            
            
            test.stopTest();
            
        }
        
    }
    
    //poojasubbu
    static testMethod void relatedlist2(){
        
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        //Profile p1 =[SELECT Id FROM Profile where name='System Administrator'];
        
        
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        
        
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        
        
        
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();
            
            
            //insert org grp
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
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
            pricingRequest1.BU__c = 'BI EMEA Surfaces';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI EMEA Surfaces';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            insert pricingRequest2;
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI EMEA Surfaces';
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
            insert buOrgGroup;
            /*Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
buOrgGroup1.Business__c=orgGroup1.id;
buOrgGroup1.OrgGroup__c=orgGroup3.id;
buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
buOrgGroup1.Retroactive_Limit__c=30;
insert buOrgGroup1;*/
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                                       
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1;
            
            Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
            priReqItem1.Pricing_Request__c = pricingRequest1.Id;
            priReqItem1.ERP_Sales_Prices_SAP__c = childRecord1.Id;
            priReqItem1.Scaled_Price_Flag__c = true;
            priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem1.Key_Combination_Code__c = 'A580';
            priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';     
            Date d = Date.valueOf(System.now());
            priReqItem1.New_Valid_To__c = d;
            priReqItem1.SAP_Cluster__c='CB1';
            insert priReqItem1;
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
       //    Test.startTest();
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest3.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D146181,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.requestServiceState.ogItems.listSelectedSO=a;
            paServiceState.currentRequest=request;
            
            
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombObj1.id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request2.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Massive';
            request2.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request3.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request3.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request3.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request3.pricingRequest.Request_Type__c = 'Massive';
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request4= new PARequest(paServiceState);
            request4.pricingCondition=new PAPricingCondition(paServiceState);
            request4.keyCombination=new PAKeyCombination(paServiceState);
            request4.keyCombination.keyCombinationId=keyCombObj1.id;
            request4.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request4.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request4.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request4.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request4.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request4.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombObj2.id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest3.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest3.Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c =pricingRequest3.Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c= 'Customer Specific';
            request1.pricingRequest.Due_date__c=pricingRequest3.Due_date__c;
            
            PARequest request6= new PARequest(paServiceState);
            request6.pricingCondition=new PAPricingCondition(paServiceState);
            request6.keyCombination=new PAKeyCombination(paServiceState);
            request6.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request6.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request6.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request6.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request6.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request6.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request6.customer.paERPCustomer.Division_Code__c='02';
            request6.customer.paERPCustomer.Customer_code__c='123456';
            request6.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request6.keyCombination.PCLselectedKeyCombination=new list<String>();
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj2.id);
            request6.pricingRequest.Due_date__c=system.today();
          test.startTest();   //<SS20230501>
            PARequest request7= new PARequest(paServiceState);
            
            request7.pricingCondition=new PAPricingCondition(paServiceState);
            request7.keyCombination=new PAKeyCombination(paServiceState);
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            
            request7.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request7.keyCombination.PCLselectedKeyCombination=new list<String>();
            request7.pricingRequest.Due_date__c=system.today();
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request7.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request7.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request7.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request7.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request7.customer.paERPCustomer.Division_Code__c='02';
            request7.customer.paERPCustomer.Customer_code__c='123456'; 
            
            
            request.selectedBU=[select Business__c FROM OrgGroup__c WHERE id=:orgGroup1.id].id;
            
            //Pooja  
            List<Organizational_Group_Item__c> chkOrgGroupItemsList= new List<Organizational_Group_Item__c>();
            
            Organizational_Group_Item__c ChkOrgGroupItem=new  Organizational_Group_Item__c();
            ChkOrgGroupItem.Business__c=orgGroup1.id;
            ChkOrgGroupItem.OrgGroup__c=orgGroup2.id;
            //ChkOrgGroupItem.OrgGroup__r.ERP_Sales_Org__c='A640';
            //ChkOrgGroupItem.OrgGroup__r.ERP_Distribution_Channel_Code__c='10';
            //ChkOrgGroupItem.OrgGroup__r.ERP_Division_Code__c='02';
            ChkOrgGroupItem.ERP_Pricing_Procedure__c=pp.id; 
            ChkOrgGroupItem.Retroactive_Limit__c=30;
            chkOrgGroupItemsList.add(ChkOrgGroupItem);
            
            insert chkOrgGroupItemsList;
            
            //PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(request);
            //SalesPriceSAP.request=request;
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            // SalesPriceSAP.request.requestServiceState.ogItems.listSelectedCPG.add('Sanjib');
            //  SalesPriceSAP.request.requestServiceState.ogItems.listSelectedCPG.add('dabba');
            
            //test.startTest();
            SalesPriceSAP.getCpgList();
            SalesPriceSAP.setCpgList(SalesPriceSAP.getCpgList());
            
            SalesPriceSAP.getIncotermsList();
            SalesPriceSAP.setIncotermsList(SalesPriceSAP.getIncotermsList());
            
            SalesPriceSAP.getVariantList();
            SalesPriceSAP.getsalesOrderTypeList();
            
     //     Test.startTest();  
            
            SalesPriceSAP.getCountryList();
            SalesPriceSAP.setCountryList(SalesPriceSAP.getCountryList());
            SalesPriceSAP.getPriceListTypeList();
            SalesPriceSAP.setPriceListTypeList(SalesPriceSAP.getPriceListTypeList());
            SalesPriceSAP.getEndUseList();
            SalesPriceSAP.setEndUseList(SalesPriceSAP.getEndUseList());
            SalesPriceSAP.getTermsOfPaymentList();
            SalesPriceSAP.setTermsOfPaymentList(SalesPriceSAP.getTermsOfPaymentList());
            SalesPriceSAP.getListOptions();
            SalesPriceSAP.getMarketSegmentList();
            SalesPriceSAP.setMarketSegmentList(SalesPriceSAP.getMarketSegmentList());
            SalesPriceSAP.deleteRecord();
            SalesPriceSAP.getName();
            SalesPriceSAP.getType();
            SalesPriceSAP.getSalesOfficeList();
            SalesPriceSAP.setSalesOfficeList(SalesPriceSAP.getSalesOfficeList());
            SalesPriceSAP.getListBusinessComponents();
            SalesPriceSAP.setMpgList(SalesPriceSAP.getSalesOfficeList());
            SalesPriceSAP.add();
     Test.stopTest(); //<SS20230501>      
            SalesPriceSAP.save();
            SalesPriceSAP.getMpgList();
           
            
            
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request6;
            
            
            
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request7;
            
           
          //  List<Pricing_Request_Item__c> x = SalesPriceSAP.pricingRequestItemList;
            
            
            /*  SalesPriceSAP.relatedWrappersList=SalesPriceSAP2.getListWrappers();


for(PARelatedList wRec1 :SalesPriceSAP.relatedWrappersList)
{    
for( PAWrapper w :  wRec1.wrapperList) 
{

w.isSelected=true;

}
}  */
            PARelatedList rel = new PARelatedList();
            rel.wrapperList = new List<PAWrapper>();
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord = new ERP_Sales_Prices_SAP__c(Pricing_Condition_Code__c='ZPSE');
            wrap.isSelected = true;
            rel.wrapperList.add(wrap);
            SalesPriceSAP.relatedWrappersList.add(rel);
            
            
            try{
                SalesPriceSAP.relatedWrappersList = SalesPriceSAP2.getListWrappers();
                SalesPriceSAP.relatedWrappersList[0].wrapperList[0].isSelected = true;
                SalesPriceSAP.action('','','FetchRecordswithOffset');
            }
            catch(Exception e){
                
            }
            
            
            
          //test.stopTest();
            
        }
        
    }
    
    //Added by Calment
    static testMethod void PASalesPriceSAPTestMethodMaterialGroup() {
        
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            // 12/29/2016 - Using Test Custom Setting for creating custom setting
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList  = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();
            //insert org grp
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
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
            pricingRequest1.Pricing_Request_Type__c = 'Pricing Task';
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
            pricingRequest3.Pricing_Request_Type__c = 'Pricing Task';
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
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1;
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                                       
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
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest2.Division_Code__c;
            request.pricingRequest.Sold_To__c=pricingRequest1.SoldTo_Code__c;
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D146181,materialused';
            request.pricingRequest.Sales_Org_Code__c=pricingRequest3.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            paServiceState.currentRequest=request;
            
            
            
            
            
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.KeyCombinationName=keyCombObj1.Key_Combination__c;
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request1.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            //request1.pricingRequest.Sold_To__c=pricingRequest1.SoldTo_Code__c;
            request1.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request1.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request.requestServiceState.ogItems.value='Export';
            request1.customer.paERPCustomer.Sales_Org_Code__c='A640';  
            request1.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request1.customer.paERPCustomer.Division_Code__c='02';
            request1.customer.paERPCustomer.Customer_code__c='123456';
            request1.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request1.keyCombination.PCLselectedKeyCombination=new list<String>();
            request1.viewCustomerPrices='CustomerPrices';
            request1.pricingRequest.Due_date__c=system.today();
            
            PARequest request6= new PARequest(paServiceState);
            request6.pricingCondition=new PAPricingCondition(paServiceState);
            request6.keyCombination=new PAKeyCombination(paServiceState);
            request6.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request6.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            //request6.pricingRequest.Sold_To__c=pricingRequest1.SoldTo_Code__c;
            request6.pricingRequest.Sales_Org_Code__c =pricingRequest1.Sales_Org_Code__c;
            request6.requestServiceState.ogItems.selectedBU=orgGroup1.id;
            request6.customer.paERPCustomer.Sales_Org_Code__c='A640';
            
            request6.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request6.customer.paERPCustomer.Division_Code__c='02';
            request6.customer.paERPCustomer.Customer_code__c='123456';
            request6.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request6.keyCombination.PCLselectedKeyCombination=new list<String>();
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombObj2.id);
            request6.pricingRequest.Due_date__c=system.today();
            
            
            
            
            request.selectedBU=[select Business__c FROM OrgGroup__c WHERE id=:orgGroup1.id].id;
            
            test.startTest();
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP.request=request;
            SalesPriceSAP.relatedWrappersList=new list<PARelatedList>();
            SalesPriceSAP.exportWrapList=new list<PARelatedList>();
            SalesPriceSAP.getMaterialGroup5KeyList();
            SalesPriceSAP.setMaterialGroup5KeyList(SalesPriceSAP.getMaterialGroup5KeyList());
            SalesPriceSAP.getSalesDistrictList();
            SalesPriceSAP.setSalesDistrictList(SalesPriceSAP.getSalesDistrictList());
            SalesPriceSAP.getMatlGrp1List();      
            SalesPriceSAP.setMatlGrp1List(SalesPriceSAP.getMatlGrp1List());
            SalesPriceSAP.getContractList();
            SalesPriceSAP.getPlantList();
            SalesPriceSAP.getShippingConditionList();
            SalesPriceSAP.getDestinationCountryList();
            SalesPriceSAP.getCampaignList();        
            SalesPriceSAP.setCampaignList(SalesPriceSAP.getCampaignList());
            SalesPriceSAP.getDocumentCurrencyList();
            SalesPriceSAP.setDocumentCurrencyList(SalesPriceSAP.getDocumentCurrencyList());
            SalesPriceSAP.getStateList();
            SalesPriceSAP.setStateList(SalesPriceSAP.getStateList());
            
            
            //test.startTest();
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            try{
                SalesPriceSAP.getListWrappers();
                
            }
            catch(Exception e){
                
            }
            request.pricingRequest.Sold_To__c='';
            request.soldToFilter='T001';
            ERP_Customer__c cus =new ERP_Customer__c();
            cus.name='Customer';
            cus.Customer_Code__c='T001';
            insert cus;
            Pricing_Contract__c con=new Pricing_Contract__c();
            con.Contract_No__c=02;
            con.Sales_Area__c=request.pricingRequest.Sales_Org_Code__c+'-'+request.pricingRequest.Dist_Channel_Code__c+'-'+request.pricingRequest.Division_Code__c;   
            con.Contract__c='contract';    
            con.Customer__c=cus.id;
            insert con;
            SalesPriceSAP.getContractList();
            //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            
            
            SalesPriceSAP.save();
            SalesPriceSAP.getMpgList();
            PASalesPriceSAP SalesPriceSAP1=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP1.request=request1;
            try{
                SalesPriceSAP1.getListWrappers();
                
            }
            
            catch(Exception e){
                
            }
            
            PASalesPriceSAP SalesPriceSAP2=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP2.request=request6;
            try{
                SalesPriceSAP2.getListWrappers();
                
            }
            
            catch(Exception e){
                
            }
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombObj1.id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            //request.customer.paERPCustomer.Distribution_Channel_Code__c
            request3.customer.paERPCustomer.Distribution_Channel_Code__c='10-';
            request3.customer.paERPCustomer.Division_Code__c='02-';
            request3.customer.paERPCustomer.Sales_Org_Code__c='A640-';
            //request3.pricingRequest.Request_Type__c = 'Import';
            request3.requestServiceState.ogItems.selectedUser=userinfo.getUserId();
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request3.phFilter='ph1';
            request3.materialGroup5KeyFilter='M03';
            request3.cpgFilter='M03';
            request3.mpgFilter='M03';
            request3.incotermsFilter='M03';
            request3.priceListTypeFilter='M03';
            request3.marketSegmentFilter='M03';
            request3.materialGroup1Filter='M03';
            request3.endUseFilter='M03';
            request3.countryFilter='M03';
            request3.paymentTermsFilter='M03';
            request3.variantFilter='M03';
            request3.contractFilter='M03';
            request3.salesOrderTypeFilter='M03';
            request3.ComPartnerFilter='M03';
            request3.PayerFilter='M03';
            request3.partnerZFFilter='M03';
            request3.PlantFilter='M03';
            request3.ShippingConditionFilter='M03';
            request3.DestinationCountryFilter='M03';
            request3.shipToCountryFilter='M03';
            request3.salesOfficeFilter='M03';
            request3.campaignFilter='M03';
            request3.documentCurrencyFilter='M03';
            request3.stateFilter='M03';
            request3.ComPartnerFilter='M03';
            request3.profitCenterFilter= null;
            request3.discRefFilter=null;
            request3.DFixValDate.Due_Date__c=system.today();
            request3.salesDistrictFilter='M03';
            keyCombObj1.Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Kcode';
            update keyCombObj1;
            priCondObj1.Price_Types__c='Percentage';
            update priCondObj1;   
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            
            paServiceState.currentRequest=request3;
            PASalesPriceSAP SalesPriceSAP3=new PASalesPriceSAP(paServiceState);
            SalesPriceSAP3.request=request3;
            SalesPriceSAP3.relatedWrappersList=new list<PARelatedList>();
            try{
                SalesPriceSAP3.getListWrappers();
                
            }
            catch(Exception e){
                
            } 
            
            
            try{
                String gets=SalesPriceSAP3.action('currentPageLabel','currentPageLabel','FetchRecords');
                String gets1=SalesPriceSAP3.action('currentPageLabel','currentPageLabel','exportCSV');
                gets1=SalesPriceSAP3.action('currentPageLabel','currentPageLabel','AddSelectedPrices');
            }
            catch(Exception e){
                
            } 
            
            
            /*try{
SalesPriceSAP3.getListWrappers();

}
catch(Exception e){

}*/
            test.stopTest();
        }
    } 
}