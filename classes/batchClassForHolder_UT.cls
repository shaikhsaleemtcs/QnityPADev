@isTest 
private class batchClassForHolder_UT {

    static testMethod void batchClassForHolderTestMethod() {
        
        PAUtil.insertProfileRecordId();
        // 12/30/2016 - Merge&Spin - Create dummy price holder record and assign it to price records.         
        ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c();
        holderRecord.isPriceHolder__c=true;
        insert holderRecord;
        
        ERP_Sales_Prices_SAP__c v =new ERP_Sales_Prices_SAP__c();
        
        v.isPriceHolder__c=false;
        //v.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group';
        v.Key_Combination__c='Sales Org./Material';
        v.Sales_Org_Code__c='D660';
        v.BU__c = 'BI AP Surfaces';
        v.Price_Holder__c =System.label.PriceHolder_Id_for_batch; //<SS20220826> to get price holder id from label
       // v.Price_Holder__c =holderRecord.id;
        v.Approved_Date__c = system.today(); //
        
        ERP_Sales_Prices_SAP__c v1 =new ERP_Sales_Prices_SAP__c();
        
        v1.isPriceHolder__c=false;
        v1.Sales_Org_Code__c='D660';
        //v1.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group';
        v1.Key_Combination__c='Sales Org./Material';
        v1.BU__c = 'BI AP Surfaces';
        // v.Price_Holder__c =holderRecord.id;
        v1.Price_Holder__c =System.label.PriceHolder_Id_for_batch; //<SS20220826> to get price holder id from label
        v1.Approved_Date__c = system.today(); //
        
     list<sObject> c=new list<ERP_Sales_Prices_SAP__c>();
     c.add(v);
     c.add(v1);

       
     insert c;
    

     test.startTest();
     batchClassForHolder bc=new batchClassForHolder();
     Database.executeBatch(bc, 200); 
     test.stopTest();    
    }
}