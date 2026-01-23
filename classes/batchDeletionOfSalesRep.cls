/*
 * Name		 :   batchDeletionOfSalesRep
 * Description  :   
 * Author	   :   Infosys Limited <DW20150106>
 * Created Date :   06Jan2015
 *
 * Version	 Modified Date	   Modified By   			  Modification
 *
 * ---------------------------------------------------------------------------------------------------- 
 */
 global class batchDeletionOfSalesRep implements Database.Batchable<sObject>,Schedulable 
{
public Date vt=System.today();
	//public string startQuery = 'SELect id FROM ERP_Relationship__c WHERE Deletion_Flag__c=True ';
	global Database.QueryLocator start(Database.BatchableContext BC)
	{ 
		return Database.getQueryLocator([SELect id FROM ERP_Relationship__c WHERE Deletion_Flag__c=True limit 50000]);	
	}
	global void execute(Database.BatchableContext BC, List<sObject> returnedRequestsFromQuery)
	{
		if(returnedRequestsFromQuery.size()>0)
		{   
			system.debug('***size'+returnedRequestsFromQuery.size());
			try
			{
				delete returnedRequestsFromQuery;
			}
			Catch(Exception e)
			{
				//Need to handle exceptional cases here
			}
		}	
	}
	global void finish(Database.BatchableContext BC)
	{
	} 
	global void execute(SchedulableContext SC) {
		batchDeletionOfSalesRep batch = new batchDeletionOfSalesRep();
		database.executebatch(batch);
	}
}