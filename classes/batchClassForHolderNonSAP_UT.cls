@isTest
public class batchClassForHolderNonSAP_UT {
    static testmethod void batchClassForHolderNonSAPTestMethod() {
        Sales_Prices__c sp = new Sales_Prices__c();
        sp.BU__c = 'BI AP Surfaces';
        sp.isPriceHolder__c = false;
        sp.Sales_Org_Code__c = 'A603';
        sp.Key_Combination__c = 'Sales Org./Material';
    
        Sales_Prices__c sp1 = new Sales_Prices__c();
        sp1.BU__c = 'BI AP Surfaces';
        sp1.isPriceHolder__c = false;
        sp1.Sales_Org_Code__c = 'A603';
        sp1.Key_Combination__c = 'Sales Org./Material';
        
    list<sObject> s =new list<Sales_Prices__c>();
    s.add(sp);
    s.add(sp1);
    
    upsert s;
    test.startTest();
    batchClassForHolderNonSAP bc = new batchClassForHolderNonSAP();
    Database.executeBatch(bc, 200);
    test.stopTest();
    }
}