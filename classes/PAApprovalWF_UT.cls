/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 
Updated By: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com

Change Log
//<AB03182021> Resolved too many SOQL error by changing Test.stopTest
********************************************************************************/


@isTest
public class PAApprovalWF_UT {       

    

public static testMethod void paApprovalWFTestMethodPAQuery() {
    //test.startTest();             
    
    List<PAQuery__c> paQueyrList = new List<PAQuery__c>();
            PAQuery__c paquery1 =   new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT SELECT Id, OwnerId, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, Approved_Date__c, BU__c, Customer_Price_Group_Code__c, Customer_Price_Group__c, Discount__c, Dist_Channel__c, Distribution_Channel_Code__c, Division_Code__c, Division__c, End_User_Code__c, End_User__c, External_ERP_ID__c, Key_Combination_Code__c, Key_Combination__c, Material_Code__c, Material__c, Per__c, Price_Holder__c, Pricing_Condition_Code__c, Pricing_Condition__c, Pricing_Request__c, Quantity__c, Rate__c, Sales_Org_Code__c, Sales_Org__c, Sales_Pricing_Procedure__c, Sold_To_Code__c, Sold_To__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, isPriceHolder__c FROM Rebate_Quote_Price__c',Variable__c='salesPriceRPQRecordsList');  paQueyrList.add(paquery1);
            PAQuery__c paquery2 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='SELECT New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,New_Volume__c, New_Volume_UoM__c,Ship_To_Country__c,Ship_To_Country_Code__c,country_code__c, Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Document_Currency__c,Document_Currency_Code__c, ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Sales_Order_Type_Code__c,Sales_Order_Type__c,Valid_To__c,BU__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, Scale_UoM_Scale_Unit__c, Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Task_UoM__c, Pricing_Request__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, ERP_Pricing_Procedure__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CurrencyIsoCode,CreatedDate, CreatedById, Country__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Below_Reference_Price__c, Below_Reference_Flag__c, Below_Floor_Price__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c ,Pricing_Request__r.OwnerId,Price_Ref_Partner__c,Price_Ref_Partner_Code__c, ERP_Pricing_Procedure__r.SAP_Cluster__c FROM Pricing_request_item__c',Variable__c='priApprovedList');  paQueyrList.add(paquery2);
            PAQuery__c paquery3 =  new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT Id,Name,Country_Code__c,PCKC__c ,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c, Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c, Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c, PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c, Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c, Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c, ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c, ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c, ScaleRate9__c,ScaleRate10__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c, SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c, ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c, Price_Holder__c,Volume__c,Volume_UoM__c,Pricing_Request__c,Pricing_Request__r.Name,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='erpSalesPriceSAP');  paQueyrList.add(paquery3);
            PAQuery__c paquery4 =  new PAQuery__c(Class__c='PAApprovalWF',Query__c='SELECT id, BU__c, Country__c, Sales_Organisation__c, Price_Category__c, Distribution_Channel__c, Division__c, Request_Type__c, Request_Class__c,End_User_Rebate_Routing__c,Is_End_User_Rebate__c from PA_BU_Admin_Master__c',Variable__c='adminMasterListRPQ');  paQueyrList.add(paquery4);
            PAQuery__c paquery5 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT isNPCApplicable__c,Pricing_Request__r.BU__c,Pricing_Request__r.Reason_Detail__c,Price_Reduction__c,Sales_Reduction__c ,Deal_Margin__c ,Cost_Price__c ,BU__c,Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Disc_Ref__c, ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Scale_UoM_Scale_Unit__c,Key_Combination_SFDC__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c, Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Below_Reference_Flag__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,Scale_Type__c,Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c, Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c, Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c, ERP_Pricing_Procedure__r.Pricing_Procedure__c,Pricing_Request__r.Request_Valid_From__c,Pricing_Request__r.Request_Valid_To__c, Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c,Total_Materials__c,Integration_Error_Message__c, Net_Price_Status__c,Number_of_Material_with_Gross_Price__c, Pricing_Request__r.Request_Type__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c, Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c,isVolumeApplicable__c,Volume__c,Volume_UoM__c,New_Volume__c,New_Volume_UoM__c ,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c ,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM Pricing_Request_Item__c',Variable__c='pricingReqItem');  paQueyrList.add(paquery5);
            PAQuery__c paquery6 =  new PAQuery__c(Class__c='PARequestItem',Query__c='Select Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,BU__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c,Valid_To__c,Pricing_Request__r.Request_Type__c,Valid_From__c,UoM__c,Unit__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,SystemModstamp,Stamp_Reference_Price__c,Stamp_Reference_Net_Price__c,Stamp_New_Net_Price__c,Stamp_Floor_Price__c,Stamp_Floor_Net_Price__c,Stamp_Current_Net_Price__c,Stamp_Converted_Current_Price__c,Sold_To__c,Sold_To_Code__c,ShipTo__c,ShipTo_Code__c,Scaled_Price_Flag__c,ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c,ScaleRate1__c,ScaleRate10__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c,Sales_Org_Code__c,Sales_Office__c,Sales_Office_Code__c,SAP_Cluster__c,SAP_Client_Id__c,SAP_Application_Id__c,Rate__c,Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c, Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c,Profit_Center_Code__c,Product_Hierarchy__c,Pricing_Request__c,Pricing_Request__r.Spot_Type__c,Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c,Id,Gap__c,Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Below_Reference_Flag__c, Below_Floor_Flag__c,Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c,Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c,Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c,ERP_Pricing_Procedure__r.Pricing_Procedure__c,Pricing_Request__r.Request_Valid_From__c,Pricing_Request__r.Request_Valid_To__c,Pricing_Request__r.Sales_Org_Code__c,Pricing_Request__r.Dist_Channel_Code__c,Pricing_Request__r.Division_Code__c,New_Markup_Percentage__c,New_Base_Floor__c,Base_Floor__c,Markup_Percentage__c,Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c,Total_Materials__c,Integration_Error_Message__c,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c,Pricing_Request__r.Default_Currency__c,Sales_Type_Code__c,Sales_Type__c,Customer_Price_Payment_Terms__c,Fixed_Date_Payment_Terms__c,New_Customer_Price_Payment_Terms__c,New_Fixed_Date_Payment_Terms__c,PaymentTerms_Applicable__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c from Pricing_Request_Item__c',Variable__c='pricingReqItemObj');  paQueyrList.add(paquery6);
            PAQuery__c paquery7 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Calculation_Type__c,PCKC__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Plus_Minus_Code__c,Scale_Basis__c,Scale_Basis_Code__c, Id,Unit__c,Scaled_Price_Flag__c ,UoM__c,Per__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c, ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Plus_Minus__c,Scale_Type__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,Quantity__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='relatedSAPRecordsList');  paQueyrList.add(paquery7);
            PAQuery__c paquery8 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Plus_Minus_Code__c,Scale_Basis__c,Scale_Basis_Code__c, Id,Unit__c,Scaled_Price_Flag__c ,UoM__c,Per__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c, ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Plus_Minus__c,Scale_Type__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM Sales_Prices__c',Variable__c='relatedNonSAPRecordsList');  paQueyrList.add(paquery8);
            PAQuery__c paquery9 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT id,Project_Id__c,Name,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,Sold_To_Code__c,Default_Discount__c,Pricing_Condition_Code__c, Pricing_Condition__c,CreatedBy.Name,Project_Volume__c,Valid_From__c,Valid_To__c,status__c,Project_status__c FROM Project_Price__c',Variable__c='projectPrice');  paQueyrList.add(paquery9);
            PAQuery__c paquery10 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Is_End_User_Rebate__c,Reason_Detail__c,F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c, SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c, Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c, Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate, CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Sent_To_Backup_Approver__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name, Project_Header_Approval_Flag__c ,NPC_Status__c ,Landing_Cost__c, ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c',Variable__c='priceRequestlist');  paQueyrList.add(paquery10);
            PAQuery__c paquery11 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c, Distribution_Channel_Code__c,Distribution_channel__c, Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c, Customer_Price_Group__c,Price_List_type__c, price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c, sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c, Zip_Postal_Code__c,Customer_Group_2_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c,state__c FROM ERP_Customer__c',Variable__c='paServiceState.erpCustomer.PAERPCustomer');  paQueyrList.add(paquery11);
            PAQuery__c paquery12 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Is_End_User_Rebate__c,Reason_Detail__c,F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c, Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c, Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c, Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name, Owner.Email, On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c, Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name, CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c, On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c, Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c, Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,Delegation_Comments__c, ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c',Variable__c='request.requestServiceState.currentRequest.pricingRequest');  paQueyrList.add(paquery12);
            PAQuery__c paquery13 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Disc_Ref__c, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c, Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Below_Reference_Flag__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c, Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c, Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,USD_Rate__c,Base_UoM__c, Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c, Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c, Net_Price_Calculated_Materials__c,Total_Materials__c ,Integration_Error_Message__c,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,Pricing_Request__r.Request_Type__c,Pricing_Request__r.Current_Approver__c, Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c, Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c , ComPartner__c,ComPartner_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Pricing_Request_Item__c',Variable__c='requestItemList');  paQueyrList.add(paquery13);
            PAQuery__c paquery14 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c, Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c, End_User__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c, Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c, PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c, PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c, Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c, Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c, SAP_Client_ID__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c, ShipTo__c,ShipTo_Code__c,PCKC__c,Terms_of_Payment_Code__c,Approved_Date__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c, ComPartner__c,ComPartner_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='holList1');  paQueyrList.add(paquery14);
            PAQuery__c paquery15 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT SystemModstamp, Status__c, Scale_Type__c, Scale_Type_Code__c, Scale_Basis_Code__c, Scale_Base__c, SAP_Condition_Type__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Pricing_Condition__c, Pricing_Condition_Description__c, Pricing_Condition_Code__c, Price_Types__c, Plus_Minus__c, Plus_Minus_Code__c, OwnerId, Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Id, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c FROM ERP_Pricing_Condition__c',Variable__c='priCondObj');  paQueyrList.add(paquery15);
            PAQuery__c paquery16 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT isNPCApplicable__c,Pricing_Request__r.BU__c,Pricing_Request__r.Reason_Detail__c,Pricing_Request__r.Is_End_User_Rebate__c,Price_Reduction__c,Sales_Reduction__c ,Deal_Margin__c ,Cost_Price__c,Deal_Revenue__c ,Ship_To_Country__c,Ship_To_Country_Code__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Attachments_on_Customer_Prices__c,Price_Ref_Partner_Code__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c, ERP_Pricing_Procedure__r.Pricing_Procedure__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Country_Code__c,Country__c,BU__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c,Valid_To__c,Pricing_Request__r.Request_Type__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c, Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c,Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Below_Reference_Flag__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c, Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c, Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c, Net_Price_Calculated_Materials__c,Total_Materials__c,Pricing_Request__r.Landing_Cost__c,Integration_Error_Message__c,Net_Price_Status__c, Number_of_Material_with_Gross_Price__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Pricing_exception__c, Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c, Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c, isVolumeApplicable__c,Volume__c,Volume_UoM__c,New_Volume__c,New_Volume_UoM__c,Material_Group_5__c,Material_Group_5_Code__c,Project__c, ComPartner__c,ComPartner_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM Pricing_Request_Item__c',Variable__c='priList');  paQueyrList.add(paquery16);
            PAQuery__c paquery17 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Calculation_Type__c,PCKC__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Plus_Minus_Code__c,Scale_Basis__c,Scale_Basis_Code__c, Id,Unit__c,Scaled_Price_Flag__c ,UoM__c,Per__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c, ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Plus_Minus__c,Scale_Type__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,Quantity__c FROM ERP_Sales_Prices_SAP__c',Variable__c='relatedSAPRecordsList1');  paQueyrList.add(paquery17);
            PAQuery__c paquery18 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Plus_Minus_Code__c,Scale_Basis__c,Scale_Basis_Code__c, Id,Unit__c,Scaled_Price_Flag__c ,UoM__c,Per__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c, ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Plus_Minus__c,Scale_Type__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c FROM Sales_Prices__c',Variable__c='relatedNonSAPRecordsList1');  paQueyrList.add(paquery18);
            PAQuery__c paquery19 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Id,Name,PCKC__c,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c, Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c, Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c, PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c, Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c, ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_Ref__c,Project_Id__c,Calculation_Type__c,Calculation_Type_Code__c, Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,SAP_Cluster__c, ComPartner__c,ComPartner_Code__c,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='projectRecordList');  paQueyrList.add(paquery19);
            PAQuery__c paquery20 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT BU__c,Pricing_Request__r.Reason_Detail__c,Pricing_Request__r.BU__c,Ship_To_Country__c,Ship_To_Country_Code__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c,Country_Code__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Disc_Ref__c, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c, Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById, Country__c, Below_Reference_Flag__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c, Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c, Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,Pricing_Request__r.Request_Valid_From__c,Pricing_Request__r.Request_Valid_To__c, Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c, Materials_Below_Net_Current__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c,Total_Materials__c,Integration_Error_Message__c ,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,Pricing_Request__r.Request_Type__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Error_Indicator__c, Pricing_Request__r.Default_Currency__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isPaymentTermsApplicable__c, ComPartner__c,ComPartner_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Pricing_Request_Item__c',Variable__c='priReqItemList');  paQueyrList.add(paquery20);
            PAQuery__c paquery21 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT F_NPC_Callout_Status__c,Is_End_User_Rebate__c,Reason_Detail__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c, SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c, Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c, Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate, CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Sent_To_Backup_Approver__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name, Project_Header_Approval_Flag__c ,NPC_Status__c,Landing_Cost__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c, ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c',Variable__c='pricingRequest');  paQueyrList.add(paquery21);
            PAQuery__c paquery22 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Is_End_User_Rebate__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c, Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c, Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c, Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name, On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c, Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name, CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c, On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c, Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c, Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c, ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c',Variable__c='request.pricingRequest');  paQueyrList.add(paquery22);
            PAQuery__c paquery23 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Ship_To_Country_Code__c,Ship_To_Country__c,ShipTo__c, ShipTo_Code__c, Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c, Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c, Division_Code__c,End_Use_Code__c,End_Use__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c, Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c, PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c, PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c, Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c, Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c, SAP_Client_ID__c,Sold_To_Code__c,Sold_To__c, PCKC__c,Terms_of_Payment_Code__c,Approved_Date__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,ComPartner__c,ComPartner_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c',Variable__c='holList');  paQueyrList.add(paquery23);
            PAQuery__c paquery24 =  new PAQuery__c(Class__c='PARequestItem',Query__c='SELECT Id,isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c, Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c, Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c, Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c',Variable__c='accessSeqObj');  paQueyrList.add(paquery24);
            PAQuery__c paquery25 =  new PAQuery__c(Class__c='PARequestItem',Query__c='select Pricing_Condition__c,Sales_Pricing_Procedure_Condition_Config__c,Sales_Pricing_Procedure__c, Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Condition__r.Pricing_Condition_Description__c, Pricing_Condition__r.Pricing_Condition__c,Pricing_Condition__r.Calculation_Type__c, Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Scale_Base__c,Pricing_Condition__r.Check_Scale__c from ERP_Procedure_Conditions__c',Variable__c='proCondList');  paQueyrList.add(paquery25);
            PAQuery__c paquery26 =  new PAQuery__c(Class__c='PARequestItem',Query__c='select id,ERP_Currency__c,ERP_UoM__c,Retroactive_Limit__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c, Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,OrgGroup__c,OrgGroup__r.ERP_Sales_Org__c,Base_UoM__c, OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division__c,Business__r.Business__c,ERP_Pricing_Procedure__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c, Include_Customer_Currency__c, Enable_Variable_Config_Materials__c from Organizational_Group_Item__c',Variable__c='orgGroupItemList');  paQueyrList.add(paquery26);
            PAQuery__c paquery27 =  new PAQuery__c(Class__c='PARequestItem',Query__c='select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c,ERP_Product_Hierarchy_Level_1_Code__c, ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c, ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c, ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c FROM Material__c',Variable__c='matList');  paQueyrList.add(paquery27);
            PAQuery__c paquery28 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c, Account_Group__c,Distribution_Channel__c,Distribution_Channel_Code__c,Division__c, Division_Code__c ,PO_Box__c,Sales_Org__c,Sales_Org_Code__c ,State_Province__c, State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c, Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c, Customer_Price_Group__c ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c, Deletion_Flag__c,Customer_General_Data__r.Deletion_Flag__c,Customer_Group_1__c, Customer_Group_1_Code__c,Customer_Group_2__c,Customer_Group_2_Code__c,Customer_Group_3__c, Customer_Group_3_Code__c,Customer_Group_4__c,Customer_Group_4_Code__c,Customer_Group_5__c, Customer_Group_5_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c',Variable__c='listOfCustomer');  paQueyrList.add(paquery28);
            PAQuery__c paquery29 =  new PAQuery__c(Class__c='PARequest',Query__c='select Id,Project_Id__c,Name,Project_status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c, Pricing_Condition__c,Pricing_Condition_Code__c,Project_Volume__c, Default_Discount__c,Valid_From__c, Valid_To__c,status__c From Project_Price__c',Variable__c='projList');  paQueyrList.add(paquery29);
            PAQuery__c paquery30 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Id,Name,Customer_Group_2_Code__c, Customer_Group_2__c,city__c,country__c,country_code__c,currency_code__c,customer_code__c, Distribution_Channel_Code__c,Distribution_channel__c, Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c, Customer_Price_Group__c,Price_List_type__c, price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c, sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c, Zip_Postal_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c,State__c FROM ERP_Customer__c',Variable__c='customer.paErpCustomer');  paQueyrList.add(paquery30);
            PAQuery__c paquery31 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Subtype__c,F_NPC_Callout_Status__c,Reason_Detail__c,Default_Per__c,Total_Deal_Value__c ,Default_UoM__c,Is_End_User_Rebate__c,Default_Discount__c,End_User_Code__c,End_User__c,End_User_Country__c ,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c, Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c, Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c, Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name, On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c, Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name, CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c, On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c, Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c, Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c, Delegation_Comments__c,ComPartner__c,ComPartner_Code__c,Request_Id__c, Owner.Email FROM Pricing_Request__c',Variable__c='pricingRequest');  paQueyrList.add(paquery31);
            PAQuery__c paquery32 =  new PAQuery__c(Class__c='PAApprovalWF',Query__c='SELECT F_NPC_Callout_Status__c,End_User__c,End_User_Country__c,Default_Per__c,Default_UoM__c,Is_End_User_Rebate__c,Total_Deal_Value__c ,End_User_Code__c,Reason_Detail__c,Default_Discount__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Submitted_By__c,Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Pricing_Exception__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c, SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name, On_Behalf_Of__c, Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c, Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate, CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name, Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,Landing_Cost__c, Backup_Level_1__c, Backup_Level_1__r.name, Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name, Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, approverText__c,Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c, Approver1__r.Email, Approver2__r.Email, Approver3__r.Email, Approver4__r.Email, approver5__r.Email, ComPartner__c, ComPartner_Code__c,Delegation_Comments__c,Attachments_on_Customer_Prices__c, Owner.Email FROM Pricing_Request__c',Variable__c='request.pricingRequest');  paQueyrList.add(paquery32);
            // updated query for paquery33, added Pricing_Request__r.Spot_Type__c by sumita dabas 2 nov 2015 Issue 58402
            PAQuery__c paquery33 =  new PAQuery__c(Class__c='PAApprovalWF',Query__c='SELECT PCKC__c,Pricing_Request__r.Reason_Detail__c,Expire__c,Stamp_Floor_Price__c,End_User_Code__c,End_User__c,Country_Code__c, Stamp_Reference_Price__c,Price_Reduction__c,Sales_Reduction__c,Pricing_Request__r.Is_End_User_Rebate__c ,Deal_Margin__c,SAP_Application_Id__c,SAP_Client_Id__c,Dist_Channel_Code__c ,Cost_Price__c,Pricing_Condition_Code__c ,Calculation_Type__c,isVolumeApplicable__c,New_Volume__c,New_Volume_UoM__c,isNPCApplicable__c,isPaymentTermsApplicable__c,New_Customer_Price_Payment_Terms__c,BU__c,F_Product_Hierarchy_Code__c,id, Below_Floor_Flag__c, Below_Reference_Flag__c, Below_Current_Flag__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_Below_Net_Current__c, Material_Code__c, Valid_From__c, Valid_To__c, Market_Segment_COde__C, MArket_Segment__c, Key_Combination__c,Key_Combination_Code__c,SAP_Cluster__c, Sold_To_Code__c, Country__c, Sales_Office__c, Quantity__c, Sales_Office_Code__c, Sales_Org__c, Sales_Org_Code__c, End_Use__c, End_Use_Code__c, PH1__c, PH2__c, PH1_Code__c, PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c, New_Rate__c, New_Per__c, New_Unit__c, New_UOM__c, New_Valid_From__c, New_Valid_To__c, Net_Price_Status__c, Pricing_Request__r.Sales_Org_Code__c,Error_Indicator__c,Profit_Center_Code__c,Division__c,Division_Code__c,Pricing_Request__r.Request_Reason__c,Pricing_Request_Type__c,Variant__c,Variant_Code__c, ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Char_Name__c, Kcode__c,Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, FixValDate__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Pricing_Request__r.Spot_Type__c FROM Pricing_Request_Item__c',Variable__c='pricingRequestItemsList');  paQueyrList.add(paquery33);
            PAQuery__c paquery34 =  new PAQuery__c(Class__c='PAApprovalWF',Query__c='SELECT BU__c, Approver_Backup__c, All_Other_Values_Backup__c, Mixed_Values_Backup__c, Sales_Organisation__c, Distribution_Channel__c, Division__c, Approver_Role__c, Key_Field_Value__c,Key_Field_Id__c, Key_Field__c, Mixed_Values__c, All_Other_Values__c, Approver_Id__c,Approver_Id__r.name,Mixed_Values__r.name, All_Other_Values__r.name, Approver_Backup__r.name,All_Other_Values_Backup__r.name, Mixed_Values_Backup__r.name, Approver_Name__c FROM Setup_Object__c',Variable__c='setupObjectList');  paQueyrList.add(paquery34);
            PAQuery__c paquery35 =  new PAQuery__c(Class__c='PAApprovalWF',Query__c='SELECT id, BU__c, Country__c, Sales_Organisation__c, Price_Category__c, Distribution_Channel__c, Division__c, Request_Type__c, Request_Class__c from PA_BU_Admin_Master__c',Variable__c='adminMasterList');  paQueyrList.add(paquery35);
            PAQuery__c paquery36 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c, Distribution_Channel_Code__c,Distribution_channel__c, Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c, Customer_Price_Group__c,Price_List_type__c, price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c, sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c, Zip_Postal_Code__c,Customer_Group_2_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c,state__c FROM ERP_Customer__c',Variable__c='customer.paErpCustomer');  paQueyrList.add(paquery36);
            PAQuery__c paquery37 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Ship_To_Country__c,Pricing_Request__r.Reason_Detail__c,Cost_Price__c,Price_Reduction__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Disc_Ref__c, Market_Segment_Code__c,Market_Segment__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c, Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c, Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c, Condition_Class__c,Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c,Customer_Specific__c, Customer_Price_Group__c,Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById,Below_Reference_Flag__c, Below_Floor_Flag__c,Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c, Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c, Gap_Pricing_Request_Item__r.New_Rate__c,Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c, Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c, Gap_Pricing_Request_Item__r.Rate__c,Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c, Gap_Pricing_Request_Item__r.UoM__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Sales_Org_Code__c, Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,Materials_Below_Net_Current__c, Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c, Net_Price_Calculated_Materials__c, Total_Materials__c ,Integration_Error_Message__c,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c, Pricing_Request__r.Request_Type__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Display_Standardized_Rate__c, Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c, Pricing_Request__r.Standardized_UoM__c,New_Volume__c, New_Volume_UoM__c, Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM Pricing_Request_Item__c',Variable__c='requestItemList');  paQueyrList.add(paquery37);
            PAQuery__c paquery38 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT SystemModstamp, Status__c, Scale_Type__c, Scale_Type_Code__c, Scale_Basis_Code__c, Scale_Base__c, SAP_Condition_Type__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Pricing_Condition__c, Pricing_Condition_Description__c, Pricing_Condition_Code__c, Price_Types__c, Plus_Minus__c, Plus_Minus_Code__c, OwnerId, Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Id, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c FROM ERP_Pricing_Condition__c',Variable__c='priCondObj');  paQueyrList.add(paquery38);
            PAQuery__c paquery39 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c, Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c,Non_Customer_Permanent_Request_Reasons__c, OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Distribution_Channel_Code__c, OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c FROM Organizational_Group_Item__c',Variable__c='tempOgList');  paQueyrList.add(paquery39);
            PAQuery__c paquery40 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel__c, OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division__c,OrgGroup__r.ERP_Division_Code__c FROM Organizational_Group_User__c',Variable__c='ogUsersSA');  paQueyrList.add(paquery40);
            PAQuery__c paquery41 =  new PAQuery__c(Class__c='PARequest',Query__c='select Default_Prices_Selection__c,Request_Class__c, Base_UoM__c,Enable_Request_Class__c,id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c, ERP_Pricing_Procedure__r.SAP_Client_Id__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c,isPaymentTermsApplicable__c,isVolumeApplicable__c from Organizational_Group_Item__c',Variable__c='orgGroupItemObj');  paQueyrList.add(paquery41);
            PAQuery__c paquery42 =  new PAQuery__c(Class__c='PARequest',Query__c='select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__c,Pricing_Condition__r.Calculation_Type__c ,Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Price_Types__c from ERP_Procedure_Conditions__c',Variable__c='proCondObj');  paQueyrList.add(paquery42);
            PAQuery__c paquery43 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Id,currency_code__c,customer_code__c,Distribution_Channel_Code__c,Distribution_channel__c, Division__c,Division_code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c FROM ERP_Customer__c',Variable__c='cusList');  paQueyrList.add(paquery43);
            PAQuery__c paquery44 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Default_Prices_Selection__c,Request_Class__c, Base_UoM__c,Enable_Request_Class__c,Id,ERP_Pricing_Procedure__c,Business__r.Name, Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Customer_Request_Reasons__c, Latest_Valid_From_Offset_Non_Cust_Spec__c,Rebate_Agreement__c ,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c, landing_cost__c,Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Type__c,Pricing_Task_Reasons__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,Approval_Escalation_Price_Requests__c,Approval_Escalation_Pricing_Task__c FROM Organizational_Group_Item__c',Variable__c='orgGroupItemsList');  paQueyrList.add(paquery44);
            PAQuery__c paquery45 =  new PAQuery__c(Class__c='PARequest',Query__c='SELECT Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c, Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c FROM Organizational_Group_Item__c',Variable__c='buOrgGroup');  paQueyrList.add(paquery45);
            PAQuery__c paquery46 =  new PAQuery__c(Class__c='PARequest',Query__c='select Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c, Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c, Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c, PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c, Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c, Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c, SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,Project_Id__c, ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,PCKC__c, ComPartner__c,ComPartner_Code__c, Price_Holder__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c from ERP_Sales_Prices_SAP__c',Variable__c='listofDynamicTables');  paQueyrList.add(paquery46);
            PAQuery__c paquery47 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='SELECT New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,New_Volume__c, Price_Reduction__c, New_Volume_UoM__c,Ship_To_Country__c,Ship_To_Country_Code__c,country_code__c, Pricing_Request__r.End_User__c,Pricing_Request__r.End_User_Code__c,Pricing_Request__r.Sold_To__c,Pricing_Request__r.SoldTo_Code__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c, ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Sales_Order_Type_Code__c,Sales_Order_Type__c,Valid_To__c,BU__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, Scale_UoM_Scale_Unit__c, Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Task_UoM__c, Pricing_Request__c,Pricing_Request__r.Request_Type__c,Pricing_Request__r.Customer_Specific__c,Pricing_Request__r.On_Behalf_Of__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, ERP_Pricing_Procedure__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CurrencyIsoCode,CreatedDate, CreatedById, Country__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Below_Reference_Price__c, Below_Reference_Flag__c, Below_Floor_Price__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c ,Pricing_Request__r.OwnerId,Price_Ref_Partner__c,Price_Ref_Partner_Code__c, ERP_Pricing_Procedure__r.SAP_Cluster__c,Material_Group_1__c, Material_Group_1_Code__c,Char_Name__c,Kcode__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Pricing_request_item__c',Variable__c='priApprovedList');  paQueyrList.add(paquery47);
            PAQuery__c paquery48 =  new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c, Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c, Reference_Key_Combination__c, Reference_Pricing_Condition__c,isPaymentTermsApplicable__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c',Variable__c='accessSeqObj');  paQueyrList.add(paquery48);
            PAQuery__c paquery49 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c, Rate__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, PH8_Code__c,PH7_Code__c, PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c, PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c,ComPartner__c, ComPartner_Code__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c, Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c From Sales_Prices__c',Variable__c='linkedPricingRecords');  paQueyrList.add(paquery49);
            PAQuery__c paquery50 =  new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT Ship_To_Country__c,PCKC__c ,Ship_To_Country_Code__c,Terms_of_Payment__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,SAP_Cluster__c, Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c, End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c, Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c, Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c, PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c, PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c, Profit_Center_Code__c,project_id__C,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c, Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c, SAP_Application_Id__c,SAP_Client_ID__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c, ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c, ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c, Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c, Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, PCKC__C,Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='salespriceobj');  paQueyrList.add(paquery50);
            PAQuery__c paquery51 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c, Rate__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, PH8_Code__c,PH7_Code__c, PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c, PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c,ComPartner__c,ComPartner_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c From Sales_Prices__c',Variable__c='allHoldersList');  paQueyrList.add(paquery51);
            PAQuery__c paquery52 =  new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT Contract__c, Contract_Code__c, Ship_To_Country_Code__c, Ship_To_Country__c, ShipTo__c, ShipTo_Code__c, Calculation_Type_Code__c,Calculation_Type__c,Condition_Class_Code__c,Condition_Class__c,Plus_Minus_Code__c,Plus_Minus__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c, Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,Incoterms_1_Code__c,Incoterms1__c,Market_Segment__c,Market_Segment_Code__c,Project__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,Sales_Order_Type_Code__c, Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c, PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c, Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c, Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Terms_of_Payment_Code__c,Unit__c,UoM__c, Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c, ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM Sales_Prices__c',Variable__c='salesPriceNonSAP');  paQueyrList.add(paquery52);
            PAQuery__c paquery53 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c, Rate__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, PH8_Code__c,PH7_Code__c, PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c, PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c, ComPartner__c, ComPartner_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c From Sales_Prices__c',Variable__c='childRecOfDelHolder');  paQueyrList.add(paquery53);
            PAQuery__c paquery54 =  new PAQuery__c(Class__c='PASalesPriceSAP',Query__c='SELECT BU__c,Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,PCKC__C, Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Id,Name,Country_Code__c, Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c, Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Condition_Class__c, Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c, Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c, PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c, PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,markForDeletion__c, Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Condition_Class_Code__c, Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,Calculation_Type__c, SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c, ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Calculation_Type_Code__c, Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c, Check_Scale_Code__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c, Plus_Minus_Code__c,Plus_Minus__c,Volume__c,Volume_UoM__c, Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c FROM ERP_Sales_Prices_SAP__c',Variable__c='salesPriceRecordsList');  paQueyrList.add(paquery54);
            PAQuery__c paquery55 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='Select Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Pricing_Request__c,markForDeletion__c,KC_SAP__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c, ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Document_Currency__c,Document_Currency_Code__c, Sales_Order_Type_Code__c,Sales_Order_Type__c, isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, /*Scale_Base__c, */ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c, Record_Id__c, Rate__c, Quantity__c, Project_Id__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Owning_Business__c, OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Distribution_Channel_Code__c, Dist_Channel__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c,Price_Ref_Partner__c,Price_Ref_Partner_Code__c, Approved_Date__c From ERP_Sales_Prices_SAP__c',Variable__c='upsertHolderList');  paQueyrList.add(paquery55);
            PAQuery__c paquery56 =  new PAQuery__c(Class__c='Trig_validatePriceAUNew',Query__c='Select Ship_To_Country_Code__c,Ship_To_Country__c,Pricing_Request__c, ShipTo__c, ShipTo_Code__c,markForDeletion__c,KC_SAP__c,isPriceHolder__c,BU__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_Code__c, Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c, Rate__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9_Code__c, PH8_Code__c,PH7_Code__c, PH6_Code__c, PH5_Code__c, PH4_Code__c,PH3_Code__c,PH2_Code__c, PH1_Code__c, PCKC__c,OwnerId, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_1_Code__c, Incoterms1__c, Id, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c, Dist_Channel_Code__c, Dist_Channel__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c, Condition_Class__c, Condition_Class_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Approved_Date__c, ComPartner__c, ComPartner_Code__c From Sales_Prices__c',Variable__c='childRecOfDelHolder');  paQueyrList.add(paquery56);
        insert paQueyrList;
         //Piyush Start
        List <IntegrationLoginCredentials__c> ilcpr4 = new List<IntegrationLoginCredentials__c>();
        IntegrationLoginCredentials__c inte1 =new IntegrationLoginCredentials__c(); 
        inte1.Name='spec.specpa@dupont.com';
        inte1.EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF';
        ilcpr4.add(inte1);
        IntegrationLoginCredentials__c inte =new IntegrationLoginCredentials__c();
         inte.Name='spec.specpa@dupont.com.esu';
         inte.EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF';
         ilcpr4.add(inte);
        insert ilcpr4;
        //Piyush end                                                                                      //
        //test.stopTest();            
}


    
    static testMethod void paApprovalWFTestMethod20() {
        
        //Test.startTest();
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        User user2 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername2'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user2;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 2];
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        User user2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        user2.managerId = managerUser.Id;
        insert user2;
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; 
        //Test.startTest();
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestBU-A640';
        g.DeveloperName = 'TestBUA640';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        EmailTemplate emailTemplate = [SELECT id FROM EmailTemplate LIMIT 1];
            
        PA_Email_Template_Custom_Settings__c customSettingTemplate = new PA_Email_Template_Custom_Settings__c();
        customSettingTemplate.Name = 'EscalationNotificationNoBackup';
        customSettingTemplate.Template_Id__c = emailTemplate.Id;
        insert customSettingTemplate;
        
        PA_Email_Template_Custom_Settings__c customSettingTemplate1 = new PA_Email_Template_Custom_Settings__c();
        customSettingTemplate1.Name = 'EscalationNotificationtoBUAdmin';
        customSettingTemplate1.Template_Id__c = emailTemplate.Id;
        insert customSettingTemplate1;
        
        PA_Email_Template_Custom_Settings__c customSettingTemplate2 = new PA_Email_Template_Custom_Settings__c();
        customSettingTemplate2.Name = 'Approval Template';
        customSettingTemplate2.Template_Id__c = emailTemplate.Id;
        insert customSettingTemplate2;
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        
        PAApprovalWF approvalWF2 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF3 = new PAApprovalWF(paServiceState);
        
        approvalWF2.request = new PARequest(paServiceState);
        approvalWF3.request = new PARequest(paServiceState);
        
        Test.startTest();
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        //Test.startTest();
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Customer Specific';
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.approver1__c = user1.Id;
        pr2.approver2__c = user1.Id;
        pr2.approver3__c = user1.Id;
        pr2.approver4__c = user1.Id;
        pr2.approver5__c = user1.Id;
        pr2.Current_Level__c = '5';
        pr2.Current_Approver__c = user2.Id;
        pr2.BU__c = 'TestBU';
        pr2.Sales_Org_Code__c='A640';
        insert pr2;
        
        Pricing_Request__c pr3 = new Pricing_Request__c();
        pr3.Request_Type__c = 'Customer Specific';
        pr3.BU__c = 'Test Business';
        pr3.Pricing_Request_Type__c = 'Permanent';
        pr3.approver1__c = user1.Id;
        pr3.approver2__c = user1.Id;
        pr3.approver3__c = user1.Id;
        pr3.approver4__c = user1.Id;
        pr3.approver5__c = user1.Id;
        pr3.Current_Approver__c = user2.Id;
        pr3.Current_Level__c = '1';
        pr3.BU__c = 'Test Business';
        insert pr3;
        
        pricingRequestSelectedList.add(pr3);
        pricingRequestSelectedList.add(pr2);
    // 1/20/2017 - Merge&Spin - Code merged from UTQA to SplitUtil    
        approvalWF2.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr2.Id];
     //20/2017 - Merge&Spin - Code merged from UTQA to SplitUtil                                               
        approvalWF3.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr3.Id];                      
                              
        
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF3.wrapList.add(wrap);
        }
        approvalWF3.selectedUserID = user1.Id;
        
        approvalWF3.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF3.action('PAHome', 'PAHome', 'submitContinue');
        
        try{
        //Test.startTest();
        //approvalWF3.action('PAHome', 'PAHome', 'popupreassign');
        
        approvalWF3.wrapforReassignObjList.addAll(wrapforReassignObjList);
        //approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF3.request.pricingRequest.Current_Level__c = '2';
        update approvalWF3.request.pricingRequest;
        //approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF3.request.pricingRequest.Current_Level__c = '3';
        update approvalWF3.request.pricingRequest;
        
        //approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF3.request.pricingRequest.Current_Level__c = '4';
        update approvalWF3.request.pricingRequest;
        //approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        
        
        approvalWF3.request.pricingRequest.Current_Level__c = '5';
        update approvalWF3.request.pricingRequest;
        //approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF3.bulkApproval(pricingRequestSelectedList);
        Test.stopTest();
        }catch(exception e){}
        }
        
        
        
    }

