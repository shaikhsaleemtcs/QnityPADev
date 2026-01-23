//trigger to create a task after the pricing request is approved

/*   Ver.                       Developer                           Changes                                Dependencies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.2                         Prachi                           added record type                           None
//  1.3                         Prachi                           inserting task outside FOR loop             None

trigger TaskCreationAfterApproval on Pricing_Request__c (after insert,after update) {
    public Task createdtask = new Task();
    list<Task> taskList = new List<Task>();   
    //to get the id of the record type
    public static final Id Task_Pricing_Task_RTYPE = null;
     Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
    system.debug('@@@123'+Task_Pricing_Task_RTYPE);    
    for(Pricing_Request__c priceReq : trigger.new)
    {
        // system.debug('@@@priceReq.Request_Approval_Status__c'+priceReq.Request_Approval_Status__c); 
        // system.debug('@@@priceReq.Trigger.oldMap.get(priceReq.Id)'+Trigger.oldMap.get(priceReq.Id));
        if(priceReq.Request_Approval_Status__c == 'Approved' && Trigger.oldMap.get(priceReq.Id) != null && 
           Trigger.oldMap.get(priceReq.Id).Request_Approval_Status__c!='Approved' && 
           priceReq.Pricing_Request_Type__c == 'Pricing Task')
        {
                if(Task_Pricing_Task_RTYPE == NULL)
                    Task_Pricing_Task_RTYPE = Rtype.getIdByDevName('Task','Pricing_Task');
                system.debug('@@@@@@@@@'+priceReq.Id);
                createdTask = new Task(ownerId = priceReq.Assigned_To__c , whatId = priceReq.Id,
                                       ActivityDate = priceReq.Due_Date__c, Subject = priceReq.Task_Subject__c, 
                                       RecordTypeId = Task_Pricing_Task_RTYPE);            
                taskList.add(createdTask);               
         }
         system.debug('***In after update'+priceReq.Current_Approver__c+priceReq.Current_LEvel__c);
    }   
    //insert the task 
    if(taskList.size() > 0)
    {
        upsert taskList;
    }   
}