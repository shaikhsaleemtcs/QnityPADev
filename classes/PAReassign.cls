/*****************************************************************************************************************
<VR20140221>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   21 Feb 2014
Description         :   Global Rollout - WebService Class created for Reassign and Recall
 *****************************************************************************************************************
 <PR20140902>
Last Modified By    :   Priyanka R
Last Modified Date  :   02 Sep 2014
Description         :   Modified reassign method to support bulkified requests
 *****************************************************************************************************************/
global class PAReassign {

	webservice static string reAssign(string requestId,string currentAssignedUserId,string reassignUserId) {
		// <PR20140902> START
		/*ProcessInstanceWorkItem processes = new ProcessInstanceWorkItem();
		try{
			Pricing_Request__c prReq = [SELECT Id,Current_Level__c,Approver1__c,Approver2__c,Approver3__c,Approver4__c,Approver5__c,Backup_Level_1__c,
			                            Backup_Level_2__c,Backup_Level_3__c,Backup_Level_4__c,Backup_Level_5__c,Sent_to_Backup_Approver__c,
			                            Sent_to_BUAdmin__c FROM Pricing_Request__c WHERE Id = :requestId];
			String level = prReq.Current_Level__c;
			if(level == '1'){
				prReq.Approver1__c = reassignUserId;
				prReq.Backup_Level_1__c = null;
			}
			else if(level == '2'){
				prReq.Approver2__c = reassignUserId;
				prReq.Backup_Level_2__c = null;
			}
			else if(level == '3'){
				prReq.Approver3__c = reassignUserId;
				prReq.Backup_Level_3__c = null;
			}
			else if(level == '4'){
				prReq.Approver4__c = reassignUserId;
				prReq.Backup_Level_4__c = null;
			}  
			else if(level == '5'){
				prReq.Approver5__c = reassignUserId;
				prReq.Backup_Level_5__c = null;
			}             
			prReq.Sent_to_Backup_Approver__c = false;
			prReq.Sent_to_BUAdmin__c = false;
			update prReq;
			System.debug('****requestId'+requestId+'*****currentAssignedUserId'+currentAssignedUserId+'***reassignUserId'+reassignUserId);
			processes = [SELECT p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where processinstance.targetobjectid = :requestId order by CreatedDate DESC LIMIT 1];            
			processes.ActorId = reassignUserId;
			update processes;       
		}
		catch(Exception e) {
			return e.getmessage();
			//return reassignUserId;
		}
		return 'Success'; */
		
		List<String> requestIdList = new List<String>();
		if(requestId.contains('-')){
			for(String reqId : requestId.split('-')){
				requestIdList.add(reqId.trim());
			}
		}else{
			requestIdList.add(requestId.trim());
		}
		system.debug('\n\n\n requestIdList '+requestIdList);
		List<Pricing_Request__c> updatePrReqList = new List<Pricing_Request__c>();
		try{
			List<Pricing_Request__c> prReqList = new List<Pricing_Request__c>();
			prReqList = [SELECT Id,Current_Level__c,Approver1__c,Approver2__c,Approver3__c,Approver4__c,Approver5__c,Backup_Level_1__c,
			                            Backup_Level_2__c,Backup_Level_3__c,Backup_Level_4__c,Backup_Level_5__c,Sent_to_Backup_Approver__c,
			                            Sent_to_BUAdmin__c FROM Pricing_Request__c WHERE Id IN :requestIdList];
			for(Pricing_Request__c prReq:prReqList){
				String level = prReq.Current_Level__c;
				if(level == '1'){
					prReq.Approver1__c = reassignUserId;
					prReq.Backup_Level_1__c = null;
				}
				else if(level == '2'){
					prReq.Approver2__c = reassignUserId;
					prReq.Backup_Level_2__c = null;
				}
				else if(level == '3'){
					prReq.Approver3__c = reassignUserId;
					prReq.Backup_Level_3__c = null;
				}
				else if(level == '4'){
					prReq.Approver4__c = reassignUserId;
					prReq.Backup_Level_4__c = null;
				}  
				else if(level == '5'){
					prReq.Approver5__c = reassignUserId;
					prReq.Backup_Level_5__c = null;
				}             
				prReq.Sent_to_Backup_Approver__c = false;
				prReq.Sent_to_BUAdmin__c = false;
				updatePrReqList.add(prReq);
			}
			update updatePrReqList;
			System.debug('****requestId'+requestIdList+'*****currentAssignedUserId'+currentAssignedUserId+'***reassignUserId'+reassignUserId);
			List<ProcessInstanceWorkItem> processesList = new List<ProcessInstanceWorkItem>();
			processesList = [SELECT p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where processinstance.targetobjectid IN :requestIdList order by CreatedDate DESC];            
			if(processesList != null && processesList.size()>0){
				for(ProcessInstanceWorkItem p : processesList){
	            	p.ActorId = reassignUserId;
	        	}
				update processesList;
			}	       
		}
		catch(Exception e) {
			system.debug('\n\n\n message '+e.getmessage());
			return e.getmessage();
			//return reassignUserId;
		}
		return 'Success';
		//<PR20140902> END
	}

	webservice static string recallRequest(string requestId,string comments) {
		Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
		ProcessInstanceWorkitem newProcess = [Select Id, processinstance.targetobjectid From ProcessInstanceWorkitem where processinstance.targetobjectid = :requestId];       
		req.setWorkitemId(newProcess.Id);
		if(string.isBlank(comments))
			req.setComments('Recalling request.');
		else
			req.setComments(comments);
		req.setAction('Removed');
		//req.setNextApproverIds(new Id[] {'005e0000000vjAP'});
		Approval.process(req);


		return 'Success';
	}
	
	//Added method to reassign request from ajax tool kit 
	@RemoteAction    
	webservice static void reAssign1(string requestId,string currentAssignedUserId,string reassignUserId) 
	{    
		ProcessInstanceWorkItem processes = new ProcessInstanceWorkItem();    
		//processes = [SELECT p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where processinstance.targetobjectid ='a0Ue0000001LTVjEAO' order by CreatedDate DESC LIMIT 1];                        
		//processes.ActorId = '005e0000001sKL2';            
		//update processes;    
	}
	

}