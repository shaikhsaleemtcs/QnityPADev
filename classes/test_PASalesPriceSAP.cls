/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 

Updates:
<AB20210301> Updated to avoid SOQL Governer limit error due independent DML Statements
<SS20220826> Added Sales_Order_Item_Code__c and Sales_Order_Item__c in query

********************************************************************************/

@isTest
public class test_PASalesPriceSAP
{    
    
    static testMethod void method1()
    {
        System.debug('Important');
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        
        
        
        
        
        
        
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            insertQueryRecords();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            List<Key_Field_Error__c> kfeList= new List<Key_Field_Error__c>();
            kfeList.add(new Key_Field_Error__c(Name='ComPartner',Error_Message__c='Error:ComPartner is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Country',Error_Message__c='Error:Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Customer Price Group',Error_Message__c='Error:Customer Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Destination Country',Error_Message__c='Error:Destination Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Incoterms',Error_Message__c='Error:Incoterms is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 3',Error_Message__c='Error:End Use is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 4',Error_Message__c='Error:Market Segment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Price Group',Error_Message__c='Error:Material Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Plant',Error_Message__c='Error:Plant is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Price List Type',Error_Message__c='Error:Price List Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Office',Error_Message__c='Error:Sales Office is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Order Type',Error_Message__c='Error:Sales Order Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Shipping Condition',Error_Message__c='Error:Shipping Condition is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Terms of Payment',Error_Message__c='Error:Terms of Payment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Variant',Error_Message__c='Error:Variant is not valid for the Sold To.'));
            insert kfeList;
            
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
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(
                Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                      Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
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
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
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
            pricingRequest1.Default_Currency__c='USD';
            
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
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.Default_SalesArea_UoM__c='KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            //buOrgGroup.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            //buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1;
            
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
            insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            
            ERP_Customer_Material_Key__c custKey = new ERP_Customer_Material_Key__c();
            custKey.Status__c='Active';
            insert custKey;
            
            Org_Group_ERP_Key__c ogKey = new Org_Group_ERP_Key__c();
            ogKey.Organizational_Group_Item__c=buOrgGroup1.id;
            ogKey.ERP_Cus_Mat_Compt_Key__c = custKey.id;
            insert ogKey;
            
            
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
            insert esalesPrice;
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat2 = new material__C();
            mat2.ERP_Material_Code__c='D655234';
            mat2.ERP_Source_Cluster__c='CB1';
            mat2.ERP_Sales_Org_Code__c='A640';
            mat2.ERP_Distribution_Channel_Code__c='10';
            mat2.External_ERP_ID__c='A640';
            mat2.External_ERP_ID__c='CB1-A640-10-D1209';
            mat2.ERP_Deletion_Flag__c = false;
            mat2.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat2;
            
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D12345';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D12345';
            mat1.ERP_Deletion_Flag__c = false;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'ViewCustomerPrices';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Last Valid Prices';
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
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequest1;
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            SalesPriceSAP.relatedWrappersList = relatedList;
            
            
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            Test.startTest();  
            try
            {
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e)
            {
            }
            request.viewCustomerPrices = '';
            try
            {
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            try
            {
                request.currentPricesSelection = 'Last Valid Prices';
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffsetback');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','AddSelectedPricesFetchRecords');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','ViewCustomerPrices');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffset');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddSelectedPrices');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','PCLfetch');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            
            
            
            
            SalesPriceSAP.validate('AddSelectedPrices');
            SalesPriceSAP.validate('AddRequestItems');
            //SalesPriceSAP.validate('#');
            SalesPriceSAP.relatedWrappersList = new List<PARelatedList>();
            SalesPriceSAP.validate('AddSelectedPrices');
            SalesPriceSAP.validate('AddRequestItems');
            SalesPriceSAP.validate('#');
            
            
            SalesPriceSAP.getVariantList();
            SalesPriceSAP.getsalesOrderTypeList();
            
            ERP_Sales_Prices_SAP__c eSap2 = new ERP_Sales_Prices_SAP__c();
            eSap2.Pricing_Condition_Code__c ='ZPSE';
            eSap2.Sales_Org_Code__c='A640';
            eSap2.Distribution_Channel_code__c='10';
            eSap2.Division_code__c='02';
            eSap2.Sold_To_Code__c='T001';
            eSap2.Material_Code__c='D12345';
            eSap2.ShipTo_Code__c='123456';
            eSap2.End_Use_Code__c='123456';
            eSap2.Valid_From__c = System.today()-10;
            eSap2.Valid_To__c = System.today()-5;
            insert eSap2;
            
            
            ERP_Customer__c erpgenCust = new ERP_Customer__c();
            erpgenCust.Customer_Code__c='123456';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust.Sales_Org_Code__c = 'A640';
            erpgenCust.Distribution_Channel_Code__c = '10';
            erpgenCust.Division_Code__c = '02';
            erpgenCust.Currency_Code__c = 'USD';
            insert erpgenCust;
            
            ERP_Customer__c erpgenCust1 = new ERP_Customer__c();
            erpgenCust1.Customer_Code__c='T001';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust1.Sales_Org_Code__c = 'A640';
            erpgenCust1.Distribution_Channel_Code__c = '10';
            erpgenCust1.Division_Code__c = '02';
            erpgenCust1.Currency_Code__c = 'USD';
            insert erpgenCust1;
            
            ERP_Relationship__c erprel = new ERP_Relationship__c();
            erprel.ERP_Customer__c=erpgenCust1.id;
            erprel.Related_ERP_Customer__c=erpgenCust.id;
            erprel.Partner_Function_Code__c='WE';
            insert erprel;
            
            
            System.debug('PCPCFROM Test class:-'+eSap2.PCKC__c);
            
            List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
            Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
            priReqItem1.Pricing_Request__c = pricingRequest1.Id;
            priReqItem1.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem1.Scaled_Price_Flag__c = true;
            priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem1.Key_Combination_Code__c = 'A580';
            priReqItem1.Key_Combination__c = 'Material/Sold To/Ship To/Material Price Group/Customer Price Group/Incoterms/Price List Type/Sales Office/Country/Terms of Payment/Material Group 4/Variant/Sales Order Type/Material Group 3/';
            priReqItem1.Customer_Specific__c=true;  
            priReqItem1.PH1_Code__c='F2';
            priReqItem1.PH2_Code__c='WP';
            priReqItem1.PH3_Code__c='PI';
            priReqItem1.PH4_Code__c='11';
            priReqItem1.New_UoM__c='KG';
            priReqItem1.New_Unit__c='MP';
            priReqItem1.Material_Code__c = 'D12345';  
            priReqItem1.ShipTo_Code__c='123456';
            priReqItem1.End_User_Code__c='123456';
            Date d = Date.valueOf(System.now());
            priReqItem1.New_Valid_To__c = d;
            pricingReqItemList.add(priReqItem1);
            
            
            Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
            priReqItem2.Pricing_Request__c = pricingRequest1.Id;
            priReqItem2.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem2.Scaled_Price_Flag__c = true;
            priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem2.Key_Combination_Code__c = 'A580';
            priReqItem2.Key_Combination__c = 'Material/Ship To/Material Price Group/Customer Price Group';
            priReqItem2.Customer_Specific__c=true;  
            priReqItem2.PH1_Code__c='F2';
            priReqItem2.PH2_Code__c='WP';
            priReqItem2.PH3_Code__c='PI';
            priReqItem2.PH4_Code__c='11';
            priReqItem2.New_UoM__c='MP';
            priReqItem2.Material_Code__c = 'D12345';  
            priReqItem2.ShipTo_Code__c='123456';
            priReqItem2.End_User_Code__c='123456';
            priReqItem2.New_Valid_To__c = d;
            priReqItem2.Calculation_Type__c='Fixed';
            // 1/21/2017 - Merge&Spin - Added Delta code below from utqa ti splitutil   
            pricingReqItemList.add(priReqItem2);
            
            Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
            priReqItem3.Pricing_Request__c = pricingRequest1.Id;
            priReqItem3.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem3.Scaled_Price_Flag__c = true;
            priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem3.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem3.Key_Combination_Code__c = 'A580';
            priReqItem3.Key_Combination__c = 'Material/Sold To/End User/Material Price Group/Customer Price Group';
            priReqItem3.Customer_Specific__c=true;  
            priReqItem3.PH1_Code__c='F2';
            priReqItem3.PH2_Code__c='WP';
            priReqItem3.PH3_Code__c='PI';
            priReqItem3.PH4_Code__c='11';
            priReqItem3.Material_Code__c = 'D12345';  
            priReqItem3.ShipTo_Code__c='123456';
            priReqItem3.End_User_Code__c='123456';
            priReqItem3.New_Valid_To__c = d;
            pricingReqItemList.add(priReqItem3);
            
            insert pricingReqItemList;
            
            pricingRequest1.Request_Valid_From__c = System.today();
            update pricingRequest1;
            SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
            
            eSap2.Valid_From__c = System.today();
            eSap2.Valid_To__c = System.today()+15;
            update eSap2;
            
            //SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
            
            paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            SalesPriceSAP.request=request;
            SalesPriceSAP.clearViewPoint = 'test';
            SalesPriceSAP.setMaterialGroup5KeyList(new List<SelectOption>() );
            SalesPriceSAP.setSalesDistrictList(new List<SelectOption>() );
            SalesPriceSAP.setMatlGrp1List(new List<SelectOption>() );
            SalesPriceSAP.setCampaignList(new List<SelectOption>() );
            SalesPriceSAP.setDocumentCurrencyList(new List<SelectOption>() );
            SalesPriceSAP.setStateList(new List<SelectOption>() );
            SalesPriceSAP.setStateList(new List<SelectOption>() );
            //SalesPriceSAP.retrievePriceRecords(buOrgGroup);
            
            
            
            //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            
            
            Test.stopTest();
        }
    }
    
    //Added by Priyanci
    static testMethod void method_PH()
    {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            insertQueryRecords();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            List<Key_Field_Error__c> kfeList= new List<Key_Field_Error__c>();
            kfeList.add(new Key_Field_Error__c(Name='ComPartner',Error_Message__c='Error:ComPartner is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Country',Error_Message__c='Error:Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Customer Price Group',Error_Message__c='Error:Customer Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Destination Country',Error_Message__c='Error:Destination Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Incoterms',Error_Message__c='Error:Incoterms is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 3',Error_Message__c='Error:End Use is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 4',Error_Message__c='Error:Market Segment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Price Group',Error_Message__c='Error:Material Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Plant',Error_Message__c='Error:Plant is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Price List Type',Error_Message__c='Error:Price List Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Office',Error_Message__c='Error:Sales Office is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Order Type',Error_Message__c='Error:Sales Order Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Shipping Condition',Error_Message__c='Error:Shipping Condition is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Terms of Payment',Error_Message__c='Error:Terms of Payment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Variant',Error_Message__c='Error:Variant is not valid for the Sold To.'));
            insert kfeList;
            
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
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold to Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/PH7 Code/PH8 Code/PH9 Code-Sales Org./Dist. Channel/Division/Sold to/Product Hierarchy'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(
                Key_Combination__c='ZPGB-Combined/Sold-to/Grade (PH-code)',
                Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Key_Combination__c='ZPRB-Separate/Sold-to/Grade (PH-code)',
                                                                      Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
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
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
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
            pricingRequest1.Default_Currency__c='USD';
            
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
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.Default_Per_UoM_Setup__c='Sales Area Config';        
            buOrgGroup.Default_SalesArea_UoM__c='KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            //buOrgGroup.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
            buOrgGroup.Default_Per_UoM_Setup__c='Sales Area Config'; 
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            //buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1;
            
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
            insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            
            ERP_Customer_Material_Key__c custKey = new ERP_Customer_Material_Key__c();
            custKey.Status__c='Active';
            insert custKey;
            
            Org_Group_ERP_Key__c ogKey = new Org_Group_ERP_Key__c();
            ogKey.Organizational_Group_Item__c=buOrgGroup1.id;
            ogKey.ERP_Cus_Mat_Compt_Key__c = custKey.id;
            insert ogKey;
            
            
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
            insert esalesPrice;
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat2 = new material__C();
            mat2.ERP_Material_Code__c='D655234';
            mat2.ERP_Source_Cluster__c='CB1';
            mat2.ERP_Sales_Org_Code__c='A640';
            mat2.ERP_Distribution_Channel_Code__c='10';
            mat2.External_ERP_ID__c='A640';
            mat2.External_ERP_ID__c='CB1-A640-10-D1209';
            mat2.ERP_Deletion_Flag__c = false;
            mat2.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat2;
            
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D12345';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D12345';
            mat1.ERP_Deletion_Flag__c = false;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'ViewCustomerPrices';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Last Valid Prices';
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
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequest1;
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            SalesPriceSAP.relatedWrappersList = relatedList;
            
            
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            Test.startTest();  
            try
            {
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e)
            {
            }
            request.viewCustomerPrices = '';
            try
            {
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            try
            {
                request.currentPricesSelection = 'Last Valid Prices';
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffsetback');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','AddSelectedPricesFetchRecords');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','ViewCustomerPrices');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffset');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddSelectedPrices');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','PCLfetch');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            
            
            
            
            SalesPriceSAP.validate('AddSelectedPrices');
            SalesPriceSAP.validate('AddRequestItems');
            //SalesPriceSAP.validate('#');
            SalesPriceSAP.relatedWrappersList = new List<PARelatedList>();
            SalesPriceSAP.validate('AddSelectedPrices');
            SalesPriceSAP.validate('AddRequestItems');
            SalesPriceSAP.validate('#');
            
            
            SalesPriceSAP.getVariantList();
            SalesPriceSAP.getsalesOrderTypeList();
            
            ERP_Sales_Prices_SAP__c eSap2 = new ERP_Sales_Prices_SAP__c();
            eSap2.Pricing_Condition_Code__c ='ZPSE';
            eSap2.Sales_Org_Code__c='A640';
            eSap2.Distribution_Channel_code__c='10';
            eSap2.Division_code__c='02';
            eSap2.Sold_To_Code__c='T001';
            eSap2.Material_Code__c='D12345';
            eSap2.ShipTo_Code__c='123456';
            eSap2.End_Use_Code__c='123456';
            eSap2.PH1_Code__c='B9';
            eSap2.PH2_Code__c='01';
            eSap2.PH3_Code__c='10';
            eSap2.PH4_Code__c='06';
            eSap2.PH5_Code__c='01';
            eSap2.PH6_Code__c='01';
            eSap2.PH7_Code__c='53';
            eSap2.PH8_Code__c='26';    
            eSap2.PH9_Code__c='99'; 
            eSap2.Valid_From__c = System.today()-10;
            eSap2.Valid_To__c = System.today()-5;
            insert eSap2;
            
            
            ERP_Customer__c erpgenCust = new ERP_Customer__c();
            erpgenCust.Customer_Code__c='123456';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust.Sales_Org_Code__c = 'A640';
            erpgenCust.Distribution_Channel_Code__c = '10';
            erpgenCust.Division_Code__c = '02';
            erpgenCust.Currency_Code__c = 'USD';
            insert erpgenCust;
            
            ERP_Customer__c erpgenCust1 = new ERP_Customer__c();
            erpgenCust1.Customer_Code__c='T001';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust1.Sales_Org_Code__c = 'A640';
            erpgenCust1.Distribution_Channel_Code__c = '10';
            erpgenCust1.Division_Code__c = '02';
            erpgenCust1.Currency_Code__c = 'USD';
            insert erpgenCust1;
            
            ERP_Relationship__c erprel = new ERP_Relationship__c();
            erprel.ERP_Customer__c=erpgenCust1.id;
            erprel.Related_ERP_Customer__c=erpgenCust.id;
            erprel.Partner_Function_Code__c='WE';
            insert erprel;
            
            ERP_Sales_Prices_SAP__c esaptest = [select PCKC__c from ERP_Sales_Prices_SAP__c where id =:esap2.id limit 1];
            System.debug('PCPCFROM Test class:-'+esaptest.PCKC__c);
            
            List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
            
            Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
            priReqItem2.Pricing_Request__c = pricingRequest1.Id;
            priReqItem2.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem2.Scaled_Price_Flag__c = true;
            priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem2.Key_Combination_Code__c = 'A580';
            priReqItem2.Key_Combination__c = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
            priReqItem2.Customer_Specific__c=true;  
            priReqItem2.PH1_Code__c='B9';
            priReqItem2.PH2_Code__c='01';
            priReqItem2.PH3_Code__c='10';
            priReqItem2.PH4_Code__c='06';
            priReqItem2.PH5_Code__c='01';
            priReqItem2.PH6_Code__c='01';
            priReqItem2.PH7_Code__c='53';
            priReqItem2.PH8_Code__c='26';    
            priReqItem2.PH9_Code__c='99';    
            priReqItem2.New_UoM__c=null;
            priReqItem2.New_Per__c=null;
            priReqItem2.Material_Code__c = 'D12345';  
            priReqItem2.ShipTo_Code__c='123456';
            priReqItem2.End_User_Code__c='123456';
            
            priReqItem2.New_Valid_To__c = System.today();
            priReqItem2.Calculation_Type__c='Fixed';
            pricingReqItemList.add(priReqItem2);
            
            
            insert pricingReqItemList;
            
            pricingRequest1.Request_Valid_From__c = System.today();
            
            update pricingRequest1;
            
            List<Pricing_Request_Item__c> priceitemlist = new List<Pricing_Request_Item__c>();
            //<SS20220826>-- added Sales_Order_Item_Code__c in below query
            priceitemlist = [SELECT Id,Non_Commercial_Products__c,New_Per__c,Calculation_Type__c,State_Code__c,Campaign_Code__c,Document_Currency_Code__c,Disc_Ref_No__c,FixValDate__c,Payer_Code__c,Partner_ZF_Code__c,Material_Group_1_Code__c,Sales_District_Code__c,Incoterms_Code__c,Ship_To_Country_Code__c,Profit_Center_Code__c,
                             Customer_Hierarchy_Code__c,Country_Code__c,Price_Ref_Partner_Code__c,
                             Destination_Country_Code__c,Shipping_Condition_Code__c,Plant_Code__c,
                             Material_Group_5_Key_Code__c,ComPartner_Code__c,Sales_Order_Type_Code__c,Sales_Order_Item_Code__c,
                             Contract_Code__c,Variant_Code__c,Market_Segment_Code__c,End_Use_Code__c,
                             Disc_Ref__c,Price_List_Type_Code__c,Sold_To_Code__c,Pricing_Request__c,
                             Customer_Price_Group_Code__c,Material_Price_Group_Code__c,Sales_Office_Code__c,
                             Sales_Org_Code__c,Division_Code__c,Dist_Channel_Code__c,ERP_Sales_Prices_SAP__c,
                             Scaled_Price_Flag__c,Pricing_Condition_Code__c,Pricing_Condition__c,Key_Combination_Code__c,
                             Key_Combination__c,Customer_Specific__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,New_UoM__c,New_Unit__c,Material_Code__c,ShipTo_Code__c,End_User_Code__c,New_Valid_To__c,F_Product_Hierarchy_Code__c,Terms_Of_Payment_Code__c FROM Pricing_Request_Item__c WHERE Id =:pricingReqItemList[0].id];
            
            //SalesPriceSAP.cloneValidation(priceitemlist,pricingRequest1); -- TCS Team_001
            
            eSap2.Valid_From__c = System.today();
            eSap2.Valid_To__c = System.today()+15;
            update eSap2;
            
            //SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
            
            paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            SalesPriceSAP.request=request;
            SalesPriceSAP.clearViewPoint = 'test';
            SalesPriceSAP.setMaterialGroup5KeyList(new List<SelectOption>() );
            SalesPriceSAP.setSalesDistrictList(new List<SelectOption>() );
            SalesPriceSAP.setMatlGrp1List(new List<SelectOption>() );
            SalesPriceSAP.setCampaignList(new List<SelectOption>() );
            SalesPriceSAP.setDocumentCurrencyList(new List<SelectOption>() );
            SalesPriceSAP.setStateList(new List<SelectOption>() );
            SalesPriceSAP.setStateList(new List<SelectOption>() );
            //SalesPriceSAP.retrievePriceRecords(buOrgGroup);
            
            
            
            //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            
            
            Test.stopTest();
        }
    }
    
    static testMethod void method_PH1()
    {
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            insertQueryRecords();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            List<Key_Field_Error__c> kfeList= new List<Key_Field_Error__c>();
            kfeList.add(new Key_Field_Error__c(Name='ComPartner',Error_Message__c='Error:ComPartner is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Country',Error_Message__c='Error:Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Customer Price Group',Error_Message__c='Error:Customer Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Destination Country',Error_Message__c='Error:Destination Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Incoterms',Error_Message__c='Error:Incoterms is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 3',Error_Message__c='Error:End Use is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 4',Error_Message__c='Error:Market Segment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Price Group',Error_Message__c='Error:Material Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Plant',Error_Message__c='Error:Plant is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Price List Type',Error_Message__c='Error:Price List Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Office',Error_Message__c='Error:Sales Office is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Order Type',Error_Message__c='Error:Sales Order Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Shipping Condition',Error_Message__c='Error:Shipping Condition is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Terms of Payment',Error_Message__c='Error:Terms of Payment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Variant',Error_Message__c='Error:Variant is not valid for the Sold To.'));
            insert kfeList;
            
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
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(
                Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                      Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
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
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
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
            pricingRequest1.Default_Currency__c='USD';
            
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
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id;        
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Default_Per_UoM_Setup__c='Sales Area Config';
            //buOrgGroup.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            //buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1;
            
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
            insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            
            ERP_Customer_Material_Key__c custKey = new ERP_Customer_Material_Key__c();
            custKey.Status__c='Active';
            insert custKey;
            
            Org_Group_ERP_Key__c ogKey = new Org_Group_ERP_Key__c();
            ogKey.Organizational_Group_Item__c=buOrgGroup1.id;
            ogKey.ERP_Cus_Mat_Compt_Key__c = custKey.id;
            insert ogKey;
            
            
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
            insert esalesPrice;
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat2 = new material__C();
            mat2.ERP_Material_Code__c='D655234';
            mat2.ERP_Source_Cluster__c='CB1';
            mat2.ERP_Sales_Org_Code__c='A640';
            mat2.ERP_Distribution_Channel_Code__c='10';
            mat2.External_ERP_ID__c='A640';
            mat2.External_ERP_ID__c='CB1-A640-10-D1209';
            mat2.ERP_Deletion_Flag__c = false;
            mat2.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat2;
            
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D12345';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D12345';
            mat1.ERP_Deletion_Flag__c = false;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'ViewCustomerPrices';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Last Valid Prices';
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
              System.debug('Important'+request.selectedBU);
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequest1;
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            System.debug('Important'+esapRcrd);
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            SalesPriceSAP.relatedWrappersList = relatedList;
             System.debug('Important'+SalesPriceSAP.relatedWrappersList);
            
            
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            Test.startTest();  
            try
            {
                SalesPriceSAP.getListWrappers();
                System.debug('Important'+ SalesPriceSAP.getListWrappers());
            }
            catch(Exception e)
            {
            }
            request.viewCustomerPrices = '';
            try
            {
                SalesPriceSAP.getListWrappers();
                 System.debug('Important'+ SalesPriceSAP.getListWrappers());
            }
            catch(Exception e )
            {
            }
            
            try
            {
                request.currentPricesSelection = 'Last Valid Prices';
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffsetback');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','AddSelectedPricesFetchRecords');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','ViewCustomerPrices');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffset');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddSelectedPrices');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','PCLfetch');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            
            
            
            
            SalesPriceSAP.validate('AddSelectedPrices');
            SalesPriceSAP.validate('AddRequestItems');
            //SalesPriceSAP.validate('#');
            SalesPriceSAP.relatedWrappersList = new List<PARelatedList>();
            SalesPriceSAP.validate('AddSelectedPrices');
            SalesPriceSAP.validate('AddRequestItems');
            SalesPriceSAP.validate('#');
            
            
            SalesPriceSAP.getVariantList();
            SalesPriceSAP.getsalesOrderTypeList();
            
            ERP_Sales_Prices_SAP__c eSap2 = new ERP_Sales_Prices_SAP__c();
            eSap2.Pricing_Condition_Code__c ='ZPSE';
            eSap2.Sales_Org_Code__c='A640';
            eSap2.Distribution_Channel_code__c='10';
            eSap2.Division_code__c='02';
            eSap2.Sold_To_Code__c='T001';
            eSap2.Material_Code__c='D12345';
            eSap2.ShipTo_Code__c='123456';
            eSap2.End_Use_Code__c='123456';
            eSap2.Valid_From__c = System.today()-10;
            eSap2.Valid_To__c = System.today()-5;
            insert eSap2;
            
            
            ERP_Customer__c erpgenCust = new ERP_Customer__c();
            erpgenCust.Customer_Code__c='123456';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust.Sales_Org_Code__c = 'A640';
            erpgenCust.Distribution_Channel_Code__c = '10';
            erpgenCust.Division_Code__c = '02';
            erpgenCust.Currency_Code__c = 'USD';
            insert erpgenCust;
            
            ERP_Customer__c erpgenCust1 = new ERP_Customer__c();
            erpgenCust1.Customer_Code__c='T001';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust1.Sales_Org_Code__c = 'A640';
            erpgenCust1.Distribution_Channel_Code__c = '10';
            erpgenCust1.Division_Code__c = '02';
            erpgenCust1.Currency_Code__c = 'USD';
            insert erpgenCust1;
            
            ERP_Relationship__c erprel = new ERP_Relationship__c();
            erprel.ERP_Customer__c=erpgenCust1.id;
            erprel.Related_ERP_Customer__c=erpgenCust.id;
            erprel.Partner_Function_Code__c='WE';
            insert erprel;
            
            
            System.debug('PCPCFROM Test class:-'+eSap2.PCKC__c);
            
            List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
            Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
            priReqItem1.Pricing_Request__c = pricingRequest1.Id;
            priReqItem1.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem1.Scaled_Price_Flag__c = true;
            priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem1.Key_Combination_Code__c = 'A580';
            priReqItem1.Key_Combination__c = 'Material/Sold To/Ship To/Material Price Group/Customer Price Group/Incoterms/Price List Type/Sales Office/Country/Terms of Payment/Material Group 4/Variant/Sales Order Type/Material Group 3/';
            priReqItem1.Customer_Specific__c=true;  
            priReqItem1.PH1_Code__c='F2';
            priReqItem1.PH2_Code__c='WP';
            priReqItem1.PH3_Code__c='PI';
            priReqItem1.PH4_Code__c='11';
            priReqItem1.New_UoM__c=null;
            priReqItem1.New_Per__c=null;
            priReqItem1.New_Unit__c='MP';
            priReqItem1.Material_Code__c = 'D12345';  
            priReqItem1.ShipTo_Code__c='123456';
            priReqItem1.End_User_Code__c='123456';
            //priReqItem1.Calculation_Type__c='Percentage';
            Date d = Date.valueOf(System.now());
            priReqItem1.New_Valid_To__c = d;
            pricingReqItemList.add(priReqItem1);
            
            
            Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
            priReqItem2.Pricing_Request__c = pricingRequest1.Id;
            priReqItem2.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem2.Scaled_Price_Flag__c = true;
            priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem2.Key_Combination_Code__c = 'A580';
            priReqItem2.Key_Combination__c = 'Material/Ship To/Material Price Group/Customer Price Group';
            priReqItem2.Customer_Specific__c=true;  
            priReqItem2.PH1_Code__c='F2';
            priReqItem2.PH2_Code__c='WP';
            priReqItem2.PH3_Code__c='PI';
            priReqItem2.PH4_Code__c='11';
            priReqItem2.New_UoM__c=null;
            priReqItem2.New_Per__c=null;
            priReqItem2.Material_Code__c = 'D12345';  
            priReqItem2.ShipTo_Code__c='123456';
            priReqItem2.End_User_Code__c='123456';
            priReqItem2.New_Valid_To__c = d;
            //priReqItem2.Calculation_Type__c='Percentage';
            pricingReqItemList.add(priReqItem2);
            
            Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
            priReqItem3.Pricing_Request__c = pricingRequest1.Id;
            priReqItem3.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem3.Scaled_Price_Flag__c = true;
            priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem3.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem3.Key_Combination_Code__c = 'A580';
            priReqItem3.Key_Combination__c = 'Material/Sold To/End User/Material Price Group/Customer Price Group';
            priReqItem3.Customer_Specific__c=true;  
            priReqItem3.PH1_Code__c='F2';
            priReqItem3.PH2_Code__c='WP';
            priReqItem3.PH3_Code__c='PI';
            priReqItem3.PH4_Code__c='11';
            priReqItem3.Calculation_Type__c='Percentage';
            priReqItem3.New_UoM__c=null;
            priReqItem3.New_Per__c=null;
            priReqItem3.Material_Code__c = 'D12345';  
            priReqItem3.ShipTo_Code__c='123456';
            priReqItem3.End_User_Code__c='123456';
            priReqItem3.New_Valid_To__c = d;
            pricingReqItemList.add(priReqItem3);
            
            insert pricingReqItemList;
            
            pricingRequest1.Request_Valid_From__c = System.today();
            update pricingRequest1;
            SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
            
            eSap2.Valid_From__c = System.today();
            eSap2.Valid_To__c = System.today()+15;
            update eSap2;
            
            //SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
            
            paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            SalesPriceSAP.request=request;
            SalesPriceSAP.clearViewPoint = 'test';
            SalesPriceSAP.setMaterialGroup5KeyList(new List<SelectOption>() );
            SalesPriceSAP.setSalesDistrictList(new List<SelectOption>() );
            SalesPriceSAP.setMatlGrp1List(new List<SelectOption>() );
            SalesPriceSAP.setCampaignList(new List<SelectOption>() );
            SalesPriceSAP.setDocumentCurrencyList(new List<SelectOption>() );
            SalesPriceSAP.setStateList(new List<SelectOption>() );
            SalesPriceSAP.setStateList(new List<SelectOption>() );
            //SalesPriceSAP.retrievePriceRecords(buOrgGroup);
            
            
            
            //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            
            
            Test.stopTest();
        } 
    }
    
    
    static testMethod void method2_CurrentPrices()
    {
        
        System.debug('Important');
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
         System.debug('Important'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        
        insert u1;
        
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //
        System.runAs(u1){
            
           
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
          
            
            insert profilePermissionList;
            
            
            
            //insert org grp
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            //Date vDue = system.today().addDays(-2);
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
           
            insert pp;
             System.debug('Important'+pp);
            
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            
            insert pcList;
             System.debug('Important'+pcList);
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
          
            insert kcList;
             System.debug('Important'+kcList);
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(
                Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(
                Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
           
            //<SS20220826> creating List orGrp
            List<OrgGroup__c> orGrp = new List<OrgGroup__c>();
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='02');
           
            orGrp.add(orgGroup1);
             orGrp.add(orgGroup2);
            orGrp.add(orgGroup3);
            
            Insert orGrp;
             System.debug('Important'+orGrp);
           // Insert orgGroup2;
           // Insert orgGroup3;
           
           // <SS20220826> creating List keyCombList
            List<ERP_Key_Combination__c> keyCombList = new  List<ERP_Key_Combination__c>();
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            keyCombList.add(keyCombObj1);
            keyCombList.add(keyCombObj2);
            Insert keyCombList;
            //Insert keyCombObj1;
            //Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            Insert priCondObj1;
           // Insert priCondObj2;
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
           insert acSq2;
           //<SS20220826> creating pricingRequestList
            List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>();
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI EMEA Surfaces';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
             pricingRequestList.add(pricingRequest1);  //<SS20220826>
             
             
           // insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI EMEA Surfaces';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
             pricingRequestList.add(pricingRequest2);          //<SS20220826>
             
           // insert pricingRequest2;
            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI EMEA Surfaces';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
             pricingRequestList.add(pricingRequest3);
             
              insert pricingRequestList;                 //<SS20220826>
             System.debug('Important'+pricingRequestList);
           // insert pricingRequest3;
            
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
           //<SS20220826>
           
            buOrgGroup.Business__c=orGrp[0].id;
            buOrgGroup.OrgGroup__c=orGrp[1].id;
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.Default_SalesArea_UoM__c='KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            
            insert buOrgGroup;
             System.debug('Important'+buOrgGroup);
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orGrp[0].id;
            buOrgGroup1.OrgGroup__c=orGrp[2].id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
           // insert buOrgGroup1;
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material';
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombList[0].id;
            insert access;
            
            // <SS20220826>
            List<ERP_Customer_Material_Key__c> custKeyList = new List<ERP_Customer_Material_Key__c> ();
            ERP_Customer_Material_Key__c custKey = new ERP_Customer_Material_Key__c();
            custKey.type__C = 'Customer Price Group';
            custKey.Status__c='Active';
            custKeyList.add(custKey);
            ERP_Customer_Material_Key__c custKey1 = new ERP_Customer_Material_Key__c();
            custKey1.type__C = 'Incoterms';
            custKey1.Status__c='Active';
            custKeyList.add(custKey1);
            
            ERP_Customer_Material_Key__c custKey2 = new ERP_Customer_Material_Key__c();
            custKey2.type__C = 'Material Price Group';
            custKey2.Status__c='Active';
            custKeyList.add(custKey2);
            
            insert custKeyList; 
            
            list<Org_Group_ERP_Key__c> listOgrKey = new List<Org_Group_ERP_Key__c>();
            
            Org_Group_ERP_Key__c key1 = new Org_Group_ERP_Key__c();
            key1.Organizational_Group_Item__c =  buOrgGroup.id;
            key1.ERP_Cus_Mat_Compt_Key__c = custKeyList[0].id;
            listOgrKey.add(key1);
            insert listOgrKey;     
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());                                                                       
            ERP_Sales_Prices_SAP__c childRecord2=childRecord.clone(false,true);
            //neeha
            
            m.add(childRecord);
            m.add(childRecord2);
            insert m;
            System.debug('Important'+m[1]);
            ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c=priCondObj1.id,
                                                                               Key_Combination_code__c=keyCombList[0].id,Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            //insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
           insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            
            
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
           insert esalesPrice;
           
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D655234';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D1209';
            mat1.ERP_Deletion_Flag__c = false;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1; 
            
            
            
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orGrp[0].id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombList[0].id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; // <SS20220826>
            request.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequestList[0].Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'ViewCustomerPrices';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Current Prices';
            paServiceState.currentRequest=request;
            
            
            PARequest request2= new PARequest(paServiceState);
            request2.pricingCondition=new PAPricingCondition(paServiceState);
            request2.keyCombination=new PAKeyCombination(paServiceState);
            request2.keyCombination.keyCombinationId=keyCombList[0].id;
            request2.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request2.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; //<SS20220826> pricingRequestList[0]
            request2.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request2.pricingRequest.Sales_Org_Code__c=pricingRequestList[0].Sales_Org_Code__c;
            request2.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            request2.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            
            PARequest request3= new PARequest(paServiceState);
            request3.pricingCondition=new PAPricingCondition(paServiceState);
            request3.keyCombination=new PAKeyCombination(paServiceState);
            request3.keyCombination.keyCombinationId=keyCombList[0].id;
            request3.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request3.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; //<SS20220826>
            request3.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request3.pricingRequest.Sales_Org_Code__c=pricingRequestList[0].Sales_Org_Code__c;
            request3.pricingRequest.Request_Type__c = 'Massive';
            //request.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            request3.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            
            PARequest request4= new PARequest(paServiceState);
            request4.pricingCondition=new PAPricingCondition(paServiceState);
            request4.keyCombination=new PAKeyCombination(paServiceState);
            request4.keyCombination.keyCombinationId=keyCombList[0].id;
            request4.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            request4.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; //<SS20220826>
            request4.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request4.pricingRequest.Sales_Org_Code__c=pricingRequestList[0].Sales_Org_Code__c;
            request4.pricingRequest.Request_Type__c = 'Import';
            //request.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            request4.pricingRequest.Due_date__c=pricingRequestList[0].Due_date__c;
            
            PARequest request1= new PARequest(paServiceState);
            request1.pricingCondition=new PAPricingCondition(paServiceState);
            request1.keyCombination=new PAKeyCombination(paServiceState);
            request1.keyCombination.keyCombinationId=keyCombList[1].id;
            request1.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            request1.pricingRequest.Dist_Channel_Code__c=pricingRequestList[2].Dist_Channel_Code__c; // <SS20220826>
            request1.pricingRequest.Division_Code__c=pricingRequestList[2].Division_Code__c;
            request1.pricingRequest.Sales_Org_Code__c =pricingRequestList[2].Sales_Org_Code__c;
            request1.pricingRequest.Request_Type__c= 'Customer Specific';
            request1.pricingRequest.Due_date__c=pricingRequestList[2].Due_date__c;
            
            PARequest request6= new PARequest(paServiceState);
            request6.pricingCondition=new PAPricingCondition(paServiceState);
            request6.keyCombination=new PAKeyCombination(paServiceState);
            request6.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; //<SS20220826>
            request6.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request6.pricingRequest.Sales_Org_Code__c =pricingRequestList[0].Sales_Org_Code__c;
            request6.requestServiceState.ogItems.selectedBU=orGrp[0].id;
            request6.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request6.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request6.customer.paERPCustomer.Division_Code__c='02';
            request6.customer.paERPCustomer.Customer_code__c='123456';
            request6.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request6.keyCombination.PCLselectedKeyCombination=new list<String>();
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombList[0].id);
            request6.keyCombination.PCLselectedKeyCombination.add(keyCombList[1].id);
            request6.pricingRequest.Due_date__c=system.today();
            
            PARequest request7= new PARequest(paServiceState);
            request7.pricingCondition=new PAPricingCondition(paServiceState);
            request7.keyCombination=new PAKeyCombination(paServiceState);
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; //<SS20220826>
            request7.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequestList[0].Sales_Org_Code__c;
            
            request7.pricingCondition.PCLselectedPricingCondition=new list<String>();
            request7.keyCombination.PCLselectedKeyCombination=new list<String>();
            request7.pricingRequest.Due_date__c=system.today();
            request7.pricingRequest.Dist_Channel_Code__c=pricingRequestList[0].Dist_Channel_Code__c; //<SS20220826>
            request7.pricingRequest.Division_Code__c=pricingRequestList[0].Division_Code__c;
            request7.pricingRequest.Sales_Org_Code__c =pricingRequestList[0].Sales_Org_Code__c;
            request7.requestServiceState.ogItems.selectedBU=orGrp[0].id;
            request7.customer.paERPCustomer.Sales_Org_Code__c='A640';
            request7.customer.paERPCustomer.Distribution_Channel_Code__c='10';
            request7.customer.paERPCustomer.Division_Code__c='02';
            request7.customer.paERPCustomer.Customer_code__c='123456';
            
            request.selectedBU=[select Business__c FROM OrgGroup__c WHERE id=:orGrp[0].id].id;
            System.debug('Important'+request.selectedBU);
            
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequestList[0];                      // <SS20220826>
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(bu__C='BI EMEA Surfaces',sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            SalesPriceSAP.relatedWrappersList = relatedList;
            System.debug('Important'+SalesPriceSAP.relatedWrappersList);
            
            
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            Test.startTest();
            try
            {
                
                SalesPriceSAP.getListWrappers();
                System.debug('Important'+ SalesPriceSAP.getListWrappers());
            }
            catch(Exception e)
            {
            }
            request.viewCustomerPrices = '';
            try
            {
                SalesPriceSAP.getListWrappers();
                 System.debug('Important'+ SalesPriceSAP.getListWrappers());
            }
            catch(Exception e )
            {
            }
            
            try
            {
                request.currentPricesSelection = 'Last Valid Prices';
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffsetback');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','AddSelectedPricesFetchRecords');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','ViewCustomerPrices');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','PCLfetch');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            
            
            
            try
            {
                
                SalesPriceSAP.validate('AddSelectedPrices');
                SalesPriceSAP.validate('AddRequestItems');
                //SalesPriceSAP.validate('#');
                SalesPriceSAP.relatedWrappersList = new List<PARelatedList>();
                SalesPriceSAP.validate('AddSelectedPrices');
                SalesPriceSAP.validate('AddRequestItems');
                SalesPriceSAP.validate('#');
                
                
                SalesPriceSAP.getVariantList();
                SalesPriceSAP.getsalesOrderTypeList();
                
                
                
                
                List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
                Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
                priReqItem1.Pricing_Request__c =  pricingRequestList[0].Id;  //<SS20220826>
                priReqItem1.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
                priReqItem1.Scaled_Price_Flag__c = true;
                priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
                priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
                priReqItem1.Key_Combination_Code__c = 'A580';
                priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
                priReqItem1.Customer_Specific__c=true;  
                priReqItem1.PH1_Code__c='F2,';
                priReqItem1.PH2_Code__c='WP,';
                priReqItem1.PH3_Code__c='PI,';
                priReqItem1.PH4_Code__c='11,';
                priReqItem1.Material_Code__c = 'D12345';      
                Date d = Date.valueOf(System.now());
                priReqItem1.New_Valid_To__c = d;
                pricingReqItemList.add(priReqItem1);
                
                Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
                priReqItem2.Pricing_Request__c =  pricingRequestList[0].Id;  //<SS20220826>
                priReqItem2.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
                priReqItem2.Scaled_Price_Flag__c = true;
                priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
                priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
                priReqItem2.Key_Combination_Code__c = 'A580';
                priReqItem2.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Incoterms';
                priReqItem2.Customer_Specific__c=true;  
                priReqItem2.PH1_Code__c='F2,';
                priReqItem2.PH2_Code__c='WP,';
                priReqItem2.PH3_Code__c='PI,';
                priReqItem2.PH4_Code__c='11,';
                priReqItem2.Material_Code__c = 'D12345';      
                
                priReqItem2.New_Valid_To__c = d;
                pricingReqItemList.add(priReqItem2);
                
                Pricing_Request_Item__c priReqItem23 = new Pricing_Request_Item__c();
                priReqItem23.Pricing_Request__c = pricingRequestList[0].Id;  //
                priReqItem23.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
                priReqItem23.Scaled_Price_Flag__c = true;
                priReqItem23.Pricing_Condition_Code__c = 'ZPSE';
                priReqItem23.Pricing_Condition__c = 'Surfaces Gross Price';
                priReqItem23.Key_Combination_Code__c = 'A580';
                priReqItem23.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Material Price Group';
                priReqItem23.Customer_Specific__c=true;  
                priReqItem23.PH1_Code__c='F2,';
                priReqItem23.PH2_Code__c='WP,';
                priReqItem23.PH3_Code__c='PI,';
                priReqItem23.PH4_Code__c='11,';
                priReqItem23.Material_Code__c = 'D12345';      
                
                priReqItem23.New_Valid_To__c = d;
                pricingReqItemList.add(priReqItem23);
                
                
                insert pricingReqItemList;
                SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequestList[0]); //<SS20220826>
                
                paERPCustomer = new ERP_Customer__c();
                paERPCustomer.Sales_Org_Code__c='A640';
                paERPCustomer.Distribution_Channel_Code__c = '10';
                paERPCustomer.Division_Code__c = '02';
                paERPCustomer.Customer_code__c = '123456';
                paERPCustomer.Sales_Org_Code__c = 'A640';
                insert paERPCustomer;
                
                request.customer.paERPCustomer = paERPCustomer;
                SalesPriceSAP.request=request;
                SalesPriceSAP.retrievePriceRecords(buOrgGroup);
                
                
                
                //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            }
            catch(Exception e)
            {
            }     
            
          Test.stopTest();  
            
        }
    }
    
    
    static testMethod void test1()
    {
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        System.runAs(u1){
            test_PASalesPriceSAP.insertQueryRecords();
            test_PASalesPriceSAP.insertKeyCutomSettings();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
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
                                                    Calculation_Type__c='B' ,Price_Types__c='Permanent'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPNG',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B' ,Price_Types__c='Permanent',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPR9',Price_Types__c='Permanent'));
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
            
            
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>();   //AB20210301                   
           
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            orgGroupList.add(orgGroup1) ;  //AB20210301    
            orgGroupList.add(orgGroup2) ;  //AB20210301    
            orgGroupList.add(orgGroup3) ;  //AB20210301    
            insert orgGroupList;  //AB20210301    
            
            List<ERP_Key_Combination__c> keyCombObjList = new List<ERP_Key_Combination__c>();   //AB20210301    
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            keyCombObjList.add(keyCombObj1) ;  //AB20210301   
            keyCombObjList.add(keyCombObj2) ;  //AB20210301   
            insert keyCombObjList;
            
            List<ERP_Pricing_Condition__c> priCondObjList = new List<ERP_Pricing_Condition__c>();   //AB20210301    
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',Price_Types__c='Permanent',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',Price_Types__c='Permanent',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
            priCondObjList.add(priCondObj1) ;  //AB20210301
            priCondObjList.add(priCondObj2) ;  //AB20210301
            insert priCondObjList;
            
            ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
                Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
            insert procedure;
            
            ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material');
            
            insert acSq2;
            
            
            List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>();   //AB20210301    
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Due_date__c=vf;
            
            pricingRequestList.add( pricingRequest1);//AB20210301  
            
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Permanent';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c = null;
            pricingRequest2.Dist_Channel_Code__c = '10';
            pricingRequest2.Division_Code__c = '02';
            pricingRequest2.SoldTo_Code__c = 'T001';
            pricingRequest2.Due_date__c=vf;
            pricingRequestList.add( pricingRequest2);//AB20210301  

            Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
            pricingRequest3.Pricing_Request_Type__c = 'Permanent';
            pricingRequest3.Request_Type__c = 'Customer Specific';
            pricingRequest3.BU__c = 'BI';
            pricingRequest3.Sales_Org_Code__c = 'A680';
            pricingRequest3.Dist_Channel_Code__c = '20';
            pricingRequest3.Division_Code__c = '021';
            pricingRequest3.SoldTo_Code__c = 'T001';
            pricingRequest3.Due_date__c=vf;
            pricingRequestList.add( pricingRequest3);//AB20210301  
            
            insert pricingRequestList;//AB20210301  
            
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
            
            try
            {
                SalesPriceSAP.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
            }
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
            /*
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
            test.startTest();
            SalesPriceSAP3.relatedWrappersList=new list<PARelatedList>();
            try{
                //SalesPriceSAP3.getListWrappers();  TCS Team_001
                
            }
            catch(Exception e){
                
            }*/
            
            
        }
        
    }
    
    static testMethod void method3_Expired_Prices()
    { Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
     //system.debug('#### p1'+p1);<AB20210301>
     // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
     UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
     
     
     User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
     
     insert u1;
     //creating RecordType
     RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
     //Test.startTest();
     System.runAs(u1){
         insertQueryRecords();
         List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
         profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
         profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
         profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
         profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
         profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
         insert profilePermissionList;
         
         
         //insert org grp
         Date vf = system.today();
         Date vt = system.today()+5;
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
         
         ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(
             Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
             Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
             Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
             Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
         
         insert acSq;
         ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                   Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                   Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
         
         insert acSq1;
         
         List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>  
         OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
         //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
         OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
         OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
         orgGroupList.add(orgGroup1) ;//<AB20210301>  
         orgGroupList.add(orgGroup2) ;//<AB20210301>  
         orgGroupList.add(orgGroup3) ;//<AB20210301>  
         insert orgGroupList;//<AB20210301>  
         
         List<ERP_Key_Combination__c> keyCombObjList = new List<ERP_Key_Combination__c>(); //<AB20210301> 
         ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
         ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
         keyCombObjList.add(keyCombObj1) ;//<AB20210301>  
         keyCombObjList.add(keyCombObj2) ;//<AB20210301>
         insert keyCombObjList;//<AB20210301>  
         
         List<ERP_Pricing_Condition__c> priCondObjList = new List<ERP_Pricing_Condition__c>(); //<AB20210301> 
         ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
         ERP_Pricing_Condition__c priCondObj2 = new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZD91',Pricing_Condition__c='Discount',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
         priCondObjList.add(priCondObj1) ;//<AB20210301>  
         priCondObjList.add(priCondObj2) ;//<AB20210301>  
         insert priCondObjList;//<AB20210301>  
         
         ERP_Procedure_Conditions__c procedure =new ERP_Procedure_Conditions__c(
             Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=priCondObj1.id);
         insert procedure;
         
         ERP_Access_Sequence__c acSq2 = new ERP_Access_Sequence__c(Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                   Pricing_Condition__c=priCondObj1.id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                   Pricing_Key_Combination__c=keyCombObj1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
         
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
         
         pricingRequestList.add(pricingRequest1); //<AB20210301>
         
         Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
         pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
         pricingRequest2.Request_Type__c = 'Customer Specific';
         pricingRequest2.BU__c = 'BI';
         pricingRequest2.Sales_Org_Code__c = null;
         pricingRequest2.Dist_Channel_Code__c = '10';
         pricingRequest2.Division_Code__c = '02';
         pricingRequest2.SoldTo_Code__c = 'T001';
         pricingRequest2.Due_date__c=vf;
         pricingRequestList.add(pricingRequest2); //<AB20210301>
         
         Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
         pricingRequest3.Pricing_Request_Type__c = 'Permanent';
         pricingRequest3.Request_Type__c = 'Customer Specific';
         pricingRequest3.BU__c = 'BI';
         pricingRequest3.Sales_Org_Code__c = 'A680';
         pricingRequest3.Dist_Channel_Code__c = '20';
         pricingRequest3.Division_Code__c = '021';
         pricingRequest3.SoldTo_Code__c = 'T001';
         pricingRequest3.Due_date__c=vf;
         pricingRequestList.add(pricingRequest3); //<AB20210301>
         insert pricingRequestList; //<AB20210301>
         
         Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
         buOrgGroup.Business__c=orgGroup1.id;
         buOrgGroup.OrgGroup__c=orgGroup2.id;
         buOrgGroup.ERP_Currency__c='EUR;USD';
         buOrgGroup.ERP_UoM__c='BG;KG';
         buOrgGroup.Default_SalesArea_UoM__c='KG';
         buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
         buOrgGroup.Retroactive_Limit__c=0;
         
         insert buOrgGroup;
         Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
         buOrgGroup1.Business__c=orgGroup1.id;
         buOrgGroup1.OrgGroup__c=orgGroup3.id;
         buOrgGroup1.ERP_Currency__c='EUR;USD';
         buOrgGroup1.ERP_UoM__c='BG;KG';
         buOrgGroup1.Default_SalesArea_UoM__c='KG';
         buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
         buOrgGroup1.Retroactive_Limit__c=30;
         insert buOrgGroup1;
         ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
         access.Pricing_Condition__c=priCondObj1.id;
         access.Sales_Pricing_Procedure__c=pp.id;
         access.Pricing_Key_Combination__c=keyCombObj1.id;
         access.Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material';
         insert access;
         
         
         
         list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
         ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                            Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                            Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                            sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                            SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                            Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                            Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
         insert holderRecord;
         ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                            Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                            sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                            SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                            Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                            Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
         insert childRecord1; 
         
         list<String> a=new list<String>();
         a.add('india');
         //list<selectoption> a1=new list<selectoption>();
         //a1.add('india');
         
         
         
         Sales_Prices__c salesPrice1 = new Sales_Prices__c();
         salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
         salesPrice1.SAP_Cluster__c ='CB1';
         salesPrice1.SAP_Client_Id__c='510';
         salesPrice1.SAP_Application_Id__c='V';
         salesPrice1.key_Combination_Code__c='A580';
         //salesPrice1.Price_Holder__c = ;
         salesPrice1.markForDeletion__c =false;
         salesPrice1.Sales_Price_Type__c='Floor';
         salesPrice1.Pricing_Condition_Code__c='ZPSE';
         salesPrice1.Sales_Org_Code__c='A640';
         salesPrice1.Dist_Channel_Code__c= '10';
         salesPrice1.Division_Code__c= '02';
         salesPrice1.Sold_To_Code__c='123456';
         salesPrice1.Material_Code__c ='D1209';
         insert salesPrice1;
         
         
         
         
         Sales_Prices__c salesPrice = new Sales_Prices__c();
         salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
         salesPrice.SAP_Cluster__c ='CB1';
         salesPrice.SAP_Client_Id__c='510';
         salesPrice.SAP_Application_Id__c='V';
         salesPrice.key_Combination_Code__c='A580';
         salesPrice.Price_Holder__c = salesPrice1.id;
         salesPrice.Pricing_Condition_Code__c='ZPSE';
         salesPrice.markForDeletion__c =false;
         salesPrice.Sales_Price_Type__c='Floor';
         salesPrice.Sales_Org_Code__c='A640';
         //salesPrice.Product_Hierarchy_Code__c='';
         salesPrice.Dist_Channel_Code__c= '10';
         salesPrice.Division_Code__c= '02';
         salesPrice.Sold_To_Code__c='123456';
         salesPrice.Material_Code__c ='D1209';
         insert salesPrice;
         
         
         //ERP Sales Price SAP
         
         
         ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
         esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
         esalesPrice1.SAP_Cluster__c ='CB1';
         esalesPrice1.SAP_Client_Id__c='510';
         esalesPrice1.SAP_Application_Id__c='V';
         esalesPrice1.key_Combination_Code__c='A580';
         //salesPrice1.Price_Holder__c = ;
         esalesPrice1.markForDeletion__c =false;
         esalesPrice1.Sales_Price_Type__c='Floor';
         esalesPrice1.Sales_Org_Code__c='A640';
         esalesPrice1.Distribution_Channel_Code__c= '10';
         esalesPrice1.Sales_Price_Type__c = 'Permanent';
         esalesPrice1.Division_Code__c= '02';
         //esalesPrice1.Valid_From__c = System.today()-10;
         //esalesPrice1.Valid_To__c= System.today()-1;
         esalesPrice1.Material_Code__c='D1209';
         insert esalesPrice1;
         
         
         
         
         ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
         esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
         esalesPrice.SAP_Cluster__c ='CB1';
         esalesPrice.SAP_Client_Id__c='510';
         esalesPrice.SAP_Application_Id__c='V';
         esalesPrice.key_Combination_Code__c='A580';
         esalesPrice.Sales_Price_Type__c = 'Permanent';
         esalesPrice.Price_Holder__c = esalesPrice1.id;
         esalesPrice.isPriceHolder__c = false;
         esalesPrice.markForDeletion__c =false;
         esalesPrice.Sales_Price_Type__c='Floor';
         esalesPrice.Sales_Org_Code__c='A640';
         esalesPrice.Distribution_Channel_Code__c= '10';
         esalesPrice.Division_Code__c= '02';
         esalesPrice.Material_Code__c='D1209';
         insert esalesPrice;
         
         //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
         //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
         Material__C mat1 = new material__C();
         mat1.ERP_Material_Code__c='D655234';
         mat1.ERP_Source_Cluster__c='CB1';
         mat1.ERP_Sales_Org_Code__c='A640';
         mat1.ERP_Distribution_Channel_Code__c='10';
         mat1.External_ERP_ID__c='A640';
         mat1.External_ERP_ID__c='CB1-A640-10-D1209';
         mat1.ERP_Deletion_Flag__c = false;
         mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
         insert mat1;
         
         
         
         
         PAServiceState paServiceState = new PAServiceState();
         paServiceState.ogitems=new PAOrganizationalGroupItems(); 
         paServiceState.ogitems.selectedBU=orgGroup1.Id;
         
         paServiceState.ogitems.listSelectedCPG=new List<String>();
         paServiceState.ogitems.listSelectedIncoterms=new List<String>();
         paServiceState.ogitems.listSelectedSO=new List<String>();
         paServiceState.ogitems.listSelectedPLType=new List<String>();
         paServiceState.ogitems.listSelectedCountry=new List<String>();
         paServiceState.ogitems.listSelectedCountry=new List<String>();
         paServiceState.ogitems.listSelectedMG4=new List<String>();
         paServiceState.ogitems.listSelectedMG4=new List<String>();
         paServiceState.ogitems.listSelectedTOP=new List<String>();
         paServiceState.ogitems.listSelectedVariant=new List<String>();
         paServiceState.ogitems.listSelectedSOT=new List<String>();
         
         
         PARequest request= new PARequest(paServiceState);
         request.pricingCondition=new PAPricingCondition(paServiceState);
         request.keyCombination=new PAKeyCombination(paServiceState);
         request.keyCombination.keyCombinationId=keyCombObj1.id;
         request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
         
         //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
         request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
         request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
         request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
         request.pricingRequest.Request_Type__c = 'Customer Specific';
         //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
         request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
         request.materialFilter='D1209,materialused';
         //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
         request.requestServiceState.ogItems.listSelectedCountry=a;
         request.requestServiceState.ogItems.listSelectedMG3=a;
         request.requestServiceState.ogItems.listSelectedPLType=a;  
         request.requestServiceState.ogItems.listSelectedMG4=a;
         request.requestServiceState.ogItems.listSelectedCPG=a;
         request.requestServiceState.ogItems.listSelectedMPG=a;
         request.viewCustomerPrices = 'ViewCustomerPrices';
         ERP_Customer__c paERPCustomer = new ERP_Customer__c();
         paERPCustomer.Sales_Org_Code__c='A640';
         paERPCustomer.Distribution_Channel_Code__c = '10';
         paERPCustomer.Division_Code__c = '02';
         paERPCustomer.Customer_code__c = '123456';
         paERPCustomer.Sales_Org_Code__c = 'A640';
         insert paERPCustomer;
         
         request.customer.paERPCustomer = paERPCustomer;
         request.customer.currentPrices='ExpOnly';
         //request.currentPricesSelection = 'Current Prices';
         request.currentPricesSelection = 'Current Prices';
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
         
         PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
         request.pricingRequest = pricingRequest1;
         SalesPriceSAP.request=request;
         List<PARelatedList> relatedList = new List<PARelatedList>();
         List<PAWrapper> wrapperList = new List<PAWrapper>();
         
         ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                        Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                        Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                        sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                        SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                        Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                        Scaled_Price_Flag__c=false,
                                                                        Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
         
         PAWrapper wrap = new PAWrapper();
         wrap.sobjectRecord  = esapRcrd;
         wrap.isSelected = true;
         wrapperList.add(wrap);
         PARelatedList relList = new PARelatedList();
         relList.wrapperList = wrapperList;
         relatedList.add(relList);
         SalesPriceSAP.relatedWrappersList = relatedList;
         List<SelectOption> countries = SalesPriceSAP.getCountryList();
         SalesPriceSAP.setCountryList(new List<SelectOption>());
         List<SelectOption> endusr = SalesPriceSAP.getEndUseList();
         
         SalesPriceSAP.setEndUseList(new List<SelectOption>());
         
         Test.startTest();      
         List<SelectOption> market = SalesPriceSAP.getMarketSegmentList();
         SalesPriceSAP.setMarketSegmentList(new List<SelectOption>());
         List<SelectOption> terms =SalesPriceSAP.getTermsOfPaymentList();
         SalesPriceSAP.setTermsOfPaymentList(new List<SelectOption>());
        
         
         
         //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
         //SalesPriceSAP.validate('AddRequestItems');
         
         
         try
         {
             request.currentPricesSelection = 'Expired Prices';
             SalesPriceSAP.getListWrappers();
         }
         catch(Exception e )
         {
         }
         
         try
         {
             request.currentPricesSelection = 'Expiring30';
             SalesPriceSAP.getListWrappers();
         }
         catch(Exception e )
         {
         }
         
         holderRecord.valid_from__c=system.today()-10;
         holderRecord.valid_to__c=system.today()-5;
         update holderRecord;
         try
         {
             request.currentPricesSelection = 'Expired Prices';
             SalesPriceSAP.getListWrappers();
         }
         catch(Exception e )
         {
         }
         try
         {
             request.currentPricesSelection = 'Last Valid Prices';
             SalesPriceSAP.getListWrappers();
         }
         catch(Exception e )
         {
         }
         
         try
         {
             request.currentPricesSelection = 'Expiring60';
             SalesPriceSAP.getListWrappers();
         }
         catch(Exception e )
         {
         }
         
         try
         {
             request.currentPricesSelection = 'Expiring90';
             SalesPriceSAP.getListWrappers();
             
         }
         catch(Exception e )
         {
         }
         
         
         Test.stopTest(); 
         
     }
    }
    
    static testMethod void method3_Expired_Prices_1()
    {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        
        
        
        
        
        
        
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            insertQueryRecords();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            
            //insert org grp
            Date vf = system.today();
            Date vt = system.today()+5;
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
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
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
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.Default_SalesArea_UoM__c='KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
            insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            //esalesPrice1.Valid_From__c = System.today()-10;
            //esalesPrice1.Valid_To__c= System.today()-1;
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            
            
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
            insert esalesPrice;
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D655234';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D1209';
            mat1.ERP_Deletion_Flag__c = false;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1;
            
            
            
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'ViewCustomerPrices';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Current Prices';
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
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequest1;
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            SalesPriceSAP.relatedWrappersList = relatedList;
            Test.startTest();      
            
            List<SelectOption> countries = SalesPriceSAP.getCountryList();
            SalesPriceSAP.setCountryList(new List<SelectOption>());
            List<SelectOption> endusr = SalesPriceSAP.getEndUseList();
            SalesPriceSAP.setEndUseList(new List<SelectOption>());
            List<SelectOption> market = SalesPriceSAP.getMarketSegmentList();
            SalesPriceSAP.setMarketSegmentList(new List<SelectOption>());
            List<SelectOption> terms =SalesPriceSAP.getTermsOfPaymentList();
            SalesPriceSAP.setTermsOfPaymentList(new List<SelectOption>());
            
            
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            
            
            try
            {
                SalesPriceSAP.action('','','ViewCustomerPrices');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','PCLfetch');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            
            
            
            try
            {
                
                SalesPriceSAP.validate('AddSelectedPrices');
                SalesPriceSAP.validate('AddRequestItems');
                //SalesPriceSAP.validate('#');
                SalesPriceSAP.relatedWrappersList = new List<PARelatedList>();
                SalesPriceSAP.validate('AddSelectedPrices');
                SalesPriceSAP.validate('AddRequestItems');
                SalesPriceSAP.validate('#');
                
                
                SalesPriceSAP.getVariantList();
                SalesPriceSAP.getsalesOrderTypeList();
                
                
                
                
                List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
                Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
                priReqItem1.Pricing_Request__c = pricingRequest1.Id;
                priReqItem1.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
                priReqItem1.Scaled_Price_Flag__c = true;
                priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
                priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
                priReqItem1.Key_Combination_Code__c = 'A580';
                priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
                priReqItem1.Customer_Specific__c=true;  
                priReqItem1.PH1_Code__c='F2,';
                priReqItem1.PH2_Code__c='WP,';
                priReqItem1.PH3_Code__c='PI,';
                priReqItem1.PH4_Code__c='11,';
                priReqItem1.Material_Code__c = 'D12345';      
                Date d = Date.valueOf(System.now());
                priReqItem1.New_Valid_To__c = d;
                pricingReqItemList.add(priReqItem1);
                insert pricingReqItemList;
                SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
                
                paERPCustomer = new ERP_Customer__c();
                paERPCustomer.Sales_Org_Code__c='A640';
                paERPCustomer.Distribution_Channel_Code__c = '10';
                paERPCustomer.Division_Code__c = '02';
                paERPCustomer.Customer_code__c = '123456';
                paERPCustomer.Sales_Org_Code__c = 'A640';
                paERPCustomer.Customer_Price_Group_Code__c = 'test';
                insert paERPCustomer;
                
                request.customer.paERPCustomer = paERPCustomer;
                SalesPriceSAP.request=request;
                SalesPriceSAP.retrievePriceRecords(buOrgGroup);
                
                
                
                //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            }
            catch(Exception e)
            {
            }     
            
            
            Test.stopTest();
        }
    }
    static testMethod void method3_Expiring()
    {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        
        
        
        
        
        
        
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            insertQueryRecords();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            
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
            
            
            
            
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            //OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='A640',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup3 = new OrgGroup__c(ERP_Sales_Org_Code__c='A680',ERP_Distribution_Channel_Code__c='20',ERP_Division_Code__c='021');
            Insert orgGroup1;
            Insert orgGroup2;
            Insert orgGroup3;
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
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
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.Default_SalesArea_UoM__c='KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
            insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            
            
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
            insert esalesPrice;
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D655234';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D1209';
            mat1.ERP_Deletion_Flag__c = false;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1;
            
            
            
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'Expiring';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Current Prices';
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
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequest1;
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            Test.startTest();      
            
            SalesPriceSAP.relatedWrappersList = relatedList;
            
            List<selectOption> getCpgList=SalesPriceSAP.getCpgList();
            SalesPriceSAP.setCpgList(new List<selectOption>());
            List<selectOption> inco = SalesPriceSAP.getIncotermsList();
            SalesPriceSAP.setIncotermsList(new List<selectOption>());
            List<selectOption> mpglist = SalesPriceSAP.getMpgList();
            SalesPriceSAP.setMpgList(new List<selectOption>());
            List<SelectOption> salesofc =  SalesPriceSAP.getSalesOfficeList();
            SalesPriceSAP.setSalesOfficeList(new List<selectOption>());
            List<SelectOption> prclst = SalesPriceSAP.getPriceListTypeList();
            SalesPriceSAP.setPriceListTypeList(new List<selectOption>());
            
            //SalesPriceSAP.PASalesPriceSAP(new PARequest());
            SalesPriceSAP.getListBusinessComponents();
            SalesPriceSAP.getListOptions();
            
            
            List<selectOption> opts = SalesPriceSAP.getCpgList();
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            
            try
            {
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e)
            {
            }
            request.viewCustomerPrices = 'Expiring';
            try
            {
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            try
            {
                request.currentPricesSelection = 'Expiring';
                SalesPriceSAP.getListWrappers();
            }
            catch(Exception e )
            {
            }
            
            
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','FetchRecordswithOffsetback');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','AddSelectedPricesFetchRecords');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','ViewCustomerPrices');
            }
            catch(Exception e)
            {
            }
            try
            {
                SalesPriceSAP.action('','','PCLfetch');
            }
            catch(Exception e)
            {
            }
            
            try
            {
                SalesPriceSAP.action('','','AddRequestItems');
            }
            catch(Exception e)
            {
            }
            
            
            
            try
            {
                
                SalesPriceSAP.validate('AddSelectedPrices');
                SalesPriceSAP.validate('AddRequestItems');
                //SalesPriceSAP.validate('#');
                SalesPriceSAP.relatedWrappersList = new List<PARelatedList>();
                SalesPriceSAP.validate('AddSelectedPrices');
                SalesPriceSAP.validate('AddRequestItems');
                SalesPriceSAP.validate('#');
                
                
                SalesPriceSAP.getVariantList();
                SalesPriceSAP.getsalesOrderTypeList();
                
                
                
                
                List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
                Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
                priReqItem1.Pricing_Request__c = pricingRequest1.Id;
                priReqItem1.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
                priReqItem1.Scaled_Price_Flag__c = true;
                priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
                priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
                priReqItem1.Key_Combination_Code__c = 'A580';
                priReqItem1.Key_Combination__c = 'Material/Material Price Group/PH1/PH2/PH3/PH4/Customer Price Group';
                priReqItem1.Customer_Specific__c=true;  
                priReqItem1.PH1_Code__c='F2,';
                priReqItem1.PH2_Code__c='WP,';
                priReqItem1.PH3_Code__c='PI,';
                priReqItem1.PH4_Code__c='11,';
                priReqItem1.Material_Code__c = 'D12345';      
                Date d = Date.valueOf(System.now());
                priReqItem1.New_Valid_To__c = d;
                pricingReqItemList.add(priReqItem1);
                insert pricingReqItemList;
                SalesPriceSAP.cloneValidation(pricingReqItemList,pricingRequest1);
                
                paERPCustomer = new ERP_Customer__c();
                paERPCustomer.Sales_Org_Code__c='A640';
                paERPCustomer.Distribution_Channel_Code__c = '10';
                paERPCustomer.Division_Code__c = '02';
                paERPCustomer.Customer_code__c = '123456';
                paERPCustomer.Sales_Org_Code__c = 'A640';
                insert paERPCustomer;
                
                request.customer.paERPCustomer = paERPCustomer;
                SalesPriceSAP.request=request;
                SalesPriceSAP.retrievePriceRecords(buOrgGroup);
                
                
                
                //SalesPriceSAP.relatedWrappersList=SalesPriceSAP1.getListWrappers();
            }
            catch(Exception e)
            {
            }     
            
            
            Test.stopTest();
        }
    }
    
    public static testMethod void insertQueryRecords()
    {   //<SS20220826>-- added query for sales order item and sales order item code 
        List<PAQuery__c> paQueyrList = new List<PAQuery__c>();
        PAQuery__c paquery1 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT SELECT Id, OwnerId, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, Approved_Date__c, BU__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Discount__c, Dist_Channel__c, Distribution_Channel_Code__c, Division_Code__c, Division__c, End_User_Code__c, End_User__c, External_ERP_ID__c, Key_Combination_Code__c, Key_Combination__c, Material_Code__c, Material__c, Per__c, Price_Holder__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request__c, Quantity__c, Rate__c, Sales_Org_Code__c, Sales_Org__c, Sales_Pricing_Procedure__c, Sold_To_Code__c, Sold_To__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, isPriceHolder__c FROM Rebate_Quote_Price__c',Variable__c='salesPriceRPQRecordsList');
        PAQuery__c paquery2 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT BU__c,Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,PCKC__C, Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Id,Name,Country_Code__c, Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c, Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Condition_Class__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c, Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c, PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c, PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,markForDeletion__c, Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Condition_Class_Code__c, Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,Calculation_Type__c, SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c, ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Calculation_Type_Code__c, Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c, Check_Scale_Code__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c, Plus_Minus_Code__c,Plus_Minus__c,Volume__c,Volume_UoM__c, Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='salesPriceRecordsList');
        PAQuery__c paquery3 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT Id,Name,Country_Code__c,PCKC__c ,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c, Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c, Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c, PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c, Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c, Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c, ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c, ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c, ScaleRate9__c,ScaleRate10__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c, SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c, ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c, Price_Holder__c,Volume__c,Volume_UoM__c,Pricing_Request__c,Pricing_Request__r.Name,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='erpSalesPriceSAP');
        PAQuery__c paquery4 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c, Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c, Reference_Key_Combination__c, Reference_Pricing_Condition__c,isPaymentTermsApplicable__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c',Variable__c='accessSeqObj');
        PAQuery__c paquery5 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT Ship_To_Country__c,PCKC__c ,Ship_To_Country_Code__c,Terms_of_Payment__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,SAP_Cluster__c, Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c, End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c, Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c, PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c, PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c, Profit_Center_Code__c,project_id__C,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c, Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c, SAP_Application_Id__c,SAP_Client_ID__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c, ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c, ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c, Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c, Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, PCKC__C,Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='salespriceobj');
        PAQuery__c paquery6 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT Contract__c, Contract_Code__c, Ship_To_Country_Code__c, Ship_To_Country__c, ShipTo__c, ShipTo_Code__c, Calculation_Type_Code__c,Calculation_Type__c,Condition_Class_Code__c,Condition_Class__c,Plus_Minus_Code__c,Plus_Minus__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c, Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,Incoterms_1_Code__c,Incoterms1__c,Market_Segment__c,Market_Segment_Code__c,Project__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,Sales_Order_Type_Code__c,Sales_Order_Item__c,Sales_Order_Item_Code__c, Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c, PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c, Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c, Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Terms_of_Payment_Code__c,Unit__c,UoM__c, Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c, ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM Sales_Prices__c',Variable__c='salesPriceNonSAP');
        
        paQueyrList.add(paquery1);
        paQueyrList.add(paquery2);
        paQueyrList.add(paquery3);
        paQueyrList.add(paquery4);
        paQueyrList.add(paquery5);
        paQueyrList.add(paquery6);
        
        insert paQueyrList;
    }
    
    
    public static testMethod void insertKeyCutomSettings()
    {  //<SS20220826>-- added query for sales order item and sales order item code 
        List<KeyFieldLabelAPIName__c> listKeys = new list<KeyFieldLabelAPIName__c>();
        //KeyFieldLabelAPIName__c key1 = new KeyFieldLabelAPIName__c(apiName__c='Campaign__c',keyField__c='Campaign',name='Campaign');
        KeyFieldLabelAPIName__c key2 = new KeyFieldLabelAPIName__c(apiName__c='Price_Ref_Partner__c',keyField__c='Price Ref. Partner',name='Price Ref. Partner');
        KeyFieldLabelAPIName__c key3 = new KeyFieldLabelAPIName__c(apiName__c='Landing_Cost__c',keyField__c='Landing Cost',name='Landing Cost');
        KeyFieldLabelAPIName__c key4 = new KeyFieldLabelAPIName__c(apiName__c='Price_Ref_Partner_Code__c',keyField__c='Price Ref. Partner',name='Price Ref. Partner Code');
        KeyFieldLabelAPIName__c key5 = new KeyFieldLabelAPIName__c(apiName__c='Document_Currency__c',keyField__c='Document Currency',name='Document Currency');
        KeyFieldLabelAPIName__c key6 = new KeyFieldLabelAPIName__c(apiName__c='Document_Currency_Code__c',keyField__c='Document Currency',name='Document_Currency_Code');
        KeyFieldLabelAPIName__c key7 = new KeyFieldLabelAPIName__c(apiName__c='PH2__c',keyField__c='PH2',name='PH2');
        KeyFieldLabelAPIName__c key8 = new KeyFieldLabelAPIName__c(apiName__c='Material__c',keyField__c='Material',name='Material');
        KeyFieldLabelAPIName__c key9 = new KeyFieldLabelAPIName__c(apiName__c='State_Code__c',keyField__c='State',name='State Code');
        KeyFieldLabelAPIName__c key10 = new KeyFieldLabelAPIName__c(apiName__c='Sales_Order_Type_Code__c',keyField__c='Sales Order Type',name='Sales Order Type Code');
       
        KeyFieldLabelAPIName__c key11 = new KeyFieldLabelAPIName__c(apiName__c='Variant__c',keyField__c='Variant',name='Variant');
        KeyFieldLabelAPIName__c key12 = new KeyFieldLabelAPIName__c(apiName__c='Sales_Office__c',keyField__c='Sales office',name='Sales office');
        KeyFieldLabelAPIName__c key13 = new KeyFieldLabelAPIName__c(apiName__c='Sales_District__c',keyField__c='Sales District',name='Sales District');
        KeyFieldLabelAPIName__c key14 = new KeyFieldLabelAPIName__c(apiName__c='Plant__c',keyField__c='Plant',name='Plant');
        KeyFieldLabelAPIName__c key15 = new KeyFieldLabelAPIName__c(apiName__c='Shipping_Condition__c   ',keyField__c='Shipping Condition',name='Shipping Condition');
        KeyFieldLabelAPIName__c key16=new KeyFieldLabelAPIName__c(apiName__c = 'Terms_Of_Payment__c',keyField__c='Terms of Payment',name='Terms of Payment');
        KeyFieldLabelAPIName__c key17=new KeyFieldLabelAPIName__c(apiName__c = 'PH8__c',keyField__c='PH8',name='PH8');
        KeyFieldLabelAPIName__c key18=new KeyFieldLabelAPIName__c(apiName__c = 'PH2_Code__c',keyField__c='PH2',name='PH2 Code');
        KeyFieldLabelAPIName__c key19=new KeyFieldLabelAPIName__c(apiName__c = 'PH1_Code__c',keyField__c='PH1',name='PH1 Code');
        KeyFieldLabelAPIName__c key20=new KeyFieldLabelAPIName__c(apiName__c = 'PH9_Code__c',keyField__c='PH9',name='PH9 Code');
        KeyFieldLabelAPIName__c key21=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Group_1__c',keyField__c='Material Group 1',name='Material Group 1');
        KeyFieldLabelAPIName__c key22=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Price_Group_Code__c',keyField__c='Material Price Group',name='Material Price Group Code');
        KeyFieldLabelAPIName__c key23=new KeyFieldLabelAPIName__c(apiName__c = 'Market_Segment_Code__c',keyField__c='Market Segment',name='Market Segment Code');
        KeyFieldLabelAPIName__c key24=new KeyFieldLabelAPIName__c(apiName__c = 'Price_List_Type__c',keyField__c='Price List Type',name='Price List Type');
        KeyFieldLabelAPIName__c key25=new KeyFieldLabelAPIName__c(apiName__c = 'Sales_Office_Code__c',keyField__c='Sales office',name='Sales office Code');
        KeyFieldLabelAPIName__c key26=new KeyFieldLabelAPIName__c(apiName__c = 'Sales_District_Code__c',keyField__c='Sales District',name='Sales District Code');
        KeyFieldLabelAPIName__c key27=new KeyFieldLabelAPIName__c(apiName__c = 'Incoterms1__c',keyField__c='Incoterms',name='Incoterms');
        KeyFieldLabelAPIName__c key28=new KeyFieldLabelAPIName__c(apiName__c = 'Dist_Channel__c',keyField__c='Dist. Channel',name='Dist. Channel');
        KeyFieldLabelAPIName__c key29=new KeyFieldLabelAPIName__c(apiName__c = 'End_Use__c',keyField__c='End Use',name='End Use');
        KeyFieldLabelAPIName__c key30=new KeyFieldLabelAPIName__c(apiName__c = 'FixValDate__c',keyField__c='FixValDate',name='FixValDate');
        KeyFieldLabelAPIName__c key31=new KeyFieldLabelAPIName__c(apiName__c = 'Market_Segment__c',keyField__c='Market Segment',name='Market Segment');
        KeyFieldLabelAPIName__c key32=new KeyFieldLabelAPIName__c(apiName__c = 'Division_Code__c',keyField__c='Division',name='Division Code');
        KeyFieldLabelAPIName__c key33=new KeyFieldLabelAPIName__c(apiName__c = 'Partner_ZF__c',keyField__c='Partner ZF',name='Partner ZF');
        KeyFieldLabelAPIName__c key34=new KeyFieldLabelAPIName__c(apiName__c = 'Partner_ZF_Code__c',keyField__c='Partner ZF',name='Partner ZF Code');
        KeyFieldLabelAPIName__c key35=new KeyFieldLabelAPIName__c(apiName__c = 'Division__c',keyField__c='Division',name='Division');
        KeyFieldLabelAPIName__c key36=new KeyFieldLabelAPIName__c(apiName__c = 'End_User__c',keyField__c='End User',name='End User');
        KeyFieldLabelAPIName__c key37=new KeyFieldLabelAPIName__c(apiName__c = 'PH5_Code__c',keyField__c='PH5',name='PH5 Code');
        KeyFieldLabelAPIName__c key38=new KeyFieldLabelAPIName__c(apiName__c = 'Payer__c',keyField__c='Payer',name='Payer');
        KeyFieldLabelAPIName__c key39=new KeyFieldLabelAPIName__c(apiName__c = 'Country__c',keyField__c='Country',name='Country');
        KeyFieldLabelAPIName__c key40=new KeyFieldLabelAPIName__c(apiName__c = 'Incoterms_1_Code__c',keyField__c='Incoterms',name='Incoterms Code');
        KeyFieldLabelAPIName__c key41=new KeyFieldLabelAPIName__c(apiName__c = 'Sales_Org__c',keyField__c='Sales Org.',name='Sales Org');
        KeyFieldLabelAPIName__c key42=new KeyFieldLabelAPIName__c(apiName__c = 'Dist_Channel_Code__c',keyField__c='Dist. Channel',name='Dist. Channel Code');
        KeyFieldLabelAPIName__c key43=new KeyFieldLabelAPIName__c(apiName__c = 'Destination_Country_Code__c',keyField__c='Destination Country',name='Destination_Country_Code');
        KeyFieldLabelAPIName__c key44=new KeyFieldLabelAPIName__c(apiName__c = 'Customer_Price_Group__c',keyField__c='Customer Price Group',name='Customer Price Group');
        KeyFieldLabelAPIName__c key45=new KeyFieldLabelAPIName__c(apiName__c = 'Contract__c',keyField__c='Contract No.',name='Contract');
        KeyFieldLabelAPIName__c key46=new KeyFieldLabelAPIName__c(apiName__c = 'Contract_Code__c',keyField__c='Contract No.',name='Contract Number');
        KeyFieldLabelAPIName__c key47=new KeyFieldLabelAPIName__c(apiName__c = 'End_Use_Code__c',keyField__c='End Use',name='End Use Code');
        KeyFieldLabelAPIName__c key48=new KeyFieldLabelAPIName__c(apiName__c = 'ComPartner__c',keyField__c='ComPartner',name='ComPartner');
        KeyFieldLabelAPIName__c key49=new KeyFieldLabelAPIName__c(apiName__c = 'Country_Code__c',keyField__c='Country',name='Country Code');
        KeyFieldLabelAPIName__c key50=new KeyFieldLabelAPIName__c(apiName__c = 'End_User_Code__c',keyField__c='End User',name='End User Code');
        KeyFieldLabelAPIName__c key51=new KeyFieldLabelAPIName__c(apiName__c = 'Campaign_Code__c',keyField__c='Campaign',name='Campaign Code');
        KeyFieldLabelAPIName__c key52=new KeyFieldLabelAPIName__c(apiName__c = 'Disc_Ref_No__c',keyField__c='Disc Ref No',name='Disc Ref No');
        KeyFieldLabelAPIName__c key53=new KeyFieldLabelAPIName__c(apiName__c = 'Customer_Hierarchy_Code__c',keyField__c='Customer Hierarchy',name='Customer Hierarchy Code');
        KeyFieldLabelAPIName__c key54=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Price_Group__c',keyField__c='Material Price Group',name='Material Price Group');
        KeyFieldLabelAPIName__c key55=new KeyFieldLabelAPIName__c(apiName__c = 'Payer_Code__c',keyField__c='Payer',name='Payer Code');
        KeyFieldLabelAPIName__c key56=new KeyFieldLabelAPIName__c(apiName__c = 'ComPartner_Code__c',keyField__c='ComPartner',name='ComPartner_Code');
        KeyFieldLabelAPIName__c key57=new KeyFieldLabelAPIName__c(apiName__c = 'Campaign__c',keyField__c='Campaign',name='Campaign');
        KeyFieldLabelAPIName__c key58=new KeyFieldLabelAPIName__c(apiName__c = 'Sales_Org_Code__c',keyField__c='Sales Org.',name='Sales Org Code');
        KeyFieldLabelAPIName__c key59=new KeyFieldLabelAPIName__c(apiName__c = 'Kcode__c',keyField__c='Kcode',name='Kcode');
        KeyFieldLabelAPIName__c key60=new KeyFieldLabelAPIName__c(apiName__c = 'Customer_Price_Group_Code__c',keyField__c='Customer Price Group',name='Customer Price Group Code');
        KeyFieldLabelAPIName__c key61=new KeyFieldLabelAPIName__c(apiName__c = 'Disc_Ref__c',keyField__c='Disc Ref No',name='Disc Ref.');
        KeyFieldLabelAPIName__c key62=new KeyFieldLabelAPIName__c(apiName__c = 'Customer_Hierarchy__c',keyField__c='Customer Hierarchy',name='Customer Hierarchy');
        KeyFieldLabelAPIName__c key63=new KeyFieldLabelAPIName__c(apiName__c = 'Destination_Country__c',keyField__c='Destination Country',name='Destination_Country');
        KeyFieldLabelAPIName__c key64=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Group_1_Code__c',keyField__c='Material Group 1',name='Material Group 1 Code');
        KeyFieldLabelAPIName__c key65=new KeyFieldLabelAPIName__c(apiName__c = 'Plant_Code__c',keyField__c='Plant',name='Plant Code');
        KeyFieldLabelAPIName__c key66=new KeyFieldLabelAPIName__c(apiName__c = 'Shipping_Condition_Code__c',keyField__c='Shipping Condition',name='Shipping Condition Code');
        KeyFieldLabelAPIName__c key67=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Code__c',keyField__c='Material',name='Material Code');
        KeyFieldLabelAPIName__c key68=new KeyFieldLabelAPIName__c(apiName__c = 'PH5__c',keyField__c='PH5',name='PH5');
        KeyFieldLabelAPIName__c key69=new KeyFieldLabelAPIName__c(apiName__c = 'Terms_Of_Payment_Code__c',keyField__c='Terms of Payment',name='Terms of Payment Code');
        KeyFieldLabelAPIName__c key70=new KeyFieldLabelAPIName__c(apiName__c = 'State__c',keyField__c='State',name='State');
        KeyFieldLabelAPIName__c key71=new KeyFieldLabelAPIName__c(apiName__c = 'PH6_Code__c',keyField__c='PH6',name='PH6 Code');
        KeyFieldLabelAPIName__c key72=new KeyFieldLabelAPIName__c(apiName__c = 'PH4_Code__c',keyField__c='PH4',name='PH4 Code');
        KeyFieldLabelAPIName__c key73=new KeyFieldLabelAPIName__c(apiName__c = 'Variant__c',keyField__c='Variant',name='Variant Code');
        KeyFieldLabelAPIName__c key74=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Group_5_Key__c',keyField__c='Material Group 5 Key',name='Material Group 5 Key');
        KeyFieldLabelAPIName__c key75=new KeyFieldLabelAPIName__c(apiName__c = 'Ship_To_Country__c',keyField__c='Ship-To Country',name='Ship-To Country');
        KeyFieldLabelAPIName__c key76=new KeyFieldLabelAPIName__c(apiName__c = 'Ship_To_Country_Code__c',keyField__c='Ship-To Country',name='Ship-To Country Code');
        KeyFieldLabelAPIName__c key77=new KeyFieldLabelAPIName__c(apiName__c = 'Material_Group_5_Key_Code__c',keyField__c='Material Group 5 Key',name='Material Group 5 Key Code');
        KeyFieldLabelAPIName__c key78=new KeyFieldLabelAPIName__c(apiName__c = 'Sales_Order_Type__c',keyField__c='Sales Order Type',name='Sales Order Type');
        KeyFieldLabelAPIName__c key79=new KeyFieldLabelAPIName__c(apiName__c = 'PH3_Code__c',keyField__c='PH3',name='PH3 Code');
        KeyFieldLabelAPIName__c key80=new KeyFieldLabelAPIName__c(apiName__c = 'PH4__c',keyField__c='PH4',name='PH4');
        KeyFieldLabelAPIName__c key81=new KeyFieldLabelAPIName__c(apiName__c = 'PH7_Code__c',keyField__c='PH7',name='PH7 Code');
        KeyFieldLabelAPIName__c key82=new KeyFieldLabelAPIName__c(apiName__c = 'Price_List_Type_Code__c',keyField__c='Price List Type',name='Price List Type Code');
        KeyFieldLabelAPIName__c key83=new KeyFieldLabelAPIName__c(apiName__c = 'PH3__c',keyField__c='PH3',name='PH3');
        KeyFieldLabelAPIName__c key84=new KeyFieldLabelAPIName__c(apiName__c = 'PH6__c',keyField__c='PH6',name='PH6');
        KeyFieldLabelAPIName__c key85=new KeyFieldLabelAPIName__c(apiName__c = 'PH7__c',keyField__c='PH7',name='PH7');
        KeyFieldLabelAPIName__c key86=new KeyFieldLabelAPIName__c(apiName__c = 'PH1__c',keyField__c='PH1',name='PH1');
        KeyFieldLabelAPIName__c key87=new KeyFieldLabelAPIName__c(apiName__c = 'PH9__c',keyField__c='PH9',name='PH9');
        KeyFieldLabelAPIName__c key88=new KeyFieldLabelAPIName__c(apiName__c = 'PH8_Code__c',keyField__c='PH8',name='PH8 Code');
        KeyFieldLabelAPIName__c key89 = new KeyFieldLabelAPIName__c(apiName__c= 'Sales_Order_Item_Code__c',keyField__c='Sales Order Item',name='Sales Order Item Code');
        KeyFieldLabelAPIName__c key90 = new KeyFieldLabelAPIName__c(apiName__c= 'Sales_Order_Item__c',keyField__c='Sales Order Item',name='Sales Order Item');
        
        //<SS20220826>-- added query for sales order item and sales order item code 
        listKeys.add(key2);
        listKeys.add(key3);
        listKeys.add(key4);
        listKeys.add(key5);
        listKeys.add(key6);
        listKeys.add(key7);
        listKeys.add(key8);
        listKeys.add(key9);
        listKeys.add(key10);
        listKeys.add(key11);
        listKeys.add(key12);
        listKeys.add(key13);
        listKeys.add(key14);
        listKeys.add(key15);
        listKeys.add(key16);
        listKeys.add(key16);
        listKeys.add(key17);
        listKeys.add(key18);
        listKeys.add(key19);
        listKeys.add(key20);
        listKeys.add(key21);
        listKeys.add(key22);
        listKeys.add(key23);
        listKeys.add(key24);
        listKeys.add(key25);
        listKeys.add(key26);
        listKeys.add(key27);
        listKeys.add(key28);
        listKeys.add(key29);
        listKeys.add(key30);
        listKeys.add(key31);
        listKeys.add(key32);
        listKeys.add(key33);
        listKeys.add(key34);
        listKeys.add(key35);
        listKeys.add(key36);
        listKeys.add(key37);
        listKeys.add(key38);
        listKeys.add(key39);
        listKeys.add(key40);
        listKeys.add(key41);
        listKeys.add(key42);
        listKeys.add(key43);
        listKeys.add(key44);
        listKeys.add(key45);
        listKeys.add(key46);
        listKeys.add(key47);
        listKeys.add(key48);
        listKeys.add(key49);
        listKeys.add(key50);
        listKeys.add(key51);
        listKeys.add(key52);
        listKeys.add(key53);
        listKeys.add(key54);
        listKeys.add(key55);
        listKeys.add(key56);
        listKeys.add(key57);
        listKeys.add(key58);
        listKeys.add(key59);
        listKeys.add(key60);
        listKeys.add(key61);
        listKeys.add(key62);
        listKeys.add(key63);
        listKeys.add(key64);
        listKeys.add(key65);
        listKeys.add(key66);
        listKeys.add(key67);
        listKeys.add(key68);
        listKeys.add(key69);
        listKeys.add(key70);
        listKeys.add(key71);
        listKeys.add(key72);
        listKeys.add(key73);
        listKeys.add(key74);
        listKeys.add(key75);
        listKeys.add(key76);
        listKeys.add(key77);
        listKeys.add(key78);
        listKeys.add(key79);
        listKeys.add(key80);
        listKeys.add(key81);
        listKeys.add(key82);
        listKeys.add(key83);
        listKeys.add(key84);
        listKeys.add(key85);
        listKeys.add(key86);
        listKeys.add(key87);
        listKeys.add(key88);
        listKeys.add(key89);
        listKeys.add(key90);
        
        Set<KeyFieldLabelAPIName__c> paQueyrSet = new Set<KeyFieldLabelAPIName__c>();
        paQueyrSet.addAll(listKeys);
        listKeys.clear();
        listKeys.addAll(paQueyrSet);
        insert listKeys;
    }
    
    //Added by Calment
    static testMethod void materialGroup()
    {
        
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        system.debug('#### p1'+p1);
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        //creating RecordType
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        //Test.startTest();
        System.runAs(u1){
            insertQueryRecords();
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            List<Key_Field_Error__c> kfeList= new List<Key_Field_Error__c>();
            kfeList.add(new Key_Field_Error__c(Name='ComPartner',Error_Message__c='Error:ComPartner is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Country',Error_Message__c='Error:Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Customer Price Group',Error_Message__c='Error:Customer Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Destination Country',Error_Message__c='Error:Destination Country is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Incoterms',Error_Message__c='Error:Incoterms is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 3',Error_Message__c='Error:End Use is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Group 4',Error_Message__c='Error:Market Segment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Material Price Group',Error_Message__c='Error:Material Price Group is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Plant',Error_Message__c='Error:Plant is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Price List Type',Error_Message__c='Error:Price List Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Office',Error_Message__c='Error:Sales Office is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Sales Order Type',Error_Message__c='Error:Sales Order Type is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Shipping Condition',Error_Message__c='Error:Shipping Condition is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Terms of Payment',Error_Message__c='Error:Terms of Payment is not valid for the Sold To.'));
            kfeList.add(new Key_Field_Error__c(Name='Variant',Error_Message__c='Error:Variant is not valid for the Sold To.'));
            insert kfeList;
            
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
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold to Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/PH7 Code/PH8 Code/PH9 Code-Sales Org./Dist. Channel/Division/Sold to/Product Hierarchy'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(
                Key_Combination__c='ZPGB-Combined/Sold-to/Grade (PH-code)',
                Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Key_Combination__c='ZPRB-Separate/Sold-to/Grade (PH-code)',
                                                                      Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
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
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A771',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/PH1',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Spot');
            Insert keyCombObj1;
            Insert keyCombObj2;
            ERP_Pricing_Condition__c priCondObj1 = new ERP_Pricing_Condition__c(Price_Types__c='Floor',Pricing_Condition_Code__c='ZPSE',Pricing_Condition__c='Gross Price',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V');
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
            pricingRequest1.Default_Currency__c='USD';
            
            insert pricingRequest1;
            Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
            pricingRequest2.Pricing_Request_Type__c = 'Pricing Task';
            pricingRequest2.Request_Type__c = 'Customer Specific';
            pricingRequest2.BU__c = 'BI';
            pricingRequest2.Sales_Org_Code__c ='A640';
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
            buOrgGroup.ERP_Currency__c='EUR;USD';
            buOrgGroup.ERP_UoM__c='BG;KG';
            buOrgGroup.Default_Per_UoM_Setup__c='Sales Area';        
            buOrgGroup.Default_SalesArea_UoM__c='KG';
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            buOrgGroup.Enable_Variable_Config_Materials__c=true;
            buOrgGroup.isPaymentTermsApplicable__c=true;
            insert buOrgGroup;
            Organizational_Group_Item__c buOrgGroup1=new  Organizational_Group_Item__c();
            buOrgGroup1.Business__c=orgGroup1.id;
            buOrgGroup1.OrgGroup__c=orgGroup3.id;
            buOrgGroup1.ERP_Currency__c='EUR;USD';
            buOrgGroup1.ERP_UoM__c='BG;KG';
            buOrgGroup1.Default_SalesArea_UoM__c='KG';
            buOrgGroup.Default_Per_UoM_Setup__c='Sales Area Config'; 
            buOrgGroup1.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup1.Retroactive_Limit__c=30;
            //buOrgGroup1.Enable_Variable_Config_Materials__c=true;
            insert buOrgGroup1;
            
            
            ERP_Access_Sequence__c access=new ERP_Access_Sequence__c();
            access.Pricing_Condition__c=priCondObj1.id;
            access.Sales_Pricing_Procedure__c=pp.id;
            access.Pricing_Key_Combination__c=keyCombObj1.id;
            insert access;
            
            
            
            list<ERP_Sales_Prices_SAP__c> m=new list<ERP_Sales_Prices_SAP__c>();
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Approved_Date__c=Date.today());
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
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
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D655234',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            insert childRecord1; 
            
            list<String> a=new list<String>();
            a.add('india');
            //list<selectoption> a1=new list<selectoption>();
            //a1.add('india');
            
            
            
            Sales_Prices__c salesPrice1 = new Sales_Prices__c();
            salesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice1.SAP_Cluster__c ='CB1';
            salesPrice1.SAP_Client_Id__c='510';
            salesPrice1.SAP_Application_Id__c='V';
            salesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            salesPrice1.markForDeletion__c =false;
            salesPrice1.Sales_Price_Type__c='Floor';
            salesPrice1.Pricing_Condition_Code__c='ZPSE';
            salesPrice1.Sales_Org_Code__c='A640';
            salesPrice1.Dist_Channel_Code__c= '10';
            salesPrice1.Division_Code__c= '02';
            salesPrice1.Sold_To_Code__c='123456';
            salesPrice1.Material_Code__c ='D1209';
            insert salesPrice1;
            
            
            
            
            Sales_Prices__c salesPrice = new Sales_Prices__c();
            salesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            salesPrice.SAP_Cluster__c ='CB1';
            salesPrice.SAP_Client_Id__c='510';
            salesPrice.SAP_Application_Id__c='V';
            salesPrice.key_Combination_Code__c='A580';
            salesPrice.Price_Holder__c = salesPrice1.id;
            salesPrice.Pricing_Condition_Code__c='ZPSE';
            salesPrice.markForDeletion__c =false;
            salesPrice.Sales_Price_Type__c='Floor';
            salesPrice.Sales_Org_Code__c='A640';
            //salesPrice.Product_Hierarchy_Code__c='';
            salesPrice.Dist_Channel_Code__c= '10';
            salesPrice.Division_Code__c= '02';
            salesPrice.Sold_To_Code__c='123456';
            salesPrice.Material_Code__c ='D1209';
            insert salesPrice;
            
            
            //ERP Sales Price SAP
            
            
            ERP_Sales_Prices_SAP__c esalesPrice1 = new ERP_Sales_Prices_SAP__c();
            esalesPrice1.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice1.SAP_Cluster__c ='CB1';
            esalesPrice1.SAP_Client_Id__c='510';
            esalesPrice1.SAP_Application_Id__c='V';
            esalesPrice1.key_Combination_Code__c='A580';
            //salesPrice1.Price_Holder__c = ;
            esalesPrice1.markForDeletion__c =false;
            esalesPrice1.Sales_Price_Type__c='Floor';
            esalesPrice1.Sales_Org_Code__c='A640';
            esalesPrice1.Distribution_Channel_Code__c= '10';
            esalesPrice1.Sales_Price_Type__c = 'Permanent';
            esalesPrice1.Division_Code__c= '02';
            esalesPrice1.Material_Code__c='D1209';
            insert esalesPrice1;
            
            List<ERP_Customer_Material_Key__c> custsList=new List<ERP_Customer_Material_Key__c>();
            List<Org_Group_ERP_Key__c> orgList=new List<Org_Group_ERP_Key__c>();
            
            ERP_Customer_Material_Key__c custKey = new ERP_Customer_Material_Key__c();
            custKey.Status__c='Active';
            custKey.Type__c='Customer Price Group';
            custsList.add(custKey);
            
            ERP_Customer_Material_Key__c custKey1 = new ERP_Customer_Material_Key__c();
            custKey1.Status__c='Active';
            custKey1.Type__c='Incoterms';
            custsList.add(custKey1);
            
            ERP_Customer_Material_Key__c custKey2 = new ERP_Customer_Material_Key__c();
            custKey2.Status__c='Active';
            custKey2.Type__c='Material Price Group';
            custsList.add(custKey2);
            
            ERP_Customer_Material_Key__c custKey3 = new ERP_Customer_Material_Key__c();
            custKey3.Status__c='Active';
            custKey3.Type__c='Price List Type';
            custsList.add(custKey3);
            
            ERP_Customer_Material_Key__c custKey4 = new ERP_Customer_Material_Key__c();
            custKey4.Status__c='Active';
            custKey4.Type__c='Sales office';
            custsList.add(custKey4);
            
            ERP_Customer_Material_Key__c custKey5 = new ERP_Customer_Material_Key__c();
            custKey5.Status__c='Active';
            custKey5.Type__c='Sales District';
            custsList.add(custKey5);
            
            
            ERP_Customer_Material_Key__c custKey6 = new ERP_Customer_Material_Key__c();
            custKey6.Status__c='Active';
            custKey6.Type__c='Country';
            custsList.add(custKey6);
            
            
            ERP_Customer_Material_Key__c custKey7 = new ERP_Customer_Material_Key__c();
            custKey7.Status__c='Active';
            custKey7.Type__c='Terms of Payment';
            custsList.add(custKey7);
            
            
            ERP_Customer_Material_Key__c custKey8 = new ERP_Customer_Material_Key__c();
            custKey8.Status__c='Active';
            custKey8.Type__c='Variant';
            custsList.add(custKey8);
            
            
            ERP_Customer_Material_Key__c custKey9 = new ERP_Customer_Material_Key__c();
            custKey9.Status__c='Active';
            custKey9.Type__c='Sales Order Type';
            custsList.add(custKey9);
            
            
            ERP_Customer_Material_Key__c custKe1 = new ERP_Customer_Material_Key__c();
            custKe1.Status__c='Active';
            custKe1.Type__c='ComPartner';
            custsList.add(custKe1);
            
            
            ERP_Customer_Material_Key__c custKe2 = new ERP_Customer_Material_Key__c();
            custKe2.Status__c='Active';
            custKe2.Type__c='Material Group 5 Key';
            custsList.add(custKe2);
            
            ERP_Customer_Material_Key__c custKe3 = new ERP_Customer_Material_Key__c();
            custKe3.Status__c='Active';
            custKe3.Type__c='Material Group 4';
            custsList.add(custKe3);
            
            ERP_Customer_Material_Key__c custKe4 = new ERP_Customer_Material_Key__c();
            custKe4.Status__c='Active';
            custKe4.Type__c='Plant';
            custsList.add(custKe4);
            
            ERP_Customer_Material_Key__c custKe5 = new ERP_Customer_Material_Key__c();
            custKe5.Status__c='Active';
            custKe5.Type__c='Shipping Condition';
            custsList.add(custKe5);
            
            ERP_Customer_Material_Key__c custKe6 = new ERP_Customer_Material_Key__c();
            custKe6.Status__c='Active';
            custKe6.Type__c='Destination Country';
            custsList.add(custKe6);
            
            ERP_Customer_Material_Key__c custKe7 = new ERP_Customer_Material_Key__c();
            custKe7.Status__c='Active';
            custKe7.Type__c='Partner ZF';
            custsList.add(custKe7);
            
            ERP_Customer_Material_Key__c custKe8 = new ERP_Customer_Material_Key__c();
            custKe8.Status__c='Active';
            custKe8.Type__c='Material Group 1';
            custsList.add(custKe8);
            
            
            ERP_Customer_Material_Key__c custKe9 = new ERP_Customer_Material_Key__c();
            custKe9.Status__c='Active';
            custKe9.Type__c='Material Group 3';
            custsList.add(custKe9);
            
            ERP_Customer_Material_Key__c custKey11 = new ERP_Customer_Material_Key__c();
            custKey11.Status__c='Active';
            custKey11.Type__c='Payer';
            custsList.add(custKey11);
            
            ERP_Customer_Material_Key__c custKey12 = new ERP_Customer_Material_Key__c();
            custKey12.Status__c='Active';
            custKey12.Type__c='Campaign';
            custsList.add(custKey12);
            
            ERP_Customer_Material_Key__c custKey13 = new ERP_Customer_Material_Key__c();
            custKey13.Status__c='Active';
            custKey13.Type__c='Document Currency';
            custsList.add(custKey13);
            
            ERP_Customer_Material_Key__c custKey19 = new ERP_Customer_Material_Key__c();
            custKey19.Status__c='Active';
            custKey19.Type__c='State';
            custsList.add(custKey19);
            
            
            insert custsList;
            
            
            Org_Group_ERP_Key__c ogKey = new Org_Group_ERP_Key__c();
            ogKey.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey.ERP_Cus_Mat_Compt_Key__c = custKey.id;
            orgList.add(ogKey);
            
            
            Org_Group_ERP_Key__c ogKey1 = new Org_Group_ERP_Key__c();
            ogKey1.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey1.ERP_Cus_Mat_Compt_Key__c = custKey1.id;
            orgList.add(ogKey1);
            
            Org_Group_ERP_Key__c ogKey2 = new Org_Group_ERP_Key__c();
            ogKey2.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey2.ERP_Cus_Mat_Compt_Key__c = custKey2.id;
            orgList.add(ogKey2);
            
            
            Org_Group_ERP_Key__c ogKey3 = new Org_Group_ERP_Key__c();
            ogKey3.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey3.ERP_Cus_Mat_Compt_Key__c = custKey3.id;
            orgList.add(ogKey3);
            
            
            Org_Group_ERP_Key__c ogKey4 = new Org_Group_ERP_Key__c();
            ogKey4.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey4.ERP_Cus_Mat_Compt_Key__c = custKey4.id;
            orgList.add(ogKey4);
            
            
            Org_Group_ERP_Key__c ogKey5 = new Org_Group_ERP_Key__c();
            ogKey5.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey5.ERP_Cus_Mat_Compt_Key__c = custKey5.id;
            orgList.add(ogKey5);
            
            
            Org_Group_ERP_Key__c ogKey6 = new Org_Group_ERP_Key__c();
            ogKey6.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey6.ERP_Cus_Mat_Compt_Key__c = custKey6.id;
            orgList.add(ogKey6);
            
            
            Org_Group_ERP_Key__c ogKey7 = new Org_Group_ERP_Key__c();
            ogKey7.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey7.ERP_Cus_Mat_Compt_Key__c = custKey7.id;
            orgList.add(ogKey7);       
            
            Org_Group_ERP_Key__c ogKey8 = new Org_Group_ERP_Key__c();
            ogKey8.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey8.ERP_Cus_Mat_Compt_Key__c = custKey8.id;
            orgList.add(ogKey8);
            
            Org_Group_ERP_Key__c ogKey9 = new Org_Group_ERP_Key__c();
            ogKey9.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey9.ERP_Cus_Mat_Compt_Key__c = custKey9.id;
            orgList.add(ogKey9);        
            
            Org_Group_ERP_Key__c ogKe1 = new Org_Group_ERP_Key__c();
            ogKe1.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe1.ERP_Cus_Mat_Compt_Key__c = custKe1.id;
            orgList.add(ogKe1);
            
            Org_Group_ERP_Key__c ogKe2 = new Org_Group_ERP_Key__c();
            ogKe2.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe2.ERP_Cus_Mat_Compt_Key__c = custKe2.id;
            orgList.add(ogKe2);
            
            Org_Group_ERP_Key__c ogKe3 = new Org_Group_ERP_Key__c();
            ogKe3.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe3.ERP_Cus_Mat_Compt_Key__c = custKe3.id;
            orgList.add(ogKe3);
            
            Org_Group_ERP_Key__c ogKe4 = new Org_Group_ERP_Key__c();
            ogKe4.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe4.ERP_Cus_Mat_Compt_Key__c = custKe4.id;
            orgList.add(ogKe4);
            
            Org_Group_ERP_Key__c ogKe5 = new Org_Group_ERP_Key__c();
            ogKe5.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe5.ERP_Cus_Mat_Compt_Key__c = custKe5.id;
            orgList.add(ogKe5);
            
            Org_Group_ERP_Key__c ogKe6 = new Org_Group_ERP_Key__c();
            ogKe6.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe6.ERP_Cus_Mat_Compt_Key__c = custKe6.id;
            orgList.add(ogKe6);
            
            
            Org_Group_ERP_Key__c ogKe7 = new Org_Group_ERP_Key__c();
            ogKe7.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe7.ERP_Cus_Mat_Compt_Key__c = custKe7.id;
            orgList.add(ogKe7);
            
            Org_Group_ERP_Key__c ogKe8 = new Org_Group_ERP_Key__c();
            ogKe8.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe8.ERP_Cus_Mat_Compt_Key__c = custKe8.id;
            orgList.add(ogKe8);
            
            Org_Group_ERP_Key__c ogKe9 = new Org_Group_ERP_Key__c();
            ogKe9.Organizational_Group_Item__c= buOrgGroup.id;
            ogKe9.ERP_Cus_Mat_Compt_Key__c = custKe9.id;
            orgList.add(ogKe9);
            
            Org_Group_ERP_Key__c ogKey11 = new Org_Group_ERP_Key__c();
            ogKey11.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey11.ERP_Cus_Mat_Compt_Key__c = custKey11.id;
            orgList.add(ogKey11);
            
            Org_Group_ERP_Key__c ogKey12 = new Org_Group_ERP_Key__c();
            ogKey12.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey12.ERP_Cus_Mat_Compt_Key__c = custKey12.id;
            orgList.add(ogKey12);
            
            Org_Group_ERP_Key__c ogKey13 = new Org_Group_ERP_Key__c();
            ogKey13.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey13.ERP_Cus_Mat_Compt_Key__c = custKey13.id;
            orgList.add(ogKey13);
            
            Org_Group_ERP_Key__c ogKey19 = new Org_Group_ERP_Key__c();
            ogKey19.Organizational_Group_Item__c= buOrgGroup.id;
            ogKey19.ERP_Cus_Mat_Compt_Key__c = custKey19.id;
            orgList.add(ogKey19);
            
            
            insert orgList;
            
            ERP_Sales_Prices_SAP__c esalesPrice = new ERP_Sales_Prices_SAP__c();
            esalesPrice.Pricing_Condition_Code__c = priCondObj1.id;
            esalesPrice.SAP_Cluster__c ='CB1';
            esalesPrice.SAP_Client_Id__c='510';
            esalesPrice.SAP_Application_Id__c='V';
            esalesPrice.key_Combination_Code__c='A580';
            esalesPrice.Sales_Price_Type__c = 'Permanent';
            esalesPrice.Price_Holder__c = esalesPrice1.id;
            esalesPrice.isPriceHolder__c = false;
            esalesPrice.markForDeletion__c =false;
            esalesPrice.Sales_Price_Type__c='Floor';
            esalesPrice.Sales_Org_Code__c='A640';
            esalesPrice.Distribution_Channel_Code__c= '10';
            esalesPrice.Division_Code__c= '02';
            esalesPrice.Material_Code__c='D1209';
            insert esalesPrice;
            
            //RecordType rType = [select id from RecordType Where sObjectType='Material__C' AND Name='Business'];
            //String recotypeId = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            Material__C mat2 = new material__C();
            mat2.ERP_Material_Code__c='D655234';
            mat2.ERP_Source_Cluster__c='CB1';
            mat2.ERP_Sales_Org_Code__c='A640';
            mat2.ERP_Distribution_Channel_Code__c='10';
            mat2.External_ERP_ID__c='A640';
            mat2.External_ERP_ID__c='CB1-A640-10-D1209';
            mat2.ERP_Deletion_Flag__c = true;
            mat2.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat2;
            
            Material__C mat1 = new material__C();
            mat1.ERP_Material_Code__c='D12345';
            mat1.ERP_Source_Cluster__c='CB1';
            mat1.ERP_Sales_Org_Code__c='A640';
            mat1.ERP_Distribution_Channel_Code__c='10';
            mat1.External_ERP_ID__c='A640';
            mat1.External_ERP_ID__c='CB1-A640-10-D12345';
            mat1.ERP_Deletion_Flag__c = true;
            mat1.recordTypeId = Schema.SObjectType.Material__C.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
            insert mat1;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogitems=new PAOrganizationalGroupItems(); 
            paServiceState.ogitems.selectedBU=orgGroup1.Id;
            
            paServiceState.ogitems.listSelectedCPG=new List<String>();
            paServiceState.ogitems.listSelectedIncoterms=new List<String>();
            paServiceState.ogitems.listSelectedSO=new List<String>();
            paServiceState.ogitems.listSelectedPLType=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedCountry=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedMG4=new List<String>();
            paServiceState.ogitems.listSelectedTOP=new List<String>();
            paServiceState.ogitems.listSelectedVariant=new List<String>();
            paServiceState.ogitems.listSelectedSOT=new List<String>();
            
            
            PARequest request= new PARequest(paServiceState);
            request.pricingCondition=new PAPricingCondition(paServiceState);
            request.keyCombination=new PAKeyCombination(paServiceState);
            request.keyCombination.keyCombinationId=keyCombObj1.id;
            request.pricingCondition.selectedPricingCondition=priCondObj1.ID;
            
            //request.pricingCondition.PCLselectedPricingCondition.add(priCondObj1.id);
            request.pricingRequest.Dist_Channel_Code__c=pricingRequest1.Dist_Channel_Code__c;
            request.pricingRequest.Division_Code__c=pricingRequest1.Division_Code__c;
            request.pricingRequest.Sales_Org_Code__c=pricingRequest1.Sales_Org_Code__c;
            request.pricingRequest.Request_Type__c = 'Customer Specific';
            //request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.pricingRequest.Due_date__c=pricingRequest1.Due_date__c;
            request.materialFilter='D1209,materialused';
            //request.pricingRequest.Sales_Org_Code__c=pricingRequest2.Sales_Org_Code__c;
            request.requestServiceState.ogItems.listSelectedCountry=a;
            request.requestServiceState.ogItems.listSelectedMG3=a;
            request.requestServiceState.ogItems.listSelectedPLType=a;  
            request.requestServiceState.ogItems.listSelectedMG4=a;
            request.requestServiceState.ogItems.listSelectedCPG=a;
            request.requestServiceState.ogItems.listSelectedMPG=a;
            request.viewCustomerPrices = 'ViewCustomerPrices';
            ERP_Customer__c paERPCustomer = new ERP_Customer__c();
            paERPCustomer.Sales_Org_Code__c='A640';
            paERPCustomer.Distribution_Channel_Code__c = '10';
            paERPCustomer.Division_Code__c = '02';
            paERPCustomer.Customer_code__c = '123456';
            paERPCustomer.Sales_Org_Code__c = 'A640';
            insert paERPCustomer;
            
            request.customer.paERPCustomer = paERPCustomer;
            request.customer.currentPrices='ExpOnly';
            //request.currentPricesSelection = 'Current Prices';
            request.currentPricesSelection = 'Last Valid Prices';
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
            
            PASalesPriceSAP SalesPriceSAP=new PASalesPriceSAP(paServiceState);
            request.pricingRequest = pricingRequest1;
            SalesPriceSAP.request=request;
            List<PARelatedList> relatedList = new List<PARelatedList>();
            List<PAWrapper> wrapperList = new List<PAWrapper>();
            
            ERP_Sales_Prices_SAP__c esapRcrd = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                           Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                           Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='D1209',
                                                                           sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=vf,valid_to__c=vf,
                                                                           SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                           Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                           Scaled_Price_Flag__c=false,
                                                                           Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Approved_Date__c=Date.today());
            
            PAWrapper wrap = new PAWrapper();
            wrap.sobjectRecord  = esapRcrd;
            wrap.isSelected = true;
            wrapperList.add(wrap);
            PARelatedList relList = new PARelatedList();
            relList.wrapperList = wrapperList;
            relatedList.add(relList);
            SalesPriceSAP.relatedWrappersList = relatedList;
            
            
            
            //SalesPriceSAP.setMpgList(request.requestServiceState.ogItems.listSelectedMPG);
            //SalesPriceSAP.validate('AddRequestItems');
            
            SalesPriceSAP.validate('AddSelectedPrices');
            try
            {
                SalesPriceSAP.action('','','AddSelectedPrices');
                request.pricingRequest.Request_Type__c = 'Non Customer Specific';
                SalesPriceSAP.action('','','AddSelectedPrices');
            }
            catch(Exception e)
            {
            }
            
            Test.startTest();
            
            ERP_Sales_Prices_SAP__c eSap2 = new ERP_Sales_Prices_SAP__c();
            eSap2.Pricing_Condition_Code__c ='ZPSE';
            eSap2.Sales_Org_Code__c='A640';
            eSap2.Distribution_Channel_code__c='10';
            eSap2.Division_code__c='02';
            eSap2.Sold_To_Code__c='T001';
            eSap2.Material_Code__c='D12345';
            eSap2.ShipTo_Code__c='123456';
            eSap2.End_Use_Code__c='123456';
            eSap2.PH1_Code__c='B9';
            eSap2.PH2_Code__c='01';
            eSap2.PH3_Code__c='10';
            eSap2.PH4_Code__c='06';
            eSap2.PH5_Code__c='01';
            eSap2.PH6_Code__c='01';
            eSap2.PH7_Code__c='53';
            eSap2.PH8_Code__c='26';    
            eSap2.PH9_Code__c='99'; 
            eSap2.Valid_From__c = System.today()-10;
            eSap2.Valid_To__c = System.today()-5;
            insert eSap2;
            
            List<ERP_Customer__c>  erpgen = new List<ERP_Customer__c>();
            List<ERP_Relationship__c>  erprels = new List<ERP_Relationship__c>();
            
            ERP_Customer__c erpgenCust = new ERP_Customer__c();
            erpgenCust.Customer_Code__c='123456';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust.Sales_Org_Code__c = 'A640';
            erpgenCust.Distribution_Channel_Code__c = '10';
            erpgenCust.Division_Code__c = '02';
            erpgenCust.Currency_Code__c = 'USD';
            erpgenCust.Deletion_Flag__c=true;
            erpgen.add(erpgenCust);
            
            ERP_Customer__c erpgenCust1 = new ERP_Customer__c();
            erpgenCust1.Customer_Code__c='T001';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust1.Sales_Org_Code__c = 'A640';
            erpgenCust1.Distribution_Channel_Code__c = '10';
            erpgenCust1.Division_Code__c = '02';
            erpgenCust1.Currency_Code__c = 'USD';
            erpgenCust1.Deletion_Flag__c = true;
            erpgen.add(erpgenCust1);
            
            ERP_Customer__c erpgenCust2 = new ERP_Customer__c();
            erpgenCust2.Customer_Code__c='T001';
            //erpgenCust.OrgGroup__c=buOrgGroup2.id;
            erpgenCust2.Sales_Org_Code__c = 'A640';
            erpgenCust2.Distribution_Channel_Code__c = '10';
            erpgenCust2.Division_Code__c = '02';
            erpgenCust2.Currency_Code__c = 'USD';
            erpgenCust2.Deletion_Flag__c=false;
            erpgen.add(erpgenCust2);
            
            insert erpgen;
            
            ERP_Relationship__c erprel = new ERP_Relationship__c();
            erprel.ERP_Customer__c=erpgenCust1.id;
            erprel.Related_ERP_Customer__c=erpgenCust.id;
            erprel.Partner_Function_Code__c='WE';
            erprels.add(erprel);
            
            ERP_Relationship__c erprel1 = new ERP_Relationship__c();
            erprel1.ERP_Customer__c=erpgenCust2.id;
            erprel1.Related_ERP_Customer__c=erpgenCust.id;
            erprel1.Partner_Function_Code__c='ZH';
            erprels.add(erprel1);
            
            ERP_Relationship__c erprel2 = new ERP_Relationship__c();
            erprel2.ERP_Customer__c=erpgenCust1.id;
            erprel2.Related_ERP_Customer__c=erpgenCust.id;
            erprel2.Partner_Function_Code__c='ZH';
            erprels.add(erprel2);
            
            insert erprel;
            
            
            ERP_Sales_Prices_SAP__c esaptest = [select PCKC__c from ERP_Sales_Prices_SAP__c where id =:esap2.id limit 1];
            System.debug('PCPCFROM Test class:-'+esaptest.PCKC__c);
            
            List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
            
            Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
            priReqItem2.Pricing_Request__c = pricingRequest1.Id;
            priReqItem2.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem2.Scaled_Price_Flag__c = true;
            priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem2.Key_Combination_Code__c = 'A580';
            priReqItem2.Key_Combination__c = 'Sales Org./Dist. Channel/Division/End User/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Customer Price Group/Incoterms/Material Price Group/Price List Type/Sales office/Sales District/Country/Terms of Payment/Market Segment/Variant/Sales Order Type';
            priReqItem2.Customer_Specific__c=true;  
            priReqItem2.PH1_Code__c='B9';
            priReqItem2.PH2_Code__c='01';
            priReqItem2.PH3_Code__c='10';
            priReqItem2.PH4_Code__c='06';
            priReqItem2.PH5_Code__c='01';
            priReqItem2.PH6_Code__c='01';
            priReqItem2.PH7_Code__c='53';
            priReqItem2.PH8_Code__c='26';    
            priReqItem2.PH9_Code__c='99';    
            priReqItem2.New_UoM__c=null;
            priReqItem2.New_Per__c=null;
            priReqItem2.Material_Code__c = 'D12345';  
            priReqItem2.ShipTo_Code__c='123456';
            priReqItem2.End_User_Code__c='123456';
            priReqItem2.Sold_To_Code__c='T001';    
            priReqItem2.New_Valid_To__c = System.today();
            priReqItem2.Calculation_Type__c='Fixed';
            pricingReqItemList.add(priReqItem2);
            
            
            Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
            priReqItem3.Pricing_Request__c = pricingRequest1.Id;
            priReqItem3.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem3.Scaled_Price_Flag__c = true;
            priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem3.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem3.Key_Combination_Code__c = 'A580';
            priReqItem3.Key_Combination__c = 'Sales Org./Dist. Channel/Ship to/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/End User/End Use/EndUser/Partner ZF/Material Group 1/Payer/Campaign/Document Currency/State';
            priReqItem3.Customer_Specific__c=true;  
            priReqItem3.PH1_Code__c='B9';
            priReqItem3.PH2_Code__c='01';
            priReqItem3.PH3_Code__c='10';
            priReqItem3.PH4_Code__c='06';
            priReqItem3.PH5_Code__c='01';
            priReqItem3.PH6_Code__c='01';
            priReqItem3.PH7_Code__c='53';
            priReqItem3.PH8_Code__c='26';    
            priReqItem3.PH9_Code__c='99';    
            priReqItem3.New_UoM__c=null;
            priReqItem3.New_Per__c=null;
            priReqItem3.Material_Code__c = 'D12345';  
            priReqItem3.ShipTo_Code__c='123456';
            priReqItem3.End_User_Code__c='123456';
            
            priReqItem3.New_Valid_To__c = System.today();
            priReqItem3.Calculation_Type__c='Fixed';
            pricingReqItemList.add(priReqItem3);
            
            
            
            Pricing_Request_Item__c priReqItem4 = new Pricing_Request_Item__c();
            priReqItem4.Pricing_Request__c = pricingRequest1.Id;
            priReqItem4.ERP_Sales_Prices_SAP__c = esapRcrd .Id;
            priReqItem4.Scaled_Price_Flag__c = true;
            priReqItem4.Pricing_Condition_Code__c = 'ZPSE';
            priReqItem4.Pricing_Condition__c = 'Surfaces Gross Price';
            priReqItem4.Key_Combination_Code__c = 'A580';
            priReqItem4.Key_Combination__c = 'Sales Org./Dist. Channel/Ship to/Division/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/End User/End Use/EndUser/Partner ZF/Material Group 1/Payer/Campaign/Document Currency/State';
            priReqItem4.Customer_Specific__c=true;  
            priReqItem4.PH1_Code__c='B9';
            priReqItem4.PH2_Code__c='01';
            priReqItem4.PH3_Code__c='10';
            priReqItem4.PH4_Code__c='06';
            priReqItem4.PH5_Code__c='01';
            priReqItem4.PH6_Code__c='01';
            priReqItem4.PH7_Code__c='53';
            priReqItem4.PH8_Code__c='26';    
            priReqItem4.PH9_Code__c='99';    
            priReqItem4.New_UoM__c=null;
            priReqItem4.New_Per__c=null;
            priReqItem4.Material_Code__c = 'D12345';  
            priReqItem4.ShipTo_Code__c='123456';
            priReqItem4.End_User_Code__c='123456';
            
            priReqItem4.New_Valid_To__c = System.today();
            priReqItem4.Calculation_Type__c='Fixed';
            pricingReqItemList.add(priReqItem4);
            
            
            insert pricingReqItemList;
            
            pricingRequest1.Request_Valid_From__c = System.today();
            
            update pricingRequest1;
            
            List<Pricing_Request_Item__c> priceitemlist = new List<Pricing_Request_Item__c>();
            
            List<Id> priceitemlistId = new List<Id>();
            priceitemlistId.add(priReqItem2.id);
            priceitemlistId.add(priReqItem3.id);
            priceitemlistId.add(priReqItem4.id);
            
            //<SS20220826>-- added query for sales order item code 
            priceitemlist = [SELECT Id,New_Per__c,Non_Commercial_Products__c,Calculation_Type__c,State_Code__c,Campaign_Code__c,Document_Currency_Code__c,Disc_Ref_No__c,FixValDate__c,Partner_ZF_Code__c,Payer_Code__c,Sales_District_Code__c,Material_Group_1_Code__c,Incoterms_Code__c,Ship_To_Country_Code__c,Customer_Hierarchy_Code__c,Profit_Center_Code__c,Country_Code__c,Price_Ref_Partner_Code__c,Destination_Country_Code__c,Shipping_Condition_Code__c,Value_Center_Code__c,Material_group_2_Code__c,Ext_Matl_Grp_Code__c,Plant_Code__c,Price_Zone_Code__c,Material_Group_5_Key_Code__c,ComPartner_Code__c,Sales_Order_Type_Code__c,Sales_Order_Item_Code__c,Contract_Code__c,Variant_Code__c,Market_Segment_Code__c,End_Use_Code__c,Disc_Ref__c,Terms_Of_Payment_Code__c,Price_List_Type_Code__c,Material_Price_Group_Code__c,Customer_Price_Group_Code__c,Sales_Office_Code__c,Pricing_Request__c,Sales_Org_Code__c,Division_Code__c,Dist_Channel_Code__c,ERP_Sales_Prices_SAP__c,Scaled_Price_Flag__c,Pricing_Condition_Code__c,Pricing_Condition__c,Key_Combination_Code__c,Key_Combination__c,Customer_Specific__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,New_UoM__c,New_Unit__c,Material_Code__c,ShipTo_Code__c,End_User_Code__c,New_Valid_To__c,F_Product_Hierarchy_Code__c,Sold_To_Code__c FROM Pricing_Request_Item__c WHERE Id =:priceitemlistId];
            
            
            SalesPriceSAP.cloneValidation(priceitemlist,pricingRequest1);
            
            
            Test.stopTest();
            
        }
    }
}