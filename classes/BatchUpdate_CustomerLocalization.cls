/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 3rd Feb 2020
Description: This Batch class will update the value of field External_ERP_ID__c for object ERP_Customer_Localization__c.
**********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_CustomerLocalization implements Database.Batchable<sObject>
{
    public List<ERP_Customer_Localization__c> materialList = new List<ERP_Customer_Localization__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string startQuery = 'SELECT id, External_ERP_ID__c,Name FROM ERP_Customer_Localization__c where External_ERP_ID__c!=null';    
        return Database.getQueryLocator(startQuery);
    } 
       
    global void execute(Database.BatchableContext BC, List<sObject> returnedKeyCombinationFromQuery)
    {
        List<ERP_Customer_Localization__c> update_customerLocal= new List<ERP_Customer_Localization__c>();  
        materialList= returnedKeyCombinationFromQuery;    
        
        for(ERP_Customer_Localization__c e: materialList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.External_ERP_ID__c.contains('Q23') || e.External_ERP_ID__c.contains('Q80'))
            {
                //-- Adding replace for P80
                e.External_ERP_ID__c = e.External_ERP_ID__c.replace('Q23','P23').replace('Q80','P80') ;
                //End_<CRM-2021-04-0192>
            }
             
            update_customerLocal.add(e);
        }  
        if(update_customerLocal.size()>0)
        {
            update update_customerLocal;
        }
    }
    
    global void finish(Database.BatchableContext BC){}
}