@Istest
public with sharing class DummyTestclass {

    static testMethod void testDCP_EMEA_SPP()
    {
        
        Trig_calculateNetPrice_UT1.customSettings();
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        
        PASalesDocTypeSOMapping__c saleCustm = new PASalesDocTypeSOMapping__c();
        saleCustm.name='Others';
        saleCustm.Sales_Document_Type__c='ZOR1';
        insert saleCustm;
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DCP EMEA F809,F80A,F80C,F80N,F812,F81B,F81P,F81R,F820,F821,F822,F82A,F841,F846,F84K,F853,F85A,F865,F86A,F890,F893 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP EMEA SPP';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZPG4';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZDA1';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC2);
        ERP_Pricing_Condition__c ERP_PC3 = new ERP_Pricing_Condition__c();
        ERP_PC3.Price_Types__c='Standard';
        ERP_PC3.Calculation_Type__c='Quantity';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZDA2';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ZPG4';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Standard';
        ERP_PC5.Calculation_Type__c='Percentage';
        ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='ZD70';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Standard';
        ERP_PC6.Calculation_Type__c='Quantity';
        ERP_PC6.Condition_Class__c='Discount or Surcharge';
        ERP_PC6.Pricing_Condition_Code__c='ZFLT';
        ERP_PC6.SAP_Application_Id__c='V';
        ERP_PC6.SAP_Client_Id__c='510';
        ERP_PC6.SAP_Cluster__c='CB1';
        ERP_PC6.SAP_Condition_Type__c=true;
        ERP_PC6.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC6);
        ERP_Pricing_Condition__c ERP_PC7 = new ERP_Pricing_Condition__c();
        ERP_PC7.Price_Types__c='Net Price';
        ERP_PC7.Pricing_Condition_Code__c='NP';
        ERP_PC7.SAP_Application_Id__c='V';
        ERP_PC7.SAP_Client_Id__c='510';
        ERP_PC7.SAP_Cluster__c='CB1';
        ERP_PC7.SAP_Condition_Type__c=true;
        ERP_PC7.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC7);
        insert pcList;
        
        //3. ERP Pricing Conditions


        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
            ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='F253',RecordTypeId=rid,
            ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
            ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
            ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
            ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
            ERP_Product_Hierarchy_Level_9_Code__c='RE',
            ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE',ERP_Deletion_Flag__c=false);
        insert material;
                   
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;

        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='F253';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DTT EMEA';
        pri.SoldTo_Code__c ='674523';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> proList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__c ERPProc = new ERP_Procedure_Conditions__c();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        proList.add(ERPProc);
        ERP_Procedure_Conditions__c ERPProc1 = new ERP_Procedure_Conditions__c();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        ERP_Procedure_Conditions__c ERPProc2 = new ERP_Procedure_Conditions__c();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=102;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        proList.add(ERPProc2);
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        proList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        proList.add(ERPProc7);
        insert proList;
        

        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('P&IP ECP EU PP G220-G26A').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__C = pri.Id;
        pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem1.COUNTRY__C = 'Germany';
        pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem1.DIVISION_CODE__C = '02';
        pricRequestItem1.DIVISION__C = 'GSD Standard';
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'End User/Ship To/Material';
        pricRequestItem1.ShipTo_Code__c='55470156';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='11';
        pricRequestItem1.PH4_Code__c='12';
        pricRequestItem1.PH5_Code__c='S1';
        pricRequestItem1.PH6_Code__c='BB';
        pricRequestItem1.PH7_Code__c='ED';
        pricRequestItem1.PH8_Code__c='GT';
        pricRequestItem1.PH9_Code__c='RE';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'F253';
        pricRequestItem1.SALES_ORG__C = 'F253';
        pricRequestItem1.SCALED_PRICE_FLAG__C = true;
        pricRequestItem1.SOLD_TO_CODE__C = '55470156';
        pricRequestItem1.UNIT__C = 'EUR';
        pricRequestItem1.UOM__C = 'EA';
        pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem1.EDIT__C = false;
        pricRequestItem1.NEW__C = false;
        pricRequestItem1.SCALE_BASIS__C = 'Quantity';
        pricRequestItem1.SCALE_TYPE__C = 'From';
        pricRequestItem1.New_Rate__c = '100';
        pricRequestItem1.New_Unit__c = 'USD';
        pricRequestItem1.New_Per__c = 2;
        pricRequestItem1.New_UoM__c = 'KG';
        insert pricRequestItem1;
        
        Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
        pricRequestItem2.CURRENCYISOCODE = 'USD';
        pricRequestItem2.PRICING_REQUEST__C = pri.Id;
        pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem2.COUNTRY__C = 'Germany';
        pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem2.DIVISION_CODE__C = '02';
        pricRequestItem2.DIVISION__C = 'GSD Standard';
        pricRequestItem2.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem2.GAP__C = false;
        pricRequestItem2.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem2.KEY_COMBINATION__C = 'End User/Ship To/PH1/PH2';
        pricRequestItem2.ShipTo_Code__c='55470156';
        pricRequestItem2.PH1_Code__c='A6';
        pricRequestItem2.PH2_Code__c='S1';
        pricRequestItem2.PH3_Code__c='11';
        pricRequestItem2.PH4_Code__c='12';
        pricRequestItem2.PH5_Code__c='S1';
        pricRequestItem2.PH6_Code__c='BB';
        pricRequestItem2.PH7_Code__c='ED';
        pricRequestItem2.PH8_Code__c='GT';
        pricRequestItem2.PH9_Code__c='RE';
        pricRequestItem2.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem2.NEW_PER__C = 1;
        pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem2.PER__C = 1;
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPR9';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'F253';
        pricRequestItem2.SALES_ORG__C = 'F253';
        pricRequestItem2.SCALED_PRICE_FLAG__C = true;
        pricRequestItem2.SOLD_TO_CODE__C = '55470156';
        pricRequestItem2.UNIT__C = 'EUR';
        pricRequestItem2.UOM__C = 'EA';
        pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 02,15);
        pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 4,14);//18th jan
        pricRequestItem2.EDIT__C = false;
        pricRequestItem2.NEW__C = false;
        pricRequestItem2.SCALE_BASIS__C = 'Quantity';
        pricRequestItem2.SCALE_TYPE__C = 'From';
        pricRequestItem2.New_Rate__c = '100';
        pricRequestItem2.New_Unit__c = 'USD';
        pricRequestItem2.New_Per__c = 2;
        pricRequestItem2.New_UoM__c = 'KG';
        insert pricRequestItem2;

        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        insert npcReq1;

        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        insert npcReq2;

        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;

        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;

        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});

        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DTT EMEA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='F253';
        orgGrp1.ERP_Sales_Org_Code__c='F253';
        orgGrp1.ERP_Distribution_Channel_Code__c='10';
        orgGrp1.ERP_Division_Code__c='02';
        insert orgGrp1;
        
        Organizational_Group_Item__c orgGrpItm = new Organizational_Group_Item__c();
        orgGrpItm.Business__c=orgGrp.id;
        orgGrpItm.OrgGroup__c=orgGrp1.id;
        orgGrpItm.ERP_Pricing_Procedure__c=PRProc1.id;
        insert orgGrpItm;
        
        //
        Sales_Area_QuantityUoM_Detail__c saUOM = new Sales_Area_QuantityUoM_Detail__c();
        saUOM.Organizational_Group_Item__c=orgGrpItm.id;
        saUOM.Quantity__c='10';
        saUOM.UoM__c='KG';
        insert saUOM;
        controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();

        
            ERP_Key_Combination__c ERP_KC = new ERP_Key_Combination__c();
            ERP_KC.Key_Combination_Code__c='A582';
            ERP_KC.SAP_APPLICATION_ID__C = 'V';
            ERP_KC.SAP_CLIENT_ID__C = '510';
            ERP_KC.SAP_Cluster__c = 'CB1';
            ERP_KC.Status__c='Active';
            insert ERP_KC;
            
            ERP_Access_Sequence__c ERPAccSeq = new ERP_Access_Sequence__c();
            ERPAccSeq.Pricing_Condition__c=ERP_PC.id;
            ERPAccSeq.Pricing_Key_Combination__c=ERP_KC.id;
            ERPAccSeq.isNPCApplicable__c=true;
            ERPAccSeq.Sales_Pricing_Procedure__c=PRProc1.id;
            insert ERPAccSeq;
            
            Test.startTest();
            NpcserviceVARKEY.AllowFieldTruncationHeader_element inst1 = new NpcserviceVARKEY.AllowFieldTruncationHeader_element();
            NpcserviceVARKEY.Items inst0 = new NpcserviceVARKEY.Items();
            NpcserviceVARKEY.CallOptions_element inst2 = new NpcserviceVARKEY.CallOptions_element();
            NpcserviceVARKEY.calculateNetPriceResponse_element inst3 = new NpcserviceVARKEY.calculateNetPriceResponse_element();
            NpcserviceVARKEY.NetPriceOutput inst4 = new NpcserviceVARKEY.NetPriceOutput ();
            NpcserviceVARKEY.SessionHeader_element inst5 = new NpcserviceVARKEY.SessionHeader_element ();
            NpcserviceVARKEY.LogInfo inst6 = new NpcserviceVARKEY.LogInfo ();
            NpcserviceVARKEY.DebuggingHeader_element inst7 = new NpcserviceVARKEY.DebuggingHeader_element ();
            NpcserviceVARKEY.calculateNetPrice_element inst8 = new NpcserviceVARKEY.calculateNetPrice_element ();
            NpcserviceVARKEY.DebuggingInfo_element inst9 = new NpcserviceVARKEY.DebuggingInfo_element();
            NpcserviceVARKEY.Partner inst10 = new NpcserviceVARKEY.Partner ();
            NpcserviceVARKEY.NetPriceInput inst11 = new NpcserviceVARKEY.NetPriceInput();
            NpcserviceVARKEY.NPCService npcsev = new NpcserviceVARKEY.NPCService();
            Test.setMock(WebServiceMock.class, new WebServiceCallout_Mock ());
           // NpcserviceVARKEY NPS = new NpcserviceVARKEY();
           // NpcserviceVARKEY.NetPriceOutput NPO = NpcserviceVARKEY.calculateNetPrice(inst11);
            //controller.populateMap(pricRequestItem1);
            /*Added by Sumida on 13/09/24 to increase code coverage*/ npcsev.calculateNetPrice(inst11);
            SObjectType objToken = Schema.getGlobalDescribe().get('Pricing_Request_Item__c');

            DescribeSObjectResult objDef = objToken.getDescribe();
    
            Map<String, SObjectField> fields = objDef.fields.getMap();
    
            Set<String> fieldSet = fields.keySet();
            string q='SELECT ';
            for(String s:fieldSet)
            {
                SObjectField fieldToken = fields.get(s);
                DescribeFieldResult selectedField = fieldToken.getDescribe();
                q+=selectedField.getName()+',';
            }
            //q = q.substring(0,q.length()-1);
            q = q +' Pricing_Request__r.SoldTo_Code__c,Pricing_request__r.Division_Code__c,Pricing_Request__r.Dist_Channel_Code__c,Pricing_request__r.Sales_Org_Code__c from Pricing_Request_Item__c where id=\''+pricRequestItem2.id+'\'';
            
            Pricing_Request_Item__c itm =(Pricing_Request_Item__c) database.query(q)[0];
            controller.populateMap(itm);
            Test.stopTest();
        
        
    }
}