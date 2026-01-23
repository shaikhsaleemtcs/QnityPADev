trigger ProjectDeletionOnRequestDeletion on Pricing_Request__c (before delete) {
	Set<Id> preojectIdList = new Set<Id>();
	Set<Id> preojectIdDeletList = new Set<Id>();
	Set<Id> preojectIdUpdateList = new Set<Id>();
      //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
    for(Pricing_Request__c priceReq : Trigger.old)
    {
    	if( (priceReq.Request_Approval_Status__c == 'Draft' || priceReq.Request_Approval_Status__c == 'Recalled' || priceReq.Request_Approval_Status__c == 'Rejected')  && priceReq.Pricing_Request_Type__c == 'Project Pricing')
    	{
                if(priceReq.Project_Price__c != null)
                {
                    preojectIdList.add(priceReq.Project_Price__c);
                }
        }
    }
    list<Project_Price__c>  approvedProjectUpdateList=new  list<Project_Price__c>();
    list<Project_Price__c>  projectList=[select id,isApproved__c,Approved_Default_Discount__c,Approved_Project_Description__c,Approved_Project_Volume__c,
                                Approved_Valid_From__c,Approved_Valid_To__c,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,
                                Project_status__c,Assigned_To__c,Project_Volume__c,Default_Discount__c FROM Project_Price__c WHERE id In :preojectIdList];
    for(Project_Price__c pObj: projectList)
    {
         if(pObj.isApproved__c==false && pObj.Project_status__c !='Approved')
         {
             preojectIdDeletList.add(pObj.id);
         }
         if(pObj.isApproved__c==true)
         {
            //revert the aaproved project values
            pObj.Default_Discount__c=pObj.Approved_Default_Discount__c;
            pObj.Project_Description__c=pObj.Approved_Project_Description__c;
            pObj.Project_Volume__c=pObj.Approved_Project_Volume__c;
            pObj.Valid_From__c= pObj.Approved_Valid_From__c;
            pObj.Valid_To__c=pObj.Approved_Valid_To__c;
            pObj.Project_Status__c='Approved';
            approvedProjectUpdateList.add(pObj);  
         }  
    }
    list<Project_Price__c>  deletProjectList=new  list<Project_Price__c>();
    deletProjectList=[select Id from Project_Price__c where Id IN :preojectIdDeletList];
    if(deletProjectList.size()>0)
    {   
         delete deletProjectList;
    }
    if(approvedProjectUpdateList.size() >0)
    {
        upsert approvedProjectUpdateList;
    }
}