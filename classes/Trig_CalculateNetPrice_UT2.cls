@isTest

public class Trig_CalculateNetPrice_UT2 {
    
    //Calment Start
    static testMethod void CPI_Changes()
    {
        
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPP AP B918,B950,B974,B943,B98A,B96F,B94ASales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP AP SPP3';
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
        pri.BU__c='DPP AP';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP AP';
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
        controller.bindvalueToNewRate();
        controller.priId='sampleId';
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
        controller.populateMap(pricRequestItem1);
        controller.populateMap(pricRequestItem2);
        controller.recalculate();
        Test.stopTest();
        
        
        
    }   
    //Calment end
    
    static testMethod void testDTTAPF200_new()
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
        PRProc1.Pricing_Procedure_Code__c='DTT AP F200 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DTT AP F200';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='A';
        ERP_PC.Calculation_Type__c='Percentage';
        ERP_PC.Condition_Class__c='Discount or Surcharge';
        ERP_PC.Pricing_Condition_Code__c='ST';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Discount';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='A';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ST';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Discount';
        insert ERP_PC1;
        
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
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
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
        try
        {
            
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
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }    
    
    
    static testMethod void testPnIPEUZIS21()
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
        PRProc1.Pricing_Procedure_Code__c='P&IP ECP EU G220,G230,G253,G260,G26A Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='ZIS2 - Inter SBU Price - ZIS*';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='A';
        ERP_PC.Calculation_Type__c='Percentage';
        ERP_PC.Condition_Class__c='Discount or Surcharge';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Discount';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Discount';
        insert ERP_PC1;
        
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
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
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
        try
        {
            
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
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    static testMethod void testcalculateRatesforPnIPEU()
    {
        //Test.startTest();
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
        PRProc1.Pricing_Procedure_Code__c='DPT NA D660 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT NA SPP4';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Percentage';
        ERP_PC.Condition_Class__c='Discount or Surcharge';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Discount';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ZPR9';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Discount';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ZPR9';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Discount';
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        try{
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    static testMethod void testDCPUSSPP_new()
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
        PRProc1.Pricing_Procedure_Code__c='DCP US F850 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP US SPP';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Calculation_Type__c='Percentage';
        ERP_PC.Condition_Class__c='Discount or Surcharge';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Discount';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Discount';
        insert ERP_PC1;
        
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
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
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
        try
        {
            
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
            controller.populateMap(pricRequestItem1);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    static testMethod void DCP_EMEA_New()
    {
        
        trig_calculateNetPrice_UT1.customSettings();
        trig_calculateNetPrice_UT1.insertCustomSettings();
        
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
        ERP_PC.Calculation_Type__c='Percentage';
        ERP_PC.Condition_Class__c='Discount or Surcharge';
        ERP_PC.Pricing_Condition_Code__c='ST';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Discount';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Percentage';
        ERP_PC1.Condition_Class__c='Discount or Surcharge';
        ERP_PC1.Pricing_Condition_Code__c='ST';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Discount';
        pcList.add(ERP_PC1);
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Standard';
        ERP_PC2.Calculation_Type__c='Percentage';
        ERP_PC2.Condition_Class__c='Discount or Surcharge';
        ERP_PC2.Pricing_Condition_Code__c='ST';
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ST';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ST';
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
        npcResp1.NPC_Message_Type__c='A';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='A';
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
        try{    
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    static testMethod void testBIEnvelopes_D630()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='LoginDetails';
        insert login;
        
        //2. ERP Pricing Procedures
        ERP_Pricing_Procedure__c PRProc1 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='BI EMEA Envelopes D630 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='BI Envelopes D630';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        //ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        Id rid =Schema.SObjectType.Material__c.getRecordTypeInfosByName().get('ERP Material - Extended Data').getRecordTypeId();
        
        //4. ERP Material
        Material__c material = new Material__c(ERP_Source_Cluster__c='CB1',ERP_Material_code__c='D11992510',
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A603',RecordTypeId=rid,
                                               ERP_Product_Hierarchy_Level_1_Code__c='A6',ERP_Product_Hierarchy_Level_2_Code__c='S1',
                                               ERP_Product_Hierarchy_Level_3_Code__c='11',ERP_Product_Hierarchy_Level_4_Code__c='12',
                                               ERP_Product_Hierarchy_Level_5_Code__c='S1',ERP_Product_Hierarchy_Level_6_Code__c='BB',
                                               ERP_Product_Hierarchy_Level_7_Code__c='ED',ERP_Product_Hierarchy_Level_8_Code__c='GT',
                                               ERP_Product_Hierarchy_Level_9_Code__c='RE',
                                               ERP_Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE');
        insert material;
        
        //5. ERP Material Conversion            
        List<ERP_Material_Conversion_factor__c> emfList = new List<ERP_Material_Conversion_factor__c>();
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='EA',  Base_UOM__c='EA',Denominator_X__c='1',Numerator_Y__c='1',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='KG',Base_UOM__c='EA',Denominator_X__c='59,23',Numerator_Y__c='1,12',Material__c=material.Id));
        emfList.add(new ERP_Material_Conversion_factor__c(Alternative_UOM__c='LT',Base_UOM__c='EA',Denominator_X__c='23',Numerator_Y__c='1',Material__c=material.Id));                                                                                                      
        insert emfList;
        
        //6. Pricing request
        Pricing_Request__c pri=new Pricing_Request__c();
        pri.Sales_Org_Code__c='D630';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='BI Surfaces';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        List<ERP_Procedure_Conditions__c> procList = new List<ERP_Procedure_Conditions__c>();
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=115;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;      
        
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('BI Envelopes D630').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem1.PH1_Code__c='A6';
        pricRequestItem1.PH2_Code__c='S1';
        pricRequestItem1.PH3_Code__c='12';
        pricRequestItem1.PH4_Code__c='AA';
        pricRequestItem1.Product_Hierarchy_Code__c='A6S111AA';
        pricRequestItem1.NEW_PER__C = 1;
        pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem1.PER__C = 1;
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPr9';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'D630';
        pricRequestItem1.SALES_ORG__C = 'D630';
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
        
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPNB:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        //cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        //cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPNB',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        //11. Invoking controller method
        try{
            
            //11. Invoking controller method
            PACalculateNetPrice controller = new PACalculateNetPrice();
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true);
            controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false); 
            
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
            controller.populateMap(pricRequestItem1);            
            Test.stopTest();
        }catch(Exception e){} 
        
    }
    
    static testMethod void testDPGLOBAL_SPP3()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPP KV SPP1';
        PRProc1.Pricing_Procedure_Description__c='DPP KV SPP3';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP3').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        //controller.recalculate();
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
        controller.bindvalueToNewRate();
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
        try{
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            controller.recalculate();
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    static testMethod void testDPP_KV_SPP1()
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
        PRProc1.Pricing_Procedure_Code__c='DPP Global Kalrez B918,B900 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP KV SPP1';
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
        ERP_PC.Pricing_Condition_Code__c='ZPRB';
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
        ERP_PC1.Pricing_Condition_Code__c='ZPGC';
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
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZIRH';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //  ERP_PC4.Calculation_Type__c='Quantity';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        // ERP_PC5.Calculation_Type__c='Percentage';
        // ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
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
pcList.add(ERP_PC7);*/
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
        pri.BU__c='DPP Global Kalrez And Vespel';
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
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc7);*/
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
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
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC3.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRB';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPGC';
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
        
        Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
        pricRequestItem3.CURRENCYISOCODE = 'USD';
        pricRequestItem3.PRICING_REQUEST__C = pri.Id;
        pricRequestItem3.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem3.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem3.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem3.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem3.COUNTRY__C = 'Germany';
        pricRequestItem3.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem3.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem3.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem3.DIVISION_CODE__C = '02';
        pricRequestItem3.DIVISION__C = 'GSD Standard';
        pricRequestItem3.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem3.GAP__C = false;
        pricRequestItem3.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem3.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem3.ShipTo_Code__c='55470156';
        pricRequestItem3.PH1_Code__c='A6';
        pricRequestItem3.PH2_Code__c='S1';
        pricRequestItem3.PH3_Code__c='11';
        pricRequestItem3.PH4_Code__c='12';
        pricRequestItem3.PH5_Code__c='S1';
        pricRequestItem3.PH6_Code__c='BB';
        pricRequestItem3.PH7_Code__c='ED';
        pricRequestItem3.PH8_Code__c='GT';
        pricRequestItem3.PH9_Code__c='RE';
        pricRequestItem3.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem3.NEW_PER__C = 1;
        pricRequestItem3.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem3.PER__C = 1;
        pricRequestItem3.PRICING_CONDITION_CODE__C = 'ZIRH';
        pricRequestItem3.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem3.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem3.Rate__c = '100';
        pricRequestItem3.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem3.SAP_CLIENT_ID__C = '510';
        pricRequestItem3.SAP_Cluster__c = 'CB1';
        pricRequestItem3.SALES_ORG_CODE__C = 'F253';
        pricRequestItem3.SALES_ORG__C = 'F253';
        pricRequestItem3.SCALED_PRICE_FLAG__C = true;
        pricRequestItem3.SOLD_TO_CODE__C = '55470156';
        pricRequestItem3.UNIT__C = 'EUR';
        pricRequestItem3.UOM__C = 'EA';
        pricRequestItem3.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem3.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem3.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem3.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem3.EDIT__C = false;
        pricRequestItem3.NEW__C = false;
        pricRequestItem3.SCALE_BASIS__C = 'Quantity';
        pricRequestItem3.SCALE_TYPE__C = 'From';
        pricRequestItem3.New_Rate__c = '100';
        pricRequestItem3.New_Unit__c = 'USD';
        pricRequestItem3.New_Per__c = 2;
        pricRequestItem3.New_UoM__c = 'KG';
        insert pricRequestItem3;
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        npcReq2.isSynchronous__c=false;
        insert npcReq2;
        //npcReqList.add(npcReq2);
        
        NPC_Request__c npcReq3=new NPC_Request__c();
        npcReq3.Material_Number__c='D11992510';
        npcReq3.Partner_Code_1__c='AG';
        npcReq3.Partner1__c='55470156';
        npcReq3.Quantity__c='1050000';
        npcReq3.Sales_Document_Type__c='ZOR1';
        npcReq3.Status__c='Active';
        npcReq3.Pricing_Request_Item__c=pricRequestItem3.Id;
        insert npcReq3;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq2.Id;
        insert npcResp2;
        
        NPC_Response__c npcResp3=new NPC_Response__c();
        npcResp3.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp3.NPC_Message_Type__c='S';
        npcResp3.NPC_Request__c=npcReq3.Id;
        insert npcResp3;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRB',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPGC',new List<String>{'292.000000000','EUR','1','EA'});
        //    cTRateMap.put('ZK20',new List<String>{'-5.000000000','EUR','0','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        // Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        /*   Map<String,String> UoMConversionMap= new Map<String,String>();
UoMConversionMap.put(emfList[0].Material__r.ERP_Material_code__c+emfList[0].Material__r.ERP_Source_Cluster__c+emfList[0].Alternative_Uom__c,emfList[0].Numerator_Y__c+':'+emfList[0].Denominator_X__c);

controller.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
PACalculateNetPrice controller12 = new PACalculateNetPrice();
controller12.calculateRatesforDPPKV(proList,cTRateMap,npcReq2,pricRequestItem2,true,UoMConversionMap,false,5);

PACalculateNetPrice controller1 = new PACalculateNetPrice();

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,1);

PACalculateNetPrice controller2 = new PACalculateNetPrice();

controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,2);

