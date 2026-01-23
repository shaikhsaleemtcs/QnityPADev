/*
 * Name             :   BatchToMapHolder
 * Description      :   The batch class is responsible for creating and mapping appropriate price holders to ERP Sales Prices SAP record(s) being created
 * Author           :   Haider Naseem
 * Oroganisation    :   TCS
 * Created Date     :   12/1/2016
 
 
 *
 * Version   Modified Date     Modified By                Modification
 * 
 * --------------------------------------------------------------------------------------------------------------------
 * V1.1    8-Dec-2017       Mansi Gupta        Added and mapped Customer Specific field in price holder
 * V1.2    22-Aug-2022      Shantanu Sharma    Added and mapped Sales Order Item fields in price holder
 * V1.3    01-May-2023      SHantanu Sharma    Added and Mapped M&M P80 fields
 * --------------------------------------------------------------------------------------------------------------------
 */


global class BatchToMapHolder implements Database.Batchable<sObject>,Schedulable,Database.Stateful{

public static boolean isBatch = false;
public boolean runTimeLine = false;


global database.queryLocator start(Database.BatchableContext BC){
//V1.1 <MG08122017> - added Customer_Specific__c in below query 
//V1.2 <SS20220826> Added Sales Order Item in below Query
//V1.3 <SS20230501> Added P80 M&M Fields
    return Database.getQueryLocator([select Approved_Date__c ,id,Sales_Pricing_Procedure__c,Key_Combination__c,pckc__c,bu__c,valid_from__c,valid_to__c,Key_Combination_Code__c,Pricing_Condition_Code__c,Sales_Org_Code__c,
    Distribution_Channel_Code__c,Division_Code__c,Sold_To_Code__c,Customer_Specific__c,Material_Code__c,ShipTo_Code__c,Sales_Office_Code__c,
    Customer_Price_Group_Code__c,Material_Price_Group_Code__c,Price_List_Type_Code__c,Terms_of_Payment_Code__c,Project_Id__c,
    End_Use_Code__c,Market_Segment_Code__c,Variant_Code__c,Contract_Code__c,Sales_Order_Type_Code__c,Sales_Order_Item_Code__c,Value_Center_Code__c,Material_group_2_Code__c,Ext_Matl_Grp_Code__c, Price_Zone_Code__c,ComPartner_Code__c,Material_Group_5_Key_Code__c,
    Plant_Code__c,Shipping_Condition_Code__c,Destination_Country_Code__c,Price_Ref_Partner_Code__c,Country_Code__c,End_User_Code__c,
    Customer_Hierarchy_Code__c,Profit_Center_Code__c,Ship_To_Country_Code__c,Incoterms_1_Code__c,Kcode__c,Material_Group_1_Code__c,
    Sales_District_Code__c,Partner_ZF_Code__c,Payer_Code__c,FixValDate__c,Disc_Ref_No__c,Campaign_Code__c,Document_Currency__c,
    State_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,External_ERP_ID__c,Pricing_Request__c,
    markForDeletion__c,isPriceHolder__c,Price_Holder__c,OwnerId From ERP_Sales_Prices_SAP__c WHERE isPriceHolder__c = false AND Price_Holder__c =: System.label.PriceHolder_Id_for_batch ORDER BY PCKC__c]);
    
}

global void execute(Database.BatchableContext BC,List<sObject> sList){ 
    isBatch = true;
    runTimeLine = true;
    system.debug('HNDEBUG in execute: isBatch => ' +isBatch +'  runTimeLine => '+runTimeLine);
    system.debug('HNDEBUG sList'+ sList.size()+' '+sList[0].id);
    List<ERP_Sales_Prices_SAP__c> ERPSPSList = sList;
    Set<String> buSet= new Set<String>();
    Set<String> salesorgSet= new Set<String>();
    Set<String> SalesPricingProcedureSet= new Set<String>();
    Set<String> ExternalERPIdSet= new Set<String>();  
    Set<String> PCKCSet= new Set<String>(); 
    set<string> newHolderPCKC = new set<string>();
    list<ERP_Sales_Prices_SAP__c> newHolderPrices = new list<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> holderList = new List<ERP_Sales_Prices_SAP__c>();
    Map<String,ERP_Sales_Prices_SAP__c> linkedPCKCHoldersMap =new Map<String,ERP_Sales_Prices_SAP__c>();
    Map<String,List<ERP_Sales_Prices_SAP__c>> priceAndHolderMap =new Map<String,List<ERP_Sales_Prices_SAP__c>>();
    List<ERP_Sales_Prices_SAP__c> holderListToUpdate = new List<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> pricesToUpdate = new List<ERP_Sales_Prices_SAP__c>();
    List<ERP_Sales_Prices_SAP__c> pricesHoldersToUpdate = new List<ERP_Sales_Prices_SAP__c>();
    
    for(ERP_Sales_Prices_SAP__c price : ERPSPSList )
    {
      buSet.add(price.BU__c);
      SalesPricingProcedureSet.add(price.Sales_Pricing_Procedure__c);
      PCKCSet.add(price.PCKC__c);
    } 
    //V1.1 <MG08122017> - added Customer_Specific__c in below query - added Customer_Specific__c in below query
    //V1.2 <SS20220826> Added Sales Order Item in below Query
    //V1.3 <SS20230501> Added P80 M&M Fields
    List<ERP_Sales_Prices_SAP__c> PriceHolderList = [select Approved_Date__c,Customer_Specific__c,Key_Combination__c,Sales_Pricing_Procedure__c,id,pckc__c,Key_Combination_Code__c,bu__c,valid_from__c,valid_to__c,Pricing_Condition_Code__c,Sales_Org_Code__c,
    Distribution_Channel_Code__c,Division_Code__c,Sold_To_Code__c,Material_Code__c,ShipTo_Code__c,Sales_Office_Code__c,
    Customer_Price_Group_Code__c,Material_Price_Group_Code__c,Price_List_Type_Code__c,Terms_of_Payment_Code__c,Project_Id__c,
    End_Use_Code__c,Market_Segment_Code__c,Variant_Code__c,Contract_Code__c,Sales_Order_Type_Code__c,Sales_Order_Item_Code__c,Value_Center_Code__c,Material_group_2_Code__c,Ext_Matl_Grp_Code__c, Price_Zone_Code__c,ComPartner_Code__c,Material_Group_5_Key_Code__c,
    Plant_Code__c,Shipping_Condition_Code__c,Destination_Country_Code__c,Price_Ref_Partner_Code__c,Country_Code__c,End_User_Code__c,
    Customer_Hierarchy_Code__c,Profit_Center_Code__c,Ship_To_Country_Code__c,Incoterms_1_Code__c,Kcode__c,Material_Group_1_Code__c,
    Sales_District_Code__c,Partner_ZF_Code__c,Payer_Code__c,FixValDate__c,Disc_Ref_No__c,Campaign_Code__c,Document_Currency__c,
    State_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,External_ERP_ID__c,Pricing_Request__c,
    markForDeletion__c,isPriceHolder__c,Price_Holder__c,OwnerId From ERP_Sales_Prices_SAP__c WHERE PCKC__c IN :PCKCSet AND BU__c IN :buSet AND Sales_Pricing_Procedure__c IN :SalesPricingProcedureSet AND isPriceHolder__c = true order by createddate desc limit 50000];
                                     
    system.debug('HNDEBUG PriceHolderList'+ PriceHolderList.size()+'  ID: '+PriceHolderList);
      
    for(ERP_Sales_Prices_SAP__c h:PriceHolderList )
          {           
               linkedPCKCHoldersMap.put(h.PCKC__c,h);
                 
          }
          
          system.debug('HNDEBUG linkedPCKCHoldersMap'+ linkedPCKCHoldersMap.size());          
          
     for(ERP_Sales_Prices_SAP__c price : ERPSPSList){
               
                   if(linkedPCKCHoldersMap.containskey(price.pckc__c))
                   {
                       system.debug('HNDEBUG in FOR');
                       //ERP_Sales_Prices_SAP__c holder = linkedPCKCHoldersMap.get(price.pckc__c)[0];
                       price.price_holder__c = linkedPCKCHoldersMap.get(price.pckc__c).id;
                       //fix for approved date on price
                        if(price.Approved_Date__c == null){
                           price.Approved_Date__c = price.valid_from__c;
                           } 
                       //fix end
                       if(linkedPCKCHoldersMap.get(price.pckc__c).Approved_Date__c == null){
                           linkedPCKCHoldersMap.get(price.pckc__c).Approved_Date__c = price.valid_from__c;
                       } 
                       else if(linkedPCKCHoldersMap.get(price.pckc__c).Approved_Date__c < price.Approved_Date__c){
                           linkedPCKCHoldersMap.get(price.pckc__c).Approved_Date__c = price.Approved_Date__c;
                       }
                       if(newHolderPCKC.contains(price.pckc__c)){
                           newHolderPrices.add(Price);
                       }
                       else{
                           pricesToUpdate.add(price);
                       }
                       system.debug('HNDEBUG holders valid From should be updated '+ ' HL VF: '+linkedPCKCHoldersMap.get(price.pckc__c).valid_from__c + 'P VF: '+price.valid_from__c);
                       system.debug('HNDEBUG holders valid From should be updated '+ ' HL VT: '+linkedPCKCHoldersMap.get(price.pckc__c).valid_to__c + 'P VT: '+price.valid_to__c);
                       if(linkedPCKCHoldersMap.get(price.pckc__c).valid_from__c > price.valid_from__c )
                       {
                           
                           linkedPCKCHoldersMap.get(price.pckc__c).valid_from__c = price.valid_from__c;
                       }
                       else if(linkedPCKCHoldersMap.get(price.pckc__c).valid_to__c < price.valid_to__c)
                       {
                          
                           linkedPCKCHoldersMap.get(price.pckc__c).valid_to__c = price.valid_to__c;
                       }
                   }
                   //linkedPCKCHoldersMap.put(price.pckc__c,holder);
               
               else
               {
                   //create new holder
                    system.debug('HNDEBUG Create new Holder');
                    
                    newHolderPCKC.add(Price.pckc__c);
                    newHolderPrices.add(Price);
                    ERP_Sales_Prices_SAP__c newholder=new ERP_Sales_Prices_SAP__c();
                    //newHolder = pri.clone(false,true);
                    price.Approved_Date__c = price.valid_from__c;
                    newHolder.Approved_Date__c= price.Valid_From__c;
                    newHolder.bu__c = price.bu__c;
                   //V1.1 <MG08122017> - mappping of Customer_Specific__c field in Price holder
                    newHolder.Customer_Specific__c = price.Customer_Specific__c;
                    newholder.Valid_From__c =price.Valid_From__c; 
                    newholder.Valid_To__c = price.Valid_To__c;     
                    system.debug('*&** newholder.Valid_From__c '+newholder.Valid_From__c);
                    system.debug('*&** newholder.Valid_To__c '+newholder.Valid_To__c);
                    //Since, holder should not have rate,unit,Per,UoM fields populated.
                    /*newHolder.ScaleRate1__c=null;
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
                    newHolder.Unit__c=null;*/
                    newHolder.OwnerId=price.OwnerId;
                    //newholder.Price_Holder__c  = null;
                    newHolder.isPriceHolder__c=true;
                    newHolder.Pricing_Condition_Code__c=price.Pricing_Condition_Code__c;
                    newHolder.Sales_Org_Code__c=price.Sales_Org_Code__c;
                    newHolder.Distribution_Channel_Code__c=price.Distribution_Channel_Code__c;
                    newHolder.Division_Code__c=price.Division_Code__c;
                    newHolder.Sold_To_Code__c=price.Sold_To_Code__c;
                    newHolder.Material_Code__c=price.Material_Code__c;
                    newHolder.ShipTo_Code__c=price.ShipTo_Code__c;
                    newHolder.Sales_Office_Code__c=price.Sales_Office_Code__c;
                    newHolder.Customer_Price_Group_Code__c=price.Customer_Price_Group_Code__c;
                    newHolder.Material_Price_Group_Code__c=price.Material_Price_Group_Code__c;
                    newHolder.Price_List_Type_Code__c=price.Price_List_Type_Code__c;
                    newHolder.Terms_of_Payment_Code__c=price.Terms_of_Payment_Code__c;
                    newHolder.Project_Id__c=price.Project_Id__c;
                    newHolder.End_Use_Code__c=price.End_Use_Code__c;
                    newHolder.Market_Segment_Code__c=price.Market_Segment_Code__c;
                    newHolder.Variant_Code__c=price.Variant_Code__c;
                    newHolder.Contract_Code__c=price.Contract_Code__c;
                    newHolder.Sales_Order_Type_Code__c=price.Sales_Order_Type_Code__c; 
                    newHolder.Sales_Order_Item_Code__c =price.Sales_Order_Item_Code__c;//<SS20220826> Added Sales Order Item mapping
                    newHolder.Value_Center_Code__c =price.Value_Center_Code__c;//<SS20230501>
                    newHolder.Material_group_2_Code__c =price.Material_group_2_Code__c;//<SS20230501>
                    newHolder.Ext_Matl_Grp_Code__c =price.Ext_Matl_Grp_Code__c;//<SS20230501>
                    newHolder.Price_Zone_Code__c =price.Price_Zone_Code__c;//<SS20230501>
                    newHolder.ComPartner_Code__c=price.ComPartner_Code__c;
                    newHolder.Material_Group_5_Key_Code__c=price.Material_Group_5_Key_Code__c;
                    newHolder.Plant_Code__c=price.Plant_Code__c;
                    newHolder.Shipping_Condition_Code__c=price.Shipping_Condition_Code__c;
                    newHolder.Destination_Country_Code__c=price.Destination_Country_Code__c;
                    newHolder.Price_Ref_Partner_Code__c=price.Price_Ref_Partner_Code__c;
                    newHolder.Country_Code__c=price.Country_Code__c;
                    newHolder.End_User_Code__c=price.End_User_Code__c;
                    newHolder.Customer_Hierarchy_Code__c=price.Customer_Hierarchy_Code__c;
                    newHolder.Profit_Center_Code__c=price.Profit_Center_Code__c;
                    newHolder.Ship_To_Country_Code__c=price.Ship_To_Country_Code__c;
                    newHolder.Incoterms_1_Code__c=price.Incoterms_1_Code__c;
                    newHolder.Kcode__c=price.Kcode__c;
                    newHolder.Material_Group_1_Code__c=price.Material_Group_1_Code__c;
                    newHolder.Sales_District_Code__c=price.Sales_District_Code__c;
                    newHolder.Partner_ZF_Code__c=price.Partner_ZF_Code__c;
                    newHolder.Payer_Code__c=price.Payer_Code__c;
                    newHolder.FixValDate__c=price.FixValDate__c;
                    newHolder.Disc_Ref_No__c=price.Disc_Ref_No__c;
                    newHolder.Campaign_Code__c=price.Campaign_Code__c;
                    newHolder.Document_Currency__c=price.Document_Currency__c;
                    newHolder.State_Code__c=price.State_Code__c;
                    newHolder.PH1_Code__c=price.PH1_Code__c;
                    newHolder.PH2_Code__c=price.PH2_Code__c;
                    newHolder.PH3_Code__c=price.PH3_Code__c;
                    newHolder.PH4_Code__c=price.PH4_Code__c;
                    newHolder.PH5_Code__c=price.PH5_Code__c;
                    newHolder.PH6_Code__c=price.PH6_Code__c;
                    newHolder.PH7_Code__c=price.PH7_Code__c;
                    newHolder.PH8_Code__c=price.PH8_Code__c;
                    newHolder.PH9_Code__c=price.PH9_Code__c;
                    newHolder.Key_Combination__c=price.Key_Combination__c;
                    newHolder.Sales_Pricing_Procedure__c=price.Sales_Pricing_Procedure__c;
                    if(price.Key_Combination_Code__c != null && price.Key_Combination_Code__c.length() > 4)
                        newHolder.Key_Combination_Code__c=price.Key_Combination_Code__c.substring(0,4);
                    else
                        newHolder.Key_Combination_Code__c=price.Key_Combination_Code__c;
                    NewHolder.External_ERP_ID__c = price.BU__c+'-'+price.Sales_Org_Code__c+'-'+price.Pricing_Condition_Code__c+'-'+price.Key_Combination_Code__c+'-'+price.PCKC__c;
                    linkedPCKCHoldersMap.put(price.pckc__c,newHolder);
                    
               
               }
           
               
               if(linkedPCKCHoldersMap.get(price.pckc__c).valid_to__c == date.newInstance(3999, 12, 31))
                   {
                       system.debug('HNDEBUG Found 3999 Price');
                       if(price.markForDeletion__c == true){
                           system.debug('HNDEBUG found expiry price');
                           linkedPCKCHoldersMap.get(price.pckc__c).valid_to__c = price.valid_from__c;
                       }
                   }
               
      }
           
           database.upsert(linkedPCKCHoldersMap.values(),false);
           for(ERP_Sales_Prices_SAP__c price:newHolderPrices){
               price.price_holder__c = linkedPCKCHoldersMap.get(price.pckc__c).id; 
           }
           pricesToUpdate.addAll(newHolderPrices);
           database.update(pricesToUpdate,false);
           
                    
    
}


global void finish(Database.BatchableContext info){ 
        system.debug('HNDEBUG runTimeLine ==>'+ runTimeLine);
        // As the batch is being scheduled, we have added a bool check to limit the execution of batchClassforSAPSync when no records are being processed by BatchToMapHolder
        if(runTimeLine){
        batchClassforSAPSync b = new batchClassforSAPSync();
        database.executeBatch(b,50);
        }

} 

global void execute(SchedulableContext SC) {
        batchClassforSAPSync batch = new batchClassforSAPSync();
        database.executebatch(batch);
    }





}