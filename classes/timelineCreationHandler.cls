/*
 * Name             :   timelineCreationHandler
 * Description      :   The class is responsible for creating timeline (ERP_Export_to_SAP__c) record of the ERP Sales Prices SAP record being created
 * Author           :   Haider Naseem
 * Oroganisation    :   TCS
 * Created Date     :   20-October-2016
 *
 * Version   Modified Date     Modified By                Modification
 * 
 * --------------------------------------------------------------------------------------------------------------------
 *  v1.1      11/17/2016       Haider Naseem              Method createTimeLineforERPSap() has been made future method
 * --------------------------------------------------------------------------------------------------------------------
     v1.2    03/23/2018        Mansi Gupta                Mapped custom field Custom_Createddate__c
    v1.3     08/26/2022        Shantanu Sharma            Mapping Sales Order Item Fields //<SS20220826>
    v1.4     05/01/2023        Shantanu Sharma            Mapping M&M P80 Fields //<SS20230501>
 */
 
public class timelineCreationHandler {
        
    @future
    public static void createTimeLineforERPSap(Set<Id> salesPriceIdList){
        list<ERP_Sales_Prices_SAP__c> sList = [select id,PCKC__c,BU__C from ERP_Sales_Prices_SAP__c where id IN : salesPriceIdList];
        Set<String> pckcset = new Set<String>();
        System.debug(System.LoggingLevel.ERROR, 'Inside Class');
        System.debug(System.LoggingLevel.ERROR, 'Trigger.new size' + sList.size());
        List<ERP_Sales_Prices_SAP__c> records = sList;
        pckcset.clear();
        Set<String> buSet = new Set<String>();
        for(ERP_Sales_Prices_SAP__c price :records)
        {
            pckcset.add(price.pckc__c);
            buSet.add(price.BU__C);
        }
        
        List<ERP_Export_to_SAP__c> exportSAPList = [Select id from ERP_Export_to_SAP__c where  BU__C in :buSet and PCKC__C in :pckcset];
        System.debug(System.LoggingLevel.ERROR, 'exportSAPList' + exportSAPList.size()+'::'+limits.getDmlRows());
        system.debug('Delete PCKC Set size:'+pckcset.size());
        system.debug('Delete PCKC Set:'+pckcset);
        if(exportSAPList.size()>0)
        database.delete(exportSAPList,false);
        List<ERP_Sales_Prices_SAP__c> acList= [SELECT Scale_UoM_Scale_Unit__c, External_ERP_ID__c, Ship_To_Country__c,Ship_To_Country_Code__c,markForDeletion__c,
                                               isPriceHolder__c,Terms_of_Payment__c,Payment_Terms_Fixed_Date__c,Customer_Price_Payment_Terms__c,
                                               Valid_To__c, Valid_From__c, UoM__c, Unit__c,Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_SAP__c,
                                               Sold_To_Code__c, ShipTo__c,ShipTo_Code__c, Scaled_Price_Flag__c, Scale_Type__c, Scale_Type_Code__c, Scale_Basis__c,
                                               Scale_Basis_Code__c, ScaleRate9__c,ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c,
                                               ScaleRate3__c,ScaleRate2__c, ScaleRate1__c, ScaleRate10__c,Sales_Pricing_Procedure__c, Scale_Quantity_Scale_Value9__c,
                                               Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c,
                                               Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c,
                                               Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Price_Type__c,
                                               Sales_Org__c,Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c,
                                               SAP_Application_Id__c,Record_Id__c, Rate__c, Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c,
                                               Product_Hierarchy__c,Pricing_Condition__c, Pricing_Condition_Code__c, Customer_Hierarchy__c, Customer_Hierarchy_Code__c,
                                               Price_Ref_Partner__c, Price_Ref_Partner_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c,
                                               Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c,PH6__c,
                                               PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c,PH1__c, PH1_Code__c,
                                               PCKC__c, PCKC_SAP__c, Owning_Business__c, OwnerId, Name, Material__c,Product_Hierarchy_Code__c,Material_Price_Group__c,
                                               Material_Price_Group_Code__c, Material_Code__c, Market_Segment__c, Market_Segment_Code__c,Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,
                                               ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,
                                               Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c,
                                               Key_Combination_Code__c, KC_SAP__c,IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, F_Product_Hierarchy_Code__c,
                                               End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c,
                                               Dist_Channel__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode,
                                               CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c,Check_Scale__c,
                                               Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, BU__c,
                                               Approved_Date__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,
                                               Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,Pricing_Request__c, 
                                               Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c where pckc__c in : pckcset and Bu__C in :buSet order by Approved_Date__c DESC]; //<SS20220826> - Added Sales Order Item fields //<SS20230501>


        List<ERP_Sales_Prices_SAP__c> holderList = new List<ERP_Sales_Prices_SAP__c>();
        List<ERP_Export_to_SAP__c> addList = new List<ERP_Export_to_SAP__c>();
        Map<Id,List<ERP_Sales_Prices_SAP__c>> holderIdToChildRecMap = new Map<Id,List<ERP_Sales_Prices_SAP__c>>();

        for(ERP_Sales_Prices_SAP__c checkHolder : acList)
        { 
            if(checkHolder.isPriceHolder__c != null && !checkHolder.isPriceHolder__c)
            {
                if(holderIdToChildRecMap.containsKey(checkHolder.Price_Holder__c))
                {
                    List<ERP_Sales_Prices_SAP__c> l1 = holderIdToChildRecMap.get(checkHolder.Price_Holder__c);
                    l1.add(checkHolder);
                    holderIdToChildRecMap.put(checkHolder.Price_Holder__c,l1);
                }
                else
                {
                    List<ERP_Sales_Prices_SAP__c> l1 = new List<ERP_Sales_Prices_SAP__c>();
                    l1.add(checkHolder);
                    holderIdToChildRecMap.put(checkHolder.Price_Holder__c,l1);
                }
            }
            if(checkHolder.isPriceHolder__c == true)
                holderList.add(checkHolder);
        }
        List<ERP_Export_to_SAP__c> insertHolderList = new List<ERP_Export_to_SAP__c>();
        List<Id> holdIdList = new List<Id>();
        for(ERP_Sales_Prices_SAP__c currentHolder : holderList)
        {
            ERP_Export_to_SAP__c newAddHolder= new ERP_Export_to_SAP__c();
            Id sapId;
            copyToExportSAP(newAddHolder,currentHolder,true,sapId);
            insertHolderList.add(newAddHolder);
        }
        //insert insertHolderList;
        //added database method to capture the partial success incase owner not active.
        database.insert(insertHolderList,false);

        for(ERP_Export_to_SAP__c s1 : insertHolderList)
        {
            holdIdList.add(s1.Id);
        }
        insertHolderList = [SELECT Id, ERP_Sales_Prices_SAP_Holder__c FROM ERP_Export_to_SAP__c WHERE Id IN :holdIdList];

        Map<Id,Id> sapHolIdToCurHolIdMap = new Map<Id,Id>();
        for(ERP_Export_to_SAP__c sync : insertHolderList)
        {
            sapHolIdToCurHolIdMap.put(sync.ERP_Sales_Prices_SAP_Holder__c, sync.Id);
        }

        for(ERP_Sales_Prices_SAP__c currentHolder : holderList)
        {
            List<ERP_Sales_Prices_SAP__c> holderPrices = new List<ERP_Sales_Prices_SAP__c>();
            List<ERP_Export_to_SAP__c> noPricePeriodList = new List<ERP_Export_to_SAP__c>();
            ERP_Export_to_SAP__c initialNoPrice = new ERP_Export_to_SAP__c();
            initialNoPrice.Valid_From__c = currentHolder.Valid_From__c;
            initialNoPrice.Valid_To__c = currentHolder.Valid_to__c;
            noPricePeriodList.add(initialNoPrice);
            System.debug('currentHolder:'+currentHolder);
            System.debug('currentHolder PCKC:'+currentHolder.PCKC__C);
            System.debug('holderIdToChildRecMap:'+holderIdToChildRecMap);
            System.debug(' holderIdToChildRecMap.get(currentHolder.Id):'+ holderIdToChildRecMap.get(currentHolder.Id));
            if(holderIdToChildRecMap.containsKey(currentHolder.Id))
                for(ERP_Sales_Prices_SAP__c currentPrice : holderIdToChildRecMap.get(currentHolder.Id))
                {
                    String sapSyncId = sapHolIdToCurHolIdMap.get(currentPrice.Price_Holder__c);
                    for(integer j = 0; j < noPricePeriodList.size() ; j++)
                    {
                        //price holder starts with the selected price
                        if(currentPrice.Valid_from__c == noPricePeriodList[j].Valid_from__c)
                        {
                            System.debug(System.LoggingLevel.ERROR, '1'+'  '+'currentPrice.Valid_from__c: '+currentPrice.Valid_from__c+'  '+'noPricePeriodList[j].Valid_from__c: '+noPricePeriodList[j].Valid_from__c);
                            if(noPricePeriodList[j].Valid_to__c > currentPrice.Valid_to__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '1a');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_from__c = currentPrice.Valid_To__c + 1;
                            }
                            else if(noPricePeriodList[j].Valid_to__c < currentPrice.Valid_to__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '1b');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                newAddPrice.Valid_to__c = noPricePeriodList[j].Valid_To__c;
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_From__c = newAddPrice.Valid_To__c;
                            }
                            else if(noPricePeriodList[j].Valid_To__c == currentPrice.Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '1c'+'  '+'noPricePeriodList[j].Valid_To__c: '+noPricePeriodList[j].Valid_To__c +'  '+ 'currentPrice.Valid_To__c: '+currentPrice.Valid_To__c);
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_From__c = noPricePeriodList[j].Valid_To__c;
                            }
                            //check if the noPrice is closed (valid from and valid to date are equal), if yes remove from list
                            
                            if(noPricePeriodList[j].Valid_From__c == noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '1d'+'  '+'noPricePeriodList[j].Valid_From__c: '+ noPricePeriodList[j].Valid_To__c+'  '+ 'noPricePeriodList[j].Valid_To__c: '+noPricePeriodList[j].Valid_To__c);
                                noPricePeriodList.remove(j);
                                j = j-1;
                            }
                        }

