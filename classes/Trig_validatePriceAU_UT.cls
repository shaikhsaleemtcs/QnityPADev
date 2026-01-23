@isTest
public class Trig_validatePriceAU_UT{
    static testMethod void validatePriceTest() {
        //<20171603> Merge&Spin: Method to create test data for "PAKeyCombinationUpdate" custom setting
        TestCustomSettingUtil.PAKeyCombinationUpdateTestData();
        // For Non-selective query issue
        ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
        Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
        SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
        insert pp;
            
        OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
        insert salesArea;
                        
        OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA');
        insert Business;
            
        List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
        orgItemList.add(new Organizational_Group_Item__c(
        Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                ERP_Currency__c=null));
         insert orgItemList;  
         // End
    // Load the test Pricing Request data from the static resource
    // Load the test Pricing Request data from the static resource
    set<id> prsetid=new set<id>();
         
         
         //update prrequest;
    Pricing_Request__c pri=new Pricing_Request__c(Pricing_Request_Type__c='Import',Sales_Org_Code__c='a200',BU__c='AP',Request_Type__c='Import',Customer_Specific__c=true,On_Behalf_Of__c=null,OwnerId=userinfo.getUserId(),Is_End_User_Rebate__c=false);
    insert pri;
         prsetid.add(pri.id);
    list<Sales_Prices__c> updatelist=new list<Sales_Prices__c>();
        Sales_Prices__c sp=new Sales_Prices__c();
         sp.BU__c='AP';
         sp.Country_Code__c='91';
         sp.Country__c='india';
         sp.Campaign__c='Test';
         sp.Dist_Channel_Code__c='1234';
         sp.Division_Code__c='12';
         sp.Pricing_Request__c=pri.id;
        sp.Sales_Pricing_Procedure__c=pp.id;
         sp.isPriceHolder__c=false;
         sp.KC_SAP__c='Test KC SAP';
         sp.Ship_To_Country__c='india';
             sp.Ship_To_Country_Code__c='91';
           sp.KC_SAP__c='Test KC SAP123';
         sp.Valid_To__c=system.Today()+1;
         sp.Valid_From__c=system.Today();  
         //sp.PCKC_SAP__c='test pcpkc';
         //sp.pckc__c='tesy';
         insert sp;
         
         updatelist.add(sp);
    List<Pricing_Request__c> pricingRequestList=[select Id,Pricing_Request_Type__c,Request_Approval_Status__c FROM Pricing_Request__c where id in :prsetid];
    
    
    Pricing_Request__c pricingRequest=new Pricing_Request__c();
    if(pricingRequestList!=null && pricingRequestList.size()!=0){
      pricingRequest=pricingRequestList.get(0);
      
      pricingRequest.Pricing_Request_Type__c='Permanent';
    }
    List<ERP_Sales_Prices_SAP__c> erpListToInsert=new List<ERP_Sales_Prices_SAP__c>();
      //Holder1
    
      ERP_Sales_Prices_SAP__c erp1=new ERP_Sales_Prices_SAP__c();
      erp1.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
      erp1.CURRENCYISOCODE = 'USD';
      erp1.Distributor_Code__c = 'Y7';
      erp1.Distributor_Name__c = 'Test';
    erp1.COUNTRY__C = 'Germany';
    erp1.CUSTOMER_SPECIFIC__C = true;
    erp1.Distribution_Channel_Code__c = '10';
    erp1.DIST_CHANNEL__C = 'DuPont Std';
    erp1.DIVISION_CODE__C = '2';
    erp1.DIVISION__C = 'GSD Standard';
    erp1.KEY_COMBINATION_CODE__C = 'A580';
    erp1.KEY_COMBINATION__C = 'Sales Area/Sold to/Material';
    erp1.MATERIAL_CODE__C = 'D11992510';
    erp1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erp1.PER__C = 1;
    erp1.PRICING_CONDITION_CODE__C = 'ZPSE';
    erp1.PRICING_CONDITION__C = 'Surface Gross Price';
    erp1.Sales_Price_Type__c = 'Permanent';
    erp1.Rate__c = '10';
    erp1.SAP_APPLICATION_ID__C = 'V';
    erp1.SAP_CLIENT_ID__C = '510';
    erp1.SALES_ORG_CODE__C = 'A640';
    erp1.SALES_ORG__C = 'Surf Dup Disa 3640';
    erp1.SCALED_PRICE_FLAG__C = true;
    erp1.SOLD_TO_CODE__C = '55470156';
    erp1.UNIT__C = '%';
    erp1.UOM__C = 'EA';
    erp1.VALID_FROM__C = Date.newInstance(2013, 1,1);
    erp1.VALID_TO__C = Date.newInstance(2013, 1,15);
    erp1.SCALE_BASIS__C = 'Quantity';
    erp1.SCALE_TYPE__C = 'From';
    erp1.Check_SCALE__C = 'Ascending';
    erp1.isPriceHolder__c=true;
    erp1.BU__c='BI EMEA';
    //pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c
    erpListToInsert.add(erp1);
    //test.startTest();
    //HOLDER 2
    ERP_Sales_Prices_SAP__c erp2=new ERP_Sales_Prices_SAP__c();
    
      erp2.CURRENCYISOCODE = 'USD';
      erp2.Distributor_Code__c = 'Y8';
      erp2.Distributor_Name__c = 'Test1';
    erp2.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
    erp2.COUNTRY__C = 'Germany';
    erp2.CUSTOMER_SPECIFIC__C = true;
    erp2.Distribution_Channel_Code__c = '10';
    erp2.DIST_CHANNEL__C = 'DuPont Std';
    erp2.DIVISION_CODE__C = '2';
    erp2.DIVISION__C = 'GSD Standard';
    erp2.KEY_COMBINATION_CODE__C = 'A580';
    erp2.KEY_COMBINATION__C = 'Sales Area/Sold to/Material';
    erp2.MATERIAL_CODE__C = 'D11992510';
    erp2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erp2.PER__C = 1;
    erp2.PRICING_CONDITION_CODE__C = 'ZPSE';
    erp2.PRICING_CONDITION__C = 'Surface Gross Price';
    erp2.Sales_Price_Type__c = 'Permanent';
    erp2.Rate__c = '10';
    erp2.SAP_APPLICATION_ID__C = 'V';
    erp2.SAP_CLIENT_ID__C = '510';
    erp2.SALES_ORG_CODE__C = 'A640';
    erp2.SALES_ORG__C = 'Surf Dup Disa 3640';
    erp2.SCALED_PRICE_FLAG__C = true;
    erp2.SOLD_TO_CODE__C = '55470156';
    erp2.UNIT__C = '%';
    erp2.UOM__C = 'EA';
    erp2.VALID_FROM__C = Date.newInstance(2013, 2,1);
    erp2.VALID_TO__C = Date.newInstance(2013, 2,21);
    erp2.SCALE_BASIS__C = 'Quantity';
    erp2.SCALE_TYPE__C = 'From';
    erp2.Check_SCALE__C = 'Ascending';
    erp2.isPriceHolder__c=true;
    erp2.BU__c='BI EMEA';
    erpListToInsert.add(erp2); 
    //for the delete holder logic 
    
    //erpListToInsert.add(erp3);
    
    
    //HOLDER 3-exactly one holder scenario-Project
    ERP_Sales_Prices_SAP__c erpProject=new ERP_Sales_Prices_SAP__c();
    erpProject.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
    erpProject.CURRENCYISOCODE = 'USD';
    erpProject.COUNTRY__C = 'Germany';
    erpProject.CUSTOMER_SPECIFIC__C = true;
    erpProject.Distribution_Channel_Code__c = '10';
    erpProject.DIST_CHANNEL__C = 'DuPont Std';
    erpProject.DIVISION_CODE__C = '2';
    erpProject.DIVISION__C = 'GSD Standard';
    erpProject.Distributor_Code__c = 'Y8';
      erpProject.Distributor_Name__c = 'Test1';
    //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
    erpProject.KEY_COMBINATION_CODE__C = PAKeyCombinationUpdate__c.getvalues('A692').NewKCCode__c;
    erpProject.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/Sold to/Material/DiscRef/Distributor';
    erpProject.MATERIAL_CODE__C = 'D11992510';
    erpProject.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erpProject.PER__C = 1; 
    erpProject.PRICING_CONDITION_CODE__C = 'ZPSE';
    erpProject.PRICING_CONDITION__C = 'Order volume disc shapes';
    erpProject.Sales_Price_Type__c = 'Project'; 
    
    erpProject.Rate__c = '10';
    erpProject.SAP_APPLICATION_ID__C = 'V';
    erpProject.SAP_CLIENT_ID__C = '510';
    erpProject.SALES_ORG_CODE__C = 'A640';
    erpProject.SALES_ORG__C = 'Surf Dup Disa 3640';
    erpProject.SCALED_PRICE_FLAG__C = true; 
    erpProject.SOLD_TO_CODE__C = '55470156';
    erpProject.UNIT__C = '%';
    erpProject.UOM__C = 'EA';
    erpProject.VALID_FROM__C = Date.newInstance(2013, 10,10);
    erpProject.VALID_TO__C = Date.newInstance(2014, 10,10);
    erpProject.SCALE_BASIS__C = 'Quantity';
    erpProject.SCALE_TYPE__C = 'From';
    erpProject.Check_SCALE__C = 'Ascending';
    erpProject.Project_Id__c='0000000001';
    erpProject.isPriceHolder__c=true;
    erpProject.BU__c='BI EMEA';
    erpListToInsert.add(erpProject);
    
      insert erpListToInsert;
    List<ERP_Sales_Prices_SAP__c> erpPricingRecords=new List<ERP_Sales_Prices_SAP__c>();
    ERP_Sales_Prices_SAP__c erp3=new ERP_Sales_Prices_SAP__c();
    erp3=erp2.clone(false,true);
    erp3.isPriceHolder__c=false;
    erp3.Price_Holder__c=erp2.Id;  
    erpPricingRecords.add(erp3);
    ERP_Sales_Prices_SAP__c erp4=new ERP_Sales_Prices_SAP__c();
    erp4=erp2.clone(false,true);
    erp4.isPriceHolder__c=false;
    erp4.Price_Holder__c=erp2.Id;
    erpPricingRecords.add(erp4);
    insert erpPricingRecords;
    //
    //test.stopTest();
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580- new price scenario -holder already exists scenario--holder1 in test class
  Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
    
    pricRequestItem1.CURRENCYISOCODE = 'USD';
    pricRequestItem1.Distributor_Code__c = 'Y7';
    pricRequestItem1.Distributor_Name__c = 'Test';
    pricRequestItem1.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem1.COUNTRY__C = 'Germany';
    pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem1.DIVISION_CODE__C = '2';
    pricRequestItem1.DIVISION__C = 'GSD Standard';
    pricRequestItem1.Ship_To_Country_Code__c = '91';
    pricRequestItem1.Ship_To_Country__c = 'INDIA';
    pricRequestItem1.ShipTo_Code__c = '55519013'; //<SH20221014> IS SC-00105301
    
    
    
      
    pricRequestItem1.GAP__C = false;
    pricRequestItem1.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem1.KEY_COMBINATION__C = 'Sales Area/Sold to/Material/Variant/Sales Order Type/Sales Order Item/Incoterms/Ship To/Ship-To Country/Distributor'; //<SS20220826> Sales Order Item
    pricRequestItem1.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem1.NEW_PER__C = 1;
    pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem1.Sales_Order_Item_Code__c = '10';   // <SS20220826> Sales Order Item
     pricRequestItem1.Sales_Order_Item__c = '10';
     pricRequestItem1.Sales_Order_Type_Code__c = '10';   // <SS20220826> Sales Order Type
     pricRequestItem1.Sales_Order_Type__c = '10';
     pricRequestItem1.Value_Center__c ='Test';
     pricRequestItem1.Value_Center_Code__c ='45';
     pricRequestItem1.Ext_Matl_Grp__c ='Tes';
     pricRequestItem1.Ext_Matl_Grp_Code__c ='456';
     pricRequestItem1.Material_group_2__c ='Test';
     pricRequestItem1.Material_group_2_Code__c='56';
     pricRequestItem1.Price_Zone__c='Test';
     pricRequestItem1.Price_Zone_Code__c='67';
    
    pricRequestItem1.PER__C = 1;
    //pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZD91';
    pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem1.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
    
    pricRequestItem1.Rate__c = '10';
    pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem1.SAP_CLIENT_ID__C = '510';
    pricRequestItem1.SALES_ORG_CODE__C = 'A640';
    pricRequestItem1.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem1.SCALED_PRICE_FLAG__C = true;
    pricRequestItem1.SOLD_TO_CODE__C = '55470156';
    pricRequestItem1.UNIT__C = '%';
    pricRequestItem1.UOM__C = 'EA';
    pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 2,14);
    pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
    pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
    pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,1);//18th jan
    pricRequestItem1.EDIT__C = false;
    pricRequestItem1.NEW__C = false;
    pricRequestItem1.SCALE_BASIS__C = 'Quantity';
    pricRequestItem1.SCALE_TYPE__C = 'From';
    
    //pricRequestItem1.SCALE__C = 'Ascending';
    
    pricingReqItemToUpdate.add(pricRequestItem1);
    /* Also covers holder alredy exists- appropriate holder END*/
    /*for non appropriate hodler scenario-START*/
   Pricing_Request_Item__c priForNonAppropriateHolder= new Pricing_Request_Item__c();
    priForNonAppropriateHolder=pricRequestItem1.clone(false,true);
    priForNonAppropriateHolder.New_Valid_From__c=Date.newInstance(2013,3,1);
    priForNonAppropriateHolder.New_Valid_To__c=Date.newInstance(2013,3,15);
    pricingReqItemToUpdate.add(priForNonAppropriateHolder);
    /*for non appropriate hodler scenario-END*/
    /*New Holder, new Record scenario START--no holder at all*/
  Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
    pricRequestItem2.CURRENCYISOCODE = 'USD';
    pricRequestItem2.Distributor_Code__c = 'Y8';
    pricRequestItem2.Distributor_Name__c = 'Test1';
    pricRequestItem2.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem2.COUNTRY__C = 'Germany';
    pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem2.DIVISION_CODE__C = '2';
    pricRequestItem2.DIVISION__C = 'GSD Standard';
    pricRequestItem2.Distributor_Code__c = 'Y7';
    pricRequestItem2.Distributor_Name__c = 'Test';
    pricRequestItem2.SOLD_TO_CODE__C=userinfo.getUserId();
    pricRequestItem2.Price_List_Type_Code__c='Price list123';
    pricRequestItem2.Terms_of_Payment_Code__c='payment terms 123';
    pricRequestItem2.country_code__c='country123';
    pricRequestItem2.ComPartner_Code__c='1213';
    pricRequestItem2.Variant_Code__c='Variant Code 876';
    pricRequestItem2.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem2.Shipping_Condition_Code__c='Shiping condition code A3434';
    pricRequestItem2.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem2.Ship_To_Country_Code__c = '91';
    pricRequestItem2.Ship_To_Country__c = 'INDIA';
    pricRequestItem2.Value_Center__c ='Test';
    pricRequestItem2.Value_Center_Code__c ='45';
    pricRequestItem2.Ext_Matl_Grp__c ='Tes';
    pricRequestItem2.Ext_Matl_Grp_Code__c ='456';
    pricRequestItem2.Material_group_2__c ='Test';
    pricRequestItem2.Material_group_2_Code__c='56';
    pricRequestItem2.Price_Zone__c='Test';
    pricRequestItem2.Price_Zone_Code__c='67';
    
    pricRequestItem2.EXPIRE__C = false;
    pricRequestItem2.GAP__C = false;
    //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
    pricRequestItem2.KEY_COMBINATION_CODE__C = PAKeyCombinationUpdate__c.getvalues('A692').NewKCCode__c;
    pricRequestItem2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Sales Office/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Material Price Group/DiscRef/Distributor';
    pricRequestItem2.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem2.NEW_PER__C = 1;
    pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem2.PH1_CODE__C = 'A6';
    pricRequestItem2.PH2_CODE__C = 'S1';
    pricRequestItem2.PH3_CODE__C = '15';
    pricRequestItem2.PH4_CODE__C = 'S1';
    pricRequestItem2.PH6_CODE__C = '14';
    pricRequestItem2.PH7_CODE__C = 'S9';
    pricRequestItem2.PH3_CODE__C = '13';
    pricRequestItem2.PER__C = 1; 
     
    pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem2.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem2.PRODUCT_HIERARCHY_CODE__C = 'A6S113############';
    pricRequestItem2.Rate__c = '10';
    pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem2.SAP_CLIENT_ID__C = '510';
    pricRequestItem2.SALES_ORG_CODE__C = 'A640';
    pricRequestItem2.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem2.SCALED_PRICE_FLAG__C = true;
    pricRequestItem2.SOLD_TO_CODE__C = '55470156';
    pricRequestItem2.UNIT__C = '%';
    pricRequestItem2.UOM__C = 'EA';
    pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 10,10);
    pricRequestItem2.VALID_TO__C = Date.newInstance(2014, 10,10);
    pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 10,1);
    pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2014, 11,1);
    pricRequestItem2.EDIT__C = false;
    pricRequestItem2.NEW__C = false;
    pricRequestItem2.SCALE_BASIS__C = 'Quantity';
    pricRequestItem2.SCALE_TYPE__C = 'From';
    //pricRequestItem2.SCALE__C = 'Ascending';
    pricRequestItem2.Country__c='INDIA';
    pricRequestItem2.Country_Code__c='IN';
    pricRequestItem2.Customer_Price_Group__c='TEST';
    pricRequestItem2.Customer_Price_Group_Code__c='1';
    pricRequestItem2.Disc_Ref__c='01';
    pricRequestItem2.End_Use__c='TEST';
    pricRequestItem2.End_Use_Code__c='55470156';
    pricRequestItem2.Market_Segment__c='TESTM';
    pricRequestItem2.Market_Segment_Code__c='TEST';
    pricRequestItem2.Material_Price_Group__c='Price Group 1';
    pricRequestItem2.Material_Price_Group_Code__c='P';
    pricRequestItem2.Price_List_Type__c='TEST';
    pricRequestItem2.Price_List_Type_Code__c='P1';
    pricRequestItem2.Price_Ref_Partner__c='TEST';
    pricRequestItem2.Price_Ref_Partner_Code__c='55470156';
    /*pricRequestItem2.CUSTOMER_HIERARCHY_CODE__c='12345678';
    pricRequestItem2.End_User_Code__c='87654321';*/
    pricRequestItem2.Sales_Office__c='A598';
    pricRequestItem2.Sales_Office_Code__c='TESTSALESOFFICE';
    pricRequestItem2.Terms_Of_Payment__c='TEST';
    pricRequestItem2.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem2.ShipTo__c='TEST';
    pricRequestItem2.ShipTo_Code__c='55470156';
    
    pricingReqItemToUpdate.add(pricRequestItem2);
    //end 
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
    pricRequestItem3=pricRequestItem2.clone(false,true);
    pricRequestItem3.Expire__c=true;
    pricRequestItem3.Ship_To_Country_Code__c = '91';
    pricRequestItem3.Ship_To_Country__c = 'INDIA';
    pricRequestItem3.Sales_Order_Item__c = '10';
    pricRequestItem3.Sales_Order_Item_Code__c = '10';
    pricRequestItem3.Value_Center__c ='Test';
    pricRequestItem3.Value_Center_Code__c ='45';
    pricRequestItem3.Ext_Matl_Grp__c ='Tes';
    pricRequestItem3.Ext_Matl_Grp_Code__c ='456';
    pricRequestItem3.Material_group_2__c ='Test';
    pricRequestItem3.Material_group_2_Code__c='56';
    pricRequestItem3.Price_Zone__c='Test';
    pricRequestItem3.Price_Zone_Code__c='67';
    pricingReqItemToUpdate.add(pricRequestItem3);
    
    
    
    Pricing_Request_Item__c pricRequestItem4 = new Pricing_Request_Item__c();
    
    pricRequestItem4.CURRENCYISOCODE = 'USD';
    pricRequestItem4.Distributor_Code__c = 'Y9';
    pricRequestItem4.Distributor_Name__c = 'Test9';
    pricRequestItem4.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem4.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem4.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem4.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem4.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem4.COUNTRY__C = 'Germany';
    pricRequestItem4.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem4.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem4.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem4.DIVISION_CODE__C = '2';
    pricRequestItem4.DIVISION__C = 'GSD Standard';
    pricRequestItem4.Ship_To_Country_Code__c = '91';
    pricRequestItem4.Ship_To_Country__c = 'INDIA';
   
    
    pricRequestItem4.GAP__C = false;
    pricRequestItem4.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem4.KEY_COMBINATION__C = 'Market Segment/Price Ref. Partner/Country/End Use/Price List Type/Terms of Payment/Customer Price Group/Material Price Group/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/FRB/Customer Hierarchy/End User/Distributor';
    pricRequestItem4.NEW_PER__C = 1;
    pricRequestItem4.NON_COMMERCIAL_PRODUCTS__C = false;
    
    pricRequestItem4.PER__C = 1;
    pricRequestItem4.ComPartner_Code__c='1213';
    pricRequestItem4.Variant_Code__c='Variant Code 876';
    pricRequestItem4.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem4.Shipping_Condition_Code__c='Shiping condition code A3434';
    pricRequestItem4.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem4.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem4.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem4.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem4.Rate__c = '10';
    pricRequestItem4.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem4.SAP_CLIENT_ID__C = '510';
    pricRequestItem4.SALES_ORG_CODE__C = 'A640';
    pricRequestItem4.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem4.SCALED_PRICE_FLAG__C = true;
    pricRequestItem4.SOLD_TO_CODE__C = '55470156';
    pricRequestItem4.UNIT__C = '%';
    pricRequestItem4.UOM__C = 'EA';
    pricRequestItem4.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem4.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem4.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem4.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem4.EDIT__C = false;
    pricRequestItem4.NEW__C = false;
    pricRequestItem4.SCALE_BASIS__C = 'Quantity';
    pricRequestItem4.SCALE_TYPE__C = 'From';
    //pricRequestItem4.SCALE__C = 'Ascending';
    pricRequestItem4.Country__c='INDIA';
    pricRequestItem4.Country_Code__c='IN';
    pricRequestItem4.Customer_Price_Group__c='TEST';
    pricRequestItem4.Customer_Price_Group_Code__c='2';
    pricRequestItem4.Disc_Ref__c='0000000001';
    pricRequestItem4.End_Use__c='TEST';
    pricRequestItem4.End_Use_Code__c='55470156';
    pricRequestItem4.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem4.Market_Segment_Code__c='TEST';
    pricRequestItem4.Material_Price_Group__c='Price Group 1';
    pricRequestItem4.Material_Price_Group_Code__c='1';
    pricRequestItem4.Price_List_Type__c='TEST';
    pricRequestItem4.Price_List_Type_Code__c='P1';
    pricRequestItem4.Price_Ref_Partner__c='TEST';
    pricRequestItem4.Price_Ref_Partner_Code__c='55470156';
    pricRequestItem4.Terms_Of_Payment__c='TEST';
    pricRequestItem4.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem4.PH4_CODE__C = 'A6';
    pricRequestItem4.PH5_CODE__C = 'S1';
    pricRequestItem4.PH6_CODE__C = '13';
    pricRequestItem4.PH7_CODE__C = '12';
    pricRequestItem4.PH8_CODE__C = '11';
    pricRequestItem4.PH9_CODE__C = 'S4';
    pricRequestItem4.Value_Center__c ='Test';
    pricRequestItem4.Value_Center_Code__c ='45';
    pricRequestItem4.Ext_Matl_Grp__c ='Tes';
    pricRequestItem4.Ext_Matl_Grp_Code__c ='456';
    pricRequestItem4.Material_group_2__c ='Test';
    pricRequestItem4.Material_group_2_Code__c='56';
    pricRequestItem4.Price_Zone__c='Test';
    pricRequestItem4.Price_Zone_Code__c='67';
    pricingReqItemToUpdate.add(pricRequestItem4);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem5 = new Pricing_Request_Item__c();
    pricRequestItem5=pricRequestItem4.clone(false,true);
    pricRequestItem5.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem5);
    
    //<SS20230501> - START
    Pricing_Request_Item__c pricRequestItem6 = new Pricing_Request_Item__c();  
    pricRequestItem6.CURRENCYISOCODE = 'USD';
    pricRequestItem6.Distributor_Code__c = 'Y9';
    pricRequestItem6.Distributor_Name__c = 'Test9';
    pricRequestItem6.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem6.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem6.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem6.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem6.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem6.COUNTRY__C = 'Germany';
    pricRequestItem6.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem6.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem6.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem6.DIVISION_CODE__C = '2';
    pricRequestItem6.DIVISION__C = 'GSD Standard';
    pricRequestItem6.Ship_To_Country_Code__c = '91';
    pricRequestItem6.Ship_To_Country__c = 'INDIA';
    pricRequestItem6.GAP__C = false;
    pricRequestItem6.KEY_COMBINATION_CODE__C = 'A607';
    pricRequestItem6.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Payer/Material/Price Zone/ComPartner/Plant/Destination Country/Kcode/Sales District/Document Currency/Char Name';
    pricRequestItem6.NEW_PER__C = 1;
    pricRequestItem6.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem6.PER__C = 1;
    pricRequestItem6.ComPartner_Code__c='1213';
    pricRequestItem6.Variant_Code__c='Variant Code 876';
    pricRequestItem6.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem6.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem6.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem6.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem6.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem6.Rate__c = '10';
    pricRequestItem6.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem6.SAP_CLIENT_ID__C = '510';
    pricRequestItem6.SALES_ORG_CODE__C = 'A640';
    pricRequestItem6.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem6.SCALED_PRICE_FLAG__C = true;
    pricRequestItem6.SOLD_TO_CODE__C = '55470156';
    pricRequestItem6.UNIT__C = '%';
    pricRequestItem6.UOM__C = 'EA';
    pricRequestItem6.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem6.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem6.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem6.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem6.EDIT__C = false;
    pricRequestItem6.NEW__C = false;
    pricRequestItem6.SCALE_BASIS__C = 'Quantity';
    pricRequestItem6.SCALE_TYPE__C = 'From';
    //pricRequestItem6.SCALE__C = 'Ascending';
    pricRequestItem6.Country__c='INDIA';
    pricRequestItem6.Country_Code__c='IN';
    pricRequestItem6.Customer_Price_Group__c='TEST';
    pricRequestItem6.Customer_Price_Group_Code__c='2';
    pricRequestItem6.Disc_Ref__c='0000000001';
    pricRequestItem6.End_Use__c='TEST';
    pricRequestItem6.End_Use_Code__c='55470156';
    pricRequestItem6.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem6.Market_Segment_Code__c='TEST';
    pricRequestItem6.Material_Price_Group__c='Price Group 1';
    pricRequestItem6.Material_Price_Group_Code__c='1';
    pricRequestItem6.Price_List_Type__c='TEST';
    pricRequestItem6.Price_List_Type_Code__c='P1';
    pricRequestItem6.Price_Ref_Partner__c='TEST';
    pricRequestItem6.Price_Ref_Partner_Code__c='55470156';
    pricRequestItem6.Terms_Of_Payment__c='TEST';
    pricRequestItem6.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem6.Price_Zone__c ='ABC';
    pricRequestItem6.Price_Zone_Code__c ='3223';
    pricRequestItem6.ComPartner_Code__c ='1123';
    pricRequestItem6.Plant_Code__c ='5527';
    pricRequestItem6.Payer__c = 'SDSFS';
    pricRequestItem6.Payer_Code__c = '453';
    pricRequestItem6.Material__c = 'SFS';
    pricRequestItem6.Material_Code__c = '32289';
    pricRequestItem6.Document_Currency_Code__c = '444';
    pricRequestItem6.Destination_Country_Code__c ='3225';
    pricRequestItem6.Kcode__c ='32415';
    pricRequestItem6.Sales_District_Code__c ='1290';
    pricRequestItem6.Char_Name__c = '2221';
    pricRequestItem6.Value_Center__c ='Test';
    pricRequestItem6.Value_Center_Code__c ='45';
    pricRequestItem6.Ext_Matl_Grp__c ='Tes';
    pricRequestItem6.Ext_Matl_Grp_Code__c ='456';
    pricRequestItem6.Material_group_2__c ='Test';
    pricRequestItem6.Material_group_2_Code__c='56';
    pricRequestItem6.Price_Zone__c='Test';
    pricRequestItem6.Price_Zone_Code__c='67';
    pricingReqItemToUpdate.add(pricRequestItem6);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem7 = new Pricing_Request_Item__c();
    pricRequestItem7=pricRequestItem6.clone(false,true);
    pricRequestItem7.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem7); 
         
    Pricing_Request_Item__c pricRequestItem8 = new Pricing_Request_Item__c();
    
    pricRequestItem8.CURRENCYISOCODE = 'USD';
    pricRequestItem8.Distributor_Code__c = 'Y9';
    pricRequestItem8.Distributor_Name__c = 'Test9';
    pricRequestItem8.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem8.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem8.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem8.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem8.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem8.COUNTRY__C = 'Germany';
    pricRequestItem8.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem8.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem8.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem8.DIVISION_CODE__C = '2';
    pricRequestItem8.DIVISION__C = 'GSD Standard';
    pricRequestItem8.Ship_To_Country_Code__c = '91';
    pricRequestItem8.Ship_To_Country__c = 'INDIA';
   
    
    pricRequestItem8.GAP__C = false;
    pricRequestItem8.KEY_COMBINATION_CODE__C = 'A741';
    pricRequestItem8.KEY_COMBINATION__C = 'Sales Org./Payer/Value Center/Contract No./Disc Ref No/Shipping Condition/Ext Matl Grp/Material Group 2/FixValDate/Partner ZF';
    pricRequestItem8.NEW_PER__C = 1;
    pricRequestItem8.NON_COMMERCIAL_PRODUCTS__C = false;
    
    pricRequestItem8.PER__C = 1;
    pricRequestItem8.ComPartner_Code__c='1213';
    pricRequestItem8.Variant_Code__c='Variant Code 876';
    pricRequestItem8.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem8.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem8.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem8.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem8.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem8.Rate__c = '10';
    pricRequestItem8.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem8.SAP_CLIENT_ID__C = '510';
    pricRequestItem8.SALES_ORG_CODE__C = 'A640';
    pricRequestItem8.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem8.SCALED_PRICE_FLAG__C = true;
    pricRequestItem8.SOLD_TO_CODE__C = '55470156';
    pricRequestItem8.UNIT__C = '%';
    pricRequestItem8.UOM__C = 'EA';
    pricRequestItem8.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem8.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem8.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem8.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem8.EDIT__C = false;
    pricRequestItem8.NEW__C = false;
    pricRequestItem8.SCALE_BASIS__C = 'Quantity';
    pricRequestItem8.SCALE_TYPE__C = 'From';
    //pricRequestItem8.SCALE__C = 'Ascending';
    pricRequestItem8.Country__c='INDIA';
    pricRequestItem8.Country_Code__c='IN';
    pricRequestItem8.Customer_Price_Group__c='TEST';
    pricRequestItem8.Customer_Price_Group_Code__c='2';
    pricRequestItem8.Disc_Ref__c='0000000001';
    pricRequestItem8.End_Use__c='TEST';
    pricRequestItem8.End_Use_Code__c='55470156';
    pricRequestItem8.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem8.Market_Segment_Code__c='TEST';
    pricRequestItem8.Material_Price_Group__c='Price Group 1';
    pricRequestItem8.Material_Price_Group_Code__c='1';
    pricRequestItem8.Terms_Of_Payment__c='TEST';
    pricRequestItem8.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem8.Value_Center__c = 'SDFS';  
    pricRequestItem8.Value_Center_Code__c ='7826';
    pricRequestItem8.Payer__c = 'SDSFS';
    pricRequestItem8.Payer_Code__c = '453';
    pricRequestItem8.Shipping_Condition__c = 'DSO';
    pricRequestItem8.Shipping_Condition_Code__c = '32314';
    pricRequestItem8.Ext_Matl_Grp__c = 'DSR';
    pricRequestItem8.Ext_Matl_Grp_Code__c = '9033';
    pricRequestItem8.Material_group_2__c ='RTEE';
    pricRequestItem8.Material_group_2_Code__c ='34225';
    pricRequestItem8.Partner_ZF__c = 'test';
    pricRequestItem8.Partner_ZF_Code__c ='3422';
    pricRequestItem8.Contract_Code__c = '6663';
    pricRequestItem8.Disc_Ref_No__c ='342';
    pricRequestItem8.FixValDate__c = Date.newInstance(2013, 2,1);
    pricingReqItemToUpdate.add(pricRequestItem8);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem9 = new Pricing_Request_Item__c();
    pricRequestItem9=pricRequestItem8.clone(false,true);
    pricRequestItem9.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem9);
         
    Pricing_Request_Item__c pricRequestItem10 = new Pricing_Request_Item__c();
    
    pricRequestItem10.CURRENCYISOCODE = 'USD';
    pricRequestItem10.Distributor_Code__c = 'Y9';
    pricRequestItem10.Distributor_Name__c = 'Test9';
    pricRequestItem10.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem10.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem10.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem10.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem10.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem10.COUNTRY__C = 'Germany';
    pricRequestItem10.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem10.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem10.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem10.DIVISION_CODE__C = '2';
    pricRequestItem10.DIVISION__C = 'GSD Standard';
    pricRequestItem10.Ship_To_Country_Code__c = '91';
    pricRequestItem10.Ship_To_Country__c = 'INDIA';
   
    
    pricRequestItem10.GAP__C = false;
    pricRequestItem10.KEY_COMBINATION_CODE__C = 'A702';
    pricRequestItem10.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Payer/Material/State/Material Group 1/Material Group 5 Key/Campaign/Char Name';
    pricRequestItem10.NEW_PER__C = 1;
    pricRequestItem10.NON_COMMERCIAL_PRODUCTS__C = false;
    
    pricRequestItem10.PER__C = 1;
    pricRequestItem10.ComPartner_Code__c='1213';
    pricRequestItem10.Variant_Code__c='Variant Code 876';
    pricRequestItem10.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem10.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem10.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem10.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem10.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem10.Rate__c = '10';
    pricRequestItem10.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem10.SAP_CLIENT_ID__C = '510';
    pricRequestItem10.SALES_ORG_CODE__C = 'A640';
    pricRequestItem10.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem10.SCALED_PRICE_FLAG__C = true;
    pricRequestItem10.SOLD_TO_CODE__C = '55470156';
    pricRequestItem10.UNIT__C = '%';
    pricRequestItem10.UOM__C = 'EA';
    pricRequestItem10.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem10.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem10.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem10.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem10.EDIT__C = false;
    pricRequestItem10.NEW__C = false;
    pricRequestItem10.SCALE_BASIS__C = 'Quantity';
    pricRequestItem10.SCALE_TYPE__C = 'From';
    //pricRequestItem10.SCALE__C = 'Ascending';
    pricRequestItem10.Country__c='INDIA';
    pricRequestItem10.Country_Code__c='IN';
    pricRequestItem10.Customer_Price_Group__c='TEST';
    pricRequestItem10.Customer_Price_Group_Code__c='2';
    pricRequestItem10.Disc_Ref__c='0000000001';
    pricRequestItem10.End_Use__c='TEST';
    pricRequestItem10.End_Use_Code__c='55470156';
    pricRequestItem10.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem10.Market_Segment_Code__c='TEST';
    pricRequestItem10.Material_Price_Group__c='Price Group 1';
    pricRequestItem10.Material_Price_Group_Code__c='1';
    pricRequestItem10.Price_List_Type__c='TEST';
    pricRequestItem10.Price_List_Type_Code__c='P1';
    pricRequestItem10.Price_Ref_Partner__c='TEST';
    pricRequestItem10.Price_Ref_Partner_Code__c='55470156';
    pricRequestItem10.Terms_Of_Payment__c='TEST';
    pricRequestItem10.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem10.Price_Zone__c ='ABC';
    pricRequestItem10.Price_Zone_Code__c ='3223';
    pricRequestItem10.ComPartner_Code__c ='1123';
    pricRequestItem10.Plant_Code__c ='5527';
    pricRequestItem10.Payer__c = 'SDSFS';
    pricRequestItem10.Payer_Code__c = '453';
    pricRequestItem10.Material__c = 'SFS';
    pricRequestItem10.Material_Code__c = '32289';
    pricRequestItem10.Document_Currency_Code__c = '444';
    pricRequestItem10.Destination_Country_Code__c ='3225';
    pricRequestItem10.Kcode__c ='32415';
    pricRequestItem10.Sales_District_Code__c ='1290';
    pricRequestItem10.State_Code__c = '8956';
    pricRequestItem10.Material_Group_1_Code__c = '88865';
    pricRequestItem10.Material_Group_5_Key_Code__c ='4353';
    pricRequestItem10.Campaign_Code__c ='3212';
    pricRequestItem10.Char_Name__c = '2221';
    pricRequestItem10.Value_Center__c ='Test';
    pricRequestItem10.Value_Center_Code__c ='45';
    pricRequestItem10.Ext_Matl_Grp__c ='Tes';
    pricRequestItem10.Ext_Matl_Grp_Code__c ='456';
    pricRequestItem10.Material_group_2__c ='Test';
    pricRequestItem10.Material_group_2_Code__c='56';
    pricRequestItem10.Price_Zone__c='Test';
    pricRequestItem10.Price_Zone_Code__c='67';
    pricingReqItemToUpdate.add(pricRequestItem10);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem11 = new Pricing_Request_Item__c();
    pricRequestItem11=pricRequestItem6.clone(false,true);
    pricRequestItem11.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem11); 
    //<SS20230501> - END
    
    Pricing_Request_Item__c priProject=new Pricing_Request_Item__c();
      priProject.PRICING_REQUEST__C = pricingRequest.Id;
    priProject.CURRENCYISOCODE = 'USD';
    priProject.COUNTRY__C = 'Germany';
    priProject.CUSTOMER_SPECIFIC__C = true;
    priProject.Dist_Channel_Code__c = '10';
    priProject.DIST_CHANNEL__C = 'DuPont Std';
    priProject.DIVISION_CODE__C = '2';
    priProject.DIVISION__C = 'GSD Standard';
    priProject.Distributor_Code__c = 'Y7';
    priProject.Distributor_Name__c = 'Test';
    //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
    priProject.KEY_COMBINATION_CODE__C = PAKeyCombinationUpdate__c.getvalues('A692').NewKCCode__c;
    priProject.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/Sold to/Material/DiscRef/Distributor';
    priProject.MATERIAL_CODE__C = 'D11992510';
    priProject.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject.PER__C = 1; 
    priProject.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject.Pricing_Request_Type__c = 'Project';
    
    priProject.Rate__c = '10';
    priProject.SAP_APPLICATION_ID__C = 'V';
    priProject.SAP_CLIENT_ID__C = '510';
    priProject.SALES_ORG_CODE__C = 'A640';
    priProject.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject.SCALED_PRICE_FLAG__C = true;
    priProject.SOLD_TO_CODE__C = '55470156';
    priProject.UNIT__C = '%';
    priProject.UOM__C = 'EA';
    priProject.Valid_From__c = Date.newInstance(2013, 10,10);
    priProject.Valid_To__c = Date.newInstance(2014, 10,10);
    priProject.New_VALID_FROM__C = Date.newInstance(2013, 10,10);
    priProject.New_VALID_TO__C = Date.newInstance(2014, 1,1);
    priProject.SCALE_BASIS__C = 'Quantity';
    priProject.SCALE_TYPE__C = 'From';
    priProject.Disc_Ref__c='0000000001';
   
    pricingReqItemToUpdate.add(priProject);
    
    upsert pricingReqItemToUpdate;
    
    pricingRequest.BU__C = Business.Business__c;
    pricingRequest.BU__C = 'BI EMEA';
    pricingRequest.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
    pricingRequest.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
    pricingRequest.Division_Code__c = salesArea.ERP_Division_code__c;
    pricingRequest.Request_Approval_Status__c='Approved';
    
   update pricingRequest;
    Test.startTest();//Start-Added to avoid too many SOQL queries error - PG-20160919
    Pricing_Request__c pri1=new Pricing_Request__c(Sales_Org_Code__c='a200',BU__c='AP');
    insert pri1;
    
    List<Pricing_Request__c> pricingRequestList1=[select Id,Pricing_Request_Type__c,Request_Approval_Status__c FROM Pricing_Request__c where id=:pri1.Id];
    
    
    Pricing_Request__c pricingRequest1=new Pricing_Request__c(Sales_Org_Code__c='a200',BU__c='AP');
    if(pricingRequestList1!=null && pricingRequestList1.size()!=0){
      pricingRequest1=pricingRequestList1.get(0);
      
      pricingRequest1.Pricing_Request_Type__c='Floor';
    }
   
    List<Sales_Prices__c> erpListToInsert1=new List<Sales_Prices__c>();
      //Holder1
    
      Sales_Prices__c erp5=new Sales_Prices__c();
      erp5.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
      erp5.CURRENCYISOCODE = 'USD';
    erp5.COUNTRY__C = 'Germany';
    erp5.CUSTOMER_SPECIFIC__C = false;
    erp5.DIST_CHANNEL__C = 'DuPont Std';
    erp5.DIVISION_CODE__C = '2';
    erp5.DIVISION__C = 'GSD Standard';
    erp5.KEY_COMBINATION_CODE__C = 'X100';
    erp5.KEY_COMBINATION__C = 'Sales Area/Material';
    erp5.MATERIAL_CODE__C = 'D11992510';
    erp5.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erp5.PER__C = 1;
    erp5.PRICING_CONDITION_CODE__C = 'ZPSE';
    erp5.PRICING_CONDITION__C = 'Surface Gross Price';
    erp5.Sales_Price_Type__c = 'Floor';
    erp5.Rate__c = '10';
    erp5.SAP_APPLICATION_ID__C = 'V';
    erp5.SAP_CLIENT_ID__C = '510';
    erp5.SALES_ORG_CODE__C = 'A640';
    erp5.SALES_ORG__C = 'Surf Dup Disa 3640';
    erp5.SCALED_PRICE_FLAG__C = true;
    erp5.UNIT__C = '%';
    erp5.UOM__C = 'EA';
    erp5.VALID_FROM__C = Date.newInstance(2013, 1,1);
    erp5.VALID_TO__C = Date.newInstance(2013, 1,15);
    erp5.SCALE_BASIS__C = 'Quantity';
    erp5.SCALE_TYPE__C = 'From';
    erp5.Check_SCALE__C = 'Ascending';
    erp5.isPriceHolder__c=true;
    erp5.BU__c='BI EMEA';
    //pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c
    erpListToInsert1.add(erp5);
    insert erpListToInsert1;
    Sales_Prices__c erp6=new Sales_Prices__c();
    erp6=erp5.clone(false,true);
    erp6.isPriceHolder__c=false;
    erp6.Price_Holder__c=erp5.Id;
    
    insert erp6;
    
     Pricing_Request_Item__c priProject1=new Pricing_Request_Item__c();
      priProject1.PRICING_REQUEST__C = pricingRequest1.Id;
    priProject1.CURRENCYISOCODE = 'USD';
    priProject1.COUNTRY__C = 'Germany';
    priProject1.CUSTOMER_SPECIFIC__C = false;
    priProject1.Dist_Channel_Code__c = '10';
    priProject1.DIST_CHANNEL__C = 'DuPont Std';
    priProject1.DIVISION_CODE__C = '2';
    priProject1.DIVISION__C = 'GSD Standard';
    priProject1.KEY_COMBINATION_CODE__C = 'X100';
    priProject1.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/PH/Material';
    priProject1.MATERIAL_CODE__C = 'D11992510';
    priProject1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject1.PER__C = 1; 
    priProject1.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject1.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject1.Pricing_Request_Type__c = 'Floor';
    priProject1.Ship_To_Country__c='india';
    priProject1.Ship_To_Country_code__c='91';
    priProject1.Rate__c = '10';
    priProject1.SAP_APPLICATION_ID__C = 'V';
    priProject1.SAP_CLIENT_ID__C = '510';
    priProject1.SALES_ORG_CODE__C = 'A640';
    priProject1.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject1.SCALED_PRICE_FLAG__C = true;
    priProject1.UNIT__C = '%';
    priProject1.UOM__C = 'EA';
    priProject1.Valid_From__c = Date.newInstance(2013, 2,1);
    priProject1.Valid_To__c = Date.newInstance(2014, 1,2);
    priProject1.New_VALID_FROM__C = Date.newInstance(2013, 1,1);
    priProject1.New_VALID_TO__C = Date.newInstance(2014, 1,14);
    priProject1.SCALE_BASIS__C = 'Quantity';
    priProject1.SCALE_TYPE__C = 'From';
    
      Pricing_Request_Item__c priProject2=new Pricing_Request_Item__c();
      priProject2.PRICING_REQUEST__C = pricingRequest1.Id;
    priProject2.CURRENCYISOCODE = 'USD';
    priProject2.COUNTRY__C = 'Germany';
    priProject2.CUSTOMER_SPECIFIC__C = false;
    priProject.Dist_Channel_Code__c = '10';
    priProject2.DIST_CHANNEL__C = 'DuPont Std';
    priProject2.DIVISION_CODE__C = '2';
    priProject2.DIVISION__C = 'GSD Standard';
    priProject2.Ship_To_Country__c='india';
    priProject2.Ship_To_Country_code__c='91';
    priProject2.KEY_COMBINATION_CODE__C = 'X100';
    priProject2.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Material';
    priProject2.MATERIAL_CODE__C = 'D11992510';
    priProject2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject2.PER__C = 1; 
    priProject2.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject2.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject2.Pricing_Request_Type__c = 'Floor';
    priProject2.PH4_CODE__C = 'A6';
    priProject2.PH5_CODE__C = 'S1';
    priProject2.PH6_CODE__C = '13';
    priProject2.PH7_CODE__C = '12';
    priProject2.PH8_CODE__C = '11';
    priProject2.PH9_CODE__C = 'S4';
    priProject2.Rate__c = '10';
    priProject2.SAP_APPLICATION_ID__C = 'V';
    priProject2.SAP_CLIENT_ID__C = '510';
    priProject2.SALES_ORG_CODE__C = 'A640';
    priProject2.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject2.SCALED_PRICE_FLAG__C = true;
    priProject2.UNIT__C = '%';
    priProject2.UOM__C = 'EA';
    priProject2.Valid_From__c = Date.newInstance(2013, 2,1);
    priProject2.Valid_To__c = Date.newInstance(2014, 1,2);
    priProject2.New_VALID_FROM__C = Date.newInstance(2013, 1,1);
    priProject2.New_VALID_TO__C = Date.newInstance(2014, 1,14);
    priProject2.SCALE_BASIS__C = 'Quantity';
    priProject2.SCALE_TYPE__C = 'From';
    
   
       
    insert priProject2;
    
     Pricing_Request_Item__c priProject3=new Pricing_Request_Item__c();
      priProject3.PRICING_REQUEST__C = pricingRequest1.Id;
    priProject3.CURRENCYISOCODE = 'USD';
         priProject3.Disc_Ref__c='Disc Ref1123';
                         

    priProject3.COUNTRY__C = 'Germany';
    priProject3.CUSTOMER_SPECIFIC__C = false;
    priProject3.Dist_Channel_Code__c = '10';
    priProject3.DIST_CHANNEL__C = 'DuPont Std';
    priProject3.Ship_To_Country__c='india';
    priProject3.Ship_To_Country_code__c='91';
    priProject3.DIVISION_CODE__C = '2';
    priProject3.DIVISION__C = 'GSD Standard';
    priProject3.KEY_COMBINATION_CODE__C = 'X100';
    priProject3.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Material';
    priProject3.MATERIAL_CODE__C = 'D11992510';
    priProject3.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject3.PER__C = 1; 
    priProject3.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject3.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject3.Pricing_Request_Type__c = 'Floor';
    priProject3.PH4_CODE__C = 'A6';
    priProject3.PH5_CODE__C = 'S1';
    priProject3.PH6_CODE__C = '13';
    priProject3.PH7_CODE__C = '12';
    priProject3.PH8_CODE__C = '11';
    priProject3.PH9_CODE__C = 'S4';
    priProject3.Rate__c = '10';
    priProject3.SAP_APPLICATION_ID__C = 'V';
    priProject3.SAP_CLIENT_ID__C = '510';
    priProject3.SALES_ORG_CODE__C = 'A640';
    priProject3.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject3.SCALED_PRICE_FLAG__C = true;
    priProject3.UNIT__C = '%';
    priProject3.UOM__C = 'EA';
    priProject3.Valid_From__c = Date.newInstance(2013, 2,1);
    priProject3.Valid_To__c = Date.newInstance(2014, 1,2);
    priProject3.New_VALID_FROM__C = Date.newInstance(2013, 1,1);
    priProject3.New_VALID_TO__C = Date.newInstance(2014, 1,14);
    priProject3.SCALE_BASIS__C = 'Quantity';
    priProject3.SCALE_TYPE__C = 'From';
    priProject3.Expire__c= true;
   
       
    upsert priProject3;
    
    pricingRequest1.BU__C = Business.Business__c;
    pricingRequest1.BU__C = 'BI EMEA';
    pricingRequest1.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
    pricingRequest1.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
    pricingRequest1.Division_Code__c = salesArea.ERP_Division_code__c;
    pricingRequest1.Request_Approval_Status__c='Approved';    
    //update pricingRequest1;
    
    //<AJ20160115> START Added the code to cover "trigPricingRequest" trigger
    
    pricingRequest1.Request_Approval_Status__c='Submitted';    
    update pricingRequest1;
    
    pricingRequest1.Request_Approval_Status__c='Validated';    
    update pricingRequest1;
    
    pricingRequest1.Request_Approval_Status__c='Submitted';    
    update pricingRequest1;
    
    pricingRequest1.Request_Approval_Status__c='Validated';    
    update pricingRequest1;
       Test.stopTest();//End-Added to avoid too many SOQL queries error - PG-20160919
    // <AJ20160115> END
    // Added to increase coverage by pavan 
    
    ERP_Customer__c erpcustomer=new ERP_Customer__c();
    erpcustomer.name='DURBAN';
    erpcustomer.CurrencyIsoCode='USD';
    erpcustomer.Sales_Org__c='Sales_Org_Code__c ';
    erpcustomer.Distribution_Channel_Code__c='1235';
    erpcustomer.customer_code__c='1313';
    
    insert erpcustomer;
    
    ERP_Relationship__c errel=new ERP_Relationship__c();
    errel.Partner_Function_Code__c='ZU';
    errel.Partner_Function__c='ZU';
    errel.User__c=userinfo.getuserid();
    errel.ERP_Customer__c=erpcustomer.id;
    insert errel;
         
         
    map<string,id> custSRMap=new map<string,id>();
    map<id,pricing_request__C> prmap=new map<id,pricing_request__C>();
    
    custSRMap.put(erpcustomer.Customer_Code__c,errel.User__c); 
    prmap.put(pri.id,pri);
         
    Trig_validatePriceAUNewUtil.createHolderFromItem(pricRequestItem3,erp6.id,custSRMap,prmap);     
    Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pricRequestItem3,erp6.id,custSRMap,prmap);
    Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pricRequestItem4,erp6.id,custSRMap,prmap);
    Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pricRequestItem1,erp6.id,custSRMap,prmap);
  Sales_Prices__c wsp=Trig_validatePriceAUNewUtil.createNonSAPHolderFromItem(pricRequestItem3,userinfo.getuserid());
         
   Sales_Prices__c sp1= Trig_validatePriceAUNewUtil.createNonSAPPriceFromItem(pricRequestItem3,userinfo.getuserid());
  }
   
    static testMethod void validatePriceTest2() {
        //<20171603> Merge&Spin: Method to create test data for "PAKeyCombinationUpdate" custom setting
        TestCustomSettingUtil.PAKeyCombinationUpdateTestData();
        // For Non-selective query issue
        ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
        Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
        SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
        insert pp;
            
        OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
        insert salesArea;
                        
        OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA');
        insert Business;
            
        List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
        orgItemList.add(new Organizational_Group_Item__c(
        Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                ERP_Currency__c=null));
         insert orgItemList;  
         // End
    // Load the test Pricing Request data from the static resource
    // Load the test Pricing Request data from the static resource
    set<id> prsetid=new set<id>();
         
         
         //update prrequest;
    Pricing_Request__c pri=new Pricing_Request__c(Pricing_Request_Type__c='Import',Sales_Org_Code__c='a200',BU__c='AP',Request_Type__c='Import',Customer_Specific__c=true,On_Behalf_Of__c=null,OwnerId=userinfo.getUserId(),Is_End_User_Rebate__c=true);
    insert pri;
         prsetid.add(pri.id);
    list<Sales_Prices__c> updatelist=new list<Sales_Prices__c>();
        Sales_Prices__c sp=new Sales_Prices__c();
         sp.BU__c='AP';
         sp.Country_Code__c='91';
         sp.Country__c='india';
         sp.Campaign__c='Test';
         sp.Dist_Channel_Code__c='1234';
         sp.Division_Code__c='12';
         sp.Pricing_Request__c=pri.id;
        sp.Sales_Pricing_Procedure__c=pp.id;
         sp.isPriceHolder__c=false;
         sp.KC_SAP__c='Test KC SAP';
         sp.Ship_To_Country__c='india';
             sp.Ship_To_Country_Code__c='91';
           sp.KC_SAP__c='Test KC SAP123';
         sp.Valid_To__c=system.Today()+1;
         sp.Valid_From__c=system.Today();  
         //sp.PCKC_SAP__c='test pcpkc';
         //sp.pckc__c='tesy';
         insert sp;
         
         updatelist.add(sp);
    List<Pricing_Request__c> pricingRequestList=[select Id,Pricing_Request_Type__c,Request_Approval_Status__c FROM Pricing_Request__c where id in :prsetid];
    
    
    Pricing_Request__c pricingRequest=new Pricing_Request__c();
    if(pricingRequestList!=null && pricingRequestList.size()!=0){
      pricingRequest=pricingRequestList.get(0);
      
      pricingRequest.Pricing_Request_Type__c='Permanent';
    }
    List<ERP_Sales_Prices_SAP__c> erpListToInsert=new List<ERP_Sales_Prices_SAP__c>();
      //Holder1
    
      ERP_Sales_Prices_SAP__c erp1=new ERP_Sales_Prices_SAP__c();
      erp1.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
      erp1.CURRENCYISOCODE = 'USD';
      erp1.Distributor_Code__c = 'Y7';
      erp1.Distributor_Name__c = 'Test';
    erp1.COUNTRY__C = 'Germany';
    erp1.CUSTOMER_SPECIFIC__C = true;
    erp1.Distribution_Channel_Code__c = '10';
    erp1.DIST_CHANNEL__C = 'DuPont Std';
    erp1.DIVISION_CODE__C = '2';
    erp1.DIVISION__C = 'GSD Standard';
    erp1.KEY_COMBINATION_CODE__C = 'A580';
    erp1.KEY_COMBINATION__C = 'Sales Area/Sold to/Material';
    erp1.MATERIAL_CODE__C = 'D11992510';
    erp1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erp1.PER__C = 1;
    erp1.PRICING_CONDITION_CODE__C = 'ZPSE';
    erp1.PRICING_CONDITION__C = 'Surface Gross Price';
    erp1.Sales_Price_Type__c = 'Permanent';
    erp1.Rate__c = '10';
    erp1.SAP_APPLICATION_ID__C = 'V';
    erp1.SAP_CLIENT_ID__C = '510';
    erp1.SALES_ORG_CODE__C = 'A640';
    erp1.SALES_ORG__C = 'Surf Dup Disa 3640';
    erp1.SCALED_PRICE_FLAG__C = true;
    erp1.SOLD_TO_CODE__C = '55470156';
    erp1.UNIT__C = '%';
    erp1.UOM__C = 'EA';
    erp1.VALID_FROM__C = Date.newInstance(2013, 1,1);
    erp1.VALID_TO__C = Date.newInstance(2013, 1,15);
    erp1.SCALE_BASIS__C = 'Quantity';
    erp1.SCALE_TYPE__C = 'From';
    erp1.Check_SCALE__C = 'Ascending';
    erp1.isPriceHolder__c=true;
    erp1.BU__c='BI EMEA';
    //pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c
    erpListToInsert.add(erp1);
    //test.startTest();
    //HOLDER 2
    ERP_Sales_Prices_SAP__c erp2=new ERP_Sales_Prices_SAP__c();
    
      erp2.CURRENCYISOCODE = 'USD';
      erp2.Distributor_Code__c = 'Y8';
      erp2.Distributor_Name__c = 'Test1';
    erp2.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
    erp2.COUNTRY__C = 'Germany';
    erp2.CUSTOMER_SPECIFIC__C = true;
    erp2.Distribution_Channel_Code__c = '10';
    erp2.DIST_CHANNEL__C = 'DuPont Std';
    erp2.DIVISION_CODE__C = '2';
    erp2.DIVISION__C = 'GSD Standard';
    erp2.KEY_COMBINATION_CODE__C = 'A580';
    erp2.KEY_COMBINATION__C = 'Sales Area/Sold to/Material';
    erp2.MATERIAL_CODE__C = 'D11992510';
    erp2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erp2.PER__C = 1;
    erp2.PRICING_CONDITION_CODE__C = 'ZPSE';
    erp2.PRICING_CONDITION__C = 'Surface Gross Price';
    erp2.Sales_Price_Type__c = 'Permanent';
    erp2.Rate__c = '10';
    erp2.SAP_APPLICATION_ID__C = 'V';
    erp2.SAP_CLIENT_ID__C = '510';
    erp2.SALES_ORG_CODE__C = 'A640';
    erp2.SALES_ORG__C = 'Surf Dup Disa 3640';
    erp2.SCALED_PRICE_FLAG__C = true;
    erp2.SOLD_TO_CODE__C = '55470156';
    erp2.UNIT__C = '%';
    erp2.UOM__C = 'EA';
    erp2.VALID_FROM__C = Date.newInstance(2013, 2,1);
    erp2.VALID_TO__C = Date.newInstance(2013, 2,21);
    erp2.SCALE_BASIS__C = 'Quantity';
    erp2.SCALE_TYPE__C = 'From';
    erp2.Check_SCALE__C = 'Ascending';
    erp2.isPriceHolder__c=true;
    erp2.BU__c='BI EMEA';
    erpListToInsert.add(erp2); 
    //for the delete holder logic 
    
    //erpListToInsert.add(erp3);
    
    
    //HOLDER 3-exactly one holder scenario-Project
    ERP_Sales_Prices_SAP__c erpProject=new ERP_Sales_Prices_SAP__c();
    erpProject.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
    erpProject.CURRENCYISOCODE = 'USD';
    erpProject.COUNTRY__C = 'Germany';
    erpProject.CUSTOMER_SPECIFIC__C = true;
    erpProject.Distribution_Channel_Code__c = '10';
    erpProject.DIST_CHANNEL__C = 'DuPont Std';
    erpProject.DIVISION_CODE__C = '2';
    erpProject.DIVISION__C = 'GSD Standard';
    erpProject.Distributor_Code__c = 'Y8';
      erpProject.Distributor_Name__c = 'Test1';
    //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
    erpProject.KEY_COMBINATION_CODE__C = PAKeyCombinationUpdate__c.getvalues('A692').NewKCCode__c;
    erpProject.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/Sold to/Material/DiscRef/Distributor';
    erpProject.MATERIAL_CODE__C = 'D11992510';
    erpProject.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erpProject.PER__C = 1; 
    erpProject.PRICING_CONDITION_CODE__C = 'ZPSE';
    erpProject.PRICING_CONDITION__C = 'Order volume disc shapes';
    erpProject.Sales_Price_Type__c = 'Project'; 
    
    erpProject.Rate__c = '10';
    erpProject.SAP_APPLICATION_ID__C = 'V';
    erpProject.SAP_CLIENT_ID__C = '510';
    erpProject.SALES_ORG_CODE__C = 'A640';
    erpProject.SALES_ORG__C = 'Surf Dup Disa 3640';
    erpProject.SCALED_PRICE_FLAG__C = true; 
    erpProject.SOLD_TO_CODE__C = '55470156';
    erpProject.UNIT__C = '%';
    erpProject.UOM__C = 'EA';
    erpProject.VALID_FROM__C = Date.newInstance(2013, 10,10);
    erpProject.VALID_TO__C = Date.newInstance(2014, 10,10);
    erpProject.SCALE_BASIS__C = 'Quantity';
    erpProject.SCALE_TYPE__C = 'From';
    erpProject.Check_SCALE__C = 'Ascending';
    erpProject.Project_Id__c='0000000001';
    erpProject.isPriceHolder__c=true;
    erpProject.BU__c='BI EMEA';
    erpListToInsert.add(erpProject);
    
      insert erpListToInsert;
    List<ERP_Sales_Prices_SAP__c> erpPricingRecords=new List<ERP_Sales_Prices_SAP__c>();
    ERP_Sales_Prices_SAP__c erp3=new ERP_Sales_Prices_SAP__c();
    erp3=erp2.clone(false,true);
    erp3.isPriceHolder__c=false;
    erp3.Price_Holder__c=erp2.Id;  
    erpPricingRecords.add(erp3);
    ERP_Sales_Prices_SAP__c erp4=new ERP_Sales_Prices_SAP__c();
    erp4=erp2.clone(false,true);
    erp4.isPriceHolder__c=false;
    erp4.Price_Holder__c=erp2.Id;
    erpPricingRecords.add(erp4);
    insert erpPricingRecords;
    //
    //test.stopTest();
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580- new price scenario -holder already exists scenario--holder1 in test class
  Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
    
    pricRequestItem1.CURRENCYISOCODE = 'USD';
    pricRequestItem1.Distributor_Code__c = 'Y7';
    pricRequestItem1.Distributor_Name__c = 'Test';
    pricRequestItem1.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem1.COUNTRY__C = 'Germany';
    pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem1.DIVISION_CODE__C = '2';
    pricRequestItem1.DIVISION__C = 'GSD Standard';
    
    
      
    pricRequestItem1.GAP__C = false;
    pricRequestItem1.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem1.KEY_COMBINATION__C = 'Sales Area/Sold to/Material/Variant/Sales Order Type/Sales Order Item/Incoterms/Ship To/Ship-To Country/Distributor'; //<SS20220826> Sales Order Item
    pricRequestItem1.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem1.NEW_PER__C = 1;
    pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
     pricRequestItem1.Sales_Order_Item_Code__c = '10';   // <SS20220826> Sales Order Item
     pricRequestItem1.Sales_Order_Item__c = '10';
     pricRequestItem1.Sales_Order_Type_Code__c = '10';   // <SS20220826> Sales Order Type
     pricRequestItem1.Sales_Order_Type__c = '10';
     pricRequestItem1.Value_Center__c ='Test';
     pricRequestItem1.Value_Center_Code__c ='45';
     pricRequestItem1.Ext_Matl_Grp__c ='Tes';
     pricRequestItem1.Ext_Matl_Grp_Code__c ='456';
     pricRequestItem1.Material_group_2__c ='Test';
     pricRequestItem1.Material_group_2_Code__c='56';
     pricRequestItem1.Price_Zone__c='Test';
     pricRequestItem1.Price_Zone_Code__c='67';
    
    pricRequestItem1.PER__C = 1;
    //pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZD91';
    pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem1.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
    
    pricRequestItem1.Rate__c = '10';
    pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem1.SAP_CLIENT_ID__C = '510';
    pricRequestItem1.SALES_ORG_CODE__C = 'A640';
    pricRequestItem1.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem1.SCALED_PRICE_FLAG__C = true;
    pricRequestItem1.SOLD_TO_CODE__C = '55470156';
    pricRequestItem1.UNIT__C = '%';
    pricRequestItem1.UOM__C = 'EA';
    pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 2,14);
    pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
    pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
    pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 2,1);//18th jan
    pricRequestItem1.EDIT__C = false;
    pricRequestItem1.NEW__C = false;
    pricRequestItem1.SCALE_BASIS__C = 'Quantity';
    pricRequestItem1.SCALE_TYPE__C = 'From';
    
    //pricRequestItem1.SCALE__C = 'Ascending';
    
    pricingReqItemToUpdate.add(pricRequestItem1);
    /* Also covers holder alredy exists- appropriate holder END*/
    /*for non appropriate hodler scenario-START*/
  Pricing_Request_Item__c priForNonAppropriateHolder= new Pricing_Request_Item__c();
    priForNonAppropriateHolder=pricRequestItem1.clone(false,true);
    priForNonAppropriateHolder.New_Valid_From__c=Date.newInstance(2013,3,1);
    priForNonAppropriateHolder.New_Valid_To__c=Date.newInstance(2013,3,15);
    pricingReqItemToUpdate.add(priForNonAppropriateHolder);
    /*for non appropriate hodler scenario-END*/
    /*New Holder, new Record scenario START--no holder at all*/
    Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
    pricRequestItem2.CURRENCYISOCODE = 'USD';
    pricRequestItem2.Distributor_Code__c = 'Y8';
    pricRequestItem2.Distributor_Name__c = 'Test1';
    pricRequestItem2.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem2.COUNTRY__C = 'Germany';
    pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem2.DIVISION_CODE__C = '2';
    pricRequestItem2.DIVISION__C = 'GSD Standard';
    pricRequestItem2.Distributor_Code__c = 'Y7';
    pricRequestItem2.Distributor_Name__c = 'Test';
    pricRequestItem2.SOLD_TO_CODE__C=userinfo.getUserId();
    pricRequestItem2.Price_List_Type_Code__c='Price list123';
    pricRequestItem2.Terms_of_Payment_Code__c='payment terms 123';
    pricRequestItem2.country_code__c='country123';
    pricRequestItem2.ComPartner_Code__c='1213';
    pricRequestItem2.Variant_Code__c='Variant Code 876';
    pricRequestItem2.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem2.Shipping_Condition_Code__c='Shiping condition code A3434';
    pricRequestItem2.Destination_Country_Code__c=' Destinaton code A580';
    
    
    pricRequestItem2.EXPIRE__C = false;
    pricRequestItem2.GAP__C = false;
    //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
    pricRequestItem2.KEY_COMBINATION_CODE__C = PAKeyCombinationUpdate__c.getvalues('A692').NewKCCode__c;
    pricRequestItem2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Sales Office/Customer Price Group/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Material Price Group/DiscRef/Partner ZF/Payer/Division/Distributor';
    pricRequestItem2.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem2.NEW_PER__C = 1;
    pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem2.PH1_CODE__C = 'A6';
    pricRequestItem2.PH2_CODE__C = 'S1';
    pricRequestItem2.PH3_CODE__C = '15';
    pricRequestItem2.PH4_CODE__C = 'S1';
    pricRequestItem2.PH6_CODE__C = '14';
    pricRequestItem2.PH7_CODE__C = 'S9';
    pricRequestItem2.PH3_CODE__C = '13';
    pricRequestItem2.PER__C = 1; 
     
    pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem2.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem2.PRODUCT_HIERARCHY_CODE__C = 'A6S113############';
    pricRequestItem2.Rate__c = '10';
    pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem2.SAP_CLIENT_ID__C = '510';
    pricRequestItem2.SALES_ORG_CODE__C = 'A640';
    pricRequestItem2.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem2.SCALED_PRICE_FLAG__C = true;
    pricRequestItem2.SOLD_TO_CODE__C = '55470156';
    pricRequestItem2.UNIT__C = '%';
    pricRequestItem2.UOM__C = 'EA';
    pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 10,10);
    pricRequestItem2.VALID_TO__C = Date.newInstance(2014, 10,10);
    pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2013, 10,1);
    pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2014, 11,1);
    pricRequestItem2.EDIT__C = false;
    pricRequestItem2.NEW__C = false;
    pricRequestItem2.SCALE_BASIS__C = 'Quantity';
    pricRequestItem2.SCALE_TYPE__C = 'From';
    //pricRequestItem2.SCALE__C = 'Ascending';
    pricRequestItem2.Country__c='INDIA';
    pricRequestItem2.Country_Code__c='IN';
    pricRequestItem2.Customer_Price_Group__c='TEST';
    pricRequestItem2.Customer_Price_Group_Code__c='A';
    pricRequestItem2.Disc_Ref__c='01';
    pricRequestItem2.End_Use__c='TEST';
    pricRequestItem2.End_Use_Code__c='55470156';
    pricRequestItem2.Market_Segment__c='TESTM';
    pricRequestItem2.Market_Segment_Code__c='TEST';
    pricRequestItem2.Material_Price_Group__c='Price Group 1';
    pricRequestItem2.Material_Price_Group_Code__c='2';
    pricRequestItem2.Price_List_Type__c='TEST';
    pricRequestItem2.Price_List_Type_Code__c='P1';
    pricRequestItem2.Price_Ref_Partner__c='TEST';
    pricRequestItem2.Price_Ref_Partner_Code__c='55470156';
    /*pricRequestItem2.CUSTOMER_HIERARCHY_CODE__c='12345678';
    pricRequestItem2.End_User_Code__c='87654321';*/
    pricRequestItem2.Sales_Office__c='A598';
    pricRequestItem2.Sales_Office_Code__c='TESTSALESOFFICE';
    pricRequestItem2.Terms_Of_Payment__c='TEST';
    pricRequestItem2.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem2.ShipTo__c='TEST';
    pricRequestItem2.ShipTo_Code__c='55470156';
 //   pricRequestItem2.Material_Code__c ='5674';
    pricRequestItem2.Partner_ZF_Code__c ='88811';
    pricRequestItem2.Payer_Code__c = '1135';
    pricingReqItemToUpdate.add(pricRequestItem2);
    //end 
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
    pricRequestItem3=pricRequestItem2.clone(false,true);
    pricRequestItem3.Expire__c=true;
    pricRequestItem3.Sales_Order_Item__c = '10';
    pricRequestItem3.Sales_Order_Item_Code__c = '10';
    pricRequestItem3.Value_Center__c ='Test';
    pricRequestItem3.Value_Center_Code__c ='45';
    pricRequestItem3.Ext_Matl_Grp__c ='Tes';
    pricRequestItem3.Ext_Matl_Grp_Code__c ='456';
    pricRequestItem3.Material_group_2__c ='Test';
    pricRequestItem3.Material_group_2_Code__c='56';
    pricRequestItem3.Price_Zone__c='Test';
    pricRequestItem3.Price_Zone_Code__c='67';
    pricingReqItemToUpdate.add(pricRequestItem3);
    
    
    
    Pricing_Request_Item__c pricRequestItem4 = new Pricing_Request_Item__c();
    
    pricRequestItem4.CURRENCYISOCODE = 'USD';
    pricRequestItem4.Distributor_Code__c = 'Y9';
    pricRequestItem4.Distributor_Name__c = 'Test9';
    pricRequestItem4.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem4.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem4.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem4.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem4.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem4.COUNTRY__C = 'Germany';
    pricRequestItem4.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem4.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem4.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem4.DIVISION_CODE__C = '2';
    pricRequestItem4.DIVISION__C = 'GSD Standard';
    
    pricRequestItem4.GAP__C = false;
    pricRequestItem4.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem4.KEY_COMBINATION__C = 'Market Segment/Price Ref. Partner/Country/End Use/Price List Type/Terms of Payment/Customer Price Group/Material Price Group/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/FRB/Customer Hierarchy/End User/Distributor';
    pricRequestItem4.NEW_PER__C = 1;
    pricRequestItem4.NON_COMMERCIAL_PRODUCTS__C = false;
    
    pricRequestItem4.PER__C = 1;
    pricRequestItem4.ComPartner_Code__c='1213';
    pricRequestItem4.Variant_Code__c='Variant Code 876';
    pricRequestItem4.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem4.Shipping_Condition_Code__c='Shiping condition code A3434';
    pricRequestItem4.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem4.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem4.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem4.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem4.Rate__c = '10';
    pricRequestItem4.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem4.SAP_CLIENT_ID__C = '510';
    pricRequestItem4.SALES_ORG_CODE__C = 'A640';
    pricRequestItem4.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem4.SCALED_PRICE_FLAG__C = true;
    pricRequestItem4.SOLD_TO_CODE__C = '55470156';
    pricRequestItem4.UNIT__C = '%';
    pricRequestItem4.UOM__C = 'EA';
    pricRequestItem4.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem4.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem4.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem4.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem4.EDIT__C = false;
    pricRequestItem4.NEW__C = false;
    pricRequestItem4.SCALE_BASIS__C = 'Quantity';
    pricRequestItem4.SCALE_TYPE__C = 'From';
    //pricRequestItem4.SCALE__C = 'Ascending';
    pricRequestItem4.Country__c='INDIA';
    pricRequestItem4.Country_Code__c='IN';
    pricRequestItem4.Customer_Price_Group__c='TEST';
    pricRequestItem4.Customer_Price_Group_Code__c='2';
    pricRequestItem4.Disc_Ref__c='0000000001';
    pricRequestItem4.End_Use__c='TEST';
    pricRequestItem4.End_Use_Code__c='55470156';
    pricRequestItem4.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem4.Market_Segment_Code__c='TEST';
    pricRequestItem4.Material_Price_Group__c='Price Group 1';
    pricRequestItem4.Material_Price_Group_Code__c='1';
    pricRequestItem4.Price_List_Type__c='TEST';
    pricRequestItem4.Price_List_Type_Code__c='P1';
    pricRequestItem4.Price_Ref_Partner__c='TEST';
    pricRequestItem4.Price_Ref_Partner_Code__c='55470156';
    pricRequestItem4.Terms_Of_Payment__c='TEST';
    pricRequestItem4.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem4.PH4_CODE__C = 'A6';
    pricRequestItem4.PH5_CODE__C = 'S1';
    pricRequestItem4.PH6_CODE__C = '13';
    pricRequestItem4.PH7_CODE__C = '12';
    pricRequestItem4.PH8_CODE__C = '11';
    pricRequestItem4.PH9_CODE__C = 'S4';
    pricingReqItemToUpdate.add(pricRequestItem4);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem5 = new Pricing_Request_Item__c();
    pricRequestItem5=pricRequestItem4.clone(false,true);
    pricRequestItem5.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem5);
    
    //<SS20230501> - START
    Pricing_Request_Item__c pricRequestItem6 = new Pricing_Request_Item__c();    
    pricRequestItem6.CURRENCYISOCODE = 'USD';
    pricRequestItem6.Distributor_Code__c = 'Y9';
    pricRequestItem6.Distributor_Name__c = 'Test9';
    pricRequestItem6.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem6.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem6.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem6.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem6.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem6.COUNTRY__C = 'Germany';
    pricRequestItem6.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem6.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem6.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem6.DIVISION_CODE__C = '2';
    pricRequestItem6.DIVISION__C = 'GSD Standard';
    pricRequestItem6.GAP__C = false;
    pricRequestItem6.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem6.KEY_COMBINATION__C = 'Market Segment/Ship-To Country/Material/Variant/ComPartner/Plant/Shipping Condition/Destination Country/Sales Order Type/Contract No./Disc Ref No/FixValDate/Document Currency/Kcode/Partner ZF/Distributor';
    pricRequestItem6.NEW_PER__C = 1;
    pricRequestItem6.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem6.PER__C = 1;
    pricRequestItem6.ComPartner_Code__c='1213';
    pricRequestItem6.Variant_Code__c='Variant Code 876';
    pricRequestItem6.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem6.Shipping_Condition_Code__c='Shiping condition code A3434';
    pricRequestItem6.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem6.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem6.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem6.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem6.Rate__c = '10';
    pricRequestItem6.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem6.SAP_CLIENT_ID__C = '510';
    pricRequestItem6.SALES_ORG_CODE__C = 'A640';
    pricRequestItem6.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem6.SCALED_PRICE_FLAG__C = true;
    pricRequestItem6.SOLD_TO_CODE__C = '55470156';
    pricRequestItem6.UNIT__C = '%';
    pricRequestItem6.UOM__C = 'EA';
    pricRequestItem6.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem6.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem6.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem6.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem6.EDIT__C = false;
    pricRequestItem6.NEW__C = false;
    pricRequestItem6.SCALE_BASIS__C = 'Quantity';
    pricRequestItem6.SCALE_TYPE__C = 'From';
    //pricRequestItem4.SCALE__C = 'Ascending';
    pricRequestItem6.Country__c='INDIA';
    pricRequestItem6.Country_Code__c='IN';
    pricRequestItem6.Customer_Price_Group__c='TEST';
    pricRequestItem6.Customer_Price_Group_Code__c='2';
    pricRequestItem6.Disc_Ref__c='0000000001';
    pricRequestItem6.End_Use__c='TEST';
    pricRequestItem6.End_Use_Code__c='55470156';
    pricRequestItem6.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem6.Market_Segment_Code__c='TEST';
    pricRequestItem6.Material_Price_Group__c='Price Group 1';
    pricRequestItem6.Material_Price_Group_Code__c='1';
    pricRequestItem6.Price_List_Type__c='TEST';
    pricRequestItem6.Price_List_Type_Code__c='P1';
    pricRequestItem6.Price_Ref_Partner__c='TEST';
    pricRequestItem6.Price_Ref_Partner_Code__c='55470156';
    pricRequestItem6.Terms_Of_Payment__c='TEST';
    pricRequestItem6.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem6.PH4_CODE__C = 'A6';
    pricRequestItem6.PH5_CODE__C = 'S1';
    pricRequestItem6.PH6_CODE__C = '13';
    pricRequestItem6.PH7_CODE__C = '12';
    pricRequestItem6.PH8_CODE__C = '11';
    pricRequestItem6.PH9_CODE__C = 'S4';
    pricRequestItem6.Material_Code__c = '3468';
    pricRequestItem6.Ship_To_Country_code__c = '89';
    pricRequestItem6.Variant_Code__c = '4321';
    pricRequestItem6.Plant_Code__c = '5212';
    pricRequestItem6.Shipping_Condition_Code__c ='1123';
    pricRequestItem6.Destination_Country_Code__c = '5543';
    pricRequestItem6.Sales_Order_Type_Code__c = '5541';
    pricRequestItem6.Contract_Code__c = '3321';
    pricRequestItem6.Disc_Ref_No__c = '7775';
    pricRequestItem6.Document_Currency_Code__c = '2213';
    pricRequestItem6.FixValDate__c = Date.newInstance(2023, 7,4);
    pricRequestItem6.Kcode__c = '2221';
    pricRequestItem6.Partner_ZF_Code__c ='1146';
    pricingReqItemToUpdate.add(pricRequestItem6);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem7 = new Pricing_Request_Item__c();
    pricRequestItem7=pricRequestItem6.clone(false,true);
    pricRequestItem7.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem7);
    
    Pricing_Request_Item__c pricRequestItem8 = new Pricing_Request_Item__c();
    
    pricRequestItem8.CURRENCYISOCODE = 'USD';
    pricRequestItem8.Distributor_Code__c = 'Y9';
    pricRequestItem8.Distributor_Name__c = 'Test9';
    pricRequestItem8.PRICING_REQUEST__C = pricingRequest.Id;
    pricRequestItem8.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem8.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem8.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem8.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem8.COUNTRY__C = 'Germany';
    pricRequestItem8.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem8.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem8.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem8.DIVISION_CODE__C = '2';
    pricRequestItem8.DIVISION__C = 'GSD Standard';
    
    pricRequestItem8.GAP__C = false;
    pricRequestItem8.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem8.KEY_COMBINATION__C = 'Market Segment/Sales District/State/Material Group 1/Material Group 5 Key/Campaign/Price List Type/Payment terms/Country/End Use/Value Center';
    pricRequestItem8.NEW_PER__C = 1;
    pricRequestItem8.NON_COMMERCIAL_PRODUCTS__C = false;
    
    pricRequestItem8.PER__C = 1;
    pricRequestItem8.ComPartner_Code__c='1213';
    pricRequestItem8.Variant_Code__c='Variant Code 876';
    pricRequestItem8.ComPartner_Code__c=' Compartner code 466';
    pricRequestItem8.Shipping_Condition_Code__c='Shiping condition code A3434';
    pricRequestItem8.Destination_Country_Code__c=' Destinaton code A580';
    pricRequestItem8.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem8.PRICING_CONDITION__C = 'Surface Gross Price';
    pricRequestItem8.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem8.Rate__c = '10';
    pricRequestItem8.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem8.SAP_CLIENT_ID__C = '510';
    pricRequestItem8.SALES_ORG_CODE__C = 'A640';
    pricRequestItem8.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem8.SCALED_PRICE_FLAG__C = true;
    pricRequestItem8.SOLD_TO_CODE__C = '55470156';
    pricRequestItem8.UNIT__C = '%';
    pricRequestItem8.UOM__C = 'EA';
    pricRequestItem8.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem8.VALID_TO__C = Date.newInstance(2013, 15,1);
    pricRequestItem8.NEW_VALID_FROM__C = Date.newInstance(2013, 3,1);
    pricRequestItem8.NEW_VALID_TO__C = Date.newInstance(2013, 3,15);
    pricRequestItem8.EDIT__C = false;
    pricRequestItem8.NEW__C = false;
    pricRequestItem8.SCALE_BASIS__C = 'Quantity';
    pricRequestItem8.SCALE_TYPE__C = 'From';
    //pricRequestItem4.SCALE__C = 'Ascending';
    pricRequestItem8.Country__c='INDIA';
    pricRequestItem8.Country_Code__c='IN';
    pricRequestItem8.Customer_Price_Group__c='TEST';
    pricRequestItem8.Customer_Price_Group_Code__c='2';
    pricRequestItem8.Disc_Ref__c='0000000001';
    pricRequestItem8.End_Use__c='TEST';
    pricRequestItem8.End_Use_Code__c='55470156';
    pricRequestItem8.Market_Segment__c='TESTMARKETSEGMENT';
    pricRequestItem8.Market_Segment_Code__c='TEST';
    pricRequestItem8.Material_Price_Group__c='Price Group 1';
    pricRequestItem8.Material_Price_Group_Code__c='1';
    pricRequestItem8.Price_List_Type__c='TEST';
    pricRequestItem8.Price_List_Type_Code__c='P1';
    pricRequestItem8.Price_Ref_Partner__c='TEST';
    pricRequestItem8.Price_Ref_Partner_Code__c='55470156';
    pricRequestItem8.Terms_Of_Payment__c='TEST';
    pricRequestItem8.Terms_Of_Payment_Code__c='TEST';
    pricRequestItem8.PH4_CODE__C = 'A6';
    pricRequestItem8.PH5_CODE__C = 'S1';
    pricRequestItem8.PH6_CODE__C = '13';
    pricRequestItem8.PH7_CODE__C = '12';
    pricRequestItem8.PH8_CODE__C = '11';
    pricRequestItem8.PH9_CODE__C = 'S4';
    pricRequestItem8.Price_List_Type_Code__c = '8434';
    pricRequestItem8.Terms_of_Payment_Code__c ='8960';
    pricRequestItem8.country_code__c = '33';
    pricRequestItem8.End_Use_Code__c = '9906';
      pricRequestItem8.Sales_District_Code__c='4432';
      pricRequestItem8.State_Code__c='9087';
      pricRequestItem8.Material_Group_1_Code__c='1123';
      pricRequestItem8.Material_Group_5_Key_Code__c='3534';
      pricRequestItem8.Campaign_Code__c='1213';
      pricRequestItem8.Value_Center_Code__c='3312';
      pricingReqItemToUpdate.add(pricRequestItem8);
    //end
    
    //To cover KC SAP for expire scenario
    Pricing_Request_Item__c pricRequestItem9 = new Pricing_Request_Item__c();
    pricRequestItem9=pricRequestItem8.clone(false,true);
    pricRequestItem9.Expire__c=true;
    pricingReqItemToUpdate.add(pricRequestItem9);
    //<SS20230501> - END
    
    Pricing_Request_Item__c priProject=new Pricing_Request_Item__c();
    priProject.PRICING_REQUEST__C = pricingRequest.Id;
    priProject.CURRENCYISOCODE = 'USD';
    priProject.COUNTRY__C = 'Germany';
    priProject.CUSTOMER_SPECIFIC__C = true;
    priProject.Dist_Channel_Code__c = '10';
    priProject.DIST_CHANNEL__C = 'DuPont Std';
    priProject.DIVISION_CODE__C = '2';
    priProject.DIVISION__C = 'GSD Standard';
    priProject.Distributor_Code__c = 'Y7';
    priProject.Distributor_Name__c = 'Test';
    //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
    priProject.KEY_COMBINATION_CODE__C = PAKeyCombinationUpdate__c.getvalues('A692').NewKCCode__c;
    priProject.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/Sold to/Material/DiscRef/Distributor';
    priProject.MATERIAL_CODE__C = 'D11992510';
    priProject.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject.PER__C = 1; 
    priProject.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject.Pricing_Request_Type__c = 'Project';
    
    priProject.Rate__c = '10';
    priProject.SAP_APPLICATION_ID__C = 'V';
    priProject.SAP_CLIENT_ID__C = '510';
    priProject.SALES_ORG_CODE__C = 'A640';
    priProject.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject.SCALED_PRICE_FLAG__C = true;
    priProject.SOLD_TO_CODE__C = '55470156';
    priProject.UNIT__C = '%';
    priProject.UOM__C = 'EA';
    priProject.Valid_From__c = Date.newInstance(2013, 10,10);
    priProject.Valid_To__c = Date.newInstance(2014, 10,10);
    priProject.New_VALID_FROM__C = Date.newInstance(2013, 10,10);
    priProject.New_VALID_TO__C = Date.newInstance(2014, 1,1);
    priProject.SCALE_BASIS__C = 'Quantity';
    priProject.SCALE_TYPE__C = 'From';
    priProject.Disc_Ref__c='0000000001';
   
    pricingReqItemToUpdate.add(priProject);
    
    upsert pricingReqItemToUpdate;
    
    pricingRequest.BU__C = Business.Business__c;
    pricingRequest.BU__C = 'BI EMEA';
    pricingRequest.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
    pricingRequest.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
    pricingRequest.Division_Code__c = salesArea.ERP_Division_code__c;
    pricingRequest.Request_Approval_Status__c='Approved';
    
   update pricingRequest;
    Test.startTest();//Start-Added to avoid too many SOQL queries error - PG-20160919
    Pricing_Request__c pri1=new Pricing_Request__c(Sales_Org_Code__c='a200',BU__c='AP');
    insert pri1;
    
    List<Pricing_Request__c> pricingRequestList1=[select Id,Pricing_Request_Type__c,Request_Approval_Status__c FROM Pricing_Request__c where id=:pri1.Id];
    
    
    Pricing_Request__c pricingRequest1=new Pricing_Request__c(Sales_Org_Code__c='a200',BU__c='AP');
    if(pricingRequestList1!=null && pricingRequestList1.size()!=0){
      pricingRequest1=pricingRequestList1.get(0);
      
      pricingRequest1.Pricing_Request_Type__c='Floor';
    }
   
    List<Sales_Prices__c> erpListToInsert1=new List<Sales_Prices__c>();
      //Holder1
    
      Sales_Prices__c erp5=new Sales_Prices__c();
      erp5.Sales_Pricing_Procedure__c=orgItemList[0].ERP_Pricing_Procedure__c;
      erp5.CURRENCYISOCODE = 'USD';
    erp5.COUNTRY__C = 'Germany';
    erp5.CUSTOMER_SPECIFIC__C = false;
    erp5.DIST_CHANNEL__C = 'DuPont Std';
    erp5.DIVISION_CODE__C = '2';
    erp5.DIVISION__C = 'GSD Standard';
    erp5.KEY_COMBINATION_CODE__C = 'X100';
    erp5.KEY_COMBINATION__C = 'Sales Area/Material';
    erp5.MATERIAL_CODE__C = 'D11992510';
    erp5.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    erp5.PER__C = 1;
    erp5.PRICING_CONDITION_CODE__C = 'ZPSE';
    erp5.PRICING_CONDITION__C = 'Surface Gross Price';
    erp5.Sales_Price_Type__c = 'Floor';
    erp5.Rate__c = '10';
    erp5.SAP_APPLICATION_ID__C = 'V';
    erp5.SAP_CLIENT_ID__C = '510';
    erp5.SALES_ORG_CODE__C = 'A640';
    erp5.SALES_ORG__C = 'Surf Dup Disa 3640';
    erp5.SCALED_PRICE_FLAG__C = true;
    erp5.UNIT__C = '%';
    erp5.UOM__C = 'EA';
    erp5.VALID_FROM__C = Date.newInstance(2013, 1,1);
    erp5.VALID_TO__C = Date.newInstance(2013, 1,15);
    erp5.SCALE_BASIS__C = 'Quantity';
    erp5.SCALE_TYPE__C = 'From';
    erp5.Check_SCALE__C = 'Ascending';
    erp5.isPriceHolder__c=true;
    erp5.BU__c='BI EMEA';
    //pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c
    erpListToInsert1.add(erp5);
    insert erpListToInsert1;
    Sales_Prices__c erp6=new Sales_Prices__c();
    erp6=erp5.clone(false,true);
    erp6.isPriceHolder__c=false;
    erp6.Price_Holder__c=erp5.Id;
    
    insert erp6;
    
     Pricing_Request_Item__c priProject1=new Pricing_Request_Item__c();
      priProject1.PRICING_REQUEST__C = pricingRequest1.Id;
    priProject1.CURRENCYISOCODE = 'USD';
    priProject1.COUNTRY__C = 'Germany';
    priProject1.CUSTOMER_SPECIFIC__C = false;
    priProject1.Dist_Channel_Code__c = '10';
    priProject1.DIST_CHANNEL__C = 'DuPont Std';
    priProject1.DIVISION_CODE__C = '2';
    priProject1.DIVISION__C = 'GSD Standard';
    priProject1.KEY_COMBINATION_CODE__C = 'X100';
    priProject1.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/PH/Material';
    priProject1.MATERIAL_CODE__C = 'D11992510';
    priProject1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject1.PER__C = 1; 
    priProject1.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject1.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject1.Pricing_Request_Type__c = 'Floor';
    
    priProject1.Rate__c = '10';
    priProject1.SAP_APPLICATION_ID__C = 'V';
    priProject1.SAP_CLIENT_ID__C = '510';
    priProject1.SALES_ORG_CODE__C = 'A640';
    priProject1.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject1.SCALED_PRICE_FLAG__C = true;
    priProject1.UNIT__C = '%';
    priProject1.UOM__C = 'EA';
    priProject1.Valid_From__c = Date.newInstance(2013, 2,1);
    priProject1.Valid_To__c = Date.newInstance(2014, 1,2);
    priProject1.New_VALID_FROM__C = Date.newInstance(2013, 1,1);
    priProject1.New_VALID_TO__C = Date.newInstance(2014, 1,14);
    priProject1.SCALE_BASIS__C = 'Quantity';
    priProject1.SCALE_TYPE__C = 'From';
    
      Pricing_Request_Item__c priProject2=new Pricing_Request_Item__c();
      priProject2.PRICING_REQUEST__C = pricingRequest1.Id;
    priProject2.CURRENCYISOCODE = 'USD';
    priProject2.COUNTRY__C = 'Germany';
    priProject2.CUSTOMER_SPECIFIC__C = false;
    priProject.Dist_Channel_Code__c = '10';
    priProject2.DIST_CHANNEL__C = 'DuPont Std';
    priProject2.DIVISION_CODE__C = '2';
    priProject2.DIVISION__C = 'GSD Standard';
    priProject2.KEY_COMBINATION_CODE__C = 'X100';
    priProject2.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Material';
    priProject2.MATERIAL_CODE__C = 'D11992510';
    priProject2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject2.PER__C = 1; 
    priProject2.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject2.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject2.Pricing_Request_Type__c = 'Floor';
    priProject2.PH4_CODE__C = 'A6';
    priProject2.PH5_CODE__C = 'S1';
    priProject2.PH6_CODE__C = '13';
    priProject2.PH7_CODE__C = '12';
    priProject2.PH8_CODE__C = '11';
    priProject2.PH9_CODE__C = 'S4';
    priProject2.Rate__c = '10';
    priProject2.SAP_APPLICATION_ID__C = 'V';
    priProject2.SAP_CLIENT_ID__C = '510';
    priProject2.SALES_ORG_CODE__C = 'A640';
    priProject2.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject2.SCALED_PRICE_FLAG__C = true;
    priProject2.UNIT__C = '%';
    priProject2.UOM__C = 'EA';
    priProject2.Valid_From__c = Date.newInstance(2013, 2,1);
    priProject2.Valid_To__c = Date.newInstance(2014, 1,2);
    priProject2.New_VALID_FROM__C = Date.newInstance(2013, 1,1);
    priProject2.New_VALID_TO__C = Date.newInstance(2014, 1,14);
    priProject2.SCALE_BASIS__C = 'Quantity';
    priProject2.SCALE_TYPE__C = 'From';
    
   
       
    insert priProject2;
    
     Pricing_Request_Item__c priProject3=new Pricing_Request_Item__c();
      priProject3.PRICING_REQUEST__C = pricingRequest1.Id;
    priProject3.CURRENCYISOCODE = 'USD';
         priProject3.Disc_Ref__c='Disc Ref1123';
                         

    priProject3.COUNTRY__C = 'Germany';
    priProject3.CUSTOMER_SPECIFIC__C = false;
    priProject3.Dist_Channel_Code__c = '10';
    priProject3.DIST_CHANNEL__C = 'DuPont Std';
    priProject3.DIVISION_CODE__C = '2';
    priProject3.DIVISION__C = 'GSD Standard';
    priProject3.KEY_COMBINATION_CODE__C = 'X100';
    priProject3.KEY_COMBINATION__C = 'Sales Org./Division/Dist. Channel/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9/Material';
    priProject3.MATERIAL_CODE__C = 'D11992510';
    priProject3.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    priProject3.PER__C = 1; 
    priProject3.PRICING_CONDITION_CODE__C = 'ZPSE';
    priProject3.PRICING_CONDITION__C = 'Order volume disc shapes';
    priProject3.Pricing_Request_Type__c = 'Floor';
    priProject3.PH4_CODE__C = 'A6';
    priProject3.PH5_CODE__C = 'S1';
    priProject3.PH6_CODE__C = '13';
    priProject3.PH7_CODE__C = '12';
    priProject3.PH8_CODE__C = '11';
    priProject3.PH9_CODE__C = 'S4';
    priProject3.Rate__c = '10';
    priProject3.SAP_APPLICATION_ID__C = 'V';
    priProject3.SAP_CLIENT_ID__C = '510';
    priProject3.SALES_ORG_CODE__C = 'A640';
    priProject3.SALES_ORG__C = 'Surf Dup Disa 3640';
    priProject3.SCALED_PRICE_FLAG__C = true;
    priProject3.UNIT__C = '%';
    priProject3.UOM__C = 'EA';
    priProject3.Valid_From__c = Date.newInstance(2013, 2,1);
    priProject3.Valid_To__c = Date.newInstance(2014, 1,2);
    priProject3.New_VALID_FROM__C = Date.newInstance(2013, 1,1);
    priProject3.New_VALID_TO__C = Date.newInstance(2014, 1,14);
    priProject3.SCALE_BASIS__C = 'Quantity';
    priProject3.SCALE_TYPE__C = 'From';
    priProject3.Expire__c= true;
   
       
    upsert priProject3;
    
    pricingRequest1.BU__C = Business.Business__c;
    pricingRequest1.BU__C = 'BI EMEA';
    pricingRequest1.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
    pricingRequest1.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
    pricingRequest1.Division_Code__c = salesArea.ERP_Division_code__c;
    pricingRequest1.Request_Approval_Status__c='Approved';    
    //update pricingRequest1;
    
    //<AJ20160115> START Added the code to cover "trigPricingRequest" trigger
    
    pricingRequest1.Request_Approval_Status__c='Submitted';    
    update pricingRequest1;
    
    pricingRequest1.Request_Approval_Status__c='Validated';    
    update pricingRequest1;
    
    pricingRequest1.Request_Approval_Status__c='Submitted';    
    update pricingRequest1;
    
    pricingRequest1.Request_Approval_Status__c='Validated';    
    update pricingRequest1;
       Test.stopTest();//End-Added to avoid too many SOQL queries error - PG-20160919
    // <AJ20160115> END
    // Added to increase coverage by pavan 
    
    ERP_Customer__c erpcustomer=new ERP_Customer__c();
    erpcustomer.name='DURBAN';
    erpcustomer.CurrencyIsoCode='USD';
    erpcustomer.Sales_Org__c='Sales_Org_Code__c ';
    erpcustomer.Distribution_Channel_Code__c='1235';
    erpcustomer.customer_code__c='1313';
    
    insert erpcustomer;
    
    ERP_Relationship__c errel=new ERP_Relationship__c();
    errel.Partner_Function_Code__c='ZU';
    errel.Partner_Function__c='ZU';
    errel.User__c=userinfo.getuserid();
    errel.ERP_Customer__c=erpcustomer.id;
    insert errel;
         
         
    map<string,id> custSRMap=new map<string,id>();
    map<id,pricing_request__C> prmap=new map<id,pricing_request__C>();
    
    custSRMap.put(erpcustomer.Customer_Code__c,errel.User__c); 
    prmap.put(pri.id,pri);
         
    Trig_validatePriceAUNewUtil.createHolderFromItem(pricRequestItem3,erp6.id,custSRMap,prmap);     
    Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pricRequestItem3,erp6.id,custSRMap,prmap);
    Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pricRequestItem4,erp6.id,custSRMap,prmap);
    Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pricRequestItem1,erp6.id,custSRMap,prmap);
  Sales_Prices__c wsp=Trig_validatePriceAUNewUtil.createNonSAPHolderFromItem(pricRequestItem3,userinfo.getuserid());
         
   Sales_Prices__c sp1= Trig_validatePriceAUNewUtil.createNonSAPPriceFromItem(pricRequestItem3,userinfo.getuserid());
   Sales_Prices__c sp2 = Trig_validatePriceAUNewUtil.createNonSAPPriceFromItem(pricRequestItem7,userinfo.getuserid()); //<SS20230501>
   Sales_Prices__c sp3 = Trig_validatePriceAUNewUtil.createNonSAPPriceFromItem(pricRequestItem9,userinfo.getuserid()); //<SS20230501>
  }
  
}