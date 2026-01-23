/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest ()
private class SFDCSAPPriceSyncShare_UT {
    
  
    static testMethod void myUnitTest1() {
        //Added by Murugan to increase code coverage
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        
        ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='BI EMEA A640,A641,A693 Surfaces Sales Pricing Procedure',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='300',SAP_Cluster__c='CB1');
        
        insert pp;
        
        OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
        insert salesArea;
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        
        OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
        insert Business;
        
        List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
        
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser; 
        Test.StartTest();
        ERP_Export_to_SAP__c price = new ERP_Export_to_SAP__c();
        price.CurrencyIsoCode = 'USD';
        price.BU__c='BI EMEA Surfaces';
        price.Division_Code__c ='02';
        price.Distribution_Channel_Code__c ='10';
        price.Sales_Org_Code__c='A640';
        insert price;
               
        SFDC_SAP_Price_Sync__c SFDCSAPPriceSync = new SFDC_SAP_Price_Sync__c ();
        SFDCSAPPriceSync.SFDC_PA_Price_Record__c =price.Id;
        SFDCSAPPriceSync.SFDC_PA_BU__c=price.BU__c;
        
        try{
            Insert SFDCSAPPriceSync;
            SFDCSAPPriceSync.SFDC_PA_BU__c='BI EMEA Surfaces';
            update SFDCSAPPriceSync;
        }
            catch(Exception e){
        }
        Test.stopTest();
    }
    static testMethod void myUnitTest2() {
        Test.startTest();
        ERP_Export_to_SAP__c price = new ERP_Export_to_SAP__c();
        price.CurrencyIsoCode = 'USD';
        insert price;
        SFDC_SAP_Price_Sync__c SFDCSAPPriceSync = new SFDC_SAP_Price_Sync__c ();
        SFDCSAPPriceSync.SAP_BU__c='BI EMEA Surfaces';
        SFDCSAPPriceSync.SAP_Division_Code__c='02';
        SFDCSAPPriceSync.SAP_Dist_Channel_Code__c='10';
        SFDCSAPPriceSync.SAP_Sales_Org_Code__c='A640';
        try{
            Insert SFDCSAPPriceSync;
            SFDCSAPPriceSync.SAP_Division_Code__c='02';
            update SFDCSAPPriceSync;
        }
            catch(Exception e){
        } 
        test.stopTest();
    }
    
}