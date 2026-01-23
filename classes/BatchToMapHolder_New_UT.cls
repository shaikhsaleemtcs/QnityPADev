@isTest 
private class BatchToMapHolder_New_UT{
    static testMethod void batchClassForHolderTestMethod() {
        
        ProfileRecordIds__c pr = new ProfileRecordIds__c (Name='System Administrator', RecordId__c='00e30000001mVQC');
                  insert pr;
        ERP_Sales_Prices_SAP__c v =new ERP_Sales_Prices_SAP__c();
        
        v.isPriceHolder__c=false;
        //v.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group';
        v.Key_Combination__c='Sales Org./Material';
        v.Sales_Org_Code__c='D660';
        v.BU__c = 'BI AP Surfaces';
        v.Price_Holder__c =System.label.PriceHolder_Id_for_batch;
        
        ERP_Sales_Prices_SAP__c v1 =new ERP_Sales_Prices_SAP__c();
        
        v1.isPriceHolder__c=false;
        v1.Sales_Org_Code__c='D660';
        //v1.Key_Combination__c='Sales Org./Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6/Material Price Group';
        v1.Key_Combination__c='Sales Org./Material';
        v1.BU__c = 'BI AP Surfaces';
        v1.Price_Holder__c =System.label.PriceHolder_Id_for_batch;
        
     list<sObject> c=new list<ERP_Sales_Prices_SAP__c>();
     c.add(v);
     c.add(v1);

     upsert c;
    

     test.startTest();
     BatchToMapHolder_New bc=new BatchToMapHolder_New();
     Database.executeBatch(bc, 200); 
     test.stopTest(); 
    
    }

}