@isTest 
private class batchClassForUpdatePRItem_UT {

/****PKH

  static testMethod void batchClassForUpdateerpSAPTestMethod() {
    
    PAUtil.insertProfileRecordId();

     ERP_Sales_Prices_SAP__c v =new ERP_Sales_Prices_SAP__c();
     
     v.isPriceHolder__c=false;
     //v.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group';
     v.Key_Combination__c='Sales Org./Material';
    v.Sales_Org_Code__c='D660';
    v.BU__c = 'BI AP Surfaces';
    v.Customer_Hierarchy_Code__c = '123456';
    v.Customer_Hierarchy__c = 'cust hierarchy';
    v.Variant_Code__c = '1234';
    v.Variant__c='test value';
    v.Contract_Code__c = '1234';
    v.Contract__c='test value';
    v.Sales_Order_Type_Code__c = '1234';
    v.Sales_Order_Type__c='test value';
    v.Material_Group_5_Key_Code__c = '1234';
    v.Material_Group_5_Key__c='test value';
    v.Material_Price_Group_Code__c = '1234';
    v.Material_Price_Group__c='test value';
    v.Customer_Price_Group_Code__c = '1234';
    v.Customer_Price_Group__c='test value';
    v.Terms_Of_Payment_Code__c = '1234';
    v.Terms_Of_Payment__c = 'terms';
    v.Incoterms_1_Code__c = '1234';
    v.Incoterms1__c='test value';
    v.Price_List_Type_Code__c = '1234';
    v.Price_List_Type__c='test value';
    v.Sales_Office_Code__c = '1234';
    v.Sales_Office__c='test value';
    v.Sales_District_Code__c = '1234';
    v.Sales_District__c='test value';
    v.Market_Segment_Code__c ='1234';
    v.Market_Segment__c='test value';
    v.End_Use_Code__c = '1234';
    v.End_Use__c='test value';
    v.Price_Ref_Partner_Code__c = '1234';
    v.Price_Ref_Partner__c = '1233';
    v.Project__c = '1241';
    v.KCode__c = '1234';
    v.Campaign_Code__c = '1234';
    v.Campaign__c='test value';
    v.State_Code__c = '1234';
    v.State__c='test value';
    v.Profit_Center__c = 'test';
    v.Profit_Center_Code__c = '1234';
    v.End_User_Code__c = '1234';
    v.End_User__c = '2352345';
    v.Customer_Hierarchy_Code__c = '1234';
    v.Customer_Hierarchy__c = 'test';
    v.ShipTo__c ='23525';
    v.ShipTo_Code__c='test value';
    v.Material_Group_1_Code__c = '1234';
    v.Material_Group_1__c='test value';
    
     ERP_Sales_Prices_SAP__c v1 =new ERP_Sales_Prices_SAP__c();
     
     v1.isPriceHolder__c=false;
     v1.Sales_Org_Code__c='D660';
     //v1.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
     v1.Key_Combination__c='Sales Org./Material';
    v1.BU__c = 'BI AP Surfaces';
    v1.markfordeletion__c = false;
    
    
    
   list<ERP_Sales_Prices_SAP__c> c=new list<ERP_Sales_Prices_SAP__c>();
   c.add(v);
   c.add(v1);

     insert c;
  

   test.startTest();
    batchClassForUpdateerpSalesPrice bc=new batchClassForUpdateerpSalesPrice();
   Database.executeBatch(bc); 
     test.stopTest(); 
  
  }
    
  
 PKH***/ 

 // <SS20220826> removed commented below method to run 

  static testMethod void batchClassForUpdatePRItemTestMethod() {
    
    PAUtil.insertProfileRecordId();

     Pricing_Request__c pricingRequest = new Pricing_Request__c();
        pricingRequest.Bu__c = 'BI_EMEA_Surfaces';
        pricingRequest.Request_Approval_Status__c = 'Submitted';  
        
        insert pricingRequest;           
     Pricing_Request_Item__c v =new Pricing_Request_Item__c();
    v.Pricing_Request__c = pricingRequest.id; 
    v.Key_Combination__c='Sales Org./Material';
    v.Sales_Org_Code__c='D660';
    v.Approval_status__c = 'Submitted';
    v.Customer_Hierarchy_Code__c = '123456';
    v.Customer_Hierarchy__c = 'cust hierarchy';
    v.Variant_Code__c = '1234';
    v.Variant__c='test value';
    v.Contract_Code__c = '1234';
    v.Contract__c='test value';
    v.Sales_Order_Type_Code__c = '1234';
    v.Sales_Order_Type__c='test value';
    v.Sales_Order_Item__c = '1222';      
    v.Sales_Order_Item_Code__c ='test value';
   // <SS20230501> - START
    v.Value_Center__c = 'test value';
    v.Value_Center_Code__c ='1222';
    v.Ext_Matl_Grp__c ='test value';
    v.Ext_Matl_Grp_Code__c ='1222';
    v.Material_group_2__c='test value';
    v.Material_group_2_Code__c ='1222';
    v.Price_Zone__c ='test value';
    v.Price_Zone_Code__c ='1222';
    v.Shipping_Condition__c ='test value';
    v.Shipping_Condition_Code__c ='1234';
    // <SS20230501> - End
    v.Material_Group_5_Key_Code__c = '1234';
    v.Material_Group_5_Key__c='test value';
    v.Material_Price_Group_Code__c = '1234';
    v.Material_Price_Group__c='test value';
    v.Customer_Price_Group_Code__c = '1234';
    v.Customer_Price_Group__c='test value';
    v.Terms_Of_Payment_Code__c = '1234';
    v.Terms_Of_Payment__c = 'terms';
    v.Incoterms_Code__c = '1234';
    v.Inco_terms__c='test value';
    v.Price_List_Type_Code__c = '1234';
    v.Price_List_Type__c='test value';
    v.Sales_Office_Code__c = '1234';
    v.Sales_Office__c='test value';
    v.Sales_District_Code__c = '1234';
    v.Sales_District__c='test value';
    v.Market_Segment_Code__c ='1234';
    v.Market_Segment__c='test value';
    v.End_Use_Code__c = '1234';
    v.End_Use__c='test value';
    v.Price_Ref_Partner_Code__c = '1234';
    v.Price_Ref_Partner__c = '1233';
    v.Project__c = '1241';
    v.KCode__c = '1234';
    v.Campaign_Code__c = '1234';
    v.Campaign__c='test value';
    v.State_Code__c = '1234';
    v.State__c='test value';
    v.Profit_Center__c = 'test';
    v.Profit_Center_Code__c = '1234';
    v.End_User_Code__c = '1234';
    v.End_User__c = '2352345';
    v.Customer_Hierarchy_Code__c = '1234';
    v.Customer_Hierarchy__c = 'test';
    v.ShipTo__c ='23525';
    v.ShipTo_Code__c='test value';
    v.Material_Group_1_Code__c = '1234';
    v.Material_Group_1__c='test value';
    
     Pricing_Request_Item__c v1 =new Pricing_Request_Item__c();
     
     
     v1.Sales_Org_Code__c='D660';
     //v1.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6';
     v1.Key_Combination__c='Sales Org./Material';
    v1.Pricing_Request__c = pricingRequest.id; 
    v1.Approval_status__c = 'Submitted';
    
    
    
   list<Pricing_Request_Item__c> c=new list<Pricing_Request_Item__c>();
   c.add(v);
   c.add(v1);

     insert c;
  

   test.startTest();
    batchClassForUpdatePRItem bc=new batchClassForUpdatePRItem();
   Database.executeBatch(bc); 
     test.stopTest(); 
  
  }
    
  
}