PACalculateNetPrice controller3 = new PACalculateNetPrice();

controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,3);

PACalculateNetPrice controller4 = new PACalculateNetPrice();

controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,4);


//Map<String,List<String>> cTRateMap1 = new Map<String,List<String>>();
cTRateMap.put('ZPR9',new List<String>{'##','EUR','1','EA'}); 
cTRateMap.put('ZPNG',new List<String>{'##','EUR','1','EA'});
cTRateMap.put('ZPSF',new List<String>{'##','EUR','0','EA'});
cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});

PACalculateNetPrice controller56 = new PACalculateNetPrice();
controller56.calculateNPC(npcReqIds, cTRateMap, prItemList,true);

/*controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,5);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,1);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,2);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,3);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,4);*/
        
        //controller1.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Global Kalrez And Vespel';
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
        //controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        
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
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
    }
    
    static testMethod void testDPPNA_SPP2()
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
        PRProc1.Pricing_Procedure_Code__c='DPP NA B950 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP NA SPP2';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc1;
        
        ERP_Pricing_Procedure__c PRProc2 = new ERP_Pricing_Procedure__c();
        PRProc1.Pricing_Procedure_Code__c='DCP Canada F860 sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DCP Canada';
        PRProc1.SAP_Application_Id__c='V';
        PRProc1.SAP_Client_Id__c='510';
        PRProc1.SAP_Cluster__c='CB1';
        PRProc1.Status__C='Active';
        insert PRProc2;
        
        ERP_Pricing_Condition__c ERP_PC = new ERP_Pricing_Condition__c();
        ERP_PC.Price_Types__c='Standard';
        ERP_PC.Pricing_Condition_Code__c='Price';
        ERP_PC.Calculation_Type__c='Quantity';
        ERP_PC.Condition_Class__c='Prices';
        ERP_PC.Pricing_Condition_Code__c='ZPR9';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        insert ERP_PC;
        
        //3. ERP Pricing Conditions
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Pricing_Condition_Code__c='Price';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='Prices';
        ERP_PC1.Pricing_Condition_Code__c='ZPNG';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        insert ERP_PC1;
        
        
        ERP_Pricing_Condition__c ERP_PC2 = new ERP_Pricing_Condition__c();
        ERP_PC2.Price_Types__c='Net Reference';
        ERP_PC2.Pricing_Condition_Code__c='Price';
        ERP_PC2.Calculation_Type__c='Quantity';
        ERP_PC2.Condition_Class__c='Prices';
        ERP_PC2.Pricing_Condition_Code__c='ZPNG';
        ERP_PC2.SAP_Application_Id__c='V';
        ERP_PC2.SAP_Client_Id__c='510';
        ERP_PC2.SAP_Cluster__c='CB1';
        ERP_PC2.SAP_Condition_Type__c=true;
        ERP_PC2.Pricing_Condition__c='Gross Price';
        insert ERP_PC2;
        
        
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
        pri.BU__c='DPP NA';
        pri.Pricing_Request_Type__c='Permanent';
        insert pri;
        
        //7. ERP Procedeure Conditions
        ERP_Procedure_Conditions__C ERPProc = new ERP_Procedure_Conditions__C();
        ERPProc.Pricing_Condition__c =  ERP_PC.id;
        ERPProc.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc.Step__c=100;
        ERPProc.From__c=0;
        ERPProc.To__c=0;
        insert ERPProc;
        
        
        ERP_Procedure_Conditions__C ERPProc1 = new ERP_Procedure_Conditions__C();
        ERPProc1.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc2.id;
        ERPProc1.Step__c=100;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        insert ERPProc1;
        
        
        ERP_Procedure_Conditions__C ERPProc2 = new ERP_Procedure_Conditions__C();
        ERPProc2.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc2.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc2.Step__c=100;
        ERPProc2.From__c=0;
        ERPProc2.To__c=0;
        insert ERPProc2;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        //update pri;
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP NA SPP1').Pricing_Procedure_Code__c;
        Id pricingProcedureId=sppCodeIdMap.get(surfacesPP);
        pricRequestItem1.CURRENCYISOCODE = 'USD';
        pricRequestItem1.PRICING_REQUEST__c = pri.id;
        pricRequestItem1.PRICING_REQUEST__r = pri;
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
        pricRequestItem1.Pricing_Request__c =pri.id;
        pricRequestItem1.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem1.GAP__C = false;
        pricRequestItem1.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        //system.debug(' inside test class, before query pr is '+pricRequestItem1.PRICING_REQUEST__r.BU__C);
        //system.debug(' inside test class, before query pr is '+pricRequestItem1.BU__C);
        system.debug(' inside test class, pr is '+[select id,BU__c from Pricing_Request_Item__c where id=:pricRequestItem1.id]);
        //9. NPC Request
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=false;
        insert npcReq1;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPR9:292.000000000:EUR:1:EA:ZPGS:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPR9',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'292.000000000','EUR','1','EA'});
        cTRateMap.put('ZPSF',new List<String>{'-5.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        
        Pricing_Request_Item__c pricRequestItem2 = [SELECT Id, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, /*LastViewedDate, 
LastReferencedDate,*/ Pricing_Request__c, Approval_Status__c, Approved_Date__c, Approver1_Date__c, Approver1__c, Approver2_Date__c, Approver2__c, Approver3_Date__c, 
                                                    Approver3__c, Approver4_Date__c, Approver4__c, Approver5_Date__c, Approver5__c, BU__c, Below_Current_Flag__c, Below_Floor_Flag__c, Below_Floor_Price__c, 
                                                    Below_Reference_Flag__c, Below_Reference_Price__c, Calculation_Type_Code__c, Calculation_Type__c, Check_Scale_Code__c, Check_Scale__c, Condition_Class_Code__c, 
                                                    Condition_Class__c, Country_Code__c, Country__c, Currency__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Customer_Specific__c, Disc_Ref__c, 
                                                    Dist_Channel_Code__c, Dist_Channel__c, Division_Code__c, Division__c, ERP_Pricing_Procedure__c, ERP_Sales_Prices_SAP__c, Edit__c, End_Use_Code__c, End_Use__c, 
                                                    End_User_Code__c, End_User__c, Expire__c, F_Product_Hierarchy_Code__c, Gap_Pricing_Request_Item__c, Gap__c, Inco_terms__c, Incoterms2__c, Incoterms_Code__c, 
                                                    Key_Combination_Code__c, Key_Combination_SFDC__c, Key_Combination__c, Market_Segment_Code__c, Market_Segment__c, Material_Code__c, Material_Price_Group_Code__c, 
                                                    Material_Price_Group__c, Material__c, New_Per__c, New_Rate__c, New_Unit__c, New_UoM__c, New_Valid_From__c, New_Valid_To__c, New__c, Non_Commercial_Products__c, 
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
                                                    Material_Group_5__c, Plant_Code__c, Plant__c, Shipping_Condition_Code__c, Shipping_Condition__c, Project__c,ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c FROM Pricing_Request_Item__c where id=:pricRequestItem1.id];
        prItemList.add(pricRequestItem2);
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        //update pricRequestItem1;
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //  isCalculated=true;
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
        
        //controller.fetchMapFromResponse();
        try
        {
            controller.ViewNetPrice(pricRequestItem1,true);
            controller.ViewNetPrice(pricRequestItem2,true);
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
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
            
        }
        catch(Exception e)
        {
            
        }
        
    }
    
    static testMethod void testDCP_EMEA_SPP()
    {
        try
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
            
            pri.SoldTo_Code__c ='0099887765';
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
            pricRequestItem2.KEY_COMBINATION__C = 'End User/Ship To/Material';
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            Test.stopTest();
        }
        catch(Exception e)
        {
        }
        
    }
    
    static testMethod void testDPP_KV_SPP4()
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
        PRProc1.Pricing_Procedure_Code__c='DPP Global Kalrez B953 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP KV SPP4';
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
        ERP_PC.Pricing_Condition_Code__c='ZPRB';
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
        ERP_PC1.Pricing_Condition_Code__c='ZPGC';
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
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZIRH';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Sub Total';
        //  ERP_PC4.Calculation_Type__c='Quantity';
        // ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ST';
        ERP_PC4.SAP_Application_Id__c='V';
        ERP_PC4.SAP_Client_Id__c='510';
        ERP_PC4.SAP_Cluster__c='CB1';
        ERP_PC4.SAP_Condition_Type__c=true;
        ERP_PC4.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC4);
        ERP_Pricing_Condition__c ERP_PC5 = new ERP_Pricing_Condition__c();
        ERP_PC5.Price_Types__c='Net Price';
        // ERP_PC5.Calculation_Type__c='Percentage';
        // ERP_PC5.Condition_Class__c='Discount or Surcharge';
        ERP_PC5.Pricing_Condition_Code__c='NP';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        /*    ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
ERP_PC6.Price_Types__c='Standard';
ERP_PC6.Calculation_Type__c='Quantity';
ERP_PC6.Condition_Class__c='Discount or Surcharge';
ERP_PC6.Pricing_Condition_Code__c='ZPGC';
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
pcList.add(ERP_PC7);*/
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
        pri.BU__c='DPP Global Kalrez And Vespel';
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
        /*     ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
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
proList.add(ERPProc7);*/
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        
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
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC3.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP4').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPRB';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPGC';
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
        
        Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
        pricRequestItem3.CURRENCYISOCODE = 'USD';
        pricRequestItem3.PRICING_REQUEST__C = pri.Id;
        pricRequestItem3.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem3.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem3.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem3.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem3.COUNTRY__C = 'Germany';
        pricRequestItem3.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem3.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem3.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem3.DIVISION_CODE__C = '02';
        pricRequestItem3.DIVISION__C = 'GSD Standard';
        pricRequestItem3.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem3.GAP__C = false;
        pricRequestItem3.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem3.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem3.ShipTo_Code__c='55470156';
        pricRequestItem3.PH1_Code__c='A6';
        pricRequestItem3.PH2_Code__c='S1';
        pricRequestItem3.PH3_Code__c='11';
        pricRequestItem3.PH4_Code__c='12';
        pricRequestItem3.PH5_Code__c='S1';
        pricRequestItem3.PH6_Code__c='BB';
        pricRequestItem3.PH7_Code__c='ED';
        pricRequestItem3.PH8_Code__c='GT';
        pricRequestItem3.PH9_Code__c='RE';
        pricRequestItem3.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem3.NEW_PER__C = 1;
        pricRequestItem3.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem3.PER__C = 1;
        pricRequestItem3.PRICING_CONDITION_CODE__C = 'ZIRH';
        pricRequestItem3.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem3.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem3.Rate__c = '100';
        pricRequestItem3.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem3.SAP_CLIENT_ID__C = '510';
        pricRequestItem3.SAP_Cluster__c = 'CB1';
        pricRequestItem3.SALES_ORG_CODE__C = 'F253';
        pricRequestItem3.SALES_ORG__C = 'F253';
        pricRequestItem3.SCALED_PRICE_FLAG__C = true;
        pricRequestItem3.SOLD_TO_CODE__C = '55470156';
        pricRequestItem3.UNIT__C = 'EUR';
        pricRequestItem3.UOM__C = 'EA';
        pricRequestItem3.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem3.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem3.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem3.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem3.EDIT__C = false;
        pricRequestItem3.NEW__C = false;
        pricRequestItem3.SCALE_BASIS__C = 'Quantity';
        pricRequestItem3.SCALE_TYPE__C = 'From';
        pricRequestItem3.New_Rate__c = '100';
        pricRequestItem3.New_Unit__c = 'USD';
        pricRequestItem3.New_Per__c = 2;
        pricRequestItem3.New_UoM__c = 'KG';
        insert pricRequestItem3;
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        npcReq1.isSynchronous__c=true;
        insert npcReq1;
        npcReqList.add(npcReq1);
        
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        npcReq2.isSynchronous__c=false;
        insert npcReq2;
        //npcReqList.add(npcReq2);
        
        NPC_Request__c npcReq3=new NPC_Request__c();
        npcReq3.Material_Number__c='D11992510';
        npcReq3.Partner_Code_1__c='AG';
        npcReq3.Partner1__c='55470156';
        npcReq3.Quantity__c='1050000';
        npcReq3.Sales_Document_Type__c='ZOR1';
        npcReq3.Status__c='Active';
        npcReq3.Pricing_Request_Item__c=pricRequestItem3.Id;
        insert npcReq3;
        
        //10. NPC Response
        NPC_Response__c npcResp1=new NPC_Response__c();
        npcResp1.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq2.Id;
        insert npcResp2;
        
        NPC_Response__c npcResp3=new NPC_Response__c();
        npcResp3.Condition_Rate_Key__c='ZPRB:292.000000000:EUR:1:EA:ZPGC:292.000000000:EUR:1:EA:ZD92:-5.000000000:EUR:0:EA:ZD94:-12.000000000:EUR:0:EA:ZD9K:0:EUR:0:EA:ZAO1:0:EUR:0:EA:SKTO:0:EUR:0:EA:GRWR:98.000000000:EUR:0:EA:ZREF:143.160000000:EUR:1:EA:ZFLO:124.490000000:EUR:1:EA';
        npcResp3.NPC_Message_Type__c='S';
        npcResp3.NPC_Request__c=npcReq3.Id;
        insert npcResp3;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZPRB',new List<String>{'292.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPGC',new List<String>{'292.000000000','EUR','1','EA'});
        //    cTRateMap.put('ZK20',new List<String>{'-5.000000000','EUR','0','EA'});
        //    cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});
        
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        // Test.startTest();
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        //controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        
        /*   Map<String,String> UoMConversionMap= new Map<String,String>();
UoMConversionMap.put(emfList[0].Material__r.ERP_Material_code__c+emfList[0].Material__r.ERP_Source_Cluster__c+emfList[0].Alternative_Uom__c,emfList[0].Numerator_Y__c+':'+emfList[0].Denominator_X__c);

controller.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
PACalculateNetPrice controller12 = new PACalculateNetPrice();
controller12.calculateRatesforDPPKV(proList,cTRateMap,npcReq2,pricRequestItem2,true,UoMConversionMap,false,5);

PACalculateNetPrice controller1 = new PACalculateNetPrice();

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,1);

PACalculateNetPrice controller2 = new PACalculateNetPrice();

controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller2.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,2);

PACalculateNetPrice controller3 = new PACalculateNetPrice();

controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller3.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,3);

PACalculateNetPrice controller4 = new PACalculateNetPrice();

controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller4.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem2,true,UoMConversionMap,false,4);


//Map<String,List<String>> cTRateMap1 = new Map<String,List<String>>();
cTRateMap.put('ZPR9',new List<String>{'##','EUR','1','EA'}); 
cTRateMap.put('ZPNG',new List<String>{'##','EUR','1','EA'});
cTRateMap.put('ZPSF',new List<String>{'##','EUR','0','EA'});
cTRateMap.put('ZIRH',new List<String>{'-5.000000000','EUR','0','EA'});

PACalculateNetPrice controller56 = new PACalculateNetPrice();
controller56.calculateNPC(npcReqIds, cTRateMap, prItemList,true);

/*controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,5);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,5);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,1);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,1);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,2);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,2);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,3);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,3);

controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,true,4);
controller1.calculateRatesforDPPKV(proList,cTRateMap,npcReq1,pricRequestItem1,true,UoMConversionMap,false,4);*/
        
        //controller1.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP Global Kalrez And Vespel';
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
        //controller.ViewNetPrice(pricRequestItem1,true);
        //controller.fetchMapFromResponse();
        
        
        
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
        //controller.populateMap(pricRequestItem1);
        //controller.populateMap(pricRequestItem2);
        Test.stopTest();
        
    }
    
    static testMethod void testDPGLOBAL_SPP1()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPP KV SPP1';
        PRProc1.Pricing_Procedure_Description__c='DPP Global Kalrez B918,B900 Sales Pricing Procedure';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP KV SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        //controller.recalculate();
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
        controller.bindvalueToNewRate();
        controller.priId='sampleId';
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
        try{
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            controller.recalculate();
            Test.stopTest();
        }catch(Exception e){} 
    }
    
    static testMethod void DPPAPSPP1()
    {
        
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPP AP B918,B929,B93A,B942,B943,B94A,B950,B953,B96F,B974,B98A,B991,B903 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP AP B900 Sales Pricing Procedure';
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
        pri.BU__c='DPP AP';
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
        
        ERP_Access_Sequence__c ERPAccSeq1 = new ERP_Access_Sequence__c();
        ERPAccSeq1.Pricing_Condition__c=ERP_PC1.id;
        ERPAccSeq1.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq1.isNPCApplicable__c=true;
        ERPAccSeq1.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq1;
        
        ERP_Access_Sequence__c ERPAccSeq2 = new ERP_Access_Sequence__c();
        ERPAccSeq2.Pricing_Condition__c=ERP_PC3.id;
        ERPAccSeq2.Pricing_Key_Combination__c=ERP_KC.id;
        ERPAccSeq2.isNPCApplicable__c=true;
        ERPAccSeq2.Sales_Pricing_Procedure__c=PRProc1.id;
        insert ERPAccSeq2;
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        
        Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
        pricRequestItem3.CURRENCYISOCODE = 'USD';
        pricRequestItem3.PRICING_REQUEST__C = pri.Id;
        pricRequestItem3.APPROVAL_STATUS__C = 'Draft';
        pricRequestItem3.BELOW_CURRENT_FLAG__C = false;
        pricRequestItem3.BELOW_FLOOR_FLAG__C = false;
        pricRequestItem3.BELOW_REFERENCE_FLAG__C = false;
        pricRequestItem3.COUNTRY__C = 'Germany';
        pricRequestItem3.CUSTOMER_SPECIFIC__C = true;
        pricRequestItem3.DIST_CHANNEL_CODE__C = '10';
        pricRequestItem3.DIST_CHANNEL__C = 'DuPont Std';
        pricRequestItem3.DIVISION_CODE__C = '02';
        pricRequestItem3.DIVISION__C = 'GSD Standard';
        pricRequestItem3.ERP_Pricing_Procedure__c=  PRProc1.id;
        pricRequestItem3.GAP__C = false;
        pricRequestItem3.KEY_COMBINATION_CODE__C = 'A582';
        pricRequestItem3.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
        pricRequestItem3.ShipTo_Code__c='55470156';
        pricRequestItem3.PH1_Code__c='A6';
        pricRequestItem3.PH2_Code__c='S1';
        pricRequestItem3.PH3_Code__c='11';
        pricRequestItem3.PH4_Code__c='12';
        pricRequestItem3.PH5_Code__c='S1';
        pricRequestItem3.PH6_Code__c='BB';
        pricRequestItem3.PH7_Code__c='ED';
        pricRequestItem3.PH8_Code__c='GT';
        pricRequestItem3.PH9_Code__c='RE';
        pricRequestItem3.Product_Hierarchy_Code__c='A6S11112S1BBEDGTRE';
        pricRequestItem3.NEW_PER__C = 1;
        pricRequestItem3.NON_COMMERCIAL_PRODUCTS__C = false;
        pricRequestItem3.PER__C = 1;
        pricRequestItem3.PRICING_CONDITION_CODE__C = 'ZIRH';
        pricRequestItem3.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem3.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem3.Rate__c = '100';
        pricRequestItem3.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem3.SAP_CLIENT_ID__C = '510';
        pricRequestItem3.SAP_Cluster__c = 'CB1';
        pricRequestItem3.SALES_ORG_CODE__C = 'F253';
        pricRequestItem3.SALES_ORG__C = 'F253';
        pricRequestItem3.SCALED_PRICE_FLAG__C = true;
        pricRequestItem3.SOLD_TO_CODE__C = '55470156';
        pricRequestItem3.UNIT__C = 'EUR';
        pricRequestItem3.UOM__C = 'EA';
        pricRequestItem3.VALID_FROM__C = Date.newInstance(2013, 1,1);
        pricRequestItem3.VALID_TO__C = Date.newInstance(2013, 1,15);
        pricRequestItem3.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
        pricRequestItem3.NEW_VALID_TO__C = Date.newInstance(2013, 2,14);//18th jan
        pricRequestItem3.EDIT__C = false;
        pricRequestItem3.NEW__C = false;
        pricRequestItem3.SCALE_BASIS__C = 'Quantity';
        pricRequestItem3.SCALE_TYPE__C = 'From';
        pricRequestItem3.New_Rate__c = '100';
        pricRequestItem3.New_Unit__c = 'USD';
        pricRequestItem3.New_Per__c = 2;
        pricRequestItem3.New_UoM__c = 'KG';
        insert pricRequestItem3;
        
        //9. NPC Request
        list<NPC_Request__c> npcReqList = new list<NPC_Request__c>();
        NPC_Request__c npcReq1=new NPC_Request__c();
        npcReq1.Material_Number__c='D11992510';
        npcReq1.Partner_Code_1__c='AG';
        npcReq1.Partner1__c='55470156';
        npcReq1.Quantity__c='1050000';
        npcReq1.Sales_Document_Type__c='ZOR1';
        npcReq1.Status__c='Active';
        npcReq1.Pricing_Request_Item__c=pricRequestItem1.Id;
        insert npcReq1;
        npcReqList.add(npcReq1);
        NPC_Request__c npcReq2=new NPC_Request__c();
        npcReq2.Material_Number__c='D11992510';
        npcReq2.Partner_Code_1__c='AG';
        npcReq2.Partner1__c='55470156';
        npcReq2.Quantity__c='1050000';
        npcReq2.Sales_Document_Type__c='ZOR1';
        npcReq2.Status__c='Active';
        npcReq2.Pricing_Request_Item__c=pricRequestItem2.Id;
        npcReq2.isSynchronous__c=false;
        insert npcReq2;
        
        //npcReqList.add(npcReq2);
        
        NPC_Request__c npcReq3=new NPC_Request__c();
        npcReq3.Material_Number__c='D11992510';
        npcReq3.Partner_Code_1__c='AG';
        npcReq3.Partner1__c='55470156';
        npcReq3.Quantity__c='1050000';
        npcReq3.Sales_Document_Type__c='ZOR1';
        npcReq3.Status__c='Active';
        npcReq3.Pricing_Request_Item__c=pricRequestItem3.Id;
        insert npcReq3;
        
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
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP AP';
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
        controller.bindvalueToNewRate();
        controller.priId='sampleId';
        //controller.fetchMapFromResponse();
        
        
        
        
        try{
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
        
        
    }
    
    //Calment start
    //DPT LA
    static testMethod void testDPT_LA()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPT LA A210,A22A,A250,A24C,AD10,AD20,AD40,D610 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT LA SPP1';
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
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
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
        ERP_PC1.Pricing_Condition_Code__c='ZPRI';
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
        ERP_PC3.Calculation_Type__c='Percentage';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZCRE';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Percentage';
        ERP_PC4.Condition_Class__c='Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZCRG';
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
        ERP_PC5.Pricing_Condition_Code__c='ZCRA';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Calculation_Type__c='Percentage';
        ERP_PC8.Condition_Class__c='Discount or Surcharge';
        ERP_PC8.Pricing_Condition_Code__c='ZCRB';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        ERP_Pricing_Condition__c ERP_PC9 = new ERP_Pricing_Condition__c();
        ERP_PC9.Price_Types__c='Standard';
        ERP_PC9.Calculation_Type__c='Percentage';
        ERP_PC9.Condition_Class__c='Discount or Surcharge';
        ERP_PC9.Pricing_Condition_Code__c='ZCRC';
        ERP_PC9.SAP_Application_Id__c='V';
        ERP_PC9.SAP_Client_Id__c='510';
        ERP_PC9.SAP_Cluster__c='CB1';
        ERP_PC9.SAP_Condition_Type__c=true;
        ERP_PC9.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC9);
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Standard';
        ERP_PC10.Calculation_Type__c='Percentage';
        ERP_PC10.Condition_Class__c='Discount or Surcharge';
        ERP_PC10.Pricing_Condition_Code__c='ZCRD';
        ERP_PC10.SAP_Application_Id__c='V';
        ERP_PC10.SAP_Client_Id__c='510';
        ERP_PC10.SAP_Cluster__c='CB1';
        ERP_PC10.SAP_Condition_Type__c=true;
        ERP_PC10.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC10);
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Sub Total';
        ERP_PC6.Pricing_Condition_Code__c='IP';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A210',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='A210';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPT LA';
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
        
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=103;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        proList.add(ERPProc6);
        
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=104;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        
        
        
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=105;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=106;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        
        
        ERP_Procedure_Conditions__c ERPProc10 = new ERP_Procedure_Conditions__c();
        ERPProc10.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=110;
        ERPProc10.From__c=0;
        ERPProc10.To__c=0;
        proList.add(ERPProc10);
        
        ERP_Procedure_Conditions__c ERPProc14 = new ERP_Procedure_Conditions__c();
        ERPProc14.Pricing_Condition__c =  ERP_PC9.id;
        ERPProc14.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc14.Step__c=111;
        ERPProc14.From__c=0;
        ERPProc14.To__c=0;
        proList.add(ERPProc14);
        
        
        
        ERP_Procedure_Conditions__c ERPProc12 = new ERP_Procedure_Conditions__c();
        ERPProc12.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc12.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc12.Step__c=113;
        ERPProc12.From__c=0;
        ERPProc12.To__c=0;
        proList.add(ERPProc12);
        
        
        
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=150;
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT LA SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A210';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'A210';
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
        npcResp1.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZPRI:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZPRI:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq2.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZDA1',new List<String>{'-2.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'25.000000000','EUR','1','EA'});
        cTRateMap.put('ZCRE',new List<String>{'-1.000000000','EUR','0','EA'});
        cTRateMap.put('ZCRG',new List<String>{'-1.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT LA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A210';
        orgGrp1.ERP_Sales_Org_Code__c='A210';
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
        controller.bindvalueToNewRate();
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
        
        try{
            
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
            //controller.populateMap(pricRequestItem1);
            //controller.populateMap(pricRequestItem2);
            //controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
    }
    
    //DPT AP
    static testMethod void testDPT_AP()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPT AP A243,A250,A280,AD43,AD80,D643,D650,D680 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT AP SPP1';
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
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        
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
        ERP_PC3.Calculation_Type__c='Fixed Amount';
        ERP_PC3.Condition_Class__c='Discount or Surcharge';
        ERP_PC3.Pricing_Condition_Code__c='ZDA3';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Fixed Amount';
        ERP_PC4.Condition_Class__c='Price';
        ERP_PC4.Pricing_Condition_Code__c='ZCRE';
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
        ERP_PC5.Pricing_Condition_Code__c='ZCRG';
        ERP_PC5.SAP_Application_Id__c='V';
        ERP_PC5.SAP_Client_Id__c='510';
        ERP_PC5.SAP_Cluster__c='CB1';
        ERP_PC5.SAP_Condition_Type__c=true;
        ERP_PC5.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC5);
        
        ERP_Pricing_Condition__c ERP_PC8 = new ERP_Pricing_Condition__c();
        ERP_PC8.Price_Types__c='Standard';
        ERP_PC8.Calculation_Type__c='Fixed Amount';
        ERP_PC8.Condition_Class__c='Price';
        ERP_PC8.Pricing_Condition_Code__c='ZCRB';
        ERP_PC8.SAP_Application_Id__c='V';
        ERP_PC8.SAP_Client_Id__c='510';
        ERP_PC8.SAP_Cluster__c='CB1';
        ERP_PC8.SAP_Condition_Type__c=true;
        ERP_PC8.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC8);
        
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Fixed Amount';
        ERP_PC1.Condition_Class__c='Price';
        ERP_PC1.Pricing_Condition_Code__c='ZCRA';
        ERP_PC1.SAP_Application_Id__c='V';
        ERP_PC1.SAP_Client_Id__c='510';
        ERP_PC1.SAP_Cluster__c='CB1';
        ERP_PC1.SAP_Condition_Type__c=true;
        ERP_PC1.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC1);
        
        ERP_Pricing_Condition__c ERP_PC9 = new ERP_Pricing_Condition__c();
        ERP_PC9.Price_Types__c='Standard';
        ERP_PC9.Calculation_Type__c='Fixed Amount';
        ERP_PC9.Condition_Class__c='Price';
        ERP_PC9.Pricing_Condition_Code__c='ZCRC';
        ERP_PC9.SAP_Application_Id__c='V';
        ERP_PC9.SAP_Client_Id__c='510';
        ERP_PC9.SAP_Cluster__c='CB1';
        ERP_PC9.SAP_Condition_Type__c=true;
        ERP_PC9.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC9);
        
        ERP_Pricing_Condition__c ERP_PC10 = new ERP_Pricing_Condition__c();
        ERP_PC10.Price_Types__c='Standard';
        ERP_PC10.Calculation_Type__c='Fixed Amount';
        ERP_PC10.Condition_Class__c='Price';
        ERP_PC10.Pricing_Condition_Code__c='ZCRD';
        ERP_PC10.SAP_Application_Id__c='V';
        ERP_PC10.SAP_Client_Id__c='510';
        ERP_PC10.SAP_Cluster__c='CB1';
        ERP_PC10.SAP_Condition_Type__c=true;
        ERP_PC10.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC10);
        
        ERP_Pricing_Condition__c ERP_PC6 = new ERP_Pricing_Condition__c();
        ERP_PC6.Price_Types__c='Sub Total';
        ERP_PC6.Pricing_Condition_Code__c='IP';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A243',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='A243';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPT AP';
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
        ERPProc1.Pricing_Condition__c =  ERP_PC2.id;
        ERPProc1.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc1.Step__c=101;
        ERPProc1.From__c=0;
        ERPProc1.To__c=0;
        proList.add(ERPProc1);
        
        ERP_Procedure_Conditions__c ERPProc3 = new ERP_Procedure_Conditions__c();
        ERPProc3.Pricing_Condition__c =  ERP_PC3.id;
        ERPProc3.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc3.Step__c=103;
        ERPProc3.From__c=0;
        ERPProc3.To__c=0;
        proList.add(ERPProc3);
        ERP_Procedure_Conditions__c ERPProc4 = new ERP_Procedure_Conditions__c();
        ERPProc4.Pricing_Condition__c =  ERP_PC6.id;
        ERPProc4.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc4.Step__c=104;
        ERPProc4.From__c=0;
        ERPProc4.To__c=0;
        proList.add(ERPProc4);
        ERP_Procedure_Conditions__c ERPProc5 = new ERP_Procedure_Conditions__c();
        ERPProc5.Pricing_Condition__c =  ERP_PC4.id;
        ERPProc5.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc5.Step__c=105;
        ERPProc5.From__c=0;
        ERPProc5.To__c=0;
        proList.add(ERPProc5);
        ERP_Procedure_Conditions__c ERPProc6 = new ERP_Procedure_Conditions__c();
        ERPProc6.Pricing_Condition__c =  ERP_PC5.id;
        ERPProc6.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc6.Step__c=106;
        ERPProc6.From__c=0;
        ERPProc6.To__c=0;
        proList.add(ERPProc6);
        ERP_Procedure_Conditions__c ERPProc7 = new ERP_Procedure_Conditions__c();
        ERPProc7.Pricing_Condition__c =  ERP_PC8.id;
        ERPProc7.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc7.Step__c=107;
        ERPProc7.From__c=0;
        ERPProc7.To__c=0;
        proList.add(ERPProc7);
        
        ERP_Procedure_Conditions__c ERPProc8 = new ERP_Procedure_Conditions__c();
        ERPProc8.Pricing_Condition__c =  ERP_PC1.id;
        ERPProc8.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc8.Step__c=108;
        ERPProc8.From__c=0;
        ERPProc8.To__c=0;
        proList.add(ERPProc8);
        
        ERP_Procedure_Conditions__c ERPProc9 = new ERP_Procedure_Conditions__c();
        ERPProc9.Pricing_Condition__c =  ERP_PC9.id;
        ERPProc9.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc9.Step__c=109;
        ERPProc9.From__c=0;
        ERPProc9.To__c=0;
        proList.add(ERPProc9);
        
        ERP_Procedure_Conditions__c ERPProc10 = new ERP_Procedure_Conditions__c();
        ERPProc10.Pricing_Condition__c =  ERP_PC10.id;
        ERPProc10.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc10.Step__c=110;
        ERPProc10.From__c=0;
        ERPProc10.To__c=0;
        proList.add(ERPProc10);
        
        ERP_Procedure_Conditions__c ERPProc11 = new ERP_Procedure_Conditions__c();
        ERPProc11.Pricing_Condition__c =  ERP_PC7.id;
        ERPProc11.Sales_Pricing_Procedure__c=PRProc1.id;
        ERPProc11.Step__c=111;
        ERPProc11.From__c=0;
        ERPProc11.To__c=0;
        proList.add(ERPProc11);
        
        insert proList;
        
        
        List<ERP_Pricing_Procedure__c> pricingProcedureList=[select Id,Pricing_Procedure_Code__c FROM ERP_Pricing_Procedure__c];
        Map<String,Id> sppCodeIdMap=new     Map<String,Id>();
        for(ERP_Pricing_Procedure__c spp:pricingProcedureList)
        {
            sppCodeIdMap.put(spp.Pricing_Procedure_Code__c,spp.Id);
        }
        
        //8. Pricing Request Item
        Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A243';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'AD43';
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
        npcResp1.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZDA1',new List<String>{'-2.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'25.000000000','EUR','1','EA'});
        cTRateMap.put('ZCRE',new List<String>{'-1.000000000','EUR','0','EA'});
        cTRateMap.put('ZCRG',new List<String>{'-1.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT AP';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A243';
        orgGrp1.ERP_Sales_Org_Code__c='A243';
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
        controller.bindvalueToNewRate();
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
        
        try{
            
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
            //controller.populateMap(pricRequestItem1);
            //controller.populateMap(pricRequestItem2);
            //controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
    }
    //Calment end
    //
    
    //Nadeem1 Start
    static testMethod void testDPT_AP2()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPT AP A243,A250,A280,AD43,AD80,D643,D650,D680 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT AP SPP1';
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
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
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
        ERP_PC1.Pricing_Condition_Code__c='ZPRI';
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
        ERP_PC3.Pricing_Condition_Code__c='ZCRE';
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
        ERP_PC4.Pricing_Condition_Code__c='ZPCH';
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
        ERP_PC6.Price_Types__c='Sub Total';
        ERP_PC6.Pricing_Condition_Code__c='IP';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A243',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='A243';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPT AP';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A243';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'AD43';
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
        npcResp1.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZDA1',new List<String>{'-2.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'25.000000000','EUR','1','EA'});
        cTRateMap.put('ZCRE',new List<String>{'-1.000000000','EUR','0','EA'});
        cTRateMap.put('ZCRG',new List<String>{'-1.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT AP';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A243';
        orgGrp1.ERP_Sales_Org_Code__c='A243';
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
        controller.bindvalueToNewRate();
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
        
        try{
            
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
            //controller.populateMap(pricRequestItem1);
            //controller.populateMap(pricRequestItem2);
            //controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
    }
    // Nadeem 1 END
    // Nadeem DPT LA SPP1 START
    static testMethod void testDPT_LA2()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPT LA A26B,AD60,D66C Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT LA SPP2';
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
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='List';
        ERP_PC1.Pricing_Condition_Code__c='ZPRI';
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
        ERP_PC3.Pricing_Condition_Code__c='ZCRE';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZPCH';
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
        ERP_PC6.Price_Types__c='Sub Total';
        ERP_PC6.Pricing_Condition_Code__c='IP';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A210',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='A210';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPT LA';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT LA SPP2').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A210';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'A210';
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
        npcResp1.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZDA1',new List<String>{'-2.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'25.000000000','EUR','1','EA'});
        cTRateMap.put('ZCRE',new List<String>{'-1.000000000','EUR','0','EA'});
        cTRateMap.put('ZCRG',new List<String>{'-1.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT LA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A210';
        orgGrp1.ERP_Sales_Org_Code__c='A210';
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
        controller.bindvalueToNewRate();
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
        
        try{
            
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
            //controller.populateMap(pricRequestItem1);
            //controller.populateMap(pricRequestItem2);
            //controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
    }
    // Nadeem DPT LA SPP1 END
    
    // Nadeem DPT LA SPP2 START
    static testMethod void testDPT_LA3()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPT LA A296,AD96,D696 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT LA SPP3';
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
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='PriceList';
        ERP_PC1.Pricing_Condition_Code__c='ZPRI';
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
        ERP_PC3.Pricing_Condition_Code__c='ZCRE';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZPCH';
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
        ERP_PC6.Price_Types__c='Sub Total';
        ERP_PC6.Pricing_Condition_Code__c='IP';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A210',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='A210';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPT LA';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT LA SPP3').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A210';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'A210';
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
        npcResp1.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZDA1',new List<String>{'-2.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'25.000000000','EUR','1','EA'});
        cTRateMap.put('ZCRE',new List<String>{'-1.000000000','EUR','0','EA'});
        cTRateMap.put('ZCRG',new List<String>{'-1.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT LA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A210';
        orgGrp1.ERP_Sales_Org_Code__c='A210';
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
        controller.bindvalueToNewRate();
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
        
        try{
            
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
            //controller.populateMap(pricRequestItem1);
            //controller.populateMap(pricRequestItem2);
            //controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
    }
    // Nadeem DPT LA SPP3 END
    //  Nadeem DPT LA SPP4 END
    static testMethod void testDPT_LA4()
    {
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPT LA D620,D640 Sales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPT LA SPP4';
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
        ERP_PC.Pricing_Condition_Code__c='ZPNG';
        ERP_PC.SAP_Application_Id__c='V';
        ERP_PC.SAP_Client_Id__c='510';
        ERP_PC.SAP_Cluster__c='CB1';
        ERP_PC.SAP_Condition_Type__c=true;
        ERP_PC.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC);
        ERP_Pricing_Condition__c ERP_PC1 = new ERP_Pricing_Condition__c();
        ERP_PC1.Price_Types__c='Standard';
        ERP_PC1.Calculation_Type__c='Quantity';
        ERP_PC1.Condition_Class__c='List';
        ERP_PC1.Pricing_Condition_Code__c='ZPRI';
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
        ERP_PC3.Pricing_Condition_Code__c='ZCRE';
        ERP_PC3.SAP_Application_Id__c='V';
        ERP_PC3.SAP_Client_Id__c='510';
        ERP_PC3.SAP_Cluster__c='CB1';
        ERP_PC3.SAP_Condition_Type__c=true;
        ERP_PC3.Pricing_Condition__c='Gross Price';
        pcList.add(ERP_PC3);
        ERP_Pricing_Condition__c ERP_PC4 = new ERP_Pricing_Condition__c();
        ERP_PC4.Price_Types__c='Standard';
        ERP_PC4.Calculation_Type__c='Quantity';
        ERP_PC4.Condition_Class__c='Surcharge';
        ERP_PC4.Pricing_Condition_Code__c='ZPCH';
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
        ERP_PC6.Price_Types__c='Sub Total';
        ERP_PC6.Pricing_Condition_Code__c='IP';
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
                                               ERP_Base_UOM__c='EA',ERP_Distribution_Channel_Code__c='10',ERP_Sales_Org_Code__c='A210',RecordTypeId=rid,
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
        pri.Sales_Org_Code__c='A210';
        pri.Dist_Channel_Code__c='10';
        pri.Division_Code__c='02';
        pri.BU__c='DPT LA';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPT LA SPP4').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem1.Rate__c = '100';
        pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem1.SAP_CLIENT_ID__C = '510';
        pricRequestItem1.SAP_Cluster__c = 'CB1';
        pricRequestItem1.SALES_ORG_CODE__C = 'A210';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
        pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
        pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
        pricRequestItem2.Rate__c = '100';
        pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
        pricRequestItem2.SAP_CLIENT_ID__C = '510';
        pricRequestItem2.SAP_Cluster__c = 'CB1';
        pricRequestItem2.SALES_ORG_CODE__C = 'A210';
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
        npcResp1.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp1.NPC_Message_Type__c='S';
        npcResp1.NPC_Request__c=npcReq1.Id;
        insert npcResp1;
        
        NPC_Response__c npcResp2=new NPC_Response__c();
        npcResp2.Condition_Rate_Key__c='ZPNG:25.000000000:ARS:1:KG:ZDA1:2.000000000:##:0:##:ZFIS:0.000000000:USD:1:KG:ZCRE:-1.000000000:ARS:10:KG:ZCRG:-1.000000000:##:0:##:J1AU:21.000000000:##:0:##:Z1T1:0.000000000:##:0:##:Z1X1:0.000000000:##:0:##:Z1X2:0.000000000:##:0:##:Z1X3:0.000000000:##:0:##:Z1X4:0.000000000:##:0:##:Z1X5:0.000000000:##:0:##:Z1X6:0.000000000:##:0:##:Z1X7:0.000000000:##:0:##:Z1X8:0.000000000:##:0:##:Z1X9:0.000000000:##:0:##:Z1Y1:0.000000000:##:0:##:Z1Y2:0.000000000:##:0:##:Z1Y3:0.000000000:##:0:##:Z1Y4:0.000000000:##:0:##:Z1YJ:0.000000000:##:0:##:Z1YL:0.000000000:##:0:##:Z1XR:0.000000000:##:0:##:Z1XC:0.000000000:##:0:##:SKTO:0.000000000:##:0:##:VPRS:110119.170000000:ARS:1000:KG:ZPAN:0.000000000:USD:1:KG:ZPAG:0.000000000:USD:1:KG';
        npcResp2.NPC_Message_Type__c='S';
        npcResp2.NPC_Request__c=npcReq1.Id;
        insert npcResp2;
        
        Map<String,List<String>> cTRateMap = new Map<String,List<String>>();
        cTRateMap.put('ZDA1',new List<String>{'-2.000000000','EUR','1','EA'}); 
        cTRateMap.put('ZPNG',new List<String>{'25.000000000','EUR','1','EA'});
        cTRateMap.put('ZCRE',new List<String>{'-1.000000000','EUR','0','EA'});
        cTRateMap.put('ZCRG',new List<String>{'-1.000000000','EUR','0','EA'});
        
        Set<ID> npcReqIds = new Set<ID>();
        npcReqIds.add(npcReq1.id);
        List<Pricing_Request_Item__c> prItemList = new List<Pricing_Request_Item__c>();
        prItemList.add(pricRequestItem1);
        
        
        //11. Invoking controller method
        PACalculateNetPrice controller = new PACalculateNetPrice();
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,true); 
        controller.calculateNPC(npcReqIds, cTRateMap, prItemList,false);
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPT LA';
        orgGrp.Owning_Business__c='DuPont Titanium Technologies';
        orgGrp.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        insert orgGrp;
        
        OrgGroup__c orgGrp1 = new OrgGroup__c();
        orgGrp1.RecordtypeId=Schema.SObjectType.OrgGroup__c.getRecordTypeInfosByName().get('ERP Sales Area').getRecordTypeId();
        orgGrp1.ERP_Sales_Org__c='A210';
        orgGrp1.ERP_Sales_Org_Code__c='A210';
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
        controller.bindvalueToNewRate();
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
        
        try{
            
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
            //controller.populateMap(pricRequestItem1);
            //controller.populateMap(pricRequestItem2);
            //controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
    }
    //  Nadeem DPT LA SPP4 END
    
    static testMethod void DPPAPSPP3()
    {
        
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPP AP B918,B950,B974,B943,B98A,B96F,B94ASales Pricing Procedure';
        PRProc1.Pricing_Procedure_Description__c='DPP AP SPP3';
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
        pri.BU__c='DPP AP';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP AP';
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
        controller.bindvalueToNewRate();
        controller.priId='sampleId';
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
        try{
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
        
        
    }
    static testMethod void DPPAPSPP4()
    {
        
        Trig_calculateNetPrice_UT1.insertCustomSettings();
        Trig_calculateNetPrice_UT1.customSettings();
        
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
        PRProc1.Pricing_Procedure_Code__c='DPP AP B900 Sales Pricing Procedure4';
        PRProc1.Pricing_Procedure_Description__c='DPP AP SPP4';
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
        pri.BU__c='DPP AP';
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
        String surfacesPP=PAPricingProcedureMapping__c.getInstance('DPP AP SPP1').Pricing_Procedure_Code__c;
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
        pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/Material/PH1/PH2/PH3/PH4/PH5/PH6';
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
        pricRequestItem2.KEY_COMBINATION__C = 'Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/PH1 Code/PH2 Code/PH3 Code/PH4 Code/PH5 Code/PH6 Code/Material Price Group Code-Sales Org./Dist. Channel/Division/Sold To/Product Hierarchy/Material Price Group';
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
        //controller.recalculate();
        //12. Organizational Group Items
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c='DPP AP';
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
        controller.bindvalueToNewRate();
        controller.priId='sampleId';
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
        try{
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
            controller.populateMap(pricRequestItem1);
            controller.populateMap(pricRequestItem2);
            controller.recalculate();
            Test.stopTest();
        }
        catch(Exception e){}
        
        
    }
    
    
}