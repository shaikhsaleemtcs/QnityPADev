trigger Trig_calculateNetPrice on NPC_Request__c (after update) {
    Set<Id> npcReqIdSet=new Set<Id>();
    Set<Id> npcReqParentIdSet=new Set<Id>();
    System.debug('***batch size'+Trigger.New.size());
    for(NPC_Request__c npcReq : Trigger.New)
    {    
        if(npcReq.Count_of_NPC_Responses__c==1 && Trigger.oldMap.get(npcReq.Id).Count_of_NPC_Responses__c!=1 && npcReq.Status__c=='Active' && npcReq.isSynchronous__c==false)
        {
            npcReqIdSet.add(npcReq.Id);
            npcReqParentIdSet.add(npcReq.Pricing_Request_Item__c);
        }          
    }
    System.debug('**in trigger'+npcReqIdSet);
    if(npcReqIdSet.size()!=0)
    {
        System.debug('**method call'); 
        List<Pricing_Request_Item__c> priList= [SELECT Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,ERP_Pricing_Procedure__c,Market_Segment__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,Scale_UoM_Scale_Unit__c,Key_Combination_SFDC__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,
                                                Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,BU__c,Pricing_Request__r.Dist_Channel_Code__c,Pricing_Request__r.Division_Code__c,Pricing_Request__r.Landing_Cost__c,
                                                Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c,
                                                ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,
                                                ScaleRate10__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
                                                Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,
                                                Sales_Office_Code__c, SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,
                                                Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, Profit_Center__c, Profit_Center_Code__c,
                                                Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, Pricing_Request_Type__c, Pricing_Condition__c,
                                                Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,
                                                PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c,
                                                PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
                                                Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate,
                                                Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c,
                                                Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,
                                                Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Customer_Specific__c, Customer_Price_Group__c,
                                                Customer_Price_Group_Code__c, Currency__c, CreatedDate, CreatedById,  Below_Reference_Flag__c, Below_Floor_Flag__c,
                                                Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
                                                Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,Gap_Pricing_Request_Item__r.New_Rate__c,
                                                Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,Gap_Pricing_Request_Item__r.Rate__c,
                                                Gap_Pricing_Request_Item__r.Per__c,ERP_Pricing_Procedure__r.Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c,Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,
                                                Integration_Error_Message__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c, Material_Group_1__c, Material_Group_1_Code__c,Kcode__c, Char_Name__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c FROM PRicing_Request_item__c where Id=:npcReqParentIdSet];                                
        PACalculateNetPrice npc=new PACalculateNetPrice();
        try
        {
            npc.calculateNPC(npcReqIdSet,null,priList,false); 
        }
        catch(Exception e)
        {
            Pricing_Request_Item__c pri=priList[0];
            String excptn=e.getMessage()+e.getLineNumber();
            pri.Integration_Error_Message__c=excptn;
            update pri;    
        }    
    } 
} 
//req:calculate Net price and store it in a field