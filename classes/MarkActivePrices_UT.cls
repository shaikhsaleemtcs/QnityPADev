@isTest
private class MarkActivePrices_UT{

    static testMethod void MarkActivePricesTestMethod() {

        Test.startTest();
        //Price Holder1 creation
        ERP_Sales_Prices_SAP__c s=new ERP_Sales_Prices_SAP__c();
        Date d = Date.today();
        s.Valid_To__c=d.addDays(21);
        s.Customer_Specific__c=true;
        s.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s.Sold_To_Code__c='97002139';
        s.Key_Combination_Code__c='A773';
        s.Sales_Org_Code__c='A293';
        s.BU__c='DPT EMEA';
        s.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s.PH1_Code__c='T3';
        s.PH2_Code__c='MA';
        s.PH3_Code__c='PP';
        s.PH4_Code__c='PP';
        s.PH5_Code__c='02';
        s.PH6_Code__c='ZZ';
        s.PH7_Code__c='P5';
        s.PH8_Code__c='5U';
        s.PH9_Code__c='IB';
        Date myDate = date.newinstance(2013, 1, 1);
        s.Valid_From__c=d;
        s.isPriceHolder__c=true;
        s.Pricing_Condition_Code__c = 'ZPRI';
        s.markForDeletion__c=false;
        s.BU__c='DPT EMEA';
                
        insert s;
    
        //Price Holder1 creation
        ERP_Sales_Prices_SAP__c ps=new ERP_Sales_Prices_SAP__c();
        Date pd = Date.today();
        ps.Valid_To__c=pd.addDays(91);
        ps.Customer_Specific__c=true;
        ps.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        ps.Sold_To_Code__c='97002139';
        ps.Key_Combination_Code__c='A773';
        ps.Sales_Org_Code__c='A293';
        ps.BU__c='DPT EMEA';
        ps.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        ps.PH1_Code__c='T3';
        ps.PH2_Code__c='MA';
        ps.PH3_Code__c='PP';
        ps.PH4_Code__c='PP';
        ps.PH5_Code__c='02';
        ps.PH6_Code__c='ZZ';
        ps.PH7_Code__c='P5';
        ps.PH8_Code__c='5U';
        ps.PH9_Code__c='IB';
        //Date myDate = date.newinstance(2013, 1, 1);
        ps.Valid_From__c=pd.addDays(10);
        ps.isPriceHolder__c=true;
        ps.Pricing_Condition_Code__c = 'ZM07';
        ps.markForDeletion__c=false;
        insert ps;
    
        //Price Holder2 creation
        ERP_Sales_Prices_SAP__c ps1=new ERP_Sales_Prices_SAP__c();
        Date pd1 = Date.today();
        ps1.Valid_To__c=pd1.addDays(91);
        ps1.Customer_Specific__c=true;
        ps1.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        ps1.Sold_To_Code__c='97002139';
        ps1.Key_Combination_Code__c='A773';
        ps1.Sales_Org_Code__c='A293';
        ps1.BU__c='DPT EMEA';
        ps1.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        ps1.PH1_Code__c='T3';
        ps1.PH2_Code__c='MA';
        ps1.PH3_Code__c='PP';
        ps1.PH4_Code__c='PP';
        ps1.PH5_Code__c='02';
        ps1.PH6_Code__c='ZZ';
        ps1.PH7_Code__c='P5';
        ps1.PH8_Code__c='5U';
        ps1.PH9_Code__c='IB';
        //Date myDate = date.newinstance(2013, 1, 1);
        ps1.Valid_From__c=pd1.addDays(10);
        ps1.isPriceHolder__c=true;
        ps1.Pricing_Condition_Code__c = 'ZM07';
        ps1.markForDeletion__c=true;
        insert ps1;
    
        
        List<ERP_Sales_Prices_SAP__c> ERPSalesPricesList = new List<ERP_Sales_Prices_SAP__c>();
        //Price Creation
        
        ERP_Sales_Prices_SAP__c s1=new ERP_Sales_Prices_SAP__c();
        date d1=date.today();
        s1.Valid_To__c=d1.addDays(21);
        //codes
        s1.Customer_Specific__c=true;
        s1.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s1.Sold_To_Code__c='97002139';
        s1.Key_Combination_Code__c='A773';
        s1.Sales_Org_Code__c='A293';
        s1.BU__c='DPT EMEA';
        s1.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s1.PH1_Code__c='T3';
        s1.PH2_Code__c='MA';
        s1.PH3_Code__c='PP';
        s1.PH4_Code__c='PP';
        s1.PH5_Code__c='02';
        s1.PH6_Code__c='ZZ';
        s1.PH7_Code__c='P5';
        s1.PH8_Code__c='5U';
        s1.PH9_Code__c='IB';
        Date myDate4 =date.newinstance(2013, 1, 1);
        s1.Valid_From__c=d1;
        s1.isPriceHolder__c=false;
        s1.markForDeletion__c=false;
        s1.Price_Holder__c=s.id;
        s1.Pricing_Condition_Code__c = 'ZPRI';
        s1.BU__c='DPT EMEA';
        s1.SAP_Cluster__c = 'Q23';
        s1.isActive__c = false;
        s1.Rate__c='15';
        s1.UoM__c='KG';
        s1.Unit__c='USD';
        s1.Per__c=1;
        //descriptions
        s1.Sales_Org__c='AFS DUP Russia 8922';
        s1.Sold_To__c='DUPONT SCIENCE AND';
        s1.Product_Hierarchy__c='NBP 410 0.05 1854';
       
        ERPSalesPricesList.add(s1);
    
        ERP_Sales_Prices_SAP__c s2=new ERP_Sales_Prices_SAP__c();
        date d2=date.today();
        s2.Valid_To__c=d2.addDays(21);
        //codes
        s2.Customer_Specific__c=true;
        s2.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s2.Sold_To_Code__c='97002139';
        s2.Key_Combination_Code__c='A773';
        s2.Sales_Org_Code__c='A293';
        s2.BU__c='DPT EMEA';
        s2.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s2.PH1_Code__c='T3';
        s2.PH2_Code__c='MA';
        s2.PH3_Code__c='PP';
        s2.PH4_Code__c='PP';
        s2.PH5_Code__c='02';
        s2.PH6_Code__c='ZZ';
        s2.PH7_Code__c='P5';
        s2.PH8_Code__c='5U';
        s2.PH9_Code__c='IB';
        Date myDate2 =date.newinstance(2013, 1, 1);
        s2.Valid_From__c=d2;
        s2.isPriceHolder__c=false;
        s2.markForDeletion__c=false;
        s2.Price_Holder__c=s.id;
        s2.Pricing_Condition_Code__c = 'ZPRI';
        s2.BU__c='DPT EMEA';
        s2.SAP_Cluster__c = 'Q23';
        s2.isActive__c = true;
        s2.Rate__c='25';
        s2.UoM__c='KG';
        s2.Unit__c='USD';
        s2.Per__c=1;
        //descriptions
        s2.Sales_Org__c='AFS DUP Russia 8922';
        s2.Sold_To__c='DUPONT SCIENCE AND';
        s2.Product_Hierarchy__c='NBP 410 0.05 1854';
       
        ERPSalesPricesList.add(s2);
     
        ERP_Sales_Prices_SAP__c s3=new ERP_Sales_Prices_SAP__c();
        date d3=date.today();
        s3.Valid_To__c=d3.addDays(21);
        //codes
        s3.Customer_Specific__c=true;
        s3.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s3.Sold_To_Code__c='97002139';
        s3.Key_Combination_Code__c='A773';
        s3.Sales_Org_Code__c='A293';
        s3.BU__c='DPT EMEA';
        s3.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s3.PH1_Code__c='T3';
        s3.PH2_Code__c='MA';
        s3.PH3_Code__c='PP';
        s3.PH4_Code__c='PP';
        s3.PH5_Code__c='02';
        s3.PH6_Code__c='ZZ';
        s3.PH7_Code__c='P5';
        s3.PH8_Code__c='5U';
        s3.PH9_Code__c='IB';
        Date myDate3 =date.newinstance(2013, 1, 1);
        s3.Valid_From__c=d3;
        s3.isPriceHolder__c=false;
        s3.markForDeletion__c=true;
        s3.Price_Holder__c=s.id;
        s3.Pricing_Condition_Code__c = 'ZPRI';
        s3.BU__c='DPT EMEA';
        s3.SAP_Cluster__c = 'Q23';
        s3.isActive__c = true;
        s3.Rate__c='35';
        s3.UoM__c='KG';
        s3.Unit__c='USD';
        s3.Per__c=1;
        //descriptions
        s3.Sales_Org__c='AFS DUP Russia 8922';
        s3.Sold_To__c='DUPONT SCIENCE AND';
        s3.Product_Hierarchy__c='NBP 410 0.05 1854';
       
        ERPSalesPricesList.add(s3);
        
        ERP_Sales_Prices_SAP__c s4=new ERP_Sales_Prices_SAP__c();
        date d4=date.today();
        s4.Valid_To__c=d4.addDays(91);
        //codes
        s4.Customer_Specific__c=true;
        s4.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s4.Sold_To_Code__c='97002139';
        s4.Key_Combination_Code__c='A773';
        s4.Sales_Org_Code__c='A293';
        s4.BU__c='DPT EMEA';
        s4.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s4.PH1_Code__c='T3';
        s4.PH2_Code__c='MA';
        s4.PH3_Code__c='PP';
        s4.PH4_Code__c='PP';
        s4.PH5_Code__c='02';
        s4.PH6_Code__c='ZZ';
        s4.PH7_Code__c='P5';
        s4.PH8_Code__c='5U';
        s4.PH9_Code__c='IB';
        Date myDate5 =date.newinstance(2013, 1, 1);
        s4.Valid_From__c=d4.addDays(10);
        s4.isPriceHolder__c=false;
        s4.markForDeletion__c=true;
        s4.Price_Holder__c=ps1.id;
        s4.Pricing_Condition_Code__c = 'ZPRI';
        s4.BU__c='DPT EMEA';
        s4.SAP_Cluster__c = 'Q23';
        s4.isActive__c = true;
        s4.Rate__c='35';
        s4.UoM__c='KG';
        s4.Unit__c='USD';
        s4.Per__c=1;
        //descriptions
        s4.Sales_Org__c='AFS DUP Russia 8922';
        s4.Sold_To__c='DUPONT SCIENCE AND';
        s4.Product_Hierarchy__c='NBP 410 0.05 1854';
        ERPSalesPricesList.add(s4);
    
        ERP_Sales_Prices_SAP__c s5=new ERP_Sales_Prices_SAP__c();
        date d5=date.today();
        s5.Valid_To__c=d5.addDays(91);
        //codes
        s5.Customer_Specific__c=true;
        s5.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s5.Sold_To_Code__c='97002139';
        s5.Key_Combination_Code__c='A773';
        s5.Sales_Org_Code__c='A293';
        s5.BU__c='DPT EMEA';
        s5.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s5.PH1_Code__c='T3';
        s5.PH2_Code__c='MA';
        s5.PH3_Code__c='PP';
        s5.PH4_Code__c='PP';
        s5.PH5_Code__c='02';
        s5.PH6_Code__c='ZZ';
        s5.PH7_Code__c='P5';
        s5.PH8_Code__c='5U';
        s5.PH9_Code__c='IB';
        //Date myDate5 =date.newinstance(2013, 1, 1);
        s5.Valid_From__c=d5.addDays(10);
        s5.isPriceHolder__c=false;
        s5.markForDeletion__c=true;
        s5.Price_Holder__c=ps.id;
        s5.Pricing_Condition_Code__c = 'ZM07';
        s5.BU__c='DPT EMEA';
        s5.SAP_Cluster__c = 'Q23';
        s5.isActive__c = true;
        s5.Rate__c='-100';
        s5.UoM__c='KG';
        s5.Unit__c='USD';
        s5.Per__c=1;
        //descriptions
        s5.Sales_Org__c='AFS DUP Russia 8922';
        s5.Sold_To__c='DUPONT SCIENCE AND';
        s5.Product_Hierarchy__c='NBP 410 0.05 1854';
        ERPSalesPricesList.add(s5);
        
        ERP_Sales_Prices_SAP__c s6=new ERP_Sales_Prices_SAP__c();
        date d11=date.today();
        s6.Valid_To__c=d11.addDays(21);
        //codes
        s6.Customer_Specific__c=true;
        s6.Key_Combination__c='Sales Org./Sold to/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9';
        s6.Sold_To_Code__c='97002139';
        s6.Key_Combination_Code__c='A773';
        s6.Sales_Org_Code__c='A293';
        s6.BU__c='DPT EMEA';
        s6.Product_Hierarchy_Code__c='T3MAPPPP02ZZP55UIB';
        s6.PH1_Code__c='T3';
        s6.PH2_Code__c='MA';
        s6.PH3_Code__c='PP';
        s6.PH4_Code__c='PP';
        s6.PH5_Code__c='02';
        s6.PH6_Code__c='ZZ';
        s6.PH7_Code__c='P5';
        s6.PH8_Code__c='5U';
        s6.PH9_Code__c='IB';
        Date myDate41 =date.newinstance(2013, 1, 1);
        s6.Valid_From__c=d11;
        s6.isPriceHolder__c=false;
        s6.markForDeletion__c=true;
        s6.Price_Holder__c=s.id;
        s6.Pricing_Condition_Code__c = 'ZPR1';
        s6.BU__c='DPT EMEA';
        s6.SAP_Cluster__c = 'Q23';
        s6.isActive__c = true;
        s6.Rate__c='15';
        s6.UoM__c='KG';
        s6.Unit__c='USD';
        s6.Per__c=1;
        //descriptions
        s6.Sales_Org__c='AFS DUP Russia 8922';
        s6.Sold_To__c='DUPONT SCIENCE AND';
        s6.Product_Hierarchy__c='NBP 410 0.05 1854';
       
        ERPSalesPricesList.add(s6);
        
        insert ERPSalesPricesList;
        
        try{
            MarkActivePrices obj1 = new MarkActivePrices('DPT EMEA');
            DataBase.executeBatch(obj1);
        }Catch(Exception e){
            System.debug('**Exception occurred '+e);
        }
        Test.stopTest();
    }
}