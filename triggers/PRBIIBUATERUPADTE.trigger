trigger PRBIIBUATERUPADTE on Pricing_Request__c (after update) {
     //NOVUS Added bypass logic to skip this trigger for Data Migration user 
    Boolean isBypass = PAUtil.CheckBypassProfile();
    if(isBypass){
        return;
    }
	Set<Id>  pricingReqIdSet =new Set<Id>();
	String templateToDelegateApprovar;
    List<String> toAddresses = new List<String>(); 
	String toUserId;
	Boolean checkFlag=false;
	for(Pricing_Request__c pr : Trigger.New)
	{  
    	if(pr.Request_Approval_Status__c == 'Submitted' && pr.Request_Approval_Status__c == Trigger.oldMap.get(pr.id).Request_Approval_Status__c)   
    		checkFlag=true;
    }
    List<EmailTemplate>  templateList =new List<EmailTemplate>();
    //To avoid Too many SOQL queries 101, on test classes
    if(checkFlag)
    {
		templateList = [select Name, Id from EmailTemplate];
    }
    //Start:<GT20140901>
    Set<Id> sentBackupReqIds = new Set<Id>();
    Set<Id> userIds = new Set<Id>();
    Map<Id,Id> mapUsrDelgtd = new Map<Id,Id>();
    //<MS20150522>
    if(PAUtil.PRBIIBUATERUPADTEcheck==null || PAUtil.PRBIIBUATERUPADTEcheck==false)
	{
	    for(Pricing_Request__c prq : Trigger.New)
		{
			if(!Trigger.oldMap.get(prq.Id).Sent_to_Backup_approver__c && prq.Sent_to_Backup_approver__c)
			{
	        	sentBackupReqIds.add(prq.Id);
	        	userIds.add(Trigger.oldMap.get(prq.Id).Current_Approver__c);
			}
		}
		for(User u: [select id,DelegatedApproverid from user where id in :userIds ])
		{
			mapUsrDelgtd.put(u.id,u.DelegatedApproverid);
		}
		Map<Id,ProcessInstanceWorkitem> mapIdWrKItm = new Map<Id,ProcessInstanceWorkitem>();
		for(ProcessInstanceWorkitem wrkItm: [Select processinstance.targetobjectid,p.ActorId From ProcessInstanceWorkitem p where processinstance.targetobjectid in :sentBackupReqIds])
		{
			mapIdWrKItm.put(wrkItm.processinstance.targetobjectid,wrkItm);
		}
		List<ProcessInstanceWorkItem> listUpdateWRITM = new List<ProcessInstanceWorkItem>();
		//End:<GT20140901>
		for(Pricing_Request__c pr : Trigger.New)
		{
	    	System.debug('pr.Sent_to_Backup_approver__c'+pr.Sent_to_Backup_approver__c+'old map'+Trigger.oldMap.get(pr.Id).Sent_to_Backup_approver__c+'*****pr.Request_Approval_Status__c'+pr.Request_Approval_Status__c+'***old map'+Trigger.oldMap.get(pr.id).Request_Approval_Status__c);       
	        if(pr.Request_Approval_Status__c == 'Submitted' && pr.Request_Approval_Status__c == Trigger.oldMap.get(pr.id).Request_Approval_Status__c)
	        { 
	        	pricingReqIdSet.add(pr.Id); 
	            if(!Trigger.oldMap.get(pr.Id).Sent_to_Backup_approver__c && pr.Sent_to_Backup_approver__c)
	            {
	            	//Start:<GT20140901>
	            	if(pr.Current_Level__c == '1' && pr.Backup_Level_1__c <> NULL ||
	            	   pr.Current_Level__c == '2' && pr.Backup_Level_2__c <> NULL ||
	            	   pr.Current_Level__c == '3' && pr.Backup_Level_3__c <> NULL ||
	            	   pr.Current_Level__c == '4' && pr.Backup_Level_4__c <> NULL ||
	            	   pr.Current_Level__c == '5' && pr.Backup_Level_5__c <> NULL
	            	)
		            {
                         if(!Test.isRunningTest()){
	    	        	ProcessInstanceWorkItem item  = mapIdWrKItm.get(pr.Id);
                        system.debug('mapUsrDelgtd '+mapUsrDelgtd);
	    	        	item.ActorId =mapUsrDelgtd.get(Trigger.oldMap.get(pr.Id).Current_Approver__c);
	        	    	listUpdateWRITM.add(item);
                         }
		            }
		            else
		            {
		            	ProcessInstanceWorkItem item  = mapIdWrKItm.get(pr.Id);
		            	System.debug('pr.Current_Approver__c:'+pr.Current_Approver__c);
	    	        	item.ActorId =pr.Current_Approver__c;
	        	    	listUpdateWRITM.add(item);
		            }
	            	//End:<GT20140901>
	            	/*system.debug('checking the ccurrent approver****'+pr.Current_Approver__c);
	             	for(EmailTemplate emailtemp : templateList)
	             	{
	             		if(emailTemp.Id == PA_Email_Template_Custom_Settings__c.getInstance('Approval Template').template_Id__c)
	             		{
	                    	templateToDelegateApprovar=emailTemp.id;
	                	}
	             	}
	        		//templateToDelegateApprovar='00Xa0000001ivwe';  
	            	toUserId=pr.Current_Approver__c;  
	            	String s=[select email from user where id=:toUserId].email;
	            	toAddresses.add(s);
	            	system.debug('checking the ccurrent approver'+ pr.Current_Approver__c);
	            	PAUtil.sendEmailMethod(templateToDelegateApprovar, toAddresses, pr.id, toUserId);   
	            	*/
	            }
	        }
	     }
	     try
	     {
	     	System.debug('listUpdateWRITM:'+listUpdateWRITM);
	     	if(listUpdateWRITM.size()>0)
	     	update listUpdateWRITM;
	     }
	     catch(Exception e)
	     {	
	     		
	     }
	   PAUtil.PRBIIBUATERUPADTEcheck=true;  
    }
}