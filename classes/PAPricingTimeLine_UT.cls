/*
 * Name      :   PAPricingTimeLine
 * Description  :   This is the test class for PAPricingTimeLine
 * Author      :   Infosys Limited
 * Created Date :   
 *
 * Version    Modified Date    Modified By   		Modification
 * -----------------------------------------------------------------------------------------
 * v1.1    	   23-Jan-2017     Haider Naseem		Test Class modified to increase coverage.
 */
@isTest
private class PAPricingTimeLine_UT {
    @testSetUp
    public static void setupData(){
    	 List<ERP_Export_to_SAP__c> ls = Test.loadData(ERP_Export_to_SAP__c.sObjectType, 'erpExportToSAP');
        ERP_Export_to_SAP__c erpExportToSap2 = new ERP_Export_to_SAP__c();
        ERP_Export_to_SAP__c req = ls[0];
        req.Material_Code__c = 'D14678078';
        req.Scaled_Price_Flag__c = false;
        
       List<ERP_Export_to_SAP__c> listOfPrices = new List<ERP_Export_to_SAP__c>();
       listOfPrices.add(req);
       upsert listOfPrices;
    }
    
    static testMethod void Test1() {
     
       PageReference pg = new pagereference('/apex/PACurrentPrices');
       Test.setCurrentPageReference(pg);
       PAPricingTimeLine pt = new PAPricingTimeLine();
       pt.getPriceHistory();
       //pt.showHistory = false;  //true
       boolean b = pt.displayTmLn;  //false
       pt.pckc = 'abcd';
       string pckc = pt.pckc;
       pt.scalePrice = null;
       boolean s = pt.scalePrice;
       pt.showHistory = null;
       boolean sh = pt.showHistory;
       system.debug('Test Page: '+ ApexPages.currentPage().getUrl());
       pt.showWarning = true;
       pt.scalePrice = true;  //true
       pt.isMaterial = true;
       pt.closeWindow();
    }
    
    static testMethod void Test2() {
    
       PageReference pg2 = new pagereference('/apex/PAAddReqItem');
       Test.setCurrentPageReference(pg2);
       PAPricingTimeLine pt = new PAPricingTimeLine();
        pt.pckc='D660';
       pt.getPriceHistory();
       //pt.showHistory = false;  //true
       boolean b = pt.displayTmLn;  //false
       pt.pckc = 'abcd';
       string pckc = pt.pckc;
       pt.scalePrice = null;
       boolean s = pt.scalePrice;
       pt.showHistory = null;
       boolean sh = pt.showHistory;
       system.debug('Test Page: '+ ApexPages.currentPage().getUrl());
       pt.showWarning = true;
       pt.scalePrice = true;  //true
       pt.isMaterial = true;
       pt.closeWindow();
       
       
    }
    static testMethod void Test3() {
    
       PageReference pg = new pagereference('/apex/PAHome');
       Test.setCurrentPageReference(pg);
       PAPricingTimeLine pt = new PAPricingTimeLine();
       pt.getPriceHistory();
       boolean b = pt.displayTmLn;  //false
       pt.pckc = 'D660';
       string pckc = pt.pckc;
       pt.scalePrice = null;
       boolean s = pt.scalePrice;
       boolean sh = pt.showHistory;
       system.debug('Test Page: '+ ApexPages.currentPage().getUrl());
       pt.showWarning = true;
       pt.scalePrice = true;  //true
       pt.isMaterial = true;
       pt.closeWindow();
       
       
    }
}