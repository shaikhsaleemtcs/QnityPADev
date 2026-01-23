/*Ver1.1 Neeharika -Removed rate references */
/***********************************************Modification Log************************************************
  <VR20130509>
 Last Modified By   :   Vinoth Rajapandian
 Last Modified Date :   09 May 2013
 Description        :   Adding Logic for extra key field Customer Hierarchy - APAC ROLLOUT1(1.2)                        
                    
 *****************************************************************************************************************
 <BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(1.3)
 *****************************************************************************************************************
<PP20131028>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   28 October 2013
 Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
 **********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic to include Sales Order Item and Sales Order Item Code values- CRM-2022-07-0225
 
 **********************************************************************************************************************
<SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   01 May 2023
 Description        :   Added logic to include M&M P80 fields
 
***********************************************************************************************************************/
global class batchClassForHolder implements Database.Batchable<sObject>{
    public List<ERP_Sales_Prices_SAP__c> upsertList =new  List<ERP_Sales_Prices_SAP__c>();
    public Map<String,ERP_Sales_Prices_SAP__c> mapOfpriAndHolder =new  Map<String,ERP_Sales_Prices_SAP__c> ();                                              
    global database.queryLocator start(Database.BatchableContext BC){
    //<VR20130509> Ver 1.2 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query     
    //<BB20130726> Ver 1.3 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Incoterms
    //<PP20131028>
        //<MS20140515> Added Variant and SalesOrderType fields in the query
        //<SS20220826> Added Sales Order Item fields in the below query.
        //<SS20230501> Added M&M P80 fields in the below query.
        return Database.getQueryLocator([SELECT Ship_To_Country__c,Ship_To_Country_Code__c,markForDeletion__c, isPriceHolder__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, 
                                        Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_SAP__c, Sold_To_Code__c, ShipTo__c,
                                        ShipTo_Code__c, Scaled_Price_Flag__c, Scale_Type__c, Scale_Type_Code__c, Scale_Basis__c, Scale_Basis_Code__c, ScaleRate9__c,
                                        ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, 
                                        ScaleRate2__c, ScaleRate1__c, ScaleRate10__c,Sales_Pricing_Procedure__c, Scale_Quantity_Scale_Value9__c, 
                                        Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c,
                                        Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, 
                                        Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Price_Type__c, Sales_Org__c,
                                        Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,
                                         Record_Id__c, Rate__c, Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                                        Product_Hierarchy__c,Pricing_Condition__c, Pricing_Condition_Code__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                                        Price_Ref_Partner__c, Price_Ref_Partner_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c,
                                        Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, 
                                        PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c,
                                        PH1__c, PH1_Code__c, PCKC__c, PCKC_SAP__c, Owning_Business__c, OwnerId, Name, Material__c,Product_Hierarchy_Code__c,
                                        Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, Market_Segment__c, Market_Segment_Code__c,Variant_Code__c,Variant__c,
                                         ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,
                                        LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, KC_SAP__c, 
                                        IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, F_Product_Hierarchy_Code__c, End_User__c, End_User_Code__c, 
                                        End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c, Dist_Channel__c, 
                                        Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode,
                                        CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, 
                                        Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, BU__c, Approved_Date__c 
                                        FROM ERP_Sales_Prices_SAP__c WHERE Price_Holder__c =: System.label.PriceHolder_Id_for_batch AND isPriceHolder__c = false
                                        ORDER BY PCKC__c]);
  }
   global void execute(Database.BatchableContext BC,List<sObject> sList){ 
        List<ERP_Sales_Prices_SAP__c> acList=sList; 
        System.debug('*****list of records'+acList.size());
        Map<String,List<ERP_Sales_Prices_SAP__c>> linkedPCKCHoldersMap =new Map<String,List<ERP_Sales_Prices_SAP__c>>();
    for(ERP_Sales_Prices_SAP__c h:acList)
    {          
        if(!linkedPCKCHoldersMap.containskey(h.PCKC__c))
        {
            System.debug('*****in if');
            List<ERP_Sales_Prices_SAP__c> l=new List<ERP_Sales_Prices_SAP__c>();
            l.add(h);
            linkedPCKCHoldersMap.put(h.PCKC__c,l);
        }     
        else{       
            System.debug('*****in else');
            List<ERP_Sales_Prices_SAP__c> hList = linkedPCKCHoldersMap.get(h.PCKC__c);
            hList.add(h);
            linkedPCKCHoldersMap.put(h.PCKC__c,hList);
        }
    }
    System.debug('*****map of pCKC'+linkedPCKCHoldersMap);
    for(String s:linkedPCKCHoldersMap.keySet())
    {
        List<ERP_Sales_Prices_SAP__c> pList=new List<ERP_Sales_Prices_SAP__c>();
        List<ERP_Sales_Prices_SAP__c> validFromList =new List<ERP_Sales_Prices_SAP__c>(); 
        List<ERP_Sales_Prices_SAP__c> validToList =new List<ERP_Sales_Prices_SAP__c>(); 
        ERP_Sales_Prices_SAP__c pri=new ERP_Sales_Prices_SAP__c();
        if(linkedPCKCHoldersMap.containsKey(s))
        {
            pList=linkedPCKCHoldersMap.get(s);
            System.debug('***pList'+pList+'***plist size'+plist.size());
            if(pList.size()!=0)
            {
                pri=pList.get(0);
            if(pList!=null && pList.size()>1)
            {
                validFromList = plist.deepClone(true,false);
                validFromList=PAUtil.sortList(validFromList,'Valid_From__c','asc');
            }
            else
            {
                validFromList = pList;
            }
            if(pList!=null && pList.size()>1)
            {
                validToList = plist.deepClone(true,false);
                validToList=PAUtil.sortList(validToList,'Valid_To__c','desc');
            }
            else
            {
                validToList = pList;
            }
            system.debug('*&** ValidFromList '+validFromList);
            system.debug('*&** validToList '+validToList);
        }
    }
        ERP_Sales_Prices_SAP__c newholder=new ERP_Sales_Prices_SAP__c();
        newHolder = pri.clone(false,true);
        newHolder.Approved_Date__c=validFromList.get(0).Valid_From__c;
        newholder.Valid_From__c =validFromList.get(0).Valid_From__c; 
        newholder.Valid_To__c = validToList.get(0).Valid_To__c;     
        system.debug('*&** newholder.Valid_From__c '+newholder.Valid_From__c);
        system.debug('*&** newholder.Valid_To__c '+newholder.Valid_To__c);
        //Since, holder should not have rate,unit,Per,UoM fields populated.
        newHolder.ScaleRate1__c=null;
        newHolder.ScaleRate2__c=null;
        newHolder.ScaleRate3__c=null;
        newHolder.ScaleRate4__c=null;
        newHolder.ScaleRate5__c=null;
        newHolder.ScaleRate6__c=null;
        newHolder.ScaleRate7__c=null;
        newHolder.ScaleRate8__c=null;
        newHolder.ScaleRate9__c=null;
        newHolder.Rate__c=null;
        newHolder.Per__c=null;
        newHolder.UoM__c=null;
        newHolder.Unit__c=null;
        newHolder.OwnerId=pri.OwnerId;
        newholder.Price_Holder__c  = null;
        newHolder.isPriceHolder__c=true;
        mapOfpriAndHolder.put(s,newHolder);                          
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
    upsert upsertHolderList;
    System.debug('**upsertHolderList'+upsertHolderList);                 
    //query the holder
    //iterate through key set of PCKC get the records, get the holder map
    for(String s1:linkedPCKCHoldersMap.keySet())
    {
        List<ERP_Sales_Prices_SAP__c> pList=new List<ERP_Sales_Prices_SAP__c>();
        ERP_Sales_Prices_SAP__c hold=new ERP_Sales_Prices_SAP__c();
        if(linkedPCKCHoldersMap.containsKey(s1))
        {
            pList=linkedPCKCHoldersMap.get(s1);
        }
        if(mapOfpriAndHolder.containsKey(s1))
        { 
            hold=mapOfpriAndHolder.get(s1);
        } 
        for(ERP_Sales_Prices_SAP__c h:pList)
        {
            if(hold.Id!=null)
                h.Price_Holder__c=hold.Id;
                
                //system.debug('Price Holder '+h.Price_Holder__c); 
            h.Approved_Date__c=h.Valid_From__c;
            
            //system.debug('Appoved date '+ h.Approved_Date__c);
            upsertList.add(h);
            
            
        }
    }
    upsert upsertList; 
   } 
   global void finish(Database.BatchableContext info){   
   } 
}