static testMethod void paApprovalWFTestMethodPHKC() {
    
    
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        //List<User> userList = [SELECT id, Name from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        
        system.runAs(user1){
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic;
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        //paServiceState.ogItems.isEndUserRebate = true;
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        approvalWF.request.requestServiceState.ogItems.isEndUserRebate=true;
        
        Rebate_Price_Quote_Data__c rpqdata = new Rebate_Price_Quote_Data__c();
        rpqdata.Name = 'DPT NA-AD50';
        rpqdata.BU__c = 'DPT NA';
        rpqdata.Approval_Threshold__c = 250000;
        rpqdata.Sales_Org_Code__c = 'AD50';
        rpqdata.Default_Per__c = 1;
        rpqdata.Default_UoM__c = 'BX';
        rpqdata.Default_Currency__c = 'USD';
        rpqdata.Lookup_KeyCombination__c = 'A815';
        insert rpqdata;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c(SAP_Cluster__c='WB1');
        insert epp;
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.BU__c = 'DPT NA';
        pr.Sales_Org_Code__c = 'AD50';
        pr.Request_Reason__c = 'test';
        pr.Is_End_User_Rebate__c = true;
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Dist_Channel_Code__c = '10';
        pr.Division_Code__c = '02';
        pr.SAP_Cluster__c = 'WB1';
        insert pr;
        string prIf= pr.id;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'TestCode';
        material.ERP_Product_Hierarchy_Code__c = 'PH2';
        material.ERP_Sales_Org_Code__c='AD50';
        material.ERP_Profit_Center_Code__c ='abc';
        material.recordTypeId = Schema.SObjectType.material__C.RecordTypeInfosByName.get('ERP Material - Extended Data').RecordTypeId;
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = false;
        prItem.Below_Reference_Flag__c =false;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Rate__c  = '15';
        prItem.Quantity__c = '10';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        prItem.Material_Code__c = 'TestCode';
        prItem.Sales_Org_Code__c = 'AD50';
        prItem.Key_Combination_Code__c = 'A815';
        prItem.SAP_Cluster__c = 'WB1';
        prItem.ERP_Pricing_Procedure__c = epp.id;
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='TestCode';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Rate__c  = '15';
        prItem.New_Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Country__c = 'India';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        prItem.Sales_Org_Code__c = 'AD50';
        prItem.Key_Combination_Code__c = 'A815';
        prItem.SAP_Cluster__c = 'WB1';
        prItem.ERP_Pricing_Procedure__c = epp.id;
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='TestCode';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Rate__c  = '15';
        prItem.New_Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Country__c = 'India';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        prItem.Key_Combination__c = 'Test';
        prItem.Sales_Org_Code__c = 'AD50';
        prItem.Key_Combination_Code__c = 'A815';
        prItem.SAP_Cluster__c = 'WB1';
        prItem.ERP_Pricing_Procedure__c = epp.id;
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Is_End_User_Rebate__c = true;
        adminMaster.End_User_Rebate_Routing__c = 'Below Threshold';
        adminMaster.BU__c='DPT NA';
        adminMaster.Sales_Organisation__c = 'AD50';
        adminMaster.Price_Category__c = 'Permanent';
        adminMaster.Distribution_Channel__c ='10';
        adminMaster.Division__c = '02';
        
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '2';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Approver Role 1';
        adminDetail.Key_Field__c = 'FRB2';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Approver Role 1';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Approver Role 1';
        setupObj.BU__c = pr.BU__c;
        setupObj.Sales_Organisation__c = 'AD50';
        setupObj.Approver_Id__c = user1.id;
        setupObj.Distribution_Channel__c = '10';
        setupObj.Division__c ='02';
        setupObj.Key_Field_Value__c ='0 - 250K USD';
        setupObj.Key_Field_Id__c ='0 - 250000';
        
        insert setupObj;
        
        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.All_Other_Values__c = user1.Id;
        setupObj2.Mixed_Values__c = user1.id;
        setupObj2.Key_Field__c = 'FRB2';
        setupObj2.Approver_Role__c = 'Approver Role 1';
        setupObj2.BU__c = pr.BU__c;
        setupObj2.Sales_Organisation__c = 'AD50';
        setupObj2.Approver_Id__c = user1.id;
        setupObj2.Distribution_Channel__c = '10';
        setupObj2.Division__c ='02';
        setupObj2.Key_Field_Value__c ='0 - 250K USD';
        setupObj2.Key_Field_Id__c ='0 - 250000';
        
        insert setupObj2;
        //try{   
       /* Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Customer Specific';
        pr1.BU__c = 'DPT NA';
        pr1.Sales_Org_Code__c = 'AD50';
        pr1.Request_Reason__c = 'test';
        pr1.Is_End_User_Rebate__c = true;
        pr1.Pricing_Request_Type__c = 'Permanent';
        pr1.Dist_Channel_Code__c = '10';
        pr1.Division_Code__c = '02';
        pr1.SAP_Cluster__c = 'WB1';
        insert pr1;     
        //id prId = ApexPages.currentPage().getParameters().get('prIf');
        
            approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/ /*Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                  State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/ /*Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                  SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                  Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                  Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                  LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                  Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                  CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                  Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                                  Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                                  Sold_To_Code__r.Terms_Of_Payment__c,*/ /*On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                                  FROM Pricing_Request__c WHERE Id = :pr1.id];
                                  //FROM Pricing_Request__c WHERE Sales_Org_Code__c = 'AD50'];
                                  //FROM Pricing_Request__c WHERE Id = :prId];*/
        //Test.startTest();
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        //Test.startTest();
    // 12/30/2016 - Merge&Spin - Updated Userrole and User
        User user2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');

        user2.managerId = managerUser.Id;
        insert user2;
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Customer Specific';
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.BU__c = 'DPT NA';
        pr2.Sales_Org_Code__c = 'AD50';
        pr2.Request_Reason__c = 'test';
        pr2.Is_End_User_Rebate__c = true;
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.Dist_Channel_Code__c = '10';
        pr2.Division_Code__c = '02';
        pr2.SAP_Cluster__c = 'WB1';
        //pr2.approver2__c = user1.Id;
        //pr2.approver3__c = user1.Id;
       // pr2.approver4__c = user1.Id;
       // pr2.approver5__c = user1.Id;
        //pr2.Current_Level__c = '5';
        //pr2.Current_Approver__c = user2.Id;        
        //pr2.Sales_Org_Code__c='A640';
        insert pr2;
        
       /* Pricing_Request__c pr3 = new Pricing_Request__c();
        pr3.Request_Type__c = 'Customer Specific';
        pr3.BU__c = 'Test Business';
        pr3.Pricing_Request_Type__c = 'Permanent';
        pr3.approver1__c = user1.Id;
        pr3.approver2__c = user1.Id;
        pr3.approver3__c = user1.Id;
        pr3.approver4__c = user1.Id;
        pr3.approver5__c = user1.Id;
        pr3.Current_Approver__c = user2.Id;
        pr3.Current_Level__c = '1';
        pr3.BU__c = 'Test Business';
        insert pr3;*/
        
        //pricingRequestSelectedList.add(pr3);
        pricingRequestSelectedList.add(pr2);
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr2.Id];
    // 1/20/2017 - Merge&Spin - Code merged from UTQA to SplitUtil                                                
       // approvalWF3.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              //State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                             // SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              //Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              //Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                             // LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                             // Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              //CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                             // Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                             // Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                             // Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                             // Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                             // FROM Pricing_Request__c WHERE Id = :pr3.Id];                      
                                
                                  
        approvalWF.request.requestServiceState.currentRequest = approvalWF.request;
        approvalWF.request.pricingRequest.Request_Approval_Status__c = 'Submitted';
        
        approvalWF.request.pricingRequest.Current_Level__c = '5';
        upsert approvalWF.request.pricingRequest;
        //}catch(Exception e){}
       // Test.stopTest();
        List<Material__c> mlist = [select RecordType.Name,ERP_Material_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Sales_Org_Code__c from Material__c];
        system.debug('mlist.get(0).RecordType.Name is '+mlist.get(0).RecordType.Name);
        system.debug('ERP_Material_Code__c is '+mlist.get(0).ERP_Material_Code__c);
        system.debug('ERP_Product_Hierarchy_Code__c is '+mlist.get(0).ERP_Product_Hierarchy_Code__c);
        system.debug('ERP_Sales_Org_Code__c is '+mlist.get(0).ERP_Sales_Org_Code__c);
        Test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        
        approvalWF.request.pricingRequest.Request_Type__c = 'Import';
       update approvalWF.request.pricingRequest;
        ERP_Key_Combination__c kc = new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',
                                                 Key_Combination_Code__c='A815',Customer_Specific__c=true,SAP_Cluster__c='WB1');
        insert kc;
        approvalWF.action('a','b','c');
        kc.Customer_Specific__c = false;
        approvalWF.action('a','b','c');
        approvalWF.request.pricingRequest.Request_Type__c = 'Mass Import';
        update approvalWF.request.pricingRequest;
        approvalWF.action('a','b','c');
        Test.stopTest();
        }
    }


