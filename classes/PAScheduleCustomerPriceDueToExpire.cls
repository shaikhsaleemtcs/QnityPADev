/*
 * Name     :   PAScheduleCustomerPriceDueToExpire
 * Description  :   This class will schedule the CustomerPriceDueToExpire batch
 * Author     :   Infosys Limited
 * Created Date :   
 *
 * Version            Modified Date         Modified By             Modification
 * IS ID-00064918       Feb-22-2016        Sumit Gupta            Added for EmeaBuNC
 * IS ID-00063013      Mar-21-2016        Sumit Gupta            Added for GlobalBu;GlobalBuNC
 * IS ID-00070035      May-16-2016        Sumit Gupta            Added for DPPGlobalBu
 * IS ID-00077694      Jan-09-2017        Priyanci Gupta         Size of batch has decreased from 6 to 2 so as to avoid Heap Size Error
 * IS ID-00080812      Apr-12-2017        Priyanci Gupta         Batches have been increased so to avoid Heap Size Error
 * -------------------------------------------------------------
 */
global class PAScheduleCustomerPriceDueToExpire implements Schedulable
{
  global void execute(SchedulableContext SC) 
  {
        /*
        PABusinessForExpiryNotification__c APBu = PABusinessForExpiryNotification__c.getInstance('APBu');
        PABusinessForExpiryNotification__c EMEABu = PABusinessForExpiryNotification__c.getInstance('EMEABu');
        PABusinessForExpiryNotification__c NABu = PABusinessForExpiryNotification__c.getInstance('NABu');
        PABusinessForExpiryNotification__c LABu = PABusinessForExpiryNotification__c.getInstance('LABu');
        batchSendCustomerPriceDueToExpire sd=new batchSendCustomerPriceDueToExpire(APBu.Business__c);
        database.executebatch(sd, 10);
        batchSendCustomerPriceDueToExpire sd1=new batchSendCustomerPriceDueToExpire(EMEABu.Business__c);
        database.executebatch(sd1, 10);
        batchSendCustomerPriceDueToExpire sd2=new batchSendCustomerPriceDueToExpire(NABu.Business__c);
        database.executebatch(sd2, 10);
        batchSendCustomerPriceDueToExpire sd3=new batchSendCustomerPriceDueToExpire(LABu.Business__c);
        database.executebatch(sd3, 10);

        PABusinessForExpiryNotification__c GlobalBu = PABusinessForExpiryNotification__c.getInstance('GlobalBu');
        batchSendCustomerPriceDueToExpire sd6=new batchSendCustomerPriceDueToExpire(GlobalBu.Business__c);
        database.executebatch(sd6, 10);  

        PABusinessForExpiryNotification__c DPPGlobalBu = PABusinessForExpiryNotification__c.getInstance('DPPGlobalBu');
        batchSendCustomerPriceDueToExpire sd7=new batchSendCustomerPriceDueToExpire(DPPGlobalBu.Business__c);
        database.executebatch(sd7, 10);  */
          
        PANonCustomerBUForExpiryNotification__c EmeaBuNc = PANonCustomerBUForExpiryNotification__c.getInstance('EmeaBuNC');
        batchSendCustomerPriceDueToExpire nsd=new batchSendCustomerPriceDueToExpire(EmeaBuNc.BusinessNonCustomer__c);
        database.executebatch(nsd, 2);

        PANonCustomerBUForExpiryNotification__c GlobalBuNC = PANonCustomerBUForExpiryNotification__c.getInstance('GlobalBuNC');
        batchSendCustomerPriceDueToExpire nsd1=new batchSendCustomerPriceDueToExpire(GlobalBuNC.BusinessNonCustomer__c);
        database.executebatch(nsd1, 2);  
      
        List<PABusinessForExpiryNotification__c> expiry_notification = PABusinessForExpiryNotification__c.getall().values();
         Set<String> busList = new Set<String>();
        for(PABusinessForExpiryNotification__c notify : expiry_notification){
              busList.add(notify.Business__c);    
          }
        busList.remove(null);
        batchSendCustomerPriceDueToExpire sd;
        for(String bu : busList)
        {
            sd=new batchSendCustomerPriceDueToExpire(bu);
            database.executebatch(sd, 2);                
       }
  }
}