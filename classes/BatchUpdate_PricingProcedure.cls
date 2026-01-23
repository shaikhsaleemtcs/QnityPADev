/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 31st Jan 2020
Description: This Batch class will update the value of field SAP_Cluster__c for object ERP_Pricing_Procedure__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_PricingProcedure implements Database.Batchable<sObject>
{

    public List<ERP_Pricing_Procedure__c> SAPList= new List<ERP_Pricing_Procedure__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string startQuery = 'SELECT id, SAP_Cluster__c,Name FROM ERP_Pricing_Procedure__c where SAP_Cluster__c!=null';     
        return Database.getQueryLocator(startQuery);
    }  
   
    global void execute(Database.BatchableContext BC, List<sObject> returnedPriceProcedureFromQuery)
        {
        List<ERP_Pricing_Procedure__c> update_PriceProcedureList = new List<ERP_Pricing_Procedure__c>();  
        SAPList = returnedPriceProcedureFromQuery;    
        
        for(ERP_Pricing_Procedure__c e: SAPList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.SAP_Cluster__c.contains('Q23') || e.SAP_Cluster__c.contains('Q80'))
            {
                e.SAP_Cluster__c = e.SAP_Cluster__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
            
            update_PriceProcedureList.add(e);
        }
        if(update_PriceProcedureList.size()>0)
        {
            update update_PriceProcedureList;
        }
    }
    global void finish(Database.BatchableContext BC){}
}