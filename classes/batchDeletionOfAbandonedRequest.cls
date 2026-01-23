/*
 * Name		 :   batchProjectStatusChange
 * Description  :   
 * Author	   :   Infosys Limited
 * Created Date :   Anand Darshi
 *
 * Version	 Modified Date	   Modified By   			  Modification
 *
 * ---------------------------------------------------------------------------------------------------- 
 */
 global class batchDeletionOfAbandonedRequest implements Database.Batchable<sObject>
 {
	public Date vt=System.today();
	public string startQuery = 'SELect id FROM Pricing_Request__c WHERE Request_Approval_Status__c=\'Abandoned\' and CreatedDate <LAST_N_DAYS:29';
	global Database.QueryLocator start(Database.BatchableContext BC)
	{ 
		return Database.getQueryLocator(startQuery);	
	}
	global void execute(Database.BatchableContext BC, List<sObject> returnedRequestsFromQuery)
	{
		if(returnedRequestsFromQuery.size()>0)
		{   
			delete returnedRequestsFromQuery;
		}	
	}
	global void finish(Database.BatchableContext BC)
	{
	} 
}