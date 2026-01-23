@isTest
public class PA_Util_UTTest
{
/*static testMethod void testmethod1()
  {
    
    

 Rebate_Price_Quote_Data__c pr4 = new Rebate_Price_Quote_Data__c (Name='XXX',BU__c='XXX',Default_Currency__c='XXX',Default_Per__c=1,Default_UoM__c='XXX',Dist_Channel_Code__c='10',Division_Code__c='02',Lookup_KeyCombination__c='A815',Public_Group__c='End_User_Rebate_Users',Retroactive_Days__c=0,RPQ_Report_Public_Group__c='End_User_Rebate_Report_Users',Sales_Org_Code__c='A640');
        insert pr4;
     Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
    RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    //Pricing Request 
    Pricing_Request__c pr = new Pricing_Request__c(Bu__c='XXX',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX',SAP_Application_Id__c='XXX');
    insert pr;
             
             List<Rebate_Price_Quote_Data__c> rebatePriceQuoteData = new List<Rebate_Price_Quote_Data__c>();    //subbu
             Map<Id,string> countryMap = new Map<Id,string>();  //subbu
                                
    //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='XXX',
            Pricing_Procedure_Description__c='XXX',Pricing_Procedure__c='XXX',
            SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX');
            insert pp;
    //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX',
                                                Pricing_Condition_Code__c='XXX',Calculation_Type__c='XXX',Price_Types__c='Net Reference'));
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX',
                                                Pricing_Condition_Code__c='XXX',Calculation_Type__c='XXX',Price_Types__c='Net Floor'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XXX',SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX'));
            insert pcList;
            
            
 ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='XXX';
        ERP_PC.Pricing_Condition_Code__c='XXX';
        ERP_PC.Calculation_Type__c='XXX';
        ERP_PC.Condition_Class__c='XXX';
        ERP_PC.Pricing_Condition_Code__c='XXX';
        ERP_PC.SAP_Application_Id__c='XXX';
        ERP_PC.SAP_Client_Id__c='XXX';
        ERP_PC.SAP_Cluster__c='XXX';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='XXX';
        insert ERP_PC;
        
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='XXX';
        ERP_PC1.Pricing_Condition_Code__c='XXX';
        ERP_PC1.Calculation_Type__c='XXX';
        ERP_PC1.Condition_Class__c='XXX';
        ERP_PC1.Pricing_Condition_Code__c='XXX';
        ERP_PC1.SAP_Application_Id__c='XXX';
        ERP_PC1.SAP_Client_Id__c='XXX';
        ERP_PC1.SAP_Cluster__c='XXX';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='XXX';
        insert ERP_PC1;
        
        
ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='XXX';
            ERP_KC.SAP_APPLICATION_ID__C = 'XXX';
            ERP_KC.SAP_CLIENT_ID__C = 'XXX';
            ERP_KC.SAP_Cluster__c = 'XXX';
            ERP_KC.Status__c='XXX';
            ERP_KC.Key_Combination__c='XXX';
            insert ERP_KC;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX',
                                                 Key_Combination_Code__c='XXX',Key_Combination__c='XXX'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='XXX',Key_Combination__c='XXX',
                                    SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX'));
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='XXX',Key_Combination__c='XXX',
                                    SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX'));                                    
            insert kcList;
            
    
    //OrgGrpItem
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='XXX',RecordTypeId=rType.Id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id));          
            
            insert orgItemList;
            
            List<ERP_Access_Sequence__c> acSqList  = new List<ERP_Access_Sequence__c>();
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Net_Floor_Key_Combination__c=kcList[0].id,
                                                Reference_Key_Combination__c=kcList[0].id, Cost_Key_Combination__c=kcList[1].id,Cost_Pricing_Condition__c=pcList[1].id));
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Net_Floor_Key_Combination__c=null,
                                                Reference_Key_Combination__c=kcList[0].id, Cost_Key_Combination__c=kcList[1].id,Cost_Pricing_Condition__c=pcList[1].id
                                                ,Net_Reference_Key_Combination__c=ERP_KC.id));
            //2 
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=pcList[0].id,
                                                Pricing_Key_Combination__c=kcList[2].id,Net_Floor_Key_Combination__c=ERP_KC.id,Net_Reference_Key_Combination__c=ERP_KC.id));  
                                                
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC.id,
                                                Pricing_Key_Combination__c=ERP_KC.id));  
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC1.id,
                                                Pricing_Key_Combination__c=ERP_KC.id));                                                                             
            insert acSqList;   
            
            //Pricing ReqItem
            List<Pricing_Request_Item__c> toTestList = new List<Pricing_Request_Item__c>();
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='XXX',Material_Code__c='XXX',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='XXX',Pricing_Request__c=pr.Id,
                                Rate__c='10',SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX',Per__c=1,
                                Unit__c='XXX',UoM__c='XXX',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(1),
                                New_UoM__c='XXX',New_Unit__c='EUR',New_Rate__c='55',Key_Combination_code__c='XXX',Pricing_Request_Type__c='XXX',Country_Code__c='IN',Customer_Price_Group_Code__c='XXX',sales_office_code__c='XXX',Profit_Center_code__c='XXX',Product_Hierarchy_Code__c='XXX',End_Use_code__c='T1',PH1_Code__c='Te',PH2_Code__c='st',PH3_Code__c='12',
                                key_combination__c='XXX',New_Per__c=2));
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='XXX',material_code__c='XXX',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='XXX',Pricing_Request__c=pr.Id,
                                Rate__c='10',SAP_Application_Id__c='XXX',SAP_Client_Id__c='XXX',SAP_Cluster__c='XXX',Per__c=1,
                                Unit__c='XXX',UoM__c='XXX',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(2),
                                New_UoM__c='XXX',New_Unit__c='EUR',New_Rate__c='55',Key_Combination_code__c='XXX',Pricing_Request_Type__c='XXX',
                                key_combination__c='XXX',New_Per__c=2));
            //mohit                    
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='12345',material_code__c='M1',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
                                Rate__c='200',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(1),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Floor',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));                   
            //Prqi having all the req. values 
            insert toTestList;
            
            
            List<String> expectedKCList = new List<String>();       //subbu
            expectedKCList.add('COUNTRY');
            
            //Non sap Records
            List<Sales_Prices__c> nonSAPList = new List<Sales_Prices__c>();
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='XXX',Per__c=1,UoM__c='XXX',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='XXX',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='XXX',
                                    Pricing_Condition_Code__c='XXX',Key_Combination_Code__c='XXX',Key_Combination__c='XXX'
                                    ,isPriceHolder__c =false,Bu__c='XXX'));
            nonSAPList.add(new Sales_Prices__c(Unit__c='XXX',Per__c=1,UoM__c='XXX',Rate__c='123.51',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='XXX',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='XXX',
                                    Pricing_Condition_Code__c='XXX',Key_Combination_Code__c='XXX',Key_Combination__c='XXX'
                                    ,isPriceHolder__c =false,Bu__c='XXX'));
            nonSAPList.add(new Sales_Prices__c(Unit__c='USD',Per__c=1,UoM__c='LT',Rate__c='144.51',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(4),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XRF2',Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
                                   ,isPriceHolder__c =false,Bu__c='BI EMEA Surfaces' ));                                                                                         
            insert nonSAPList;
            
            string  nonSAP0 = [select pckc__c FROM Sales_Prices__c Where id=:nonSAPList[0].id].pckc__c;
            system.debug('*** pckc Value From Test Class'+nonSAP0+' '+nonSAPList[1].pckc__c);
            Material__c material = new Material__c(ERP_Source_Cluster__c='XXX',ERP_Material_code__c='XXX',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=r.id,
                                    ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                    ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                    ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                    ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                    ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                    ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
            insert material;
            ERP_Customer__c cust = new ERP_Customer__c(Country_Code__c='DE',Customer_Price_Group_Code__c='Z0',Customer_Code__c='12345',sales_Office_code__c='CH');
            insert cust;
            
            Map<string,List<ERP_Material_Conversion_factor__c>> materialCodeMFC=new map<string,List<ERP_Material_Conversion_factor__c>>();  //subbu   
            
            
            List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
            emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='XXX',
                                                Base_UOM__c='XXX',Denominator_X__c='1',Numerator_Y__c='1',
                                                Material__c=material.Id));
            emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='XXX',
                                                Base_UOM__c='XXX',Denominator_X__c='59,23',Numerator_Y__c='1,12',
                                                Material__c=material.Id));
            emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',
                                                Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',
                                                Material__c=material.Id));                                                                                                     
            insert emfList;
            
            List<ERP_Material_Conversion_factor__c> erpMCList = new List<ERP_Material_Conversion_factor__c>();
            
            list<Decimal> dc =  new list<Decimal>();
            dc.add(10.00);
            dc.add(20.00);
            dc.add(30.00);
            dc.add(40.00);
                                                                                    
            PAUtil.calculateFloorAndReference(toTestList);    
            
            //subbu
            
            Standard_UoM_Conversion__c stdCon = new Standard_UoM_Conversion__c();
            stdCon.Denominator__c = '10';
            stdCon.Numerator__c = '50';
            stdCon.Name = 'EA_KG';
            stdCon.Alternative_UOM__c = 'KG';
            stdCon.Base_UOM__c = 'EA';
            
            insert stdCon;
            
            List<RecordType> rt = [SELECT name,Id FROM RecordType WHERE sObjectType = 'Material__c' AND isActive = true AND developerName = 'ERP_Material_Extended_Data'];
            
            Material__c m1 = new Material__c();
            m1.erp_Material_code__c = 'M12';
            m1.ERP_Base_UOM__c = 'EA';
            m1.erp_distribution_channel_code__c = '10';
            m1.ERP_Sales_Org_Code__c = 'A640';
            m1.erp_source_cluster__c = 'CB1';
            m1.RecordTypeId = rt[0].Id;
            insert m1;
            
            List<ERP_Material_Conversion_factor__c> emfList1 = new List<ERP_Material_Conversion_factor__c>();
           
            
            PAUtil.convertUoMMethod('EA','KG',100.00,'M1',true);   
            
            emfList1.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',
                                                Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',
                                                Material__c=m1.Id));
                                                                                                             
            insert emfList1;
                   
         
            PAUtil.checkPer('USD',1,2,100.00) ;
           // PAUtil.getMaterialBaseUoM('MI');
            PAUtil.isEndUserRebateEnabled();  
            PAUtil.hasPriceListAccess();   
            PAUtil.sortRateList(dc,'desc');                                                    
       
        //Subbu
         //   PAUtil.isConversionNeeded(toTestList[0],nonSAPList[0],false);
            PAUtil.getBuAdmin(p.id);
           PAUtil.calculateCost(toTestList);
             PAUtil.calculateNetFloorAndReference(toTestList);
             PAUtil.convertUoMToBaseUoM('100','EA','EA','MI','CB1',true);
             PAUtil.standardizeRate(toTestList[0],pcList[0],'A640','10','USD','EA',true);
            
            //subbu
             PAUtil.trigExecChk = true;
             
             PAUtil.trigPricingRequestCheck = true;
             PAUtil.TaskCreationAfterApproval = true;           
            
            //subbu
            Map<Integer,String> kcOrderMap =  new Map<Integer,String>{1=>'Sales Org.',2=>'Dist. Channel',3=>'Division',4=>'Sold to',5=>'Material',6 =>'PH1',7 =>'PH2',8 =>'PH3',9 =>'PH4',10 =>'PH5',11 =>'PH6',12 =>'PH7',13 =>'PH8',14 =>'PH9', 15 => 'Ship To', 16 => 'Sales Office', 17 => 'Customer Price Group', 18 => 'Material Price Group Code', 19 => 'Price List Type', 20 => 'Terms of Payment', 21 => 'End Use', 22 => 'Market Segment', 23 => 'Variant Code',24 => 'Sales Order Type', 25 => 'Country', 26=> 'FRB', 27 => 'Incoterms', 28 => 'Ship-To Country', 29 => 'ComPartner Code', 30 => 'Kcode', 31 => 'Material Group 1', 32 => 'Sales District', 33 => 'Partner ZF Code', 34 => 'Payer Code', 35 => 'Disc Ref No', 36 => 'FixValDate', 37 => 'Campaign Code', 38 => 'Document Currency Code', 39 => 'State Code', 40 => 'Landing Cost', 41=>  'Material Group 5 Key'};
     
            Set<string> expectedKCSet1 = new Set<string>();
            expectedKCSet1.add('Sales Org.');
            expectedKCSet1.add('Division');
            
            
  }*/
  
