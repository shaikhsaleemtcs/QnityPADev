/*
 * Name         :   TaskCreationAfterProjectApproval
 * Description  :   Task Creation After Project Approval
 * Author       :   Infosys Limited
 * Created Date :   16-01-2013
 *
 /*   Ver.                       Developer                           Changes                                Dependancies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.                           Anand                              Class                                       None
//  1.1                          anand                              RecordType 19 FEB                           none
//  1.2                          anand                              Abandone remove request from project        none
//  1.3                          anand                              On Abandon revert back the project details  none    6 MAR 
// <PG20190521> Checking Not Null condition regarding IS ID-00089170-PS CRM
trigger TaskCreationAfterProjectApproval on Pricing_Request__c (after update) {
    public Task createdtask = new Task();
    public User userTask;
    List<Id> submittedIds = new List<Id>();
    List<Id> approvedIds = new List<Id>();
    List<Id> abandonedIds = new List<Id>();
    List<Id> recalledIds = new List<Id>();
    List<Id> rejectedIds = new List<Id>();
    List<Id> projectIdsToBeDetached = new List<Id>();  
    //to get the id of the record type 
    public static final Id Task_Project_RTYPE = null;  
     //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
    for(Pricing_Request__c priceReq : trigger.new)
    {
       system.debug('ddddddddd'+priceReq.Request_Approval_Status__c) ;
        //project status change on submit for approval
        if(priceReq.Request_Approval_Status__c =='Submitted' && priceReq.Project_Price__c != null && Trigger.oldMap.get(priceReq.Id).Request_Approval_Status__c !='Submitted' && priceReq.Pricing_Request_Type__c == 'Project Pricing')
        {   
            submittedIds.add(priceReq.Project_Price__c);
        }
        //<PG20190521>- Checking for NOT NULL value for Task_Project_RTYPE variable
        else if(priceReq.Request_Approval_Status__c == 'Approved' && priceReq.Project_Price__c != null && Trigger.oldMap.get(priceReq.Id).Request_Approval_Status__c !='Approved' && priceReq.Pricing_Request_Type__c == 'Project Pricing')
        {
            if(Task_Project_RTYPE == NULL)
            Task_Project_RTYPE = Rtype.getIdByDevName('Task','Project_Price_Task');
            approvedIds.add(priceReq.Project_Price__c);
        }   
        else if(priceReq.Request_Approval_Status__c == 'Abandoned' && priceReq.Project_Price__c != null && Trigger.oldMap.get(priceReq.Id).Request_Approval_Status__c !='Abandoned' && priceReq.Pricing_Request_Type__c == 'Project Pricing')
        {
            abandonedIds.add(priceReq.Project_Price__c);
        }
        else if(priceReq.Request_Approval_Status__c == 'Recalled' && priceReq.Project_Price__c != null && Trigger.oldMap.get(priceReq.Id).Request_Approval_Status__c !='Recalled' && priceReq.Pricing_Request_Type__c == 'Project Pricing')
        {
            recalledIds.add(priceReq.Project_Price__c);
        }
        else if(priceReq.Request_Approval_Status__c == 'Rejected' && priceReq.Project_Price__c != null && Trigger.oldMap.get(priceReq.Id).Request_Approval_Status__c !='Rejected' && priceReq.Pricing_Request_Type__c == 'Project Pricing')
        {
            rejectedIds.add(priceReq.Project_Price__c);
        }
     }  
     list<Pricing_Request__c> pricingRequestUpdateList=new list<Pricing_Request__c>(); // to make lookup field Null
     list<Project_Price__c>  pricingProjectUpdateList = new list<Project_Price__c>();
     list<Project_Price__c>  submittedProjectUpdateList=new  list<Project_Price__c>();
     list<Project_Price__c>  approvedProjectUpdateList=new  list<Project_Price__c>();
     list<Project_Price__c>  abandonedProjectUpdateList=new  list<Project_Price__c>();
     list<Project_Price__c>  recalledProjectUpdateList=new  list<Project_Price__c>();
     list<Project_Price__c>  rejectedProjectUpdateList=new  list<Project_Price__c>();
     list<Task> taskList = new List<Task>(); 
     if(submittedIds.size()>0)
     {
           List<Project_Price__c>  submittedProjectList=[select id,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,Project_status__c,Assigned_To__c FROM Project_Price__c WHERE id in :submittedIds];
           for( Project_Price__c pObj : submittedProjectList)
           {        
                if(pObj.Project_status__c=='Draft' || pObj.Project_status__c=='Recalled' || pObj.Project_status__c=='Rejected' || pObj.Project_status__c=='Approved')
                {
                    pObj.Project_status__c = 'Submitted';
                    submittedProjectUpdateList.add(pObj);
                }
          }       
     }
     if(approvedIds.size()>0)
     {
        List<Project_Price__c>  approvedProjectList=[select id,isApproved__c,Approved_Default_Discount__c,Approved_Project_Description__c,Approved_Project_Volume__c,
                                Approved_Valid_From__c,Approved_Valid_To__c,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,
                                status__c,Project_status__c,Assigned_To__c,Project_Volume__c,Default_Discount__c FROM Project_Price__c WHERE id IN :approvedIds];                         
        system.debug('***approvedProjectList:'+approvedProjectList);
        for( Project_Price__c pObj : approvedProjectList)
        {   
            if(pObj.Project_status__c !='Approved')
            {
                 pObj.Project_status__c = 'Approved';
                 if(pObj.isApproved__c){
                        pObj.Approved_Default_Discount__c=pObj.Default_Discount__c;
                        pObj.Approved_Project_Description__c=pObj.Project_Description__c;
                        pObj.Approved_Project_Volume__c=pObj.Project_Volume__c;
                        pObj.Approved_Valid_From__c=pObj.Valid_From__c;
                        pObj.Approved_Valid_To__c=pObj.Valid_To__c;
                 }
                 else
                 {
                        pObj.isApproved__c=true;
                        pObj.Approved_Default_Discount__c=pObj.Default_Discount__c;
                        pObj.Approved_Project_Description__c=pObj.Project_Description__c;
                        pObj.Approved_Project_Volume__c=pObj.Project_Volume__c;
                        pObj.Approved_Valid_From__c=pObj.Valid_From__c;
                        pObj.Approved_Valid_To__c=pObj.Valid_To__c;
                 }
                 system.debug('***pObj:'+pObj);
                 approvedProjectUpdateList.add(pObj);
                 projectIdsToBeDetached.add(pObj.id); 
                 task existingTask=new task();
                 try
                 {
                      existingTask =[Select id,ownerId,ActivityDate,Description,Subject From task where WhatId=:pObj.Id ];
                 }
                 catch(QueryException e)
                 {
                     if(existingTask.id == null){
                         createdTask = new Task(ownerId = pObj.Assigned_To__c , whatId = pObj.Id, ActivityDate = pObj.Valid_To__c, Subject = pObj.Name ,Description = pObj.Project_Description__c,RecordTypeId = Task_Project_RTYPE );
                         taskList.add(createdTask);
                     }
                 }
                if(existingTask.id !=null)
                {
                    existingTask.Description=existingTask.Description+pObj.Project_Description__c;
                    existingTask.ActivityDate=pObj.Valid_To__c;
                    taskList.add(existingTask);
                }   
            }
        }
     }
     if(abandonedIds.size()>0)
     {
           List<Project_Price__c>  abandonedProjectList=[select id,isApproved__c,Approved_Default_Discount__c,Approved_Project_Description__c,Approved_Project_Volume__c,
                                Approved_Valid_From__c,Approved_Valid_To__c,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,
                                Project_status__c,Assigned_To__c,Project_Volume__c,Default_Discount__c FROM Project_Price__c WHERE id in :abandonedIds];
           for( Project_Price__c pObj : abandonedProjectList)
           {        
                system.debug('***pObj.isApproved__c:'+pObj.isApproved__c);
                if(pObj.isApproved__c==false && (pObj.Project_status__c=='Draft' || pObj.Project_status__c=='Recalled' || pObj.Project_status__c=='Rejected'))
                {
                    pObj.Project_status__c = 'Abandoned';
                    abandonedProjectUpdateList.add(pObj);
                    system.debug('***abandonedProjectUpdateList:'+abandonedProjectUpdateList);
                }
                if(pObj.isApproved__c==true && (pObj.Project_status__c=='Draft' || pObj.Project_status__c=='Recalled' || pObj.Project_status__c=='Rejected' || pObj.Project_status__c=='Approved' ))
                {                    
                    //revert the aaproved project values
                    pObj.Default_Discount__c=pObj.Approved_Default_Discount__c;
                    pObj.Project_Description__c=pObj.Approved_Project_Description__c;
                    pObj.Project_Volume__c=pObj.Approved_Project_Volume__c;
                    pObj.Valid_From__c= pObj.Approved_Valid_From__c;
                    pObj.Valid_To__c=pObj.Approved_Valid_To__c;
                    pObj.Project_Status__c='Approved';
                    abandonedProjectUpdateList.add(pObj);
                    projectIdsToBeDetached.add(pObj.id);
                }
          }
     }   
     if(recalledIds.size()>0)
     {
           List<Project_Price__c>  recalledProjectList=[select id,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,Project_status__c,Assigned_To__c FROM Project_Price__c WHERE id in :recalledIds];
           for( Project_Price__c pObj : recalledProjectList)
           {        
                if(pObj.Project_status__c =='Submitted')
                {
                    pObj.Project_status__c = 'Recalled';
                    recalledProjectUpdateList.add(pObj);
                }
           }
     }    
     if(rejectedIds.size()>0)
     {
           List<Project_Price__c>  rejectedProjectList=[select id,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,Project_status__c,Assigned_To__c FROM Project_Price__c WHERE id in :rejectedIds];
           for( Project_Price__c pObj : rejectedProjectList)
           {        
                if(pObj.Project_status__c=='Submitted')
                {
                    pObj.Project_status__c = 'Rejected';
                    rejectedProjectUpdateList.add(pObj);
                }
          }
     }      
    if(projectIdsToBeDetached.size()>0)
    {
        list<Pricing_Request__c> priReqList = [SELECT id,CSR_Instruction__c,Project_Price__c FROM Pricing_Request__c WHERE Project_Price__c In :projectIdsToBeDetached];
        system.debug('***projectIdsToBeDetached:'+priReqList);        
        for(Pricing_Request__c r:priReqList)
        {
            r.Project_Price__c=null;
            pricingRequestUpdateList.add(r);
            system.debug('***pricingRequestUpdateList:'+pricingRequestUpdateList);  
        }        
    }              
    //public static final Id CREDITDOC_TEMPLATE_RTYPE = Rtype.getIdByDevName('Credit_Documentation__c','Template');    
    //update list   
    if(submittedProjectUpdateList.size() > 0)
    {
        upsert submittedProjectUpdateList;
    }
    if(approvedProjectUpdateList.size() > 0)
    {
        upsert approvedProjectUpdateList;
    }
    if(taskList.size() > 0)
    {
        upsert taskList;
    }
    if(pricingRequestUpdateList.size()>0)
    {
        upsert pricingRequestUpdateList;
         system.debug('***abandonedProjectUpdateList:'+pricingRequestUpdateList);
    }
    if(abandonedProjectUpdateList.size()>0)
    {
        upsert abandonedProjectUpdateList;
         system.debug('***abandonedProjectUpdateList:'+abandonedProjectUpdateList);  
    }
    if(recalledProjectUpdateList.size()>0)
    {
        upsert recalledProjectUpdateList;
    }
    if(rejectedProjectUpdateList.size()>0)
    {
        upsert rejectedProjectUpdateList;
    }   
}