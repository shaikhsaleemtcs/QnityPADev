//<MS20140526> Batch Class for creation of ExportToSAP records for Non-SAP Prices
//<GT20150107> Added logic to process only prices which are modified recently
//<SD20160701> Added null check for Sales Prices for current holder under IS ID-00071443
//<KS20160824> Added null check for BU and PCKC under IS ID-00072657
//<PG20170524> Handled Null check under issue IS ID-00081994
//<VK20210311> Fixed the code for Ship-To Country field mapping for Non SAP records IS SC-00097619
//<SH20221014> Fixed the code for Ship-To Country field mapping for Non SAP records IS SC-00105301

global class batchClassForNonSAPSync implements Database.Batchable<sObject>,Schedulable 
{
  //<GT20150107> START
  Set<String> pckcset = new Set<String>();
  //<GT20150107> END
  String bu;
  global batchClassForNonSAPSync(String business)
  {
    bu = business;
  }
  global batchClassForNonSAPSync()
  {
  }
  
  global database.queryLocator start(Database.BatchableContext BC)
  {
    
    if(bu!=null)
      return Database.getQueryLocator([Select pckc__c,isPriceHolder__c,bu__c from Sales_Prices__c where Bu__C=: bu and isPriceHolder__c=false ]);
    else
    return Database.getQueryLocator([Select pckc__c,isPriceHolder__c,bu__c from Sales_Prices__c where isPriceHolder__c=false and CreatedDate=TODAY]);
    
    
    /*for(Sales_Prices__c price: database.query('Select pckc__c  from Sales_Prices__c where lastmodifiedDate =Today and isPriceHolder__c=false'))
    {
      pckcset.add(price.pckc__c);
    }
    List<ERP_Export_to_SAP__c> exportNonSAPList = [Select id from ERP_Export_to_SAP__c where PCKC__C in :pckcset];
    system.debug('Delete PCKC Set:'+pckcset);
    if(exportNonSAPList.size()>0)
      delete exportNonSAPList;
    
    return Database.getQueryLocator([SELECT Ship_To_Country_Code__c, Ship_To_Country__c, ShipTo__c,ShipTo_Code__c, Approved_Date__c,BU__c,Calculation_Type__c,Calculation_Type_Code__c,
                    Condition_Class__c,Condition_Class_Code__c,Country__c,Customer_Price_Group__c,Customer_Price_Group_Code__c,Country_Code__c,
                    Customer_Specific__c,Dist_Channel__c,Dist_Channel_Code__c,Division__c,Division_Code__c,End_Use__c,End_Use_Code__c,
                    Incoterms1__c,Incoterms_1_Code__c,isPriceHolder__c,KC_SAP__c,Key_Combination__c,Key_Combination_Code__c,Landing_Cost__c,
                    markForDeletion__c,Material__c,Material_Code__c,Material_Price_Group__c,Material_Price_Group_Code__c,
                    pckc__c,PCKC_SAP__c,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,
                    PH9_Code__c,Plus_Minus__c,Plus_Minus_Code__c,Price_Holder__c,Price_List_Type__c,Price_List_Type_Code__c,
                    Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center__c,
                    Profit_Center_Code__c,Rate__c,Sales_Office__c,Sales_Office_Code__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,
                    Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,
                    Scaled_Price_Flag__c,Sold_To__c,Sold_To_Code__c,Sold_To_SAP__c,Status__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,
                    Valid_From__c,Valid_To__c,Contract__c,Contract_Code__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,
                    Sales_Order_Type_Code__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,
                    Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,
                    Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,
                    ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,
                    ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,
                    Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, 
                    Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c, Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c where pckc__c in : pckcset ]);
  */
  }
  global void execute(Database.BatchableContext BC,List<sObject> sList)
  {
    List<Sales_Prices__c> records = sList;
    //Start : Changes done by Kunal Sharma(752081) for null check handling of batch failure IS ID-00072657
    if(records != null && !records.isEmpty())
    {
    pckcset.clear();
    Set<String> buSet = new Set<String>();
    for(Sales_Prices__c price :records)
    {
      pckcset.add(price.pckc__c);
      buSet.add(price.BU__C);
    }
    List<ERP_Export_to_SAP__c> exportSAPList = [Select id from ERP_Export_to_SAP__c where  BU__C in :buSet and PCKC__C in :pckcset];
    system.debug('Delete PCKC Set size:'+pckcset.size());
    system.debug('Delete PCKC Set:'+pckcset);
    
    //<PG20170524>Fix Null error:-corrected if condition under IS ID-00081994
    //if(exportSAPList.size()>0)
    if(exportSAPList!=null && exportSAPList.size()>0)
      database.delete(exportSAPList,false);
    
    List<Sales_Prices__c> acList= [SELECT Ship_To_Country_Code__c, Ship_To_Country__c, ShipTo__c,ShipTo_Code__c, Approved_Date__c,BU__c,Calculation_Type__c,Calculation_Type_Code__c,
                    Condition_Class__c,Condition_Class_Code__c,Country__c,Customer_Price_Group__c,Customer_Price_Group_Code__c,Country_Code__c,
                    Customer_Specific__c,Dist_Channel__c,Dist_Channel_Code__c,Division__c,Division_Code__c,End_Use__c,End_Use_Code__c,
                    Incoterms1__c,Incoterms_1_Code__c,isPriceHolder__c,KC_SAP__c,Key_Combination__c,Key_Combination_Code__c,Landing_Cost__c,
                    markForDeletion__c,Material__c,Material_Code__c,Material_Price_Group__c,Material_Price_Group_Code__c,
                    pckc__c,PCKC_SAP__c,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,
                    PH9_Code__c,Plus_Minus__c,Plus_Minus_Code__c,Price_Holder__c,Price_List_Type__c,Price_List_Type_Code__c,
                    Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center__c,
                    Profit_Center_Code__c,Rate__c,Sales_Office__c,Sales_Office_Code__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,
                    Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,
                    Scaled_Price_Flag__c,Sold_To__c,Sold_To_Code__c,Sold_To_SAP__c,Status__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,
                    Valid_From__c,Valid_To__c,Contract__c,Contract_Code__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,
                    Sales_Order_Type_Code__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,
                    Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,
                    Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,
                    ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,
                    ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,
                    Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, 
                    Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Pricing_Request__c,Payer_Code__c,Disc_Ref_No__c, FixValDate__c, Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c where pckc__c in : pckcset and Bu__C in :buSet order by Approved_Date__c DESC];
    
    List<Sales_Prices__c> holderList = new List<Sales_Prices__c>();
    List<ERP_Export_to_SAP__c> addList = new List<ERP_Export_to_SAP__c>();
    Map<Id,List<Sales_Prices__c>> holderIdToChildRecMap = new Map<Id,List<Sales_Prices__c>>();
    
    //<PG20170524>Fix Null error:-Added if condition under IS ID-00081994
    if(acList!=null && acList.size()>0)
    {
        for(Sales_Prices__c checkHolder : acList)
        {
          if(checkHolder.isPriceHolder__c != null && !checkHolder.isPriceHolder__c)
          {  
            if(holderIdToChildRecMap.containsKey(checkHolder.Price_Holder__c))
            {
              List<Sales_Prices__c> l1 = holderIdToChildRecMap.get(checkHolder.Price_Holder__c);
              l1.add(checkHolder);
              holderIdToChildRecMap.put(checkHolder.Price_Holder__c,l1);
            }
            else
            {
              List<Sales_Prices__c> l1 = new List<Sales_Prices__c>();
              l1.add(checkHolder);
              holderIdToChildRecMap.put(checkHolder.Price_Holder__c,l1);
            }
          }
          if(checkHolder.isPriceHolder__c == true)
            holderList.add(checkHolder);
        }
    }
    List<ERP_Export_to_SAP__c> insertHolderList = new List<ERP_Export_to_SAP__c>();
    List<Id> holdIdList = new List<Id>();
    for(Sales_Prices__c currentHolder : holderList)
    {
      ERP_Export_to_SAP__c newAddHolder = new ERP_Export_to_SAP__c();
      Id sapId;
      copyToExportSAP(newAddHolder,currentHolder,true,sapId);
      insertHolderList.add(newAddHolder);
    }
    insert insertHolderList;

    for(ERP_Export_to_SAP__c s1 : insertHolderList)
    {
      holdIdList.add(s1.Id);
    }
    insertHolderList = [SELECT Id, Sales_Prices_Non_SAP_Holder__c FROM ERP_Export_to_SAP__c WHERE Id IN : holdIdList];

    Map<Id,Id> sapHolIdToCurHolIdMap = new Map<Id,Id>();
    for(ERP_Export_to_SAP__c sync : insertHolderList)
    {
      sapHolIdToCurHolIdMap.put(sync.Sales_Prices_Non_SAP_Holder__c, sync.Id);
    }

    for(Sales_Prices__c currentHolder : holderList)
    {
      List<Sales_Prices__c> holderPrices = new List<Sales_Prices__c>();
      List<ERP_Export_to_SAP__c> noPricePeriodList = new List<ERP_Export_to_SAP__c>();
      ERP_Export_to_SAP__c initialNoPrice = new ERP_Export_to_SAP__c();
      initialNoPrice.Valid_From__c = currentHolder.Valid_From__c;
      initialNoPrice.Valid_To__c = currentHolder.Valid_to__c;
      noPricePeriodList.add(initialNoPrice);
    //System.debug('currentHolder:'+currentHolder);
    //System.debug('currentHolder PCKC:'+currentHolder.PCKC__C);
    //System.debug('holderIdToChildRecMap:'+holderIdToChildRecMap);
    //System.debug(' holderIdToChildRecMap.get(currentHolder.Id):'+ holderIdToChildRecMap.get(currentHolder.Id));
      // <SD20160701> added null check for Sales Prices for current holder by Sumita Dabas under IS ID-00071443 START
      //<PG20170524>Fix Null error:-corrected if condition under IS ID-00081994
     if(holderIdToChildRecMap.containsKey(currentHolder.Id) && holderIdToChildRecMap.get(currentHolder.Id).size() > 0)
     //if(holderIdToChildRecMap.get(currentHolder.Id) != null && holderIdToChildRecMap.get(currentHolder.Id).size() > 0)
     {
          for(Sales_Prices__c currentPrice : holderIdToChildRecMap.get(currentHolder.Id))
          {
            String sapSyncId = sapHolIdToCurHolIdMap.get(currentPrice.Price_Holder__c);
            for(integer j = 0; j < noPricePeriodList.size() ; j++)
            {
              
              //price holder starts with the selected price
              if(currentPrice.Valid_from__c == noPricePeriodList[j].Valid_from__c)
              {
                
                if(noPricePeriodList[j].Valid_to__c > currentPrice.Valid_to__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_from__c = currentPrice.Valid_To__c + 1;
                }
                else if(noPricePeriodList[j].Valid_to__c < currentPrice.Valid_to__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  newAddPrice.Valid_to__c = noPricePeriodList[j].Valid_To__c;
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_From__c = newAddPrice.Valid_To__c;
                }
                else if(noPricePeriodList[j].Valid_To__c == currentPrice.Valid_To__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_From__c = noPricePeriodList[j].Valid_To__c;
                }
                //check if the noPrice is closed (valid from and valid to date are equal), if yes remove from list
                if(noPricePeriodList[j].Valid_From__c == noPricePeriodList[j].Valid_To__c)
                {
                  noPricePeriodList.remove(j);
                  j = j-1;
                }
              }
              else if(currentPrice.Valid_From__c > noPricePeriodList[j].Valid_From__c)
              {
                if(currentPrice.Valid_To__c < noPricePeriodList[j].Valid_To__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  ERP_Export_to_SAP__c newNoPrice = new ERP_Export_to_SAP__c();
                  newNoPrice.Valid_To__c = noPricePeriodList[j].Valid_To__c;
                  newNoPrice.Valid_From__c = currentPrice.Valid_To__c + 1;
                  noPricePeriodList[j].Valid_To__c = currentPrice.Valid_From__c - 1;
                  noPricePeriodList.add(newNoPrice);
                  addList.add(newAddPrice);
                }
                else if(currentPrice.Valid_To__c > noPricePeriodList[j].Valid_To__c
                    && currentPrice.Valid_From__c <= noPricePeriodList[j].Valid_To__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  newAddPrice.Valid_to__c = noPricePeriodList[j].Valid_To__c;
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_To__c = newAddPrice.Valid_From__c - 1;
                }
                else if(currentPrice.Valid_To__c == noPricePeriodList[j].Valid_To__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_To__c = currentPrice.Valid_From__c-1;
                }
                if(noPricePeriodList[j].Valid_From__c == noPricePeriodList[j].Valid_To__c)
                {
                  noPricePeriodList.remove(j);
                  j = j-1;
                }
              }
              else if(currentPrice.Valid_From__c < noPricePeriodList[j].Valid_From__c)
              {
                if(currentPrice.Valid_To__c < noPricePeriodList[j].Valid_To__c && currentPrice.Valid_To__c >= noPricePeriodList[j].Valid_From__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  newAddPrice.Valid_From__c = noPricePeriodList[j].Valid_From__c;
                  noPricePeriodList[j].Valid_From__c = currentPrice.Valid_To__c+1;
                  addList.add(newAddPrice);
                }
                else if(currentPrice.Valid_To__c > noPricePeriodList[j].Valid_To__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  newAddPrice.Valid_to__c = noPricePeriodList[j].Valid_To__c;
                  newAddPrice.Valid_From__c = noPricePeriodList[j].Valid_From__c;
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_To__c = noPricePeriodList[j].Valid_From__c;
                }
                else if(currentPrice.Valid_To__c == noPricePeriodList[j].Valid_To__c)
                {
                  ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                  copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                  newAddPrice.Valid_From__c = noPricePeriodList[j].Valid_From__c;
                  addList.add(newAddPrice);
                  noPricePeriodList[j].Valid_To__c = noPricePeriodList[j].Valid_From__c;
                }
                if(noPricePeriodList[j].Valid_From__c == noPricePeriodList[j].Valid_To__c)
                {
                  noPricePeriodList.remove(j);
                  j = j-1;
                }
              }
            }
          }
       }//<SD20160701> end of if for Sales Prices null check for current holder by Sumita Dabas under IS ID-00071443 END
    }
    database.upsert(addList,false);
    }
    // End : Changes done by Kunal Sharma(752081) for null check handling of batch failure IS ID-00072657
  }
  global void copyToExportSAP(ERP_Export_to_SAP__c newAddPrice,Sales_Prices__c currentPrice, boolean isHolder, Id sapSyncId)
  {
    newAddPrice.Approved_Date__c = currentPrice.Approved_Date__c;
    newAddPrice.BU__c = currentPrice.BU__c;
    newAddPrice.Calculation_Type__c = currentPrice.Calculation_Type__c;
    newAddPrice.Calculation_Type_Code__c = currentPrice.Calculation_Type_Code__c;
    newAddPrice.Condition_Class__c = currentPrice.Condition_Class__c;
    newAddPrice.Condition_Class_Code__c = currentPrice.Condition_Class_Code__c;
    newAddPrice.Country__c = currentPrice.Country__c;
    newAddPrice.Country_Code__c = currentPrice.Country_Code__c;
    //<SH20221014> START
    newAddPrice.Ship_To_Country_Code__c = currentPrice.Ship_To_Country_Code__c;
    newAddPrice.Ship_To_Country__c = currentPrice.Ship_To_Country__c;
    //<SH20221014> END
    newAddPrice.Customer_Price_Group__c = currentPrice.Customer_Price_Group__c;
    newAddPrice.Customer_Price_Group_Code__c = currentPrice.Customer_Price_Group_Code__c;
    newAddPrice.Customer_Specific__c = currentPrice.Customer_Specific__c;
    newAddPrice.Dist_Channel__c = currentPrice.Dist_Channel__c;
    newAddPrice.Distribution_Channel_Code__c = currentPrice.Dist_Channel_Code__c;
    newAddPrice.Division__c = currentPrice.Division__c;
    newAddPrice.Division_Code__c = currentPrice.Division_Code__c;
    newAddPrice.End_Use__c = currentPrice.End_Use__c;
    newAddPrice.End_Use_Code__c = currentPrice.End_Use_Code__c;
    newAddPrice.Incoterms1__c = currentPrice.Incoterms1__c;
    newAddPrice.Incoterms_1_Code__c = currentPrice.Incoterms_1_Code__c;
    newAddPrice.isPriceHolder__c = currentPrice.isPriceHolder__c;
    newAddPrice.KC_SAP__c = currentPrice.KC_SAP__c;
    newAddPrice.Key_Combination__c = currentPrice.Key_Combination__c;
    newAddPrice.Key_Combination_Code__c = currentPrice.Key_Combination_Code__c;
    newAddPrice.markForDeletion__c = currentPrice.markForDeletion__c;
    newAddPrice.Material__c = currentPrice.Material__c;
    newAddPrice.Material_Code__c = currentPrice.Material_Code__c;
    newAddPrice.Material_Price_Group__c = currentPrice.Material_Price_Group__c;
    newAddPrice.Material_Price_Group_Code__c = currentPrice.Material_Price_Group_Code__c;
    newAddPrice.Per__c = currentPrice.Per__c;
    newAddPrice.PH1_Code__c = currentPrice.PH1_Code__c;
    newAddPrice.PH2_Code__c = currentPrice.PH2_Code__c;
    newAddPrice.PH3_Code__c = currentPrice.PH3_Code__c;
    newAddPrice.PH4_Code__c = currentPrice.PH4_Code__c;
    newAddPrice.PH5_Code__c = currentPrice.PH5_Code__c;
    newAddPrice.PH6_Code__c = currentPrice.PH6_Code__c;
    newAddPrice.PH7_Code__c = currentPrice.PH7_Code__c;
    newAddPrice.PH8_Code__c = currentPrice.PH8_Code__c;
    newAddPrice.PH9_Code__c = currentPrice.PH9_Code__c;
    newAddPrice.Plus_Minus__c = currentPrice.Plus_Minus__c;
    newAddPrice.Plus_Minus_Code__c = currentPrice.Plus_Minus_Code__c;
    newAddPrice.Price_Holder__c = currentPrice.Price_Holder__c;
    newAddPrice.Price_List_Type__c = currentPrice.Price_List_Type__c;
    newAddPrice.Price_List_Type_Code__c = currentPrice.Price_List_Type_Code__c;
    newAddPrice.Pricing_Condition__c = currentPrice.Pricing_Condition__c;
    newAddPrice.Pricing_Condition_Code__c = currentPrice.Pricing_Condition_Code__c;
    newAddPrice.Product_Hierarchy__c = currentPrice.Product_Hierarchy__c;
    newAddPrice.Profit_Center__c = currentPrice.Profit_Center__c;
    newAddPrice.Profit_Center_Code__c = currentPrice.Profit_Center_Code__c;
    newAddPrice.Rate__c = currentPrice.Rate__c;
    newAddPrice.Sales_Office__c = currentPrice.Sales_Office__c;
    newAddPrice.Sales_Office_Code__c = currentPrice.Sales_Office_Code__c;
    newAddPrice.Sales_Org__c = currentPrice.Sales_Org__c;
    newAddPrice.Sales_Org_Code__c = currentPrice.Sales_Org_Code__c;
    newAddPrice.Sales_Price_Type__c = currentPrice.Sales_Price_Type__c;
    newAddPrice.Sales_Pricing_Procedure__c = currentPrice.Sales_Pricing_Procedure__c;
    newAddPrice.SAP_Application_Id__c = currentPrice.SAP_Application_Id__c;
    newAddPrice.SAP_Client_ID__c = currentPrice.SAP_Client_ID__c;
    newAddPrice.SAP_Cluster__c = currentPrice.SAP_Cluster__c;
    newAddPrice.Scaled_Price_Flag__c = currentPrice.Scaled_Price_Flag__c;
    newAddPrice.Sold_To__c = currentPrice.Sold_To__c;
    newAddPrice.Sold_To_Code__c = currentPrice.Sold_To_Code__c;
    newAddPrice.Terms_of_Payment_Code__c = currentPrice.Terms_of_Payment_Code__c;
    newAddPrice.Unit__c = currentPrice.Unit__c;
    newAddPrice.UoM__c = currentPrice.UoM__c;
    newAddPrice.Valid_From__c = currentPrice.Valid_From__c;
    newAddPrice.Valid_To__c = currentPrice.Valid_To__c;
    newAddPrice.Landing_Cost__c = currentPrice.Landing_Cost__c;
    newAddPrice.Variant__c = currentPrice.Variant__c;
    newAddPrice.Variant_Code__c = currentPrice.Variant_Code__c;
    newAddPrice.Contract__c = currentPrice.Contract__c;
    newAddPrice.Contract_Code__c = currentPrice.Contract_Code__c;
    newAddPrice.Material_Group_5_Key__c = currentPrice.Material_Group_5_Key__c;
    newAddPrice.Material_Group_5_Key_Code__c = currentPrice.Material_Group_5_Key_Code__c;
    newAddPrice.ComPartner__c = currentPrice.ComPartner__c;
    newAddPrice.ComPartner_Code__c = currentPrice.ComPartner_Code__c;
    newAddPrice.Plant__c = currentPrice.Plant__c;
    newAddPrice.Plant_Code__c = currentPrice.Plant_Code__c;
    newAddPrice.Shipping_Condition__c = currentPrice.Shipping_Condition__c;
    newAddPrice.Shipping_Condition_Code__c = currentPrice.Shipping_Condition_Code__c;
    newAddPrice.Destination_Country__c = currentPrice.Destination_Country__c;
    newAddPrice.Destination_Country_Code__c = currentPrice.Destination_Country_Code__c;
    newAddPrice.Sales_Order_Type__c = currentPrice.Sales_Order_Type__c;
    newAddPrice.Sales_Order_Type_Code__c = currentPrice.Sales_Order_Type_Code__c;
    newAddPrice.Kcode__c = currentPrice.Kcode__c;
    newAddPrice.Material_Group_1__c = currentPrice.Material_Group_1__c;
    newAddPrice.Material_Group_1_Code__c = currentPrice.Material_Group_1_Code__c;
    newAddPrice.Sales_District__c = currentPrice.Sales_District__c;
    newAddPrice.Sales_District_Code__c = currentPrice.Sales_District_Code__c;
    newAddPrice.Partner_ZF__c = currentPrice.Partner_ZF__c;
    newAddPrice.Partner_ZF_Code__c = currentPrice.Partner_ZF_Code__c;
    newAddPrice.Payer__c = currentPrice.Payer__c;
    newAddPrice.Payer_Code__c = currentPrice.Payer_Code__c;
    newAddPrice.Disc_Ref_No__c = currentPrice.Disc_Ref_No__c;
    newAddPrice.FixValDate__c = currentPrice.FixValDate__c;
    newAddPrice.Campaign__c = currentPrice.Campaign__c;
    newAddPrice.Campaign_Code__c = currentPrice.Campaign_Code__c;
    newAddPrice.Document_Currency__c = currentPrice.Document_Currency__c;
    newAddPrice.Document_Currency_Code__c = currentPrice.Document_Currency_Code__c;
    newAddPrice.State__c = currentPrice.State__c;
    newAddPrice.State_Code__c = currentPrice.State_Code__c;
    //Added mapping for approved price request ID
    newAddPrice.Pricing_Request__c = currentPrice.Pricing_Request__c;

    if(isHolder)
    {
      newAddPrice.Sales_Prices_Non_SAP_Holder__c = currentPrice.Id;
      newAddPrice.Price_Holder__c = null;
    }
    else
    {
      newAddPrice.Sales_Prices_Non_SAP_Holder__c = currentPrice.Price_Holder__c;
      newAddPrice.Price_Holder__c = sapSyncId;
    }
  }

  global void finish(Database.BatchableContext info)
  {
  }
  global void execute(SchedulableContext SC) {
    batchClassForNonSAPSync batch = new batchClassForNonSAPSync();
    database.executebatch(batch);
  }
}