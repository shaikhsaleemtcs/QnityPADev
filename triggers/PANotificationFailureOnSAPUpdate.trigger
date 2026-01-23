/*
 * Name      :   PANotificationFailureOnSAPUpdate
 * Description  :   This trigger handle the updates to the objects which notify the price posting status
 * Author      :   Infosys Limited <GT20150417>
 * Created Date :   17 April 2015
 */

trigger PANotificationFailureOnSAPUpdate on Price_Posting_Status__c ( before insert, after insert) {

    if(Trigger.IsBefore)
    {
        for(Price_Posting_Status__c notify :trigger.New )
        {
    
            if(notify.Price_Record__c!=null)
            notify.ERP_Sales_Price_SAP__c = notify.Price_Record__c; 
            
        }
    }
    /*
    if(Trigger.isAfter)
    {
        List<Id>PriceIds = new List<Id>();
        set<id>successSet = new Set<Id>();
        set<id>failSet = new set<Id>();
        List<Outbond_Notifier__c> updateSet = new List<Outbond_Notifier__c>();
        for(Price_Posting_Status__c noti: Trigger.new)
        {   
            PriceIds.add(noti.Price_Record__c);
            if(noti.Status__c.contains('53'))
            successSet.add(noti.Price_Record__c);
            else
            failSet.add(noti.Price_Record__c);
        }
        
        for(Outbond_Notifier__c notifier: [select SAP_Status__c,SAP_Received_Timestamp__c,Object_ID__c from Outbond_Notifier__c where Object_ID__C in:PriceIds])
        {
            if(successSet.contains(notifier.Object_ID__c))
            {
                notifier.SAP_Status__c='Received';
                notifier.SAP_Received_Timestamp__c = system.now();
            }
            else
            {
                notifier.SAP_Status__c='Failed';
                
            }
            updateSet.add(notifier);
        }
        
        if(updateSet.size()>0)
         try
         {
            update updateSet;
            if(test.isRunningTest())
            {
                integer i = 2/0;
            }
         }
         catch(Exception e)
         {
            
         }
    }
    */
}