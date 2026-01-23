@isTest
Public class batchClassForNonSAPSync_UT {
    static testMethod void batchClassForNonSAPSyncTestMethod() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
   sp2.BU__c = 'BI AP Surfaces';
        sp2.isPriceHolder__c = true;
        sp2.Sales_Org_Code__c = 'A603';
        sp2.Key_Combination__c = 'Sales Org./Material';
        Date myDate1 = date.newinstance(2013, 1, 1);
        sp2.Valid_from__c = myDate1;
         Date myDate11 = date.newinstance(2014, 6, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 7, 1);
         sp2.Valid_to__c =myDate11;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.BU__c = 'BI AP Surfaces';
        sp.isPriceHolder__c = false;
        sp.Sales_Org_Code__c = 'A603';
        sp.Key_Combination__c = 'Sales Org./Material';
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate12;
        insert sp;
        
        Sales_Prices__c sp1=new Sales_Prices__c();
         sp1.BU__c = 'BI AP Surfaces';
        sp1.isPriceHolder__c = false;
        sp1.Sales_Org_Code__c = 'A603';
        sp1.Key_Combination__c = 'Sales Org./Material';
        sp1.Price_Holder__c = sp2.id;
        sp1.Valid_from__c = myDate1;
         sp1.Valid_to__c =myDate13;
        insert sp1;
        
        test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
        static testMethod void batchClassforNonSAPSyncTestMethod2() {
    
    
    Sales_Prices__c sp2=new Sales_Prices__c();
   sp2.BU__c = 'BI AP Surfaces';
        sp2.isPriceHolder__c = true;
        sp2.Sales_Org_Code__c = 'A603';
        sp2.Key_Combination__c = 'Sales Org./Material';
        Date myDate1 = date.newinstance(2013, 1, 1);
        sp2.Valid_from__c = myDate1;
         Date myDate11 = date.newinstance(2014, 5, 1);
         Date myDate12 = date.newinstance(2014, 6, 1);
         Date myDate13 = date.newinstance(2014, 5, 1);
         sp2.Valid_to__c =myDate11;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.BU__c = 'BI AP Surfaces';
        sp.isPriceHolder__c = false;
        sp.Sales_Org_Code__c = 'A603';
        sp.Key_Combination__c = 'Sales Org./Material';
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate12;
        insert sp;
        
        Sales_Prices__c sp1=new Sales_Prices__c();
         sp1.BU__c = 'BI AP Surfaces';
        sp1.isPriceHolder__c = false;
        sp1.Sales_Org_Code__c = 'A603';
        sp1.Key_Combination__c = 'Sales Org./Material';
        sp1.Price_Holder__c = sp2.id;
        sp1.Valid_from__c = myDate1;
         sp1.Valid_to__c =myDate13;
        insert sp1;
  
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
       static testMethod void batchClassforNonSAPSyncTestMethod3() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 1, 1);
        sp2.Valid_from__c = myDate1;
         Date myDate11 = date.newinstance(2014, 5, 1);
         Date myDate12 = date.newinstance(2014, 5, 1);
         sp2.Valid_to__c =myDate11;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate12;
        insert sp;
        
       
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
      static testMethod void batchClassforNonSAPSyncTestMethod4() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2014, 1, 1);
       
         Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 5, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
    
    static testMethod void batchClassforNonSAPSyncTestMethod5() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 9, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 4, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
    
    static testMethod void batchClassforNonSAPSyncTestMethod6() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 9, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }static testMethod void batchClassforNonSAPSyncTestMethod8() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 4, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 2, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
    static testMethod void batchClassforNonSAPSyncTestMethod9() {
        
    Sales_Prices__c sp2=new Sales_Prices__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 4, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        Sales_Prices__c sp=new Sales_Prices__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforNonSAPSync bc = new batchClassforNonSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
}