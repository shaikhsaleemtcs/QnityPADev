/**
* 
*/
@isTest
private class PAScalePrice_UT {
    
    static testMethod void myUnitTest() {
        
        PAUtil.insertProfileRecordId();
        
        ERP_Sales_Prices_SAP__c erpSalesPrice = new ERP_Sales_Prices_SAP__c();
        
        list<ERP_Sales_Prices_SAP__c> listIds = new list<ERP_Sales_Prices_SAP__c>();
        listIds=[select id from ERP_Sales_Prices_SAP__c where BU__c = 'BI AP Surfaces'];
        
       /* PAScalePrice paScale = new PAScalePrice();
        if(listIds.size() > 0)
            paScale.sapId = '01pa0000001FO1t';
        //  paScale.sapId = string.valueOf(listIds[0].Id);
        else
            paScale.sapId = ''; */
        //  insert paScale.sapId;
        //    paScale.showScale();
        //  insert listIds.sapId;
        
        
               
        ERP_Sales_Prices_SAP__c erpSalesPricesSAP = new ERP_Sales_Prices_SAP__c();
        erpSalesPricesSAP.isPriceHolder__c = false;
        erpSalesPricesSAP.BU__c = 'BI AP Surfaces';
        //   erpSalesPricesSAP.Id = '01pa0000001FO1t';
        insert erpSalesPricesSAP;
         PAScalePrice pascalePrice = new PAScalePrice();
        pascalePrice.listOfPrices=erpSalesPricesSAP;
        pascalePrice.sapId = erpSalesPricesSAP.id;
        pascalePrice.showScale();
         pascalePrice.closeWindow();
        /*      if(paScale.showScale == true){
//paScale.showScale();
}
else
paScale.showScale();*/
        //  paScale.showScale();
        /*      
List<sObject> ls = Test.loadData(ERP_Sales_Prices_SAP__c.sObjectType, 'paScalePrice');
ERP_Sales_Prices_SAP__c req = (ERP_Sales_Prices_SAP__c)ls[0];
upsert req;

ERP_Sales_Prices_SAP__c erpSalesPricesSAP1 = new ERP_Sales_Prices_SAP__c();
erpSalesPricesSAP1.isPriceHolder__c = false;
erpSalesPricesSAP1.BU__c = 'BI AP Surfaces';
//  erpSalesPricesSAP1.Id = listIds[0].Id;
insert erpSalesPricesSAP1;


list<sObject> c=new list<ERP_Sales_Prices_SAP__c>();
c.add(erpSalesPricesSAP);
upsert c;*/
        // insert erpSalesPricesSAP;
        
    }
}