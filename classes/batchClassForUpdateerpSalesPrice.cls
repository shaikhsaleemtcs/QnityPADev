/*****************************************************************************
Author: Sumita Dabas
Email: s.dabas@tcs.com
Date: 2/09/2016
Description: class to update ERP Sales Prices SAP for checking the unnecessary population of fields on the basis of Key combination value
@version  1.0

**********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic to include Sales Order Item and Sales Order Item Code values - CRM-2022-07-0225
 
**********************************************************************************************************************
<SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   01 May 2023
 Description        :   Added logic to include M&M P80 Fields 
********************************************************************************/

global class batchClassForUpdateerpSalesPrice implements Database.Batchable<sObject>
{
    public List<ERP_Sales_Prices_SAP__c> allERPSalesPricesSAP = new List<ERP_Sales_Prices_SAP__c>();
    public List<ERP_Sales_Prices_SAP__c> ERPSalesPricesSAPToBeUpdated = new List<ERP_Sales_Prices_SAP__c>();
    public Set<Id> erpSAPIdSet = new Set<Id>();
    
    global database.queryLocator start(Database.BatchableContext BC)
    {    
        String queryString='SELECT Approved_Date__c,BU__c,Calculation_Type_Code__c,Calculation_Type__c,Campaign_Code__c,Campaign__c,Char_Name__c,Check_Scale_Code__c,Check_Scale__c,Comm_Ptr_Code__c,Comm_Ptr__c,ComPartner_Code__c,ComPartner__c,Condition_Class_Code__c,Condition_Class__c,Contract_Code__c,Contract__c,Country_Code__c,Country__c,CreatedById,CreatedDate,CurrencyIsoCode,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Price_Payment_Terms__c,Customer_Specific__c,Cust_Mkt_Segment_Code__c,Cust_Mkt_Segment__c,Destination_Country_Code__c,Destination_Country__c,Disc_Ref_No__c,Disc_Ref__c,Distribution_Channel_Code__c,Dist_Channel__c,Division_Code__c,Division__c,Document_Currency_Code__c,Document_Currency__c,End_User_Code__c,End_User__c,End_Use_Code__c,End_Use__c,External_ERP_ID__c,FixValDate__c,F_Product_Hierarchy_Code__c,Id,Incoterms1__c,Incoterms_1_Code__c,IsDeleted,isPriceHolder__c,Kcode__c,KC_SAP__c,Key_Combination_Code__c,Key_Combination__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Market_Segment_Code__c,Market_Segment__c,markForDeletion__c,Material_Code__c,Material_Group_1_Code__c,Material_Group_1__c,Material_Group_5_Key_Code__c,Material_Group_5_Key__c,Material_Price_Group_Code__c,Material_Price_Group__c,Material__c,Name,OwnerId,Owning_Business__c,Partner_ZF_Code__c,Partner_ZF__c,Payer_Code__c,Payer__c,Payment_Terms_Fixed_Date__c,PCKC_SAP__c,PCKC__c,Per__c,PH1_Code__c,PH1__c,PH2_Code__c,PH2__c,PH3_Code__c,PH3__c,PH4_Code__c,PH4__c,PH5_Code__c,PH5__c,PH6_Code__c,PH6__c,PH7_Code__c,PH7__c,PH8_Code__c,PH8__c,PH9_Code__c,PH9__c,Plant_Code__c,Plant__c,Plus_Minus_Code__c,Plus_Minus__c,Price_Holder__c,Price_List_Type_Code__c,Price_List_Type__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Pricing_Condition_Code__c,Pricing_Condition__c,Pricing_Request__c,Product_Hierarchy_Code__c,Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Project_Id__c,Project__c,Quantity__c,Rate__c,Record_Id__c,Release_Status__c,Sales_District_Code__c,Sales_District__c,Sales_Office_Code__c,Sales_Office__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Sales_Org_Code__c,Sales_Org__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_Type__c,Scale_UoM_Scale_Unit__c,Shipping_Condition_Code__c,Shipping_Condition__c,ShipTo_Code__c,ShipTo_Country_Code__c,ShipTo_Country__c,ShipTo__c,Ship_To_Country_Code__c,Ship_To_Country__c,Sold_To_Code__c,Sold_To_SAP__c,Sold_To__c,State_Code__c,State__c,SystemModstamp,Terms_of_Payment_Code__c,Terms_of_Payment__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,Variant_Code__c,Variant__c,Volume_UoM__c,Volume__c FROM ERP_Sales_Prices_SAP__c WHERE markForDeletion__c = False ORDER BY CreatedDate ASC'; //<SS20220826> - Added Sales Order Item fields in query <SS20230501> 
        if(Test.isrunningTest()){
           queryString='SELECT Approved_Date__c,BU__c,Calculation_Type_Code__c,Calculation_Type__c,Campaign_Code__c,Campaign__c,Char_Name__c,Check_Scale_Code__c,Check_Scale__c,Comm_Ptr_Code__c,Comm_Ptr__c,ComPartner_Code__c,ComPartner__c,Condition_Class_Code__c,Condition_Class__c,Contract_Code__c,Contract__c,Country_Code__c,Country__c,CreatedById,CreatedDate,CurrencyIsoCode,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Price_Payment_Terms__c,Customer_Specific__c,Cust_Mkt_Segment_Code__c,Cust_Mkt_Segment__c,Destination_Country_Code__c,Destination_Country__c,Disc_Ref_No__c,Disc_Ref__c,Distribution_Channel_Code__c,Dist_Channel__c,Division_Code__c,Division__c,Document_Currency_Code__c,Document_Currency__c,End_User_Code__c,End_User__c,End_Use_Code__c,End_Use__c,External_ERP_ID__c,FixValDate__c,F_Product_Hierarchy_Code__c,Id,Incoterms1__c,Incoterms_1_Code__c,IsDeleted,isPriceHolder__c,Kcode__c,KC_SAP__c,Key_Combination_Code__c,Key_Combination__c,LastActivityDate,LastModifiedById,LastModifiedDate,Market_Segment_Code__c,Market_Segment__c,markForDeletion__c,Material_Code__c,Material_Group_1_Code__c,Material_Group_1__c,Material_Group_5_Key_Code__c,Material_Group_5_Key__c,Material_Price_Group_Code__c,Material_Price_Group__c,Material__c,Name,OwnerId,Owning_Business__c,Partner_ZF_Code__c,Partner_ZF__c,Payer_Code__c,Payer__c,Payment_Terms_Fixed_Date__c,PCKC_SAP__c,PCKC__c,Per__c,PH1_Code__c,PH1__c,PH2_Code__c,PH2__c,PH3_Code__c,PH3__c,PH4_Code__c,PH4__c,PH5_Code__c,PH5__c,PH6_Code__c,PH6__c,PH7_Code__c,PH7__c,PH8_Code__c,PH8__c,PH9_Code__c,PH9__c,Plant_Code__c,Plant__c,Plus_Minus_Code__c,Plus_Minus__c,Price_Holder__c,Price_List_Type_Code__c,Price_List_Type__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Pricing_Condition_Code__c,Pricing_Condition__c,Pricing_Request__c,Product_Hierarchy_Code__c,Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Project_Id__c,Project__c,Quantity__c,Rate__c,Record_Id__c,Release_Status__c,Sales_District_Code__c,Sales_District__c,Sales_Office_Code__c,Sales_Office__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Sales_Org_Code__c,Sales_Org__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_Type__c,Scale_UoM_Scale_Unit__c,Shipping_Condition_Code__c,Shipping_Condition__c,ShipTo_Code__c,ShipTo_Country_Code__c,ShipTo_Country__c,ShipTo__c,Ship_To_Country_Code__c,Ship_To_Country__c,Sold_To_Code__c,Sold_To_SAP__c,Sold_To__c,State_Code__c,State__c,SystemModstamp,Terms_of_Payment_Code__c,Terms_of_Payment__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,Variant_Code__c,Variant__c,Volume_UoM__c,Volume__c FROM ERP_Sales_Prices_SAP__c WHERE markForDeletion__c = False ORDER BY CreatedDate ASC limit 1'; //<SS20220826> - Added Sales Order Item fields in query //<SS20230501> 
        }
       return Database.getQueryLocator(queryString);
    }
    
    global void execute(Database.BatchableContext BC,List<ERP_Sales_Prices_SAP__c> allERPSalesPricesSAP)
    { 
       if(allERPSalesPricesSAP != null && allERPSalesPricesSAP.size() > 0)
        {
            for(ERP_Sales_Prices_SAP__c erpSalesPrice : allERPSalesPricesSAP)
            {
                //added if condition to populate Variant on PRItem only if Variant exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Variant')) && (!string.isBlank(erpSalesPrice.Variant_Code__c) || !string.isBlank(erpSalesPrice.Variant__c)))
                {
                    erpSalesPrice.Variant_Code__c = '';
                    erpSalesPrice.Variant__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Variant on PRItem only if Variant exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Contract No. on PRItem only if Contract No. exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Contract No.')) && (!string.isBlank(erpSalesPrice.Contract_Code__c) || !string.isBlank(erpSalesPrice.Contract__c)))
                {
                    erpSalesPrice.Contract_Code__c = '';
                    erpSalesPrice.Contract__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Contract No. on PRItem only if Contract No. exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Sales Order Type on PRItem only if Sales Order Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Sales Order Type')) && (!string.isBlank(erpSalesPrice.Sales_Order_Type_Code__c) || !string.isBlank(erpSalesPrice.Sales_Order_Type__c)))
                {
                    erpSalesPrice.Sales_Order_Type_Code__c = '';
                    erpSalesPrice.Sales_Order_Type__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //<SS20220826> - Added Sales Order Item fields 
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Sales Order Item')) && (!string.isBlank(erpSalesPrice.Sales_Order_Item_Code__c) || !string.isBlank(erpSalesPrice.Sales_Order_Item__c)))
                {
                    erpSalesPrice.Sales_Order_Item_Code__c= '';
                    erpSalesPrice.Sales_Order_Item__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //<SS20230501>
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Value Center')) && (!string.isBlank(erpSalesPrice.Value_Center_Code__c) || !string.isBlank(erpSalesPrice.Value_Center__c)))
                {
                    erpSalesPrice.Value_Center_Code__c= '';
                    erpSalesPrice.Value_Center__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                } 
                //<SS20230501>
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Ext Matl Grp')) && (!string.isBlank(erpSalesPrice.Ext_Matl_Grp_Code__c) || !string.isBlank(erpSalesPrice.Ext_Matl_Grp__c)))
                {
                    erpSalesPrice.Ext_Matl_Grp_Code__c= '';
                    erpSalesPrice.Ext_Matl_Grp__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                } 
                //<SS20230501>
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Material Group 2')) && (!string.isBlank(erpSalesPrice.Material_group_2_Code__c) || !string.isBlank(erpSalesPrice.Material_group_2__c)))
                {
                    erpSalesPrice.Material_group_2_Code__c= '';
                    erpSalesPrice.Material_group_2__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //<SS20230501>
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Price Zone')) && (!string.isBlank(erpSalesPrice.Price_Zone_Code__c) || !string.isBlank(erpSalesPrice.Price_Zone__c)))
                {
                    erpSalesPrice.Price_Zone_Code__c= '';
                    erpSalesPrice.Price_Zone__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //<SS20230501>
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Shipping Condition')) && (!string.isBlank(erpSalesPrice.Shipping_Condition_Code__c) || !string.isBlank(erpSalesPrice.Shipping_Condition__c)))
                {
                    erpSalesPrice.Shipping_Condition_Code__c= '';
                    erpSalesPrice.Shipping_Condition__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                } 
                //added if condition to populate Sales Order Type on PRItem only if Sales Order Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Material Group 5 Key on PRItem only if Material Group 5 Key exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Material Group 5 Key')) && (!string.isBlank(erpSalesPrice.Material_Group_5_Key_Code__c) || !string.isBlank(erpSalesPrice.Material_Group_5_Key__c)))
                {
                    erpSalesPrice.Material_Group_5_Key_Code__c = '';
                    erpSalesPrice.Material_Group_5_Key__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Material Group 5 Key on PRItem only if Material Group 5 Key exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Material Price Group on PRItem only if Material Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Material Price Group')) && (!string.isBlank(erpSalesPrice.Material_Price_Group_Code__c) || !string.isBlank(erpSalesPrice.Material_Price_Group__c)))
                {
                    erpSalesPrice.Material_Price_Group_Code__c = '';
                    erpSalesPrice.Material_Price_Group__c='';   
                    erpSAPIdSet.add(erpSalesPrice.Id);           
                }
                //added if condition to populate Material Price Group on PRItem only if Material Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Customer Price Group on PRItem only if Customer Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Customer Price Group')) && (!string.isBlank(erpSalesPrice.Customer_Price_Group_Code__c) || !string.isBlank(erpSalesPrice.Customer_Price_Group__c)))
                {
                    erpSalesPrice.Customer_Price_Group_Code__c = '';
                    erpSalesPrice.Customer_Price_Group__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Customer Price Group on PRItem only if Customer Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Terms of Payment on PRItem only if Terms of Payment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Terms of Payment')) && (!string.isBlank(erpSalesPrice.Terms_Of_Payment_Code__c) || !string.isBlank(erpSalesPrice.Terms_Of_Payment__c)))
                {
                    erpSalesPrice.Terms_Of_Payment_Code__c = '';
                    erpSalesPrice.Terms_Of_Payment__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Terms of Payment on PRItem only if Terms of Payment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Incoterms on Sales Price SAP only if Incoterms exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Incoterms')) && (!string.isBlank(erpSalesPrice.Incoterms_1_Code__c) || !string.isBlank(erpSalesPrice.Incoterms1__c)))
                {
                    erpSalesPrice.Incoterms_1_Code__c = '';
                    erpSalesPrice.Incoterms1__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Incoterms on Sales Price SAP only if Incoterms exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Price List Type on PRItem only if Price List Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Price List Type')) && (!string.isBlank(erpSalesPrice.Price_List_Type_Code__c) || !string.isBlank(erpSalesPrice.Price_List_Type__c)))
                {
                    erpSalesPrice.Price_List_Type_Code__c = '';
                    erpSalesPrice.Price_List_Type__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Price List Type on PRItem only if Price List Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Sales office on PRItem only if Sales office exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Sales office')) && (!string.isBlank(erpSalesPrice.Sales_Office_Code__c) || !string.isBlank(erpSalesPrice.Sales_Office__c)))
                {
                    erpSalesPrice.Sales_Office_Code__c = '';
                    erpSalesPrice.Sales_Office__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Sales office on PRItem only if Sales office exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Sales District on PRItem only if Sales District exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Sales District')) && (!string.isBlank(erpSalesPrice.Sales_District_Code__c) || !string.isBlank(erpSalesPrice.Sales_District__c)))
                {
                    erpSalesPrice.Sales_District_Code__c = '';
                    erpSalesPrice.Sales_District__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Sales District on PRItem only if Sales District exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Market Segment on PRItem only if Market Segment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Market Segment')) && (!string.isBlank(erpSalesPrice.Market_Segment_Code__c) || !string.isBlank(erpSalesPrice.Market_Segment__c)))
                {
                    erpSalesPrice.Market_Segment_Code__c ='';
                    erpSalesPrice.Market_Segment__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Market Segment on PRItem only if Market Segment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate End Use on PRItem only if End Use exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('End Use')) && (!string.isBlank(erpSalesPrice.End_Use_Code__c) || !string.isBlank(erpSalesPrice.End_Use__c)))
                {
                    erpSalesPrice.End_Use_Code__c = '';
                    erpSalesPrice.End_Use__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate End Use on PRItem only if End Use exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Price Ref. Partner on PRItem only if Price Ref. Partner exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Price Ref. Partner')) && (!string.isBlank(erpSalesPrice.Price_Ref_Partner_Code__c) || !string.isBlank(erpSalesPrice.Price_Ref_Partner__c)))
                {
                    erpSalesPrice.Price_Ref_Partner_Code__c = '';
                    erpSalesPrice.Price_Ref_Partner__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Price Ref. Partner on PRItem only if Price Ref. Partner exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Project Id on PRItem only if Project Id exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Project Id')) && (!string.isBlank(erpSalesPrice.Project__c)))
                {
                    erpSalesPrice.Project__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Project Id on PRItem only if Project Id exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                
                //added if condition to populate Kcode on PRItem only if Kcode exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Kcode')) && (!string.isBlank(erpSalesPrice.Kcode__c)))
                {
                    erpSalesPrice.Kcode__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Kcode on PRItem only if Kcode exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Campaign on PRItem only if Campaign exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Campaign')) && (!string.isBlank(erpSalesPrice.Campaign_Code__c) || !string.isBlank(erpSalesPrice.Campaign__c)))
                {
                    erpSalesPrice.Campaign_Code__c = '';
                    erpSalesPrice.Campaign__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Campaign on PRItem only if Campaign exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate State on PRItem only if State exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('State')) && (!string.isBlank(erpSalesPrice.State_Code__c) || !string.isBlank(erpSalesPrice.State__c)))
                {
                    erpSalesPrice.State_Code__c = '';
                    erpSalesPrice.State__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate State on PRItem only if State exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Profit Center on PRItem only if Profit Center exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Profit Center')) && (!string.isBlank(erpSalesPrice.Profit_Center_Code__c) || !string.isBlank(erpSalesPrice.Profit_Center__c)))
                {
                    erpSalesPrice.Profit_Center__c = '';
                    erpSalesPrice.Profit_Center_Code__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Profit Center on PRItem only if Profit Center exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate End User on PRItem only if End User exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('End User')) && (!string.isBlank(erpSalesPrice.End_User_Code__c) || !string.isBlank(erpSalesPrice.End_User__c)))
                {
                    erpSalesPrice.End_User_Code__c = '';
                    erpSalesPrice.End_User__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate End User on PRItem only if End User exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Customer Hierarchy on PRItem only if Customer Hierarchy exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Customer Hierarchy')) && (!string.isBlank(erpSalesPrice.Customer_Hierarchy_Code__c) || !string.isBlank(erpSalesPrice.Customer_Hierarchy__c)))
                {
                    erpSalesPrice.Customer_Hierarchy_Code__c = '';
                    erpSalesPrice.Customer_Hierarchy__c = '';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                    
                }
                //added if condition to populate Customer Hierarchy on PRItem only if Customer Hierarchy exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Ship to on PRItem only if Ship to exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                /*To populate Ship To*/
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Ship to')) && (!string.isBlank(erpSalesPrice.ShipTo_Code__c) || !string.isBlank(erpSalesPrice.ShipTo__c)))
                {
                    erpSalesPrice.ShipTo__c ='';
                    erpSalesPrice.ShipTo_Code__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Ship to on PRItem only if Ship to exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Material Group 1 on PRItem only if Material Group 1 exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(erpSalesPrice.Key_Combination__c!=null && !((erpSalesPrice.Key_Combination__c).containsIgnoreCase('Material Group 1')) && (!string.isBlank(erpSalesPrice.Material_Group_1_Code__c) || !string.isBlank(erpSalesPrice.Material_Group_1__c)))
                {
                    erpSalesPrice.Material_Group_1_Code__c = '';
                    erpSalesPrice.Material_Group_1__c='';
                    erpSAPIdSet.add(erpSalesPrice.Id);
                }
                //added if condition to populate Material Group 1 on PRItem only if Material Group 1 exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                if(erpSAPIdSet.contains(erpSalesPrice.Id))
                {
                    
                    ERPSalesPricesSAPToBeUpdated.add(erpSalesPrice);
                }
            }
            
        }
        try
        {
            if(ERPSalesPricesSAPToBeUpdated != null && ERPSalesPricesSAPToBeUpdated.size() > 0)
            {
                update ERPSalesPricesSAPToBeUpdated;
            }
        }
        catch(DmlException e)
        {
            System.debug('The following exception has occurred: ' + e.getMessage());
        
        }
    }
    global void finish(Database.BatchableContext info)
    {
            
    } 
}