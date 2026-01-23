@isTest
public class AIAD_PricingRequestItem_UpdatePCKCNCS_UT
{
static testMethod void validatePriceTest()
{
    List<Pricing_Request__c> priReqList = new List<Pricing_Request__c>();
    Pricing_Request__c pricingReq1=new Pricing_Request__c();
    pricingReq1.BU__c = 'BI EMEA Surfaces';
    pricingReq1.Sales_Org_Code__c = 'A640';
    pricingReq1.Dist_Channel_Code__c = '10';
    pricingReq1.Division_Code__c = '02';
    pricingReq1.Pricing_Request_Type__c = 'Permanent';
    pricingReq1.Request_Approval_Status__c = 'Draft';
    pricingReq1.Request_Type__c = 'Customer Specific';
    pricingReq1.Customer_Specific__c = true;
    
    priReqList.add(pricingReq1);
    insert pricingReq1;
    
    //List of Pricing request Items
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580
    Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
    pricRequestItem1.CURRENCYISOCODE = 'USD';
    pricRequestItem1.PRICING_REQUEST__C = pricingReq1.Id;
    pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem1.COUNTRY__C = 'Germany';
    pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
    pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem1.DIVISION_CODE__C = '2';
    pricRequestItem1.DIVISION__C = 'GSD Standard';
    pricRequestItem1.GAP__C = false;
    pricRequestItem1.KEY_COMBINATION_CODE__C = 'A580';
    pricRequestItem1.KEY_COMBINATION__C = 'Sales Area/Sold to/Material';
    pricRequestItem1.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem1.NEW_PER__C = 1;
    pricRequestItem1.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem1.PER__C = 1;
    pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem1.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem1.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem1.Rate__c = '10';
    pricRequestItem1.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem1.SAP_CLIENT_ID__C = '510';
    pricRequestItem1.SALES_ORG_CODE__C = 'A640';
    pricRequestItem1.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem1.SCALED_PRICE_FLAG__C = true;
    pricRequestItem1.SOLD_TO_CODE__C = '55470156';
    pricRequestItem1.UNIT__C = '%';
    pricRequestItem1.UOM__C = 'EA';
    pricRequestItem1.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem1.VALID_TO__C = Date.newInstance(2013, 1,15);
    pricRequestItem1.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
    pricRequestItem1.NEW_VALID_TO__C = Date.newInstance(2013, 1,18);
    pricRequestItem1.EDIT__C = false;
    pricRequestItem1.NEW__C = false;
    pricRequestItem1.SCALE_BASIS__C = 'Quantity';
    pricRequestItem1.SCALE_TYPE__C = 'From';
    
    
    pricingReqItemToUpdate.add(pricRequestItem1);
    
    insert pricingReqItemToUpdate;
    
    delete pricingReqItemToUpdate;
}

static testMethod void validatePriceTest2()
{
    List<Pricing_Request__c> priReqList = new List<Pricing_Request__c>();
    
    Pricing_Request__c pricingReq2=new Pricing_Request__c();
    pricingReq2.BU__c = 'BI EMEA Surfaces';
    pricingReq2.Sales_Org_Code__c = 'A650';
    pricingReq2.Dist_Channel_Code__c = '10';
    pricingReq2.Division_Code__c = '02';
    pricingReq2.Pricing_Request_Type__c = 'Permanent';
    pricingReq2.Request_Approval_Status__c = 'Draft';
    pricingReq2.Request_Type__c = 'Non Customer Specific';
    pricingReq2.Customer_Specific__c = false;
    
    priReqList.add(pricingReq2);
    insert pricingReq2;
    
    system.debug('dec1'+pricingReq2.id);
    
    //List of Pricing request Items
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580
    Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
    
    
    Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
    pricRequestItem2.CURRENCYISOCODE = 'USD';
    pricRequestItem2.PRICING_REQUEST__C = pricingReq2.Id;
    pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem2.COUNTRY__C = 'Germany';
    pricRequestItem2.CUSTOMER_SPECIFIC__C = false;
    pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem2.DIVISION_CODE__C = '02';
    pricRequestItem2.DIVISION__C = 'GSD Standard';
    pricRequestItem2.GAP__C = false;
    pricRequestItem2.KEY_COMBINATION_CODE__C = 'A590';
    pricRequestItem2.KEY_COMBINATION__C = 'Sales Area/Material';
    pricRequestItem2.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem2.NEW_PER__C = 1;
    pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem2.PER__C = 1;
    pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem2.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem2.Rate__c = '10';
    pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem2.SAP_CLIENT_ID__C = '510';
    pricRequestItem2.SALES_ORG_CODE__C = 'A650';
    pricRequestItem2.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem2.SCALED_PRICE_FLAG__C = true;
    pricRequestItem2.UNIT__C = '%';
    pricRequestItem2.UOM__C = 'EA';
    pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem2.VALID_TO__C = Date.newInstance(2013, 1,15);
    pricRequestItem2.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
    pricRequestItem2.NEW_VALID_TO__C = Date.newInstance(2013, 1,18);
    pricRequestItem2.EDIT__C = false;
    pricRequestItem2.NEW__C = false;
    pricRequestItem2.SCALE_BASIS__C = 'Quantity';
    pricRequestItem2.SCALE_TYPE__C = 'From';
    
    pricingReqItemToUpdate.add(pricRequestItem2);
    insert pricingReqItemToUpdate;
    
    delete pricingReqItemToUpdate;
}
static testMethod void validatePriceTest3()
{
    List<Pricing_Request__c> priReqList = new List<Pricing_Request__c>();
    
    Pricing_Request__c pricingReq3=new Pricing_Request__c();
    pricingReq3.BU__c = 'BI EMEA Surfaces';
    pricingReq3.Sales_Org_Code__c = 'A650';
    pricingReq3.Dist_Channel_Code__c = '10';
    pricingReq3.Division_Code__c = '02';
    pricingReq3.Pricing_Request_Type__c = 'Massive';
    pricingReq3.Request_Approval_Status__c = 'Draft';
    pricingReq3.Request_Type__c = 'Import';
    pricingReq3.Customer_Specific__c = false;
    
    priReqList.add(pricingReq3);
    insert pricingReq3;
    
    system.debug('dec1'+pricingReq3.id);
    
    //List of Pricing request Items
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580
    
    Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
    pricRequestItem3.CURRENCYISOCODE = 'USD';
    pricRequestItem3.PRICING_REQUEST__C = pricingReq3.Id;
    pricRequestItem3.APPROVAL_STATUS__C = 'Draft';
    pricRequestItem3.BELOW_CURRENT_FLAG__C = false;
    pricRequestItem3.BELOW_FLOOR_FLAG__C = false;
    pricRequestItem3.BELOW_REFERENCE_FLAG__C = false;
    pricRequestItem3.COUNTRY__C = 'Germany';
    pricRequestItem3.CUSTOMER_SPECIFIC__C = false;
    pricRequestItem3.DIST_CHANNEL_CODE__C = '10';
    pricRequestItem3.DIST_CHANNEL__C = 'DuPont Std';
    pricRequestItem3.DIVISION_CODE__C = '02';
    pricRequestItem3.DIVISION__C = 'GSD Standard';
    pricRequestItem3.GAP__C = false;
    pricRequestItem3.KEY_COMBINATION_CODE__C = 'A590';
    pricRequestItem3.KEY_COMBINATION__C = 'Sales Area/Material';
    pricRequestItem3.MATERIAL_CODE__C = 'D11992510';
    pricRequestItem3.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
    pricRequestItem3.NEW_PER__C = 1;
    pricRequestItem3.NON_COMMERCIAL_PRODUCTS__C = false;
    pricRequestItem3.PER__C = 1;
    pricRequestItem3.PRICING_CONDITION_CODE__C = 'ZPSE';
    pricRequestItem3.PRICING_CONDITION__C = 'Order volume disc shapes';
    pricRequestItem3.PRICING_REQUEST_TYPE__C = 'Permanent';
    pricRequestItem3.Rate__c = '10';
    pricRequestItem3.SAP_APPLICATION_ID__C = 'V';
    pricRequestItem3.SAP_CLIENT_ID__C = '510';
    pricRequestItem3.SALES_ORG_CODE__C = 'A650';
    pricRequestItem3.SALES_ORG__C = 'Surf Dup Disa 3640';
    pricRequestItem3.SCALED_PRICE_FLAG__C = true;
    pricRequestItem3.UNIT__C = '%';
    pricRequestItem3.UOM__C = 'EA';
    pricRequestItem3.VALID_FROM__C = Date.newInstance(2013, 1,1);
    pricRequestItem3.VALID_TO__C = Date.newInstance(2013, 1,15);
    pricRequestItem3.NEW_VALID_FROM__C = Date.newInstance(2012, 12,22);
    pricRequestItem3.NEW_VALID_TO__C = Date.newInstance(2013, 1,18);
    pricRequestItem3.EDIT__C = false;
    pricRequestItem3.NEW__C = false;
    pricRequestItem3.SCALE_BASIS__C = 'Quantity';
    pricRequestItem3.SCALE_TYPE__C = 'From';
    
    pricingReqItemToUpdate.add(pricRequestItem3);
    insert pricingReqItemToUpdate;
    
    delete pricingReqItemToUpdate;
}
static testMethod void validatePriceTest4()
{
    List<Pricing_Request__c> priReqList = new List<Pricing_Request__c>();
    
    Pricing_Request__c pricingReq4=new Pricing_Request__c();
    pricingReq4.BU__c = 'BI EMEA Surfaces';
    pricingReq4.Sales_Org_Code__c = 'A650';
    pricingReq4.Dist_Channel_Code__c = '10';
    pricingReq4.Division_Code__c = '02';
    pricingReq4.Pricing_Request_Type__c = 'Floor';
    pricingReq4.Request_Approval_Status__c = 'Draft';
    pricingReq4.Request_Type__c = 'Floor';
    pricingReq4.Customer_Specific__c = false;
    
    priReqList.add(pricingReq4);
    insert pricingReq4;
    
    system.debug('dec1'+pricingReq4.id);
    
    //List of Pricing request Items
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580
    
    Pricing_Request_Item__c pricRequestItem4 = new Pricing_Request_Item__c();
    pricRequestItem4.CURRENCYISOCODE = 'USD';
    pricRequestItem4.PRICING_REQUEST__C = pricingReq4.Id;
    
    
    pricingReqItemToUpdate.add(pricRequestItem4);
    insert pricingReqItemToUpdate;
    
    delete pricingReqItemToUpdate;
}
static testMethod void validatePriceTest5()
{
    List<Pricing_Request__c> priReqList = new List<Pricing_Request__c>();
    
    Pricing_Request__c pricingReq5=new Pricing_Request__c();
    pricingReq5.BU__c = 'BI EMEA Surfaces';
    pricingReq5.Sales_Org_Code__c = 'A650';
    pricingReq5.Dist_Channel_Code__c = '10';
    pricingReq5.Division_Code__c = '02';
    pricingReq5.Pricing_Request_Type__c = 'Floor';
    pricingReq5.Request_Approval_Status__c = 'Draft';
    pricingReq5.Request_Type__c = 'Floor';
    pricingReq5.Customer_Specific__c = false;
    
    priReqList.add(pricingReq5);
    insert pricingReq5;
    
    system.debug('dec1'+pricingReq5.id);
    
    //List of Pricing request Items
    List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
    //Pricing Request Item 1- PC-ZPSE KC -A580
    
    Pricing_Request_Item__c pricRequestItem5 = new Pricing_Request_Item__c();
    pricRequestItem5.CURRENCYISOCODE = 'USD';
    pricRequestItem5.PRICING_REQUEST__C = pricingReq5.Id;
    
    
    pricingReqItemToUpdate.add(pricRequestItem5);
    insert pricingReqItemToUpdate;
    
    delete pricingReqItemToUpdate;
} 
}