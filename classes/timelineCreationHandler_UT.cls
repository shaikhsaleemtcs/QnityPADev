@isTest
public class timelineCreationHandler_UT {
    
    static testMethod void timelineCreationTestMethod() {
    
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
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
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.BU__c = 'BI AP Surfaces';
        sp.isPriceHolder__c = false;
        sp.Sales_Org_Code__c = 'A603';
        sp.Key_Combination__c = 'Sales Org./Material';
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate12;
        insert sp;
        
        ERP_Sales_Prices_SAP__c sp1=new ERP_Sales_Prices_SAP__c();
         sp1.BU__c = 'BI AP Surfaces';
        sp1.isPriceHolder__c = false;
        sp1.Sales_Org_Code__c = 'A603';
        sp1.Key_Combination__c = 'Sales Org./Material';
        sp1.Price_Holder__c = sp2.id;
        sp1.Valid_from__c = myDate1;
         sp1.Valid_to__c =myDate13;
        insert sp1;
        
        
        ERP_Export_to_SAP__c v =new ERP_Export_to_SAP__c();
        v.isPriceHolder__c=false;
        v.Sales_Org_Code__c='A603';
        v.Key_Combination__c='Sales Org./Material';
        v.ERP_Sales_Prices_SAP_Holder__c = sp.Id;
        Date myDate2 = date.newinstance(2014, 6, 1);
        Date myDate21 = date.newinstance(2014, 6, 1);
        v.Valid_from__c = myDate1;
         v.Valid_to__c =myDate2;
        insert v;
        system.debug('decut'+v.id);
        
         ERP_Export_to_SAP__c v1 =new ERP_Export_to_SAP__c();
        v1.isPriceHolder__c=false;
        v1.Sales_Org_Code__c='A603';
        v1.Key_Combination__c='Sales Org./Material';
        v1.ERP_Sales_Prices_SAP_Holder__c = sp1.Id;
        
        v1.Valid_from__c = myDate1;
         v1.Valid_to__c =myDate2;
        insert v1;
     
        ERP_Export_to_SAP__c es0 = new ERP_Export_to_SAP__c();
        es0.Sales_Org_Code__c = 'A603';
        es0.Key_Combination__c = 'Sales Org./Material';
        es0.ERP_Sales_Prices_SAP_Holder__c = sp2.id;
        es0.Valid_from__c = myDate1;
         es0.Valid_to__c =myDate21;
        insert es0;
     
    
    test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
        static testMethod void timelineCreationTestMethod2() {
    
    
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp3=new ERP_Sales_Prices_SAP__c();
   sp3.BU__c = 'BI AP Surfaces';
        sp3.isPriceHolder__c = true;
        sp3.Sales_Org_Code__c = 'A603';
        sp3.Key_Combination__c = 'Sales Org./Material';
        Date myDate1 = date.newinstance(2013, 1, 1);
        sp3.Valid_from__c = myDate1;
         Date myDate11 = date.newinstance(2014, 5, 1);
         Date myDate12 = date.newinstance(2014, 6, 1);
         Date myDate13 = date.newinstance(2014, 5, 1);
         sp3.Valid_to__c =myDate11;
        insert sp3;
        
        ERP_Sales_Prices_SAP__c sp4=new ERP_Sales_Prices_SAP__c();
        sp4.BU__c = 'BI AP Surfaces';
        sp4.isPriceHolder__c = false;
        sp4.Sales_Org_Code__c = 'A603';
        sp4.Key_Combination__c = 'Sales Org./Material';
        sp4.Price_Holder__c = sp3.id;
        sp4.Valid_from__c = myDate1;
         sp4.Valid_to__c =myDate12;
        insert sp4;
        
        ERP_Sales_Prices_SAP__c sp5=new ERP_Sales_Prices_SAP__c();
         sp5.BU__c = 'BI AP Surfaces';
        sp5.isPriceHolder__c = false;
        sp5.Sales_Org_Code__c = 'A603';
        sp5.Key_Combination__c = 'Sales Org./Material';
        sp5.Price_Holder__c = sp3.id;
        sp5.Valid_from__c = myDate1;
         sp5.Valid_to__c =myDate13;
        insert sp5;
  
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
       static testMethod void timelineCreationTestMethod3() {
        
   PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 1, 1);
        sp2.Valid_from__c = myDate1;
         Date myDate11 = date.newinstance(2014, 5, 1);
         Date myDate12 = date.newinstance(2014, 5, 1);
         sp2.Valid_to__c =myDate11;
        insert sp2;
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate12;
        insert sp;
        
       
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
      static testMethod void timelineCreationTestMethod4() {
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2014, 1, 1);
       
         Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 5, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
    
    static testMethod void timelineCreationTestMethod5() {
        
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 9, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 4, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
    
    static testMethod void timelineCreationTestMethod6() {
        
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 9, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }static testMethod void timelineCreationTestMethod8() {
        
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 4, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 2, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
    static testMethod void timelineCreationTestMethod9() {
        
    PAUtil.insertProfileRecordId();
    ERP_Sales_Prices_SAP__c sp2=new ERP_Sales_Prices_SAP__c();
      sp2.isPriceHolder__c = true;
         Date myDate1 = date.newinstance(2013, 4, 1);
             Date myDate11 = date.newinstance(2013, 5, 1);
         Date myDate12 = date.newinstance(2014, 1, 1);
         Date myDate13 = date.newinstance(2014, 1, 1);
          sp2.Valid_from__c = myDate11;
         sp2.Valid_to__c =myDate12;
        insert sp2;
        
        ERP_Sales_Prices_SAP__c sp=new ERP_Sales_Prices_SAP__c();
        sp.isPriceHolder__c = false;
        sp.Price_Holder__c = sp2.id;
        sp.Valid_from__c = myDate1;
         sp.Valid_to__c =myDate13;
        insert sp;
        
       
     test.startTest();
    batchClassforSAPSync bc = new batchClassforSAPSync();
    Database.executeBatch(bc, 200);
    test.stopTest();
        
    }
}