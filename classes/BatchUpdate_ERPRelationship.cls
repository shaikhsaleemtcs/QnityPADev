/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 12th Feb 2020
Description: This Batch class will update the value of field External_ERP_ID__c for object ERP_Relationship__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_ERPRelationship implements Database.Batchable<sObject>
{

    public List<ERP_Relationship__c> RelationshipList= new List<ERP_Relationship__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {     
        string startQuery = 'SELECT id, External_ERP_ID__c,Name FROM ERP_Relationship__c where External_ERP_ID__c!=null';     
        return Database.getQueryLocator(startQuery);
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> returnedRelationshipy)
    {
        List<ERP_Relationship__c> update_RelationshipList = new List<ERP_Relationship__c>();  
        RelationshipList = returnedRelationshipy;    
        
        for(ERP_Relationship__c e: RelationshipList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.External_ERP_ID__c.contains('Q23') || e.External_ERP_ID__c.contains('Q80'))
            {
                e.External_ERP_ID__c = e.External_ERP_ID__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
            }//End_<CRM-2021-04-0192>
         
            update_RelationshipList.add(e);
        }
        if(update_RelationshipList.size()>0)
        {
            update update_RelationshipList;
        }
    }
    global void finish(Database.BatchableContext BC){}
}