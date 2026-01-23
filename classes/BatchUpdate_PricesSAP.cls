/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved.
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 3rd Feb 2020
Description: This Batch class will update the value of field SAP_Cluster__c for object ERP_Sales_Prices_SAP__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_PricesSAP implements Database.Batchable<sObject>
{
    public List<ERP_Sales_Prices_SAP__c> SAPList = new List<ERP_Sales_Prices_SAP__c>();  
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string startQuery = 'SELECT id, SAP_Cluster__c,Name FROM ERP_Sales_Prices_SAP__c where SAP_Cluster__c!=null';
        return Database.getQueryLocator(startQuery);
    }
      
    global void execute(Database.BatchableContext BC, List<sObject> returnedPricesSAPFromQuery)
    {
        List<ERP_Sales_Prices_SAP__c> update_SAPList = new List<ERP_Sales_Prices_SAP__c>();
        SAPList = returnedPricesSAPFromQuery; 
        
        for(ERP_Sales_Prices_SAP__c e: SAPList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.SAP_Cluster__c.contains('Q23') || e.SAP_Cluster__c.contains('Q80'))
            {
                e.SAP_Cluster__c = e.SAP_Cluster__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
            
            update_SAPList.add(e);
        }
        if(update_SAPList.size()>0)
        {
            update update_SAPList;
        }
    }
    
    global void finish(Database.BatchableContext BC){}
}