/*******************************************************************************
Copyright © 2011 DuPont. All rights reserved.
Author: Thomas Snyder
Email: thomas.snyder@usa.dupont.com, tom@3ddd.com
Description:  Abstract Class that trigger handle class with extend
    provides common methods for grouping records by recordType

TES20121019 added method: rTypeIdToSetting();
 ********************************************************************************/
public abstract class TriggerHandlerBase implements ITriggerHandler
{
	public static LIST<string> stack = new LIST<string>();
	public static MAP<string,RType.SObjectRTypes> cacheAllRTypes = new MAP<string,RType.SObjectRTypes>();
	private static integer currDepth=0;
	private static integer fireCnt=0;
	public static Schema.sObjectType initiator;

	//stopRecursion: if true this trigger will run only run 1 iteration for the initiator object
	public static boolean stopRecursion = false;

	////////////////////////////////////////////////////////////////////
	//produce a Map of records  (before inserts contain fake ids)
	///////////////////////////////////////////////////////////////////
	private MAP<Id,Sobject> cacheRecordsMap; //cache cannot be static
	public MAP<Id,Sobject> records {
		GET {
			if (cacheRecordsMap==null) {
				cacheRecordsMap = new MAP<Id,Sobject>();
				if (Trigger.isBefore) {
					if (Trigger.isDelete)
						cacheRecordsMap=Trigger.oldMap;
					else if (Trigger.isUpdate || Trigger.IsUndelete)
						cacheRecordsMap=Trigger.newMap;
					else if (Trigger.IsInsert) {
						integer cnt=0;
						for (SObject so : Trigger.new)
							cacheRecordsMap.put(PAUtil.genId(cnt++),so);
					}
				}
				else if (Trigger.isAfter) {
					if (Trigger.isDelete)
						cacheRecordsMap=Trigger.oldMap;
					else if (Trigger.isInsert || Trigger.isUpdate || Trigger.IsUndelete)
						cacheRecordsMap=Trigger.newMap;
				}
			}
			return cacheRecordsMap;
		} //GET
	}

	////////////////////////////////////////////////////////////////////////
	// Describe Methods
	private Schema.sObjectType cacheObjectType;
	public Schema.sObjectType sObjectType {
		GET {
			if (cacheObjectType==null)
				cacheObjectType=records.values()[0].getSObjectType();
			return cacheObjectType;
		}
	}
	public string sotype {
		get {return string.valueOf(this.sObjectType).tolowerCase(); }
	}


	public Schema.DescribeSObjectResult DSR {
		GET {
			return sObjectType.getDescribe();
		}
	}

	//
	// RecordType Methods
	// ALL recordtypes for current sObject
	public RType.SObjectRTypes rTypes {
		GET {
			if (!cacheAllRTypes.containsKey(sotype))
				cacheAllRTypes.put(sotype,new RType.SObjectRTypes(DSR.getName()));
			return cacheAllRTypes.get(sotype);
		}
	}

	// ALL RecordTypeSettings__c for current sObject
	// MAP<RT.developerName,RecordTypeSettings__c>
	public MAP<string,RecordTypeSettings__c> rTSettings {
		GET {
			return rTypes.RTSettings;
		}
	}

	// Map for ALL recordtypes  for current sObject
	public MAP<id,RecordType> mapRTypes {
		GET {
			return rTypes.getMap();
		}
	}


	//TES20121019
	//Get the recordtype setting for a particular RecordTypeId
	public RecordTypeSettings__c rTypeIdToSetting(Id id) {
		RecordTypeSettings__c rtn;
		try {
			rtn=rTSettings.get(rTypes.IdToDevName(id));
		}catch(Exception ex){}
		return rtn;
	}

	///////////////////////////////////////////////////////////////////
	// Groups records by recordtype developerName
	// result: MAP<recordTypeDevName,MAP<recordId,record>>
	///////////////////////////////////////////////////////////////////
	private  MAP<string, MAP<id,SObject>> cacheRecordsByRT;
	public MAP<string, MAP<id,SObject>> recordsByRT {
		GET {
			if (cacheRecordsByRT==null) {
				cacheRecordsByRT = new MAP<string, MAP<id,SObject>>();
				for (id soid : records.KeySet()) {
					sobject so = records.get(soid);
					string rtid=(string) so.get('RecordtypeId');
					string devName = rTypes.IdToDevName(rtid);
					if (devName!=null) {
						if (!cacheRecordsByRT.containsKey(devName))
							cacheRecordsByRT.put(devName,new MAP<id,SObject>());
						cacheRecordsByRT.get(devName).put(soid,so);
					}
				}
			}
			return cacheRecordsByRT;
		}
	}

	///////////////////////////////////////////////////////////////////


	public MAP<id,SObject> getRecordsByRT(string devName) {
		if (recordsByRT.containsKey(devName))
			return recordsByRT.get(devName);
		else
			return new MAP<id,Sobject>();
	}

	public virtual void onTrigger() {
		currDepth++;
		fireCnt++;
		string ev = (Trigger.isBefore) ? 'b' : 'a';
		if (Trigger.isInsert) ev+='i';
		else if (Trigger.isUpdate) ev+='u';
		else if (Trigger.isDelete) ev+='d';
		else if (Trigger.isUndelete) ev+='ud';
		stack.add(sotype+':'+ev+':['+currDepth+']:'+fireCnt);

		// Before Trigger
		if (Trigger.isBefore)
		{
			// Call the bulk before to handle any caching of data and enable bulkification
			this.bulkBefore();

			// Iterate through the records to be deleted passing them to the handler.
			if (Trigger.isDelete)
			{
				for (SObject so : Trigger.old)
				{
					this.beforeDelete(so);
				}
			}
			// so instanceOf Contact || so.getSObjectType()==Contact.sObjectTypeso instanceOf Contact || so.getSObjectType()==Contact.sObjectTypeso instanceOf Contact || so.getSObjectType()==Contact.sObjectTypeIterate through the records to be inserted passing them to the handler.
			else if (Trigger.isInsert)
			{
				for (SObject so : Trigger.new)
				{
					this.beforeInsert(so);
				}
			}
			// Iterate through the records to be updated passing them to the handler.
			else if (Trigger.isUpdate)
			{
				for (SObject so : Trigger.old)
				{
					this.beforeUpdate(so, Trigger.newMap.get(so.Id));
				}
			}
		}
		else
		{
			// Call the bulk after to handle any caching of data and enable bulkification
			this.bulkAfter();

			// Iterate through the records deleted passing them to the handler.
			if (Trigger.isDelete)
			{
				for (SObject so : Trigger.old)
				{
					this.afterDelete(so);
				}
			}
			// Iterate through the records inserted passing them to the handler.
			else if (Trigger.isInsert)
			{
				for (SObject so : Trigger.new)
				{
					this.afterInsert(so);
				}
			}
			// Iterate through the records updated passing them to the handler.
			else if (Trigger.isUpdate)
			{
				for (SObject so : Trigger.old)
				{
					this.afterUpdate(so, Trigger.newMap.get(so.Id));
				}
			}

		}

		// Perform any post processing
		this.andFinally();

		//}//end recursion check
		currDepth--;
	}

	public virtual void bulkBefore(){}
	public virtual void bulkAfter(){}
	public virtual void beforeInsert(SObject so){}
	public virtual void beforeUpdate(SObject oldSo, SObject so){}
	public virtual void beforeDelete(SObject so){}
	public virtual void afterInsert(SObject so){}
	public virtual void afterUpdate(SObject oldSo, SObject so){}
	public virtual void afterDelete(SObject so){}
	public virtual void andFinally(){}

}