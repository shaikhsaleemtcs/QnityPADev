/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved.
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 3rd Feb 2020
Description: This Batch class will update the value of field External_ERP_ID__c for object Material_Localization__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_MaterialLocalization implements Database.Batchable<sObject>
{
    public List<Material_Localization__c> materialList = new List<Material_Localization__c>();
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string startQuery = 'SELECT id, External_ERP_ID__c,Name FROM Material_Localization__c where External_ERP_ID__c!=null';
        return Database.getQueryLocator(startQuery);
    }  
       
    global void execute(Database.BatchableContext BC, List<sObject> returnedKeyCombinationFromQuery)
    {
        List<Material_Localization__c> update_materialLocal = new List<Material_Localization__c>();
        materialList = returnedKeyCombinationFromQuery;
        
        for(Material_Localization__c e: materialList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.External_ERP_ID__c.contains('Q23') || e.External_ERP_ID__c.contains('Q80'))
            {
                e.External_ERP_ID__c = e.External_ERP_ID__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
                //End_<CRM-2021-04-0192>
            }
            
            update_materialLocal.add(e);
        }
        if(update_materialLocal.size()>0)
        {
            update update_materialLocal;
        }
    }
    
    global void finish(Database.BatchableContext BC){}
}