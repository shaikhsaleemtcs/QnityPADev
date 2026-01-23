/*
Date : 29/12/2016
Change : Mergre & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest
public class PA_Util_UT
{
    
    @testVisible static List<TariffCheck__mdt> getTariff{ 
get{ 
        getTariff = [SELECT BU_Name__c,Currency_Code__c,Sales_Area__c,Tariff_Rate__c FROM TariffCheck__mdt];
        System.debug('HeMAN'+getTariff);
    	return getTariff; 
} 
set; 
} 
    
    @testVisible static Pricing_Request__c getPR{
        get{
            getPR = [SELECT Id, BU__c , sales_org_code__c, Dist_Channel_Code__c, Division_code__c FROM Pricing_Request__c];
            return getPR;
        }
        set;
    }
//bala start
     
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
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
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
  
  
  //subbu
  static testMethod void calculateFlrAndRefTestMethod_ForSetGet()
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
            ERP_KC.Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/MATERIAL PRICE GROUP/END USE/LANDING COST/Sales Office';
            insert ERP_KC;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sales office/MATERIAL PRICE GROUP/END USE/LANDING COST/Sold to/Material'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                    SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='A582',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/MATERIAL PRICE GROUP/END USE/LANDING COST/Sales Office',
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
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A582',Pricing_Request_Type__c='Permanent',Country_Code__c='IN',Customer_Price_Group_Code__c='A1',sales_office_code__c='Test',Profit_Center_code__c='Test',Product_Hierarchy_Code__c='Test12',End_Use_code__c='T1',PH1_Code__c='Te',PH2_Code__c='st',PH3_Code__c='12',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sales office/MATERIAL PRICE GROUP/END USE/LANDING COST/Sold to/Material',New_Per__c=2));
            toTestList.add(new Pricing_Request_Item__c(sold_to_code__c='12345',material_code__c='M1',sales_org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
                                Rate__c='10',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(2),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Permanent',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));
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
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',BU__c='BI EMEA Surfaces',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
                                    ));
            nonSAPList.add(new Sales_Prices__c(Unit__c='USD',Per__c=1,UoM__c='EA',Rate__c='123.51',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',BU__c='BI EMEA Surfaces',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XRF2',Key_Combination_Code__c='X100',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
                                    ));
            nonSAPList.add(new Sales_Prices__c(Unit__c='USD',Per__c=1,UoM__c='LT',Rate__c='144.51',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(4),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Country_Code__c='DE',BU__c='BI EMEA Surfaces',
                                    PH1_Code__c='A6',PH2_Code__c='S1',PH3_Code__c='11',PH4_Code__c='12',PH5_Code__c='S1',PH6_Code__c='BB',Customer_Price_Group_Code__c='Z0',
                                    Pricing_Condition_Code__c='XRF2',Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use'
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
           //Commented --Subbu 
         //   PAUtil.convertUoMMethod('EA','KG',100.00,'M12',true);           
         
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
 
  
  
  static testMethod void testMethodConversionNeeded(){
    

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
                                                Reference_Key_Combination__c=kcList[1].id, Cost_Key_Combination__c=kcList[1].id,Cost_Pricing_Condition__c=pcList[1].id
                                                ,is_End_User_Rebate__c=true));
            //2 
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=pcList[0].id,is_End_User_Rebate__c=true,
                                                Pricing_Key_Combination__c=kcList[2].id,Net_Floor_Key_Combination__c=ERP_KC.id,Net_Reference_Key_Combination__c=ERP_KC.id));  
                                                
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC.id,is_End_User_Rebate__c=true,
                                                Pricing_Key_Combination__c=ERP_KC.id));  
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC1.id,is_End_User_Rebate__c=true,
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
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
                                Rate__c='200',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(1),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Floor',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));                   
            //Prqi having all the req. values 
            insert toTestList;
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
                                          
        //    PAUtil PaUtil = new PAUtil();
          //  PaUtil.isConversionNeeded(toTestList[0],nonSAPList[0],false);  
                                                  
            PAUtil.calculateFloorAndReference(toTestList);    
            PAUtil.convertUoMMethod('EA','KG',100.00,'M1',false);            
            PAUtil.checkPer('USD',1,2,100.00) ;
           // PAUtil.getMaterialBaseUoM('MI');
            PAUtil.isEndUserRebateEnabled();  
            PAUtil.hasPriceListAccess();   
            PAUtil.sortRateList(dc,'desc');                                                    
         //   PAUtil.isConversionNeeded(toTestList[0],nonSAPList[0],false);
            PAUtil.getBuAdmin(p.id);
           PAUtil.calculateCost(toTestList);
             PAUtil.calculateNetFloorAndReference(toTestList);
             PAUtil.convertUoMToBaseUoM('100','EA','EA','MI','CB1',false);
             PAUtil.standardizeRate(toTestList[0],pcList[0],'A640','10','USD','EA',true);
             
             PAUtil.trigPricingRequestCheck = true;
             PAUtil.TaskCreationAfterApproval = true;
  }
    
    //manav
  static testMethod void testTariffMethod(){
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    List<TariffCheck__mdt> testgetTariff = (List<TariffCheck__mdt>) Json.deserialize('[{"BU_Name__c":"DPP AP","Currency_Code__c":"CNY","Sales_Area__c":"B991-10-02","Tariff_Rate__c":"109.2"}]', List<TariffCheck__mdt>.class);
    getTariff = testgetTariff; 
      
	Pricing_Request__c pr1 = new Pricing_Request__c(BU__c='DPP AP', Sales_Org_Code__c='B991', Dist_Channel_Code__c='10', Division_Code__c='02', request_Name__c='testTarrif');
	insert pr1;  
    getPR = pr1;
 
    ERP_Pricing_Condition__c ERP_PC11 = new ERP_Pricing_Condition__c();
    ERP_PC11.Price_Types__c='Standard; Pricing Task-Spot';
    ERP_PC11.Pricing_Condition_Code__c='Price';
    ERP_PC11.Calculation_Type__c='Quantity';
    ERP_PC11.Condition_Class__c='Prices';
    ERP_PC11.Pricing_Condition_Code__c='ZPRB';
    ERP_PC11.SAP_Application_Id__c='V';
    ERP_PC11.SAP_Client_Id__c='300';
    ERP_PC11.SAP_Cluster__c='Q23';
    ERP_PC11.SAP_Condition_Type__c=true;
    ERP_PC11.Pricing_Condition__c='B9-EP GROSS Price';
    insert ERP_PC11;

    OrgGroup__c Business1 = new OrgGroup__c(Business__c='DPP AP',RecordTypeId=rType.Id);
    insert Business1;

    Pricing_Request_Item__c pri = new Pricing_Request_Item__c(sold_to_code__c='12345',sales_org_code__c='B991',
        Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Request__c=getPR.ID,
        Rate__c='20',Per__c=1,Unit__c='CNY',UoM__c='EA', New_UoM__c='KG',New_Unit__c='CNY',New_Rate__c='12',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/End Use',New_Per__c=1);

    pri.Pricing_Request__r = getPR;

    insert pri;
 
    PAUtil.standardizeRate(pri,ERP_PC11,'B991','10','CNY',' ',true);
    
}

  
    static testMethod void testMethodStandardizeRate(){
    

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
                                                Reference_Key_Combination__c=kcList[1].id, Cost_Key_Combination__c=kcList[1].id,Cost_Pricing_Condition__c=pcList[1].id));
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
                                Dist_Channel_Code__c='10',Division_Code__c='02',Pricing_Condition_Code__c='ZPSE',Pricing_Request__c=pr.Id,
                                Rate__c='200',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Per__c=1,
                                Unit__c='USD',UoM__c='EA',New_Valid_From__c=System.today(),New_Valid_To__c=System.today().addDays(1),
                                New_UoM__c='KG',New_Unit__c='EUR',New_Rate__c='12',Key_Combination_code__c='A580',Pricing_Request_Type__c='Floor',
                                key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',New_Per__c=2));                   
            //Prqi having all the req. values 
            insert toTestList;
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
                                          
        //    PAUtil PaUtil = new PAUtil();
          //  PaUtil.isConversionNeeded(toTestList[0],nonSAPList[0],false);  
                                                  
            PAUtil.calculateFloorAndReference(toTestList);    
            PAUtil.convertUoMMethod('EA','KG',100.00,'M1',false);            
            PAUtil.checkPer('USD',1,2,100.00) ;
           // PAUtil.getMaterialBaseUoM('MI');
            PAUtil.isEndUserRebateEnabled();  
            PAUtil.hasPriceListAccess();   
            PAUtil.sortRateList(dc,'desc');                                                    
         //   PAUtil.isConversionNeeded(toTestList[0],nonSAPList[0],false);
            PAUtil.getBuAdmin(p.id);
           PAUtil.calculateCost(toTestList);
             PAUtil.calculateNetFloorAndReference(toTestList);
             PAUtil.convertUoMToBaseUoM('100','EA','EA','MI','CB1',false);
             PAUtil.standardizeRate(toTestList[0],pcList[0],'A640','10','USD',' ',true);
             
             PAUtil.trigPricingRequestCheck = true;
             PAUtil.TaskCreationAfterApproval = true;
  }
  
  
  static testMethod void otherTestMethod()
  {
    
    //PriceList Member
    Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
    Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
    Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
      RecordType rr = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    /*  
     UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
     User u= new User(Firstname='test2test2',Alias='Hill', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='353001',profileid = p.id,
                         Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
     insert u;
     
     User u1= new User(Firstname='test2test21',Alias='Hill', Email='ambili1_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rg9847',
                         External_ERP_ID__c='123531',profileid = p.id,
                         Username='testingtset267612@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill1', CommunityNickname='mm11', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
     insert u1;
     
     User u2= new User(Firstname='33test2test',Alias='Hil1l', Email='ambi1li1_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rx9847',
                         External_ERP_ID__c='023530',profileid = p2.id,
                         Username='testingt267612@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill1', CommunityNickname='34mm11', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
     insert u2;
     */
     UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
     insert Ur;
     User usr1 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User1 FirstName','User1 LastName');
     insert usr1;
     User usr2 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User2 FirstName','User2 LastName');
     insert usr2;
     User usr3 = TestUserUtil.createTestUser(Ur.Id,p2.Id,'User2 FirstName','User2 LastName');
     insert usr3;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
     Group g = new Group();
     g.Name = 'testGroupNCPR';
     g.DeveloperName = 'testGroup';
     insert g;
     
       
     GroupMember  gm = new GroupMember ();
     gm.UserOrGroupId = usr1.Id;
     gm.GroupId = g.id;
     insert gm;                         
     system.runAs(usr1)
     {
        boolean b = PAUtil.hasPriceListAccess();
        
     }
    
     system.runAs(usr2)
     {
       Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='M1',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=rr.id,
                                    ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                    ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                    ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                    ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                    ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                    ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        PAUtil.getMaterialBaseUoM(material.ERP_Material_code__c);
        
        boolean b = PAUtil.hasPriceListAccess();
        PAUtil.getBuAdmin(p1.id);
    } 
     
     system.runAs(usr3)
     {
          
          Group g1 = new Group();
     g1.Name = 'testGroupNCPR';
     g1.DeveloperName = 'testGroup1';     
     insert g1;
     GroupMember gm1 = new GroupMember();
        gm1.GroupId = g1.id;
        gm1.UserOrGroupId = usr3.id;
        insert gm1;
        
           List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
           profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
           profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
           insert profilePermissionList;
           
           PermissionSet ps = [select id from PermissionSet where Name='Price_Approval_Approver'];
           
           
           PermissionSetAssignment psa = new PermissionSetAssignment(AssigneeId=usr3.Id,PermissionSetId=ps.id);
           insert psa; 
            PAUtil.displaySectionAndLinks();
            
            g1.Name='CPR';
            PAUtil.displaySectionAndLinks();

          //PAUtil.calculateNetFloorAndReference(prqiList);
     }
     //PAUtil.calculateNetFloorAndReference(prqiList);
     
  }
  
  
  
  static testMethod void otherTestMethodForCPR()
  {
    
    //PriceList Member
    Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
    Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
    Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
      RecordType rr = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
      //Start: Updated as a part of Merge & Spin to the change the UserRole name.
     /*
     UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
     User u= new User(Firstname='test2test2',Alias='Hill', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='335315',profileid = p.id,
                         Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
     insert u;
     
     User u1= new User(Firstname='test2test21',Alias='Hill', Email='ambili1_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rg9847',
                         External_ERP_ID__c='12353',profileid = p.id,
                         Username='testingtset267612@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill1', CommunityNickname='mm11', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
     insert u1;
     
     User u2= new User(Firstname='33test2test',Alias='Hil1l', Email='ambi1li1_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rx9847',
                         External_ERP_ID__c='02353',profileid = p2.id,
                         Username='testingt267612@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill1', CommunityNickname='34mm11', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
     insert u2;
     */
     UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
     insert Ur;
     User usr1 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User1 FirstName','User1 LastName');
     insert usr1;
     User usr2 = TestUserUtil.createTestUser(Ur.Id,p.Id,'User2 FirstName','User2 LastName');
     insert usr2;
     User usr3 = TestUserUtil.createTestUser(Ur.Id,p2.Id,'User2 FirstName','User2 LastName');
     insert usr3;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
     Group g = new Group();
     g.Name = 'CPR';            //subbu
     g.DeveloperName = 'testGroup';
     insert g;
     
       
     GroupMember  gm = new GroupMember ();
     gm.UserOrGroupId = usr1.Id;
     gm.GroupId = g.id;
     insert gm;                         
     system.runAs(usr1)
     {
        boolean b = PAUtil.hasPriceListAccess();
        
     }
    
     system.runAs(usr2)
     {
       Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='M1',
                                    ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',
                                    ERP_Sales_Org_Code__c='A640',RecordTypeId=rr.id,
                                    ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                    ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                    ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                    ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                    ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                    ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        PAUtil.getMaterialBaseUoM(material.ERP_Material_code__c);
        
        boolean b = PAUtil.hasPriceListAccess();
        PAUtil.getBuAdmin(p1.id);
    } 
     
     system.runAs(usr3)
     {
          
          Group g1 = new Group();
     g1.Name = 'CPR';                   //subbu
     g1.DeveloperName = 'testGroup1';     
     insert g1;
     GroupMember gm1 = new GroupMember();
        gm1.GroupId = g1.id;
        gm1.UserOrGroupId = usr3.id;
        insert gm1;
        
           List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
           profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
           profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
           insert profilePermissionList;
           
           PermissionSet ps = [select id from PermissionSet where Name='Price_Approval_Approver'];
           
           
           PermissionSetAssignment psa = new PermissionSetAssignment(AssigneeId=usr3.Id,PermissionSetId=ps.id);
           insert psa; 
            PAUtil.displaySectionAndLinks();
            
            g1.Name='CPR';
            PAUtil.displaySectionAndLinks();

          //PAUtil.calculateNetFloorAndReference(prqiList);
     }
     //PAUtil.calculateNetFloorAndReference(prqiList);
     
  }
  
  
  static testMethod void flagCheckTestMethod()
  {
    RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    //Pricing Request 
    Pricing_Request__c pr = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V');
    insert pr;
    
    //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
    //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Sales Office/MATERIAL PRICE GROUP/END USE/LANDING COST/Material'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Sales Office/MATERIAL PRICE GROUP/END USE/LANDING COST/Material',
                                    SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            
            
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A640',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Sales Office/FRB/PH1/End Use/Material/MATERIAL PRICE GROUP/END USE/LANDING COST'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X400',Key_Combination__c='Sales Org./Dist. Channel/Division/Sales Office/FRB/PH1/End Use/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
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
                                                Pricing_Condition__c=pcList[0].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id));
            
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id));
            insert acSqList;
            
          //  acSqList[0]
            
            List<Pricing_Request_Item__c> prqiList = new List<Pricing_Request_Item__c>();
            prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='%',New_Unit__c='%',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/Sales Office/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='12345'
                                )); 
                                
                                
            //Vinoth
            prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='EUR',New_Unit__c='EUR',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Sales Office/FRB/PH1/End Use/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                key_combination_code__c='A640',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Sales_Office_Code__c='A202',Profit_Center_Code__c='F283283',PH1_Code__c='D8',End_Use_Code__c='D23',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='12345'
                                )); 
            //Vinoth
            
            
            
            insert prqiList;
            
            //Non sap Records
            List<Sales_Prices__c> nonSAPList = new List<Sales_Prices__c>();
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Material_code__c='D12345',country_code__c='DE',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Sales Office/Material/END USE/LANDING COST'
                                    ));
                                    
                                    
            //Vinoth
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Material_code__c='D12345',country_code__c='DE',Sales_Office_Code__c='A202',Profit_Center_Code__c='F283283',PH1_Code__c='D8',End_Use_Code__c='D23',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X400',Key_Combination__c='Sales Org./Dist. Channel/Division/Sales Office/FRB/PH1/End Use/Material/LANDING COST'
                                    ));
            //Vinoth
            
            
            
            
            insert nonSAPList;
            
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
            
            ERP_Customer__c cust = new ERP_Customer__c(Country_Code__c='DE',Customer_Price_Group_Code__c='Z0',Customer_Code__c='12345',sales_Office_code__c='CH');
            insert cust;
            
            
            
            
            //PAUtil.calculateFloorAndReference(prqiList);
            PAUtil.getNameField('solution');

    
  }
  static testMethod void bulkFlagCheckTestMethod()
  {

    RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    //Pricing Request 
    Pricing_Request__c pr = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V');
    insert pr;
    
    //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
    //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE',Calculation_Type__c = 'Quantity',Plus_Minus_Code__c='X'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            //pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Sales Office/Material/MATERIAL PRICE GROUP/END USE/LANDING COST'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
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
                                                Pricing_Condition__c=pcList[0].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id));
            insert acSqList;
            
            List<Pricing_Request_Item__c> prqiList = new List<Pricing_Request_Item__c>();
            
            
            //subbu
            for(Integer i = 0;i<100;i++)
            {
              prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='%',New_Unit__c='%',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A'+String.valueOf(i),country_code__c='abc',Customer_Price_Group_Code__c='123a',Sales_Office_Code__c='SALES OFFICE',
                                Sales_District_Code__c='12ad133',End_Use_code__c='end use',Campaign_Code__c='ab12',Document_Currency_Code__c='dfgfha12',State_Code__c='as',Profit_Center_code__c='FRB'
                                ));     
            }
            
            
            insert prqiList;
            
            //Non sap Records
            List<Sales_Prices__c> nonSAPList = new List<Sales_Prices__c>();
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Material_code__c='D12345',country_code__c='DE',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Material/MATERIAL PRICE GROUP/END USE/LANDING COST'
                                    ));
            insert nonSAPList;
            
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
            
            List<ERP_Customer__c> listCust  = new List<ERP_Customer__c>();
            for(Integer i = 0;i<100;i++)
            {
              listCust.add(new ERP_Customer__c(Country_Code__c='DE',Customer_Price_Group_Code__c='Z0',Customer_Code__c='A'+String.valueOf(i),sales_Office_code__c='CH'));
            }
            
            insert listCust;
            //pooja
            List<Product_Hierarchy__c> PHList = new List<Product_Hierarchy__c>();
        Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
        PH1.PH_Code__c = 'A6';
        PH1.PH_Level__c = 1;
        PHList.add(PH1);
        Product_Hierarchy__c PH2 = new Product_Hierarchy__c();
        PH2.PH_Code__c = 'A6S1';
        PH2.PH_Level__c = 2;
        PHList.add(PH2);
        
        Product_Hierarchy__c PH3 = new Product_Hierarchy__c();
        PH3.PH_Code__c = 'A6S4';
        PH3.PH_Level__c = 2;
        PHList.add(PH3);
        Product_Hierarchy__c PH4 = new Product_Hierarchy__c();
        PH4.PH_Code__c = 'A6S112';
        PH4.PH_Level__c = 3;
        PHList.add(PH4);
        
        Product_Hierarchy__c PH5 = new Product_Hierarchy__c();
        PH5.PH_Code__c = 'B6';
        PH5.PH_Level__c = 1;
        PHList.add(PH5);
        
        Product_Hierarchy__c PH6 = new Product_Hierarchy__c();
        PH6.PH_Code__c = 'A6S112AA';
        PH6.PH_Level__c = 4;
        PHList.add(PH6);
        insert PHList;
        
        List<BU_PH__c> buphList = new List<BU_PH__c>();
        BU_PH__c buph1 = new BU_PH__c();
        buph1.Product_Hierarchy__c = PHList[0].Id;
        buph1.OrgGroup__c = Business.Id;
        buph1.Business_Description__c = 'Test1';
        buph1.Representative_Material_Code__c = '1213124';
        buphList.add(buph1);
        BU_PH__c buph2 = new BU_PH__c();
        buph2.Product_Hierarchy__c = PHList[1].Id;
        buph2.OrgGroup__c = Business.Id;
        buph1.Representative_Material_Code__c = '124';
        //buph2.Business_Description__c = 'Test2';
        buphList.add(buph2);
        BU_PH__c buph3 = new BU_PH__c();
        buph3.Product_Hierarchy__c = PHList[2].Id;
        buph3.OrgGroup__c = Business.Id;
        buph3.Business_Description__c = 'Test3';
        buph1.Representative_Material_Code__c = '1213sfasf124';
        buphList.add(buph3);
        BU_PH__c buph4 = new BU_PH__c();
        buph4.Product_Hierarchy__c = PHList[3].Id;
        buph4.OrgGroup__c = Business.Id;
        //buph4.Business_Description__c = 'Test4';
        buph1.Representative_Material_Code__c = '1sf213124';
        buphList.add(buph4);
        BU_PH__c buph5 = new BU_PH__c();
        buph5.Product_Hierarchy__c = PHList[4].Id;
        buph5.OrgGroup__c = Business.Id;
        buph5.Business_Description__c = 'Test5';
        buph1.Representative_Material_Code__c = '1213saf124';
        buphList.add(buph5);
        BU_PH__c buph6 = new BU_PH__c();
        buph6.Product_Hierarchy__c = PHList[5].Id;
        buph6.OrgGroup__c = Business.Id;
        buph6.Business_Description__c = 'Test6';
        buph1.Representative_Material_Code__c = '1asfg213124';
        buphList.add(buph6);
        insert buphList;
            PAUtil.calculateFloorAndReference(prqiList);
            //PAUtil.calculateNetFloorAndReference(prqiList);
            
            //APAC
            ERP_Material_Conversion_Factor__c mcf = new ERP_Material_Conversion_Factor__c(Numerator_Y__c = '1',Denominator_X__c = '1',
                                                    Base_UoM__c = 'KG',Alternative_UoM__c = 'SH', Material__c = material.Id); 
            insert mcf;
            Set<String> matCodeSet = new Set<String>();
            matCodeSet.add('D12345');
            //PAUtil.matCodeToBaseUoMMap.put('D12345','KG');
            PAUtil.populateBaseUoMAndAlternateUoM(matCodeSet, 'A640:10:CB1');
            PAUtil.populateSourceUoMNumDeno(matCodeSet, 'CB1');
            PAUtil.getBaseUoMFromMaterialCode('D12345', 'A640:10:CB1');
            PAUtil.getBaseUoMFromMaterialCode('D123456', 'A640:10:CB1');
            PAUtil.getNumDenoFromMaterialCode('D12345', 'EA', 'SH','CB1',false);
            PAUtil.getNumDenoFromMaterialCode('D123456', 'EA', 'SH','CB1',false);
            PAUtil.getAlternateUoMFromMaterialCode('D12345', 'A640:10:CB1');
            prqiList = new List<Pricing_Request_Item__c>();
            prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='USD',New_Unit__c='EUR',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='SH',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A1'));
            prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='USD',New_Unit__c='EUR',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A1'));
                                System.debug('PRList0'+prqiList[0]+'PRList1'+prqiList[1]+'PCList0'+pcList[0]);
                              
            PAUtil.conversionRateMap.put('EUR',12.0);
            PAUtil.standardizeRate(prqiList[0], pcList[0], 'A640', '10','USD','KG',false);
            PAUtil.standardizeRate(prqiList[1], pcList[0], 'A640', '10','USD','KG',false);
            PAUtil.convertUoMToBaseUoM('10','TN','KG','Test Code','CB1',false);
            PAUtil.checkForSynchronousPH(prqiList);
            PAUtil.getNameField('');
            PAUtil.calculateNetFloorAndReference(prqiList);

  }
  
  
  //subbu
  
  static testMethod void bulkFlagCheckTestMethod_1()
  {

    RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    //Pricing Request 
    Pricing_Request__c pr = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V');
    insert pr;
    
    //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
    //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE',Calculation_Type__c = 'Quantity',Plus_Minus_Code__c='X'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            //pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2',SAP_Client_Id__c='510',SAP_Cluster__c='CB1'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Sales Office/Material/MATERIAL PRICE GROUP/END USE/LANDING COST'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
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
            //subbu
     /*       List<ERP_Access_Sequence__c> acSqList  = new List<ERP_Access_Sequence__c>();
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=null,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=null));
            insert acSqList;
        */    
            List<Pricing_Request_Item__c> prqiList = new List<Pricing_Request_Item__c>();
            
            
            
            for(Integer i = 0;i<100;i++)
            {
              prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='%',New_Unit__c='%',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A'+String.valueOf(i),country_code__c='abc',Customer_Price_Group_Code__c='123a',Sales_Office_Code__c='12345',
                                Sales_District_Code__c='12ad133',End_Use_code__c='abc123',Campaign_Code__c='ab12',Document_Currency_Code__c='dfgfha12',State_Code__c='as'
                                ));     
            }
            
            
            insert prqiList;
            
            //Non sap Records
            List<Sales_Prices__c> nonSAPList = new List<Sales_Prices__c>();
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Material_code__c='D12345',country_code__c='DE',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Material/MATERIAL PRICE GROUP/END USE/LANDING COST'
                                    ));
            insert nonSAPList;
            
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
            
            List<ERP_Customer__c> listCust  = new List<ERP_Customer__c>();
            for(Integer i = 0;i<100;i++)
            {
              listCust.add(new ERP_Customer__c(Country_Code__c='DE',Customer_Price_Group_Code__c='Z0',Customer_Code__c='A'+String.valueOf(i),sales_Office_code__c='CH'));
            }
            
            insert listCust;
            //pooja
            List<Product_Hierarchy__c> PHList = new List<Product_Hierarchy__c>();
        Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
        PH1.PH_Code__c = 'A6';
        PH1.PH_Level__c = 1;
        PHList.add(PH1);
        Product_Hierarchy__c PH2 = new Product_Hierarchy__c();
        PH2.PH_Code__c = 'A6S1';
        PH2.PH_Level__c = 2;
        PHList.add(PH2);
        
        Product_Hierarchy__c PH3 = new Product_Hierarchy__c();
        PH3.PH_Code__c = 'A6S4';
        PH3.PH_Level__c = 2;
        PHList.add(PH3);
        Product_Hierarchy__c PH4 = new Product_Hierarchy__c();
        PH4.PH_Code__c = 'A6S112';
        PH4.PH_Level__c = 3;
        PHList.add(PH4);
        
        Product_Hierarchy__c PH5 = new Product_Hierarchy__c();
        PH5.PH_Code__c = 'B6';
        PH5.PH_Level__c = 1;
        PHList.add(PH5);
        
        Product_Hierarchy__c PH6 = new Product_Hierarchy__c();
        PH6.PH_Code__c = 'A6S112AA';
        PH6.PH_Level__c = 4;
        PHList.add(PH6);
        insert PHList;
        
        List<BU_PH__c> buphList = new List<BU_PH__c>();
        BU_PH__c buph1 = new BU_PH__c();
        buph1.Product_Hierarchy__c = PHList[0].Id;
        buph1.OrgGroup__c = Business.Id;
        buph1.Business_Description__c = 'Test1';
        buph1.Representative_Material_Code__c = '1213124';
        buphList.add(buph1);
        BU_PH__c buph2 = new BU_PH__c();
        buph2.Product_Hierarchy__c = PHList[1].Id;
        buph2.OrgGroup__c = Business.Id;
        buph1.Representative_Material_Code__c = '124';
        //buph2.Business_Description__c = 'Test2';
        buphList.add(buph2);
        BU_PH__c buph3 = new BU_PH__c();
        buph3.Product_Hierarchy__c = PHList[2].Id;
        buph3.OrgGroup__c = Business.Id;
        buph3.Business_Description__c = 'Test3';
        buph1.Representative_Material_Code__c = '1213sfasf124';
        buphList.add(buph3);
        BU_PH__c buph4 = new BU_PH__c();
        buph4.Product_Hierarchy__c = PHList[3].Id;
        buph4.OrgGroup__c = Business.Id;
        //buph4.Business_Description__c = 'Test4';
        buph1.Representative_Material_Code__c = '1sf213124';
        buphList.add(buph4);
        BU_PH__c buph5 = new BU_PH__c();
        buph5.Product_Hierarchy__c = PHList[4].Id;
        buph5.OrgGroup__c = Business.Id;
        buph5.Business_Description__c = 'Test5';
        buph1.Representative_Material_Code__c = '1213saf124';
        buphList.add(buph5);
        BU_PH__c buph6 = new BU_PH__c();
        buph6.Product_Hierarchy__c = PHList[5].Id;
        buph6.OrgGroup__c = Business.Id;
        buph6.Business_Description__c = 'Test6';
        buph1.Representative_Material_Code__c = '1asfg213124';
        buphList.add(buph6);
        insert buphList;
            PAUtil.calculateFloorAndReference(prqiList);
            //PAUtil.calculateNetFloorAndReference(prqiList);
            
            //APAC
            ERP_Material_Conversion_Factor__c mcf = new ERP_Material_Conversion_Factor__c(Numerator_Y__c = '1',Denominator_X__c = '1',
                                                    Base_UoM__c = 'KG',Alternative_UoM__c = 'SH', Material__c = material.Id); 
            insert mcf;
            Set<String> matCodeSet = new Set<String>();
            matCodeSet.add('D12345');
            //PAUtil.matCodeToBaseUoMMap.put('D12345','KG');
            PAUtil.populateBaseUoMAndAlternateUoM(matCodeSet, 'A640:10:CB1');
            PAUtil.populateSourceUoMNumDeno(matCodeSet, 'CB1');
            PAUtil.getBaseUoMFromMaterialCode('D12345', 'A640:10:CB1');
            PAUtil.getBaseUoMFromMaterialCode('D123456', 'A640:10:CB1');
            PAUtil.getNumDenoFromMaterialCode('D12345', 'EA', 'SH','CB1',false);
            PAUtil.getNumDenoFromMaterialCode('D123456', 'EA', 'SH','CB1',false);
            PAUtil.getAlternateUoMFromMaterialCode('D12345', 'A640:10:CB1');
            prqiList = new List<Pricing_Request_Item__c>();
            prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='USD',New_Unit__c='EUR',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='SH',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A1'));
            prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='USD',New_Unit__c='EUR',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                key_combination_code__c='A580',Pricing_Condition_code__c='ZPSE',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A1'));
                                System.debug('PRList0'+prqiList[0]+'PRList1'+prqiList[1]+'PCList0'+pcList[0]);
                              
            PAUtil.conversionRateMap.put('EUR',12.0);
            PAUtil.standardizeRate(prqiList[0], pcList[0], 'A640', '10','USD','KG',false);
            PAUtil.standardizeRate(prqiList[1], pcList[0], 'A640', '10','USD','KG',false);
            PAUtil.convertUoMToBaseUoM('10','TN','KG','Test Code','CB1',false);
            PAUtil.checkForSynchronousPH(prqiList);
            PAUtil.getNameField('');
            PAUtil.calculateNetFloorAndReference(prqiList);

  }
  
  
   static testMethod void bulkFlagCheckTestMethod2(){

            Profile p1 = [select id from profile where Name='System Administrator' limit 1];
            
            UserRole r2=  TestUserUtil.createTestUserRole('BI-EMEA-Surfaces'); 
            User u1= new User(Firstname='test2test21',Alias='Hill', Email='ambili1_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rg9847',
                         External_ERP_ID__c='12353',profileid = p1.id,
                         Username='testingtset267612@dupont.com.uttest2',UserRoleId=r2.id, LastName='Hill1', CommunityNickname='mm11', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
             insert u1;
             
             system.runAs(u1)
             {  
                 PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
                paProfilePermissions.Name = 'Sales Admin';
                insert paProfilePermissions;       
                
                 List<PAProfilePermissions__c> paProfilePermissionsList = new List<PAProfilePermissions__c>();
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
        
                 RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
                RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
                RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
                //Pricing Request 
                Pricing_Request__c pr = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                            Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                            SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V');
                insert pr; 
                 List<Folder> Folders = [Select Id, Name From Folder Where Type = 'Email' and DeveloperName='Price_Approval_Email_Templates' limit 1];
                 EmailTemplate e = new EmailTemplate (developerName = 'test',isActive=true, TemplateType= 'Text', Name = 'test',FolderId = Folders[0].id);
                 insert e;
                 Contact c = new Contact(LastName='test',email='test@test.com');
                 insert c;
                 PAUtil.sendEmailMethod(e.id,new List<String>{'abc@abc.com'},pr.id,c.id);
                 List<decimal> decList= new List<decimal>{1,2,5,6,4};
                 PAUtil.sortRateList(decList,'asc');
                 PAUtil.sortRateList(decList,'desc');
                 PAUtil.GenID(1);
                 PAUtil.hasSalesAdminPermissionSet();
                 List<Pricing_Request__c> prlist=new List<Pricing_Request__c>();
                 prlist.add(pr);
                 PAUtil.Sortlist(prlist,'LastModifiedDate','asc');
                 PAUtil.Sortlist(prlist,'LastModifiedDate','desc');
                 PAUtil.determineLocaleSeparator();
                 PAUtil.getNameField('case');
                 RecordType buRecType = [select Id,Name from Recordtype where Name = 'Business'];
                 RecordType salesAreaRecType = [select Id,Name from Recordtype where Name = 'ERP Sales Area'];
                 OrgGroup__c orgGroup1 = new OrgGroup__c(); 
                 orgGroup1.Business__c = 'BI';
                 orgGroup1.RecordTypeId = buRecType.Id;
                 insert orgGroup1;
                 
                 ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
                 erpCustomer1.Customer_Code__c = 'T001';
                 erpCustomer1.Sales_Org_Code__c = 'A640';
                 erpCustomer1.Distribution_Channel_Code__c = '10';
                 erpCustomer1.Division_Code__c = '02';
                 erpCustomer1.Currency_Code__c = 'USD';
                 insert erpCustomer1;
                 
                 PAServiceState paServiceState = new PAServiceState();
                 PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
                 paOrgGroupItems.selectedBU = orgGroup1.Id;
                 paServiceState.ogItems = paOrgGroupItems;
                 PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
                 paERPCustomer.paERPCustomer = erpCustomer1;
                 paServiceState.erpCustomer = paERPCustomer;
                 paServiceState.erpCustomer.allCustomersWrapList = new List<PAWrapper>();
                 paServiceState.erpCustomer.allSalesRepsWrapList = new List<PAWrapper>();
                 PARequest request = new PARequest(paServiceState);
                 PASalesPriceSAP paSalesPriceSAP = new PASalesPriceSAP(paServiceState);
                 paSalesPriceSAP.exportWrapList = new List<PARelatedList>();
                 request.salesPriceSAP = paSalesPriceSAP;
                 request.relatedListRequestItemsList = new List<PARelatedList>();
                 request.relatedListERPSalesList = new List<PARelatedList>();
                 request.listrequestdetils = new Pricing_Request__c();
                 
                 PAUtil.deleteViewState(request);
                 //PAUtil.calculateNetFloorAndReference(prqiList);
             }
   }
   
   static testMethod void bulkFlagCheckTestMethod3()
  {

    RecordType r = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
    RecordType r1 = [select id from RecordType Where sObjectType='ERP_Customer__c' AND Name='ERP Customer - Extended Data'];
    RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
    //Pricing Request 
    Pricing_Request__c pr = new Pricing_Request__c(Bu__c='BI EMEA Surfaces',sales_Org_code__c='A640',
                                Dist_Channel_Code__c='10',Division_code__c='02',request_Name__c='testReq',
                                SAP_Client_Id__c='510',SAP_Cluster__c='CB1',SAP_Application_Id__c='V');
    insert pr;
    
    Map<Id,string> prqiPckc;
    List<string> expectedKCList = new List<string>(); 
    boolean isbothTrue = false;
     
    //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
    //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE',Calculation_Type__c = 'Quantity',Plus_Minus_Code__c='X'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Price_Types__c='Net Floor'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',Price_Types__c='Net Reference'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/MATERIAL PRICE GROUP/END USE/LANDING COST'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Country/Material/MATERIAL PRICE GROUP/END USE/LANDING COST',
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
                     
            
            
            
            List<ERP_Access_Sequence__c> acSqList  = new List<ERP_Access_Sequence__c>();
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,
                                                Net_Floor_Key_Combination__c = kcList[1].id,Net_Reference_Key_Combination__c = kcList[1].id));
           
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC.id,
                                                Pricing_Key_Combination__c=ERP_KC.id,Net_Floor_Key_Combination__c=ERP_KC.id,Net_Reference_Key_Combination__c=ERP_KC.id));  
                                                
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC.id,
                                                Pricing_Key_Combination__c=ERP_KC.id));  
            acSqList.add(new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,
                                                Pricing_Condition__c=ERP_PC1.id,
                                                Pricing_Key_Combination__c=ERP_KC.id));
           
           
            insert acSqList;
            
            List<Pricing_Request_Item__c> prqiList = new List<Pricing_Request_Item__c>();
            
            
            
            for(Integer i = 0;i<100;i++)
            {
              prqiList.add(new Pricing_Request_Item__c(Rate__c='120',New_Rate__c='350',Unit__c='%',New_Unit__c='%',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                key_combination_code__c='X500',Pricing_Condition_code__c='XFL2',uoM__c='EA',New_UoM__c='EA',Per__c=1,New_Per__c=1,Material_code__c='D12345',
                                sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
                                SAP_Cluster__c='CB1',Pricing_Request__c=pr.id,sold_to_code__c='A'+String.valueOf(i),Country_Code__c='123',Customer_Price_Group_Code__c='1234',Sales_Office_Code__c='12345',End_Use_code__c='12',Pricing_Request_Type__c='Import'
                                ));     //subbu
            }
            
            
            insert prqiList;
            
            //Non sap Records
            List<Sales_Prices__c> nonSAPList = new List<Sales_Prices__c>();
            
            nonSAPList.add(new Sales_Prices__c(Unit__c='EUR',Per__c=1,UoM__c='EA',Rate__c='165',Valid_From__c=System.today(),Valid_to__c=System.today().addDays(2),
                                    sales_org_code__c='A640',Dist_Channel_Code__c='10',Division_Code__c='02',Material_code__c='D12345',country_code__c='DE',
                                    Pricing_Condition_Code__c='XFL2',Key_Combination_Code__c='X500',Key_Combination__c='Sales Org./Dist. Channel/Division/Material'
                                    ));
            insert nonSAPList;
            
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
            
            List<ERP_Customer__c> listCust  = new List<ERP_Customer__c>();
            for(Integer i = 0;i<100;i++)
            {
              listCust.add(new ERP_Customer__c(Country_Code__c='DE',Customer_Price_Group_Code__c='Z0',Customer_Code__c='A'+String.valueOf(i),sales_Office_code__c='CH'));
            }
            
            insert listCust;
            
            PAUtil.calculateNetFloorAndReference(prqiList);
            //PAUtil.calculateNetFloorAndReference(prqiList);
            
            PAUtil.apexErrorMsg('error');
            PAUtil.apexWarningMsg('Warning');
         
    }   
 }