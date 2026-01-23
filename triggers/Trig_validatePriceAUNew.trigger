//commented scale_base__c -> balakrishnan
/***********************************************Modification Log************************************************
  <VR20130509>
 Last Modified By   :   Vinoth Rajapandian
 Last Modified Date :   09 May 2013
 Description        :   Adding logic for extra key field Customer Hierarchy - APAC ROLLOUT1(1.1)                        

 *****************************************************************************************************************
 <BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Sales Type and Incoterms. - APAC ROLLOUT2(1.3) 
 ****************************************************************************************************************
<PP20131022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2013
Description         :   Terms of Payment Key field - ROLLOUT2(4.0)
 *****************************************************************************************************************
<PP20131028>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   28 October 2013
 Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
 *****************************************************************************************************************
<PP20131213>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   12 December 2013
 Description         :   'Payment terms' in KC changed to 'Terms of Payment' - ROLLOUT2
 *****************************************************************************************************************
 <PP20140522>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   22 May 2014
 Description         :   Adding Payment Terms and Volume on Approval - CAPITAL PROJECT
  *****************************************************************************************************************
 <HL20140902>
 Last Modified By    :   Hema Latha
 Last Modified Date  :   02 Sep 2014
 Description         :   Adding Pricing Request for SAP and NON SAP sales price record 
 ***********************************************************************************************************************
 <PR20140908>
 Last Modified By    :   Priyanka R
 Last Modified Date  :   08 Sep 2014
 Description         :   Trimming the last 2 characters from key combination code 
 ***********************************************************************************************************************
 <KS20160915> 
Last Modified By    :   Kunal Sharma
Last Modified Date  :   15 Sep 2016
Description         :   Added field name in the query to fetch Char Name in KC_SAP (IS ID-00073333)
**********************************************************************************************************************
 <AS20191226> 
Last Modified By    :   Arrola Sireesha
Last Modified Date  :   23 Dec 2019
Description         :   Changed the logic to map the correct owner for the prices by using map between Price Request Item(PRI) and PR with issue <IS TI-00088418> 

**********************************************************************************************************************
 <SS20220826> 
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   26 Aug 2022
Description         :   Added logic to include Sales Order Item fields for check.

**********************************************************************************************************************
 <SS20230501> 
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   01 May 2023
Description         :   Added logic to include P80 M&M fields for check and version to 57.
 ***********************************************************************************************************************/
