/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved.
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 3rd Feb 2020
Description: This Batch class will update the value of field SAP_Cluster__c for object Sales_Prices__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_SalesPriceNonSAP implements Database.Batchable<sObject>
{
    public List<Sales_Prices__c> NonSAPList = new List<Sales_Prices__c>();   
    global Database.QueryLocator start(Database.BatchableContext BC)
    {     
        string startQuery = 'SELECT id, SAP_Cluster__c,Name FROM Sales_Prices__c where SAP_Cluster__c!=null';
        return Database.getQueryLocator(startQuery);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> returnedNonSAPFromQuery)
    {
        List<Sales_Prices__c> update_NonSAPList= new List<Sales_Prices__c>();
        NonSAPList = returnedNonSAPFromQuery;
        
        for(Sales_Prices__c e: NonSAPList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.SAP_Cluster__c.contains('Q23') || e.SAP_Cluster__c.contains('Q80'))
            {
                e.SAP_Cluster__c = e.SAP_Cluster__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
              
            update_NonSAPList.add(e);
        }  
        if(update_NonSAPList.size()>0)
        {
            update update_NonSAPList;
        }
    }
    
    global void finish(Database.BatchableContext BC){}
}