public without sharing class TaskReassign
{
	public Task taskRecord{get;set;}
	public String taskComments{get;set;}
	public boolean reassignTask(PARequest request)
	{
		boolean retVal = false;
		Task selectedTask = [SELECT Id,Status FROM Task WHERE whatId =: request.pricingRequest.Id];
		if(selectedTask.status == 'Completed' || selectedtask.status == 'Cancelled')
		{
			retVal = false;
		}
		else if(request.pricingRequest.Request_Approval_Status__c == 'Approved' && request.pricingRequest.Due_Date__c >= system.today()
				&& selectedTask.status <> 'Completed' && selectedtask.status <> 'Cancelled')
		{
			selectedtask.status = 'Cancelled';
			request.pricingRequest.Request_Approval_Status__c = 'Cancelled';
			upsert selectedtask;
			upsert request.pricingRequest;
			retVal =  true;
		}
		return retVal;
	}

	public void reassignTask1(PARequestItem requestItem)
	{
		requestItem.popUpFlag='TaskComment';		
	}

	public void reassignTask2(PARequestItem requestItem)
	{
		requestItem.taskrecord.TaskCompletionComment__c = taskComments;
		requestItem.taskRecord.Status='Completed';  
		update requestItem.taskRecord;
		requestItem.popUpFlag='disableOk';
	}
}