trigger Trig_validatePriceAUNew on Pricing_Request__c (after update) {
      //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
  /**Integer flag;
    Boolean hold1=false;
    Boolean hold2=false;**/
  Set<Id>  pricingReqIdSet =new Set<Id>(); 
  Set<Id>  RPQpricingReqIdSet =new Set<Id>();
  Set<Id>  pricingReqIdSetNonSAP =new Set<Id>();
  //<TJ20150128>
  map<String,Id> custSRMap = new map<String,Id>();
  Set<Id> importReqs = new Set<ID>();
  Boolean checkApproved=false;
  String BU_Name;
  String SalesOrg_Name;
  Id RequestOwnerId;
  /* 
        Iterating through the request and checking if the request is Approved and the request to a Set<Id>
   */
  for(Pricing_Request__c pr : Trigger.New)
  {    
    BU_Name=pr.BU__c;
    SalesOrg_Name=pr.Sales_Org__c;         
    //George - Added excluding condition for mass import
    if(pr.Request_Approval_Status__c=='Approved' && Trigger.oldMap.get(pr.Id).Request_Approval_Status__c!='Approved' && pr.Pricing_Request_Type__c!='Pricing Task' && pr.Request_Type__c!='Mass Import')
    {

      //<VR20130722> Ver 1.2 VR 2013-07-22 APAC Rollout2-Added logic to add Request id other than Floor and Reference
      if(!(pr.Pricing_Request_Type__c=='Floor' || pr.Pricing_Request_Type__c=='Reference' || pr.Pricing_Request_Type__c=='Net Floor' || pr.Pricing_Request_Type__c=='Net Reference')) {
        if(pr.Is_End_User_Rebate__c)
        RPQpricingReqIdSet.add(pr.id);
        else
        pricingReqIdSet.add(pr.Id);
        checkApproved=true;
      }
      else {
        pricingReqIdSetNonSAP.add(pr.Id);
      }
      //<TJ20150128> 
      if(pr.Request_Type__c=='Import' && pr.Customer_Specific__c)
      {
        importReqs.add(pr.Id);
      }
    }
  }
  //<TJ20150128>
  if(importReqs.size()>0)
  {
    List<Pricing_Request_Item__c> soldToList=[Select Sold_To_Code__c from Pricing_Request_Item__c where pricing_Request__c in :importReqs];
    set<String> soldToSet=new set<String>();
    for(Pricing_Request_Item__c pr:soldToList)
    {
      if(pr.Sold_To_Code__c!=null)
        soldToSet.add(pr.Sold_To_Code__c);
      System.debug('pr.Sold_To_Code__c:'+pr.Sold_To_Code__c);
    }
    if(soldToSet.size()>0)
    {
      List<ERP_Relationship__c> custData=[Select ERP_Customer__r.Customer_Code__c, User__c ,User__r.IsActive  FROM ERP_Relationship__c
                        Where ERP_Customer__r.Customer_Code__c IN :soldToSet 
                        AND Partner_Function_Code__c='ZU' AND Partner_Function__c='Sales Representative' AND User__r.IsActive=True];
      
      for(ERP_Relationship__c rel:custData)
      {
        custSRMap.put(rel.ERP_Customer__r.Customer_Code__c,rel.User__c);        
      }
    }
  }
  if(checkApproved && RPQpricingReqIdSet.size()>0)  
  {
    PAQuotePrices p = new PAQuotePrices();
    p.storeQuotePrices(Trigger.new, Trigger.newMap, RPQpricingReqIdSet);
  
  }
  //<VR20130722> Ver 1.2 VR 2013-07-22 APAC Rollout2-Modified the if Condition
  if(checkApproved && pricingReqIdSet.size()>0)  
  { 

//system.debug('***dec1***'+pricingReqIdSet);
    //To hold the instance of the price holder
    ERP_Sales_Prices_SAP__c holder = new ERP_Sales_Prices_SAP__c();
    //To hold the instance of newly created holder
    ERP_Sales_Prices_SAP__c newholder =new ERP_Sales_Prices_SAP__c();
    //To hold the instance of Holder to be extended in case of overlapping holders
    ERP_Sales_Prices_SAP__c holder1=new ERP_Sales_Prices_SAP__c();
    //To hold the instance of Holder to be deleted in case of overlapping holders
    ERP_Sales_Prices_SAP__c holder2=new ERP_Sales_Prices_SAP__c();
    //To hold the instance of the new pricing Record
    ERP_Sales_Prices_SAP__c newRec=new ERP_Sales_Prices_SAP__c();
    //List to hold the appropriate Holders
    List<ERP_Sales_Prices_SAP__c> appHolderList=new List<ERP_Sales_Prices_SAP__c>();
    //List to hold the child records of the holder to be deleted
    List<ERP_Sales_Prices_SAP__c> updatechildRecOfDelHolderList= new List<ERP_Sales_Prices_SAP__c>();
    //List to hold the pricing records to be upserted
    List<ERP_Sales_Prices_SAP__c> upsertList =new  List<ERP_Sales_Prices_SAP__c>();
    //List to hold the holder to be deleted
    List<ERP_Sales_Prices_SAP__c> delList =new  List<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> validFromList =new List<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> validToList =new List<ERP_Sales_Prices_SAP__c>();
    List<Pricing_Request_Item__c> updateApprovedPRIList =new List<Pricing_Request_Item__c>();
    List<ERP_Sales_Prices_SAP__c> childRecordsOfDelHolder=new List<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> holdList=new List<ERP_Sales_Prices_SAP__c>();   
    Set<Id> delSet=new Set<Id>();
    Set<Id> approvedPRISet =new Set<Id>();
    //Set<Id>  pricingReqIdSet =new Set<Id>(); 
    Set<String> concateKCSet =new Set<String>(); 
    Set<String> pcSet =new Set<String>();
    Set<String> kcSet =new Set<String>();
    //define a parent price holder Set.
    Map<String,List<ERP_Sales_Prices_SAP__c>> linkedPCKCHoldersMap =new Map<String,List<ERP_Sales_Prices_SAP__c>>();
    Map<String,List<ERP_Sales_Prices_SAP__c>> HolderChildMap =new Map<String,List<ERP_Sales_Prices_SAP__c>>();
    Map<String,List<ERP_Sales_Prices_SAP__c>> delHolderChildMap =new Map<String,List<ERP_Sales_Prices_SAP__c>>();
    Map<ERP_Sales_Prices_SAP__c,ERP_Sales_Prices_SAP__c> delRecOverLapHolderMap= new Map<ERP_Sales_Prices_SAP__c,ERP_Sales_Prices_SAP__c>();
    Map<Pricing_Request_Item__c,ERP_Sales_Prices_SAP__c> mapOfpriAndHolder =new  Map<Pricing_Request_Item__c,ERP_Sales_Prices_SAP__c> ();

    Integer flag;
    Boolean deleteLogic=false;
    //prifromPageList //dont modify the query fields
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    //<PP20131028>
    //<HL20140902> Added Pricing Request filed in the query
    //<MS20140515> Added Variant and SalesOrderType fields in the query
    //---Start--Changes done by Kunal Sharma(752081) for CI Mass Import:Added Char_Name__c in the query IS ID-00073333
    //<AS20191226> start
    map<id,list<Pricing_Request_Item__c>> primap=new map<id,list<Pricing_Request_Item__c>>();
      map<id,pricing_Request__c> prmap=new map<id,pricing_Request__c>();
    //<SS20220826> Adding Sales Order Item fileds in query
    List<Pricing_Request__c> prApprovedList= [select id,Request_Type__c, On_Behalf_Of__c, Customer_Specific__c,OwnerId,(SELECT New_Customer_Price_Payment_Terms__c,Char_Name__c,New_Payment_Terms_Fixed_Date__c,New_Volume__c,
                                New_Volume_UoM__c,Ship_To_Country__c,Ship_To_Country_Code__c,country_code__c, Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Document_Currency__c,Document_Currency_Code__c,
                                ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,
                                Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Valid_To__c,BU__c, Valid_From__c, UoM__c, Unit__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c, 
                                Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c,
                                Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, 
                                Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c,
                                ShipTo_Code__c, Scaled_Price_Flag__c, Scale_UoM_Scale_Unit__c, Scale_Type__c, Scale_Type_Code__c, 
                                Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, 
                                Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, 
                                Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c,*/ ScaleRate9__c,
                                ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, 
                                ScaleRate10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                                Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c, Profit_Center__c,
                                Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Task_UoM__c, Pricing_Request__c,
                                Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c,
                                Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c,
                                PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, 
                                PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,
                                New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate,
                                LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, 
                                Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c,
                                Edit__c, ERP_Sales_Prices_SAP__c, ERP_Pricing_Procedure__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, 
                                Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CurrencyIsoCode,CreatedDate,
                                CreatedById, Country__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c,
                                Below_Reference_Price__c, Below_Reference_Flag__c, Below_Floor_Price__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, 
                                Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, 
                                Approver1_Date__c, Approved_Date__c, Approval_Status__c ,Pricing_Request__r.OwnerId,Price_Ref_Partner__c,Price_Ref_Partner_Code__c,                                                       
                                ERP_Pricing_Procedure__r.SAP_Cluster__c,Distributor_Code__c,Distributor_Name__c FROM Pricing_requests__r) from pricing_Request__c where ID IN :pricingReqIdSet ];
                                
                                
                                for(pricing_Request__c pr:prApprovedList){
                                primap.put(pr.id,pr.pricing_Requests__r);
                                    prmap.put(pr.id,pr);
                                //prlist.add(pr);
                                
                                }
    //---End--Changes done by Kunal Sharma(752081) for CI Mass Import:Added Char_Name__c in the query IS ID-00073333
      /* Iterate through the Request Items and populate PCSet,KCSet,PCKC__c set.*/         
    Pricing_Request__c pr = new Pricing_Request__c();
    //pr=[Select Request_Type__c, On_Behalf_Of__c, Customer_Specific__c,OwnerId From Pricing_Request__c Where id=:priApprovedList[0].Pricing_Request__c];
    Set<String> externalConcateSet= new Set<String>();
    //System.debug('***dec2**'+priApprovedList.size());  
    //System.debug('***dec2**'+priApprovedList);
      for(id prid:pricingReqIdSet){      
    for(Pricing_Request_Item__c pri : primap.get(prid))
    {
      concateKCSet.add(pri.PCKC__c);
      pcSet.add(pri.Pricing_Condition_Code__c);
      //George :- added condition to fetch only 4 character code from KC
      kcSet.add(pri.Key_Combination_Code__c.substring(0,4));
      String externalConcate = pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c.substring(0,4)+'-'+pri.PCKC__c;
      externalConcateSet.add(externalConcate);
    }
      }
      //<AS20191226>End
    //System.debug('**********************concateKCSet'+concateKCSet);
    //System.debug('**********************pcSet'+pcSet);
    System.debug('**********************kcSet'+kcSet);
    System.debug('**********************kcSet'+externalConcateSet);
    List<ERP_Sales_Prices_SAP__c> holderList = new List<ERP_Sales_Prices_SAP__c>();
    /*  Iterate through the holder list and obtain the corresponding list of holders for each PCKC concate.
            i.e populate 'linkedPCKCHoldersMap' with PCKC__c as key and the holder as value. */        
    Set<String> buSet= new Set<String>();
    Set<String> salesorgSet= new Set<String>();
    Set<String> divSet= new Set<String>();
    Set<String> distSet= new Set<String>();            
    for(Pricing_Request__c preq : Trigger.New)
    {
      buSet.add(preq.BU__c);
      salesorgSet.add(preq.Sales_Org_Code__c);
      divSet.add(preq.Division_Code__c);
      distSet.add(preq.Dist_Channel_Code__c);
    }
    list<Organizational_Group_Item__c> orgItemPP = [SELECT ERP_Pricing_Procedure__c FROM Organizational_Group_Item__c WHERE 
                                Business__r.Business__c IN :buSet AND OrgGroup__r.ERP_Sales_Org_Code__c IN :salesorgSet 
                                AND OrgGroup__r.ERP_Distribution_Channel_Code__c  IN :distSet AND 
                                OrgGroup__r.ERP_Division_Code__c IN :divSet];         
    string ppOrgItem =  orgItemPP[0].ERP_Pricing_Procedure__c;         
    System.debug('*******************'+ppOrgItem);
    System.debug('ConcateKCSET Size:'+concateKCSet.size()+ ':**********************concateKCSet'+concateKCSet);
    System.debug('**********************pcSet'+pcSet);
    System.debug('**********************kcSet'+kcSet);
    if(ppOrgItem!=Null && concateKCSet.size()!=0 && pcSet.size()!=0 && kcSet.size()!=0)
    {
      //<PP20131022> - Added Terms_of_Payment__c to the query
      //<MS20140515> Added Variant and SalesOrderType fields in the query
      //<HL20140902> Added Pricing Request filed in the query
      //<SS20220826> Adding Sales Order Item fileds in query
      List<ERP_Sales_Prices_SAP__c> holdlist1=[Select Terms_of_Payment__c,Pricing_Request__c,markForDeletion__c,KC_SAP__c, Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,
                          ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                          Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                                 Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c,
                                 Scaled_Price_Flag__c,  Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, 
                                 Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c,
                                 Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c,
                                 Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c,*/ ScaleRate9__c,
                                 ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, 
                                 Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                                 Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Record_Id__c, Rate__c, 
                                 Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                                 Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, 
                                 PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c,
                                 PH1__c, PH1_Code__c, PCKC__c, Owning_Business__c, OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                                 LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_User__c, End_User_Code__c, End_Use__c,
                                 End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c, Dist_Channel__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                                 CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
                                 Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c ,Price_Ref_Partner__c,Price_Ref_Partner_Code__c
                                 From ERP_Sales_Prices_SAP__c WHERE External_ERP_ID__c IN:externalConcateSet AND PCKC__c IN :concateKCSet AND Sales_Pricing_Procedure__c=:ppOrgItem AND Pricing_Condition_Code__c=:pcSet AND Key_Combination_Code__c=:kcSet AND isPriceHolder__c=true];
      System.debug('------Vada-----'+holdlist1);
      for(ERP_Sales_Prices_SAP__c h:holdlist1)
      {           
        if(!linkedPCKCHoldersMap.containskey(h.PCKC__c))
        {
          List<ERP_Sales_Prices_SAP__c> l=new List<ERP_Sales_Prices_SAP__c>();
          l.add(h);
          linkedPCKCHoldersMap.put(h.PCKC__c,l);
        }      
        else
        {  
          List<ERP_Sales_Prices_SAP__c> hList = linkedPCKCHoldersMap.get(h.PCKC__c);
          hList.add(h);
          linkedPCKCHoldersMap.put(h.PCKC__c,hList);
        }
        holderList.add(h);
      }
    }
    /*  Query to get the pricing records whose parent is same as holder List. */ 
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    //<PP20131022> - Added Terms_of_Payment__c to the query
    //<PP20131028>
    //<MS20140515> Added Variant and SalesOrderType fields in the query
    //<HL20140902> Added Pricing Request filed in the query
    //<SS20220826> Adding Sales Order Item fileds in query
    List<ERP_Sales_Prices_SAP__c> linkedPricingRecords=[Select Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Pricing_Request__c,markForDeletion__c,KC_SAP__c,Market_Segment_Code__c,Market_Segment__c,Project__c, Variant_Code__c,Variant__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,
                              ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                              Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                                  Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c,
                                  Scaled_Price_Flag__c,  Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, 
                                  Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c,
                                  Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c,
                                  Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c,*/ ScaleRate9__c,
                                  ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, 
                                  Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                                  Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Record_Id__c, Rate__c, 
                                  Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                                  Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, 
                                  PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c,
                                  PH1__c, PH1_Code__c, PCKC__c, Owning_Business__c, OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                                  LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_User__c, End_User_Code__c, End_Use__c,
                                  End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c, Dist_Channel__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                                  CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
                                  Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c,Price_Ref_Partner__c,Price_Ref_Partner_Code__c  From ERP_Sales_Prices_SAP__c WHERE Price_Holder__c=: holderList];
    /* Iterate through pricing Request Items decide on the priceHolder*/ 
    //<AS20191226>start
      for(id prid:pricingReqIdSet){
    for(Pricing_Request_Item__c pri: primap.get(prid)) 
    {    
      holder=new ERP_Sales_Prices_SAP__c();
      newHolder=new ERP_Sales_Prices_SAP__c();
      deleteLogic=false;
      holdList=new List<ERP_Sales_Prices_SAP__c>();    //can be removed         
      /**
                This logic decides the holder based on the PCKC of the Request item.
                    1. Whether a holder exists or not for the PCKC 
                    2. If holder exists, is it the appropriate holder or not
                    3. If exists, decide the holder, else create a new one.
       **/
      if(linkedPCKCHoldersMap.containsKey(pri.PCKC__c))
      {
        holdList=new List<ERP_Sales_Prices_SAP__c>();
        holdList = linkedPCKCHoldersMap.get(pri.PCKC__c).deepClone(true);
        holdList=PAUtil.sortList(holdList,'Valid_To__c','desc');                        
      }
      else
      {
        // no holder present fot the PCKC of the request Item.                        
        newholder= new ERP_Sales_Prices_SAP__c();  
        newholder=Trig_validatePriceAUNewUtil.createHolderFromItem(pri, RequestOwnerId,custSRMap,prmap);
             //<AS20191226>End 
      /*  newholder.Valid_From__c = pri.New_Valid_From__c;
        newholder.Valid_To__c = pri.New_Valid_To__c;  
        newHolder.Approved_Date__c=System.now();
        newHolder.BU__c=pri.BU__c;
        newHolder.Calculation_Type_Code__c =pri.Calculation_Type_Code__c;
        newHolder.Calculation_Type__c=pri.Calculation_Type__c;
        newHolder.Check_Scale__c =pri.Check_Scale__c;
        newHolder.Check_Scale_Code__c=pri.Check_Scale_Code__c;
        newHolder.Condition_Class__c=pri.Condition_Class__c;
        newHolder.Condition_Class_Code__c=pri.Condition_Class_Code__c;
        newHolder.Country__c = pri.Country__c;
        newHolder.Country_code__c = pri.Country_Code__c; 
        newHolder.Customer_Price_Group__c = pri.Customer_Price_Group__c;
        newHolder.Customer_Price_Group_Code__c = pri.Customer_Price_Group_Code__c;
        newHolder.Customer_Specific__c=pri.Customer_Specific__c;
        newHolder.Dist_Channel__c = pri.Dist_Channel__c;
        newHolder.Distribution_Channel_Code__c = pri.Dist_Channel_Code__c;
        newHolder.Division__c = pri.Division__c;
        newHolder.Division_Code__c = pri.Division_Code__c;
        newHolder.End_Use__c =  pri.End_Use__c;
        newHolder.End_Use_Code__c = pri.End_Use_Code__c;
        newHolder.End_User__c = pri.End_User__c;
        newHolder.End_User_Code__c = pri.End_User_Code__c;
        //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
        newHolder.Customer_Hierarchy__c = pri.Customer_Hierarchy__c;
        newHolder.Customer_Hierarchy_Code__c = pri.Customer_Hierarchy_Code__c;
        //<PP20131028> START
        newHolder.Ship_To_Country__c = pri.Ship_To_Country__c;
        newHolder.Ship_To_Country_Code__c = pri.Ship_To_Country_Code__c;
        //<PP20131028> END
        newHolder.Profit_Center__c = pri.Profit_Center__c;
        newHolder.Profit_Center_Code__c = pri.Profit_Center_Code__c;
        newHolder.Incoterms1__c = pri.Inco_terms__c;                   
        newHolder.Incoterms_1_Code__c = pri.Incoterms_Code__c; 
        newHolder.Key_Combination__c=pri.Key_Combination__c;
        //<PR20140908> START
        if(pri.Key_Combination_Code__c != null && pri.Key_Combination_Code__c.length() > 4)
          newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c.substring(0,4);
        else
          newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
        //<PR20140908> END
        newHolder.Material__c = pri.Material__c;
        newHolder.Material_Code__c = pri.Material_Code__c;
        newHolder.Material_Price_Group__c = pri.Material_Price_Group__c;
        newHolder.Material_Price_Group_Code__c = pri.Material_Price_Group_Code__c;
        newHolder.PH1__c = pri.PH1__c;
        newHolder.PH1_Code__c = pri.PH1_Code__c;
        newHolder.PH2__c = pri.PH2__c;
        newHolder.PH2_Code__c = pri.PH2_Code__c;
        newHolder.PH3__c = pri.PH3__c;
        newHolder.PH3_Code__c = pri.PH3_Code__c;
        newHolder.PH4__c = pri.PH4__c;
        newHolder.PH4_Code__c = pri.PH4_Code__c;
        newHolder.PH5__c = pri.PH5__c;
        newHolder.PH5_Code__c = pri.PH5_Code__c;
        newHolder.PH6__c = pri.PH6__c;
        newHolder.PH6_Code__c = pri.PH6_Code__c;
        newHolder.PH7__c = pri.PH7__c;
        newHolder.PH7_Code__c = pri.PH7_Code__c;
        newHolder.PH8__c = pri.PH8__c;
        newHolder.PH8_Code__c = pri.PH8_Code__c;
        newHolder.PH9__c = pri.PH9__c;
        newHolder.PH9_Code__c = pri.PH9_Code__c;
        newHolder.Plus_Minus__c=pri.Plus_Minus__c;
        newHolder.Plus_Minus_Code__c=pri.Plus_Minus_Code__c;
        newHolder.Price_List_Type__c = pri.Price_List_Type__c;
        newHolder.Price_List_Type_Code__c = pri.Price_List_Type_Code__c;
        newHolder.Pricing_Condition__c=pri.Pricing_Condition__c;
        newHolder.Pricing_Condition_Code__c=pri.Pricing_Condition_Code__c;
        newHolder.Product_Hierarchy__c = pri.Product_Hierarchy__c;
        newHolder.Product_Hierarchy_Code__c = pri.Product_Hierarchy_Code__c;
        newHolder.Project_Id__c = pri.Disc_Ref__c;   //need to be validated    
        newHolder.Sales_Office__c = pri.Sales_Office__c;
        newHolder.Sales_Office_Code__c = pri.Sales_Office_Code__c;
        newHolder.Sales_Org__c = pri.Sales_Org__c;
        newHolder.Sales_Org_Code__c = pri.Sales_Org_Code__c;
        newHolder.Sales_Pricing_Procedure__c=pri.ERP_Pricing_Procedure__c;  */
        /* added because there is no Sales Price Type as 'Import'*/
    /*    if(pri.Pricing_Request_Type__c!=null && pri.Pricing_Request_Type__c.equalsIgnoreCase('Import'))
        {
          newHolder.Sales_Price_Type__c='Permanent';
        }
        else
        {
          newHolder.Sales_Price_Type__c=pri.Pricing_Request_Type__c;     
        }      
        newHolder.SAP_Application_Id__c =pri.SAP_Application_Id__c;
        newHolder.SAP_Client_ID__c=pri.SAP_Client_ID__c;
        newHolder.SAP_Cluster__c= pri.SAP_Cluster__c;
        newHolder.Scale_Basis__c=pri.Scale_Basis__c;
        newHolder.Scale_Basis_Code__c=pri.Scale_Basis_Code__c;
        newHolder.Scaled_Price_Flag__c=pri.Scaled_Price_Flag__c;    
        newHolder.ScaleRate1__c=pri.ScaleRate1__c;
        newHolder.ScaleRate2__c=pri.ScaleRate2__c;
        newHolder.ScaleRate3__c=pri.ScaleRate3__c;
        newHolder.ScaleRate4__c=pri.ScaleRate4__c;
        newHolder.ScaleRate5__c=pri.ScaleRate5__c;
        newHolder.ScaleRate6__c=pri.ScaleRate6__c;
        newHolder.ScaleRate7__c=pri.ScaleRate7__c;
        newHolder.ScaleRate8__c=pri.ScaleRate8__c;
        newHolder.ScaleRate9__c=pri.ScaleRate9__c;
        newHolder.ScaleRate10__c=pri.ScaleRate10__c;
        newHolder.Scale_Quantity_Scale_Value1__c=pri.Scale_Quantity_Scale_Value1__c;
        newHolder.Scale_Quantity_Scale_Value2__c=pri.Scale_Quantity_Scale_Value2__c;
        newHolder.Scale_Quantity_Scale_Value3__c=pri.Scale_Quantity_Scale_Value3__c;
        newHolder.Scale_Quantity_Scale_Value4__c=pri.Scale_Quantity_Scale_Value4__c;
        newHolder.Scale_Quantity_Scale_Value5__c=pri.Scale_Quantity_Scale_Value5__c;
        newHolder.Scale_Quantity_Scale_Value6__c=pri.Scale_Quantity_Scale_Value6__c;
        newHolder.Scale_Quantity_Scale_Value7__c=pri.Scale_Quantity_Scale_Value7__c;
        newHolder.Scale_Quantity_Scale_Value8__c=pri.Scale_Quantity_Scale_Value8__c;
        newHolder.Scale_Quantity_Scale_Value9__c=pri.Scale_Quantity_Scale_Value9__c;
        newHolder.Scale_Quantity_Scale_Value10__c=pri.Scale_Quantity_Scale_Value10__c;
        newHolder.Scale_Type__c=pri.Scale_Type__c;
        newHolder.Scale_Type_Code__c=pri.Scale_Type_Code__c;
        newHolder.Scale_UoM_Scale_Unit__c=pri.Scale_UoM_Scale_Unit__c; 
        newHolder.ShipTo__c=pri.ShipTo__c;
        newHolder.ShipTo_Code__c=pri.ShipTo_Code__c;
        newHolder.Sold_To__c=pri.Sold_To__c;   
        newHolder.Sold_To_Code__c=pri.Sold_To_Code__c;
        newHolder.Terms_Of_Payment_Code__c = pri.Terms_of_Payment_Code__c;
        //<PP20131022>
        newHolder.Terms_Of_Payment__c = pri.Terms_of_Payment__c;
        newHolder.Market_Segment_Code__c=pri.Market_Segment_Code__c;
        newHolder.Market_Segment__c=pri.Market_Segment__c;
        //<HL20140902-Start>
        newHolder.Pricing_request__c=pri.Pricing_request__c;
        //<HL20140902-End>
        //<MS20140515> Added Variant and SalesOrderType in newHolder
        newHolder.Variant_Code__c=pri.Variant_Code__c;
        newHolder.Variant__c=pri.Variant__c;
        newHolder.ComPartner_Code__c=pri.ComPartner_Code__c;
        newHolder.ComPartner__c=pri.ComPartner__c;
        newHolder.Plant_Code__c=pri.Plant_Code__c;
        newHolder.Plant__c=pri.Plant__c;
        newHolder.Shipping_Condition_Code__c=pri.Shipping_Condition_Code__c;
        newHolder.Shipping_Condition__c=pri.Shipping_Condition__c;
        newHolder.Destination_Country_Code__c=pri.Destination_Country_Code__c;
        newHolder.Destination_Country__c=pri.Destination_Country__c;
        //<MS20141115>
        newHolder.Project__c=pri.Disc_Ref__c;
        newHolder.Sales_Order_Type_Code__c=pri.Sales_Order_Type_Code__c;
        newHolder.Sales_Order_Type__c=pri.Sales_Order_Type__c;
        newHolder.OwnerId=pri.Pricing_Request__r.OwnerId;  
        newHolder.Price_Ref_Partner_Code__c=pri.Price_Ref_Partner_Code__c;
        newHolder.Price_Ref_Partner__c=pri.Price_Ref_Partner__c;
        newHolder.isPriceHolder__c=true;  */
        /* populating into mapOfpriAndHolder with req Item as key and holder details as value*/
        newHolder.isPriceHolder__c=true; 
        mapOfpriAndHolder.put(pri,newHolder);                             
      }
      /*
             Check the holdList, to decide whether a valid/appropriate holder is present
       */          
      if(holdList.size()!=0)
      {
        flag=0;
        Integer counter=0;
        appHolderList=new List<ERP_Sales_Prices_SAP__c>();
        /*The for loop iterates through the holders and decide the one vch overlapps with the dates of request item*/
        /* pri.New_Valid_From__c <= holdList.get(i).Valid_To__c+1 VIMP
                If a PRI VF/VTO is jus one day before/after the holder validity..no creation of holder**
                update the same holder
         */
         
        for(Integer i=0;i<holdList.size();i++)
        {
                    
          if(((pri.New_Valid_From__c >= holdList.get(i).Valid_From__c && pri.New_Valid_From__c <= holdList.get(i).Valid_To__c+1) || (pri.New_Valid_To__c >= holdList.get(i).Valid_From__c-1 && pri.New_Valid_To__c <= holdList.get(i).Valid_To__c))||((holdList.get(i).Valid_From__c >=pri.New_Valid_From__c && holdList.get(i).Valid_From__c <=pri.New_Valid_To__c)||(holdList.get(i).Valid_To__c>=pri.New_Valid_From__c &&holdList.get(i).Valid_From__c <= pri.New_Valid_To__c)))
          {   
            appHolderList.add(holdList.get(i));         
          }
        }
        if(appHolderList!=null && appHolderList.size()==0)
        {
          /* No appropriate holder -create one*/
          newholder= new ERP_Sales_Prices_SAP__c();
          //<AS20191226>start
          newholder=Trig_validatePriceAUNewUtil.createHolderFromItem(pri, RequestOwnerId,custSRMap,prmap);
         //<AS20191226>End
          newholder.isPriceHolder__c =true;
      /*    newholder.isPriceHolder__c =true;
          newholder.Valid_From__c = pri.New_Valid_From__c;
          newholder.Valid_To__c = pri.New_Valid_To__c;  
          newHolder.Approved_Date__c=System.now();
          newHolder.BU__c=pri.BU__c;
          newHolder.Calculation_Type_Code__c =pri.Calculation_Type_Code__c;
          newHolder.Calculation_Type__c=pri.Calculation_Type__c;
          newHolder.Check_Scale__c =pri.Check_Scale__c;
          newHolder.Check_Scale_Code__c=pri.Check_Scale_Code__c;
          newHolder.Condition_Class__c=pri.Condition_Class__c;
          newHolder.Condition_Class_Code__c=pri.Condition_Class_Code__c;
          newHolder.Plus_Minus__c=pri.Plus_Minus__c;
          newHolder.Plus_Minus_Code__c=pri.Plus_Minus_Code__c;
          newHolder.Country__c = pri.Country__c;
          newHolder.Country_code__c = pri.Country_Code__c; 
          newHolder.Customer_Price_Group__c = pri.Customer_Price_Group__c;
          newHolder.Customer_Price_Group_Code__c = pri.Customer_Price_Group_Code__c;
          newHolder.Customer_Specific__c=pri.Customer_Specific__c;
          newHolder.Dist_Channel__c = pri.Dist_Channel__c;
          newHolder.Distribution_Channel_Code__c = pri.Dist_Channel_Code__c;
          newHolder.Division__c = pri.Division__c;
          newHolder.Division_Code__c = pri.Division_Code__c;
          newHolder.End_Use__c =  pri.End_Use__c;
          newHolder.End_Use_Code__c = pri.End_Use_Code__c;
          newHolder.End_User__c = pri.End_User__c;
          newHolder.End_User_Code__c = pri.End_User_Code__c;
          //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
          newHolder.Customer_Hierarchy__c = pri.Customer_Hierarchy__c;
          newHolder.Customer_Hierarchy_Code__c = pri.Customer_Hierarchy_Code__c;
          //<PP20131028> START
          newHolder.Ship_To_Country__c = pri.Ship_To_Country__c;
          newHolder.Ship_To_Country_Code__c = pri.Ship_To_Country_Code__c;
          //<PP20131028> END
          newHolder.Profit_Center__c = pri.Profit_Center__c;
          newHolder.Profit_Center_Code__c = pri.Profit_Center_Code__c;
          newHolder.Incoterms1__c = pri.Inco_terms__c;                   
          newHolder.Incoterms_1_Code__c = pri.Incoterms_Code__c; 
          newHolder.Key_Combination__c=pri.Key_Combination__c;
          //<PR20140908> START
          if(pri.Key_Combination_Code__c != null && pri.Key_Combination_Code__c.length() > 4)
            newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c.substring(0,4);
          else
            newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
          //<PR20140908> END
          //newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
          newHolder.Material__c = pri.Material__c;
          newHolder.Material_Code__c = pri.Material_Code__c;
          newHolder.Material_Price_Group__c = pri.Material_Price_Group__c;
          newHolder.Material_Price_Group_Code__c = pri.Material_Price_Group_Code__c;
          newHolder.PH1__c = pri.PH1__c;
          newHolder.PH1_Code__c = pri.PH1_Code__c;
          newHolder.PH2__c = pri.PH2__c;
          newHolder.PH2_Code__c = pri.PH2_Code__c;
          newHolder.PH3__c = pri.PH3__c;
          newHolder.PH3_Code__c = pri.PH3_Code__c;
          newHolder.PH4__c = pri.PH4__c;
          newHolder.PH4_Code__c = pri.PH4_Code__c;
          newHolder.PH5__c = pri.PH5__c;
          newHolder.PH5_Code__c = pri.PH5_Code__c;
          newHolder.PH6__c = pri.PH6__c;
          newHolder.PH6_Code__c = pri.PH6_Code__c;
          newHolder.PH7__c = pri.PH7__c;
          newHolder.PH7_Code__c = pri.PH7_Code__c;
          newHolder.PH8__c = pri.PH8__c;
          newHolder.PH8_Code__c = pri.PH8_Code__c;
          newHolder.PH9__c = pri.PH9__c;
          newHolder.PH9_Code__c = pri.PH9_Code__c;
          newHolder.Price_List_Type__c = pri.Price_List_Type__c;
          newHolder.Price_List_Type_Code__c = pri.Price_List_Type_Code__c;
          newHolder.Pricing_Condition__c=pri.Pricing_Condition__c;
          newHolder.Pricing_Condition_Code__c=pri.Pricing_Condition_Code__c;
          newHolder.Product_Hierarchy__c = pri.Product_Hierarchy__c;
          newHolder.Product_Hierarchy_Code__c = pri.Product_Hierarchy_Code__c;
          newHolder.Project_Id__c = pri.Disc_Ref__c; //auto number
          newHolder.Sales_Office__c = pri.Sales_Office__c;
          newHolder.Sales_Office_Code__c = pri.Sales_Office_Code__c;
          newHolder.Sales_Org__c = pri.Sales_Org__c;
          newHolder.Sales_Org_Code__c = pri.Sales_Org_Code__c;  */
          /* added because there is no Sales Price Type as 'Import'*/  
        /*  if(pri.Pricing_Request_Type__c!=null && pri.Pricing_Request_Type__c.equalsIgnoreCase('Import'))
          {
            newHolder.Sales_Price_Type__c='Permanent';
          }
          else
          {
            newHolder.Sales_Price_Type__c=pri.Pricing_Request_Type__c;     
          }               
          newHolder.Sales_Pricing_Procedure__c=pri.ERP_Pricing_Procedure__c;
          newHolder.SAP_Application_Id__c =pri.SAP_Application_Id__c;
          newHolder.SAP_Client_ID__c=pri.SAP_Client_ID__c;
          newHolder.SAP_Cluster__c= pri.SAP_Cluster__c;
          newHolder.Scale_Basis__c=pri.Scale_Basis__c;
          newHolder.Scale_Basis_Code__c=pri.Scale_Basis_Code__c;
          newHolder.Scaled_Price_Flag__c=pri.Scaled_Price_Flag__c;    
          newHolder.ScaleRate1__c=pri.ScaleRate1__c;
          newHolder.ScaleRate2__c=pri.ScaleRate2__c;
          newHolder.ScaleRate3__c=pri.ScaleRate3__c;
          newHolder.ScaleRate4__c=pri.ScaleRate4__c;
          newHolder.ScaleRate5__c=pri.ScaleRate5__c;
          newHolder.ScaleRate6__c=pri.ScaleRate6__c;
          newHolder.ScaleRate7__c=pri.ScaleRate7__c;
          newHolder.ScaleRate8__c=pri.ScaleRate8__c;
          newHolder.ScaleRate9__c=pri.ScaleRate9__c;
          newHolder.ScaleRate10__c=pri.ScaleRate10__c;
          newHolder.Scale_Quantity_Scale_Value1__c=pri.Scale_Quantity_Scale_Value1__c;
          newHolder.Scale_Quantity_Scale_Value2__c=pri.Scale_Quantity_Scale_Value2__c;
          newHolder.Scale_Quantity_Scale_Value3__c=pri.Scale_Quantity_Scale_Value3__c;
          newHolder.Scale_Quantity_Scale_Value4__c=pri.Scale_Quantity_Scale_Value4__c;
          newHolder.Scale_Quantity_Scale_Value5__c=pri.Scale_Quantity_Scale_Value5__c;
          newHolder.Scale_Quantity_Scale_Value6__c=pri.Scale_Quantity_Scale_Value6__c;
          newHolder.Scale_Quantity_Scale_Value7__c=pri.Scale_Quantity_Scale_Value7__c;
          newHolder.Scale_Quantity_Scale_Value8__c=pri.Scale_Quantity_Scale_Value8__c;
          newHolder.Scale_Quantity_Scale_Value9__c=pri.Scale_Quantity_Scale_Value9__c;
          newHolder.Scale_Quantity_Scale_Value10__c=pri.Scale_Quantity_Scale_Value10__c;
          newHolder.Scale_Type__c=pri.Scale_Type__c;
          newHolder.Scale_Type_Code__c=pri.Scale_Type_Code__c;
          newHolder.Scale_UoM_Scale_Unit__c=pri.Scale_UoM_Scale_Unit__c; 
          newHolder.ShipTo_Code__c=pri.ShipTo_Code__c;
          newHolder.ShipTo__c=pri.ShipTo__c;  
          newHolder.Sold_To_Code__c=pri.Sold_To_Code__c;
          newHolder.Sold_To__c=pri.Sold_To__c; 
          newHolder.Terms_Of_Payment_Code__c = pri.Terms_of_Payment_Code__c;
          //<PP20131022>
          newHolder.Terms_Of_Payment__c = pri.Terms_of_Payment__c;
          newHolder.Market_Segment_Code__c=pri.Market_Segment_Code__c;
          newHolder.Market_Segment__c=pri.Market_Segment__c;
          //<HL20140902-Start>
          newHolder.Pricing_request__c=pri.Pricing_request__c;
          //<HL20140902-End>
          //<MS20140515> Added Variant and SalesOrderType in newHolder
          newHolder.Variant_Code__c=pri.Variant_Code__c;
          newHolder.Variant__c=pri.Variant__c;
          newHolder.ComPartner_Code__c=pri.ComPartner_Code__c;
        newHolder.ComPartner__c=pri.ComPartner__c;
        newHolder.Plant_Code__c=pri.Plant_Code__c;
        newHolder.Plant__c=pri.Plant__c;
        newHolder.Shipping_Condition_Code__c=pri.Shipping_Condition_Code__c;
        newHolder.Shipping_Condition__c=pri.Shipping_Condition__c;
        newHolder.Destination_Country_Code__c=pri.Destination_Country_Code__c;
        newHolder.Destination_Country__c=pri.Destination_Country__c;
          //<MS20141115>
          newHolder.Project__c=pri.Disc_Ref__c;
          newHolder.Sales_Order_Type_Code__c=pri.Sales_Order_Type_Code__c;
          newHolder.Sales_Order_Type__c=pri.Sales_Order_Type__c;
          newHolder.OwnerId=pri.Pricing_Request__r.OwnerId;  
          newHolder.Price_Ref_Partner_Code__c=pri.Price_Ref_Partner_Code__c;
          newHolder.Price_Ref_Partner__c=pri.Price_Ref_Partner__c;         */          
          mapOfpriAndHolder.put(pri,newHolder);     
        }
        //If size==1, there is only one approppriate holder
        else if(appHolderList!=null && appHolderList.size()==1)
        {
          holder =appHolderList.get(0);
          flag=1; 
          mapOfpriAndHolder.put(pri,holder);
        }
        else
        {
          //more than one appropriate holder
          //System.debug('*in else neeha');
          //sort the appHolderList valid To asc
          //1st rec would be the final holder for the record
          //add it into the map of pri,holder
          //what happens to the remianing holders and their childern??
          //add all the remaning holders to the list.
          //add them to a map with key as parent holder and value as the list of holders to be deleted
          System.debug('****in else neeha delete holder logic');
          appHolderList= PAUtil.sortList(appHolderList, 'Valid_To__c','asc');
          if(appHolderList!=null && appHolderList.size()!=0)
          {
            holder=appHolderList.get(0);
            mapOfpriAndHolder.put(pri,holder);
          }
          for(Integer i=1;i<appHolderList.size();i++)
          {
            delList.add(appHolderList.get(i));
            delRecOverLapHolderMap.put(appHolderList.get(i),appHolderList.get(0));
          }  
        }                
      }
    }
      }
    Set<ERP_Sales_Prices_SAP__c> upsertHolderSet=new Set<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> upsertHolderList =new   List<ERP_Sales_Prices_SAP__c>();
    Map<Id,ERP_Sales_Prices_SAP__c> idHolderMap=new  Map<Id,ERP_Sales_Prices_SAP__c>();
    for(ERP_Sales_Prices_SAP__c erp:mapOfpriAndHolder.values())
    {
      upsertHolderSet.add(erp);
    }
    for(ERP_Sales_Prices_SAP__c e1:upsertHolderSet)
    {
      upsertHolderList.add(e1);
    }
    /**    Upserts all the holders**/
    upsert upsertHolderList;
    /**Query all the holders**/
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    //<PP20131022> - Added Terms_of_Payment__c to the query
    //<PP20131028>
    //<MS20140515> Added Variant and SalesOrderType fields in the query
    //<HL20140902> Added Pricing Request filed in the query
    //<SS20220826> Adding Sales Order Item fileds in query
    List<ERP_Sales_Prices_SAP__c> allHoldersList=[Select Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Pricing_Request__c,markForDeletion__c,KC_SAP__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,
                                      ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                            Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c, isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                              Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c,
                            Scaled_Price_Flag__c,  Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, 
                            Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c,
                            Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c,
                            Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c, */ScaleRate9__c,
                            ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, 
                            Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                            Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Record_Id__c, Rate__c, 
                            Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                            Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, 
                            PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c,
                            PH1__c, PH1_Code__c, PCKC__c, Owning_Business__c, OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                            LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_User__c, End_User_Code__c, End_Use__c,
                            End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c, Dist_Channel__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                            CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
                            Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c,Price_Ref_Partner__c,Price_Ref_Partner_Code__c, Approved_Date__c  From ERP_Sales_Prices_SAP__c WHERE Id=: upsertHolderList];
    /*populate idHolderMap with id of the holder as key and the holder instance as value */ 
    for(ERP_Sales_Prices_SAP__c erphold:allHoldersList)
    {
      idHolderMap.put(erphold.Id,erphold);
    }
    /*Iterate through pri get the holder*/      
    Boolean createMarkedForDeletionRec=false;
    for(Pricing_Request_Item__c pri1:mapOfpriAndHolder.keySet())
    {
      //intially it is false, becomes true when the condition is satisfied
      createMarkedForDeletionRec=false;
      if(mapOfpriAndHolder.get(pri1)!=null && idHolderMap.containsKey(mapOfpriAndHolder.get(pri1).Id))
      {   
        holder= idHolderMap.get(mapOfpriAndHolder.get(pri1).Id);
      }
      else
      {
        holder=new ERP_Sales_Prices_SAP__c();
      }
      if(holder!=null && holder.Id!=null)
      {
        if(!pri1.expire__c)
        {
          //instantiate a new record
          newRec= new ERP_Sales_Prices_SAP__c();
          //<AS20191226>start
          newRec=Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pri1,RequestOwnerId,custSRMap,prmap);
          //<AS20191226>End
          newRec.Price_Holder__c=holder.Id;    //VVIMP
          /**For Project scenario try--9th Feb-start**/  
          /**
                     check if new Valid to is less than old Valid to---it is |||ar to expiring a record
           **VIMP--check with old Valid to not wid holder valid to, coz holder vTo might be different if there is no appropriate hodler 
                     and we need to create one
           **/
          if((pri1.New_Valid_To__c < pri1.Valid_to__c ) && pri1.Pricing_Request_Type__c=='Project')
          {
            createMarkedForDeletionRec =true;
          }
          /*end*/  
          /** For scenarios other than project **/
          if((pri1.New_Valid_To__c > holder.Valid_to__c || pri1.New_Valid_From__c < holder.Valid_From__c ) && pri1.Pricing_Request_Type__c!='Project' )
          {
            if(pri1.New_Valid_To__c > holder.Valid_to__c)
            {
              holder.Valid_To__c=pri1.New_Valid_To__c;
            }
            if(pri1.New_Valid_From__c < holder.Valid_From__c)
            {
              holder.Valid_From__c=pri1.New_Valid_From__c; 
            }
            //add the holder into upsertList
            upsertList.add(holder);
          } 
          //System.debug('****upsert list1'+upsertList);
          /* once the validity of the record is started, valid from should be system date+1,
                        since the period before system date is frozen
                        //pri1.New_Valid_From__c==pri1.Valid_From__c && -does'nt make sense, so removing.
                        once the validity has been started, always the VF should be systemdate+1
                        && pri1.New_Valid_From__c<=System.now().Date()-added
            if(pri1.Valid_From__c<=System.now().date() && pri1.New_Valid_From__c==pri1.Valid_From__c){
                newRec.Valid_From__c=System.now().date()+1;
            }
            else{
                newRec.Valid_From__c = pri1.New_Valid_From__c;
            }  */
          //newly added--irrespective of date/  rate change..          
        /*  newRec.Valid_From__c = pri1.New_Valid_From__c;
          newRec.Valid_To__c = pri1.New_Valid_To__c;
          newRec.Approved_Date__c=System.now();
          newREc.Calculation_Type_Code__c =pri1.Calculation_Type_Code__c;
          newREc.Calculation_Type__c=pri1.Calculation_Type__c;
          newREc.Check_Scale__c =pri1.Check_Scale__c;
          newREc.Check_Scale_Code__c=pri1.Check_Scale_Code__c;
          newREc.Condition_Class__c=pri1.Condition_Class__c;
          newREc.Condition_Class_Code__c=pri1.Condition_Class_Code__c;
          newRec.BU__c=pri1.BU__c; 
          newREc.Plus_Minus__c=pri1.Plus_Minus__c;
          newREc.Plus_Minus_Code__c=pri1.Plus_Minus_Code__c;
          newREc.Country__c = pri1.Country__c;
          newREc.Country_code__c = pri1.Country_Code__c;
          newREc.Customer_Price_Group__c = pri1.Customer_Price_Group__c;
          newREc.Customer_Price_Group_Code__c = pri1.Customer_Price_Group_Code__c; 
          newRec.Customer_Specific__c=pri1.Customer_Specific__c; 
          newREc.Dist_Channel__c = pri1.Dist_Channel__c;
          newREc.Distribution_Channel_Code__c = pri1.Dist_Channel_Code__c;
          newREc.Division__c = pri1.Division__c;
          newREc.Division_Code__c = pri1.Division_Code__c;
          newREc.End_Use__c =  pri1.End_Use__c;
          newREc.End_Use_Code__c = pri1.End_Use_Code__c;
          newREc.End_User__c = pri1.End_User__c;
          newREc.End_User_Code__c = pri1.End_User_Code__c;
          //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
          newREc.Customer_Hierarchy__c = pri1.Customer_Hierarchy__c;
          newREc.Customer_Hierarchy_Code__c = pri1.Customer_Hierarchy_Code__c;
          //<PP20131028> START
          newRec.Ship_To_Country__c = pri1.Ship_To_Country__c;
          newRec.Ship_To_Country_Code__c = pri1.Ship_To_Country_Code__c;
          //<PP20131028> END
          newREc.Incoterms1__c = pri1.Inco_terms__c;           
          newREc.Incoterms_1_Code__c = pri1.Incoterms_Code__c;
          newRec.Key_Combination__c=pri1.Key_Combination__c;
          //<PR20140908> START
          if(pri1.Key_Combination_Code__c != null && pri1.Key_Combination_Code__c.length() > 4)
            newRec.Key_Combination_Code__c=pri1.Key_Combination_Code__c.substring(0,4);
          else
          newRec.Key_Combination_Code__c=pri1.Key_Combination_Code__c;
          //<PR20140908> END
          //newRec.Key_Combination_Code__c=pri1.Key_Combination_Code__c;
          newREc.Material__c = pri1.Material__c;
          newREc.Material_Code__c = pri1.Material_Code__c;
          newREc.Material_Price_Group__c = pri1.Material_price_Group__c;
          newREc.Material_Price_Group_Code__c = pri1.Material_Price_Group_Code__c;
          newRec.Per__c=pri1.New_Per__c;
          newREc.PH1__c = pri1.PH1__c;
          newREc.PH1_Code__c = pri1.PH1_Code__c;
          newREc.PH2__c = pri1.PH2__c;
          newREc.PH2_Code__c = pri1.PH2_Code__c;
          newREc.PH3__c = pri1.PH3__c;
          newREc.PH3_Code__c = pri1.PH3_Code__c;
          newREc.PH4__c = pri1.PH4__c;
          newREc.PH4_Code__c = pri1.PH4_Code__c;
          newREc.PH5__c = pri1.PH5__c;
          newREc.PH5_Code__c = pri1.PH5_Code__c;
          newREc.PH6__c = pri1.PH6__c;
          newREc.PH6_Code__c = pri1.PH6_Code__c;
          newREc.PH7__c = pri1.PH7__c;
          newREc.PH7_Code__c = pri1.PH7_Code__c;
          newREc.PH8__c = pri1.PH8__c;
          newREc.PH8_Code__c = pri1.PH8_Code__c;
          newREc.PH9__c = pri1.PH9__c;
          newREc.PH9_Code__c = pri1.PH9_Code__c;
          newREc.Price_List_Type__c = pri1.Price_List_Type__c;
          newREc.Price_List_Type_Code__c = pri1.Price_List_Type_Code__c;
          newREc.Pricing_Condition__c = pri1.Pricing_Condition__c;
          newREc.Pricing_Condition_Code__c = pri1.Pricing_Condition_Code__c;
          newREc.Product_Hierarchy__c = pri1.Product_Hierarchy__c;
          newREc.Product_Hierarchy_Code__c = pri1.Product_Hierarchy_Code__c;
          newREc.Profit_Center__c = pri1.Profit_Center__c;
          newREc.Profit_Center_Code__c = pri1.Profit_Center_Code__c;         
          newRec.Project_Id__c=pri1.Disc_Ref__c; //needs to be validated
          newREc.Rate__c=pri1.New_Rate__c;
          newREc.Sales_Office__c = pri1.Sales_Office__c;
          newREc.Sales_Office_Code__c = pri1.Sales_Office_Code__c;
          newREc.Sales_Org__c = pri1.Sales_Org__c;
          newREc.Sales_Org_Code__c = pri1.Sales_Org_Code__c;
          /* added because there is no Sales Price Type as 'Import'*/  
        /*  if(pri1.Pricing_Request_Type__c!=null && pri1.Pricing_Request_Type__c.equalsIgnoreCase('Import'))
          {
            newREc.Sales_Price_Type__c='Permanent';
          }
          else
          {
            newREc.Sales_Price_Type__c=pri1.Pricing_Request_Type__c;     
          }               
          newREc.Sales_Pricing_Procedure__c=pri1.ERP_Pricing_Procedure__c;
          newREc.SAP_Application_Id__c = pri1.SAP_Application_Id__c;
          newREc.SAP_Client_Id__c = pri1.SAP_Client_ID__c;
          newREc.SAP_Cluster__c= pri1.SAP_Cluster__c;
          newREc.Scale_Basis__c=pri1.Scale_Basis__c;
          newREc.Scale_Basis_Code__c=pri1.Scale_Basis_Code__c;
          newREc.Scaled_Price_Flag__c = pri1.Scaled_Price_Flag__c;
          newREc.ScaleRate1__c=pri1.ScaleRate1__c;
          newREc.ScaleRate2__c=pri1.ScaleRate2__c;
          newREc.ScaleRate3__c=pri1.ScaleRate3__c;
          newREc.ScaleRate4__c=pri1.ScaleRate4__c;
          newREc.ScaleRate5__c=pri1.ScaleRate5__c;
          newREc.ScaleRate6__c=pri1.ScaleRate6__c;
          newREc.ScaleRate7__c=pri1.ScaleRate7__c;
          newREc.ScaleRate8__c=pri1.ScaleRate8__c;
          newREc.ScaleRate9__c=pri1.ScaleRate9__c;
          newREc.ScaleRate10__c=pri1.ScaleRate10__c;
          newREc.Scale_Quantity_Scale_Value1__c=pri1.Scale_Quantity_Scale_Value1__c;
          newREc.Scale_Quantity_Scale_Value2__c=pri1.Scale_Quantity_Scale_Value2__c;
          newREc.Scale_Quantity_Scale_Value3__c=pri1.Scale_Quantity_Scale_Value3__c;
          newREc.Scale_Quantity_Scale_Value4__c=pri1.Scale_Quantity_Scale_Value4__c;
          newREc.Scale_Quantity_Scale_Value5__c=pri1.Scale_Quantity_Scale_Value5__c;
          newREc.Scale_Quantity_Scale_Value6__c=pri1.Scale_Quantity_Scale_Value6__c;
          newREc.Scale_Quantity_Scale_Value7__c=pri1.Scale_Quantity_Scale_Value7__c;
          newREc.Scale_Quantity_Scale_Value8__c=pri1.Scale_Quantity_Scale_Value8__c;
          newREc.Scale_Quantity_Scale_Value9__c=pri1.Scale_Quantity_Scale_Value9__c;
          newREc.Scale_Quantity_Scale_Value10__c=pri1.Scale_Quantity_Scale_Value10__c;
          newREc.Scale_Type__c=pri1.Scale_Type__c;
          newREc.Scale_Type_Code__c=pri1.Scale_Type_Code__c;
          newREc.Scale_UoM_Scale_Unit__c=pri1.Scale_UoM_Scale_Unit__c; 
          newRec.ShipTo_Code__c=pri1.ShipTo_Code__c;
          newRec.ShipTo__c=pri1.ShipTo__c;
          newRec.Sold_To__c=pri1.Sold_To__c;
          newRec.Sold_To_Code__c=pri1.Sold_To_Code__c;
          newREc.Terms_Of_Payment_Code__c = pri1.Terms_of_Payment_Code__c;
          //<HL20140902-Start>
                    newREc.Pricing_request__c=pri1.Pricing_request__c;
                    //<HL20140902-End>
          //<PP20131022>
          newREc.Terms_Of_Payment__c = pri1.Terms_of_Payment__c;
          newREc.UoM__c=pri1.New_UoM__c;
          newREc.Unit__c=pri1.New_Unit__c;
          //envelopes
          newREc.Market_Segment_Code__c=pri1.Market_Segment_Code__c;
          newREc.Market_Segment__c=pri1.Market_Segment__c;
          //<MS20140515>Adding variant and sales order type to newREc
          newREc.Variant_Code__c=pri1.Variant_Code__c;
          newREc.Variant__c=pri1.Variant__c;
          newREc.ComPartner_Code__c=pri1.ComPartner_Code__c;
        newREc.ComPartner__c=pri1.ComPartner__c;
        newREc.Plant_Code__c=pri1.Plant_Code__c;
        newREc.Plant__c=pri1.Plant__c;
        newREc.Shipping_Condition_Code__c=pri1.Shipping_Condition_Code__c;
        newREc.Shipping_Condition__c=pri1.Shipping_Condition__c;
        newREc.Destination_Country_Code__c=pri1.Destination_Country_Code__c;
        newREc.Destination_Country__c=pri1.Destination_Country__c;
          //<MS20141115>
          newRec.Project__c=pri1.Disc_Ref__c;
          newREc.Sales_Order_Type_Code__c=pri1.Sales_Order_Type_Code__c;
          newREc.Sales_Order_Type__c=pri1.Sales_Order_Type__c;
          //<PP20140522>
          newRec.Customer_Price_Payment_Terms__c = pri1.New_Customer_Price_Payment_Terms__c;
          newRec.Payment_Terms_Fixed_Date__c= pri1.New_Payment_Terms_Fixed_Date__c;
          newRec.Quantity__c = String.valueOf(pri1.New_Volume__c);
          //newRec.UoM__c = pri1.New_Volume_UoM__c;
          //<TJ20150128>
          if(pri1.Pricing_Request__r.Request_Type__c=='Import' && pri1.Pricing_Request__r.Customer_Specific__c==true && (pri1.Pricing_Request__r.On_Behalf_Of__c!=null || pri1.Pricing_Request__r.On_Behalf_Of__c!=''))
          {
            newREc.OwnerId=custSRMap.get(pri1.Sold_To_Code__c);
            system.debug(custSRMap.get(pri1.Sold_To_Code__c)+' '+newREc.OwnerId);          
          }
          else
            newREc.OwnerId=pri1.Pricing_Request__r.OwnerId; 
          newRec.Price_Ref_Partner_Code__c=pri1.Price_Ref_Partner_Code__c;
          newRec.Price_Ref_Partner__c=pri1.Price_Ref_Partner__c;*/
          /*population of KCSAP-try*/
        /*  sObject sObj = (sObject)pri1 ; 
          List<String> kcSplitList =new List<String>();
          newRec.KC_SAP__c='';
          kcSplitList = pri1.Key_Combination__c.split('/');
          for(String kc:kcSplitList)
          {
            if(('Sales Org.').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
            }
            if(('Division').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
            }
            if(('Dist. Channel').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
            }
            if(('Sold to').equalsIgnoreCase(kc))
            {
              //leading zeros
              String soldTo=String.valueOf(sobj.get('Sold_To_Code__c'));
              if(soldTo <> null) {
                soldTo = (soldTo.leftPad(10)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + soldTo;
              }
              //end
            }
            if(('Material').equalsIgnoreCase(kc))
            {
              //leading hashes
              String matCode = String.valueOf(sobj.get('Material_Code__c'));
              if(!String.isBlank(matCode))
                matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
              newRec.KC_SAP__c =newRec.KC_SAP__c + matCode;
            }
            if(kc.containsIgnoreCase('PH'))
            {
              if(('PH1').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH1_Code__c'))=='' || String.valueOf(sobj.get('PH1_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH1_Code__c'));
                }
              }
              if(('PH2').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH2_Code__c'))=='' || String.valueOf(sobj.get('PH2_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH2_Code__c'));
                }
              }
              if(('PH3').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH3_Code__c'))=='' || String.valueOf(sobj.get('PH3_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH3_Code__c'));
                }
              }
              if(('PH4').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH4_Code__c'))=='' || String.valueOf(sobj.get('PH4_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH4_Code__c'));
                }
              }
              if(('PH5').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH5_Code__c'))=='' || String.valueOf(sobj.get('PH5_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH5_Code__c'));
                }
              }
              if(('PH6').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH6_Code__c'))=='' || String.valueOf(sobj.get('PH6_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH6_Code__c'));
                }
              }
              if(('PH7').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH7_Code__c'))=='' || String.valueOf(sobj.get('PH7_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                } 
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH7_Code__c'));
                }
              }
              if(('PH8').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH8_Code__c'))=='' || String.valueOf(sobj.get('PH8_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH8_Code__c'));
                }
              }
              if(('PH9').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH9_Code__c'))=='' || String.valueOf(sobj.get('PH9_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH9_Code__c'));
                }
              }
            }
            if(('Sales office').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Office_Code__c'));
            }
            if(('Ship To').equalsIgnoreCase(kc))
            {
              //leading zeros
              String shipTo=String.valueOf(sobj.get('ShipTo_Code__c'));
              if(shipTo <> null)
              {
                shipTo = (shipTo.leftPad(10)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + shipTo;
              }
              //end
            }
            if(('End User').equalsIgnoreCase(kc))
            {
              //leading zeros
              String endUser=String.valueOf(sobj.get('End_User_Code__c'));
              if(endUser <> null)
              {
                endUser = (endUser.leftPad(10)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + endUser;
              }
              //end
            }
            if(('Customer Hierarchy').equalsIgnoreCase(kc))
            {
              //leading zeros
              String customerHierarchy=String.valueOf(sobj.get('Customer_Hierarchy_Code__c'));
              if(customerHierarchy <> null)
              {
                customerHierarchy = (customerHierarchy.leftPad(10)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + customerHierarchy;
              }
              //end
            }
            if(('FRB').equalsIgnoreCase(kc))
            {
              //leading zeros
              String frb=String.valueOf(sobj.get('Profit_Center_Code__c'));
              newRec.KC_SAP__c =newRec.KC_SAP__c + frb;
              //end
            }
            if(('Material Price Group').equalsIgnoreCase(kc))
            {
              String mpgCode=String.valueOf(sobj.get('Material_Price_Group_Code__c'));
              if(mpgCode!=null)
              {                    
                if(mpgCode.isNumeric())
                {
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    mpgCode='0'+mpgCode;
                  }
                }
                else
                {
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    mpgCode=mpgCode+'#';
                  }
                }
              }
              newREc.KC_SAP__c =newREc.KC_SAP__c + mpgCode;
            }
            if(('Customer Price Group').equalsIgnoreCase(kc))
            {
              String cpgCode=String.valueOf(sobj.get('Customer_Price_Group_Code__c'));
              if(cpgCode!=null)
              {                    
                if(cpgCode.isNumeric())
                {
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    cpgCode='0'+cpgCode;
                  }
                }
                else
                {
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    cpgCode=cpgCode+'#';
                  }
                }
              }
              newRec.KC_SAP__c =newRec.KC_SAP__c + cpgCode;
            }
            if(('DiscRef').equalsIgnoreCase(kc) || (('Project Id').equalsIgnoreCase(kc)))
            { 
              /leading zeros
              String projectId=String.valueOf(sobj.get('Disc_Ref__c'));
              if(projectId!=null)
              {
                //project Id should be 12 digit
                projectId = (projectId.leftPad(12)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + projectId;
              }
              //end                      
            }
            if(('Price List Type').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Price_List_Type_Code__c'));
            }
            //<PP20131213>
            if(('Terms of Payment').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Terms_of_Payment_Code__c'));
            }
            if(('Market Segment').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Market_Segment_Code__c'));
            }
            //<HL20140902> remove
            /*if(('Pricing Request').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Pricing_Request__c'));
            }*/
            //<MS20140515> Adding conditions for Variant and Sales order type
          /*  if(('Variant').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Variant_Code__c'));
            }
            if(('Sales Order Type').equalsIgnoreCase(kc)){
              //<AV20141127>-Start-Production issue-Added condition to append '#' to Sales Order Type 
              String SalesOrderType = String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
              if(!String.isBlank(SalesOrderType))
                SalesOrderType = (SalesOrderType.rightPad(4)).replaceAll(' ', '#');
              newRec.KC_SAP__c =newRec.KC_SAP__c + SalesOrderType;
              system.debug('!%@$#^$SAlesOrderType:'+SalesOrderType);
              //<AV20141127>-End
              //newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
            }
            if(('ComPartner').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('ComPartner_Code__c'));
            }
            if(('Plant').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Plant_Code__c'));
            }
            if(('Shipping Condition').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Shipping_Condition_Code__c'));
            }
            if(('Destination Country').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Destination_Country_Code__c'));
            }
            if(('Price Ref. Partner').equalsIgnoreCase(kc)){
              //leading zeros
              String priceRefPartner=String.valueOf(sobj.get('Price_Ref_Partner_Code__c'));
              if(priceRefPartner <> null) {
                priceRefPartner = (priceRefPartner.leftPad(10)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + priceRefPartner;
              }
              //end
            }
            if(('Country').equalsIgnoreCase(kc))
            {
              String countryCode=String.valueOf(sobj.get('country_code__c'));
              if(countryCode!=null)
              {
                Integer len=3-countryCode.length();
                for(Integer i=0;i<len;i++)
                {
                  countryCode=countryCode+'#';
                }
              }   

              newRec.KC_SAP__c =newRec.KC_SAP__c + countryCode;
            }
            if(('End Use').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('End_Use_Code__c'));
            }
            if(('Incoterms').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Incoterms_Code__c'));
            }
            //<PP20131028> START
            if(('Ship-To Country').equalsIgnoreCase(kc))
            {
              String shipToCountryCode=String.valueOf(sobj.get('Ship_To_Country_code__c'));
              if(shipToCountryCode!=null)
              {
                Integer len=3-shipToCountryCode.length();
                for(Integer i=0;i<len;i++)
                {
                  shipToCountryCode=shipToCountryCode+'#';
                }
              } 
              newRec.KC_SAP__c =newRec.KC_SAP__c + shipToCountryCode;
            }
            //<PP20131028> END
            newRec.KC_SAP__c.trim();
          } */
          /*end*/
          upsertList.add(newRec); 
        }                       
        if(pri1.expire__c || createMarkedForDeletionRec)
        {
          //expire price scenario
          ERP_Sales_Prices_SAP__c newRec1=new ERP_Sales_Prices_SAP__c();
          //<AS20191226>start
          newRec1=Trig_validatePriceAUNewUtil.createSalesPriceSAPFromItem(pri1,RequestOwnerId,custSRMap,prmap);
          //<AS20191226>End
          /** Project scenario**/
          if(createMarkedForDeletionRec && pri1.Pricing_Request_Type__c=='Project')
          {
            if(pri1.New_Valid_To__c< pri1.Valid_To__c)
            {//right marked for deletion record
              //compare always wid the pri old VF and Old VTo..not wid holder, coz holder would be different for the pri
              //holder is same as newRec1 not PRI1 **VIMP
              if(pri1.New_Valid_To__c>pri1.Valid_From__c)
              {
                newRec1.Valid_From__c=pri1.New_Valid_To__c+1;
              }
              else
              {
                newRec1.Valid_From__c=pri1.Valid_From__c;
              }
              newRec1.Valid_To__c=pri1.Valid_To__c ;
            }
          }
          /*end project try*/
          /**Expire scenario.i.e other than project**/
          if(pri1.Pricing_Request_Type__c!='Project')
          {
            newRec1.Valid_From__c=pri1.New_Valid_To__c + 1 ;
            //<GT20140924>
            //Date expDate=  Date.newInstance(3999,12,31);
            newRec1.Valid_To__c= Date.newInstance(3999,12,31);
            //newRec1.Valid_To__c=holder.Valid_To__c;             
          }
          /*end*/
          newRec1.Price_Holder__c=holder.Id;
          newRec1.markForDeletion__c=true; //imp
        /*  newRec1.BU__c=pri1.BU__c; 
          newRec1.Approved_Date__c=System.now();
          newRec1.Calculation_Type_Code__c =pri1.Calculation_Type_Code__c;
          newRec1.Calculation_Type__c=pri1.Calculation_Type__c;
          newRec1.Check_Scale__c =pri1.Check_Scale__c;
          newRec1.Check_Scale_Code__c=pri1.Check_Scale_Code__c;
          newRec1.Condition_Class__c=pri1.Condition_Class__c;
          newRec1.Condition_Class_Code__c=pri1.Condition_Class_Code__c;
          newRec1.Plus_Minus__c=pri1.Plus_Minus__c;
          newRec1.Plus_Minus_Code__c=pri1.Plus_Minus_Code__c;
          newREc1.Country__c = pri1.Country__c;
          newREc1.Country_code__c = pri1.Country_Code__c;
          newREc1.Customer_Price_Group__c = pri1.Customer_Price_Group__c;
          newREc1.Customer_Price_Group_Code__c = pri1.Customer_Price_Group_Code__c;
          newRec1.Customer_Specific__c=pri1.Customer_Specific__c;
          newREc1.Dist_Channel__c = pri1.Dist_Channel__c;
          newREc1.Distribution_Channel_Code__c = pri1.Dist_Channel_Code__c;
          newREc1.Division__c = pri1.Division__c;
          newREc1.Division_Code__c = pri1.Division_Code__c;
          newREc1.End_Use__c =  pri1.End_Use__c;
          newREc1.End_Use_Code__c = pri1.End_Use_Code__c;
          newREc1.End_User__c = pri1.End_User__c;
          newREc1.End_User_Code__c = pri1.End_User_Code__c;
          //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
          newREc1.Customer_Hierarchy__c = pri1.Customer_Hierarchy__c;
          newREc1.Customer_Hierarchy_Code__c = pri1.Customer_Hierarchy_Code__c;
          //<PP20131028> START
          newRec1.Ship_To_Country__c = pri1.Ship_To_Country__c;
          newRec1.Ship_To_Country_Code__c = pri1.Ship_To_Country_Code__c;
          //<PP20131028> END
          newREc1.Profit_Center__c = pri1.Profit_Center__c;
          newREc1.Profit_Center_Code__c = pri1.Profit_Center_Code__c;
          newREc1.Incoterms1__c = pri1.Inco_terms__c;
          newREc1.Incoterms_1_Code__c = pri1.Incoterms_Code__c;
          newREc1.Key_Combination__c = pri1.Key_Combination__c;
          //<PR20140908> START
          if(pri1.Key_Combination_Code__c != null && pri1.Key_Combination_Code__c.length() > 4)
            newREc1.Key_Combination_Code__c=pri1.Key_Combination_Code__c.substring(0,4);
          else
          newREc1.Key_Combination_Code__c = pri1.Key_Combination_Code__c;
          //<PR20140908> END  
          //newREc1.Key_Combination_Code__c = pri1.Key_Combination_Code__c;
          newREc1.Material__c = pri1.Material__c;
          newREc1.Material_Code__c = pri1.Material_Code__c;
          newREc1.Material_Price_Group__c = pri1.Material_Price_Group__c;
          newREc1.Material_Price_Group_Code__c = pri1.Material_Price_Group_Code__c;
          newRec1.Per__c=pri1.New_Per__c; 
          newREc1.PH1__c = pri1.PH1__c;
          newREc1.PH1_Code__c = pri1.PH1_Code__c;
          newREc1.PH2__c = pri1.PH2__c;
          newREc1.PH2_Code__c = pri1.PH2_Code__c;
          newREc1.PH3__c = pri1.PH3__c;
          newREc1.PH3_Code__c = pri1.PH3_Code__c;
          newREc1.PH4__c = pri1.PH4__c;
          newREc1.PH4_Code__c = pri1.PH4_Code__c;
          newREc1.PH5__c = pri1.PH5__c;
          newREc1.PH5_Code__c = pri1.PH5_Code__c;
          newREc1.PH6__c = pri1.PH6__c;
          newREc1.PH6_Code__c = pri1.PH6_Code__c;
          newREc1.PH7__c = pri1.PH7__c;
          newREc1.PH7_Code__c = pri1.PH7_Code__c;
          newREc1.PH8__c = pri1.PH8__c;
          newREc1.PH8_Code__c = pri1.PH8_Code__c;
          newREc1.PH9__c = pri1.PH9__c;
          newREc1.PH9_Code__c = pri1.PH9_Code__c;
          newREc1.Price_List_Type__c = pri1.Price_List_Type__c;
          newREc1.Price_List_Type_Code__c = pri1.Price_List_Type_Code__c;
          newREc1.Pricing_Condition__c = pri1.Pricing_Condition__c;
          newREc1.Pricing_Condition_Code__c = pri1.Pricing_Condition_Code__c;
          newREc1.Product_Hierarchy__c = pri1.Product_Hierarchy__c;
          newREc1.Product_Hierarchy_Code__c = pri1.Product_Hierarchy_Code__c;
          newRec1.Project_Id__c=pri1.Disc_Ref__c;
          newREc1.Rate__c=pri1.New_Rate__c;  
          newREc1.Sales_Office__c = pri1.Sales_Office__c;
          newREc1.Sales_Office_Code__c = pri1.Sales_Office_Code__c;
          newREc1.Sales_Org__c = pri1.Sales_Org__c;
          newREc1.Sales_Org_Code__c = pri1.Sales_Org_Code__c;*/
          /* added because there is no Sales Price Type as 'Import'*/  
        /*  if(pri1.Pricing_Request_Type__c!=null && pri1.Pricing_Request_Type__c.equalsIgnoreCase('Import'))
          {
            newREc1.Sales_Price_Type__c='Permanent';
          }
          else
          {
            newREc1.Sales_Price_Type__c=pri1.Pricing_Request_Type__c;     
          }               
          newREc1.Sales_Pricing_Procedure__c=pri1.ERP_Pricing_Procedure__c;
          newREc1.SAP_Application_Id__c = pri1.SAP_Application_Id__c;
          newREc1.SAP_Client_Id__c = pri1.SAP_Client_ID__c;
          newREc1.SAP_Cluster__c= pri1.SAP_Cluster__c;
          newREc1.Check_Scale__c=pri1.Check_Scale__c; 
          newREc1.Scale_Basis__c=pri1.Scale_Basis__c;
          newREc1.Scale_Basis_Code__c=pri1.Scale_Basis_Code__c;
          newREc1.Scale_Type__c=pri1.Scale_Type__c;
          newREc1.Scale_Type_Code__c=pri1.Scale_Type_Code__c;
          newREc1.Scale_UoM_Scale_Unit__c=pri1.Scale_UoM_Scale_Unit__c;
          newREc1.Scaled_Price_Flag__c = pri1.Scaled_Price_Flag__c;      
          newREc1.ScaleRate1__c=pri1.ScaleRate1__c;
          newREc1.ScaleRate2__c=pri1.ScaleRate2__c;
          newREc1.ScaleRate3__c=pri1.ScaleRate3__c;
          newREc1.ScaleRate4__c=pri1.ScaleRate4__c;
          newREc1.ScaleRate5__c=pri1.ScaleRate5__c;
          newREc1.ScaleRate6__c=pri1.ScaleRate6__c;
          newREc1.ScaleRate7__c=pri1.ScaleRate7__c;
          newREc1.ScaleRate8__c=pri1.ScaleRate8__c;
          newREc1.ScaleRate9__c=pri1.ScaleRate9__c;
          newREc1.ScaleRate10__c=pri1.ScaleRate10__c;
          newREc1.Scale_Quantity_Scale_Value1__c=pri1.Scale_Quantity_Scale_Value1__c;
          newREc1.Scale_Quantity_Scale_Value2__c=pri1.Scale_Quantity_Scale_Value2__c;
          newREc1.Scale_Quantity_Scale_Value3__c=pri1.Scale_Quantity_Scale_Value3__c;
          newREc1.Scale_Quantity_Scale_Value4__c=pri1.Scale_Quantity_Scale_Value4__c;
          newREc1.Scale_Quantity_Scale_Value5__c=pri1.Scale_Quantity_Scale_Value5__c;
          newREc1.Scale_Quantity_Scale_Value6__c=pri1.Scale_Quantity_Scale_Value6__c;
          newREc1.Scale_Quantity_Scale_Value7__c=pri1.Scale_Quantity_Scale_Value7__c;
          newREc1.Scale_Quantity_Scale_Value8__c=pri1.Scale_Quantity_Scale_Value8__c;
          newREc1.Scale_Quantity_Scale_Value9__c=pri1.Scale_Quantity_Scale_Value9__c;
          newREc1.Scale_Quantity_Scale_Value10__c=pri1.Scale_Quantity_Scale_Value10__c;
          newRec1.ShipTo_Code__c=pri1.ShipTo_Code__c;
          newRec1.ShipTo__c=pri1.ShipTo__c;      
          newREc1.Sold_To__c=pri1.Sold_To__c;
          newRec1.Sold_To_Code__c=pri1.Sold_To_Code__c;         
          newREc1.Terms_Of_Payment_Code__c = pri1.Terms_of_Payment_Code__c;
          //<PP20131022>
          newREc1.Terms_Of_Payment__c = pri1.Terms_of_Payment__c;
          newREc1.UoM__c=pri1.New_UoM__c;
          newREc1.Unit__c=pri1.New_Unit__c;
          newREc1.Market_Segment_Code__c=pri1.Market_Segment_Code__c;
          newREc1.Market_Segment__c=pri1.Market_Segment__c;
          //<PP20140522>
          //<HL20140902-Start>
                    newREc1.Pricing_request__c=pri1.Pricing_request__c;
                    //<HL20140902-End>
          newRec1.Customer_Price_Payment_Terms__c = pri1.New_Customer_Price_Payment_Terms__c;
          newRec1.Payment_Terms_Fixed_Date__c = pri1.New_Payment_Terms_Fixed_Date__c;
          newRec.Quantity__c = String.valueOf(pri1.New_Volume__c);
          //newRec.UoM__c = pri1.New_Volume_UoM__c;

          //<MS20140515> Adding variant and sales order type to newREc1
          newREc1.Variant_Code__c=pri1.Variant_Code__c;
          newREc1.Variant__c=pri1.Variant__c;
          newREc1.ComPartner_Code__c=pri1.ComPartner_Code__c;
        newREc1.ComPartner__c=pri1.ComPartner__c;
        newREc1.Plant_Code__c=pri1.Plant_Code__c;
        newREc1.Plant__c=pri1.Plant__c;
        newREc1.Shipping_Condition_Code__c=pri1.Shipping_Condition_Code__c;
        newREc1.Shipping_Condition__c=pri1.Shipping_Condition__c;
        newREc1.Destination_Country_Code__c=pri1.Destination_Country_Code__c;
        newREc1.Destination_Country__c=pri1.Destination_Country__c;
          //<MS20141115>
          newRec1.Project__c=pri1.Disc_Ref__c;
          newREc1.Sales_Order_Type_Code__c=pri1.Sales_Order_Type_Code__c;
          newREc1.Sales_Order_Type__c=pri1.Sales_Order_Type__c;
          //<TJ20150128>
          if(pri1.Pricing_Request__r.Request_Type__c=='Import' && pri1.Pricing_Request__r.Customer_Specific__c==true && (pri1.Pricing_Request__r.On_Behalf_Of__c!=null || pri1.Pricing_Request__r.On_Behalf_Of__c!=''))
          {
            newREc1.OwnerId=custSRMap.get(pri1.Sold_To_Code__c);
            system.debug(custSRMap.get(pri1.Sold_To_Code__c)+' '+newREc1.OwnerId);            
          }
          else
            newREc1.OwnerId=pri1.Pricing_Request__r.OwnerId;                    
          newRec1.Price_Ref_Partner_Code__c=pri1.Price_Ref_Partner_Code__c;
          newRec1.Price_Ref_Partner__c=pri1.Price_Ref_Partner__c;*/
          /*population of KCSAP-try*/
        /*  sObject sObj = (sObject)pri1 ; 
          List<String> kcSplitList =new List<String>();
          newREc1.KC_SAP__c='';
          kcSplitList = pri1.Key_Combination__c.split('/');
          for(String kc:kcSplitList)
          {
            if(('Sales Org.').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
            }
            if(('Division').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
            }
            if(('Dist. Channel').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
            }
            if(('Sold to').equalsIgnoreCase(kc))
            {
              //leading zeros
              String soldTo=String.valueOf(sobj.get('Sold_To_Code__c'));
              if(soldTo <> null) {
                soldTo = (soldTo.leftPad(10)).replaceAll(' ', '0');
                newRec1.KC_SAP__c =newRec1.KC_SAP__c + soldTo;
              }
              //end
            }
            System.debug('*****created mark fr del'+newRec.KC_SAP__c+kc);
            if(('Material').equalsIgnoreCase(kc))
            {
              //leading hashes
              String matCode = String.valueOf(sobj.get('Material_Code__c'));
              if(!String.isBlank(matCode))
                matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
              newRec1.KC_SAP__c =newRec1.KC_SAP__c + matCode;
            }
            System.debug('*****created mark fr del'+newRec.KC_SAP__c+kc);
            if(kc.containsIgnoreCase('PH'))
            {
              if(('PH1').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH1_Code__c'))=='' || String.valueOf(sobj.get('PH1_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH1_Code__c'));
                }
              }
              if(('PH2').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH2_Code__c'))=='' || String.valueOf(sobj.get('PH2_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH2_Code__c'));
                }
              }
              if(('PH3').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH3_Code__c'))=='' || String.valueOf(sobj.get('PH3_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH3_Code__c'));
                }
              }
              if(('PH4').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH4_Code__c'))=='' || String.valueOf(sobj.get('PH4_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH4_Code__c'));
                }
              }
              if(('PH5').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH5_Code__c'))=='' || String.valueOf(sobj.get('PH5_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH5_Code__c'));
                }
              }
              if(('PH6').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH6_Code__c'))=='' || String.valueOf(sobj.get('PH6_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH6_Code__c'));
                }
              }
              if(('PH7').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH7_Code__c'))=='' || String.valueOf(sobj.get('PH7_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                } 
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH7_Code__c'));
                }
              }
              if(('PH8').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH8_Code__c'))=='' || String.valueOf(sobj.get('PH8_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH8_Code__c'));
                }
              }
              if(('PH9').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH9_Code__c'))=='' || String.valueOf(sobj.get('PH9_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH9_Code__c'));
                }
              }
            }
            if(('Sales office').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Sales_Office_Code__c'));
            }
            if(('Ship To').equalsIgnoreCase(kc))
            {
              //leading zeros
              String shipTo=String.valueOf(sobj.get('ShipTo_Code__c'));
              if(shipTo <> null)
              {
                shipTo = (shipTo.leftPad(10)).replaceAll(' ', '0');
                newREc1.KC_SAP__c =newREc1.KC_SAP__c + shipTo;
              }
              //end
            }
            if(('End User').equalsIgnoreCase(kc))
            {
              //leading zeros
              String endUser=String.valueOf(sobj.get('End_User_Code__c'));
              if(endUser <> null)
              {
                endUser = (endUser.leftPad(10)).replaceAll(' ', '0');
                newREc1.KC_SAP__c =newREc1.KC_SAP__c + endUser;
              }
              //end
            }
            if(('Customer Hierarchy').equalsIgnoreCase(kc))
            {
              //leading zeros
              String customerHierarchy=String.valueOf(sobj.get('Customer_Hierarchy_Code__c'));
              if(customerHierarchy <> null)
              {
                customerHierarchy = (customerHierarchy.leftPad(10)).replaceAll(' ', '0');
                newRec.KC_SAP__c =newRec.KC_SAP__c + customerHierarchy;
              }
              //end
            }
            if(('FRB').equalsIgnoreCase(kc))
            {
              //leading zeros
              String frb=String.valueOf(sobj.get('Profit_Center_Code__c'));
              newRec.KC_SAP__c =newRec.KC_SAP__c + frb;
              //end
            }
            if(('Material Price Group').equalsIgnoreCase(kc))
            {
              String mpgCode=String.valueOf(sobj.get('Material_Price_Group_Code__c'));
              if(mpgCode!=null)
              {                    
                if(mpgCode.isNumeric())
                {
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    mpgCode='0'+mpgCode;
                  }
                }
                else
                {
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++){
                    mpgCode=mpgCode+'#';
                  }
                }
              }
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + mpgCode;
            }
            if(('Customer Price Group').equalsIgnoreCase(kc))
            {
              String cpgCode=String.valueOf(sobj.get('Customer_Price_Group_Code__c'));
              if(cpgCode!=null)
              {                    
                if(cpgCode.isNumeric())
                {
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    cpgCode='0'+cpgCode;
                  }
                }
                else
                {
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++)
                  {
                    cpgCode=cpgCode+'#';
                  }
                }
              }
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + cpgCode;
            }
            if(('DiscRef').equalsIgnoreCase(kc) || (('Project Id').equalsIgnoreCase(kc)))
            { 
              //leading zeros
              String projectId=String.valueOf(sobj.get('Disc_Ref__c'));
              if(projectId!=null)
              {
                //project Id should be 12 digit
                projectId = (projectId.leftPad(12)).replaceAll(' ', '0');
                newREc1.KC_SAP__c =newREc1.KC_SAP__c + projectId;
              }
              //end

            }
            if(('Price List Type').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Price_List_Type_Code__c'));
            }
            //<PP20131213>
            if(('Terms of Payment').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Terms_of_Payment_Code__c'));
            }*/
            //<HL20140902> remove
            /*if(('Pricing Request').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Pricing_Request__c'));
            }*/
          /*  if(('Market Segment').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Market_Segment_Code__c'));
            }
            //<MS20140515>Adding conditions for variant and sales order type
            if(('Variant').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Variant_Code__c'));
            }
            if(('Sales Order Type').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
            }
            if(('ComPartner').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('ComPartner_Code__c'));
            }
            if(('Plant').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Plant_Code__c'));
            }
            if(('Shipping Condition').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Shipping_Condition_Code__c'));
            }
            if(('Destination Country').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Destination_Country_Code__c'));
            }
            if(('Price Ref. Partner').equalsIgnoreCase(kc)){
              //leading zeros
              String priceRefPartner=String.valueOf(sobj.get('Price_Ref_Partner_Code__c'));
              if(priceRefPartner <> null)
              {
                priceRefPartner = (priceRefPartner.leftPad(10)).replaceAll(' ', '0');
                newREc1.KC_SAP__c =newREc1.KC_SAP__c + priceRefPartner;
              }
              //end
            }
            if(('Country').equalsIgnoreCase(kc))
            {
              String countryCode=String.valueOf(sobj.get('country_code__c'));
              if(countryCode!=null)
              {
                Integer len=3-countryCode.length();
                for(Integer i=0;i<len;i++)
                {
                  countryCode=countryCode+'#';
                }
              } 

              newRec.KC_SAP__c =newRec.KC_SAP__c + countryCode;
            }
            if(('End Use').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('End_Use_Code__c'));
            }
            if(('Incoterms').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Incoterms_Code__c'));
            }
            //<PP20131028> START
            if(('Ship-To Country').equalsIgnoreCase(kc))
            {
              String shipToCountryCode=String.valueOf(sobj.get('Ship_To_Country_code__c'));
              if(shipToCountryCode!=null)
              {
                Integer len=3-shipToCountryCode.length();
                for(Integer i=0;i<len;i++)
                {
                  shipToCountryCode=shipToCountryCode+'#';
                }
              }

              newRec.KC_SAP__c =newRec.KC_SAP__c + shipToCountryCode;
            }
            //<PP20131028> END
            newREc1.KC_SAP__c.trim(); 
          } */
          /*end*/
          //System.debug('*****created mark fr del'+newRec.KC_SAP__c+kcSplitList);
          upsertList.add(newRec1);
          /** Need to modify holder in case of expire for Project Scenario
                        Since, no expire for Project. Crtl comes to  this flow only when createMarkedFordeletion is true.
                        In this case, it is enuf ot create a record. need not modify the holder
           */
          if(pri1.Pricing_Request_Type__c!='Project')
          {
            holder.Valid_To__c=pri1.New_Valid_To__c;
            upsertList.add(holder);
          }
          //System.debug('*****in expire scenario'+upsertList);
        } 
        /** For  project scenario
                    as project scenario may go into both IF statements..
                    placing it outside the condition
         **/
        if(pri1.Pricing_Request_Type__c=='Project')
        {   //System.debug('***in holder change of project'+pri1.New_Valid_From__c+'neeha'+pri1.New_Valid_To__c);
          holder.Valid_From__c=pri1.New_Valid_From__c;
          holder.Valid_To__c=pri1.New_Valid_To__c;
          upsertList.add(holder);
        }
        /* for proj scenario end**/        
      }  
    }
    //System.debug('****upsertList'+upsertList);   
    /* upserting the list of records. */         
    upsert upsertList;
    //System.debug('****del list'+delList);         
    if(delList.size()!=0)
    {
      delSet=new Set<Id>();
      for(ERP_Sales_Prices_SAP__c d: delList)
      {
        delSet.add(d.Id);
      }
      //System.debug('****del set'+delSet.size()); 
      //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
      //<PP20131022> - Added Terms_of_Payment__c to the query
      //<PP20131028>
      //<MS20140515> Added Variant and SalesOrderType fields in the query
      //<HL20140902> Added Pricing Request filed in the query
      //<SS20220826> Adding Sales Order Item fileds in query
      List<ERP_Sales_Prices_SAP__c> childRecOfDelHolder = [Select Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Pricing_Request__c,markForDeletion__c,KC_SAP__c,Market_Segment_Code__c,Market_Segment__c, Project__c,Variant_Code__c,Variant__c,
                                 ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,
                                 Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,
                                 Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                                 Scaled_Price_Flag__c,  Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, 
                                 Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c,
                                 Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c,
                                 Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c, */ScaleRate9__c,
                                 ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, 
                                 Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                                 Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Record_Id__c, Rate__c, 
                                 Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                                 Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, 
                                 PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c,
                                 PH1__c, PH1_Code__c, PCKC__c, Owning_Business__c, OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                                 LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_User__c, End_User_Code__c, End_Use__c,
                                 End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c, Dist_Channel__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                                 CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
                                 Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c, Price_Ref_Partner__c,Price_Ref_Partner_Code__c From ERP_Sales_Prices_SAP__c WHERE Price_Holder__c IN:delSet];
      //put del records and list of its child records in a map
      for(ERP_Sales_Prices_SAP__c childOfDel:childRecOfDelHolder)
      {
        if(!delHolderChildMap.containskey(childOfDel.Price_Holder__c))
        {
          List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
          l1.add(childOfDel);
          delHolderChildMap.put(childOfDel.Price_Holder__c,l1);
        }      
        else
        { 
          List<ERP_Sales_Prices_SAP__c> delChildList = delHolderChildMap.get(childOfDel.Price_Holder__c);
          delChildList.add(childOfDel);
          delHolderChildMap.put(childOfDel.Price_Holder__c,delChildList);
        }
      }  
      //end
      Set<ERP_Sales_Prices_SAP__c> delHoldersSet= new Set<ERP_Sales_Prices_SAP__c>();
      delHoldersSet=delRecOverLapHolderMap.keySet();          
      for(ERP_Sales_Prices_SAP__c e :delHoldersSet)
      {
        ERP_Sales_Prices_SAP__c newHold=delRecOverLapHolderMap.get(e);
        if(delHolderChildMap.get(e.Id)!=null)
          childRecordsOfDelHolder= delHolderChildMap.get(e.Id);
        for(ERP_Sales_Prices_SAP__c c1:childRecordsOfDelHolder) {
          c1.Price_Holder__c = newHold.Id;
          updatechildRecOfDelHolderList.add(c1);          
        }           
      }   
            System.debug('childRerdDelList%% '+updatechildRecOfDelHolderList+'%%'+updatechildRecOfDelHolderList.size()); 
      //upsert updatechildRecOfDelHolderList;
      Set<ERP_Sales_Prices_SAP__c> updatechildRecOfDelHolderList1= new Set<ERP_Sales_Prices_SAP__c>();
      updatechildRecOfDelHolderList1.addAll(updatechildRecOfDelHolderList);
      system.debug('tttr%%'+updatechildRecOfDelHolderList1);
      List<ERP_Sales_Prices_SAP__c> updatechildRecOfDelHolderList2= new List<ERP_Sales_Prices_SAP__c>();
      updatechildRecOfDelHolderList2.addAll(updatechildRecOfDelHolderList1);
      upsert updatechildRecOfDelHolderList2;
      //System.debug('****updated'+updatechildRecOfDelHolderList);
      //Added the list into set and then assigned back to set to avoid duplicate id's in list
      set<ERP_Sales_Prices_SAP__c> deleteset =new  Set<ERP_Sales_Prices_SAP__c>();
      deleteset.addAll(delList);
      delList = new list<ERP_Sales_Prices_SAP__c>();
      delList.addAll(deleteset);
      if(delList.size()!=0)
        delete delList;                                                        
    }

  } 
  //<VR20130722> Ver 1.2 VR 2013-07-22 APAC Rollout2-Added the if condition for Non SAP Records
  if(pricingReqIdSetNonSAP.size()>0)  
  {  

    Integer flag;
    Boolean deleteLogic=false;

    //To hold the instance of the price holder
    Sales_Prices__c holder = new Sales_Prices__c();
    //To hold the instance of newly created holder
    Sales_Prices__c newholder =new Sales_Prices__c();
    //To hold the instance of Holder to be extended in case of overlapping holders
    Sales_Prices__c holder1=new Sales_Prices__c();
    //To hold the instance of Holder to be deleted in case of overlapping holders
    Sales_Prices__c holder2=new Sales_Prices__c();
    //To hold the instance of the new pricing Record

    Sales_Prices__c newRec=new Sales_Prices__c();


    //List to hold the appropriate Holders
    List<Sales_Prices__c> appHolderList=new List<Sales_Prices__c >();
    //List to hold the child records of the holder to be deleted
    List<Sales_Prices__c> updatechildRecOfDelHolderList= new List<Sales_Prices__c>();
    //List to hold the pricing records to be upserted
    List<Sales_Prices__c> upsertList =new  List<Sales_Prices__c>();
    //List to hold the holder to be deleted   
    List<Sales_Prices__c> delList =new  List<Sales_Prices__c>();
    List<Sales_Prices__c> validFromList =new List<Sales_Prices__c>();
    List<Sales_Prices__c> validToList =new List<Sales_Prices__c>();
    List<Sales_Prices__c> updateApprovedPRIList =new List<Sales_Prices__c>();
    List<Sales_Prices__c> childRecordsOfDelHolder=new List<Sales_Prices__c>();
    List<Sales_Prices__c> holdList=new List<Sales_Prices__c>();   

    Set<Id> delSet=new Set<Id>();
    Set<Id> approvedPRISet =new Set<Id>(); 
    Set<String> concateKCSet =new Set<String>(); 
    Set<String> pcSet =new Set<String>();  
    Set<String> kcSet =new Set<String>();
    Set<String> externalConcateSet = new Set<String>();

    //define a parent price holder Set.

    Map<String,List<Sales_Prices__c>> linkedPCKCHoldersMap =new Map<String,List<Sales_Prices__c>>();
    Map<String,List<Sales_Prices__c>> HolderChildMap =new Map<String,List<Sales_Prices__c>>();
    Map<String,List<Sales_Prices__c>> delHolderChildMap =new Map<String,List<Sales_Prices__c>>();
    Map<Sales_Prices__c,Sales_Prices__c> delRecOverLapHolderMap= new Map<Sales_Prices__c,Sales_Prices__c>();
    Map<Pricing_Request_Item__c,Sales_Prices__c> mapOfpriAndHolder =new  Map<Pricing_Request_Item__c,Sales_Prices__c> ();
    system.debug('BU: '+BU_Name+'  Salesorg name '+SalesOrg_Name);
    List<OrgGroup__c> OwnerList=[SELECT OwnerId FROM OrgGroup__c where Business__c=:BU_Name];
    RequestOwnerId=OwnerList[0].OwnerId;
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    //<BB20130726> --Ver 1.3 Added Sales_Type__c,Sales_Type_Code__c  in the query
    //<MS20140515> Added Variant and SalesOrderType fields in the query
    //<SS20220826> Adding Sales Order Item fileds in query
    List<Pricing_Request_Item__c> priApprovedList= [SELECT New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,New_Volume__c,
                            New_Volume_UoM__c,country_code__c,Ship_To_Country__c,Ship_To_Country_Code__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,
                            ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                            Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Valid_To__c,BU__c, Valid_From__c, UoM__c, Unit__c, 
                            Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                            Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, 
                            Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c,
                            ShipTo_Code__c, Scaled_Price_Flag__c, Scale_UoM_Scale_Unit__c, Scale_Type__c, Scale_Type_Code__c, 
                            Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, 
                            Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, 
                            Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c,*/ ScaleRate9__c,
                            ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, 
                            ScaleRate10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                            Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c, Profit_Center__c,
                            Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Task_UoM__c, Pricing_Request__c,
                            Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c,
                            Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c,
                            PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, 
                            PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,
                            New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate,
                            LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, 
                            Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c,
                            Edit__c, ERP_Sales_Prices_SAP__c, ERP_Pricing_Procedure__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, 
                            Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CurrencyIsoCode,CreatedDate,
                            CreatedById, Country__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c,
                            Below_Reference_Price__c, Below_Reference_Flag__c, Below_Floor_Price__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, 
                            Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, 
                            Approver1_Date__c, Approved_Date__c, Approval_Status__c ,Pricing_Request__r.OwnerId,Price_Ref_Partner__c,Price_Ref_Partner_Code__c,
                            ERP_Pricing_Procedure__r.SAP_Cluster__c
                            FROM Pricing_request_item__c where Pricing_Request__c IN :pricingReqIdSetNonSAP];

    /* 
                    Iterate through the Request Items and populate
                    PCSet,KCSet,PCKC__c set.
     */

    for(Pricing_Request_Item__c pri: priApprovedList){
      concateKCSet.add(pri.PCKC__c);
      pcSet.add(pri.Pricing_Condition_Code__c);
      kcSet.add(pri.Key_Combination_Code__c);
      String externalConcate = pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c;
      externalConcateSet.add(externalConcate);
    }

    /* 
                    Query all the holders of the pricing request Items available in the priApprovedList based on the PCKC set etc
     */ 
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    //<HL20140902> Added Pricing Request filed in the query
    List<Sales_Prices__c> holderList=[Select Ship_To_Country_Code__c,Pricing_Request__c,Ship_To_Country__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,
                      Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,                                             
                      Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,
                      Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Rate__c, 
                      Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                      Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, 
                      PH8_Code__c,PH7_Code__c,  PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c,
                      PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                      LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id,  End_Use__c,
                      End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c,  Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                      CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c,
                      Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c, ComPartner__c, ComPartner_Code__c 
                      From Sales_Prices__c  WHERE External_ERP_ID__c IN:externalConcateSet AND Pricing_Condition_Code__c=:pcSet AND Key_Combination_Code__c=:kcSet  AND PCKC__c IN :concateKCSet  AND Price_Holder__c=null AND isPriceHolder__c=true];

    //System.debug('****entire holder list'+holderList);
    /* 
            Iterate through the holder list and obtain the corresponding list of holders for each PCKC concate.
            i.e populate 'linkedPCKCHoldersMap' with PCKC__c as key and the holder as value.
     */ 
    for(Sales_Prices__c h:holderList){           
      if(!linkedPCKCHoldersMap.containskey(h.PCKC__c)){
        //System.debug('*****in if');
        List<Sales_Prices__c> l=new List<Sales_Prices__c>();
        l.add(h);
        linkedPCKCHoldersMap.put(h.PCKC__c,l);
      }      
      else{        
        //System.debug('*****in else');
        List<Sales_Prices__c> hList = linkedPCKCHoldersMap.get(h.PCKC__c);
        hList.add(h);
        linkedPCKCHoldersMap.put(h.PCKC__c,hList);
      }
    }
    //System.debug('****linkedPCKCHoldersMap'+linkedPCKCHoldersMap);

    /* 
            Query to get the pricing records whose parent is same as holder List.
     */ 
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    //<HL20140902> Added Pricing Request filed in the query
    List<Sales_Prices__c> linkedPricingRecords=[Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,
                          Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c,Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,                                                 
                          Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,
                          Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Rate__c, 
                          Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                          Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, 
                          PH8_Code__c,PH7_Code__c,  PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c,
                          PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                          LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id,  End_Use__c,
                          End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c,  Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                          CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c,
                          Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c,ComPartner__c, ComPartner_Code__c 
                          From Sales_Prices__c WHERE Price_Holder__c=: holderList];


    /* 
                    Iterate through pricing Request Items decide on the priceHolder
     */ 
    for(Pricing_Request_Item__c pri: priApprovedList)
    {                
      holder=new Sales_Prices__c();
      newHolder=new Sales_Prices__c();
      deleteLogic=false;

      //System.debug('****pricing request Item'+pri);
      holdList=new List<Sales_Prices__c>();    //can be removed         
      /**
                This logic decides the holder based on the PCKC of the Request item.
                    1. Whether a holder exists or not for the PCKC 
                    2. If holder exists, is it the appropriate holder or not
                    3. If exists, decide the holder, else create a new one.

       **/
      if(linkedPCKCHoldersMap.containsKey(pri.PCKC__c))
      {
        holdList=new List<Sales_Prices__c>();
        holdList = linkedPCKCHoldersMap.get(pri.PCKC__c).deepClone(true);
        holdList=PAUtil.sortList(holdList,'Valid_To__c','desc');                        
      }
      else{
        // no holder present fot the PCKC of the request Item.                        
        newholder= new Sales_Prices__c();     
        newholder=Trig_validatePriceAUNewUtil.createNonSAPHolderFromItem(pri,RequestOwnerId);                 
        /*newholder.Valid_From__c = pri.New_Valid_From__c;
        newholder.Valid_To__c = pri.New_Valid_To__c;  
        newHolder.Approved_Date__c=System.now();
        newHolder.BU__c=pri.BU__c;
        //newHolder.Markup_Percentage__c = pri.New_Markup_Percentage__c;
        //newHolder.Base_Floor__c = pri.New_Base_Floor__c;
        newHolder.Calculation_Type_Code__c =pri.Calculation_Type_Code__c;
        newHolder.Calculation_Type__c=pri.Calculation_Type__c;               
        newHolder.Condition_Class__c=pri.Condition_Class__c;
        newHolder.Condition_Class_Code__c=pri.Condition_Class_Code__c;
        newHolder.Country__c = pri.Country__c;
        newHolder.Country_code__c = pri.Country_Code__c; 
        newHolder.Customer_Price_Group__c = pri.Customer_Price_Group__c;
        newHolder.Customer_Price_Group_Code__c = pri.Customer_Price_Group_Code__c;
        newHolder.Dist_Channel__c = pri.Dist_Channel__c;
        newHolder.Dist_Channel_Code__c = pri.Dist_Channel_Code__c;
        newHolder.Division__c = pri.Division__c;
        newHolder.Division_Code__c = pri.Division_Code__c;
        newHolder.End_Use__c =  pri.End_Use__c;
        newHolder.End_Use_Code__c = pri.End_Use_Code__c;
        newHolder.Profit_Center__c = pri.Profit_Center__c;
        newHolder.Profit_Center_Code__c = pri.Profit_Center_Code__c;
        newHolder.Incoterms1__c = pri.Inco_terms__c;                   
        newHolder.Incoterms_1_Code__c = pri.Incoterms_Code__c; 
        newHolder.Key_Combination__c=pri.Key_Combination__c;
        //<PR20140908> START
        if(pri.Key_Combination_Code__c != null && pri.Key_Combination_Code__c.length() > 4)
          newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c.substring(0,4);
        else
        newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
        //<PR20140908> END
        //newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
        newHolder.Material__c = pri.Material__c;
        newHolder.Material_Code__c = pri.Material_Code__c;
        newHolder.Material_Price_Group__c = pri.Material_Price_Group__c;
        newHolder.Material_Price_Group_Code__c = pri.Material_Price_Group_Code__c;
        newHolder.PH1_Code__c = pri.PH1_Code__c;
        newHolder.PH2_Code__c = pri.PH2_Code__c;
        newHolder.PH3_Code__c = pri.PH3_Code__c;
        newHolder.PH4_Code__c = pri.PH4_Code__c;
        newHolder.PH5_Code__c = pri.PH5_Code__c;
        newHolder.PH6_Code__c = pri.PH6_Code__c;
        newHolder.PH7_Code__c = pri.PH7_Code__c;
        newHolder.PH8_Code__c = pri.PH8_Code__c;
        newHolder.PH9_Code__c = pri.PH9_Code__c;
        newHolder.Plus_Minus__c=pri.Plus_Minus__c;
        newHolder.Plus_Minus_Code__c=pri.Plus_Minus_Code__c;
        newHolder.Price_List_Type__c = pri.Price_List_Type__c;
        newHolder.Price_List_Type_Code__c = pri.Price_List_Type_Code__c;
        newHolder.Pricing_Condition__c=pri.Pricing_Condition__c;
        newHolder.Pricing_Condition_Code__c=pri.Pricing_Condition_Code__c;
        newHolder.Product_Hierarchy__c = pri.Product_Hierarchy__c;
        newHolder.Sales_Office__c = pri.Sales_Office__c;
        newHolder.Sales_Office_Code__c = pri.Sales_Office_Code__c;
        newHolder.Sales_Org__c = pri.Sales_Org__c;
        newHolder.Sales_Org_Code__c = pri.Sales_Org_Code__c;
        newHolder.Sales_Pricing_Procedure__c=pri.ERP_Pricing_Procedure__c;  
        newHolder.Sales_Price_Type__c=pri.Pricing_Request_Type__c;     
        newHolder.SAP_Application_Id__c =pri.SAP_Application_Id__c;
        newHolder.SAP_Client_ID__c=pri.SAP_Client_ID__c;
        newHolder.SAP_Cluster__c= pri.SAP_Cluster__c;
        newHolder.Sold_To__c=pri.Sold_To__c;   
        newHolder.Sold_To_Code__c=pri.Sold_To_Code__c;
        newHolder.Terms_Of_Payment_Code__c = pri.Terms_of_Payment_Code__c;
        newHolder.OwnerId=RequestOwnerId;  
        newHolder.isPriceHolder__c=true; 
        //<HL20140902-Start>
                newHolder.Pricing_request__c=pri.Pricing_request__c;
                //<HL20140902-End>
        //<MS20140523> Added Marker segment, variant and sales order type to holder
        newHolder.Market_Segment__c=pri.Market_Segment__c;
        newHolder.Market_Segment_Code__c=pri.Market_Segment_Code__c;
        newHolder.Variant__c=pri.Variant__c;
        newHolder.Variant_Code__c=pri.Variant_Code__c;
        newHolder.ComPartner_Code__c=pri.ComPartner_Code__c;
        newHolder.ComPartner__c=pri.ComPartner__c;
        newHolder.Plant_Code__c=pri.Plant_Code__c;
        newHolder.Plant__c=pri.Plant__c;
        newHolder.Shipping_Condition_Code__c=pri.Shipping_Condition_Code__c;
        newHolder.Shipping_Condition__c=pri.Shipping_Condition__c;
        newHolder.Destination_Country_Code__c=pri.Destination_Country_Code__c;
        newHolder.Destination_Country__c=pri.Destination_Country__c;
        //<MS20141115>
        newHolder.Project__c=pri.Disc_Ref__c;
        newHolder.Sales_Order_Type__c=pri.Sales_Order_Type__c;
        newHolder.Sales_Order_Type_Code__c=pri.Sales_Order_Type_Code__c; ;*/
        /* populating into mapOfpriAndHolder with req Item as key and holder details as value*/
        mapOfpriAndHolder.put(pri,newHolder);                             
      }
      /*
             Check the holdList, to decide whether a valid/appropriate holder is present
       */          
      if(holdList.size()!=0){
        flag=0;
        Integer counter=0;
        appHolderList=new List<Sales_Prices__c>();
        /*The for loop iterates through the holders and decide the one vch overlapps with the dates of request item*/
        /* pri.New_Valid_From__c <= holdList.get(i).Valid_To__c+1 VIMP
                If a PRI VF/VTO is jus one day before/after the holder validity..no creation of holder**
                update the same holder
         */
        for(Integer i=0;i<holdList.size();i++){
          if(((pri.New_Valid_From__c >= holdList.get(i).Valid_From__c && pri.New_Valid_From__c <= holdList.get(i).Valid_To__c+1) || (pri.New_Valid_To__c >= holdList.get(i).Valid_From__c-1 && pri.New_Valid_To__c <= holdList.get(i).Valid_To__c))||((holdList.get(i).Valid_From__c >=pri.New_Valid_From__c && holdList.get(i).Valid_From__c <=pri.New_Valid_To__c)||(holdList.get(i).Valid_To__c>=pri.New_Valid_From__c &&holdList.get(i).Valid_From__c <= pri.New_Valid_To__c))){   
            appHolderList.add(holdList.get(i));         
          }
        }
        if(appHolderList!=null && appHolderList.size()==0){

          /* No appropriate holder -create one*/
          newholder= new Sales_Prices__c();
          newholder=Trig_validatePriceAUNewUtil.createNonSAPHolderFromItem(pri,RequestOwnerId);  
        /*  newholder.isPriceHolder__c =true;
          newholder.Valid_From__c = pri.New_Valid_From__c;
          newholder.Valid_To__c = pri.New_Valid_To__c;  
          newHolder.Approved_Date__c=System.now();
          newHolder.BU__c=pri.BU__c;
          //newHolder.Markup_Percentage__c = pri.New_Markup_Percentage__c;
          //newHolder.Base_Floor__c = pri.New_Base_Floor__c;
          newHolder.Calculation_Type_Code__c =pri.Calculation_Type_Code__c;
          newHolder.Calculation_Type__c=pri.Calculation_Type__c;
          newHolder.Condition_Class__c=pri.Condition_Class__c;
          newHolder.Condition_Class_Code__c=pri.Condition_Class_Code__c;
          newHolder.Plus_Minus__c=pri.Plus_Minus__c;
          newHolder.Plus_Minus_Code__c=pri.Plus_Minus_Code__c;
          newHolder.Country__c = pri.Country__c;
          newHolder.Country_code__c = pri.Country_Code__c; 
          newHolder.Customer_Price_Group__c = pri.Customer_Price_Group__c;
          newHolder.Customer_Price_Group_Code__c = pri.Customer_Price_Group_Code__c;
          newHolder.Dist_Channel__c = pri.Dist_Channel__c;
          newHolder.Dist_Channel_Code__c = pri.Dist_Channel_Code__c;
          newHolder.Division__c = pri.Division__c;
          newHolder.Division_Code__c = pri.Division_Code__c;
          newHolder.End_Use__c =  pri.End_Use__c;
          newHolder.End_Use_Code__c = pri.End_Use_Code__c;
          newHolder.Profit_Center__c = pri.Profit_Center__c;
          newHolder.Profit_Center_Code__c = pri.Profit_Center_Code__c;
          newHolder.Incoterms1__c = pri.Inco_terms__c;                   
          newHolder.Incoterms_1_Code__c = pri.Incoterms_Code__c; 
          newHolder.Key_Combination__c=pri.Key_Combination__c;
          //<PR20140908> START
          if(pri.Key_Combination_Code__c != null && pri.Key_Combination_Code__c.length() > 4)
            newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c.substring(0,4);
          else
          newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
          //<PR20140908> END    
          //newHolder.Key_Combination_Code__c=pri.Key_Combination_Code__c;
          newHolder.Material__c = pri.Material__c;
          newHolder.Material_Code__c = pri.Material_Code__c;
          newHolder.Material_Price_Group__c = pri.Material_Price_Group__c;
          newHolder.Material_Price_Group_Code__c = pri.Material_Price_Group_Code__c;
          newHolder.PH1_Code__c = pri.PH1_Code__c;
          newHolder.PH2_Code__c = pri.PH2_Code__c;
          newHolder.PH3_Code__c = pri.PH3_Code__c;
          newHolder.PH4_Code__c = pri.PH4_Code__c;
          newHolder.PH5_Code__c = pri.PH5_Code__c;
          newHolder.PH6_Code__c = pri.PH6_Code__c;
          newHolder.PH7_Code__c = pri.PH7_Code__c;
          newHolder.PH8_Code__c = pri.PH8_Code__c;
          newHolder.PH9_Code__c = pri.PH9_Code__c;
          newHolder.Price_List_Type__c = pri.Price_List_Type__c;
          newHolder.Price_List_Type_Code__c = pri.Price_List_Type_Code__c;
          newHolder.Pricing_Condition__c=pri.Pricing_Condition__c;
          newHolder.Pricing_Condition_Code__c=pri.Pricing_Condition_Code__c;
          newHolder.Product_Hierarchy__c = pri.Product_Hierarchy__c;
          newHolder.Sales_Office__c = pri.Sales_Office__c;
          newHolder.Sales_Office_Code__c = pri.Sales_Office_Code__c;
          newHolder.Sales_Org__c = pri.Sales_Org__c;
          newHolder.Sales_Org_Code__c = pri.Sales_Org_Code__c;   
          newHolder.Sales_Price_Type__c=pri.Pricing_Request_Type__c;              
          newHolder.Sales_Pricing_Procedure__c=pri.ERP_Pricing_Procedure__c;
          newHolder.SAP_Application_Id__c =pri.SAP_Application_Id__c;
          newHolder.SAP_Client_ID__c=pri.SAP_Client_ID__c;
          newHolder.SAP_Cluster__c= pri.SAP_Cluster__c;                    
          newHolder.Sold_To_Code__c=pri.Sold_To_Code__c;
          newHolder.Sold_To__c=pri.Sold_To__c; 
          newHolder.Terms_Of_Payment_Code__c = pri.Terms_of_Payment_Code__c;  
          newHolder.OwnerId=RequestOwnerId;    
          //<HL20140902-Start>
                    newHolder.Pricing_request__c=pri.Pricing_request__c;
                    //<HL20140902-End>  
          //<MS20140523> Added Marker segment, variant and sales order type to holder
          newHolder.Market_Segment__c=pri.Market_Segment__c;
          newHolder.Market_Segment_Code__c=pri.Market_Segment_Code__c;
          newHolder.Variant__c=pri.Variant__c;
          newHolder.Variant_Code__c=pri.Variant_Code__c;
          newHolder.ComPartner_Code__c=pri.ComPartner_Code__c;
        newHolder.ComPartner__c=pri.ComPartner__c;
        newHolder.Plant_Code__c=pri.Plant_Code__c;
        newHolder.Plant__c=pri.Plant__c;
        newHolder.Shipping_Condition_Code__c=pri.Shipping_Condition_Code__c;
        newHolder.Shipping_Condition__c=pri.Shipping_Condition__c;
        newHolder.Destination_Country_Code__c=pri.Destination_Country_Code__c;
        newHolder.Destination_Country__c=pri.Destination_Country__c;
          //<MS20141115>
          newHolder.Project__c=pri.Disc_Ref__c;
          newHolder.Sales_Order_Type__c=pri.Sales_Order_Type__c;
          newHolder.Sales_Order_Type_Code__c=pri.Sales_Order_Type_Code__c;   */            
          mapOfpriAndHolder.put(pri,newHolder);     
        }
        //If size==1, there is only one approppriate holder
        else if(appHolderList!=null && appHolderList.size()==1){
          holder =appHolderList.get(0);
          flag=1; 
          mapOfpriAndHolder.put(pri,holder);
        }
        else{
          //more than one appropriate holder
          //sort the appHolderList valid To asc
          //1st rec would be the final holder for the record
          //add it into the map of pri,holder
          //what happens to the remianing holders and their childern??
          //add all the remaning holders to the list.
          //add them to a map with key as parent holder and value as the list of holders to be deleted
          appHolderList= PAUtil.sortList(appHolderList, 'Valid_To__c','asc');
          if(appHolderList!=null && appHolderList.size()!=0){
            holder=appHolderList.get(0);
            mapOfpriAndHolder.put(pri,holder);
          }
          for(Integer i=1;i<appHolderList.size();i++){
            delList.add(appHolderList.get(i));
            delRecOverLapHolderMap.put(appHolderList.get(i),appHolderList.get(0));
          }

        }

      }
    }
    //System.debug('****mapOfpriAndHolder'+mapOfpriAndHolder); 
    Set<Sales_Prices__c> upsertHolderSet=new Set<Sales_Prices__c>();
    List<Sales_Prices__c> upsertHolderList =new   List<Sales_Prices__c>();
    Map<Id,Sales_Prices__c> idHolderMap=new  Map<Id,Sales_Prices__c>();
    //System.debug('****mapOfpriAndHolder size'+mapOfpriAndHolder.size()); 
    for(Sales_Prices__c erp:mapOfpriAndHolder.values()){
      upsertHolderSet.add(erp);
    }
    //System.debug('****upsertHolderSet '+upsertHolderSet); 
    //System.debug('****upsertHolderSet size'+upsertHolderSet.size()); 
    for(Sales_Prices__c e1:upsertHolderSet){
      upsertHolderList.add(e1);
    }
    //System.debug('****upsertHolderList size'+upsertHolderList.size()); 
    /**            
                Upserts all the holders
     **/
    upsert upsertHolderList;
    //System.debug('**upsertHolderList'+upsertHolderList);

    /**            
                Query all the holders
     **/
    //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
        //<HL20140902> Added Pricing Request filed in the query
    List<Sales_Prices__c> allHoldersList=[Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,
                        Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, Contract__c,Contract_Code__c,FixValDate__c,KCode__c,Campaign__c,Campaign_Code__c,Disc_Ref_No__c,Partner_ZF__c,Partner_ZF_Code__c,Payer__c,Payer_Code__c,Sales_District__c,Sales_District_Code__c,State__c,State_Code__c,Material_Group_1__c,Material_Group_1_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Document_Currency__c,Document_Currency_Code__c,                                                
                        Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,
                        Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Rate__c, 
                        Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                        Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, 
                        PH8_Code__c,PH7_Code__c,  PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c,
                        PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                        LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id,  End_Use__c,
                        End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c,  Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                        CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c,
                        Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c,ComPartner__c,ComPartner_Code__c  From Sales_Prices__c WHERE Id=: upsertHolderList];
    /*
        populate idHolderMap with id of the holder as key and the holder instance as value
     */ 
    for(Sales_Prices__c erphold:allHoldersList)
    {
      idHolderMap.put(erphold.Id,erphold);
    }

    /*
        Iterate through pri get the holder
     */      
    Boolean createMarkedForDeletionRec=false;
    for(Pricing_Request_Item__c pri1:mapOfpriAndHolder.keySet()){

      //intially it is false, becomes true when the condition is satisfied
      createMarkedForDeletionRec=false;
      if(mapOfpriAndHolder.get(pri1)!=null && idHolderMap.containsKey(mapOfpriAndHolder.get(pri1).Id))
      {   
        holder= idHolderMap.get(mapOfpriAndHolder.get(pri1).Id);
      }
      else {
        holder=new Sales_Prices__c();
      }
      if(holder!=null && holder.Id!=null)
      {
        if(!pri1.expire__c)
        {
          //instantiate a new record
          newRec= new Sales_Prices__c();
          newRec=Trig_validatePriceAUNewUtil.createNonSAPPriceFromItem(pri1,RequestOwnerId);
          newRec.Price_Holder__c=holder.Id;  


          if((pri1.New_Valid_To__c > holder.Valid_to__c || pri1.New_Valid_From__c < holder.Valid_From__c ) && pri1.Pricing_Request_Type__c!='Project' )
          {
            if(pri1.New_Valid_To__c > holder.Valid_to__c)
            {
              holder.Valid_To__c=pri1.New_Valid_To__c;
            }
            if(pri1.New_Valid_From__c < holder.Valid_From__c)
            {
              holder.Valid_From__c=pri1.New_Valid_From__c; 
            }
            //add the holder into upsertList
            upsertList.add(holder);
          } 

          //newly added--irrespective of date/  rate change..          
        /*  newRec.Valid_From__c = pri1.New_Valid_From__c;
          newRec.Valid_To__c = pri1.New_Valid_To__c;
          newRec.Approved_Date__c=System.now();
          newREc.Calculation_Type_Code__c =pri1.Calculation_Type_Code__c;
          newREc.Calculation_Type__c=pri1.Calculation_Type__c;
          newREc.Condition_Class__c=pri1.Condition_Class__c;
          newREc.Condition_Class_Code__c=pri1.Condition_Class_Code__c;
          newRec.BU__c=pri1.BU__c; 
          //newRec.Markup_Percentage__c = pri1.New_Markup_Percentage__c;
          //newRec.Base_Floor__c = pri1.New_Base_Floor__c;
          newREc.Plus_Minus__c=pri1.Plus_Minus__c;
          newREc.Plus_Minus_Code__c=pri1.Plus_Minus_Code__c;
          newREc.Country__c = pri1.Country__c;
          newREc.Country_code__c = pri1.Country_Code__c;
          newREc.Customer_Price_Group__c = pri1.Customer_Price_Group__c;
          newREc.Customer_Price_Group_Code__c = pri1.Customer_Price_Group_Code__c; 
          newREc.Dist_Channel__c = pri1.Dist_Channel__c;
          newREc.Dist_Channel_Code__c = pri1.Dist_Channel_Code__c;
          newREc.Division__c = pri1.Division__c;
          newREc.Division_Code__c = pri1.Division_Code__c;
          newREc.End_Use__c =  pri1.End_Use__c;
          newREc.End_Use_Code__c = pri1.End_Use_Code__c;
          newREc.Incoterms1__c = pri1.Inco_terms__c;           
          newREc.Incoterms_1_Code__c = pri1.Incoterms_Code__c;
          newRec.Key_Combination__c=pri1.Key_Combination__c;
          //<PR20140908> START
          if(pri1.Key_Combination_Code__c != null && pri1.Key_Combination_Code__c.length() > 4)
            newRec.Key_Combination_Code__c=pri1.Key_Combination_Code__c.substring(0,4);
          else
          newRec.Key_Combination_Code__c=pri1.Key_Combination_Code__c;
          //<PR20140908> END
          //newRec.Key_Combination_Code__c=pri1.Key_Combination_Code__c;
          newREc.Material__c = pri1.Material__c;
          newREc.Material_Code__c = pri1.Material_Code__c;
          newREc.Material_Price_Group__c = pri1.Material_price_Group__c;
          newREc.Material_Price_Group_Code__c = pri1.Material_Price_Group_Code__c;
          newRec.Per__c=pri1.New_Per__c;
          newREc.PH1_Code__c = pri1.PH1_Code__c;
          newREc.PH2_Code__c = pri1.PH2_Code__c;
          newREc.PH3_Code__c = pri1.PH3_Code__c;
          newREc.PH4_Code__c = pri1.PH4_Code__c;
          newREc.PH5_Code__c = pri1.PH5_Code__c;
          newREc.PH6_Code__c = pri1.PH6_Code__c;
          newREc.PH7_Code__c = pri1.PH7_Code__c;
          newREc.PH8_Code__c = pri1.PH8_Code__c;
          newREc.PH9_Code__c = pri1.PH9_Code__c;
          newREc.Price_List_Type__c = pri1.Price_List_Type__c;
          newREc.Price_List_Type_Code__c = pri1.Price_List_Type_Code__c;
          newREc.Pricing_Condition__c = pri1.Pricing_Condition__c;
          newREc.Pricing_Condition_Code__c = pri1.Pricing_Condition_Code__c;
          newREc.Product_Hierarchy__c = pri1.Product_Hierarchy__c;
          newREc.Profit_Center__c = pri1.Profit_Center__c;
          newREc.Profit_Center_Code__c = pri1.Profit_Center_Code__c;         
          newREc.Rate__c=pri1.New_Rate__c;
          newREc.Sales_Office__c = pri1.Sales_Office__c;
          newREc.Sales_Office_Code__c = pri1.Sales_Office_Code__c;
          newREc.Sales_Org__c = pri1.Sales_Org__c;
          newREc.Sales_Org_Code__c = pri1.Sales_Org_Code__c;
          newREc.Sales_Price_Type__c=pri1.Pricing_Request_Type__c;                  
          newREc.Sales_Pricing_Procedure__c=pri1.ERP_Pricing_Procedure__c;
          newREc.Check_Scale__c=pri1.Check_Scale__c;
          newREc.Check_Scale_Code__c=pri1.Check_Scale_Code__c;
          newREc.Scale_Basis__c=pri1.Scale_Basis__c;
          newREc.Scale_Basis_Code__c=pri1.Scale_Basis_Code__c;
          newREc.Scaled_Price_Flag__c=pri1.Scaled_Price_Flag__c; 
          newREc.Scale_Quantity_Scale_Value1__c=pri1.Scale_Quantity_Scale_Value1__c;
          newREc.Scale_Quantity_Scale_Value10__c=pri1.Scale_Quantity_Scale_Value10__c;
          newREc.Scale_Quantity_Scale_Value2__c=pri1.Scale_Quantity_Scale_Value2__c;
          newREc.Scale_Quantity_Scale_Value3__c=pri1.Scale_Quantity_Scale_Value3__c;
          newREc.Scale_Quantity_Scale_Value4__c=pri1.Scale_Quantity_Scale_Value4__c;
          newREc.Scale_Quantity_Scale_Value5__c=pri1.Scale_Quantity_Scale_Value5__c;
          newREc.Scale_Quantity_Scale_Value6__c=pri1.Scale_Quantity_Scale_Value6__c;
          newREc.Scale_Quantity_Scale_Value7__c=pri1.Scale_Quantity_Scale_Value7__c;
          newREc.Scale_Quantity_Scale_Value8__c=pri1.Scale_Quantity_Scale_Value8__c;
          newREc.Scale_Quantity_Scale_Value9__c=pri1.Scale_Quantity_Scale_Value9__c;
          newREc.ScaleRate1__c=pri1.ScaleRate1__c;
          newREc.ScaleRate10__c=pri1.ScaleRate10__c;
          newREc.ScaleRate2__c=pri1.ScaleRate2__c;
          newREc.ScaleRate3__c=pri1.ScaleRate3__c;
          newREc.ScaleRate4__c=pri1.ScaleRate4__c;
          newREc.ScaleRate5__c=pri1.ScaleRate5__c;
          newREc.ScaleRate6__c=pri1.ScaleRate6__c;
          newREc.ScaleRate7__c=pri1.ScaleRate7__c;
          newREc.ScaleRate8__c=pri1.ScaleRate8__c;
          newREc.ScaleRate9__c=pri1.ScaleRate9__c;
          newREc.Scale_Type__c=pri1.Scale_Type__c;
          newREc.Scale_Type_Code__c=pri1.Scale_Type_Code__c;
          newREc.Scale_UoM_Scale_Unit__c=pri1.Scale_UoM_Scale_Unit__c;
          newRec.ShipTo_Code__c=pri1.ShipTo_Code__c;
          newRec.ShipTo__c=pri1.ShipTo__c;
          newRec.Sold_To__c=pri1.Sold_To__c;
          newRec.Sold_To_Code__c=pri1.Sold_To_Code__c;
          newREc.SAP_Application_Id__c = pri1.SAP_Application_Id__c;
          newREc.SAP_Client_Id__c = pri1.SAP_Client_ID__c;
          newREc.SAP_Cluster__c= pri1.SAP_Cluster__c;                    
          newRec.Sold_To__c=pri1.Sold_To__c;
          newRec.Sold_To_Code__c=pri1.Sold_To_Code__c;
          newREc.Terms_Of_Payment_Code__c = pri1.Terms_of_Payment_Code__c;
          newREc.UoM__c=pri1.New_UoM__c;
          newREc.Unit__c=pri1.New_Unit__c;
          newREc.OwnerId=RequestOwnerId; 
          //<HL20140902-Start>
                    newREc.Pricing_request__c=pri1.Pricing_request__c;
                    //<HL20140902-End>
          //<MS20140523> Added Marker segment, variant and sales order type to holder
          newREc.Market_Segment__c=pri1.Market_Segment__c;
          newREc.Market_Segment_Code__c=pri1.Market_Segment_Code__c;
          newREc.Variant__c=pri1.Variant__c;
          newREc.Variant_Code__c=pri1.Variant_Code__c;
          newREc.ComPartner_Code__c=pri1.ComPartner_Code__c;
        newREc.ComPartner__c=pri1.ComPartner__c;
        newREc.Plant_Code__c=pri1.Plant_Code__c;
        newREc.Plant__c=pri1.Plant__c;
        newREc.Shipping_Condition_Code__c=pri1.Shipping_Condition_Code__c;
        newREc.Shipping_Condition__c=pri1.Shipping_Condition__c;
        newREc.Destination_Country_Code__c=pri1.Destination_Country_Code__c;
        newREc.Destination_Country__c=pri1.Destination_Country__c;
          //<MS20141115>
          newRec.Project__c=pri1.Disc_Ref__c;
          newREc.Sales_Order_Type__c=pri1.Sales_Order_Type__c;
          newREc.Sales_Order_Type_Code__c=pri1.Sales_Order_Type_Code__c;*/
          /*population of KCSAP-try*/
      /*    sObject sObj = (sObject)pri1 ; 
          List<String> kcSplitList =new List<String>();
          newRec.KC_SAP__c='';
          kcSplitList = pri1.Key_Combination__c.split('/');
          for(String kc:kcSplitList){
            if(('Sales Org.').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
            }
            if(('Division').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
            }
            if(('Dist. Channel').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
            }
            if(('Material').equalsIgnoreCase(kc)){
            //  leading hashes
              String matCode = String.valueOf(sobj.get('Material_Code__c'));
              if(!String.isBlank(matCode))
                matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
              newRec.KC_SAP__c =newRec.KC_SAP__c + matCode;
            }
            if(kc.containsIgnoreCase('PH')){
              if(('PH1').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH1_Code__c'))=='' || String.valueOf(sobj.get('PH1_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH1_Code__c'));
                }
              }
              if(('PH2').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH2_Code__c'))=='' || String.valueOf(sobj.get('PH2_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH2_Code__c'));
                }
              }
              if(('PH3').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH3_Code__c'))=='' || String.valueOf(sobj.get('PH3_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH3_Code__c'));
                }
              }
              if(('PH4').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH4_Code__c'))=='' || String.valueOf(sobj.get('PH4_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH4_Code__c'));
                }
              }
              if(('PH5').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH5_Code__c'))=='' || String.valueOf(sobj.get('PH5_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH5_Code__c'));
                }
              }
              if(('PH6').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH6_Code__c'))=='' || String.valueOf(sobj.get('PH6_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH6_Code__c'));
                }
              }
              if(('PH7').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH7_Code__c'))=='' || String.valueOf(sobj.get('PH7_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                } 
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH7_Code__c'));
                }
              }
              if(('PH8').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH8_Code__c'))=='' || String.valueOf(sobj.get('PH8_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH8_Code__c'));
                }
              }
              if(('PH9').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH9_Code__c'))=='' || String.valueOf(sobj.get('PH9_Code__c'))==null)
                {
                  newRec.KC_SAP__c =newRec.KC_SAP__c + '##';
                }
                else{
                  newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('PH9_Code__c'));
                }
              }
            }
            if(('Sales office').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Office_Code__c'));
            }
            if(('FRB').equalsIgnoreCase(kc)){
              //leading zeros
              String frb=String.valueOf(sobj.get('Profit_Center_Code__c'));
              newRec.KC_SAP__c =newRec.KC_SAP__c + frb;
              //System.debug('*****shipTo'+shipTo);
              //end
            }
            if(('Material Price Group').equalsIgnoreCase(kc)){

              String mpgCode=String.valueOf(sobj.get('Material_Price_Group_Code__c'));
              if(mpgCode!=null){                    
                if(mpgCode.isNumeric()){
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++){
                    mpgCode='0'+mpgCode;
                  }
                }
                else{
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++){
                    mpgCode=mpgCode+'#';
                  }
                }
              }
              //System.debug('***mpgCode'+mpgCode);
              newREc.KC_SAP__c =newREc.KC_SAP__c + mpgCode;



            }
            if(('Customer Price Group').equalsIgnoreCase(kc)){

              String cpgCode=String.valueOf(sobj.get('Customer_Price_Group_Code__c'));
              if(cpgCode!=null){                    
                if(cpgCode.isNumeric()){
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++){
                    cpgCode='0'+cpgCode;
                  }
                }
                else{
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++){
                    cpgCode=cpgCode+'#';
                  }
                }
              }
              newRec.KC_SAP__c =newRec.KC_SAP__c + cpgCode;


            }
            if(('Price List Type').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Price_List_Type_Code__c'));
            }
            if(('Payment terms').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Terms_of_Payment_Code__c'));
            }
            if(('Country').equalsIgnoreCase(kc)){
              String countryCode=String.valueOf(sobj.get('country_code__c'));
              if(countryCode!=null){
                Integer len=3-countryCode.length();
                for(Integer i=0;i<len;i++){
                  countryCode=countryCode+'#';
                }
              }   

              newRec.KC_SAP__c =newRec.KC_SAP__c + countryCode;
            }
            if(('End Use').equalsIgnoreCase(kc)){
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('End_Use_Code__c'));
            }*/
            //<HL20140902> Added Pricing Request remove
            /*if(('Pricing Request').equalsIgnoreCase(kc))
            {
              newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Pricing_Request__c'));
            }*/
            //<MS20141122>
          /*  if(('DiscRef').equalsIgnoreCase(kc) || (('Project Id').equalsIgnoreCase(kc)))
            { 
              //leading zeros
              String projectId=String.valueOf(sobj.get('Disc_Ref__c'));
              if(projectId!=null)
              {
                //project Id should be 12 digit
                projectId = (projectId.leftPad(12)).replaceAll(' ', '0');
                newREc.KC_SAP__c =newREc.KC_SAP__c + projectId;
              }
              //end

            }
            //<MS20140515>Adding conditions for variant and sales order type
            if(('Market Segment').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Market_Segment_Code__c'));
            }

            if(('Variant').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Variant_Code__c'));
            }
            if(('ComPartner').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('ComPartner_Code__c'));
            }
            if(('Plant').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Plant_Code__c'));
            }
            if(('Shipping Condition').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Shipping_Condition_Code__c'));
            }
            if(('Destination Country').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Destination_Country_Code__c'));
            }
            if(('Sales Order Type').equalsIgnoreCase(kc)){
              newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
            }
            newRec.KC_SAP__c.trim();
          }*/
          /*end*/
          upsertList.add(newRec); 
        }                       

        if(pri1.expire__c || createMarkedForDeletionRec){
          Sales_Prices__c newRec1=new Sales_Prices__c();
          newrec1=Trig_validatePriceAUNewUtil.createNonSAPPriceFromItem(pri1,RequestOwnerId);
          if(pri1.Pricing_Request_Type__c!='Project'){
            newRec1.Valid_From__c=pri1.New_Valid_To__c + 1 ;
            newRec1.Valid_To__c=holder.Valid_To__c;             
          }

          newRec1.Price_Holder__c=holder.Id;
          newRec1.markForDeletion__c=true; //imp
        /*  newRec1.BU__c=pri1.BU__c; 
          //newRec1.Markup_Percentage__c = pri1.New_Markup_Percentage__c;
          //newRec1.Base_Floor__c = pri1.New_Base_Floor__c;
          newRec1.Approved_Date__c=System.now();
          newRec1.Calculation_Type_Code__c =pri1.Calculation_Type_Code__c;
          newRec1.Calculation_Type__c=pri1.Calculation_Type__c;
          newRec1.Condition_Class__c=pri1.Condition_Class__c;
          newRec1.Condition_Class_Code__c=pri1.Condition_Class_Code__c;
          newRec1.Plus_Minus__c=pri1.Plus_Minus__c;
          newRec1.Plus_Minus_Code__c=pri1.Plus_Minus_Code__c;
          newREc1.Country__c = pri1.Country__c;
          newREc1.Country_code__c = pri1.Country_Code__c;
          newREc1.Customer_Price_Group__c = pri1.Customer_Price_Group__c;
          newREc1.Customer_Price_Group_Code__c = pri1.Customer_Price_Group_Code__c;
          newREc1.Dist_Channel__c = pri1.Dist_Channel__c;
          newREc1.Dist_Channel_Code__c = pri1.Dist_Channel_Code__c;
          newREc1.Division__c = pri1.Division__c;
          newREc1.Division_Code__c = pri1.Division_Code__c;
          newREc1.End_Use__c =  pri1.End_Use__c;
          newREc1.End_Use_Code__c = pri1.End_Use_Code__c;
          newREc1.Profit_Center__c = pri1.Profit_Center__c;
          newREc1.Profit_Center_Code__c = pri1.Profit_Center_Code__c;
          newREc1.Incoterms1__c = pri1.Inco_terms__c;
          newREc1.Incoterms_1_Code__c = pri1.Incoterms_Code__c;
          newREc1.Key_Combination__c = pri1.Key_Combination__c;
          //<PR20140908> START
          if(pri1.Key_Combination_Code__c != null && pri1.Key_Combination_Code__c.length() > 4)
            newREc1.Key_Combination_Code__c=pri1.Key_Combination_Code__c.substring(0,4);
          else
          newREc1.Key_Combination_Code__c = pri1.Key_Combination_Code__c;
          //<PR20140908> END
          //newREc1.Key_Combination_Code__c = pri1.Key_Combination_Code__c;
          newREc1.Material__c = pri1.Material__c;
          newREc1.Material_Code__c = pri1.Material_Code__c;
          newREc1.Material_Price_Group__c = pri1.Material_Price_Group__c;
          newREc1.Material_Price_Group_Code__c = pri1.Material_Price_Group_Code__c;
          newRec1.Per__c=pri1.New_Per__c; 
          newREc1.PH1_Code__c = pri1.PH1_Code__c;
          newREc1.PH2_Code__c = pri1.PH2_Code__c;
          newREc1.PH3_Code__c = pri1.PH3_Code__c;
          newREc1.PH4_Code__c = pri1.PH4_Code__c;
          newREc1.PH5_Code__c = pri1.PH5_Code__c;
          newREc1.PH6_Code__c = pri1.PH6_Code__c;
          newREc1.PH7_Code__c = pri1.PH7_Code__c;
          newREc1.PH8_Code__c = pri1.PH8_Code__c;
          newREc1.PH9_Code__c = pri1.PH9_Code__c;
          newREc1.Price_List_Type__c = pri1.Price_List_Type__c;
          newREc1.Price_List_Type_Code__c = pri1.Price_List_Type_Code__c;
          newREc1.Pricing_Condition__c = pri1.Pricing_Condition__c;
          newREc1.Pricing_Condition_Code__c = pri1.Pricing_Condition_Code__c;
          newREc1.Product_Hierarchy__c = pri1.Product_Hierarchy__c;
          newREc1.Rate__c=pri1.New_Rate__c;  
          newREc1.Sales_Office__c = pri1.Sales_Office__c;
          newREc1.Sales_Office_Code__c = pri1.Sales_Office_Code__c;
          newREc1.Sales_Org__c = pri1.Sales_Org__c;
          newREc1.Sales_Org_Code__c = pri1.Sales_Org_Code__c;     
          newREc1.Sales_Price_Type__c=pri1.Pricing_Request_Type__c;                 
          newREc1.Sales_Pricing_Procedure__c=pri1.ERP_Pricing_Procedure__c;
          newREc1.SAP_Application_Id__c = pri1.SAP_Application_Id__c;
          newREc1.SAP_Client_Id__c = pri1.SAP_Client_ID__c;
          newREc1.SAP_Cluster__c= pri1.SAP_Cluster__c;
          newREc1.Sold_To__c=pri1.Sold_To__c;
          newRec1.Sold_To_Code__c=pri1.Sold_To_Code__c;         
          newREc1.Terms_Of_Payment_Code__c = pri1.Terms_of_Payment_Code__c;            
          newREc1.UoM__c=pri1.New_UoM__c;
          newREc1.Unit__c=pri1.New_Unit__c;
          newREc1.OwnerId=RequestOwnerId; 
          //<HL20140902-Start> Added Pricing Request
                    newREc1.Pricing_request__c=pri1.Pricing_request__c;
                    //<HL20140902-End>
          //<MS20140515>Adding conditions for variant and sales order type
          newREc1.Market_Segment__c=pri1.Market_Segment__c;
          newREc1.Market_Segment_Code__c=pri1.Market_Segment_Code__c;
          newREc1.Variant__c=pri1.Variant__c;
          newREc1.Variant_Code__c=pri1.Variant_Code__c;
          newREc1.ComPartner_Code__c=pri1.ComPartner_Code__c;
        newREc1.ComPartner__c=pri1.ComPartner__c;
        newREc1.Plant_Code__c=pri1.Plant_Code__c;
        newREc1.Plant__c=pri1.Plant__c;
        newREc1.Shipping_Condition_Code__c=pri1.Shipping_Condition_Code__c;
        newREc1.Shipping_Condition__c=pri1.Shipping_Condition__c;
        newREc1.Destination_Country_Code__c=pri1.Destination_Country_Code__c;
        newREc1.Destination_Country__c=pri1.Destination_Country__c;
          //<MS20141115>
          newRec1.Project__c=pri1.Disc_Ref__c;
          newREc1.Sales_Order_Type__c=pri1.Sales_Order_Type__c;
          newREc1.Sales_Order_Type_Code__c=pri1.Sales_Order_Type_Code__c;*/
          /*population of KCSAP-try*/
        /*  sObject sObj = (sObject)pri1 ; 
          List<String> kcSplitList =new List<String>();
          newREc1.KC_SAP__c='';
          kcSplitList = pri1.Key_Combination__c.split('/');
          for(String kc:kcSplitList){
            if(('Sales Org.').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
            }
            if(('Division').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
            }
            if(('Dist. Channel').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
            }                        
            if(('Material').equalsIgnoreCase(kc)){
              //leading hashes
              String matCode = String.valueOf(sobj.get('Material_Code__c'));
              if(!String.isBlank(matCode))
                matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
              newRec1.KC_SAP__c =newRec1.KC_SAP__c + matCode;
            }
            if(kc.containsIgnoreCase('PH')){
              if(('PH1').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH1_Code__c'))=='' || String.valueOf(sobj.get('PH1_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH1_Code__c'));
                }
              }
              if(('PH2').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH2_Code__c'))=='' || String.valueOf(sobj.get('PH2_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH2_Code__c'));
                }
              }
              if(('PH3').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH3_Code__c'))=='' || String.valueOf(sobj.get('PH3_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH3_Code__c'));
                }
              }
              if(('PH4').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH4_Code__c'))=='' || String.valueOf(sobj.get('PH4_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH4_Code__c'));
                }
              }
              if(('PH5').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH5_Code__c'))=='' || String.valueOf(sobj.get('PH5_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH5_Code__c'));
                }
              }
              if(('PH6').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH6_Code__c'))=='' || String.valueOf(sobj.get('PH6_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH6_Code__c'));
                }
              }
              if(('PH7').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH7_Code__c'))=='' || String.valueOf(sobj.get('PH7_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                } 
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH7_Code__c'));
                }
              }
              if(('PH8').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH8_Code__c'))=='' || String.valueOf(sobj.get('PH8_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH8_Code__c'));
                }
              }
              if(('PH9').equalsIgnoreCase(kc))
              { 
                if(String.valueOf(sobj.get('PH9_Code__c'))=='' || String.valueOf(sobj.get('PH9_Code__c'))==null)
                {
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + '##';
                }
                else{
                  newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('PH9_Code__c'));
                }
              }
            }
            if(('Sales office').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Sales_Office_Code__c'));
            }
            if(('FRB').equalsIgnoreCase(kc)){
              //leading zeros
              String frb=String.valueOf(sobj.get('Profit_Center_Code__c'));
              newRec.KC_SAP__c =newRec.KC_SAP__c + frb;
              //System.debug('*****shipTo'+shipTo);
              //end
            }
            if(('Material Price Group').equalsIgnoreCase(kc)){
              String mpgCode=String.valueOf(sobj.get('Material_Price_Group_Code__c'));

              if(mpgCode!=null){                    
                if(mpgCode.isNumeric()){
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++){
                    mpgCode='0'+mpgCode;
                  }
                }
                else{
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-mpgCode.length();
                  for(Integer i=0;i<len;i++){
                    mpgCode=mpgCode+'#';
                  }
                }
              }
              //System.debug('***mpgCode'+mpgCode);
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + mpgCode;
            }
            if(('Customer Price Group').equalsIgnoreCase(kc)){
              String cpgCode=String.valueOf(sobj.get('Customer_Price_Group_Code__c'));
              if(cpgCode!=null){                    
                if(cpgCode.isNumeric()){
                  //It is a number So, check the length and "prefixed" with 0
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++){
                    cpgCode='0'+cpgCode;
                  }
                }
                else{
                  //It is a String, So check the length and "suffix" with #
                  Integer len=2-cpgCode.length();
                  for(Integer i=0;i<len;i++){
                    cpgCode=cpgCode+'#';
                  }
                }
              }
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + cpgCode;
            }
            if(('Price List Type').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Price_List_Type_Code__c'));
            }
            if(('Payment terms').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Terms_of_Payment_Code__c'));
            }
            if(('Country').equalsIgnoreCase(kc)){
              String countryCode=String.valueOf(sobj.get('country_code__c'));
              if(countryCode!=null){
                Integer len=3-countryCode.length();
                for(Integer i=0;i<len;i++){
                  countryCode=countryCode+'#';
                }
              }   

              newRec.KC_SAP__c =newRec.KC_SAP__c + countryCode;
            }
            if(('End Use').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('End_Use_Code__c'));
            }*/
            //<HL20140902-Start> remove
            /*if(('Pricing Request').equalsIgnoreCase(kc))
            {
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Pricing_Request__c'));
            }*/
          /*  if(('DiscRef').equalsIgnoreCase(kc) || (('Project Id').equalsIgnoreCase(kc)))
            { 
              //leading zeros
              String projectId=String.valueOf(sobj.get('Disc_Ref__c'));
              if(projectId!=null)
              {
                //project Id should be 12 digit
                projectId = (projectId.leftPad(12)).replaceAll(' ', '0');
                newREc1.KC_SAP__c =newREc1.KC_SAP__c + projectId;
              }
              //end

            }
            //<MS20140515>Adding conditions for variant and sales order type
            if(('Market Segment').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Market_Segment_Code__c'));
            }

            if(('Variant').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Variant_Code__c'));
            }
            if(('ComPartner').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('ComPartner_Code__c'));
            }
            if(('Plant').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Plant_Code__c'));
            }
            if(('Shipping Condition').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Shipping_Condition_Code__c'));
            }
            if(('Destination Country').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Destination_Country_Code__c'));
            }
            if(('Sales Order Type').equalsIgnoreCase(kc)){
              newREc1.KC_SAP__c =newREc1.KC_SAP__c + String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
            }
            newREc1.KC_SAP__c.trim(); 
          }*/
          upsertList.add(newRec1);

          if(pri1.Pricing_Request_Type__c!='Project'){
            holder.Valid_To__c=pri1.New_Valid_To__c;

            upsertList.add(holder);
          }
        }   
      }  
    }
    /* upserting the list of records. */         
    upsert upsertList;       
    if(delList.size()!=0){
      delSet=new Set<Id>();
      for(Sales_Prices__c d: delList){
        delSet.add(d.Id);
      }
      //System.debug('****del set'+delSet.size()); 
      //<VR20130509> Ver 1.1 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
      //<HL20140902> Added Pricing Request field in the query
      List<Sales_Prices__c> childRecOfDelHolder = [Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,
                             Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c,                                                 
                             Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,
                             Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,  Rate__c, 
                             Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, 
                             Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, 
                             PH8_Code__c,PH7_Code__c,  PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c,
                             PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                             LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id,  End_Use__c,
                             End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c,  Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c,
                             CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c,
                             Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c, ComPartner__c, ComPartner_Code__c From Sales_Prices__c WHERE Price_Holder__c IN:delSet];

      for(Sales_Prices__c childOfDel:childRecOfDelHolder){
        if(!delHolderChildMap.containskey(childOfDel.Price_Holder__c)){
          List<Sales_Prices__c> l1=new List<Sales_Prices__c>();
          l1.add(childOfDel);
          delHolderChildMap.put(childOfDel.Price_Holder__c,l1);
        }      
        else{        
          List<Sales_Prices__c> delChildList = delHolderChildMap.get(childOfDel.Price_Holder__c);
          delChildList.add(childOfDel);
          delHolderChildMap.put(childOfDel.Price_Holder__c,delChildList);
        }
      }  
      Set<Sales_Prices__c> delHoldersSet= new Set<Sales_Prices__c>();
      delHoldersSet=delRecOverLapHolderMap.keySet();          
      for(Sales_Prices__c e :delHoldersSet){
        Sales_Prices__c newHold=delRecOverLapHolderMap.get(e);
        if(delHolderChildMap.get(e.Id)!=null)
          childRecordsOfDelHolder= delHolderChildMap.get(e.Id);
        for(Sales_Prices__c c1:childRecordsOfDelHolder) {
          c1.Price_Holder__c = newHold.Id;
          updatechildRecOfDelHolderList.add(c1);          
        }           
      } 
      upsert updatechildRecOfDelHolderList;
      if(delList.size()!=0)
        delete delList;                                                        
    }
  } 
}