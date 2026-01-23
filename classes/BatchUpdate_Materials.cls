/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 31st Jan 2020
Description: This Batch class will update the values of fields ERP_Source_Cluster__c and External_ERP_ID__c for object Material__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_Materials implements Database.Batchable<sObject>
{

    public List<Material__c> materialList= new List<Material__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string startQuery = 'SELECT id, ERP_Source_Cluster__c,External_ERP_ID__c,Name FROM Material__c';     
        return Database.getQueryLocator(startQuery);  
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> returnedMaterialsFromQuery)
    {
        List<Material__c> update_materialList= new List<Material__c>();  
        materialList= returnedMaterialsFromQuery;    
    
        for(Material__c e: materialList)
        {
             //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.ERP_Source_Cluster__c.contains('Q23') || e.ERP_Source_Cluster__c.contains('Q80'))
            {
                e.ERP_Source_Cluster__c = e.ERP_Source_Cluster__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
                e.External_ERP_ID__c = e.External_ERP_ID__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
                //End_<CRM-2021-04-0192>
            }
              
            update_materialList.add(e);
        }  
        if(update_materialList.size()>0)
        {
            update update_materialList;
        }
    }
    global void finish(Database.BatchableContext BC){}
}