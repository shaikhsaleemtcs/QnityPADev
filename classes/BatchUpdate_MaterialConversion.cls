/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 31st Jan 2020
Description: This Batch class will update the value of field External_ERP_ID__c for object ERP_Material_Conversion_Factor__c.
***********************************************************************************************
<CRM-2021-04-0192>
Last Modified By    :   Harsh
Last Modified Date  :   02/07/2021
Description         :   Added OR and replace condition for the P80 requirements
************************************************************************************************/
global class BatchUpdate_MaterialConversion implements Database.Batchable<sObject>
{

    public List<ERP_Material_Conversion_Factor__c> MaterialConversionList = new List<ERP_Material_Conversion_Factor__c>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {     
        string startQuery = 'SELECT id, External_ERP_ID__c,Name FROM ERP_Material_Conversion_Factor__c';     
        return Database.getQueryLocator(startQuery);  
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> returnedMaterialConversionFromQuery)
    {
        List<ERP_Material_Conversion_Factor__c> update_MaterialConversionList= new List<ERP_Material_Conversion_Factor__c>();  
        MaterialConversionList= returnedMaterialConversionFromQuery;    
        
        for(ERP_Material_Conversion_Factor__c e: MaterialConversionList)
        {
            //Start_<CRM-2021-04-0192> -- Adding OR condition
            if(e.External_ERP_ID__c.contains('Q23') || e.External_ERP_ID__c.contains('Q80'))
            {
                e.External_ERP_ID__c = e.External_ERP_ID__c.replace('Q23','P23').replace('Q80','P80') ; //-- Adding replace for <CRM-2021-04-0192>
                //End_<CRM-2021-04-0192>
            }
            
            update_MaterialConversionList.add(e);
        }  
        if(update_MaterialConversionList.size()>0)
        {
            update update_MaterialConversionList;
        }
    }
    global void finish(Database.BatchableContext BC){}
}