   static testMethod void calculateFlrAndRefTestMethod()
  {
    
    

 Rebate_Price_Quote_Data__c pr4 = new Rebate_Price_Quote_Data__c (Name='DPT NA-AD50',BU__c='',Default_Currency__c='USD',Default_Per__c=1,Default_UoM__c='BX',Dist_Channel_Code__c='10',Division_Code__c='02',Lookup_KeyCombination__c='A815',Public_Group__c='End_User_Rebate_Users',Retroactive_Days__c=0,RPQ_Report_Public_Group__c='End_User_Rebate_Report_Users',Sales_Org_Code__c='AD50');
        insert pr4;
     Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
    RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    //Pricing Request 
    Pricing_Request__c pr = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V');
    insert pr;
    Pricing_Request__c pr1 = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V',is_End_User_Rebate__c=true);
    insert pr1;
             
             List<Rebate_Price_Quote_Data__c> rebatePriceQuoteData = new List<Rebate_Price_Quote_Data__c>();    //subbu
             Map<Id,string> countryMap = new Map<Id,string>();  //subbu
                                
    //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
    //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE',Calculation_Type__c='Quantity'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            insert pcList;
            
            
 ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Net Floor';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='XFL2';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Net Reference';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='XFL2';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        
ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='X500';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sales office/MATERIAL PRICE GROUP/END USE/LANDING COST/Sold to/Material'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                    SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='A582',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                    SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));                                    
            insert kcList;
            
    
    //OrgGrpItem
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.Id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id));          
            
            insert orgItemList;
            
            List<ERP_Access_Sequence__c> acSqList  = new List<ERP_Access_Sequence__c>();
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,
                                                Reference_Key_Combination__c=kcList[0].id, Cost_Key_Combination__c=kcList[1].id,Cost_Pricing_Condition__c=pcList[1].id));
            //2 
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=pcList[0].id,
                                                Pricing_Key_Combination__c=kcList[2].id,Net_Floor_Key_Combination__c=ERP_KC.id,Net_Reference_Key_Combination__c=ERP_KC.id));  
                                                
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC.id,
                                                Pricing_Key_Combination__c=ERP_KC.id));  
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC1.id,
                                                Pricing_Key_Combination__c=ERP_KC.id));                                                                             
            insert acSqList;   
            
            //Pricing ReqItem
            List<Pricing_Request_Item__c> toTestList = new List<Pricing_Request_Item__c>();
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='12345',material_code__c='M1',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
                                Rate__c='10',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(1),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Permanent',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='12345',material_code__c='M1',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
                                Rate__c='10',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(2),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Permanent',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));
            //mohit                    
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='12345',material_code__c='M1',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr1.Id,
                                Rate__c='200',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(1),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Floor',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));                   
            //Prqi having all the req. values 
            insert toTestList;
            
            
            List<String> expectedKCList = new List<String>();       //subbu
            expectedKCList.add('COUNTRY');                  
            expectedKCList.add('CUSTOMER PRICE GROUP');                 
            expectedKCList.add('SALES ORG.');           
            expectedKCList.add('DIST. CHANNEL');            
            expectedKCList.add('DIVISION');
            expectedKCList.add('SALES OFFICE');
            expectedKCList.add('FRB');
            expectedKCList.add('PH1');
            expectedKCList.add('MATERIAL');
            expectedKCList.add('MATERIAL PRICE GROUP');
            expectedKCList.add('END USE');
            expectedKCList.add('LANDING COST');
            
            //Non sap Records
            List<Sales_Prices__c> nonSAPList = new List<Sales_Prices__c>();
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
                                    ));
            nonSAPList.add(new Sales_Prices__c(Unit__c='USD',Per__c=1,UoM__c='EA',Rate__c='123.51',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XRF2',Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
                                    ));
            nonSAPList.add(new Sales_Prices__c(Unit__c='USD',Per__c=1,UoM__c='LT',Rate__c='144.51',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(4),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XRF2',Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
                                    ));                                                                                         
            insert nonSAPList;
            
            string  nonSAP0 = [select pckc__c FROM Sales_Prices__c Where id=:nonSAPList[0].id].pckc__c;
            system.debug('*** pckc Value From Test Class'+nonSAP0+' '+nonSAPList[1].pckc__c);
            Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='M1',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=r.id,
                                    ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                    ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                    ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                    ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                    ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                    ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
            insert material;
            ERP_Customer__c cust = new ERP_Customer__c(Country_Code__c='DE',Customer_Price_Group_Code__c='Z0',Customer_Code__c='12345',sales_Office_code__c='CH');
            insert cust;
            
            Map<string,List<ERP_Material_Conversion_factor__c>> materialCodeMFC=new map<string,List<ERP_Material_Conversion_factor__c>>();  //subbu   
            
            
            List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
            emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',
                                                Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',
                                                Material__c=material.Id));
            emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',
                                                Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',
                                                Material__c=material.Id));
            emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',
                                                Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',
                                                Material__c=material.Id));                                                                                                     
            insert emfList;
            
            List<ERP_Material_Conversion_factor__c> erpMCList = new List<ERP_Material_Conversion_factor__c>();
            
            list<Decimal> dc =  new list<Decimal>();
            dc.add(10.00);
            dc.add(20.00);
            dc.add(30.00);
            dc.add(40.00);
                                                                                    
            PAUtil.calculateFloorAndReference(toTestList);    
     //subbu
            PAUtil.convertUoMMethod('EA','KG',100.00,'M1',false);            
            PAUtil.checkPer('USD',1,2,100.00) ;
           // PAUtil.getMaterialBaseUoM('MI');
            PAUtil.isEndUserRebateEnabled();  
            PAUtil.hasPriceListAccess();   
            PAUtil.sortRateList(dc,'desc');                                                    
       //     PAUtil.isConversionNeeded(toTestList[0],nonSAPList[0],false);
            PAUtil.getBuAdmin(p.id);
           PAUtil.calculateCost(toTestList);
             PAUtil.calculateNetFloorAndReference(toTestList);
             //subbu
             PAUtil.convertUoMToBaseUoM('100','EA','EA','MI','CB1',true);
             set<String> mlCode= new set<String>();
             mlCode.add('M1');             
             PAUtil.populateBaseUoMAndAlternateUoM(mlCode,'A640:10:CB1');
             PAUtil.standardizeRate(toTestList[0],pcList[0],'A640','10','USD','EA',true);
             
             PAUtil.trigPricingRequestCheck = true;
             PAUtil.TaskCreationAfterApproval = true;
            
             PAUtil.isConversionNeeded(toTestList[0], nonSAPList[0],true);
             PAUtil.isConversionNeeded(toTestList[0], nonSAPList[0],false);
            
            //subbu
            Map<Integer,String> kcOrderMap =  new Map<Integer,String>{1=>'Sales Org.',2=>'Dist. Channel',3=>'Division',4=>'Sold to',5=>'Material',6 =>'PH1',7 =>'PH2',8 =>'PH3',9 =>'PH4',10 =>'PH5',11 =>'PH6',12 =>'PH7',13 =>'PH8',14 =>'PH9', 15 => 'Ship To', 16 => 'Sales Office', 17 => 'Customer Price Group', 18 => 'Material Price Group Code', 19 => 'Price List Type', 20 => 'Terms of Payment', 21 => 'End Use', 22 => 'Market Segment', 23 => 'Variant Code',24 => 'Sales Order Type', 25 => 'Country', 26=> 'FRB', 27 => 'Incoterms', 28 => 'Ship-To Country', 29 => 'ComPartner Code', 30 => 'Kcode', 31 => 'Material Group 1', 32 => 'Sales District', 33 => 'Partner ZF Code', 34 => 'Payer Code', 35 => 'Disc Ref No', 36 => 'FixValDate', 37 => 'Campaign Code', 38 => 'Document Currency Code', 39 => 'State Code', 40 => 'Landing Cost', 41=>  'Material Group 5 Key'};
        /*  
            Map<Id,string> prqiFlrMap = new Map<Id,string>();
            prqiFlrMap.put(1,'Sales Org.');
            prqiFlrMap.put(2,'Dist. Channel');
            prqiFlrMap.put(3,'Division');
            prqiFlrMap.put(4,'Sold to');
            prqiFlrMap.put(5,'Material');
            prqiFlrMap.put(6,'PH1');
            prqiFlrMap.put(7,'PH2');
            prqiFlrMap.put(8,'PH3');
            prqiFlrMap.put(9,'PH4');
            prqiFlrMap.put(10,'PH5');
            prqiFlrMap.put(11,'PH6');
            prqiFlrMap.put(12,'PH7');
            prqiFlrMap.put(13,'PH8');
            prqiFlrMap.put(14,'PH9');
            prqiFlrMap.put(15,'Ship To');
            prqiFlrMap.put(16,'Sales Office');
            prqiFlrMap.put(17,'Customer Price Group');
            prqiFlrMap.put(18,'Material Price Group Code');
            prqiFlrMap.put(19,'Price List Type');
            prqiFlrMap.put(20,'Terms of Payment');
            prqiFlrMap.put(21,'End Use');
            prqiFlrMap.put(22,'Market Segment');
            prqiFlrMap.put(23,'Variant Code');
            prqiFlrMap.put(24,'Sales Order Type');
            prqiFlrMap.put(25,'Country');
            prqiFlrMap.put(26,'FRB');
            prqiFlrMap.put(27,'Incoterms');
            prqiFlrMap.put(28,'Ship-To Country');
            prqiFlrMap.put(29,'ComPartner Code');
            prqiFlrMap.put(30,'Kcode');
            prqiFlrMap.put(31,'Material Group 1');
            prqiFlrMap.put(32,'Sales District');
            prqiFlrMap.put(33,'Partner ZF Code');
            prqiFlrMap.put(34,'Payer Code');
            prqiFlrMap.put(35,'Disc Ref No');
            prqiFlrMap.put(36,'FixValDate');
            prqiFlrMap.put(37,'Campaign Code');
            prqiFlrMap.put(38,'Document Currency Code');
            prqiFlrMap.put(39,'State Code');
            prqiFlrMap.put(40,'Landing Cost');
            prqiFlrMap.put(41,'Material Group 5 Key');
            
            List<>
            */
            
            Set<string> expectedKCSet1 = new Set<string>();
            expectedKCSet1.add('Sales Org.');
            expectedKCSet1.add('Division');
            
            
  }
  }