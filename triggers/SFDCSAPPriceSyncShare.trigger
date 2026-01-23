/*
 * Name		 :   SFDCSAPPriceSyncShare
 * Description  :  This trigger share the price sync defects to all viewes, assignee 
 * Author	   :   Infosys Limited <GT20150512>
 * Created Date :   12 May 2015
 *
 * Version	 Modified Date	   Modified By   			  Modification
 * ---------------------------------------------------------------------------------------------------- 
 *

*/

trigger SFDCSAPPriceSyncShare on SFDC_SAP_Price_Sync__c (after insert, after update) {
	
	SFDCSAPPriceSyncShareHandler syncHandler = new SFDCSAPPriceSyncShareHandler();
	syncHandler.onTrigger();

/*
List<SFDC_SAP_Price_Sync__share> syncShareList = new List<SFDC_SAP_Price_Sync__share>();
	
	// Handle updates and share the records to respective assignee if any change in assignee
	if(trigger.isUpdate)
	{
		for(SFDC_SAP_Price_Sync__c syncRec: Trigger.New)
		{
			if(syncRec.Assigned_To__c!=null && trigger.oldmap.get(syncRec.id).Assigned_To__c!=syncRec.Assigned_To__c)
			{
				
				SFDC_SAP_Price_Sync__share syncShare = new SFDC_SAP_Price_Sync__share();
				syncShare.ParentId = syncRec.id;
				syncShare.AccessLevel = 'Edit'; //Control the access level "Read" or "Edit"          
	            syncShare.UserOrGroupId = syncRec.Assigned_To__c;
	            syncShare.RowCause = Schema.SFDC_SAP_Price_Sync__share.RowCause.Share_with_assignee__c;
	            syncShareList.add(syncShare);
	            if(syncRec.BU_Admin__c!=null)
	            {
	            	SFDC_SAP_Price_Sync__share syncShare1 = new SFDC_SAP_Price_Sync__share();
					syncShare1.ParentId = syncRec.id;
					syncShare1.AccessLevel = 'Edit'; //Control the access level "Read" or "Edit"          
		            syncShare1.UserOrGroupId = syncRec.BU_Admin__c;
		            syncShare1.RowCause = Schema.SFDC_SAP_Price_Sync__share.RowCause.Share_with_Bu_Admin__c;
		            syncShareList.add(syncShare1);
	            	
	            }
			}
		}
	
		if(syncShareList.size()>0)
		{
			try
			{
				database.insert (syncShareList,false);
			}
			catch(Exception e)
			{
				
			}
		}
	}

	//Handle insert cases and share defects with all viewers belongs to the repective business, sales area
	if(trigger.isInsert)
	{
		Map<String,string> idSalesAreaMap = new Map<String,string>();
		Set<ID>prices = new Set<ID>();
		list<String>SalesOrgCode = new List<String>();
		list<String>DistCode = new List<String>();
		list<String>DivCode = new List<String>();
		list<String> bus = new List<String>();
		for(SFDC_SAP_Price_Sync__c syncRec: Trigger.New)
		{
			if(syncRec.SFDC_PA_Price_Record__c!=null)
			{
				prices.add(syncRec.SFDC_PA_Price_Record__c);
				bus.add(syncRec.SFDC_PA_BU__c);
			}
			
		}
		
		for(ERP_Export_to_SAP__c price: [select id,BU__c,Sales_Org_Code__c,Distribution_Channel_Code__c,Division_Code__c from ERP_Export_to_SAP__c where id in :prices])
		{
			idSalesAreaMap.put(price.id, price.bu__c+price.Sales_Org_Code__c+price.Distribution_Channel_Code__c+price.Division_Code__c);
			SalesOrgCode.add(price.Sales_Org_Code__c);
			DistCode.add(price.Distribution_Channel_Code__c);
			DivCode.add(price.Division_Code__c);
		}
		
		Map<String,List<Id>> saViewUsrMap = new Map<String,List<Id>>();
		
		for(Organizational_Group_User__c orgUsr : [select Related_User__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c,Organizational_Group_Item__r.Business__r.Business__c from Organizational_Group_User__c where 
												  OrgGroup__r.ERP_Sales_Org_Code__c in :SalesOrgCode and OrgGroup__r.ERP_Distribution_Channel_Code__c in :DistCode and OrgGroup__r.ERP_Division_Code__c in :DivCode and Related_User__r.Profile.name='Price Approval-Viewer'
												  and Organizational_Group_Item__r.Business__r.Business__c in :bus ])
		{
			string key = orgUsr.Organizational_Group_Item__r.Business__r.Business__c+orgUsr.OrgGroup__r.ERP_Sales_Org_Code__c+orgUsr.OrgGroup__r.ERP_Distribution_Channel_Code__c+orgUsr.OrgGroup__r.ERP_Division_Code__c;
			List<Id> userIds = new List<Id>();
			if(saViewUsrMap.containsKey(key))
			{
				userIds = saViewUsrMap.get(key);
				userIds.add(orgUsr.Related_User__c);
				saViewUsrMap.put(key,userIds);
			}
			else
			{
				userIds.add(orgUsr.Related_User__c);
				saViewUsrMap.put(key,userIds);
			}
			
		}
		
		for(SFDC_SAP_Price_Sync__c syncRec:Trigger.New)
		{
			List<Id> userIds = saViewUsrMap.get(idSalesAreaMap.get(syncRec.SFDC_PA_Price_Record__c));
		
			shareRecord(syncRec,userIds);
		}
		
		if(syncShareList.size()>0)
		{
			try
			{
				database.insert (syncShareList,false);
			}
			catch(Exception e)
			{
			}
		}
	}
	
	public void shareRecord(SFDC_SAP_Price_Sync__c Rec,List<Id> usrIds)
	{
		
		try
		{
			for(Id usrId:usrIds)
			{
			
				SFDC_SAP_Price_Sync__share syncShare = new SFDC_SAP_Price_Sync__share();
				syncShare.ParentId = Rec.id;
				syncShare.AccessLevel = 'Read';           
		        syncShare.UserOrGroupId = usrId;
		        syncShare.RowCause = Schema.SFDC_SAP_Price_Sync__share.RowCause.Share_with_all_viewers__c;
		        syncShareList.add(syncShare);
			}
		
		}
		catch(Exception e)
		{
			Rec.addError('Unable to share the records at SFDC end');
		}
	}
	
*/
}