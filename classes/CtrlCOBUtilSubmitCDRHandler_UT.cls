@isTest

public class CtrlCOBUtilSubmitCDRHandler_UT{
public static string CompanyCodeCountry_Rule_Rtype = Rtype.getIdByDevName('Business_Rules__c','Country_Selling_Company_Code_Rules');
    
 Public static testMethod void OverrideNewEdit(){

 List<Business_Rules__c> brlist = new List<Business_Rules__c>();
Business_Rules__c br = new Business_Rules__c();
br.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br.selling_company_code__c ='0003 - E.I. DuPont India Private Limited';
br.Sold_to_Country__c = 'IN - India';
brlist.add(br);
Business_Rules__c br1 = new Business_Rules__c();
br1.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br1.selling_company_code__c ='0078 - ELECT. MATLS DUP DONGGUAN';
br1.Sold_to_Country__c = 'CN - China';
brlist.add(br1);
Business_Rules__c br2 = new Business_Rules__c();
br2.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br2.selling_company_code__c ='0029 - DU PONT CHINA LIMITED';
br2.Sold_to_Country__c = 'HK - Hong Kong';
brlist.add(br2);
insert brlist;
 Test.StartTest();
  Customer_Data_Request__c cdr = new Customer_Data_Request__c();
     
   Customer_Data_Request__c cdr1 = new Customer_Data_Request__c();
        cdr1.Customer_Name__c='TestA';
        cdr1.Customer_Name_2__c='TestB';
        cdr1.Sold_to_Country__c ='IN - India';
        cdr1.Request_Status__c ='Awaiting Credit Approval';
        cdr1.Company_Code__c='0003 - E.I. DuPont India Private Limited';
        insert cdr1;     
   
        
  CtrlCOBUtilSubmitCDRHandler con = new CtrlCOBUtilSubmitCDRHandler();
   cdr1.Customer_Name_2__c='Testc';
     update cdr1;
  con.submitRequest(cdr1);
  CtrlCOBUtilSubmitCDRHandler.run=true;
  cdr1.Sold_to_Country__c ='Australia';
  cdr1.Company_Code__c='0003 - E.I. DuPont India Private Limited';
  update cdr1;
  con.submitRequest(cdr1);
  
  CtrlCOBUtilSubmitCDRHandler.run=true;
  cdr1.Company_Code__c='0029 - DU PONT CHINA LIMITED';
  update cdr1;
  con.submitRequest(cdr1);
  CtrlCOBUtilSubmitCDRHandler.run=true;
  cdr1.Company_Code__c='0078 - ELECT. MATLS DUP DONGGUAN';
  update cdr1;
  con.submitRequest(cdr1);
  Test.stopTest();
  }
}