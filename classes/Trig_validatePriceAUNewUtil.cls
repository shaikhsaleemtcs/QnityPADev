/*****************************************************************************************************************
 <KS20160915> 
Last Modified By    :   Kunal Sharma
Last Modified Date  :   15 Sep 2016
Description         :   Added Condition to concatinate 15 hashes(#) after K Code in KC_SAP (IS ID-00073333)
***********************************************************************************************************************
 <AS20191226> 
Last Modified By    :   Arrola Sireesha
Last Modified Date  :   23 Dec 2019
Description         :   Changed the logic to map the correct owner for the prices by using map between PRI and PR with issue  <IS TI-00088418>

***********************************************************************************************************************
<VK20210311> <Reverted>
Last Modified By    :   Vinay Kumar
Last Modified Date  :   11 Mar 2021
Description         :   Fixed the code for Ship-To Country field mapping for Non SAP records IS SC-00097619
***********************************************************************************************************************
<CRM-2021-04-0192>
Last Modified By   :   Harsh Gurvanshi
Last Modified Date :   05 Oct 2021
Description        :   Adding extra condition for KC_SAP__c field condition creation in P80
Issue #            :   CRM-2021-04-0192|| EC CRM
***********************************************************************************************************************
<SS20220826>
Last Modified By   :   Shantanu Sharma
Last Modified Date :   26 Aug 2022
Description        :   Added logic to include Sales Order Item and Sales Order Item Code - CRM-2022-07-0225
***********************************************************************************************************************
<SH20221014>
Last Modified By    :   Sapneet Hora
Last Modified Date  :   14 Oct 2022
Description         :   Fixed the code for Ship-To Country field mapping for Non SAP records IS SC-00105301
**********************************************************************************************************************
<SS20230501>
Last Modified By   :   Shantanu Sharma
Last Modified Date :   05 May 2023
Description        :   P80 M&M Changes
**********************************************************************************************************************/