                        else if(currentPrice.Valid_From__c > noPricePeriodList[j].Valid_From__c)
                        {
                            System.debug(System.LoggingLevel.ERROR, '2');
                            if(currentPrice.Valid_To__c < noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '2a');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                ERP_Export_to_SAP__c newNoPrice = new ERP_Export_to_SAP__c();
                                newNoPrice.Valid_To__c = noPricePeriodList[j].Valid_To__c;
                                newNoPrice.Valid_From__c = currentPrice.Valid_To__c + 1;
                                noPricePeriodList[j].Valid_To__c = currentPrice.Valid_From__c - 1;
                                noPricePeriodList.add(newNoPrice);
                                addList.add(newAddPrice);
                            }
                            else if(currentPrice.Valid_To__c > noPricePeriodList[j].Valid_To__c && currentPrice.Valid_From__c <= noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '2b');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                newAddPrice.Valid_to__c = noPricePeriodList[j].Valid_To__c;
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_To__c=newAddPrice.Valid_From__c - 1;
                            }
                            else if(currentPrice.Valid_To__c == noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '2c');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_To__c = currentPrice.Valid_From__c - 1;
                            }
                            if(noPricePeriodList[j].Valid_From__c == noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '2d');
                                noPricePeriodList.remove(j);
                                j = j-1;
                            }
                        }
                        else if(currentPrice.Valid_From__c < noPricePeriodList[j].Valid_From__c)
                        {
                            System.debug(System.LoggingLevel.ERROR, '3');
                            if(currentPrice.Valid_To__c < noPricePeriodList[j].Valid_To__c && currentPrice.Valid_To__c >= noPricePeriodList[j].Valid_From__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '3a');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                newAddPrice.Valid_From__c = noPricePeriodList[j].Valid_From__c;
                                noPricePeriodList[j].Valid_From__c = currentPrice.Valid_To__c + 1;
                                addList.add(newAddPrice);
                            }
                            else if(currentPrice.Valid_To__c > noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '3b');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                newAddPrice.Valid_to__c = noPricePeriodList[j].Valid_To__c;
                                newAddPrice.Valid_From__c = noPricePeriodList[j].Valid_From__c;
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_To__c = noPricePeriodList[j].Valid_From__c;
                            }
                            else if(currentPrice.Valid_To__c == noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '3c');
                                ERP_Export_to_SAP__c newAddPrice = new ERP_Export_to_SAP__c();
                                copyToExportSAP(newAddPrice,currentPrice,false,sapSyncId);
                                newAddPrice.Valid_From__c = noPricePeriodList[j].Valid_From__c;
                                addList.add(newAddPrice);
                                noPricePeriodList[j].Valid_To__c = noPricePeriodList[j].Valid_From__c;
                            }
                            if(noPricePeriodList[j].Valid_From__c == noPricePeriodList[j].Valid_To__c)
                            {
                                System.debug(System.LoggingLevel.ERROR, '3d');
                                noPricePeriodList.remove(j);
                                j = j-1;
                            }
                        }
                    }   
                }
        }
        System.debug(System.LoggingLevel.ERROR, 'addList.size()' + addList.size());
        if(addList.size()>0)
            {
             List<Database.UpsertResult> results = database.upsert(addList,false);
             for(Database.UpsertResult theResult:results) {
                  if(theResult.isSuccess())
                  continue; // next item
                  List<Database.Error> errors = theResult.getErrors();
                  for(Database.Error theError:Errors) {
                      System.debug(System.LoggingLevel.ERROR,'Error Received: ' + theError.getMessage());
                    
                  }
                }
            }
         
      
        System.debug(System.LoggingLevel.ERROR, 'Upsert Done');
       
    }
    
     public static void copyToExportSAP(ERP_Export_to_SAP__c newAddPrice,ERP_Sales_Prices_SAP__c currentPrice, boolean isHolder, Id sapSyncId)
    {
        //<MG03232018> Mapped field Custom_Createddate__c
         newAddPrice.Custom_Createddate__c= currentPrice.CreatedDate;
        newAddPrice.Approved_Date__c = currentPrice.Approved_Date__c;
        newAddPrice.BU__c = currentPrice.BU__c;
        newAddPrice.Calculation_Type__c = currentPrice.Calculation_Type__c;
        newAddPrice.Calculation_Type_Code__c = currentPrice.Calculation_Type_Code__c;
        newAddPrice.Check_Scale__c = currentPrice.Check_Scale__c;
        newAddPrice.Check_Scale_Code__c = currentPrice.Check_Scale_Code__c;
        newAddPrice.Condition_Class__c = currentPrice.Condition_Class__c;
        newAddPrice.Condition_Class_Code__c = currentPrice.Condition_Class_Code__c;
        newAddPrice.Country__c = currentPrice.Country__c;
        newAddPrice.Country_Code__c = currentPrice.Country_Code__c;
        newAddPrice.Customer_Hierarchy__c = currentPrice.Customer_Hierarchy__c;
        newAddPrice.Customer_Hierarchy_Code__c = currentPrice.Customer_Hierarchy_Code__c;
        newAddPrice.Customer_Price_Group__c = currentPrice.Customer_Price_Group__c;
        newAddPrice.Customer_Price_Group_Code__c = currentPrice.Customer_Price_Group_Code__c;
        newAddPrice.Customer_Specific__c = currentPrice.Customer_Specific__c;
        newAddPrice.Disc_Ref__c = currentPrice.Disc_Ref__c;
        newAddPrice.Dist_Channel__c = currentPrice.Dist_Channel__c;
        newAddPrice.Distribution_Channel_Code__c = currentPrice.Distribution_Channel_Code__c;
        newAddPrice.Division__c = currentPrice.Division__c;
        newAddPrice.Division_Code__c = currentPrice.Division_Code__c;
        newAddPrice.End_Use__c = currentPrice.End_Use__c;
        newAddPrice.End_Use_Code__c = currentPrice.End_Use_Code__c;
        //<KK20200904> To display timeline correctly
        newAddPrice.Distributor_Code__c = currentPrice.Distributor_Code__c;
        newAddPrice.Distributor_Name__c = currentPrice.Distributor_Name__c;
        newAddPrice.End_User__c = currentPrice.End_User__c;
        newAddPrice.End_User_Code__c = currentPrice.End_User_Code__c;
        newAddPrice.External_ERP_ID__c = currentPrice.External_ERP_ID__c;
        newAddPrice.Incoterms1__c = currentPrice.Incoterms1__c;
        newAddPrice.Incoterms_1_Code__c = currentPrice.Incoterms_1_Code__c;
        newAddPrice.ComPartner__c = currentPrice.ComPartner__c;
        newAddPrice.ComPartner_Code__c = currentPrice.ComPartner_Code__c;
        newAddPrice.Material_Group_5_Key__c = currentPrice.Material_Group_5_Key__c;
        newAddPrice.Material_Group_5_Key_Code__c = currentPrice.Material_Group_5_Key_Code__c;
        newAddPrice.isPriceHolder__c = currentPrice.isPriceHolder__c;
        newAddPrice.KC_SAP__c = currentPrice.KC_SAP__c;
        newAddPrice.Key_Combination__c = currentPrice.Key_Combination__c;
        newAddPrice.Key_Combination_Code__c = currentPrice.Key_Combination_Code__c;
        newAddPrice.Market_Segment__c = currentPrice.Market_Segment__c;
        newAddPrice.Market_Segment_Code__c = currentPrice.Market_Segment_Code__c;
        newAddPrice.markForDeletion__c = currentPrice.markForDeletion__c;
        newAddPrice.Material__c = currentPrice.Material__c;
        newAddPrice.Material_Code__c = currentPrice.Material_Code__c;
        newAddPrice.Material_Price_Group__c = currentPrice.Material_Price_Group__c;
        newAddPrice.Material_Price_Group_Code__c = currentPrice.Material_Price_Group_Code__c;
        newAddPrice.Owning_Business__c = currentPrice.Owning_Business__c;
        newAddPrice.Per__c = currentPrice.Per__c;
        newAddPrice.PH1__c = currentPrice.PH1__c;
        newAddPrice.PH1_Code__c = currentPrice.PH1_Code__c;
        newAddPrice.PH2__c = currentPrice.PH2__c;
        newAddPrice.PH2_Code__c = currentPrice.PH2_Code__c;
        newAddPrice.PH3__c = currentPrice.PH3__c;
        newAddPrice.PH3_Code__c = currentPrice.PH3_Code__c;
        newAddPrice.PH4__c = currentPrice.PH4__c;
        newAddPrice.PH4_Code__c = currentPrice.PH4_Code__c;
        newAddPrice.PH5__c = currentPrice.PH5__c;
        newAddPrice.PH5_Code__c = currentPrice.PH5_Code__c;
        newAddPrice.PH6__c = currentPrice.PH6__c;
        newAddPrice.PH6_Code__c = currentPrice.PH6_Code__c;
        newAddPrice.PH7__c = currentPrice.PH7__c;
        newAddPrice.PH7_Code__c = currentPrice.PH7_Code__c;
        newAddPrice.PH8__c = currentPrice.PH8__c;
        newAddPrice.PH8_Code__c = currentPrice.PH8_Code__c;
        newAddPrice.PH9__c = currentPrice.PH9__c;
        newAddPrice.PH9_Code__c = currentPrice.PH9_Code__c;
        newAddPrice.Plus_Minus__c = currentPrice.Plus_Minus__c;
        newAddPrice.Plus_Minus_Code__c = currentPrice.Plus_Minus_Code__c;
        newAddPrice.Price_List_Type__c = currentPrice.Price_List_Type__c;
        newAddPrice.Price_List_Type_Code__c = currentPrice.Price_List_Type_Code__c;
        newAddPrice.Price_Ref_Partner__c = currentPrice.Price_Ref_Partner__c;
        newAddPrice.Price_Ref_Partner_Code__c = currentPrice.Price_Ref_Partner_Code__c;
        newAddPrice.Pricing_Condition__c = currentPrice.Pricing_Condition__c;
        newAddPrice.Pricing_Condition_Code__c = currentPrice.Pricing_Condition_Code__c;
        newAddPrice.Product_Hierarchy__c = currentPrice.Product_Hierarchy__c;
        newAddPrice.Product_Hierarchy_Code__c = currentPrice.F_Product_Hierarchy_Code__c;
        newAddPrice.Profit_Center__c = currentPrice.Profit_Center__c;
        newAddPrice.Profit_Center_Code__c = currentPrice.Profit_Center_Code__c;
        newAddPrice.Project_Id__c = currentPrice.Project_Id__c;
        newAddPrice.Quantity__c = currentPrice.Quantity__c;
        newAddPrice.Rate__c = currentPrice.Rate__c;
        newAddPrice.Record_Id__c = currentPrice.Record_Id__c;
        newAddPrice.Sales_Order_Type__c = currentPrice.Sales_Office__c;
        newAddPrice.Sales_Order_Type_Code__c = currentPrice.Sales_Office_Code__c;
        newAddPrice.Sales_Office__c = currentPrice.Sales_Order_Type__c;
        newAddPrice.Sales_Office_Code__c = currentPrice.Sales_Order_Type_Code__c;
        //<SS20220826> Mapping Sales Order Item fileds - START
        newAddPrice.Sales_Order_Item__c= currentPrice.Sales_Order_Item__c;
        newAddPrice.Sales_Order_Item_Code__c= currentPrice.Sales_Order_Item_Code__c;
        //<SS20230501> Mapping M&M P80 fields
        newAddPrice.Value_Center__c= currentPrice.Value_Center__c;
        newAddPrice.Value_Center_Code__c= currentPrice.Value_Center_Code__c;
        newAddPrice.Material_group_2__c= currentPrice.Material_group_2__c;
        newAddPrice.Material_group_2_Code__c= currentPrice.Material_group_2_Code__c;
        newAddPrice.Ext_Matl_Grp__c= currentPrice.Ext_Matl_Grp__c;
        newAddPrice.Ext_Matl_Grp_Code__c= currentPrice.Ext_Matl_Grp_Code__c;
        newAddPrice.Price_Zone__c= currentPrice.Price_Zone__c;
        newAddPrice.Price_Zone_Code__c= currentPrice.Price_Zone_Code__c;
        //<SS20220826> Mapping Sales Order Item fileds - END
        newAddPrice.Sales_Org__c = currentPrice.Sales_Org__c;
        newAddPrice.Sales_Org_Code__c = currentPrice.Sales_Org_Code__c;
        newAddPrice.Sales_Price_Type__c = currentPrice.Sales_Price_Type__c;
        newAddPrice.Sales_Pricing_Procedure__c = currentPrice.Sales_Pricing_Procedure__c;
        newAddPrice.SAP_Application_Id__c = currentPrice.SAP_Application_Id__c;
        newAddPrice.SAP_Client_ID__c = currentPrice.SAP_Client_ID__c;
        newAddPrice.SAP_Cluster__c = currentPrice.SAP_Cluster__c;
        newAddPrice.Scale_Basis__c = currentPrice.Scale_Basis__c;
        newAddPrice.Scale_Basis_Code__c = currentPrice.Scale_Basis_Code__c;
        newAddPrice.Scaled_Price_Flag__c = currentPrice.Scaled_Price_Flag__c;
        newAddPrice.Scale_Quantity_Scale_Value1__c = currentPrice.Scale_Quantity_Scale_Value1__c;
        newAddPrice.Scale_Quantity_Scale_Value10__c = currentPrice.Scale_Quantity_Scale_Value10__c;
        newAddPrice.Scale_Quantity_Scale_Value2__c = currentPrice.Scale_Quantity_Scale_Value2__c;
        newAddPrice.Scale_Quantity_Scale_Value3__c = currentPrice.Scale_Quantity_Scale_Value3__c;
        newAddPrice.Scale_Quantity_Scale_Value4__c = currentPrice.Scale_Quantity_Scale_Value4__c;
        newAddPrice.Scale_Quantity_Scale_Value5__c = currentPrice.Scale_Quantity_Scale_Value5__c;
        newAddPrice.Scale_Quantity_Scale_Value6__c = currentPrice.Scale_Quantity_Scale_Value6__c;
        newAddPrice.Scale_Quantity_Scale_Value7__c = currentPrice.Scale_Quantity_Scale_Value7__c;
        newAddPrice.Scale_Quantity_Scale_Value8__c = currentPrice.Scale_Quantity_Scale_Value8__c;
        newAddPrice.Scale_Quantity_Scale_Value9__c = currentPrice.Scale_Quantity_Scale_Value9__c;
        newAddPrice.ScaleRate1__c = currentPrice.ScaleRate1__c;
        newAddPrice.ScaleRate10__c = currentPrice.ScaleRate10__c;
        newAddPrice.ScaleRate2__c = currentPrice.ScaleRate2__c;
        newAddPrice.ScaleRate3__c = currentPrice.ScaleRate3__c;
        newAddPrice.ScaleRate4__c = currentPrice.ScaleRate4__c;
        newAddPrice.ScaleRate5__c = currentPrice.ScaleRate5__c;
        newAddPrice.ScaleRate6__c = currentPrice.ScaleRate6__c;
        newAddPrice.ScaleRate7__c = currentPrice.ScaleRate7__c;
        newAddPrice.ScaleRate8__c = currentPrice.ScaleRate8__c;
        newAddPrice.ScaleRate9__c = currentPrice.ScaleRate9__c;
        newAddPrice.Scale_Type__c = currentPrice.Scale_Type__c;
        newAddPrice.Scale_Type_Code__c = currentPrice.Scale_Type_Code__c;
        newAddPrice.Scale_UoM_Scale_Unit__c = currentPrice.Scale_UoM_Scale_Unit__c;
        newAddPrice.ShipTo__c = currentPrice.ShipTo__c;
        newAddPrice.ShipTo_Code__c = currentPrice.ShipTo_Code__c;
        newAddPrice.Ship_To_Country__c = currentPrice.Ship_To_Country__c;
        newAddPrice.Ship_To_Country_Code__c = currentPrice.Ship_To_Country_Code__c;
        newAddPrice.Sold_To__c = currentPrice.Sold_To__c;
        newAddPrice.Sold_To_Code__c = currentPrice.Sold_To_Code__c;
        newAddPrice.Terms_of_Payment_Code__c = currentPrice.Terms_of_Payment_Code__c;
        newAddPrice.Unit__c = currentPrice.Unit__c;
        newAddPrice.UoM__c = currentPrice.UoM__c;
        newAddPrice.Valid_From__c = currentPrice.Valid_From__c;
        newAddPrice.Valid_To__c = currentPrice.Valid_To__c;
        newAddPrice.Variant__c = currentPrice.Variant__c;
        newAddPrice.Variant_Code__c = currentPrice.Variant_Code__c;
        newAddPrice.Contract__c = currentPrice.Contract__c;
        newAddPrice.Contract_Code__c = currentPrice.Contract_Code__c;
        newAddPrice.ComPartner__c = currentPrice.ComPartner__c;
        newAddPrice.ComPartner_Code__c = currentPrice.ComPartner_Code__c;
        newAddPrice.Material_Group_5_Key__c = currentPrice.Material_Group_5_Key__c;
        newAddPrice.Material_Group_5_Key_Code__c = currentPrice.Material_Group_5_Key_Code__c;
        newAddPrice.Plant__c = currentPrice.Plant__c;
        newAddPrice.Plant_Code__c = currentPrice.Plant_Code__c;
        newAddPrice.Shipping_Condition__c = currentPrice.Shipping_Condition__c;
        newAddPrice.Shipping_Condition_Code__c = currentPrice.Shipping_Condition_Code__c;
        newAddPrice.Destination_Country__c = currentPrice.Destination_Country__c;
        newAddPrice.Destination_Country_Code__c = currentPrice.Destination_Country_Code__c;
        newAddPrice.Terms_of_Payment__c = currentPrice.Terms_of_Payment__c;
        newAddPrice.Payment_Terms_Fixed_Date__c = currentPrice.Payment_Terms_Fixed_Date__c;
        newAddPrice.Customer_Price_Payment_Terms__c = currentPrice.Customer_Price_Payment_Terms__c;
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
        //Added mapping for approved price request ID
        newAddPrice.Pricing_Request__c = currentPrice.Pricing_Request__c;
        //Added owner id mapping
        newAddPrice.OwnerId = currentPrice.ownerid;
        newAddPrice.Campaign__c = currentPrice.Campaign__c;
        newAddPrice.Campaign_Code__c = currentPrice.Campaign_Code__c;
        newAddPrice.Document_Currency__c = currentPrice.Document_Currency__c;
        newAddPrice.Document_Currency_Code__c = currentPrice.Document_Currency_Code__c;
        newAddPrice.State__c = currentPrice.State__c;
        newAddPrice.State_Code__c = currentPrice.State_Code__c;
        if(isHolder)
        {
            newAddPrice.ERP_Sales_Prices_SAP_Holder__c = currentPrice.Id;
            newAddPrice.Price_Holder__c = null;
        }
        else
        {
            newAddPrice.ERP_Sales_Prices_SAP_Holder__c = currentPrice.Price_Holder__c;
            newAddPrice.Price_Holder__c = sapSyncId;
        }
    }
}