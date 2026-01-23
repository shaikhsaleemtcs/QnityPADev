/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 12th Feb 2020
Description: This Batch class will update the value of field SAP_Cluster__c for object ERP_Key_Combination__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_KeyCombinition implements Database.Batchable<sObject>
{
  
    public List<ERP_Key_Combination__c> PCList= new List<ERP_Key_Combination__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {     
        string startQuery = 'SELECT id, SAP_Cluster__c,Name FROM ERP_Key_Combination__c where SAP_Cluster__c!=null';     
        return Database.getQueryLocator(startQuery);
    }  
   
    global void execute(Database.BatchableContext BC, List<sObject> returnedKeyCombinationFromQuery)
    {
        List<ERP_Key_Combination__c> update_KeyCombinationList = new List<ERP_Key_Combination__c>();  
        PCList = returnedKeyCombinationFromQuery;    
        
        for(ERP_Key_Combination__c e: PCList)
        {
            //Start_<CRM-2021-04-0192>
            if(e.SAP_Cluster__c.contains('Q23') || e.SAP_Cluster__c.contains('Q80'))
            {
                e.SAP_Cluster__c = e.SAP_Cluster__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
             
            update_KeyCombinationList.add(e);
        }
        if(update_KeyCombinationList.size()>0)
        {
            update update_KeyCombinationList;
        }
    }
    global void finish(Database.BatchableContext BC){}
}