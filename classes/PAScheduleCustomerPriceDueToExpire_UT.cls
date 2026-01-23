@isTest
private class PAScheduleCustomerPriceDueToExpire_UT
{
    static testMethod void PAScheduleCustomerPriceDueToExpireTestMethod() 
    {   
        insert new PABusinessForExpiryNotification__c(Name='APBu',Business__c = 'P&IP ECP AP');
        insert new PABusinessForExpiryNotification__c(Name='EMEABu',Business__c = 'P&IP ECP EMEA');
        insert new PABusinessForExpiryNotification__c(Name='LABu',Business__c = 'P&IP ECP LA');
        insert new PABusinessForExpiryNotification__c(Name='NABu',Business__c = 'P&IP ECP NA');
        insert new PABusinessForExpiryNotification__c(Name='GlobalBu',Business__c = 'P&IP ECP NA');
        insert new PABusinessForExpiryNotification__c(Name='DPPGlobalBu',Business__c = 'P&IP ECP NA');
        insert new PANonCustomerBUForExpiryNotification__c(Name='EmeaBuNC',BusinessNonCustomer__c='NC_P&IP ECP EMEA');
        insert new PANonCustomerBUForExpiryNotification__c(Name='GlobalBuNC',BusinessNonCustomer__c='NC_DPP Global Kalrez & Vespel');
        
        /*
        BatchDailyNotifications sd=new BatchDailyNotifications();
        database.executebatch(sd, 8);*/
        PAScheduleCustomerPriceDueToExpire m = new PAScheduleCustomerPriceDueToExpire();
        String sch = '0 24 15 * * ? ';
        system.schedule('Merge Job',sch, m);
        
       
    } 
    
}