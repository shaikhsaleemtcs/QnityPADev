@isTest
private class ctrlBUAdminforTemplates_UT{
    static testMethod void ctrlBUAdminforTemplatesTestMethod(){
        ctrlBUAdminforTemplates a=new ctrlBUAdminforTemplates();
        a.buName='admin';
        OrgGroup__c pa1 = new OrgGroup__c(Business__c='admin');
        insert pa1;
        string str=a.getbuadminName();
    }
}