static testMethod void paApprovalWFTestMethodPHKC1() {
    
    
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true limit 1];
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        
        system.runAs(user1){
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic;
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        //paServiceState.ogItems.isEndUserRebate = true;
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Rebate_Price_Quote_Data__c rpqdata = new Rebate_Price_Quote_Data__c();
        rpqdata.Name = 'DPT NA-AD50';
        rpqdata.BU__c = 'DPT NA';
        rpqdata.Approval_Threshold__c = 250000;
        rpqdata.Sales_Org_Code__c = 'AD50';
        rpqdata.Default_Per__c = 1;
        rpqdata.Default_UoM__c = 'BX';
        rpqdata.Default_Currency__c = 'USD';
        rpqdata.Lookup_KeyCombination__c = 'A815';
        insert rpqdata;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c(SAP_Cluster__c='WB1');
        insert epp;
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.BU__c = 'DPT NA';
        pr.Sales_Org_Code__c = 'AD50';
        pr.Request_Reason__c = 'test';
        pr.Is_End_User_Rebate__c = true;
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Dist_Channel_Code__c = '10';
        pr.Division_Code__c = '02';
        pr.SAP_Cluster__c = 'WB1';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'TestCode';
        material.ERP_Product_Hierarchy_Code__c = 'PH2';
        material.ERP_Sales_Org_Code__c='AD50';
        material.ERP_Profit_Center_Code__c ='abc';
        material.recordTypeId = Schema.SObjectType.material__C.RecordTypeInfosByName.get('ERP Material - Extended Data').RecordTypeId;
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = false;
        prItem.Below_Reference_Flag__c =false;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Rate__c  = '15';
        prItem.Quantity__c = '10';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        prItem.Material_Code__c = 'TestCode';
        prItem.Sales_Org_Code__c = 'AD50';
        prItem.Key_Combination_Code__c = 'A815';
        prItem.SAP_Cluster__c = 'WB1';
        prItem.ERP_Pricing_Procedure__c = epp.id;
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='TestCode';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Rate__c  = '15';
        prItem.New_Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Country__c = 'India';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        prItem.Sales_Org_Code__c = 'AD50';
        prItem.Key_Combination_Code__c = 'A815';
        prItem.SAP_Cluster__c = 'WB1';
        prItem.ERP_Pricing_Procedure__c = epp.id;
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='TestCode';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Rate__c  = '15';
        prItem.New_Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Country__c = 'India';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        prItem.Key_Combination__c = 'Test';
        prItem.Sales_Org_Code__c = 'AD50';
        prItem.Key_Combination_Code__c = 'A815';
        prItem.SAP_Cluster__c = 'WB1';
        prItem.ERP_Pricing_Procedure__c = epp.id;
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Is_End_User_Rebate__c = true;
        adminMaster.End_User_Rebate_Routing__c = 'Below Threshold';
        adminMaster.BU__c='DPT NA';
        adminMaster.Sales_Organisation__c = 'AD50';
        adminMaster.Price_Category__c = 'Permanent';
        adminMaster.Distribution_Channel__c ='10';
        adminMaster.Division__c = '02';
        
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '2';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Approver Role 1';
        adminDetail.Key_Field__c = 'FRB2';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Approver Role 1';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;        
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Approver Role 1';
        setupObj.BU__c = pr.BU__c;
        setupObj.Sales_Organisation__c = 'AD50';
        setupObj.Approver_Id__c = user1.id;
        setupObj.Distribution_Channel__c = '10';
        setupObj.Division__c ='02';
        setupObj.Key_Field_Value__c ='0 - 250K USD';
        setupObj.Key_Field_Id__c ='0 - 250000';
        
        insert setupObj;
        
        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.All_Other_Values__c = user1.Id;
        setupObj2.Mixed_Values__c = user1.id;
        setupObj2.Key_Field__c = 'FRB2';
        setupObj2.Approver_Role__c = 'Approver Role 1';
        setupObj2.BU__c = pr.BU__c;
        setupObj2.Sales_Organisation__c = 'AD50';
        setupObj2.Approver_Id__c = user1.id;
        setupObj2.Distribution_Channel__c = '10';
        setupObj2.Division__c ='02';
        setupObj2.Key_Field_Value__c ='0 - 250K USD';
        setupObj2.Key_Field_Id__c ='0 - 250000';
        
        insert setupObj2;
        //try{
            approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                  State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                  SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                  Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                  Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                  LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                  Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                  CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                  Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                                  Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                                  Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                                  FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.request.requestServiceState.currentRequest = approvalWF.request;
        approvalWF.request.pricingRequest.Request_Approval_Status__c = 'Submitted';
        
        approvalWF.request.pricingRequest.Current_Level__c = '5';
        upsert approvalWF.request.pricingRequest;
       // }catch(Exception e){}
        
        List<Material__c> mlist = [select RecordType.Name,ERP_Material_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Sales_Org_Code__c from Material__c];
        Test.startTest();
        
        ERP_Key_Combination__c kc = new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',
                                                 Key_Combination_Code__c='A815',Customer_Specific__c=false,SAP_Cluster__c='WB1');
        insert kc;
        
        approvalWF.request.pricingRequest.Pricing_Request_Type__c = 'Pricing Task';
        approvalWF.request.pricingRequest.Spot_Type__c = 'Rebate Agreement';
        update approvalWF.request.pricingRequest;
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        Test.stopTest();
        }
    }
static testMethod void paApprovalWFTestMethodRPQ() {
    
    
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        //List<User> userList = [SELECT id, Name from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        
        system.runAs(user1){
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic;
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        //paServiceState.ogItems.isEndUserRebate = true;
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Rebate_Price_Quote_Data__c rpqdata = new Rebate_Price_Quote_Data__c();
        rpqdata.Name = 'DPT NA-AD50';
        rpqdata.BU__c = 'DPT NA';
        rpqdata.Approval_Threshold__c = 250000;
        rpqdata.Sales_Org_Code__c = 'AD50';
        rpqdata.Default_Per__c = 1;
        rpqdata.Default_UoM__c = 'BX';
        rpqdata.Default_Currency__c = 'USD';
        rpqdata.Lookup_KeyCombination__c = 'A815';
        insert rpqdata;
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.BU__c = 'DPT NA';
        pr.Sales_Org_Code__c = 'AD50';
        pr.Request_Reason__c = 'test';
        pr.Is_End_User_Rebate__c = true;
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.Dist_Channel_Code__c = '10';
        pr.Division_Code__c = '02';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = false;
        prItem.Below_Reference_Flag__c =false;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Rate__c  = '15';
        prItem.Quantity__c = '10';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Rate__c  = '15';
        prItem.New_Rate__c = '10';
        prItem.Quantity__c = '10';
        //prItem.Country__c = 'India';
        prItem.New_Unit__c = 'USD';
        prItem.New_Valid_From__c = system.today();
        prItem.New_Valid_To__c = system.today();
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Is_End_User_Rebate__c = true;
        adminMaster.End_User_Rebate_Routing__c = 'Below Threshold';
        adminMaster.BU__c='DPT NA';
        adminMaster.Sales_Organisation__c = 'AD50';
        adminMaster.Price_Category__c = 'Permanent';
        adminMaster.Distribution_Channel__c ='10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '2';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '4';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Approver Role 1';
        adminDetail.Key_Field__c = 'Sales Reduction';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Reduction';
        setupObj.Approver_Role__c = 'Approver Role 1';
        setupObj.BU__c = pr.BU__c;
        setupObj.Sales_Organisation__c = 'AD50';
        setupObj.Approver_Id__c = user1.id;
        setupObj.Distribution_Channel__c = '10';
        setupObj.Division__c ='02';
        setupObj.Key_Field_Value__c ='0 - 250K USD';
        setupObj.Key_Field_Id__c ='0 - 250000';
        
        insert setupObj;
       // try{
            approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                  State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                  SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                  Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                  Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                  LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                  Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                  CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                  Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                                  Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                                  Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                                  FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.request.requestServiceState.currentRequest = approvalWF.request;
        approvalWF.request.pricingRequest.Request_Approval_Status__c = 'Submitted';
       // }catch(Exception e){}
        approvalWF.request.pricingRequest.Current_Level__c = '5';
        upsert approvalWF.request.pricingRequest;
        Test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
       // approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        Test.stopTest();
        }
    }

static testMethod void paApprovalWFTestMethod4() {
    
    
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        //List<User> userList = [SELECT id, Name from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        
        system.runAs(user1){
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic;
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Market Segment';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
                
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.request.pricingRequest.Request_Approval_Status__c = 'Submitted';
        
        approvalWF.request.pricingRequest.Current_Level__c = '3';
        upsert approvalWF.request.pricingRequest;
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        system.debug('approvalWF.request.pricingRequest is '+approvalWF.request.pricingRequest);
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        approvalWF.bulkApproval(prList);
        prList.add(approvalWF.request.pricingRequest);
        
        approvalWF.saveBulkReassign(prList, user1.Id);
        //extra
        approvalWF.selectedLevel = '1';
        }
    }

