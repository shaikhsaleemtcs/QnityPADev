@isTest

public class CtrlCOBUtilCustMDataReqrideNewEdit_UT{

    public static final string MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Miscellaneous_customer_data_request');
    public static final string MODIFYEXISTINGCUSTDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Existing_Customer_Data');
    public static final string NEWCUSTOMERCREATION_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','New_Customer_Creation');  
    public static final string MODIFYCREDITDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Credit_Data');
    public static final string EXTENDEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Extend_Existing_Customer');
    public static final string PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Create_partner_function_Link_Contact_Link_Existing_Partner');

 Public static testMethod void OverrideNewEdit(){
 Test.StartTest();

  Customer_Data_Request__c cdr = new Customer_Data_Request__c();
     
   Customer_Data_Request__c cdr1 = new Customer_Data_Request__c();
        cdr1.Customer_Name__c='TestA';
        cdr1.Customer_Name_2__c='TestB';
        insert cdr1;     
     ApexPages.currentPage().getParameters().put('Clone','Clone');      
        
  ApexPages.StandardController sd1 = new ApexPages.standardController(cdr);
  CtrlCOBUtilCustMDataReqOverrideNewEdit cont = new CtrlCOBUtilCustMDataReqOverrideNewEdit(sd1);
  cont.redirect();
  cont.accessCheck();
  
  cdr.recordtypeId=MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE;
  cont.redirect();
  cont.accessCheck();
  
  cdr.recordtypeId=MODIFYEXISTINGCUSTDATA_COB_RTYPE ;
  cont.redirect();
  cont.accessCheck();
  
  cdr.recordtypeId=NEWCUSTOMERCREATION_COB_RTYPE;
  cont.redirect();
  cont.accessCheck();
  
  cdr.recordtypeId=MODIFYCREDITDATA_COB_RTYPE ;
  cont.redirect();
  cont.accessCheck();
  
  cdr.recordtypeId=EXTENDEXISTINGCUSTOMER_COB_RTYPE;
  cont.redirect();
  cont.accessCheck();
  
  cdr.recordtypeId=PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE ;
  cont.redirect();
  cont.accessCheck();
    
    

  
  ApexPages.StandardController sd2 = new ApexPages.standardController(cdr1);
  CtrlCOBUtilCustMDataReqOverrideNewEdit cont1 = new CtrlCOBUtilCustMDataReqOverrideNewEdit(sd2);
  cont.redirect();
 test.stopTest();  
  
  }
  }