/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 31st Jan 2020
Description: This Batch class will update the value of fields Source_Cluster__c and External_ERP_ID__c for object ERP_Customer__c.
**********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_ERPCustomer implements Database.Batchable<sObject>
{
  
    public List<ERP_Customer__c> customerList = new List<ERP_Customer__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {    
        string startQuery = 'SELECT id, Source_Cluster__c,External_ERP_ID__c,Name FROM ERP_Customer__c where Source_Cluster__c!=null';     
        return Database.getQueryLocator(startQuery);  
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> returnedcustomrsFromQuery)
    {
        List<ERP_Customer__c> update_customerList = new List<ERP_Customer__c>();  
        customerList = returnedcustomrsFromQuery;    
        
        for(ERP_Customer__c e: customerList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.Source_Cluster__c.contains('Q23') || e.Source_Cluster__c.contains('Q80') )
            {
                e.Source_Cluster__c = e.Source_Cluster__c .replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
                e.External_ERP_ID__c=e.External_ERP_ID__c.replace('Q23','P23').replace('Q80','P80'); //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
            
            update_customerList.add(e);
        }
        
        if(update_customerList.size()>0)
        {
            update update_customerList;
        }
    }
    global void finish(Database.BatchableContext BC){}
}