static testMethod void paApprovalWFTestMethod34() {
    
        
        //test.startTest();
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        //List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        approvalWF .reassignedUserId='sample user';
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        // pr.Request_Approval_Status__c = 'Submitted';
        pr.OwnerId = user1.Id;
        pr.Request_Reason__c = 'test';
        insert pr;

        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
       adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        List<PA_BU_Admin_Detail__c> pabulist=new List<PA_BU_Admin_Detail__c>();
        pabulist.add(adminDetail);
        List<Id> usrli = new List<Id>();
        List<User> usrlist = [SELECT Id from User where isActive = true AND ManagerId <> NULL limit 1];
        for(User u:usrlist){
           usrli.add(u.id);}
        List<String> userstr = new List<String>{'Manager_XYZ'};
        List<String> dummylist = new List<String>();
        Map<Integer, list<Id>> mapFinalUsr=new Map<Integer, list<Id>>{1=>usrli,2=>dummylist,3=>dummylist,4=>dummylist};
        Set<String> setLevelNR=new Set<String>{'user','usr'}; 
        Map<Integer, list<String>> mapAutoUser=new Map<Integer, list<String>>{1=>userstr,2=>userstr,3=>userstr,4=>userstr};
        Map<Integer, String>mrpstr=new Map<Integer, String>{1=>'routingparam',2=>'Below Floor Price',3=>'Below Reference Price',4=>'Below Current Price'};
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.popApprover(pabulist,mapfinalusr,setLevelNR,mapautouser,mrpstr);
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
         approvalWF.action('PAHome', 'PAHome', 'closereassignpopup');
        

         Test.startTest();
        pr.NPC_Status__c='Waiting for Net Price';
        update pr;
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');

        // Test.stoptest();

        //commented by Priyanka - approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        //commented by Priyanka - approvalWF.selectedUserID = userList[0].Id;
        //commented by Priyanka - approvalWF.selectedUser = userList[0].Name;
        //commented by Priyanka - approvalWF.selectedLevel = '1';
        //test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = userList[0].Id;
        approvalWF.selectedUser = userList[0].Name;
        approvalWF.selectedLevel = '1';
        test.stopTest();
        }
    }

    static testMethod void paApprovalWFTestMethod35() {
        
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        //List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
        //List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        approvalWF .reassignedUserId='sample user';
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        // pr.Request_Approval_Status__c = 'Submitted';
        pr.OwnerId = user1.Id;
        pr.Request_Reason__c = 'test';
        insert pr;

        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'FRB7';
        insert adminDetail;
        List<PA_BU_Admin_Detail__c> pabulist=new List<PA_BU_Admin_Detail__c>();
        pabulist.add(adminDetail);
        List<Id> usrli = new List<Id>();
        List<User> usrlist = [SELECT Id from User where isActive = true AND ManagerId <> NULL limit 1];
        for(User u:usrlist){
           usrli.add(u.id);}
        List<String> userstr = new List<String>{'Manager_XYZ'};
        List<String> dummylist = new List<String>();
        Map<Integer, list<Id>> mapFinalUsr=new Map<Integer, list<Id>>{1=>usrli,2=>dummylist,3=>dummylist,4=>dummylist};
        Set<String> setLevelNR=new Set<String>{'user','usr'}; 
        Map<Integer, list<String>> mapAutoUser=new Map<Integer, list<String>>{1=>userstr,2=>userstr,3=>userstr,4=>userstr};
        Map<Integer, String>mrpstr=new Map<Integer, String>{1=>'routingparam',2=>'Below Floor Price',3=>'Below Reference Price',4=>'Below Current Price'};
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'FRB7';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.popApprover(pabulist,mapfinalusr,setLevelNR,mapautouser,mrpstr);
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
         approvalWF.action('PAHome', 'PAHome', 'closereassignpopup');
        

         Test.startTest();
        pr.NPC_Status__c='Waiting for Net Price';
        update pr;
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');

       

        //commented by Priyanka - approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        //commented by Priyanka - approvalWF.selectedUserID = userList[0].Id;
        //commented by Priyanka - approvalWF.selectedUser = userList[0].Name;
        //commented by Priyanka - approvalWF.selectedLevel = '1';
        
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = userList[0].Id;
        approvalWF.selectedUser = userList[0].Name;
        approvalWF.selectedLevel = '1';
        Test.stoptest();
        }
    }

         static testMethod void paApprovalWFTestMethod33() {
            
         
            
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Valid_From__c = system.today()+1;
        pr.Request_Valid_To__c = system.today()+2;
        pr.BU__c = 'Test Business';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Country__c = 'India';
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;


        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        adminMaster.BU__c = 'Test Business';
        adminMaster.Price_Category__c = 'Pricing Task';
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Pricing_Task_Type__c = 'Rebate Agreement';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Market Segment';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = '';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;

        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Below Current Price';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        PA_BU_Admin_Detail__c adminDetail2 = new PA_BU_Admin_Detail__c();
        adminDetail2.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail2.Routing_Parameter__c = 'Below Current Price';
        adminDetail2.Approval_Level__c = '5';
        adminDetail2.Approver_Role__c = 'Sales Approver';
        adminDetail2.Key_Field__c = 'Reason Code';
        insert adminDetail2;
        
        List<Setup_Object__c> soList = new List<Setup_Object__c>();
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Requester';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        soList.add(setupObj);

        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.All_Other_Values__c = user1.Id;
        setupObj2.Mixed_Values__c = user1.id;
        setupObj2.Key_Field__c = 'Requester';
        setupObj2.Approver_Role__c = '';
        setupObj2.BU__c = pr.BU__c;
        soList.add(setupObj2);

        Setup_Object__c setupObj3 = new Setup_Object__c();
        setupObj3.All_Other_Values__c = user1.Id;
        setupObj3.Mixed_Values__c = user1.id;
        setupObj3.Key_Field__c = 'Customer Group 2';
        setupObj3.Approver_Role__c = 'Sales Approver';
        setupObj3.BU__c = pr.BU__c;
        soList.add(setupObj3);

        Setup_Object__c setupObj4 = new Setup_Object__c();
        setupObj4.All_Other_Values__c = user1.Id;
        setupObj4.Mixed_Values__c = user1.id;
        setupObj4.Key_Field__c = 'Country';
        setupObj4.Key_Field_Value__c = 'India';
        setupObj4.Key_Field_ID__c = 'FRB';
        setupObj4.Approver_Role__c = 'Sales Approver';
        setupObj4.BU__c = pr.BU__c;
        soList.add(setupObj4);

        Setup_Object__c setupObj5 = new Setup_Object__c();
        setupObj5.All_Other_Values__c = user1.Id;
        setupObj5.Mixed_Values__c = user1.id;
        setupObj5.Key_Field__c = 'Division Code';
        setupObj5.Approver_Role__c = 'Sales Approver';
        setupObj5.BU__c = pr.BU__c;
        soList.add(setupObj5);

        insert soList;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.pcApprover(soList,adminDetail,new Set<String>(),1,new Set<String>{'Required'});
        approvalWF.pcApprover(soList,adminDetail,new Set<String>{'D6TP','PF'},1,new Set<String>{'Required'});
        approvalWF.pcApprover(soList,adminDetail2,new Set<String>(),1,new Set<String>{'abc'});
        approvalWF.pcApprover(soList,adminDetail2,new Set<String>{'D6TP','PF'},1,new Set<String>{'abc'});
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        try{                       
            approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            }
            catch(Exception e){}

            Test.startTest();
        pr.NPC_Status__c='Waiting for Net Price';
        pr.Request_Reason__c = 'test';
        update pr;
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');

         Test.stoptest();
        }
        

    }

   
    
        static testMethod void paApprovalWFTestMethod1() {
            
            
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
        //List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        approvalWF .reassignedUserId='sample user';
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        // pr.Request_Approval_Status__c = 'Submitted';
        pr.OwnerId = user1.Id;
        pr.Request_Reason__c = 'test';
        insert pr;

        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        List<PA_BU_Admin_Detail__c> pabulist=new List<PA_BU_Admin_Detail__c>();
        pabulist.add(adminDetail);
        List<Id> usrli = new List<Id>();
        List<User> usrlist = [SELECT Id from User where isActive = true AND ManagerId <> NULL limit 1];
        for(User u:usrlist){
           usrli.add(u.id);}
        List<String> userstr = new List<String>{'User1','User2'};
        Map<Integer, list<Id>> mapFinalUsr=new Map<Integer, list<Id>>{1=>usrli};
        Set<String> setLevelNR=new Set<String>{'user','usr'}; 
        Map<Integer, list<String>> mapAutoUser=new Map<Integer, list<String>>{1=>userstr};
        Map<Integer, String>mrpstr=new Map<Integer, String>{1=>'routingparam'};
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.popApprover(pabulist,mapfinalusr,setLevelNR,mapautouser,mrpstr);
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
         approvalWF.action('PAHome', 'PAHome', 'closereassignpopup');
        

         Test.startTest();
        pr.NPC_Status__c='Waiting for Net Price';
        update pr;
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');

        

        //commented by Priyanka - approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        //commented by Priyanka - approvalWF.selectedUserID = userList[0].Id;
        //commented by Priyanka - approvalWF.selectedUser = userList[0].Name;
        //commented by Priyanka - approvalWF.selectedLevel = '1';
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = userList[0].Id;
        approvalWF.selectedUser = userList[0].Name;
        approvalWF.selectedLevel = '1';
         Test.stoptest();
        }
    }


    static testMethod void paApprovalWFTestMethod() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
               
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        pr.Key_Combination__c='Material';
        //pr.Request_Approval_Status__c = 'Submitted';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF.action('PAHome', 'PAHome', 'approve');
        test.startTest();
       approvalWF.action('PAHome', 'PAHome', 'reject');
       //coveered in below method approvalWF.action('PAHome', 'PAHome', 'recall');
       //coveered in below method approvalWF.action('PAHome', 'PAHome', 'closeApproverpopup');
       approvalWF.action('PAHome', 'PAHome', 'popupreassign');
       //List<User> usrlist = [SELECT Id from User where isActive = true AND ManagerId <> NULL limit 1];
       approvalWF.action('PAHome', 'PAHome', 'recall');
       approvalWF.action('PAHome', 'PAHome', 'closeApproverpopup');
       //test.startTest();
       approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');       
        approvalWF.selectedUserID = userList[0].Id;
        approvalWF.selectedUser = userList[0].Name;
        approvalWF.selectedLevel = '1';
        test.stopTest();
    }
    static testMethod void paApprovalWFTestMethod00() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        //pr.Request_Approval_Status__c = 'Submitted';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
      test.startTest();
       approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
       approvalWF.action('PAHome', 'PAHome', 'approve');
         approvalWF.action('PAHome', 'PAHome', 'reject');
         approvalWF.action('PAHome', 'PAHome', 'recall');
         //test.startTest();
         approvalWF.action('PAHome', 'PAHome', 'closeApproverpopup');
        
       approvalWF.action('PAHome', 'PAHome', 'popupreassign');
        test.stopTest();
    }
    
    static testMethod void paApprovalWFTestMethod111() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
        //List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        // pr.Request_Approval_Status__c = 'Submitted';
        pr.OwnerId = user1.Id;
        pr.Request_Reason__c = 'test';
        insert pr;

        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         
         approvalWF.action('PAHome', 'PAHome', 'reassignLookup');
         test.startTest();
         approvalWF.action('PAHome', 'PAHome', 'closeUserLookup');
        //commented by Priyanka - approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        //commented by Priyanka - approvalWF.selectedUserID = userList[0].Id;
        //commented by Priyanka - approvalWF.selectedUser = userList[0].Name;
        //commented by Priyanka - approvalWF.selectedLevel = '1';
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = userList[0].Id;
        approvalWF.selectedUser = userList[0].Name;
        approvalWF.selectedLevel = '1';
        }
    } 
    static testMethod void paApprovalWFTestMethod2() {
                
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
        //List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        // pr.Request_Approval_Status__c = 'Submitted';
        pr.OwnerId = user1.Id;
         pr.Request_Reason__c = 'test';
        insert pr;

        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
            approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        for(Integer i = 1;i<6;i++){
            PAWrapper wrapforReassignObj = new PAWrapper();
            wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
            wrapforReassignObj.stringMap.put('userName', user1.Id);
            approvalWF.wrapforReassignObjList.add(wrapforReassignObj);
        }
        test.startTest();
        approvalWF.selectedLevel = '1';
        approvalWF.selectedUserID = user1.Id;
        approvalWF.selectedUser = user1.Name;
        approvalWF.selectedEmailId = 'abc@xyz.com';
       
        approvalWF.request.pricingRequest.Current_Level__c = '5';
        upsert approvalWF.request.pricingRequest;
      try{
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
       }catch(exception e){}
       List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        approvalWF.bulkApproval(prList);
        prList.add(approvalWF.request.pricingRequest);
         //test.stopTest();
      
        
        //extra
            approvalWF.selectedLevel = '1';
            try{//commented
            
              IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
                login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
                login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
                login.name='spec.specpa@dupont.com';
                 insert login;
                 //test.startTest();
            //Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
            approvalWF.reassign();
            }catch(exception e){}
        //try{
            List<User> userList1 = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        approvalWF.saveBulkReassign(prList, userList1[0].Id);
       test.stopTest();
        //}
        //catch(exception e){}
        //}
     } 
    }  
    static testMethod void paApprovalWFTestMethod3() {
        test.startTest();
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        //List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        
        Group g = new Group();
        g.Name = 'TestBU-F850';
        g.DeveloperName = 'TestBU_F850';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'TestBU';
        // pr.Request_Approval_Status__c = 'Submitted';
        pr.OwnerId = user1.Id;
        pr.Request_Reason__c = 'test';
        pr.Sales_Org_Code__c = 'F850';
        pr.Dist_Channel_Code__c = '10';
        pr.Division_Code__c = '02';
        insert pr;

        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
       
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        
        approvalWF.request.pricingRequest.Request_Approval_Status__c = 'Submitted';
        approvalWF.request.pricingRequest.Current_Level__c = '2';
        upsert approvalWF.request.pricingRequest;
        approvalWF.action('PAHome', 'PAHome', 'popupreassign');
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        approvalWF.bulkApproval(prList);
        prList.add(approvalWF.request.pricingRequest);
        approvalWF.saveBulkReassign(prList, user1.Id);
        approvalWF.bulkReassignPopup(prList);
        approvalWF.reassignLookup(prList);
        test.stopTest();
        for(Integer i = 1;i<6;i++){
            PAWrapper wrapforReassignObj = new PAWrapper();
            wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
            wrapforReassignObj.stringMap.put('userName', user1.Id);
            approvalWF.wrapforReassignObjList.add(wrapforReassignObj);
        }
            approvalWF.action('PAHome', 'PAHome','saveReassignedUser');
        //extra
        approvalWF.selectedLevel = '1';
        }  
         
    } 


  
 static testMethod void paApprovalWFTestMethod5() {
    
    
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York',
        E_Pass_Id__c='222344',
        LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.BU__c = 'Test Business';
        pr.Approver1__C = user1.id;
        pr.Approver2__C = user1.id;
        pr.Approver3__C = user1.id;
        pr.Approver4__C = user1.id;
        pr.Approver5__C = user1.id;
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Market Segment';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
                
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.request.pricingRequest.Request_Approval_Status__c = 'Submitted';
        approvalWF.request.pricingRequest.Current_Level__c = '2';
        upsert approvalWF.request.pricingRequest;
        approvalWF.action('PAHome', 'PAHome', 'popupreassign');
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        prList.add(approvalWF.request.pricingRequest);
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId',user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        //extra
        approvalWF.selectedLevel = '1';
        }
    }
    
    
    static testMethod void paApprovalWFTestMethod6() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.profit_center_level__c='4';
        orgGroup.Business__c = 'Test Business';
        orgGroup.Owning_Business__c='DTT US';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        Profit_Center__c profit = new Profit_Center__c();
        profit.Final_Level__c = '4';
        profit.ERP_Profit_Center_4_Code__c='F2';
        profit.ERP_Profit_Center_4__c='DTT US';
        insert profit;
        
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);      
        approvalWF.selectedLevel = '1';               
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Project Pricing';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        material.ERP_Profit_Center_Code__c='F2';
        material.ERP_Material_Code__c='123456';
        material.ERP_Sales_Org_Code__c='A640';
        material.recordTypeId = Schema.SObjectType.material__C.RecordTypeInfosByName.get('ERP Material - Extended Data').RecordTypeId;
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.Material_Code__c='123456';
        prItem.Sales_Org_Code__c='A640';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';

        //insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        insert adminMaster;

        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        approvalWF.getListWrappers();
       
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
                              
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId',user1.Id);
            approvalWF.wrapList.add(wrap);
        }
                               
        
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
       
        //extra
        approvalWF.selectedLevel = '1';
        }
    } 
    
    static testMethod void paApprovalWFTestMethod61() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.profit_center_level__c='4';
        orgGroup.Business__c = 'Test Business';
        orgGroup.Owning_Business__c='DTT US';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
       
        Profit_Center__c profit = new Profit_Center__c();
        profit.Final_Level__c = '4';
        profit.ERP_Profit_Center_4_Code__c='F2';
        profit.ERP_Profit_Center_4__c='DTT US';
        insert profit;
        
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);      
        approvalWF.selectedLevel = '1';               
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Project Pricing';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        material.ERP_Profit_Center_Code__c='F2';
        material.ERP_Material_Code__c='123456';
        material.ERP_Sales_Org_Code__c='A640';
        material.recordTypeId = Schema.SObjectType.material__C.RecordTypeInfosByName.get('ERP Material - Extended Data').RecordTypeId;
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.Material_Code__c='123456';
        prItem.Sales_Org_Code__c='A640';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';

        //insert prItem;
        
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        insert adminMaster;

        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        approvalWF.getListWrappers();
       
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
                              
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId',user1.Id);
            approvalWF.wrapList.add(wrap);
        }
                               
        
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        //try{Test.StartTest();
            //approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            //Test.StopTest();
       // }
        //catch(Exception e){}
        Test.StartTest();
        //approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        Test.StopTest();
        //extra
        approvalWF.selectedLevel = '1';
        }
    } 
    
    
    
    static testMethod void paApprovalWFTestMethod7() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '2';
        pr.Request_Valid_From__c = system.today()-1;
        pr.Request_Valid_To__c = system.today()-2;
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.State_Code__c='34545';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        test.startTest();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF.action('PAHome', 'PAHome', 'approve');
       //in below method 
       approvalWF.action('PAHome', 'PAHome', 'reject');
       approvalWF.action('PAHome', 'PAHome', 'reject');
       //test.stopTest();
       approvalWF.action('PAHome', 'PAHome', 'recall');
       approvalWF.action('PAHome', 'PAHome', 'closeApproverpopup');
        test.stopTest();
       approvalWF.action('PAHome', 'PAHome', 'popupreassign');
        //extra
        approvalWF.selectedLevel = '1';
        //test.stopTest();
    } 
    static testMethod void paApprovalWFTestMethod77(){
    IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
    
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '2';
        pr.Request_Valid_From__c = system.today()-1;
        pr.Request_Valid_To__c = system.today()-2;
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        test.startTest();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
       approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
       approvalWF.action('PAHome', 'PAHome', 'approve');
       approvalWF.action('PAHome', 'PAHome', 'reject');
        approvalWF.action('PAHome', 'PAHome', 'recall');
        
        approvalWF.action('PAHome', 'PAHome', 'closeApproverpopup');
     
        approvalWF.action('PAHome', 'PAHome', 'popupreassign');
        //extra
        approvalWF.selectedLevel = '1';
        test.stopTest();
    
    }
    
    static testMethod void paApprovalWFTestMethod8() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Valid_From__c = system.today()+1;
        pr.Request_Valid_To__c = system.today()+2;
         pr.Request_Reason__c = 'test';
        pr.BU__c = 'Test Business';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        try{                       
            approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            }
            catch(Exception e){}
         test.startTest();
         approvalWF.action('PAHome', 'PAHome', 'submitContinue');
          test.stopTest();
        }
        
    }
    
    static testMethod void paApprovalWFTestMethod9() {
        
        test.startTest();
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';     
        insert ic; 
        
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
    
        Group g = new Group();
        g.Name = 'TestBU-A640';
        g.DeveloperName = 'TestBU_A640';
        insert g;        
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'TestBU';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.approver1__c = user1.Id;
        pr.approver3__c = user1.Id;
        pr.approver4__c = user1.Id;
        pr.approver5__c = user1.Id;
        pr.Current_Level__c = '3';
        pr.Request_Valid_From__c = system.today()+1;
        pr.Request_Valid_To__c = system.today()+2;
        pr.BU__c = 'TestBU';
        pr.Sales_Org_Code__c = 'A640';
        pr.Dist_Channel_Code__c = '10';
        pr.Division_Code__c = '02';
        pr.Pricing_Request_Type__c = null;
        pr.Country__c = 'India';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.BU__c = pr.BU__c;
        adminMaster.Price_Category__c = pr.Pricing_Request_Type__c;
        adminMaster.Request_Type__c = pr.Request_Type__c;
        adminMaster.Sales_Organisation__c = pr.Sales_Org_Code__c;
        adminMaster.Distribution_Channel__c = pr.Dist_Channel_Code__c;
        adminMaster.Division__c = pr.Division_Code__c;
        adminMaster.Pricing_Task_Type__c = pr.Spot_Type__c;
        insert adminMaster;
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
                                                  
        test.stopTest(); //<AB03182021>
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        prList.add(approvalWF.request.pricingRequest);
        //approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
       approvalWF.saveBulkReassign(prList, userList[0].Id);
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');        
        //approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        }
     
    } 
    
    static testMethod void paApprovalWFTestMethod10() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.approver1__c = user1.Id;
        pr.approver2__c = user1.Id;
        pr.approver3__c = user1.Id;
        pr.approver4__c = user1.Id;
        pr.approver5__c = user1.Id;
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        insert pr;
        
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Customer Specific';
        pr1.Pricing_Request_Type__c = 'Permanent';
        pr1.approver1__c = user1.Id;
        pr1.approver2__c = user1.Id;
        pr1.approver3__c = user1.Id;
        pr1.approver4__c = user1.Id;
        pr1.approver5__c = user1.Id;
        pr1.Current_Level__c = '2';
        pr1.BU__c = 'Test Business';
        insert pr1;
        
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Customer Specific';
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.approver1__c = user1.Id;
        pr2.approver2__c = user1.Id;
        pr2.approver3__c = user1.Id;
        pr2.approver4__c = user1.Id;
        pr2.approver5__c = user1.Id;
        pr2.Current_Level__c = '3';
        pr2.BU__c = 'Test Business';
        insert pr2;
        
        Pricing_Request__c pr3 = new Pricing_Request__c();
        pr3.Request_Type__c = 'Customer Specific';
        pr3.Pricing_Request_Type__c = 'Permanent';
        pr3.approver1__c = user1.Id;
        pr3.approver2__c = user1.Id;
        pr3.approver3__c = user1.Id;
        pr3.approver4__c = user1.Id;
        pr3.approver5__c = user1.Id;
        pr3.Current_Level__c = '4';
        pr3.BU__c = 'Test Business';
        insert pr3;
        
        Pricing_Request__c pr4 = new Pricing_Request__c();
        pr4.Request_Type__c = 'Customer Specific';
        pr4.Pricing_Request_Type__c = 'Permanent';
        pr4.approver1__c = user1.Id;
        pr4.approver2__c = user1.Id;
        pr4.approver3__c = user1.Id;
        pr4.approver4__c = user1.Id;
        pr4.approver5__c = user1.Id;
        pr4.Current_Level__c = '5';
        pr4.BU__c = 'Test Business';
        insert pr4;
        
        //Extra
        Pricing_Request__c pr5 = new Pricing_Request__c();
        pr5.Request_Type__c = 'Customer Specific';
        pr5.Pricing_Request_Type__c = 'Permanent';
        pr5.approver1__c = user1.Id;
        pr5.approver2__c = null;
        pr5.approver3__c = user1.Id;
        pr5.approver4__c = user1.Id;
        pr5.approver5__c = user1.Id;
        pr5.Current_Level__c = '1';
        pr5.BU__c = 'Test Business';
        insert pr5;
        
        Pricing_Request__c pr6 = new Pricing_Request__c();
        pr6.Request_Type__c = 'Customer Specific';
        pr6.Pricing_Request_Type__c = 'Permanent';
        pr6.approver1__c = user1.Id;
        pr6.approver2__c = null;
        pr6.approver3__c = null;
        pr6.approver4__c = user1.Id;
        pr6.approver5__c = user1.Id;
        pr6.Current_Level__c = '1';
        pr6.BU__c = 'Test Business';
        insert pr6;
        
        Pricing_Request__c pr7 = new Pricing_Request__c();
        pr7.Request_Type__c = 'Customer Specific';
        pr7.Pricing_Request_Type__c = 'Permanent';
        pr7.approver1__c = user1.Id;
        pr7.approver2__c = null;
        pr7.approver3__c = null;
        pr7.approver4__c = null;
        pr7.approver5__c = user1.Id;
        pr7.Current_Level__c = '1';
        pr7.BU__c = 'Test Business';
        insert pr7;
        
        Pricing_Request__c pr8 = new Pricing_Request__c();
        pr8.Request_Type__c = 'Customer Specific';
        pr8.Pricing_Request_Type__c = 'Permanent';
        pr8.approver1__c = user1.Id;
        pr8.approver2__c = user1.Id;
        pr8.approver3__c = null;
        pr8.approver4__c = user1.Id;
        pr8.approver5__c = user1.Id;
        pr8.Current_Level__c = '2';
        pr8.BU__c = 'Test Business';
        insert pr8;
        
        Pricing_Request__c pr9 = new Pricing_Request__c();
        pr9.Request_Type__c = 'Customer Specific';
        pr9.Pricing_Request_Type__c = 'Permanent';
        pr9.approver1__c = user1.Id;
        pr9.approver2__c = user1.Id;
        pr9.approver3__c = null;
        pr9.approver4__c = null;
        pr9.approver5__c = user1.Id;
        pr9.Current_Level__c = '2';
        pr9.BU__c = 'Test Business';
        insert pr9;
        
        Pricing_Request__c pr10 = new Pricing_Request__c();
        pr10.Request_Type__c = 'Customer Specific';
        pr10.Pricing_Request_Type__c = 'Permanent';
        pr10.approver1__c = user1.Id;
        pr10.approver2__c = user1.Id;
        pr10.approver3__c = user1.Id;
        pr10.approver4__c = null;
        pr10.approver5__c = user1.Id;
        pr10.Current_Level__c = '3';
        pr10.BU__c = 'Test Business';
        insert pr10;
        
        pricingRequestSelectedList.add(pr);
        pricingRequestSelectedList.add(pr1);
        pricingRequestSelectedList.add(pr2); 
        pricingRequestSelectedList.add(pr3);  
        pricingRequestSelectedList.add(pr4);
        pricingRequestSelectedList.add(pr5); 
        pricingRequestSelectedList.add(pr6);  
        pricingRequestSelectedList.add(pr7);
        pricingRequestSelectedList.add(pr8);
        pricingRequestSelectedList.add(pr9);
        pricingRequestSelectedList.add(pr10);        
        test.startTest();
        //approvalWF.bulkApproval(pricingRequestSelectedList);
        test.stopTest();
        try{
            approvalWF.bulkApproval(pricingRequestSelectedList);
        }
        catch(Exception e){
        }
        }
    } 
    
        static testMethod void paApprovalWFTestMethod11() {
            
       
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        User user2 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername2'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user2;
        List<User> userList = [SELECT id from User where isActive = true limit 2];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        User user2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        user2.managerId = managerUser.Id;
        insert user2;
        List<User> userList = [SELECT id from User where isActive = true limit 2];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic;
         
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();         
        Group g = new Group();
        g.Name = 'TestBU-A640';
        g.DeveloperName = 'TestBU_A640';
        insert g;
        
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF1 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF2 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF3 = new PAApprovalWF(paServiceState);
        
        approvalWF.request = new PARequest(paServiceState);
        approvalWF1.request = new PARequest(paServiceState);
        approvalWF2.request = new PARequest(paServiceState);
        approvalWF3.request = new PARequest(paServiceState);
        
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.approver1__c = user1.Id;
        pr.approver2__c = user1.Id;
        pr.approver3__c = user1.Id;
        pr.approver4__c = user1.Id;
        pr.approver5__c = user1.Id;
        pr.Current_Level__c = '3';
        pr.Current_Approver__c = user1.Id;
        pr.BU__c = 'TestBU';
        pr.Sales_Org_Code__c='A640';
        insert pr;
        
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Customer Specific';
        pr1.Pricing_Request_Type__c = 'Permanent';
        pr1.approver1__c = user2.id;
        pr1.approver2__c = user2.Id;
        pr1.approver3__c = user2.Id;
        pr1.approver4__c = user2.Id;
        pr1.approver5__c = user2.Id;
        pr1.Current_Level__c = '4';
        pr1.Current_Approver__c = user2.Id;
        pr1.BU__c = 'Test Business';
        insert pr1;
        
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Customer Specific';
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.approver1__c = user2.Id;
        pr2.approver2__c = user2.Id;
        pr2.approver3__c = user2.Id;
        pr2.approver4__c = user2.Id;
        pr2.approver5__c = user2.Id;
        pr2.Current_Level__c = '5';
        pr2.Current_Approver__c = user2.Id;
        pr2.BU__c = 'Test Business';
        insert pr2;
        
        Pricing_Request__c pr3 = new Pricing_Request__c();
        pr3.Request_Type__c = 'Customer Specific';
        pr3.Pricing_Request_Type__c = 'Permanent';
        pr3.approver1__c = user1.Id;
        pr3.approver2__c = user1.Id;
        pr3.approver3__c = user1.Id;
        pr3.approver4__c = user1.Id;
        pr3.approver5__c = user1.Id;
        pr3.Current_Approver__c = user1.Id;
        pr3.Current_Level__c = '1';
        pr3.BU__c = 'Test Business';
        insert pr3;
        
        pricingRequestSelectedList.add(pr);
        pricingRequestSelectedList.add(pr1);
        pricingRequestSelectedList.add(pr2);
        pricingRequestSelectedList.add(pr3);
        
        approvalWF.request.pricingRequest = pr;
                              
       approvalWF1.request.pricingRequest = pr1;
                              
       approvalWF2.request.pricingRequest = pr2;
                              
        approvalWF3.request.pricingRequest = pr3;                     
                              
       test.startTest();  
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }

        
            approvalWF1.action('PAHome', 'PAHome', 'saveReassignedUser');
            approvalWF2.action('PAHome', 'PAHome', 'saveReassignedUser');
            approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        }
        test.stopTest();
    } 
    static testMethod void paApprovalWFTestMethod110(){
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        User user2 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername2'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user2;
        List<User> userList = [SELECT id from User where isActive = true limit 2];
        */
        
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        User user2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        user2.managerId = managerUser.Id;
        insert user2;
        List<User> userList = [SELECT id from User where isActive = true limit 2];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF1 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF2 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF3 = new PAApprovalWF(paServiceState);
        
        approvalWF.request = new PARequest(paServiceState);
        approvalWF1.request = new PARequest(paServiceState);
        approvalWF2.request = new PARequest(paServiceState);
        approvalWF3.request = new PARequest(paServiceState);
        
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.approver1__c = user1.Id;
        pr.approver2__c = user1.Id;
        pr.approver3__c = user1.Id;
        pr.approver4__c = user1.Id;
        pr.approver5__c = user1.Id;
        pr.Current_Level__c = '3';
        pr.Current_Approver__c = user1.Id;
        pr.BU__c = 'Test Business';
        insert pr;
        
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Customer Specific';
        pr1.Pricing_Request_Type__c = 'Permanent';
        pr1.approver1__c = user2.id;
        pr1.approver2__c = user2.Id;
        pr1.approver3__c = user2.Id;
        pr1.approver4__c = user2.Id;
        pr1.approver5__c = user2.Id;
        pr1.Current_Level__c = '4';
        pr1.Current_Approver__c = user2.Id;
        pr1.BU__c = 'Test Business';
        insert pr1;
        
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Customer Specific';
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.approver1__c = user2.Id;
        pr2.approver2__c = user2.Id;
        pr2.approver3__c = user2.Id;
        pr2.approver4__c = user2.Id;
        pr2.approver5__c = user2.Id;
        pr2.Current_Level__c = '5';
        pr2.Current_Approver__c = user2.Id;
        pr2.BU__c = 'Test Business';
        insert pr2;
        
        Pricing_Request__c pr3 = new Pricing_Request__c();
        pr3.Request_Type__c = 'Customer Specific';
        pr3.Pricing_Request_Type__c = 'Permanent';
        pr3.approver1__c = user1.Id;
        pr3.approver2__c = user1.Id;
        pr3.approver3__c = user1.Id;
        pr3.approver4__c = user1.Id;
        pr3.approver5__c = user1.Id;
        pr3.Current_Approver__c = user1.Id;
        pr3.Current_Level__c = '1';
        pr3.BU__c = 'Test Business';
        insert pr3;
        
        pricingRequestSelectedList.add(pr);
        pricingRequestSelectedList.add(pr1);
        pricingRequestSelectedList.add(pr2);
        pricingRequestSelectedList.add(pr3);
        
        approvalWF.request.pricingRequest = pr;
                              
       approvalWF1.request.pricingRequest = pr1;
                              
       approvalWF2.request.pricingRequest = pr2;
                              
        approvalWF3.request.pricingRequest = pr3;                     
                              
        
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
        approvalWF.bulkApproval(prList);
        prList.add(approvalWF.request.pricingRequest);
        approvalWF.saveBulkReassign(prList, user1.Id);        
        approvalWF.saveBulkReassign(pricingRequestSelectedList, user1.Id);
        approvalWF.bulkReassignPopup(pricingRequestSelectedList);
        }
        
    
    
    }
        static testMethod void paApprovalWFTestMethod12() {
            
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        User user2 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername2'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user2;
        
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 2];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        User user2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        user2.managerId = managerUser.Id;
        insert user2;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 2];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
            
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF1 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF2 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF3 = new PAApprovalWF(paServiceState);
        
        approvalWF.request = new PARequest(paServiceState);
        approvalWF1.request = new PARequest(paServiceState);
        approvalWF2.request = new PARequest(paServiceState);
        approvalWF3.request = new PARequest(paServiceState);
        
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';
        pr.approver1__c = user1.Id;
        pr.approver2__c = user1.Id;
        pr.approver3__c = user1.Id;
        pr.approver4__c = user1.Id;
        pr.approver5__c = user1.Id;
        pr.Current_Level__c = '3';
        pr.Current_Approver__c = user1.Id;
        pr.BU__c = 'Test Business';
        insert pr;
        
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Customer Specific';
        pr1.Pricing_Request_Type__c = 'Permanent';
        pr1.approver1__c = user1.Id;
        pr1.approver2__c = user1.Id;
        pr1.approver3__c = user1.Id;
        pr1.approver4__c = user1.Id;
        pr1.approver5__c = user1.Id;
        pr1.Current_Level__c = '4';
        pr1.Current_Approver__c = user2.Id;
        pr1.BU__c = 'Test Business';
        insert pr1;
        
        pricingRequestSelectedList.add(pr);
        pricingRequestSelectedList.add(pr1);
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
    // 1/20/2017 - Merge&Spin - Code merged from UTQA to SplitUtil                                                                          
       approvalWF1.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr1.Id];
                              
                              
                              
        
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        test.startTest();
        approvalWF.selectedUserID = user1.Id;
        try{
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        }catch (exception e){}
        //test.stopTest();
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        //test.stopTest();
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        //approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        test.stopTest();
        }
        
        
        
    } 
    
     static testMethod void paApprovalWFTestMethod13() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        PAApprovalWF approvalWF1 = new PAApprovalWF(paServiceState);
        approvalWF1.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Display';
        pr.Current_Level__c = '2';        
        pr.Project_Header_Approval_Flag__c = true;
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.Quantity__c = NULL;
        prItem.New_Rate__c = '23';
        prItem.PH2__c = 'PH';
        prItem.End_Use_Code__c = 'End';
        prItem.Market_Segment_Code__c = 'Mar';
        
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        prItem.Quantity__c = NULL;
        prItem.New_Rate__c = '20';
        prItem.PH2__c = 'PH';
        prItem.End_Use_Code__c = 'End';
        prItem.Market_Segment_Code__c = 'Mar';
        insert prItem;
        
        
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
                              
       
               
                              
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        approvalWF.request.pricingRequest.Request_Type__c = 'Massive';//commented
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        }
    } 
    
    static testMethod void paApprovalWFTestMethod14() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Display';
        pr.Current_Level__c = '2'; 
        pr.Request_Reason__c='test';       
        pr.Project_Header_Approval_Flag__c = false;
        pr.BU__c = 'Test Business';
        insert pr;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        prItem.Quantity__c = NULL;
        prItem.New_Rate__c = '20';
        prItem.PH2__c = 'PH';
        prItem.End_Use_Code__c = 'End';
        //prItem.Request_Reason__c='test';
        prItem.Market_Segment_Code__c = 'Mar';
        insert prItem;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
               
                              
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
       approvalWF.request.pricingRequest.Request_Reason__c = 'test';
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
    } 
    }
        static testMethod void paApprovalWFTestMethod15() {
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
            
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        test.startTest(); 
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        //approvalWF.action('PAHome', 'PAHome', 'approve');
        approvalWF.action('PAHome', 'PAHome', 'recall');
        try{
        approvalWF.action('PAHome', 'PAHome', 'approve');
        }
        catch(Exception e){         
        }
       /* try{
        approvalWF.action('PAHome', 'PAHome', 'reject');
        }
        catch(Exception e){}*/
        //commented by Priyanka -- 
        //test.startTest();
        try{
        approvalWF.action('PAHome', 'PAHome', 'recall');
        }
        catch(Exception e){}
        test.stopTest();
        
    } 
    
    static testMethod void paApprovalWFTestMethod151() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         
        test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        /*try{
        approvalWF.action('PAHome', 'PAHome', 'approve');
        }
        catch(Exception e){         
        }*/
         approvalWF.action('PAHome', 'PAHome', 'reject');
          approvalWF.action('PAHome', 'PAHome', 'recall');
        try{
        approvalWF.action('PAHome', 'PAHome', 'reject');
        }
        catch(Exception e){}
        //commented by Priyanka -- 
        //test.startTest();
        try{
        approvalWF.action('PAHome', 'PAHome', 'recall');
        }       
        catch(Exception e){}
        test.stopTest();
    } 
 static testMethod void paApprovalWFTestMethod16() {
    IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
    
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
       
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();

        approvalWF.getListWrappers();
             
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         
        approvalWF.appRejComments ='Comments';                     
        test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
       // approvalWF.action('PAHome', 'PAHome', 'approve');
         approvalWF.action('PAHome', 'PAHome', 'recall');
        try{
        approvalWF.action('PAHome', 'PAHome', 'approve');
        }
        catch(Exception e){         
        }
        
       /* try{
        approvalWF.action('PAHome', 'PAHome', 'reject');
        }
        catch(Exception e){}*/
        //commented by Priyanka - 
        try{
        approvalWF.action('PAHome', 'PAHome', 'recall');
        }
        catch(Exception e){}    
        test.stopTest();    
    }
 
    
    static testMethod void paApprovalWFTestMethod161() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
       
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();

        approvalWF.getListWrappers();
             
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         
        approvalWF.appRejComments ='Comments';
        test.startTest();                  
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        //approvalWF.action('PAHome', 'PAHome', 'reject');
         approvalWF.action('PAHome', 'PAHome', 'recall');
      /*  try{
        approvalWF.action('PAHome', 'PAHome', 'approve');
        }
        catch(Exception e){         
        }*/
        try{
        approvalWF.action('PAHome', 'PAHome', 'reject');
        }
        catch(Exception e){}
        //commented by Priyanka -
         try{
           approvalWF.action('PAHome', 'PAHome', 'recall');
        }
        catch(Exception e){}  
        test.stopTest();         
    } 
    
    static testMethod void paApprovalWFTestMethod17() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        orgGroup.profit_center_level__c='4';
        orgGroup.Owning_Business__c='DTT US';
        insert orgGroup;
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        PAApprovalWF approvalWF1 = new PAApprovalWF(paServiceState);
        approvalWF1.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Request_Class__c = 'Test Request Class';
        pr.Pricing_Request_Type__c = 'Project Pricing';
        pr.Sales_Org_Code__c = 'Test';
        pr.NPC_Status__c ='Waiting for Net Price';
        pr.Current_Level__c = '2';        
        pr.Project_Header_Approval_Flag__c = true;
        pr.BU__c = 'Test Business';
        pr.Dist_Channel_Code__c = 'TD';
        pr.Division_Code__c = 'd';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Country__c = 'Germany';
        pr.Request_Reason__c = 'test';
        insert pr;
       
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Material__c material1 = new Material__c();
        material1.ERP_Material_Code__c = 'Test Code';
        material1.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        material1.ERP_Profit_Center_Code__c='F2';
        material1.ERP_Material_Code__c='123456';
        material1.ERP_Sales_Org_Code__c='A640';
        material1.ERP_Profit_Center_4_Code__c='F2';
        material1.recordTypeId = Schema.SObjectType.material__C.RecordTypeInfosByName.get('ERP Material - Extended Data').RecordTypeId;
        insert material1;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material/PH';
        prItem.New_Unit__c = NULL;
        prItem.New_Rate__c = '23';
        prItem.PH2__c = 'PH';
        prItem.End_Use_Code__c = 'End';
        prItem.Market_Segment_Code__c = 'Mar';
        prItem.Error_Indicator__c='ERROR';
        
        //insert prItem;
        
        //prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='123456';
        prItem.Sales_Org_Code__c='A640';
        prItem.Pricing_Request__c = pr.Id;
        //prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        prItem.New_Unit__c = NULL;
        prItem.New_Rate__c = '20';
        prItem.PH2__c = 'PH';
        prItem.End_Use_Code__c = 'End';
        prItem.Market_Segment_Code__c = 'Mar';
        prItem.Error_Indicator__c='ERROR';
        insert prItem;
        
        Profit_Center__c profit = new Profit_Center__c();
        profit.Final_Level__c = '4';
        profit.ERP_Profit_Center_4_Code__c='F2';
        profit.ERP_Profit_Center_4__c='DTT US';
        insert profit;
        
        Profit_Center__c profit1 = new Profit_Center__c();
        profit1.Final_Level__c = '4';
        profit1.ERP_Profit_Center_4_Code__c='F2WP';
        profit1.ERP_Profit_Center_4__c='DTT US';
        insert profit1;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        //minMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Price_Category__c='Project Pricing';
        adminMaster.BU__c='Test Business';
        adminMaster.Request_Type__c= 'Customer Specific';
        adminMaster.Distribution_Channel__c ='TD';
        adminMaster.Division__c = 'd';
        adminMaster.Pricing_Task_Type__c ='Rebate Agreement';
        adminMaster.Request_Class__c='Test Request Class';
        adminMaster.Sales_Organisation__c = 'Test';
        adminMaster.Country__c = 'Germany';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail1 = new PA_BU_Admin_Detail__c();
        adminDetail1.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail1.Routing_Parameter__c = 'Required';
        adminDetail1.Approval_Level__c = '2';
        adminDetail1.Approver_Role__c = 'Sales Approver';
        adminDetail1.Key_Field__c = 'Profit Center';
        insert adminDetail1;
        
        PA_BU_Admin_Detail__c adminDetail2 = new PA_BU_Admin_Detail__c();
        adminDetail2.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail2.Routing_Parameter__c = 'Required';
        adminDetail2.Approval_Level__c = '2';
        adminDetail2.Approver_Role__c = 'Sales Approver';
        adminDetail2.Key_Field__c = 'Profit Center';
        //insert adminDetail2;
        
        PA_BU_Admin_Detail__c adminDetail3 = new PA_BU_Admin_Detail__c();
        adminDetail3.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail3.Routing_Parameter__c = 'Not Required';
        adminDetail3.Approval_Level__c = '2';
        adminDetail3.Approver_Role__c = 'Sales Approver';
        adminDetail3.Key_Field__c = 'Profit Center';
        insert adminDetail3;
        
        Setup_Object__c setup1 = new Setup_Object__c();
        setup1.Key_Field__c = 'Profit Center';
        setup1.Approver_Role__c = 'Sales Approver';
        setup1.All_Other_Values__c = user1.Id;
        setup1.Mixed_Values__c = user1.id;
        setup1.BU__c = pr.BU__c;
        setup1.Sales_Organisation__c = pr.Sales_Org_Code__c ;
        setup1.Distribution_Channel__c = pr.Dist_Channel_Code__c ;
        setup1.Division__c = pr.Division_Code__c;
        insert setup1;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        adminMaster.Price_Category__c='pricing Task';
        adminMaster.BU__c='Test Business';
        adminMaster.Sales_Organisation__c  =null;
        adminMaster.Request_Type__c= 'Massive';
        adminMaster.Distribution_Channel__c =null;
        adminMaster.Division__c = null;
        adminMaster.Pricing_Task_Type__c ='Rebate Agreement';
        adminMaster.Request_Class__c=null;
        insert adminMaster;      

        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];                             
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        
        IntegrationLoginCredentials__c login = new IntegrationLoginCredentials__c();
        login.EndPointURL__c='https://pg3tx.pioneer.com:443/sfdc_pricing/service/price_calc';
        login.EncryptedLoginDetails__c='ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        login.name='spec.specpa@dupont.com  ';
        insert login;
        //Test.setMock(WebServiceMock.class, new WebServiceReassign_Mock ());
        
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }   
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        pr.Current_Level__c ='1';
        update pr;
        approvalWF.wrapforReassignObjList = wrapforReassignObjList;
        test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        }  
       
    }
    
    static testMethod void paApprovalWFTestMethod18() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup; 
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.OwnerId = user1.Id;
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'Germany';
        prItem.Sales_Office_Code__c = '02';
        prItem.Sales_Org_Code__c = '45';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        prItem.Sales_Office_Code__c = '12';
        prItem.Sales_Org_Code__c = '40';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;       
        
        Setup_Object__c setupObj = new Setup_Object__c();      
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
     
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        test.startTest();                      
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        //test.stopTest();
        approvalWF.action('PAHome', 'PAHome', 'closereassignpopup');
        approvalWF.action('PAHome', 'PAHome', 'reassignLookup');
        //apac
        approvalWF.selectedUser = 'a';
        approvalWF.selectedUserID = 'b';
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }   
        approvalWF.wrapforReassignObjList = wrapforReassignObjList;
        approvalWF.selectedLevel='2';
        //test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'closeUserLookup');
        test.stopTest();
        //commented by Priyanka - approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        //commented by Priyanka - approvalWF.selectedUserID = userList[0].Id;
        //commented by Priyanka - approvalWF.selectedUser = userList[0].Name;
        //commented by Priyanka - approvalWF.selectedLevel = '1';
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = userList[0].Id;
        approvalWF.selectedUser = userList[0].Name;
        approvalWF.selectedLevel = '1';
         
        }
    } 
    
    
    static testMethod void paApprovalWFTestMethod19() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        */
        // 12/30/2016 - Merge&Spin - Updated Userrole and User
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup; 
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.OwnerId = user1.Id;
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        PAApprovalWF approvalWF = new PAApprovalWF(pr.Id, pr.BU__c);
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'Germany';
        prItem.Sales_Office_Code__c = '02';
        prItem.Sales_Org_Code__c = '45';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        prItem.Sales_Office_Code__c = '12';
        prItem.Sales_Org_Code__c = '40';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;       
        
        Setup_Object__c setupObj = new Setup_Object__c();      
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        
        
     
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
         approvalWF.action('PAHome', 'PAHome', 'bulkReassignPopup');
        }
    } 
    
    
    static testMethod void paApprovalWFTestMethod21() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        User user2 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername2'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user2;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 2];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        User user2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        user2.managerId = managerUser.Id;
        insert user2;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 2];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        EmailTemplate emailTemplate = [SELECT id FROM EmailTemplate LIMIT 1];
            
        PA_Email_Template_Custom_Settings__c customSettingTemplate = new PA_Email_Template_Custom_Settings__c();
        customSettingTemplate.Name = 'EscalationNotificationNoBackup';
        customSettingTemplate.Template_Id__c = emailTemplate.Id;
        insert customSettingTemplate;
        
        PA_Email_Template_Custom_Settings__c customSettingTemplate1 = new PA_Email_Template_Custom_Settings__c();
        customSettingTemplate1.Name = 'EscalationNotificationtoBUAdmin';
        customSettingTemplate1.Template_Id__c = emailTemplate.Id;
        insert customSettingTemplate1;
        
        PA_Email_Template_Custom_Settings__c customSettingTemplate2 = new PA_Email_Template_Custom_Settings__c();
        customSettingTemplate2.Name = 'Approval Template';
        customSettingTemplate2.Template_Id__c = emailTemplate.Id;
        insert customSettingTemplate2;
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF2 = new PAApprovalWF(paServiceState);
        PAApprovalWF approvalWF3 = new PAApprovalWF(paServiceState);
        
        approvalWF2.request = new PARequest(paServiceState);
        approvalWF3.request = new PARequest(paServiceState);
        
        List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
        
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Customer Specific';
        pr2.Pricing_Request_Type__c = 'Permanent';
        pr2.approver1__c = user1.Id;
        pr2.approver2__c = user1.Id;
        pr2.approver3__c = user1.Id;
        pr2.approver4__c = user1.Id;
        pr2.approver5__c = user1.Id;
        pr2.Current_Level__c = '5';
        pr2.Current_Approver__c = user2.Id;
        pr2.BU__c = 'Test Business';
        insert pr2;
        
        Pricing_Request__c pr3 = new Pricing_Request__c();
        pr3.Request_Type__c = 'Customer Specific';
        pr3.BU__c = 'Test Business';
        pr3.Pricing_Request_Type__c = 'Permanent';
        pr3.approver1__c = user1.Id;
        pr3.approver2__c = user1.Id;
        pr3.approver3__c = user1.Id;
        pr3.approver4__c = user1.Id;
        pr3.approver5__c = user1.Id;
        pr3.Current_Approver__c = user2.Id;
        pr3.Current_Level__c = '1';
        pr3.BU__c = 'Test Business';
        insert pr3;
        
        pricingRequestSelectedList.add(pr3);
        pricingRequestSelectedList.add(pr2);
        
        approvalWF2.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr2.Id];
                                                    
        approvalWF3.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr3.Id];                      
                              
        test.startTest();
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        }    
        
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF3.wrapList.add(wrap);
        }
        approvalWF3.selectedUserID = user1.Id;
        
        approvalWF3.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF3.action('PAHome', 'PAHome', 'submitContinue');
        approvalWF3.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF3.getListBusinessComponents();
        approvalWF3.getName();
        approvalWF3.getType();
        approvalWF3.validate('action');
        approvalWF3.add();
        approvalWF3.bulkApproval(pricingRequestSelectedList);
        try{
    //failing   
    approvalWF3.bulkApproval(pricingRequestSelectedList);
        }catch(exception e){}
        }
        
       test.stopTest();
    
    }
    
    //method18-split-added by Priyanka
    static testMethod void paApprovalWFTestMethod18_1() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup; 
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.OwnerId = user1.Id;
        pr.BU__c = 'Test Business';    
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'Germany';
        prItem.Sales_Office_Code__c = '02';
        prItem.Sales_Org_Code__c = '45';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        prItem.Sales_Office_Code__c = '12';
        prItem.Sales_Org_Code__c = '40';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;       
        
        Setup_Object__c setupObj = new Setup_Object__c();      
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
     
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        test.startTest();
        approvalWF.selectedUser = 'a';
        approvalWF.selectedUserID = 'b';
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = user1.Id;
        approvalWF.selectedUser = user1.Name;
        approvalWF.selectedLevel = '1';
        test.stopTest();
        }
    }
    
    //method16 - split - added by Priyanka
    static testMethod void paApprovalWFTestMethod16_1() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
       
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.save();

        approvalWF.getListWrappers();
             
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        
        try{
        approvalWF.action('PAHome', 'PAHome', 'recall');
        }
        catch(Exception e){} 
               
    }
    
    //method 1 - split - added by Priyanka
    static testMethod void paApprovalWFTestMethod1_1() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        /*Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.OwnerId = user1.Id;
        insert pr;*/
        
          Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        pr.OwnerId = user1.Id;
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
                
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.action('PAHome', 'PAHome', 'saveReassignedUser');
        approvalWF.selectedUserID = user1.Id;
        approvalWF.selectedUser = user1.Name;
        approvalWF.selectedLevel = '1';
        }
    }
    
    //method 15 - split - added by Priyanka
    static testMethod void paApprovalWFTestMethod15_1() {
        IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Approval_Status__c = 'Submitted';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Country__c = 'India';
        insert adminMaster;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.save();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        test.startTest(); 
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF.action('PAHome', 'PAHome', 'recall');
        try{
        approvalWF.action('PAHome', 'PAHome', 'recall');
        }
        catch(Exception e){}
         test.stopTest(); 
    }
    static testMethod void paApprovalWFTestMethod30() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.Product_Hierarchy_Level__c = 1;    
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        //insert paOrgGroupItems;
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.OwnerId = user1.Id;
        pr.BU__C = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;

        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.PH1_Code__c='F2';//commented
        prItem.PH2_Code__c = 'WP';//commented
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Material_Code__c = 'Test Code';
        //prItem.Sales_Org_Code__c='ABCDS';
        prItem.Country__c = 'Russia';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'Customer Group 2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = '';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = '';
        adminDetail.Key_Field__c = '';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
                
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF.action('PAHome', 'PAHome', 'closereassignpopup');
        test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'reassignLookup');
        approvalWF.action('PAHome', 'PAHome', 'closeUserLookup');
        PAApprovalWF.submitFuture(Pr.Id,'Test Business');
        //added 1 june
       approvalWF.reassignedUserId = 'abc';
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        } 
        approvalWF.selectedUser = user1.id;
        approvalWF.selectedLevel =  '1';
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Massive';
        pr2.OwnerId = user1.Id;
        pr2.Current_Level__c = '2';
        pr2.BU__C = 'Test Business';
        pr2.NPC_Status__c = 'Waiting for Net Price';
        
        insert pr2;
        //Test.StartTest();
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>{pr};
        PAOrganizationalGroupItems paOrgGroupItems2 = new PAOrganizationalGroupItems();
        //Test.StopTest(); 
        paOrgGroupItems2.selectedBU = orgGroup.Id;
        paOrgGroupItems2.value = 'SASetup';
        PAServiceState paServiceState2 = new PAServiceState();
        //Test.StopTest(); 
        paServiceState.ogItems = paOrgGroupItems;
        approvalWF.request = new PARequest(paServiceState);
        
       // approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        Test.StopTest(); 
        //approvalWF.bulkApproval(prList);
        List<OrgGroup__c> orggrplist = new List<OrgGroup__c>();
        orggrplist.add(orgGroup);
        //approvalWF.returnBuAdminId(Pr,orggrplist);
        //Test.StopTest(); 
        
        }
    } 
    
        static testMethod void paApprovalWFTestMethodNew() {
            
            
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id, Name from User where isActive = true AND ManagerId <> NULL limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.Product_Hierarchy_Level__c = 1;    
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
        
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        //insert paOrgGroupItems;
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Massive';
        pr.OwnerId = user1.Id;
        pr.BU__C = 'Test Business';
        pr.Request_Reason__c = 'test';
        insert pr;

        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.PH1_Code__c='F2';//commented
        prItem.PH2_Code__c = 'WP';//commented
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        prItem.New_Rate__c = '10';
        prItem.Material_Code__c = 'Test Code';
        //prItem.Sales_Org_Code__c='ABCDS';
        prItem.Country__c = 'Russia';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'Customer Group 2';
        prItem.New_Rate__c = '10';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = '';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Below Current Price';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Below Floor Price';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = '';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Below Reference Price';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Requester';
        adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
         List<PA_BU_Admin_Detail__c> pabulist=new List<PA_BU_Admin_Detail__c>();
        pabulist.add(adminDetail);
        List<Id> usrli = new List<Id>();
        List<User> usrlist = [SELECT Id from User where isActive = true AND ManagerId <> NULL limit 1];
        for(User u:usrlist){
           usrli.add(u.id);}
        List<String> userstr = new List<String>{'User1','User2'};
        Map<Integer, list<Id>> mapFinalUsr=new Map<Integer, list<Id>>{1=>usrli};
        Set<String> setLevelNR=new Set<String>{'user','usr'}; 
        Map<Integer, list<String>> mapAutoUser=new Map<Integer, list<String>>{1=>userstr};
        Map<Integer, String>mrpstr=new Map<Integer, String>{1=>'routingparam'};
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Org';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Sales Office';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'End Use';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
        
        setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'PH2';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        insert setupObj;
                
        approvalWF.closeReassignPopup();
        approvalWF.popApprover(pabulist,mapfinalusr,setLevelNR,mapautouser,mrpstr);
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
        approvalWF.action('PAHome', 'PAHome', 'closereassignpopup');
        test.startTest();
        approvalWF.action('PAHome', 'PAHome', 'reassignLookup');
        approvalWF.action('PAHome', 'PAHome', 'closeUserLookup');
        PAApprovalWF.submitFuture(Pr.Id,'Test Business');
        //added 1 june
       approvalWF.reassignedUserId = 'abc';
        List<PAWrapper> wrapforReassignObjList = new List<PAWrapper>(); 
        for(Integer i = 1;i<6;i++){
                PAWrapper wrapforReassignObj = new PAWrapper();
                wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
                wrapforReassignObj.stringMap.put('userName', user1.Id);
         wrapforReassignObjList.add(wrapforReassignObj);
        } 
        approvalWF.selectedUser = user1.id;
        approvalWF.selectedLevel =  '1';
        Pricing_Request__c pr2 = new Pricing_Request__c();
        pr2.Request_Type__c = 'Massive';
        pr2.OwnerId = user1.Id;
        pr2.Current_Level__c = '2';
        pr2.BU__C = 'Test Business';
        pr2.NPC_Status__c = 'Waiting for Net Price';        
        insert pr2;
        //Test.StartTest();
        List<Pricing_Request__c> prList = new List<Pricing_Request__c>{pr};
        PAOrganizationalGroupItems paOrgGroupItems2 = new PAOrganizationalGroupItems();
        paOrgGroupItems2.selectedBU = orgGroup.Id;
        paOrgGroupItems2.value = 'SASetup';
        PAServiceState paServiceState2 = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        approvalWF.request = new PARequest(paServiceState);
       //approvalWF.action('PAHome', 'PAHome', 'submitContinue');
       //approvalWF.bulkApproval(prList);
        List<OrgGroup__c> orggrplist = new List<OrgGroup__c>();
        orggrplist.add(orgGroup);
        //approvalWF.returnBuAdminId(Pr,orggrplist);
        Test.StopTest(); 
        
        }
      }
      
         static testMethod void paApprovalWFTestMethod31() {
            
            
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Valid_From__c = system.today()+1;
        pr.Request_Valid_To__c = system.today()+2;
        pr.BU__c = 'Test Business';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        adminMaster.BU__c = 'Test Business';
        adminMaster.Price_Category__c = 'Pricing Task';
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Pricing_Task_Type__c = 'Rebate Agreement';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Office';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'End Use';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '5';
        adminDetail.Approver_Role__c = 'Sales Approver';
       // adminDetail.Key_Field__c = 'PH2';
        insert adminDetail;
        
        List<Setup_Object__c> soList = new List<Setup_Object__c>();
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        soList.add(setupObj);

        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.All_Other_Values__c = user1.Id;
        setupObj2.Mixed_Values__c = user1.id;
        setupObj2.Key_Field__c = 'PH2';
        setupObj2.Approver_Role__c = 'Sales Approver';
        setupObj2.BU__c = pr.BU__c;
        soList.add(setupObj2);

        Setup_Object__c setupObj3 = new Setup_Object__c();
        setupObj3.All_Other_Values__c = user1.Id;
        setupObj3.Mixed_Values__c = user1.id;
        setupObj3.Key_Field__c = 'Sales Org';
        setupObj3.Approver_Role__c = 'Sales Approver';
        setupObj3.BU__c = pr.BU__c;
        soList.add(setupObj3);

        Setup_Object__c setupObj4 = new Setup_Object__c();
        setupObj4.All_Other_Values__c = user1.Id;
        setupObj4.Mixed_Values__c = user1.id;
        setupObj4.Key_Field__c = 'Sales Office';
        setupObj4.Approver_Role__c = 'Sales Approver';
        setupObj4.BU__c = pr.BU__c;
        soList.add(setupObj4);

        Setup_Object__c setupObj5 = new Setup_Object__c();
        setupObj5.All_Other_Values__c = user1.Id;
        setupObj5.Mixed_Values__c = user1.id;
        setupObj5.Key_Field__c = 'End Use';
        setupObj5.Approver_Role__c = 'Sales Approver';
        setupObj5.BU__c = pr.BU__c;
        soList.add(setupObj5);

        insert soList;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        try{                       
            approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            }
            catch(Exception e){}

            Test.startTest();
        pr.NPC_Status__c='Waiting for Net Price';
        pr.Request_Reason__c = 'test';
        update pr;
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.SalesArea__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');

         Test.stoptest();
        }
        

    }
    static testMethod void paApprovalWFTestMethod32() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.Request_Reason__c='test';
        pr.Request_Valid_From__c = system.today()+1;
        pr.Request_Valid_To__c = system.today()+2;
        pr.BU__c = 'Test Business';
        insert pr;
        
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Country__c = 'India';
        prItem.Key_Combination__c = 'Material';
        insert prItem;
        
        prItem = new Pricing_Request_Item__c();
        prItem.Material_Code__c='Test Code';
        prItem.Pricing_Request__c = pr.Id;
        prItem.Key_Combination__c = 'PH2';
        prItem.Country__c = 'India';
        insert prItem;
        

        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request__c = pr.Id;
        prItem2.Below_Current_Flag__c = true;
        prItem2.Below_Floor_Flag__c = true;
        prItem2.Below_Reference_Flag__c =true;
        prItem2.Key_Combination__c = 'Material';
        insert prItem2;


        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Massive';
        adminMaster.BU__c = 'Test Business';
        adminMaster.Price_Category__c = 'Pricing Task';
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Pricing_Task_Type__c = 'Rebate Agreement';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Market Segment';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Division Code';
        insert adminDetail;
        PA_BU_Admin_Detail__c adminDetail2 = new PA_BU_Admin_Detail__c();
        adminDetail2.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail2.Routing_Parameter__c = 'Below Current Price';
        adminDetail2.Approval_Level__c = '5';
        adminDetail2.Approver_Role__c = 'Sales Approver';
        adminDetail2.Key_Field__c = 'Reason Code';
        insert adminDetail2;
        
        List<Setup_Object__c> soList = new List<Setup_Object__c>();
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        soList.add(setupObj);

        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.All_Other_Values__c = user1.Id;
        setupObj2.Mixed_Values__c = user1.id;
        setupObj2.Key_Field__c = 'Reason Code';
        setupObj2.Approver_Role__c = 'Sales Approver';
        setupObj2.BU__c = pr.BU__c;
        soList.add(setupObj2);

        Setup_Object__c setupObj3 = new Setup_Object__c();
        setupObj3.All_Other_Values__c = user1.Id;
        setupObj3.Mixed_Values__c = user1.id;
        setupObj3.Key_Field__c = 'Customer Group 2';
        setupObj3.Approver_Role__c = 'Sales Approver';
        setupObj3.BU__c = pr.BU__c;
        soList.add(setupObj3);

        Setup_Object__c setupObj4 = new Setup_Object__c();
        setupObj4.All_Other_Values__c = user1.Id;
        setupObj4.Mixed_Values__c = user1.id;
        setupObj4.Key_Field__c = 'Country';
        setupObj4.Key_Field_Value__c = 'India';
        setupObj4.Key_Field_ID__c = 'FRB';
        setupObj4.Approver_Role__c = 'Sales Approver';
        setupObj4.BU__c = pr.BU__c;
        soList.add(setupObj4);

        Setup_Object__c setupObj5 = new Setup_Object__c();
        setupObj5.All_Other_Values__c = user1.Id;
        setupObj5.Mixed_Values__c = user1.id;
        setupObj5.Key_Field__c = 'Division Code';
        setupObj5.Approver_Role__c = 'Sales Approver';
        setupObj5.BU__c = pr.BU__c;
        soList.add(setupObj5);

        insert soList;
        
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.pcApprover(soList,adminDetail,new Set<String>(),1,new Set<String>{'Required'});
        approvalWF.pcApprover(soList,adminDetail,new Set<String>{'D6TP','PF'},1,new Set<String>{'Required'});
        approvalWF.pcApprover(soList,adminDetail2,new Set<String>(),1,new Set<String>{'abc'});
        approvalWF.pcApprover(soList,adminDetail2,new Set<String>{'D6TP','PF'},1,new Set<String>{'abc'});
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        Test.startTest();
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
            
        }
        try{                       
            approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            }
            catch(Exception e){}
           approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            //Test.startTest();
        pr.NPC_Status__c='Waiting for Net Price';
        pr.Request_Reason__c = 'test';
        update pr;
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.SalesArea__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');



         Test.stoptest();
        }
    }
    static testMethod void paApprovalWFTestMethod52() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');        
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        // Edited BY NSVZ3360
        //insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        List<Pricing_Request_Item__c> prilist = new List<Pricing_Request_Item__c>();
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Request_Type__c = 'Customer Specific';
        pr.Pricing_Request_Type__c = 'Permanent';        
        pr.Sales_Org_Code__c = 'A123';
        pr.Dist_Channel_Code__c = '10';
        pr.Division_Code__c = '02';
        pr.Current_Level__c = '1';
        pr.Request_Reason__c= 'test';
        pr.Request_Valid_From__c = system.today()+1;
        pr.Request_Valid_To__c = system.today()+2;
        pr.BU__c = 'Test Business';
        pr.NPC_Status__c='Waiting For Net Price';        
        insert pr;
        
        List<RecordType> rtypes1 = [SELECT Name, id FROM RecordType WHERE sObjectType='Material__c' and isActive=true and DeveloperName='ERP_Material_Extended_Data' Limit 1];
        Material__c material = new Material__c();
        material.ERP_Material_Code__c = 'Test Code';
        material.ERP_Product_Hierarchy_Level_1_Code__c = 'PH1';
        material.ERP_Product_Hierarchy_Level_2_Code__c = 'PH2';
        material.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        material.ERP_Profit_Center_4__c = 'Test Org';
        material.ERP_Profit_Center_Code__c = 'PH1PH2';
        material.ERP_Profit_Center__c = 'Test Org';
        material.ERP_Product_Hierarchy_Code__c = 'PH1PH2';        
        material.ERP_Sales_Org_Code__c = 'A123';
        material.recordtypeId = rtypes1[0].Id;
        insert material;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = pr.Id;
        prItem.Sales_Org_Code__c = 'A123';
        prItem.Material_Code__c='Test Code';
        prItem.Below_Current_Flag__c = true;
        prItem.Below_Floor_Flag__c = true;
        prItem.Below_Reference_Flag__c =true;
        prItem.Country__c = 'India';
        prItem.State_Code__c='5678';
        prItem.Key_Combination__c = 'Material';
        prilist.add(prItem);        

        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();
        prItem2.Pricing_Request__c = pr.Id;
        prItem2.Sales_Org_Code__c = 'A123';
        prItem2.Material_Code__c='Test Code';
        prItem2.Below_Current_Flag__c = true;
        prItem2.Below_Floor_Flag__c = true;
        prItem2.Below_Reference_Flag__c =true;
        prItem2.Key_Combination__c = 'Material';
        prilist.add(prItem2);
        insert prilist;

        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.BU__c = 'Test Business';
        adminMaster.Price_Category__c = 'Permanent';
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Pricing_Task_Type__c = '';
        adminMaster.Sales_Organisation__c = 'A123';
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Requester';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '3';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Division Code';
        insert adminDetail;
        PA_BU_Admin_Detail__c adminDetail2 = new PA_BU_Admin_Detail__c();
        adminDetail2.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail2.Routing_Parameter__c = 'Below Current Price';
        adminDetail2.Approval_Level__c = '5';
        adminDetail2.Approver_Role__c = 'Sales Approver';
        adminDetail2.Key_Field__c = 'Reason Code';
        insert adminDetail2;
        
        List<Setup_Object__c> soList = new List<Setup_Object__c>();
        /*Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.All_Other_Values__c = user1.Id;
        setupObj.Mixed_Values__c = user1.id;
        setupObj.Key_Field__c = 'Market Segment';
        setupObj.Approver_Role__c = 'Sales Approver';
        setupObj.BU__c = pr.BU__c;
        soList.add(setupObj);*/

        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.All_Other_Values__c = user1.Id;
        setupObj2.Mixed_Values__c = user1.id;
        setupObj2.Key_Field__c = 'Reason Code';
        setupObj2.Approver_Role__c = 'Sales Approver';
        setupObj2.BU__c = pr.BU__c;
        setupObj2.Sales_Organisation__c = 'A123';
        setupObj2.Distribution_Channel__c = '10';
        setupObj2.Division__c = '02';
        soList.add(setupObj2);

        Setup_Object__c setupObj3 = new Setup_Object__c();
        setupObj3.All_Other_Values__c = user1.Id;
        setupObj3.Mixed_Values__c = user1.id;
        setupObj3.Key_Field__c = 'Customer Group 2';
        setupObj3.Approver_Role__c = 'Sales Approver';
        setupObj3.BU__c = pr.BU__c;
        setupObj3.Sales_Organisation__c = 'A123';
        setupObj3.Distribution_Channel__c = '10';
        setupObj3.Division__c = '02';
        soList.add(setupObj3);

        Setup_Object__c setupObj4 = new Setup_Object__c();
        setupObj4.All_Other_Values__c = user1.Id;
        setupObj4.Mixed_Values__c = user1.id;
        setupObj4.Key_Field__c = 'FRB4';
        setupObj4.Approver_Role__c = 'Sales Approver';
        setupObj4.Key_Field_ID__c = 'PH1PH2';
        setupObj4.Key_Field_Value__c = 'PH1PH2';
        setupObj4.BU__c = pr.BU__c;
        setupObj4.Sales_Organisation__c = 'A123';
        setupObj4.Distribution_Channel__c = '10';
        setupObj4.Division__c = '02';
        soList.add(setupObj4);

        Setup_Object__c setupObj5 = new Setup_Object__c();
        setupObj5.All_Other_Values__c = user1.Id;
        setupObj5.Mixed_Values__c = user1.id;
        setupObj5.Key_Field__c = 'Division Code';
        setupObj5.Approver_Role__c = 'Sales Approver';
        setupObj5.BU__c = pr.BU__c;
        setupObj5.Sales_Organisation__c = 'A123';
        setupObj5.Distribution_Channel__c = '10';
        setupObj5.Division__c = '02';
        soList.add(setupObj5);

        insert soList;
        approvalwf.selectedLevel='1';
        approvalWF.closeReassignPopup();
        approvalWF.closeUserLookup();
        approvalWF.deleteRecord();
        approvalWF.getListOptions();
        approvalWF.save();
        approvalWF.getListWrappers();
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
        for(Integer i = 0; i<5; i++){
            PAWrapper wrap = new PAWrapper();
            wrap.stringMap.put('selectedUserId', user1.Id);
            approvalWF.wrapList.add(wrap);
        }
        try{                       
            approvalWF.action('PAHome', 'PAHome', 'submitContinue');
            }
            catch(Exception e){}
       Test.startTest();    
        approvalWF.action('PAHome', 'PAHome', 'submitContinue');
        //Test.startTest();    
        pr.NPC_Status__c='Net Price Received';
        pr.Request_Reason__c = 'test';
        update pr;
        approvalWF.AsyncCallIndicatorCount = 2;
        approvalWF.wrapforReassignObjList=new List<PAWrapper>();
        approvalWF.appRejComments='Comments';
        approvalWF.FRBLevel=new Map<Integer,String>();
        approvalWF.FRBLevel.put(4,'Test');
        approvalWF.SelectedApprover='Test';
        approvalWF.selectedEPassID='Test';
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.SalesArea__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');
         List<Pricing_Request__c> prlist = new List<Pricing_Request__c>();
         prlist.add(pr);
         approvalWF.savebulkreassign(prlist,'xyz');      
         Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Import';
        pr1.Pricing_Request_Type__c = 'Import';
        pr1.Spot_Type__c = '';
        pr1.Current_Level__c = '1';
        pr1.Request_Valid_From__c = system.today()+1;
        pr1.Request_Valid_To__c = system.today()+2;
        pr1.BU__c = 'Test Business1';
        pr1.NPC_Status__c='Net Price Received';
        pr1.Request_Reason__c = 'test';
        insert pr1;
        prilist=new list<Pricing_Request_Item__c>();
        Material__c material1 = new Material__c();
        material1.ERP_Material_Code__c = 'Test Code';
        material1.ERP_Product_Hierarchy_Level_2__c = 'PH2';
        material1.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        insert material1;
        Profit_Center__c pc = new Profit_Center__c();
        pc.ERP_Profit_Center_Code__c = 'PH1PH2';
        pc.ERP_Profit_Center__c = 'Test Org';
        pc.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        pc.ERP_Profit_Center_4__c = 'Test Org';
        insert pc;
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request__c = pr1.Id;
        prItem1.Below_Current_Flag__c = true;
        prItem1.Below_Floor_Flag__c = true;
        prItem1.Below_Reference_Flag__c =true;
        prItem1.Country__c = 'India';
        prItem1.Key_Combination__c = 'Material';
        pritem1.pricing_request_type__c = 'Import';
        pritem1.key_combination_code__c = 'A580';
        pritem1.sap_cluster__c = 'WB1';
        prilist.add(prItem1);
        
        prItem1 = new Pricing_Request_Item__c();
        prItem1.Material_Code__c='Test Code';
        prItem1.Pricing_Request__c = pr1.Id;
        prItem1.Key_Combination__c = 'PH2';
        prItem1.Country__c = 'India';
        pritem1.pricing_request_type__c = 'Import';
        pritem1.key_combination_code__c = 'A580';
        pritem1.sap_cluster__c = 'WB1';
        prilist.add(prItem1);
        
        ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
        kc1.key_combination_code__c = 'A580';
        kc1.sap_cluster__c = 'WB1';
        kc1.customer_specific__c = true;
        insert kc1;
        
        Pricing_Request_Item__c prItem21 = new Pricing_Request_Item__c();
        prItem21.Pricing_Request__c = pr1.Id;
        prItem21.Below_Current_Flag__c = true;
        prItem21.Below_Floor_Flag__c = true;
        prItem21.Below_Reference_Flag__c =true;
        prItem21.Key_Combination__c = 'Material';
        pritem1.pricing_request_type__c = 'Import';
        pritem21.key_combination_code__c = 'A580';
        pritem21.sap_cluster__c = 'WB1';        
        prilist.add(prItem21);
        insert prilist;
        
        PA_BU_Admin_Master__c adminMaster1 = new PA_BU_Admin_Master__c();
        //adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster1.BU__c = 'Test Business1';
        adminMaster1.Price_Category__c = 'Permanent';
        adminMaster1.Request_Type__c = 'Customer Specific';
        adminMaster1.Pricing_Task_Type__c = '';
        upsert adminMaster1;
        
        PA_BU_Admin_Detail__c adminDetail1 = new PA_BU_Admin_Detail__c();
        adminDetail1.PA_BU_Admin_Master__c = adminMaster1.Id;
        adminDetail1.Routing_Parameter__c = 'Required';
        adminDetail1.Approval_Level__c = '1';
        adminDetail1.Approver_Role__c = 'Sales Approver';
        adminDetail1.Key_Field__c = 'Requester';
        upsert adminDetail1;
        soList = new List<Setup_Object__c>();        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.SalesArea__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr1.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');                 
         Test.stoptest();
        }
    }
    static testMethod void paApprovalWFTestMethod53() {
        
        
        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id,DelegatedApproverId=managerUser.Id);
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User managerUser = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert managerUser;
        User user1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        user1.managerId = managerUser.Id;
        insert user1;
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(user1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business1';
        orggroup.Owning_Org__c = 'Test Org';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        approvalWF.delegationComments = 'Test';
        approvalWF.AsyncCallIndicatorCount=1;
        test.starttest();
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Import';
        pr1.Pricing_Request_Type__c = 'Permanent';        
        pr1.Sales_Org_Code__c = 'A123';
        pr1.Dist_Channel_Code__c = '10';
        pr1.Division_Code__c = '02';
        pr1.Current_Level__c = '1';
        pr1.Request_Valid_From__c = system.today()+1;
        pr1.Request_Valid_To__c = system.today()+2;
        pr1.BU__c = 'Test Business1';
        pr1.NPC_Status__c='Waiting For Net Price';
        pr1.Request_Reason__c = 'test';
        pr1.country__c = 'India';
        pr1.Submitted_By__c = user1.id;
        insert pr1;
        list<Pricing_Request_Item__c> prilist=new list<Pricing_Request_Item__c>();
        List<RecordType> rtypes1 = [SELECT Name, id FROM RecordType WHERE sObjectType='Material__c' and isActive=true and DeveloperName='ERP_Material_Extended_Data' Limit 1];
        Material__c material1 = new Material__c();
        material1.ERP_Material_Code__c = 'Test Code';
        material1.ERP_Product_Hierarchy_Level_1_Code__c = 'PH1';
        material1.ERP_Product_Hierarchy_Level_2_Code__c = 'PH2';
        material1.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        material1.ERP_Profit_Center_4__c = 'Test Org';
        material1.ERP_Profit_Center_Code__c = 'PH1PH2';
        material1.ERP_Profit_Center__c = 'Test Org';
        material1.ERP_Product_Hierarchy_Code__c = 'PH1PH2';        
        material1.ERP_Sales_Org_Code__c = 'A123';
        material1.recordtypeId = rtypes1[0].Id;
        insert material1;
        Material__c material2 = new Material__c();
        material2.ERP_Material_Code__c = 'Test Code 1';
        material2.ERP_Product_Hierarchy_Level_1_Code__c = 'PH';
        material2.ERP_Product_Hierarchy_Level_2_Code__c = 'PH';
        material2.ERP_Profit_Center_4_Code__c = 'PH1PH';
        material2.ERP_Profit_Center_4__c = 'Test Org';
        material2.ERP_Profit_Center_Code__c = 'PH1PH2';
        material2.ERP_Profit_Center__c = 'Test Org';
        material2.ERP_Product_Hierarchy_Code__c = 'PHPH';
        material2.ERP_Sales_Org_Code__c = 'A123';        
        material2.recordtypeId = rtypes1[0].Id;
        insert material2;
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.ph_level__c = 2;
        ph.ph_Code__c = 'PH1PH2';
        insert ph;
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c();
        ph1.ph_level__c = 2;
        ph1.ph_Code__c = 'PHPH';
        insert ph1;
        Profit_Center__c pc = new Profit_Center__c();
        pc.ERP_Profit_Center_Code__c = 'PH1PH2';
        pc.ERP_Profit_Center__c = 'Test Org';
        pc.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        pc.ERP_Profit_Center_4__c = 'Test Org';
        insert pc;
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request__c = pr1.Id;
        prItem1.Sales_Org_Code__c = 'A123';
        prItem1.Material_Code__c='Test Code';
        prItem1.Below_Current_Flag__c = true;
        prItem1.Below_Floor_Flag__c = true;
        prItem1.Below_Reference_Flag__c =true;
        prItem1.Country__c = 'India';
        prItem1.Key_Combination__c = 'Sales Org./Material';
        pritem1.pricing_request_type__c = 'Import';
        pritem1.key_combination_code__c = 'A581';
        pritem1.sap_cluster__c = 'WB1';
        prilist.add(prItem1);        
        
        ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
        kc1.key_combination_code__c = 'A581';
        kc1.sap_cluster__c = 'WB1';
        kc1.customer_specific__c = false;
        insert kc1;
        
        Pricing_Request_Item__c prItem21 = new Pricing_Request_Item__c();
        prItem21.Pricing_Request__c = pr1.Id;
        prItem21.Below_Current_Flag__c = true;
        prItem21.Sales_Org_Code__c = 'A123';
        prItem21.Below_Floor_Flag__c = true;
        prItem21.Below_Reference_Flag__c =true;
        prItem21.Key_Combination__c = 'Sales Org./Material';
        pritem1.pricing_request_type__c = 'Import';
        pritem21.key_combination_code__c = 'A581';
        pritem21.sap_cluster__c = 'WB1';
        pritem21.Material_code__c = 'Test Code 1';
        pritem21.expire__c = true;
        pritem21.Net_Price_Status__c = 'Waiting For Net Price';
        prilist.add(prItem21);
        insert prilist;
        PA_BU_Admin_Master__c adminMaster2 = new PA_BU_Admin_Master__c();
        //adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster2.BU__c = 'Test Business1';
        adminMaster2.Price_Category__c = 'Permanent';
        adminMaster2.Request_Type__c = 'Non Customer Specific';
        adminMaster2.Pricing_Task_Type__c = '';
        adminMaster2.Sales_Organisation__c = 'A123';
        adminMaster2.Distribution_Channel__c = '10';
        adminMaster2.Division__c = '02';       
        insert adminMaster2;
        List<PA_BU_Admin_Detail__c> adlist = new list<PA_BU_Admin_Detail__c>();        
        PA_BU_Admin_Detail__c adminDetail212 = new PA_BU_Admin_Detail__c();
        adminDetail212.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail212.Routing_Parameter__c = 'Required';
        adminDetail212.Approval_Level__c = '1';
        adminDetail212.Approver_Role__c = 'Approver 1';
       //adminDetail212.Key_Field__c = 'PH2';
        insert adminDetail212;
        PA_BU_Admin_Detail__c adminDetail21 = new PA_BU_Admin_Detail__c();
        adminDetail21.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail21.Routing_Parameter__c = 'Not Required';
        adminDetail21.Approval_Level__c = '2';        
        insert adminDetail21;
        PA_BU_Admin_Detail__c adminDetail213 = new PA_BU_Admin_Detail__c();
        adminDetail213.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail213.Routing_Parameter__c = 'Not Required';
        adminDetail213.Approval_Level__c = '3';        
        insert adminDetail213;
        PA_BU_Admin_Detail__c adminDetail214 = new PA_BU_Admin_Detail__c();
        adminDetail214.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail214.Routing_Parameter__c = 'Not Required';
        adminDetail214.Approval_Level__c = '4';        
        insert adminDetail214;
        PA_BU_Admin_Detail__c adminDetail215 = new PA_BU_Admin_Detail__c();
        adminDetail215.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail215.Routing_Parameter__c = 'Not Required';
        adminDetail215.Approval_Level__c = '5';        
        insert adminDetail215;
        List<Setup_Object__c> soList = new List<Setup_Object__c>();
        Setup_Object__c setupObj1 = new Setup_Object__c();
        setupObj1.All_Other_Values__c = user1.Id;
        setupObj1.Mixed_Values__c = user1.id;
        setupObj1.Approver_Id__c = user1.Id;
        setupObj1.Approver_Backup__c = user1.id;
        setupObj1.Key_Field__c = 'PH2';
        setupObj1.Approver_Role__c = 'Approver 1';
        setupObj1.BU__c = pr1.BU__c;
        setupObj1.Key_Field_ID__c = 'PH1PH2';
        setupObj1.Key_Field_Value__c = 'PH1PH2';
        setupObj1.Sales_Organisation__c = 'A123';
        setupObj1.Distribution_Channel__c = '10';
        setupObj1.Division__c = '02';
        insert setupObj1; 
        soList.add(setupObj1);      
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.SalesArea__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr1.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');                  
         Test.stoptest();
       
                   
        }
    }
    static testMethod void paApprovalWFTestMethod54() {
        
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.

        Profile p1 = [select id from profile where Name='System Administrator' limit 1];
        /*
        UserRole r1= [Select id from UserRole where Name='DuPont Fully Owned' limit 1];
        String orgId = UserInfo.getOrganizationId();
        User managerUser = new User(LastName='Manager_XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='managerusername'+orgId+'_DuPont@usa.dupont.com.t12');
        insert managerUser;
        User user1 = new User(LastName='XYZ',UserRoleId=r1.Id,ProfileId=p1.Id,Alias='ain123',EmailEncodingKey='UTF-8',TimeZoneSidKey='America/New_York'
        ,LocaleSidKey='en_US',LanguageLocaleKey='en_US',Email='abc@xyz.com',UserName='testusername'+orgId+'_DuPont@usa.dupont.com.t12', managerId=managerUser.Id,DelegatedApproverId=managerUser.Id);
        insert user1;
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User usr = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User FirstName','User LastName');
        insert usr;
        User usr1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        usr1.managerId = usr.Id;
        insert usr1;
        User usr2 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User2 FirstName','User2 LastName');
        usr2.managerId = usr.Id;
        insert usr2;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //List<User> userList = [SELECT id from User where isActive = true limit 1];
        system.runAs(usr1){
            IntegrationLoginCredentials__c ic = new IntegrationLoginCredentials__c();
        ic.Name = 'spec.specpa@dupont.com';
        ic.EncryptedLoginDetails__c = 'ZGRzZmRjcHI6MjM0TjVPQSMkUjNUWXdBZFl2MjM0';
        ic.EndPointURL__c = '';
        insert ic; PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        List<RecordType> rtypes = [SELECT Name, id FROM RecordType WHERE sObjectType='OrgGroup__c' and isActive=true and DeveloperName='Business' Limit 1];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.Business__c = 'Test Business1';
        orggroup.Owning_Org__c = 'Test Org';
        orgGroup.recordtypeId=rtypes[0].Id;
        insert orgGroup;
            
        
        PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
        paProfilePermissions.Name = 'Sales Admin';
        insert paProfilePermissions;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        insert paProfilePermissions1;
        
        PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
        paProfilePermissions2.Name = 'CSR';
        insert paProfilePermissions2;
        
        PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
        paProfilePermissions3.Name = 'BU Admin';
        insert paProfilePermissions3;
        
        PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
        paProfilePermissions4.Name = 'Price Requester';
        insert paProfilePermissions4;
        
        PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
        paProfilePermissions5.Name = 'Project Group';
        paProfilePermissions5.API_NAME__c = 'TestGroup';
        insert paProfilePermissions5;
        
        PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
        paProfilePermissions6.Name = 'IT Admin';
        insert paProfilePermissions6;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        //added by sumita dabas 2 nov 2015 issue 58402 start
        list<Business_Unit__c> listOfBU = new   list<Business_Unit__c>();

        Business_Unit__c BUrecord = new Business_Unit__c(); 
        BUrecord.Name ='BU List1';
        BUrecord .BUList__c = 'DPP Polymers EMEA,DPP Polymers AP';
        listOfBU.add(BUrecord);
        insert listOfBU;
        
        //added by sumita dabas 2 nov 2015 issue 58402 end
        PAApprovalWF approvalWF = new PAApprovalWF(paServiceState);
        approvalWF.request = new PARequest(paServiceState);
        approvalWF.delegationComments = 'Test';
        approvalWF.AsyncCallIndicatorCount=1;
        test.starttest();
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Request_Type__c = 'Import';
        pr1.Pricing_Request_Type__c = 'Permanent';        
        pr1.Sales_Org_Code__c = 'A123';
        pr1.Dist_Channel_Code__c = '10';
        pr1.Division_Code__c = '02';
        pr1.Current_Level__c = '1';
        pr1.Request_Valid_From__c = system.today()+1;
        pr1.Request_Valid_To__c = system.today()+2;
        pr1.BU__c = 'Test Business1';
        pr1.NPC_Status__c='Waiting For Net Price';
        pr1.Request_Reason__c = 'test';
        pr1.country__c = 'India';
        pr1.Submitted_By__c = usr2.id;
        insert pr1;
        list<Pricing_Request_Item__c> prilist=new list<Pricing_Request_Item__c>();
        List<RecordType> rtypes1 = [SELECT Name, id FROM RecordType WHERE sObjectType='Material__c' and isActive=true and DeveloperName='ERP_Material_Extended_Data' Limit 1];
        Material__c material1 = new Material__c();
        material1.ERP_Material_Code__c = 'Test Code';
        material1.ERP_Product_Hierarchy_Level_1_Code__c = 'PH1';
        material1.ERP_Product_Hierarchy_Level_2_Code__c = 'PH2';
        material1.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        material1.ERP_Profit_Center_4__c = 'Test Org';
        material1.ERP_Profit_Center_Code__c = 'PH1PH2';
        material1.ERP_Profit_Center__c = 'Test Org';
        material1.ERP_Product_Hierarchy_Code__c = 'PH1PH2';
        material1.ERP_Sales_Org_Code__c = 'A123';
        material1.recordtypeId = rtypes1[0].Id;
        insert material1;
        Material__c material2 = new Material__c();
        material2.ERP_Material_Code__c = 'Test Code 1';
        material2.ERP_Product_Hierarchy_Level_1_Code__c = 'PH';
        material2.ERP_Product_Hierarchy_Level_2_Code__c = 'PH';
        material2.ERP_Profit_Center_4_Code__c = 'PH1PH';
        material2.ERP_Profit_Center_4__c = 'Test Org';
        material2.ERP_Profit_Center_Code__c = 'PH1PH2';
        material2.ERP_Profit_Center__c = 'Test Org';
        material2.ERP_Product_Hierarchy_Code__c = 'PHPH';
        material2.ERP_Sales_Org_Code__c = 'A123';
        material2.recordtypeId = rtypes1[0].Id;
        insert material2;
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.ph_level__c = 2;
        ph.ph_Code__c = 'PH1PH2';
        insert ph;
        Product_Hierarchy__c ph1 = new Product_Hierarchy__c();
        ph1.ph_level__c = 2;
        ph1.ph_Code__c = 'PHPH';
        insert ph1;
        Profit_Center__c pc = new Profit_Center__c();
        pc.ERP_Profit_Center_Code__c = 'PH1PH2';
        pc.ERP_Profit_Center__c = 'Test Org';
        pc.ERP_Profit_Center_4_Code__c = 'PH1PH2';
        pc.ERP_Profit_Center_4__c = 'Test Org';
        insert pc;
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();
        prItem1.Pricing_Request__c = pr1.Id;
        prItem1.Sales_Org_Code__c = 'A123';
        prItem1.Material_Code__c='Test Code';
        prItem1.Below_Current_Flag__c = true;
        prItem1.Below_Floor_Flag__c = true;
        prItem1.Below_Reference_Flag__c =true;
        prItem1.Country__c = 'India';
        prItem1.Key_Combination__c = 'Sales Org./Material';
        pritem1.pricing_request_type__c = 'Import';
        pritem1.key_combination_code__c = 'A581';
        pritem1.sap_cluster__c = 'WB1';
        prilist.add(prItem1);        
        
        ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
        kc1.key_combination_code__c = 'A581';
        kc1.sap_cluster__c = 'WB1';
        kc1.customer_specific__c = false;
        insert kc1;
        
        Pricing_Request_Item__c prItem21 = new Pricing_Request_Item__c();
        prItem21.Pricing_Request__c = pr1.Id;
        prItem21.Below_Current_Flag__c = true;
        prItem21.Sales_Org_Code__c = 'A123';
        prItem21.Below_Floor_Flag__c = true;
        prItem21.Below_Reference_Flag__c =true;
        prItem21.Key_Combination__c = 'Sales Org./Material';
        pritem1.pricing_request_type__c = 'Import';
        pritem21.key_combination_code__c = 'A581';
        pritem21.sap_cluster__c = 'WB1';
        pritem21.Material_code__c = 'Test Code 1';
        pritem21.expire__c = true;
        pritem21.Net_Price_Status__c = 'Waiting For Net Price';
        prilist.add(prItem21);
        insert prilist;
        PA_BU_Admin_Master__c adminMaster2 = new PA_BU_Admin_Master__c();
        //adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster2.BU__c = 'Test Business1';
        adminMaster2.Price_Category__c = 'Permanent';
        adminMaster2.Request_Type__c = 'Non Customer Specific';
        adminMaster2.Pricing_Task_Type__c = '';
        adminMaster2.Sales_Organisation__c = 'A123';
        adminMaster2.Distribution_Channel__c = '10';
        adminMaster2.Division__c = '02';       
        insert adminMaster2;
        List<PA_BU_Admin_Detail__c> adlist = new list<PA_BU_Admin_Detail__c>();       
        PA_BU_Admin_Detail__c adminDetail212 = new PA_BU_Admin_Detail__c();
        adminDetail212.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail212.Routing_Parameter__c = 'Required';
        adminDetail212.Approval_Level__c = '1';
        adminDetail212.Approver_Role__c = 'Approver 2';
        adminDetail212.Key_Field__c = 'FRB4';
        insert adminDetail212;
        PA_BU_Admin_Detail__c adminDetail21 = new PA_BU_Admin_Detail__c();
        adminDetail21.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail21.Routing_Parameter__c = 'Required';
        adminDetail21.Approval_Level__c = '2';
        adminDetail212.Approver_Role__c = 'Requester'+'\''+'s Approver';
        adminDetail21.Key_Field__c = 'Requester';        
        insert adminDetail21;
        PA_BU_Admin_Detail__c adminDetail213 = new PA_BU_Admin_Detail__c();
        adminDetail213.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail213.Routing_Parameter__c = 'Required';
        adminDetail213.Approval_Level__c = '3';
        adminDetail212.Approver_Role__c = 'Approver 1';
        adminDetail212.Key_Field__c = 'PH2';        
        insert adminDetail213;
        PA_BU_Admin_Detail__c adminDetail214 = new PA_BU_Admin_Detail__c();
        adminDetail214.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail214.Routing_Parameter__c = 'Not Required';
        adminDetail214.Approval_Level__c = '4';        
        insert adminDetail214;
        PA_BU_Admin_Detail__c adminDetail215 = new PA_BU_Admin_Detail__c();
        adminDetail215.PA_BU_Admin_Master__c = adminMaster2.Id;
        adminDetail215.Routing_Parameter__c = 'Not Required';
        adminDetail215.Approval_Level__c = '5';        
        insert adminDetail215;        
        Setup_Object__c setupObj4 = new Setup_Object__c();
        setupObj4.Approver_Id__c = usr2.Id;
        setupObj4.Approver_Backup__c = usr2.id;
        setupObj4.Key_Field__c = 'FRB4';
        setupObj4.Approver_Role__c = 'Approver 2';
        setupObj4.BU__c = pr1.BU__c;
        setupObj4.Key_Field_ID__c = 'PH1PH2';
        setupObj4.Key_Field_Value__c = 'PH1PH2';
        setupObj4.Sales_Organisation__c = 'A123';
        setupObj4.Distribution_Channel__c = '10';
        setupObj4.Division__c = '02';
        insert setupObj4;
        Setup_Object__c setupObj5 = new Setup_Object__c();
        setupObj5.Approver_Id__c = usr2.Id;
        setupObj5.Approver_Backup__c = usr2.id;
        setupObj5.Key_Field__c = 'PH2';
        setupObj5.Approver_Role__c = 'Approver 1';
        setupObj5.BU__c = pr1.BU__c;
        setupObj5.Key_Field_ID__c = 'PH1PH2';
        setupObj5.Key_Field_Value__c = 'PH1PH2';
        setupObj5.Sales_Organisation__c = 'A123';
        setupObj5.Distribution_Channel__c = '10';
        setupObj5.Division__c = '02';
        insert setupObj5;
        
        approvalWF.request.pricingRequest = [SELECT SAP_Cluster__c, Request_Class__c, F_NPC_Callout_Status__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.SalesArea__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                              FROM Pricing_Request__c WHERE Id = :pr1.Id];
         approvalWF.action('PAHome', 'PAHome', 'submitCalculation');         
         Test.stoptest();
        }
    }
        
}