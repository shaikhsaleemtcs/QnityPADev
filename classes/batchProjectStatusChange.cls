/*
 * Name      :   batchProjectStatusChange
 * Description  :   
 * Author      :   Infosys Limited
 * Created Date :   Anand
 *
 * Version   Modified Date     Modified By                Modification
 *
 * ---------------------------------------------------------------------------------------------------- 
 */
global class batchProjectStatusChange implements Database.Batchable<sObject>
{
 	public string startQuery = 'SELECT id, email FROM User limit 1';
	global Database.QueryLocator start(Database.BatchableContext BC)
	{ 
		return Database.getQueryLocator(startQuery);    
	}         
	global void execute(Database.BatchableContext BC, List<sObject> returnedUsersFromQuery)
	{
		date vt=system.today();
		list<Project_Price__c> projectPrice=new list<Project_Price__c>();
		list<Project_Price__c> projectIdsToCompleted=new list<Project_Price__c>();
		list<id> projectIds = new list<id>();          
		list<Pricing_Request__c>pricingRequestUpdateList=new list<Pricing_Request__c>();
		projectPrice=[select Id,ownerId,Project_Status__c,Valid_To__c from Project_Price__c where Valid_To__c <=:vt and Project_Status__c!='Completed' and isApproved__c=true ];
        Map<String, String> projectIdToOwnerId = new Map<String,String> (); //Shiva           
		for(Project_Price__c a:projectPrice)
		{
        	a.Project_Status__c='Completed';
			projectIdsToCompleted.add(a);
			projectIdToOwnerId.put(a.id, a.ownerId); //Shiva
			projectIds.add(a.id);                    
		}         
		list<Pricing_Request__c> priReqList = [SELECT id,Project_Price__c,Request_Approval_Status__c FROM Pricing_Request__c WHERE Project_Price__c In :projectIds];
		for(Pricing_Request__c r:priReqList)
		{
			r.Project_Price__c=null;
			r.Request_Approval_Status__c='Abandoned';
			pricingRequestUpdateList.add(r);            
		} 
		if(projectIdsToCompleted.size() >0)
		{
			upsert projectIdsToCompleted;
		} 
		if(pricingRequestUpdateList.size() >0)
		{
			upsert pricingRequestUpdateList;
		}  
		Id templateId=[ select id from EmailTemplate where folder.Name='Price Approval Email Templates' and name='Project Task Notification'].id; // Shiva
		List<Messaging.SingleEmailMessage> singleEmailList = new List<Messaging.SingleEmailmessage>();
		for(Project_Price__c projectObj :projectIdsToCompleted)
		{
			try
			{
				Messaging.SingleEmailMessage singleEmail = new Messaging.SingleEmailmessage();              
				singleEmail.setTemplateId(templateId);             
				singleEMail.setTargetObjectId(projectIdToOwnerId.get(projectObj.Id));              
				singleEMail.setSaveAsActivity(false);              
				singleEmail.setWhatId(projectObj.Id);
				singleEmailList.add(singleEmail);
            }
			catch(exception e){                
            }
        }
		List<Messaging.Email> allMails = new List<Messaging.Email>();
		for( Integer j = 0; j < singleEmailList.size(); j++ )
		{
			allMails.add(singleEmailList.get(j));
			System.debug('Value of Single Email List'+singleEmailList.get(j));
		}
		try
		{
			if(allMails.size()>0)
			Messaging.sendEmail(allMails);
		}
		catch(exception e)
		{           	
		} 
	}
	global void finish(Database.BatchableContext BC)
	{            
	} 
}