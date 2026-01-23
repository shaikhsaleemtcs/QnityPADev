/*****************************************************************************
Author: Sumita Dabas
Email: s.dabas@tcs.com
Date: 2/09/2016
Description: class to update pritems for checking the unnecessary population of fields on the basis of Key combination value
@version  1.0

**********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic to include Sales Order Item and Sales Order Item Code values- CRM-2022-07-0225
 
 **********************************************************************************************************************
<SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   01 May 2023
 Description        :   Added logic to include P80 M&M Fields
********************************************************************************/

global class batchClassForUpdatePRItem implements Database.Batchable<sObject>
{
    public List<Pricing_Request_Item__c> allPriceRequestItems = new List<Pricing_Request_Item__c>();
    public List<Pricing_Request_Item__c> priceRequestItemsToBeUpdated = new List<Pricing_Request_Item__c>();
    public Set<Id> prItemIdSet = new Set<Id>();
    
    global database.queryLocator start(Database.BatchableContext BC)
    {   
        //<SS20230501> - added fields in the query
        String queryString='SELECT Approval_Status__c,Approved_Date__c,Approver1_Date__c,Approver1__c,Approver2_Date__c,Approver2__c,Approver3_Date__c,Approver3__c,Approver4_Date__c,Approver4__c,Approver5_Date__c,Approver5__c,Base_UoM__c,Below_Current_Flag__c,Below_Floor_Flag__c,Below_Floor_Price__c,Below_Reference_Flag__c,Below_Reference_Price__c,BU__c,Calculation_Type_Code__c,Calculation_Type__c,Campaign_Code__c,Campaign__c,Char_Name__c,Check_Scale_Code__c,Check_Scale__c,Comm_Ptr_Code__c,Comm_Ptr__c,ComPartner_Code__c,ComPartner__c,Condition_Class_Code__c,Condition_Class__c,Contract_Code__c,Contract__c,Cost_Price__c,Country_Code__c,Country__c,CreatedById,CreatedDate,CurrencyIsoCode,Currency__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Price_Payment_Terms__c,Customer_Specific__c,Cust_Mkt_Segment_Code__c,Cust_Mkt_Segment__c,Deal_Margin__c,Deal_Revenue__c,Destination_Country_Code__c,Destination_Country__c,Disc_Ref_No__c,Disc_Ref__c,Dist_Channel_Code__c,Dist_Channel__c,Division_Code__c,Division__c,Document_Currency_Code__c,Document_Currency__c,Edit__c,End_User_Code__c,End_User__c,End_Use_Code__c,End_Use__c,ERP_Pricing_Procedure__c,ERP_Sales_Prices_SAP__c,Error_Indicator__c,Exchange_Rate__c,Expire__c,External_ERP_ID__c,FixValDate__c,F_Product_Hierarchy_Code__c,Gap_Pricing_Request_Item__c,Gap__c,Id,Incoterms2__c,Incoterms_Code__c,Inco_terms__c,Integration_Error_Message__c,IsDeleted,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,isVolumeApplicable__c,Kcode__c,Key_Combination_Code__c,Key_Combination_SFDC__c,Key_Combination__c,LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Market_Segment_Code__c,Market_Segment__c,Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Material_Code__c,Material_Group_1_Code__c,Material_Group_1__c,Material_Group_5_Code__c,Material_Group_5_Key_Code__c,Material_Group_5_Key__c,Material_Group_5__c,Material_Price_Group_Code__c,Material_Price_Group__c,Material__c,Name,Net_Price_Calculated_Materials__c,Net_Price_Status__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,New_Per__c,New_Rate__c,New_Unit__c,New_UoM__c,New_Valid_From__c,New_Valid_To__c,New_Volume_UoM__c,New_Volume__c,New__c,Non_Commercial_Products__c,Number_of_Material_with_Gross_Price__c,Partner_ZF_Code__c,Partner_ZF__c,Payer_Code__c,Payer__c,Payment_Terms_Fixed_Date__c,PCKC__c,Per__c,PH1_Code__c,PH1__c,PH2_Code__c,PH2__c,PH3_Code__c,PH3__c,PH4_Code__c,PH4__c,PH5_Code__c,PH5__c,PH6_Code__c,PH6__c,PH7_Code__c,PH7__c,PH8_Code__c,PH8__c,PH9_Code__c,PH9__c,Plant_Code__c,Plant__c,Plus_Minus_Code__c,Plus_Minus__c,Price_List_Type_Code__c,Price_List_Type__c,Price_Reduction__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Pricing_Condition_Code__c,Pricing_Condition__c,Pricing_Request_Type__c,Pricing_Request__c,Pricing_Task_UoM__c,Product_Hierarchy_Code__c,Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Project__c,Quantity__c,Rate__c,Sales_District_Code__c,Sales_District__c,Sales_Office_Code__c,Sales_Office__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Sales_Org_Code__c,Sales_Org__c,Sales_Reduction__c,SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Scaled_Price_Flag__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_Type__c,Scale_UoM_Scale_Unit__c,Shipping_Condition_Code__c,Shipping_Condition__c,ShipTo_Code__c,ShipTo_Country_Code__c,ShipTo_Country__c,ShipTo__c,Ship_To_Country_Code__c,Ship_To_Country__c,Sold_To_Code__c,Sold_To__c,Stamp_Converted_Current_Price__c,Stamp_Current_Net_Price__c,Stamp_Floor_Net_Price__c,Stamp_Floor_Price__c,Stamp_New_Net_Price__c,Stamp_Reference_Net_Price__c,Stamp_Reference_Price__c,State_Code__c,State__c,SystemModstamp,Terms_Of_Payment_Code__c,Terms_Of_Payment__c,Total_Materials__c,Unit__c,UOM_Conversion_Factors__c,UoM__c,USD_Rate__c,Valid_From__c,Valid_To__c,Variant_Code__c,Variant__c,Volume_UoM__c,Volume__c FROM Pricing_Request_Item__c WHERE (Approval_Status__c != null AND(Approval_Status__c = \'Draft\' OR Approval_Status__c = \'Submitted\' OR Approval_Status__c = \'Approved\')) ORDER BY CreatedDate ASC'; // <SS20220826> - Added Sales Order Item fields in query 
        if(Test.isrunningTest()){
           queryString='SELECT Approval_Status__c,Approved_Date__c,Approver1_Date__c,Approver1__c,Approver2_Date__c,Approver2__c,Approver3_Date__c,Approver3__c,Approver4_Date__c,Approver4__c,Approver5_Date__c,Approver5__c,Base_UoM__c,Below_Current_Flag__c,Below_Floor_Flag__c,Below_Floor_Price__c,Below_Reference_Flag__c,Below_Reference_Price__c,BU__c,Calculation_Type_Code__c,Calculation_Type__c,Campaign_Code__c,Campaign__c,Char_Name__c,Check_Scale_Code__c,Check_Scale__c,Comm_Ptr_Code__c,Comm_Ptr__c,ComPartner_Code__c,ComPartner__c,Condition_Class_Code__c,Condition_Class__c,Contract_Code__c,Contract__c,Cost_Price__c,Country_Code__c,Country__c,CreatedById,CreatedDate,CurrencyIsoCode,Currency__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Price_Payment_Terms__c,Customer_Specific__c,Cust_Mkt_Segment_Code__c,Cust_Mkt_Segment__c,Deal_Margin__c,Deal_Revenue__c,Destination_Country_Code__c,Destination_Country__c,Disc_Ref_No__c,Disc_Ref__c,Dist_Channel_Code__c,Dist_Channel__c,Division_Code__c,Division__c,Document_Currency_Code__c,Document_Currency__c,Edit__c,End_User_Code__c,End_User__c,End_Use_Code__c,End_Use__c,ERP_Pricing_Procedure__c,ERP_Sales_Prices_SAP__c,Error_Indicator__c,Exchange_Rate__c,Expire__c,External_ERP_ID__c,FixValDate__c,F_Product_Hierarchy_Code__c,Gap_Pricing_Request_Item__c,Gap__c,Id,Incoterms2__c,Incoterms_Code__c,Inco_terms__c,Integration_Error_Message__c,IsDeleted,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,isVolumeApplicable__c,Kcode__c,Key_Combination_Code__c,Key_Combination_SFDC__c,Key_Combination__c,LastActivityDate,LastModifiedById,LastModifiedDate,Market_Segment_Code__c,Market_Segment__c,Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Material_Code__c,Material_Group_1_Code__c,Material_Group_1__c,Material_Group_5_Code__c,Material_Group_5_Key_Code__c,Material_Group_5_Key__c,Material_Group_5__c,Material_Price_Group_Code__c,Material_Price_Group__c,Material__c,Name,Net_Price_Calculated_Materials__c,Net_Price_Status__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,New_Per__c,New_Rate__c,New_Unit__c,New_UoM__c,New_Valid_From__c,New_Valid_To__c,New_Volume_UoM__c,New_Volume__c,New__c,Non_Commercial_Products__c,Number_of_Material_with_Gross_Price__c,Partner_ZF_Code__c,Partner_ZF__c,Payer_Code__c,Payer__c,Payment_Terms_Fixed_Date__c,PCKC__c,Per__c,PH1_Code__c,PH1__c,PH2_Code__c,PH2__c,PH3_Code__c,PH3__c,PH4_Code__c,PH4__c,PH5_Code__c,PH5__c,PH6_Code__c,PH6__c,PH7_Code__c,PH7__c,PH8_Code__c,PH8__c,PH9_Code__c,PH9__c,Plant_Code__c,Plant__c,Plus_Minus_Code__c,Plus_Minus__c,Price_List_Type_Code__c,Price_List_Type__c,Price_Reduction__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Pricing_Condition_Code__c,Pricing_Condition__c,Pricing_Request_Type__c,Pricing_Request__c,Pricing_Task_UoM__c,Product_Hierarchy_Code__c,Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Project__c,Quantity__c,Rate__c,Sales_District_Code__c,Sales_District__c,Sales_Office_Code__c,Sales_Office__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Org_Code__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Sales_Org__c,Sales_Reduction__c,SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Scaled_Price_Flag__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_Type__c,Scale_UoM_Scale_Unit__c,Shipping_Condition_Code__c,Shipping_Condition__c,ShipTo_Code__c,ShipTo_Country_Code__c,ShipTo_Country__c,ShipTo__c,Ship_To_Country_Code__c,Ship_To_Country__c,Sold_To_Code__c,Sold_To__c,Stamp_Converted_Current_Price__c,Stamp_Current_Net_Price__c,Stamp_Floor_Net_Price__c,Stamp_Floor_Price__c,Stamp_New_Net_Price__c,Stamp_Reference_Net_Price__c,Stamp_Reference_Price__c,State_Code__c,State__c,SystemModstamp,Terms_Of_Payment_Code__c,Terms_Of_Payment__c,Total_Materials__c,Unit__c,UOM_Conversion_Factors__c,UoM__c,USD_Rate__c,Valid_From__c,Valid_To__c,Variant_Code__c,Variant__c,Volume_UoM__c,Volume__c FROM Pricing_Request_Item__c WHERE (Approval_Status__c != null AND(Approval_Status__c = \'Draft\' OR Approval_Status__c = \'Submitted\' OR Approval_Status__c = \'Approved\')) limit 1'; //<SS20220826> - Added Sales Order Item fields in query 
        }
            return Database.getQueryLocator(queryString);
    }
    
    global void execute(Database.BatchableContext BC,List<Pricing_Request_Item__c> allPriceRequestItems)
    { 
       if(allPriceRequestItems != null && allPriceRequestItems.size() > 0)
       {
            for(Pricing_Request_Item__c pricingReqItem : allPriceRequestItems)
            {
                //added if condition to populate Variant on PRItem only if Variant exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Variant')) && (!string.isBlank(pricingReqItem.Variant_Code__c) || !string.isBlank(pricingReqItem.Variant__c)))
                {
                    pricingReqItem.Variant_Code__c = '';
                    pricingReqItem.Variant__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Variant on PRItem only if Variant exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Contract No. on PRItem only if Contract No. exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Contract No.')) && (!string.isBlank(pricingReqItem.Contract_Code__c) || !string.isBlank(pricingReqItem.Contract__c)))
                {
                    pricingReqItem.Contract_Code__c = '';
                    pricingReqItem.Contract__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Contract No. on PRItem only if Contract No. exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Sales Order Type on PRItem only if Sales Order Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales Order Type')) && (!string.isBlank(pricingReqItem.Sales_Order_Type_Code__c) || !string.isBlank(pricingReqItem.Sales_Order_Type__c)))
                {
                    pricingReqItem.Sales_Order_Type_Code__c = '';
                    pricingReqItem.Sales_Order_Type__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //<SS20220826> - Added Sales Order Item fields 
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales Order Item')) && (!string.isBlank(pricingReqItem.Sales_Order_Item_Code__c) || !string.isBlank(pricingReqItem.Sales_Order_Item__c)))
                {
                    pricingReqItem.Sales_Order_Item_Code__c = '';
                    pricingReqItem.Sales_Order_Item__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //<SS20230501>
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Value Center')) && (!string.isBlank(pricingReqItem.Value_Center_Code__c) || !string.isBlank(pricingReqItem.Value_Center__c)))
                {
                    pricingReqItem.Value_Center_Code__c= '';
                    pricingReqItem.Value_Center__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                } 
                //<SS20230501>
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Ext Matl Grp')) && (!string.isBlank(pricingReqItem.Ext_Matl_Grp_Code__c) || !string.isBlank(pricingReqItem.Ext_Matl_Grp__c)))
                {
                    pricingReqItem.Ext_Matl_Grp_Code__c= '';
                    pricingReqItem.Ext_Matl_Grp__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                } 
                //<SS20230501>
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Group 2')) && (!string.isBlank(pricingReqItem.Material_group_2_Code__c) || !string.isBlank(pricingReqItem.Material_group_2__c)))
                {
                    pricingReqItem.Material_group_2_Code__c= '';
                    pricingReqItem.Material_group_2__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //<SS20230501>
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Price Zone')) && (!string.isBlank(pricingReqItem.Price_Zone_Code__c) || !string.isBlank(pricingReqItem.Price_Zone__c)))
                {
                    pricingReqItem.Price_Zone_Code__c= '';
                    pricingReqItem.Price_Zone__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //<SS20230501>
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Shipping Condition')) && (!string.isBlank(pricingReqItem.Shipping_Condition_Code__c) || !string.isBlank(pricingReqItem.Shipping_Condition__c)))
                {
                   pricingReqItem.Shipping_Condition_Code__c= '';
                   pricingReqItem.Shipping_Condition__c='';
                   prItemIdSet.add(pricingReqItem.Id);
                 }
                //added if condition to populate Sales Order Type on PRItem only if Sales Order Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Material Group 5 Key on PRItem only if Material Group 5 Key exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Group 5 Key')) && (!string.isBlank(pricingReqItem.Material_Group_5_Key_Code__c) || !string.isBlank(pricingReqItem.Material_Group_5_Key__c)))
                {
                    pricingReqItem.Material_Group_5_Key_Code__c = '';
                    pricingReqItem.Material_Group_5_Key__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Material Group 5 Key on PRItem only if Material Group 5 Key exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Material Price Group on PRItem only if Material Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Price Group')) && (!string.isBlank(pricingReqItem.Material_Price_Group_Code__c) || !string.isBlank(pricingReqItem.Material_Price_Group__c)))
                {
                    pricingReqItem.Material_Price_Group_Code__c = '';
                    pricingReqItem.Material_Price_Group__c='';   
                    prItemIdSet.add(pricingReqItem.Id);            
                }
                //added if condition to populate Material Price Group on PRItem only if Material Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Customer Price Group on PRItem only if Customer Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Customer Price Group')) && (!string.isBlank(pricingReqItem.Customer_Price_Group_Code__c) || !string.isBlank(pricingReqItem.Customer_Price_Group__c)))
                {
                    pricingReqItem.Customer_Price_Group_Code__c = '';
                    pricingReqItem.Customer_Price_Group__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Customer Price Group on PRItem only if Customer Price Group exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Terms of Payment on PRItem only if Terms of Payment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Terms of Payment')) && (!string.isBlank(pricingReqItem.Terms_Of_Payment_Code__c) || !string.isBlank(pricingReqItem.Terms_Of_Payment__c)))
                {
                    pricingReqItem.Terms_Of_Payment_Code__c = '';
                    pricingReqItem.Terms_Of_Payment__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Terms of Payment on PRItem only if Terms of Payment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Incoterms on PRItem only if Incoterms exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Incoterms')) && (!string.isBlank(pricingReqItem.Incoterms_Code__c) || !string.isBlank(pricingReqItem.Inco_terms__c)))
                {
                    pricingReqItem.Incoterms_Code__c = '';
                    pricingReqItem.Inco_terms__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Incoterms on PRItem only if Incoterms exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Price List Type on PRItem only if Price List Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Price List Type')) && (!string.isBlank(pricingReqItem.Price_List_Type_Code__c) || !string.isBlank(pricingReqItem.Price_List_Type__c)))
                {
                    pricingReqItem.Price_List_Type_Code__c = '';
                    pricingReqItem.Price_List_Type__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Price List Type on PRItem only if Price List Type exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Sales office on PRItem only if Sales office exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales office')) && (!string.isBlank(pricingReqItem.Sales_Office_Code__c) || !string.isBlank(pricingReqItem.Sales_Office__c)))
                {
                    pricingReqItem.Sales_Office_Code__c = '';
                    pricingReqItem.Sales_Office__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Sales office on PRItem only if Sales office exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Sales District on PRItem only if Sales District exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Sales District')) && (!string.isBlank(pricingReqItem.Sales_District_Code__c) || !string.isBlank(pricingReqItem.Sales_District__c)))
                {
                    pricingReqItem.Sales_District_Code__c = '';
                    pricingReqItem.Sales_District__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Sales District on PRItem only if Sales District exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Market Segment on PRItem only if Market Segment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Market Segment')) && (!string.isBlank(pricingReqItem.Market_Segment_Code__c) || !string.isBlank(pricingReqItem.Market_Segment__c)))
                {
                    pricingReqItem.Market_Segment_Code__c ='';
                    pricingReqItem.Market_Segment__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Market Segment on PRItem only if Market Segment exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate End Use on PRItem only if End Use exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('End Use')) && (!string.isBlank(pricingReqItem.End_Use_Code__c) || !string.isBlank(pricingReqItem.End_Use__c)))
                {
                    pricingReqItem.End_Use_Code__c = '';
                    pricingReqItem.End_Use__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate End Use on PRItem only if End Use exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Price Ref. Partner on PRItem only if Price Ref. Partner exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Price Ref. Partner')) && (!string.isBlank(pricingReqItem.Price_Ref_Partner_Code__c) || !string.isBlank(pricingReqItem.Price_Ref_Partner__c)))
                {
                    pricingReqItem.Price_Ref_Partner_Code__c = '';
                    pricingReqItem.Price_Ref_Partner__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Price Ref. Partner on PRItem only if Price Ref. Partner exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Project Id on PRItem only if Project Id exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Project Id')) && (!string.isBlank(pricingReqItem.Project__c)))
                {
                    pricingReqItem.Project__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Project Id on PRItem only if Project Id exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                
                //added if condition to populate Kcode on PRItem only if Kcode exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Kcode')) && (!string.isBlank(pricingReqItem.Kcode__c)))
                {
                    pricingReqItem.Kcode__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Kcode on PRItem only if Kcode exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Campaign on PRItem only if Campaign exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Campaign')) && (!string.isBlank(pricingReqItem.Campaign_Code__c) || !string.isBlank(pricingReqItem.Campaign__c)))
                {
                    pricingReqItem.Campaign_Code__c = '';
                    pricingReqItem.Campaign__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Campaign on PRItem only if Campaign exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate State on PRItem only if State exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('State')) && (!string.isBlank(pricingReqItem.State_Code__c) || !string.isBlank(pricingReqItem.State__c)))
                {
                    pricingReqItem.State_Code__c = '';
                    pricingReqItem.State__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate State on PRItem only if State exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Profit Center on PRItem only if Profit Center exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Profit Center')) && (!string.isBlank(pricingReqItem.Profit_Center_Code__c) || !string.isBlank(pricingReqItem.Profit_Center__c)))
                {
                    pricingReqItem.Profit_Center__c = '';
                    pricingReqItem.Profit_Center_Code__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Profit Center on PRItem only if Profit Center exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate End User on PRItem only if End User exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('End User')) && (!string.isBlank(pricingReqItem.End_User_Code__c) || !string.isBlank(pricingReqItem.End_User__c)))
                {
                    pricingReqItem.End_User_Code__c = '';
                    pricingReqItem.End_User__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate End User on PRItem only if End User exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Customer Hierarchy on PRItem only if Customer Hierarchy exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Customer Hierarchy')) && (!string.isBlank(pricingReqItem.Customer_Hierarchy_Code__c) || !string.isBlank(pricingReqItem.Customer_Hierarchy__c)))
                {
                    pricingReqItem.Customer_Hierarchy_Code__c = '';
                    pricingReqItem.Customer_Hierarchy__c = '';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Customer Hierarchy on PRItem only if Customer Hierarchy exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Ship to on PRItem only if Ship to exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                /*To populate Ship To*/
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Ship to')) && (!string.isBlank(pricingReqItem.ShipTo_Code__c) || !string.isBlank(pricingReqItem.ShipTo__c)))
                {
                    pricingReqItem.ShipTo__c ='';
                    pricingReqItem.ShipTo_Code__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Ship to on PRItem only if Ship to exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                //added if condition to populate Material Group 1 on PRItem only if Material Group 1 exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 START
                if(pricingReqItem.Key_Combination__c!=null && !((pricingReqItem.Key_Combination__c).containsIgnoreCase('Material Group 1')) && (!string.isBlank(pricingReqItem.Material_Group_1_Code__c) || !string.isBlank(pricingReqItem.Material_Group_1__c)))
                {
                    pricingReqItem.Material_Group_1_Code__c = '';
                    pricingReqItem.Material_Group_1__c='';
                    prItemIdSet.add(pricingReqItem.Id);
                }
                //added if condition to populate Material Group 1 on PRItem only if Material Group 1 exists in Key combination, by Sumita Dabas for IS ID-00061597 on 28 Jan 2016 END
                if(prItemIdSet.contains(pricingReqItem.Id))
                {
                    priceRequestItemsToBeUpdated.add(pricingReqItem);
                }
                
            }
    
        }
        try
        {
            if(priceRequestItemsToBeUpdated != null && priceRequestItemsToBeUpdated.size() > 0)
            {
                update priceRequestItemsToBeUpdated;
                system.debug('#############' + priceRequestItemsToBeUpdated.size());
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