public class Trig_validatePriceAUNewUtil {
//<AS20191226> changed the parameter 
    public static ERP_Sales_Prices_SAP__c createHolderFromItem(Pricing_Request_Item__c pri,Id RequestOwnerId,map<String,Id> custSRMap,map<id,Pricing_Request__c> prmap)
    {       
        ERP_Sales_Prices_SAP__c newholder= new ERP_Sales_Prices_SAP__c();
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
        newHolder.Country__c = pri.Country__c;
        newHolder.Country_code__c = pri.Country_Code__c; 
        newHolder.Customer_Price_Group__c = pri.Customer_Price_Group__c;
        newHolder.Customer_Price_Group_Code__c = pri.Customer_Price_Group_Code__c;
        newHolder.Customer_Specific__c=pri.Customer_Specific__c;
        newHolder.Dist_Channel__c = pri.Dist_Channel__c;
        newHolder.Distribution_Channel_Code__c = pri.Dist_Channel_Code__c;
        newHolder.Division__c = pri.Division__c;
        newHolder.Division_Code__c = pri.Division_Code__c;
        // <SS20230501> START
        newHolder.Value_Center__c = pri.Value_Center__c;   
        newHolder.Value_Center_Code__c = pri.Value_Center_Code__c; 
        newHolder.Price_Zone__c = pri.Price_Zone__c;
        newHolder.Price_Zone_Code__c = pri.Price_Zone_Code__c;
        newHolder.Material_Group_2__c = pri.Material_Group_2__c; 
        newHolder.Material_group_2_Code__c = pri.Material_group_2_Code__c;
        newHolder.Ext_Matl_Grp__c = pri.Ext_Matl_Grp__c;
        newHolder.Ext_Matl_Grp_Code__c = pri.Ext_Matl_Grp_Code__c;
        // <SS20230501> END
        //<KK20202408>
        newHolder.Distributor_Code__c = pri.Distributor_Code__c;
        newHolder.Distributor_Name__c = pri.Distributor_Name__c;
        //<KK20202408>
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
        newHolder.Sales_Pricing_Procedure__c=pri.ERP_Pricing_Procedure__c;  
        /* added because there is no Sales Price Type as 'Import'*/
        if(pri.Pricing_Request_Type__c!=null && pri.Pricing_Request_Type__c.equalsIgnoreCase('Import'))
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
        //<SS20220826> START
        newHolder.Sales_Order_Item__c = pri.Sales_Order_Item__c;
        newHolder.Sales_Order_Item_Code__c = pri.Sales_Order_Item_Code__c;
        //<SS20220826> END
        //<TJ20150128>
        //<AS20191226>start
        if(prmap.get(pri.pricing_request__c).Request_Type__c=='Import' && prmap.get(pri.pricing_request__c).Customer_Specific__c==true && (prmap.get(pri.pricing_request__c).On_Behalf_Of__c==null))
        {
            if(custSRMap.get(pri.Sold_To_Code__c)!=null){
                newHolder.OwnerId=custSRMap.get(pri.Sold_To_Code__c);
                system.debug(custSRMap.get(pri.Sold_To_Code__c)+' '+newHolder.OwnerId);
            }
            else
                newHolder.OwnerId=prmap.get(pri.pricing_request__c).OwnerId;                       
        }
        else
            newHolder.OwnerId=prmap.get(pri.pricing_request__c).OwnerId; 
              //<AS20191226>end  
        newHolder.Price_Ref_Partner_Code__c=pri.Price_Ref_Partner_Code__c;
        newHolder.Price_Ref_Partner__c=pri.Price_Ref_Partner__c;

        newHolder.Contract_Code__c=pri.Contract_Code__c;
        newHolder.Contract__c=pri.Contract__c;
        newHolder.Disc_Ref_No__c=pri.Disc_Ref_No__c;
        newHolder.Document_Currency_Code__c=pri.Document_Currency_Code__c;
        newHolder.Document_Currency__c=pri.Document_Currency__c;
        newHolder.FixValDate__c=pri.FixValDate__c;
        newHolder.Kcode__c=pri.Kcode__c;
        newHolder.Partner_ZF__c=pri.Partner_ZF__c;
        newHolder.Partner_ZF_Code__c=pri.Partner_ZF_Code__c;
        newHolder.Payer__c=pri.Payer__c;
        newHolder.Payer_Code__c=pri.Payer_Code__c;  
        newHolder.Sales_District__c=pri.Sales_District__c;
        newHolder.Sales_District_Code__c=pri.Sales_District_Code__c;
        newHolder.State__c=pri.State__c;
        newHolder.State_Code__c=pri.State_Code__c;
        newHolder.Material_Group_1__c=pri.Material_Group_1__c;
        newHolder.Material_Group_1_Code__c=pri.Material_Group_1_Code__c;
        newHolder.Material_Group_5_Key__c=pri.Material_Group_5_Key__c;
        newHolder.Material_Group_5_Key_Code__c=pri.Material_Group_5_Key_Code__c;
        newHolder.Campaign__c=pri.Campaign__c;
        newHolder.Campaign_Code__c=pri.Campaign_Code__c;    
        return newHolder;
    }   
//<AS20191226> changed the parameter
    public static ERP_Sales_Prices_SAP__c createSalesPriceSAPFromItem(Pricing_Request_Item__c pri1,Id RequestOwnerId,map<String,Id> custSRMap, map<id,Pricing_Request__c> prmap)
    {
        ERP_Sales_Prices_SAP__c newRec=new ERP_Sales_Prices_SAP__c();
        newRec.Valid_From__c = pri1.New_Valid_From__c;
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
        //<SS20230501> START
        newREc.Value_Center__c = pri1.Value_Center__c ;   
        newREc.Value_Center_Code__c = pri1.Value_Center_Code__c ; 
        newRec.Price_Zone__c = pri1.Price_Zone__c;
        newRec.Price_Zone_Code__c = pri1.Price_Zone_Code__c;
        newRec.Material_group_2__c = pri1.Material_group_2__c;
        newRec.Material_group_2_Code__c = pri1.Material_group_2_Code__c;
        newRec.Ext_Matl_Grp__c = pri1.Ext_Matl_Grp__c;
        newRec.Ext_Matl_Grp_Code__c = pri1.Ext_Matl_Grp_Code__c;
        //<SS20230501> END
        newREc.Sales_Order_Item_Code__c = pri1.Sales_Order_Item_Code__c; //<SS20220826>
        newREc.Sales_Order_Item__c = pri1.Sales_Order_Item__c;//<SS20220826>
        //<KK20202408>
        newREc.Distributor_Code__c = pri1.Distributor_Code__c;
        newREc.Distributor_Name__c = pri1.Distributor_Name__c;
        //<KK20202408>
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
        if(pri1.Pricing_Request_Type__c!=null && pri1.Pricing_Request_Type__c.equalsIgnoreCase('Import'))
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
        //<AS20191226>start
        if(prmap.get(pri1.pricing_request__c).Request_Type__c=='Import' && prmap.get(pri1.pricing_request__c).Customer_Specific__c==true && (prmap.get(pri1.pricing_request__c).On_Behalf_Of__c==null))
        {
            if(custSRMap.get(pri1.Sold_To_Code__c)!=null){
                newREc.OwnerId=custSRMap.get(pri1.Sold_To_Code__c);
                system.debug(custSRMap.get(pri1.Sold_To_Code__c)+' '+newREc.OwnerId);
            }
            else
                newREc.OwnerId=prmap.get(pri1.pricing_request__c).OwnerId;                  
        }
        else
            newREc.OwnerId=prmap.get(pri1.pricing_request__c).OwnerId;
               //<AS20191226>end 
        newRec.Price_Ref_Partner_Code__c=pri1.Price_Ref_Partner_Code__c;
        newRec.Price_Ref_Partner__c=pri1.Price_Ref_Partner__c;

        newRec.Contract_Code__c=pri1.Contract_Code__c;
        newRec.Contract__c=pri1.Contract__c;
        newRec.Disc_Ref_No__c=pri1.Disc_Ref_No__c;
        newRec.Document_Currency_Code__c=pri1.Document_Currency_Code__c;
        newRec.Document_Currency__c=pri1.Document_Currency__c;
        newRec.FixValDate__c=pri1.FixValDate__c;
        newRec.Kcode__c=pri1.Kcode__c;
        newRec.Partner_ZF__c=pri1.Partner_ZF__c;
        newRec.Partner_ZF_Code__c=pri1.Partner_ZF_Code__c;
        newRec.Payer__c=pri1.Payer__c;
        newRec.Payer_Code__c=pri1.Payer_Code__c;
        newRec.Sales_District__c=pri1.Sales_District__c;
        newRec.Sales_District_Code__c=pri1.Sales_District_Code__c;
        newRec.State__c=pri1.State__c;
        newRec.State_Code__c=pri1.State_Code__c;
        newRec.Material_Group_1__c=pri1.Material_Group_1__c;
        newRec.Material_Group_1_Code__c=pri1.Material_Group_1_Code__c;
        newRec.Material_Group_5_Key__c=pri1.Material_Group_5_Key__c;
        newRec.Material_Group_5_Key_Code__c=pri1.Material_Group_5_Key_Code__c;
        newRec.Campaign__c=pri1.Campaign__c;
        newRec.Campaign_Code__c=pri1.Campaign_Code__c;

        /*population of KCSAP-try*/
        sObject sObj = (sObject)pri1 ; 
        List<String> kcSplitList =new List<String>();
        newRec.KC_SAP__c='';
        kcSplitList = pri1.Key_Combination__c.split('/');
        
        for(String kc:kcSplitList)
        {
            if(('Sales Org.').equalsIgnoreCase(kc))
            {
                if((('A796').equalsIgnoreCase(pri1.Key_Combination_Code__c)) && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80)){}   //<SS20230501> - To skip the sales org code updation for specific PCKC
                else
                {
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
            }
            } 
            if(('Division').equalsIgnoreCase(kc))
            {
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
            }
            if(('Dist. Channel').equalsIgnoreCase(kc))
            {
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
            }
            //---Start--Changes done by Kunal Sharma(752081) for CI Mass Import (K Code) IS ID-00073333
            if(('Char Name').equalsIgnoreCase(kc))
            {
                /*leading #####*/
                String charname=String.valueOf(sobj.get('Char_Name__c'));
                if(charname <> null) {
                    charname = (charname.rightPad(30)).replaceAll(' ', '#');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + charname;
             }   
            }
            //---End--Changes done by Kunal Sharma(752081) for CI Mass Import (K Code) IS ID-00073333
            if(('Sold to').equalsIgnoreCase(kc))
            {
                /*leading zeros*/
                String soldTo=String.valueOf(sobj.get('Sold_To_Code__c'));
                if(soldTo <> null) {
                    soldTo = (soldTo.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + soldTo;
                }
                /*end*/
            }
            if(('Material').equalsIgnoreCase(kc))
            {
                /*leading hashes*/
                String matCode = String.valueOf(sobj.get('Material_Code__c'));
                if(!String.isBlank(matCode)){
                    //Start <CRM-2021-04-0192>
                    if(pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80){ // if Condition for P80 System check
                        matCode = (matCode.leftPad(18)).replaceAll(' ', '0');       // adding "0" to the material on the left for making it 18 character
                    }else{
                        matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
                    }//End <CRM-2021-04-0192>
                }   
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
                /*leading zeros*/
                String shipTo=String.valueOf(sobj.get('ShipTo_Code__c'));
                if(shipTo <> null)
                {
                    shipTo = (shipTo.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + shipTo;
                }
                /*end*/
            }
            if(('End User').equalsIgnoreCase(kc))
            {
                /*leading zeros*/
                String endUser=String.valueOf(sobj.get('End_User_Code__c'));
                if(endUser <> null)
                {
                    endUser = (endUser.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + endUser;
                }
                /*end*/
            }
            if(('Customer Hierarchy').equalsIgnoreCase(kc))
            {
                /*leading zeros*/
                String customerHierarchy=String.valueOf(sobj.get('Customer_Hierarchy_Code__c'));
                if(customerHierarchy <> null)
                {
                    customerHierarchy = (customerHierarchy.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + customerHierarchy;
                }
                /*end*/
            }
            if(('FRB').equalsIgnoreCase(kc))
            {
                /*leading zeros*/
                String frb=String.valueOf(sobj.get('Profit_Center_Code__c'));
                newRec.KC_SAP__c =newRec.KC_SAP__c + frb;
                /*end*/
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
                    //Start  <CRM-2021-04-0192>
                    if(pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80){
                        cpgCode=cpgCode; //End  <CRM-2021-04-0192>
                    }else{
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
                }
                newRec.KC_SAP__c =newRec.KC_SAP__c + cpgCode;
            }
            if(('DiscRef').equalsIgnoreCase(kc) || (('Project Id').equalsIgnoreCase(kc)))
            { 
                /*leading zeros*/
                String projectId=String.valueOf(sobj.get('Disc_Ref__c'));
                if(projectId!=null)
                {
                    //project Id should be 12 digit
                    projectId = (projectId.leftPad(12)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + projectId;
                }
                /*end*/                           
            }
            if(('Price List Type').equalsIgnoreCase(kc)){    //<SS20230501> 
                String PLtypecode=String.valueOf(sobj.get('Price_List_Type_Code__c'));
                if(PLtypecode<>null && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80))
                {   
                    PLtypecode=(PLtypecode.leftpad(2)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + PLtypecode ;
                }
                else
            {
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Price_List_Type_Code__c'));
            }
            } 
            //<KK20202408>
            if(('Distributor').equalsIgnoreCase(kc))
            {
                newRec.KC_SAP__c =newRec.KC_SAP__c + '00'+ String.valueOf(sobj.get('Distributor_Code__c'));
            }
            //<KK20202408>
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
            if(('Variant').equalsIgnoreCase(kc)){
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Variant_Code__c'));
            }
            if(('Sales Order Type').equalsIgnoreCase(kc)){
                //<AV20141127>-Start-Production issue-Added condition to append '#' to Sales Order Type 
                String SalesOrderType = String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
                if(!String.isBlank(SalesOrderType)){
                    //Start <CRM-2021-04-0192>
                    if(pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80){  // if Condition for P80 System check
                        SalesOrderType = (SalesOrderType.rightPad(4));               // Adding blank space on the right for SAP P80 Price Update Flow
                    }//End <CRM-2021-04-0192>
                    else{
                        SalesOrderType = (SalesOrderType.rightPad(4)).replaceAll(' ', '#');
                    }
                }   
                newRec.KC_SAP__c =newRec.KC_SAP__c + SalesOrderType;
                system.debug('!%@$#^$SAlesOrderType:'+SalesOrderType);
                //<AV20141127>-End
                //newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Order_Type_Code__c'));
            }//<SS20220826> START
            if(('Sales Order Item').equalsIgnoreCase(kc)){
                String SalesOrderItem = String.valueOf(sobj.get('Sales_Order_Item_Code__c'));
                if(SalesOrderItem <> null) {
                    SalesOrderItem = (SalesOrderItem.leftPad(6)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + SalesOrderItem;
                } //<SS20220826> END
                /*end*/
            }
            if(('ComPartner').equalsIgnoreCase(kc)){
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('ComPartner_Code__c'));
            }
            if(('Plant').equalsIgnoreCase(kc)){
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Plant_Code__c'));
            }
            if(('Destination Country').equalsIgnoreCase(kc)){
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Destination_Country_Code__c'));
            }
            if(('Price Ref. Partner').equalsIgnoreCase(kc)){
                /*leading zeros*/
                String priceRefPartner=String.valueOf(sobj.get('Price_Ref_Partner_Code__c'));
                if(priceRefPartner <> null) {
                    priceRefPartner = (priceRefPartner.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + priceRefPartner;
                }
                /*end*/
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

            if(('Contract No.').equalsIgnoreCase(kc))
            {
                 /* <AJ20151209> Changes related to Contract No length to be 10 */
                 /*leading zeros*/
                String ContractNumber=String.valueOf(sobj.get('Contract_Code__c'));
                if(ContractNumber <> null) {
                    ContractNumber = (ContractNumber.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + ContractNumber;
                }
                /*end*/
                //newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Contract_Code__c'));

            }
            
            if(('Disc Ref No').equalsIgnoreCase(kc)){

                String DRCode = String.valueOf(sobj.get('Disc_Ref_No__c'));
                if(DRCode<>null)
                {
                    DRCode=(DRCode.rightpad(12)).replace(' ','#');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + DRCode;
                }
            }
            if(('Document Currency').equalsIgnoreCase(kc))
            {
                /* <AJ20151209> Changes related to Document Currency length to be 5 */
                /*trailing #*/
                String DocCurrencyCode=String.valueOf(sobj.get('Document_Currency_Code__c'));
                if(DocCurrencyCode <> null) {
                    DocCurrencyCode = (DocCurrencyCode.rightPad(5)).replaceAll(' ', '#');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + DocCurrencyCode;
                }
                /*end*/
                //newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Document_Currency_Code__c'));

            }
            if(('FixValDate').equalsIgnoreCase(kc)){

                date fvd= date.valueof(sobj.get('FixValDate__c'));
                String day= String.valueof(fvd.day());
                if(day.length()==1)
                    day='0'+day;
                String Month=String.valueof(fvd.month());
                if(Month.length()==1)
                    Month='0'+Month;
                String year=String.valueof(fvd.year());

                newREc.KC_SAP__c =newREc.KC_SAP__c + year+Month+day;

            }
            if(('Kcode').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Kcode__c'));

            }
            if(('Partner ZF').equalsIgnoreCase(kc)){
                String PartnerZFCode=String.valueOf(sobj.get('Partner_ZF_Code__c'));
                if(PartnerZFCode<>null)
                {
                    PartnerZFCode=(PartnerZFCode.leftpad(10)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + PartnerZFCode;
                }

            }
            if(('Payer').equalsIgnoreCase(kc)){
                String payercode=String.valueOf(sobj.get('Payer_Code__c'));
                if(payercode<>null)
                {
                    payercode=(payercode.leftpad(10)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + payercode /*String.valueOf(sobj.get('Payer_Code__c'))*/;
                }
            }
            if(('Sales District').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Sales_District_Code__c'));

            }
            if(('State').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('State_Code__c'))+'#';

            }
            if(('Material Group 1').equalsIgnoreCase(kc)||('Matl grp1').equalsIgnoreCase(kc)||('MatGrp1').equalsIgnoreCase(kc)||('Matl grp 1').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Material_Group_1_Code__c'));

            }
            if(('Material Group 5 Key').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Material_Group_5_Key_Code__c'));

            }
            if(('Campaign').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Campaign_Code__c'));

            }
            if(('Value Center').equalsIgnoreCase(kc)){    //<SS20230501> START
                String Valuecentercode=String.valueOf(sobj.get('Value_Center_Code__c'));
                if(Valuecentercode<>null && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80))
                {   
                    Valuecentercode=(Valuecentercode.leftpad(10)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + Valuecentercode ;
                }
            }  
            if(('Price Zone').equalsIgnoreCase(kc)){
                String Pricezonecode=String.valueOf(sobj.get('Price_Zone_Code__c'));
                if(Pricezonecode<>null && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80))
                {   
                    Pricezonecode=(Pricezonecode.leftpad(4)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + Pricezonecode ;
                }
            }
            if(('Material Group 2').equalsIgnoreCase(kc)||('Matl grp2').equalsIgnoreCase(kc)||('MatGrp2').equalsIgnoreCase(kc)||('Matl grp 2').equalsIgnoreCase(kc)){
               String Matlgrp2Code=String.valueOf(sobj.get('Material_group_2_Code__c'));
               if(Matlgrp2Code <> null && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80))
                {   
                Matlgrp2Code=(Matlgrp2Code.leftpad(3)).replace(' ','0');                
                newREc.KC_SAP__c =newREc.KC_SAP__c + Matlgrp2Code;
                }
            }
             if(('Ext Matl Grp').equalsIgnoreCase(kc)){
                String ExtmatlgrpCode=String.valueOf(sobj.get('Ext_Matl_Grp_Code__c'));
                if(ExtmatlgrpCode<>null && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80))
                {
                    ExtmatlgrpCode=(ExtmatlgrpCode.leftpad(12)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + ExtmatlgrpCode;
                }    
            }
             if(('Shipping Condition').equalsIgnoreCase(kc)){     
                String SCcode=String.valueOf(sobj.get('Shipping_Condition_Code__c'));
                if(SCcode<>null && (pri1.SAP_Cluster__c  == System.Label.SourceClusterCheckP80))
                {   
                    SCcode=(SCcode.leftpad(2)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + SCcode ;
                }
            } //<SS20230501> END
            newRec.KC_SAP__c.trim();
        }
        return newRec;
    }

    public static Sales_Prices__c createNonSAPHolderFromItem(Pricing_Request_Item__c pri,Id RequestOwnerId)
    {
        Sales_Prices__c newholder=new Sales_Prices__c();
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
        newHolder.Country__c = pri.Country__c;
        newHolder.Country_code__c = pri.Country_Code__c; 
        //<SH20221014> START
        newHolder.Ship_To_Country_Code__c = pri.Ship_To_Country_Code__c;
        newHolder.Ship_To_Country__c = pri.Ship_To_Country__c;
        //<SH20221014> END
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
        newHolder.Sales_Order_Type_Code__c=pri.Sales_Order_Type_Code__c;
        //<SS20220826> START
        //newHolder.Sales_Order_Item__c=pri.Sales_Order_Item__c;
        //newHolder.Sales_Order_Item_Code__c=pri.Sales_Order_Item_Code__c;
        //<SS20220826> END
        newHolder.Contract_Code__c=pri.Contract_Code__c;
        newHolder.Contract__c=pri.Contract__c;
        newHolder.Disc_Ref_No__c=pri.Disc_Ref_No__c;
        newHolder.Document_Currency_Code__c=pri.Document_Currency_Code__c;
        newHolder.Document_Currency__c=pri.Document_Currency__c;
        newHolder.FixValDate__c=pri.FixValDate__c;
        newHolder.Kcode__c=pri.Kcode__c;
        newHolder.Partner_ZF__c=pri.Partner_ZF__c;
        newHolder.Partner_ZF_Code__c=pri.Partner_ZF_Code__c;
        newHolder.Payer__c=pri.Payer__c;
        newHolder.Payer_Code__c=pri.Payer_Code__c;
        newHolder.Sales_District__c=pri.Sales_District__c;
        newHolder.Sales_District_Code__c=pri.Sales_District_Code__c;
        newHolder.State__c=pri.State__c;
        newHolder.State_Code__c=pri.State_Code__c;
        newHolder.Material_Group_1__c=pri.Material_Group_1__c;
        newHolder.Material_Group_1_Code__c=pri.Material_Group_1_Code__c;
        newHolder.Material_Group_5_Key__c=pri.Material_Group_5_Key__c;
        newHolder.Material_Group_5_Key_Code__c=pri.Material_Group_5_Key_Code__c;
        newHolder.Campaign__c=pri.Campaign__c;
        newHolder.Campaign_Code__c=pri.Campaign_Code__c;    

        return newHolder;
    }
    public static Sales_Prices__c createNonSAPPriceFromItem(Pricing_Request_Item__c pri1,Id RequestOwnerId)
    {
        Sales_Prices__c newRec=new Sales_Prices__c();
        newRec.Valid_From__c = pri1.New_Valid_From__c;
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
        //<SH20221014> START
        newREc.Ship_To_Country_Code__c = pri1.Ship_To_Country_Code__c;
        newREc.Ship_To_Country__c = pri1.Ship_To_Country__c;
        //<SH20221014> END
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
        newREc.Sales_Order_Type_Code__c=pri1.Sales_Order_Type_Code__c;
        //<SS20220826> START
        //newREc.Sales_Order_Item__c=pri1.Sales_Order_Item__c;
        //newREc.Sales_Order_Item_Code__c=pri1.Sales_Order_Item_Code__c;
        //<SS20220826> END

        newRec.Contract_Code__c=pri1.Contract_Code__c;
        newRec.Contract__c=pri1.Contract__c;
        newRec.Disc_Ref_No__c=pri1.Disc_Ref_No__c;
        newRec.Document_Currency_Code__c=pri1.Document_Currency_Code__c;
        newRec.Document_Currency__c=pri1.Document_Currency__c;
        newRec.FixValDate__c=pri1.FixValDate__c;
        newRec.Kcode__c=pri1.Kcode__c;
        newRec.Partner_ZF__c=pri1.Partner_ZF__c;
        newRec.Partner_ZF_Code__c=pri1.Partner_ZF_Code__c;
        newRec.Payer__c=pri1.Payer__c;
        newRec.Payer_Code__c=pri1.Payer_Code__c;    
        newRec.Sales_District__c=pri1.Sales_District__c;
        newRec.Sales_District_Code__c=pri1.Sales_District_Code__c;
        newRec.State__c=pri1.State__c;
        newRec.State_Code__c=pri1.State_Code__c;
        newRec.Campaign__c=pri1.Campaign__c;
        newRec.Material_Group_1__c=pri1.Material_Group_1__c;
        newRec.Material_Group_1_Code__c=pri1.Material_Group_1_Code__c;
        newRec.Material_Group_5_Key__c=pri1.Material_Group_5_Key__c;
        newRec.Material_Group_5_Key_Code__c=pri1.Material_Group_5_Key_Code__c;
        newRec.Campaign_Code__c=pri1.Campaign_Code__c;          
        /*population of KCSAP-try*/
        sObject sObj = (sObject)pri1 ; 
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
                /*leading hashes*/
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
                /*leading zeros*/
                String frb=String.valueOf(sobj.get('Profit_Center_Code__c'));
                newRec.KC_SAP__c =newRec.KC_SAP__c + frb;
                //System.debug('*****shipTo'+shipTo);
                /*end*/
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
            //<SH20221014> START
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
            //<SH20221014> END
            }
            if(('End Use').equalsIgnoreCase(kc)){
                newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('End_Use_Code__c'));
            }
            //<HL20140902> Added Pricing Request remove
            /*if(('Pricing Request').equalsIgnoreCase(kc))
                        {
                            newRec.KC_SAP__c =newRec.KC_SAP__c + String.valueOf(sobj.get('Pricing_Request__c'));
                        }*/
            //<MS20141122>
            if(('DiscRef').equalsIgnoreCase(kc) || (('Project Id').equalsIgnoreCase(kc)))
            { 
                /*leading zeros*/
                String projectId=String.valueOf(sobj.get('Disc_Ref__c'));
                if(projectId!=null)
                {
                    //project Id should be 12 digit
                    projectId = (projectId.leftPad(12)).replaceAll(' ', '0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + projectId;
                }
                /*end*/

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
            }//<SS20220826> START
            /*if(('Sales Order Item').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Sales_Order_Item_Code__c'));
            }//<SS20220826> END*/
            if(('Contract No.').equalsIgnoreCase(kc))
            {
                 /* <AJ20151209> Changes related to Contract No length to be 10 */
                 /*leading zeros*/
                String ContractNumber=String.valueOf(sobj.get('Contract_Code__c'));
                if(ContractNumber <> null) {
                    ContractNumber = (ContractNumber.leftPad(10)).replaceAll(' ', '0');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + ContractNumber;
                }
                /*end*/
                //newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Contract_Code__c'));

            }
            if(('Disc Ref No').equalsIgnoreCase(kc)){

                String DRCode = String.valueOf(sobj.get('Disc_Ref_No__c'));
                if(DRCode<>null)
                {
                    DRCode=(DRCode.rightpad(12)).replace(' ','#');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + DRCode;
                }
            }
            if(('Document Currency').equalsIgnoreCase(kc))
            {
                /* <AJ20151209> Changes related to Document Currency length to be 5 */
                /*trailing #*/
                String DocCurrencyCode=String.valueOf(sobj.get('Document_Currency_Code__c'));
                if(DocCurrencyCode <> null) {
                    DocCurrencyCode = (DocCurrencyCode.rightPad(5)).replaceAll(' ', '#');
                    newRec.KC_SAP__c =newRec.KC_SAP__c + DocCurrencyCode;
                }
                /*end*/
                //newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Document_Currency_Code__c'));

            }
            if(('FixValDate').equalsIgnoreCase(kc)){

                date fvd= date.valueof(sobj.get('FixValDate__c'));
                String day= String.valueof(fvd.day());
                if(day.length()==1)
                    day='0'+day;
                String Month=String.valueof(fvd.month());
                if(Month.length()==1)
                    Month='0'+Month;
                String year=String.valueof(fvd.year());

                newREc.KC_SAP__c =newREc.KC_SAP__c + year+Month+day;

            }
            if(('Kcode').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Kcode__c'));

            }
            if(('Partner ZF').equalsIgnoreCase(kc)){
                String PartnerZFCode=String.valueOf(sobj.get('Partner_ZF_Code__c'));
                if(PartnerZFCode<>null)
                {
                    PartnerZFCode=(PartnerZFCode.leftpad(10)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + PartnerZFCode;
                }

            }
            if(('Payer').equalsIgnoreCase(kc)){
                String payercode=String.valueOf(sobj.get('Payer_Code__c'));
                if(payercode<>null)
                {
                    payercode=(payercode.leftpad(10)).replace(' ','0');
                    newREc.KC_SAP__c =newREc.KC_SAP__c + payercode /*String.valueOf(sobj.get('Payer_Code__c'))*/;
                }
            }
            if(('Sales District').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Sales_District_Code__c'));

            }
            if(('State').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('State_Code__c'))+'#';

            }
            if(('Material Group 1').equalsIgnoreCase(kc)||('Matl grp1').equalsIgnoreCase(kc)||('MatGrp1').equalsIgnoreCase(kc)||('Matl grp 1').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Material_Group_1_Code__c'));

            }
            if(('Material Group 5 Key').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Material_Group_5_Key_Code__c'));

            }
            if(('Campaign').equalsIgnoreCase(kc)){
                newREc.KC_SAP__c =newREc.KC_SAP__c + String.valueOf(sobj.get('Campaign_Code__c'));

            }
            newRec.KC_SAP__c.trim();
        }
        return newRec;
    }   

}