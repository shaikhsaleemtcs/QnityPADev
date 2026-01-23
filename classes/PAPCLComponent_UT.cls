/*
 * Name      :   PAPCLComponent_UT
 * Description  :   This is the test class for OverRideSystemAdmin
 * Author      :   Infosys Limited
 * Created Date :   
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class PAPCLComponent_UT
{
      
    static testMethod void PAPCLComponentTestMethod()
    {
        //<20171603> Merge&Spin: Method to create test data for "PAKeyCombinationUpdate" custom setting
        TestCustomSettingUtil.PAKeyCombinationUpdateTestData();
        
        Project_Price__c P1= new Project_Price__c();
        P1.Name='P1';
        P1.Valid_From__c=system.today();
        P1.Valid_To__c=system.today()+15;
        P1.Project_status__c='Draft';
        P1.Project_Volume__c='100';
        P1.Default_Discount__c='10';
        P1.Sold_To_Code__c='12345';
        
        Profile px1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        UserRole rx=  TestUserUtil.createTestUserRole('Ag Utility DuPont');
        User usrx1 = TestUserUtil.createTestUser(rx.Id,px1.Id,'User1 FirstName','User1 LastName');
        insert usrx1;
        
        Pricing_Request__c prList = new Pricing_Request__c();
        prList = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='12345',Sales_Org_Code__c='A640',On_Behalf_Of__c=usrx1.Id,
                                SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                Request_Name__c='test123',Pricing_Request_Type__c='Project Pricing',Division_Code__c='02',
                                Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                Request_Approval_Status__c='Draft',Spot_Type__c='not null',Project_Price__c=P1.id,
                                Project_Id__c=P1.Project_Id__c,Project_Name__c=P1.Name);
         
        insert prList;
        Pricing_Request__c prList1 = new Pricing_Request__c();
        prList1 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='12345',Sales_Org_Code__c='A640',
                                SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                Request_Approval_Status__c='Draft',Spot_Type__c='not null');
         
        insert prList1;
        
        ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='12345';
         customer.Sales_Org_Code__c='A640';
         customer.Distribution_Channel_Code__c='10';
         customer.Division_Code__c='02';
         customer.name='Customer1';
         customer.Customer_Code__c='AT';
         customer.country__c='GERMANY';
         customer.Sales_Office__c='';
         customer.Street__c='';
         customer.City__c='';
         customer.Country__c='';
         customer.Name='Customer1';
         customer.Terms_of_Payment_Code__c='123';
         customer.Terms_of_Payment__c='ToP';
         customer.Incoterms_1_Code__c='456';
         customer.Incoterms_1__c='Inco';
        // customer.Source_Cluster__c='WP1';  
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
         insert customer;
         
        List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
        Date d = Date.valueOf(System.now());
        Date d1 = Date.valueOf(System.now()-5);
        
        Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
        priReqItem1.Pricing_Request__c = prList.Id;
        priReqItem1.Scaled_Price_Flag__c = false;
        priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem1.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem1.Key_Combination_Code__c = 'A580';
        priReqItem1.Key_Combination__c = 'Material/Customer Price Group/Sales District/PH/Ship to/Material Price Group/Customer Price Group/Sales office/Price List Type/Terms of Payment/Price Ref. Partner/Country/End Use/End User/Market Segment';
        priReqItem1.Customer_Specific__c=true;        
        priReqItem1.New_Valid_To__c = d;
        priReqItem1.New_Valid_From__c = d1;
        priReqItem1.New_Rate__c = '10.00';
        priReqItem1.New_Unit__c = '%';
        priReqItem1.New_UoM__c = 'KG';
       // priReqItem1.SAP_Cluster__c='WP1';
        priReqItem1.Sales_Org_Code__c='A640';
        priReqItem1.Dist_Channel_Code__c='10';
        priReqItem1.Division_Code__c='02';
        priReqItem1.Sold_To_Code__c='12345';
        pricingReqItemList.add(priReqItem1);
        
        
        Pricing_Request_Item__c priReqItem9 = new Pricing_Request_Item__c();
        priReqItem9.Pricing_Request__c = prList.Id;
        priReqItem9.Scaled_Price_Flag__c = true;
        priReqItem9.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem9.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem9.Key_Combination_Code__c = 'A580';
        priReqItem9.Key_Combination__c = 'Terms of Payment/Incoterms/Material Group 1/Price Ref. Partner/Country/End Use/End User/Market Segment/Sales District/Variant/Sales Order Type/ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country';        
        priReqItem9.Gap__c = true;
        priReqItem9.New__c = true;
        priReqItem9.New_Valid_To__c = d;
        priReqItem9.New_Valid_From__c = d1;
        priReqItem9.New_Rate__c = '103.56';
        priReqItem9.New_Unit__c = '%';
        priReqItem9.New_UoM__c = '';
        //priReqItem9.SAP_Cluster__c='WP1';
        priReqItem9.Sales_Org_Code__c='A640';
        priReqItem9.Dist_Channel_Code__c='10';
        priReqItem9.Division_Code__c='02';
        priReqItem9.Sold_To_Code__c='12345';
        pricingReqItemList.add(priReqItem9);
        
        Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
        priReqItem2.Pricing_Request__c = prList1.Id;
        priReqItem2.Scaled_Price_Flag__c = true;
        priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem2.Pricing_Condition__c = 'Surfaces Gross Price';
        //<20171603> Merge&Spin: Remove old key combination reference and replace it with custom setting  
        //priReqItem2.Key_Combination_Code__c = PAKeyCombinationUpdate__c.getvalues('A805').NewKCCode__c;
        priReqItem2.Key_Combination__c = 'Material/Sales District/Variant/Sales Order Type/ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/Kcode/Partner ZF/Payer/Disc Ref No/FixValDate/Campaign/Document Currency/State';
        priReqItem2.New_Valid_To__c = d;
        priReqItem2.New_Valid_From__c = d1;
        priReqItem2.New_Rate__c = '103.56';
        priReqItem2.New_Unit__c = '%';
        priReqItem2.New_UoM__c = ''; 
       // priReqItem2.SAP_Cluster__c='WP1';
        priReqItem2.Sales_Org_Code__c='A640';
        priReqItem2.Dist_Channel_Code__c='10';
        priReqItem2.Division_Code__c='02';
        priReqItem2.Sold_To_Code__c='12345';
        pricingReqItemList.add(priReqItem2);
        
        Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
        priReqItem3.Pricing_Request__c = prList1.Id;
        priReqItem3.Scaled_Price_Flag__c = true;
        priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
        priReqItem3.Pricing_Condition__c = 'Surfaces Gross Price';
        priReqItem3.Key_Combination_Code__c = 'A580';
        priReqItem3.Key_Combination__c = 'Material/Customer Price Group/PH/Ship to/Material Price Group/Customer Price Group/Sales office/Price List Type/Terms of Payment/Price Ref. Partner/Country/End Use/End User/Market Segment'; 
        priReqItem3.New_Valid_To__c = d;
        priReqItem3.New_Valid_From__c = d1;
        priReqItem3.New_Rate__c = '153.56';
        priReqItem3.New_Unit__c = '%';
        priReqItem3.New_UoM__c = '';
       // priReqItem3.SAP_Cluster__c='WP1';
        priReqItem3.Sales_Org_Code__c='A640';
        priReqItem3.Dist_Channel_Code__c='10';
        priReqItem3.Division_Code__c='02';
        priReqItem3.Sold_To_Code__c='12345';
        pricingReqItemList.add(priReqItem3);
        
        insert pricingReqItemList;
        
        ERP_Sales_Prices_SAP__c erp = new ERP_Sales_Prices_SAP__c();
        erp.Record_Id__c = 'Test#'+prList.id+'#FromPricingrequest';
        insert erp;
        ERP_Sales_Prices_SAP__c erp1 = new ERP_Sales_Prices_SAP__c();
        erp1.Record_Id__c = 'Test#'+prList1.id+'#FromPricingrequest';
        insert erp1;
        ERP_Sales_Prices_SAP__c erp22 = new ERP_Sales_Prices_SAP__c();
        erp.Record_Id__c = 'Test#'+prList.id;
        insert erp22;
        
    
        PAPCLComponent pcl = new PAPCLComponent();
        pcl.listofids = erp.id;
        pcl.onBehalfOfUser='005a0000009J2dc';
        String test11 = pcl.addressMessage;
        list<PAwrapper> pawrap = pcl.listofwrappertables;
        list<String> strList = pcl.listofCustomerContacts;
        list<Project_Price__c> pp = pcl.listofProjectPrices;
        list<Pricing_Request__c> pr = pcl.listrequestdetils;
        pcl.returnData();
        pcl.closeWindow();
        pcl.action();
        pcl.dosearch();
        pcl.displayPopUpWindow(); 
        
        
        PAPCLComponent pcl1 = new PAPCLComponent();
        pcl1.listofids = erp1.id;
        pcl1.onBehalfOfUser='005a0000009J2dc';
        String test1 = pcl1.addressMessage;
        list<PAwrapper> pawrap1 = pcl1.listofwrappertables;
        list<String> strList1 = pcl1.listofCustomerContacts;
        list<Project_Price__c> pp1 = pcl1.listofProjectPrices;
        list<Pricing_Request__c> pr1 = pcl1.listrequestdetils;
        pcl1.returnData();
        pcl1.closeWindow();
        pcl1.action();
        pcl1.dosearch();
        pcl1.displayPopUpWindow();
        
        
        ERP_Sales_Prices_SAP__c childRecord1 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='12345',Pricing_Condition_code__c='ZPSE',
                                                                        Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                        Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                        sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=d1,valid_to__c=d,
                                                                        SAP_Client_ID__c='510',SAP_Application_Id__c='V',Key_Combination__c='Material/Customer Price Group/PH/Ship to/Material Price Group/Customer Price Group/Sales office/Price List Type/Terms of Payment/Price Ref. Partner/Country/End Use/Incoterms/End User/Market Segment/Material Group 1',
                                                                        Material__c='C A 3D 1/2X30X144 12.0X760X3658',Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                        Pricing_Condition__c='Surfaces Gross Price',sold_to__c='Customer1');
                                                                              insert childRecord1; 
                                                                              
        ERP_Sales_Prices_SAP__c childRecord2 = new ERP_Sales_Prices_SAP__c(sold_to_code__c='12345',Pricing_Condition_code__c='ZPSE',
                                                                        Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                        Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                        sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=d1,valid_to__c=d,
                                                                        SAP_Client_ID__c='510',SAP_Application_Id__c='V',Key_Combination__c='Sales District/Variant/Sales Order Type/ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/Kcode/Partner ZF/Ship-To Country/Payer/Disc Ref No/FixValDate/Campaign/Document Currency/State',
                                                                        Material__c='C A 3D 1/2X30X144 12.0X760X3658',Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                        Pricing_Condition__c='Surfaces Gross Price',sold_to__c='Customer1',Project_Id__c=P1.Project_Id__c);
                                                                              insert childRecord2;                                                                       
        ERP_Sales_Prices_SAP__c erp2 = new ERP_Sales_Prices_SAP__c();
        erp2.Record_Id__c = 'Test#'+childRecord1.Id;
        insert erp2;
        ERP_Sales_Prices_SAP__c erp3 = new ERP_Sales_Prices_SAP__c();
        erp3.Record_Id__c = 'Test#'+childRecord2.Id;
        insert erp3;
        
        PAPCLComponent pcl2 = new PAPCLComponent();
        pcl2.listofids = erp2.id;
        pcl2.onBehalfOfUser='005a0000009J2dc';
        String test2 = pcl2.addressMessage;
        list<PAwrapper> pawrap2 = pcl2.listofwrappertables;
        list<String> strList2 = pcl2.listofCustomerContacts;
        list<Project_Price__c> pp2 = pcl2.listofProjectPrices;
        list<Pricing_Request__c> pr2 = pcl2.listrequestdetils;
        pcl2.returnData();
        pcl2.closeWindow();
        pcl2.action();
        pcl2.dosearch();
        pcl2.displayPopUpWindow();
        
        PAPCLComponent pcl3 = new PAPCLComponent();
        pcl3.listofids = erp3.id;
        pcl3.onBehalfOfUser='005a0000009J2dc';
        String test3 = pcl3.addressMessage;
        list<PAwrapper> pawrap3 = pcl3.listofwrappertables;
        list<String> strList3 = pcl3.listofCustomerContacts;
        list<Project_Price__c> pp3 = pcl3.listofProjectPrices;
        list<Pricing_Request__c> pr3 = pcl3.listrequestdetils;
        pcl3.returnData();
        pcl3.closeWindow();
        pcl3.action();
        pcl3.dosearch();
        pcl3.displayPopUpWindow();
    }
}