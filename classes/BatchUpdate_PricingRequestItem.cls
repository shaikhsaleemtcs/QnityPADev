/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 31st Jan 2020
Description: This Batch class will update the value of field SAP_Cluster__c for object Pricing_Request_Item__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_PricingRequestItem implements Database.Batchable<sObject>
{
  
    public List<Pricing_Request_Item__c> PCList= new List<Pricing_Request_Item__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {     
        string startQuery = 'SELECT id, SAP_Cluster__c,Name FROM Pricing_Request_Item__c where SAP_Cluster__c!=null';     
        return Database.getQueryLocator(startQuery);  
    }  
   
    global void execute(Database.BatchableContext BC, List<sObject> returnedKeyCombinationFromQuery)
    {
        List<Pricing_Request_Item__c> update_PricingRequestItem = new List<Pricing_Request_Item__c>();  
        PCList = returnedKeyCombinationFromQuery;    
        
        for(Pricing_Request_Item__c e: PCList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.SAP_Cluster__c.contains('Q23') || e.SAP_Cluster__c.contains('Q80'))
            {
                e.SAP_Cluster__c = e.SAP_Cluster__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
              
            update_PricingRequestItem.add(e);
        }  
        if(update_PricingRequestItem.size()>0)
        {
            update update_PricingRequestItem;
        }
    }
    global void finish(Database.BatchableContext BC){}
}