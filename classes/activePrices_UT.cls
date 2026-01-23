@isTest
public class activePrices_UT{
    public static  testmethod  void activePrices_Testmethod(){
        Test.startTest();
        activePrices ap=new activePrices();
        list<Organizational_Group_User__c> ogiList = new list<Organizational_Group_User__c>();
        string selectedBusiness='Test business';
        ERP_Pricing_Procedure__c epp=new ERP_Pricing_Procedure__c();
        epp.Pricing_Procedure__c='Test pricing procedure';
        insert epp;
        //ERP_Sales_Prices_SAP__c esps=new ERP_Sales_Prices_SAP__c ();
        
        OrgGroup__c og=new OrgGroup__c();
        //og.name='Test Org Group';
        og.Business__c='Test business';
        insert og;
        
        OrgGroup__c og1=new OrgGroup__c();
        //og.name='Test Org Group';
        og1.Business__c='Test business1';
        insert og1;
        
        Organizational_Group_Item__c ogi=new Organizational_Group_Item__c();
        //ogi.name='Test organization group item';
        ogi.Business__c=og.id;
        ogi.ERP_Pricing_Procedure__c=epp.id;
        ogi.OrgGroup__c=og.id;
        insert ogi;
        
        Organizational_Group_Item__c ogi1=new Organizational_Group_Item__c();
        //ogi.name='Test organization group item';
        ogi1.Business__c=og1.id;
        ogi1.ERP_Pricing_Procedure__c=epp.id;
        ogi1.OrgGroup__c=og.id;
        insert ogi1;
        ap.getBusinessList();
        
        Organizational_Group_User__c ogu=new Organizational_Group_User__c();
        //ogu.name='test organization group user';
        ogu.OrgGroup__c=og.id;
        ogu.Organizational_Group_Item__c=ogi.id;
        ogu.Related_User__c=UserInfo.getUserId();
        insert ogu;
        Organizational_Group_User__c ogu1=new Organizational_Group_User__c();
        //ogu.name='test organization group user';
        ogu1.OrgGroup__c=og1.id;
        ogu1.Organizational_Group_Item__c=ogi1.id;
        ogu1.Related_User__c=UserInfo.getUserId();
        insert ogu1;
        ogiList.add(ogu1);
        
        try{
            ap.getBusinessList();
            
            ap.selectedBusiness='DPT EMEA';
            ap.executeButton();
            ap.executeButton();
        }Catch(Exception e){
            System.debug('***Exception occurred '+e);
        }
        Test.stopTest();
    }
    
}