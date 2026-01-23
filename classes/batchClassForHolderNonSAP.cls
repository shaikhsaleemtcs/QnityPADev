/*Ver1.1 Neeharika -Removed rate references */
/***********************************************Modification Log************************************************
  <VR20130509>
 Last Modified By   :   Vinoth Rajapandian
 Last Modified Date :   09 May 2013
 Description        :   Adding Logic for extra key field Customer Hierarchy - APAC ROLLOUT1(1.2)
 *****************************************************************************************************************/
global class batchClassForHolderNonSAP implements Database.Batchable<sObject>
{
	public List<Sales_Prices__c> upsertList = new  List<Sales_Prices__c>();
	public Map<String,Sales_Prices__c> mapOfpriAndHolder = new  Map<String,Sales_Prices__c> ();
	global database.queryLocator start(Database.BatchableContext BC)
	{
		//<VR20130509> Ver 1.2 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
		return Database.getQueryLocator([SELECT Ship_To_Country_Code__c, Ship_To_Country__c,ShipTo__c, ShipTo_Code__c, markForDeletion__c, isPriceHolder__c, Valid_To__c, Valid_From__c, UoM__c, Unit__c,
										Terms_of_Payment_Code__c, SystemModstamp, Sold_To__c, Sold_To_SAP__c, Sold_To_Code__c,
										Sales_Pricing_Procedure__c, Sales_Price_Type__c, Sales_Org__c,
										Sales_Org_Code__c, Sales_Office__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_ID__c, SAP_Application_Id__c,
										Rate__c, Profit_Center__c, Profit_Center_Code__c,
										Product_Hierarchy__c,Pricing_Condition__c, Pricing_Condition_Code__c,
										Price_List_Type__c, Price_List_Type_Code__c, Price_Holder__c,
										Plus_Minus__c, Plus_Minus_Code__c, Per__c,PH9_Code__c,PH8_Code__c, PH7_Code__c,
										PH6_Code__c, PH5_Code__c, PH4_Code__c, PH3_Code__c, PH2_Code__c,
										PH1_Code__c, PCKC__c, PCKC_SAP__c, OwnerId, Name, Material__c,Product_Hierarchy_Code__c,
										Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c,
										LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, KC_SAP__c,
										Incoterms_1_Code__c, Incoterms1__c, Id, End_Use__c, End_Use_Code__c, Division__c, Division_Code__c,
										Dist_Channel_Code__c, Dist_Channel__c, Customer_Specific__c, Customer_Price_Group__c,
										Customer_Price_Group_Code__c, CurrencyIsoCode, CreatedDate, CreatedById, Country__c, Country_Code__c,
										Condition_Class__c, Condition_Class_Code__c, Calculation_Type__c, Calculation_Type_Code__c, BU__c,
										Approved_Date__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,
										Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,
										Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,
										ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,
										ScaleRate9__c,ScaleRate10__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c,
										ComPartner__c,	ComPartner_Code__c, Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, 
										Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,
										Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c      
										 FROM Sales_Prices__c WHERE Price_Holder__c = null AND isPriceHolder__c = false AND
										PCKC__c != null ORDER BY PCKC__c]);
	}
	global void execute(Database.BatchableContext BC,List<sObject> sList)
	{
		List<Sales_Prices__c> acList = sList;
		Map<String,List<Sales_Prices__c>> linkedPCKCHoldersMap = new Map<String,List<Sales_Prices__c>>();
		for(Sales_Prices__c h:acList)
		{
			if(!linkedPCKCHoldersMap.containskey(h.PCKC__c))
			{
				List<Sales_Prices__c> l = new List<Sales_Prices__c>();
				l.add(h);
				linkedPCKCHoldersMap.put(h.PCKC__c,l);
			}
			else
			{
				List<Sales_Prices__c> hList = linkedPCKCHoldersMap.get(h.PCKC__c);
				hList.add(h);
				linkedPCKCHoldersMap.put(h.PCKC__c,hList);
			}
		}
		for(String s:linkedPCKCHoldersMap.keySet())
		{
			List<Sales_Prices__c> pList = new List<Sales_Prices__c>();
			List<Sales_Prices__c> validFromList = new List<Sales_Prices__c>();
			List<Sales_Prices__c> validToList = new List<Sales_Prices__c>();
			Sales_Prices__c pri = new Sales_Prices__c();
			if(linkedPCKCHoldersMap.containsKey(s))
			{
				pList = linkedPCKCHoldersMap.get(s);
				if(pList.size() != 0)
				{
					pri = pList.get(0);
					validFromList = PAUtil.sortList(pList,'Valid_From__c','asc');
					validToList = PAUtil.sortList(pList,'Valid_To__c','desc');
				}
			}
			Sales_Prices__c newholder = new Sales_Prices__c();
			newHolder = pri.clone(false,true);
			newHolder.Approved_Date__c = validFromList.get(0).Valid_From__c;
			newholder.Valid_From__c = validFromList.get(0).Valid_From__c;
			newholder.Valid_To__c = validToList.get(0).Valid_To__c;
			//Since, holder should not have rate,unit,Per,UoM fields populated.
			newHolder.Rate__c = null;
			newHolder.Per__c = null;
			newHolder.UoM__c = null;
			newHolder.Unit__c = null;
			newHolder.OwnerId = pri.OwnerId;
			newHolder.isPriceHolder__c = true;
			mapOfpriAndHolder.put(s,newHolder);
		}
		Set<Sales_Prices__c> upsertHolderSet = new Set<Sales_Prices__c>();
		List<Sales_Prices__c> upsertHolderList = new List<Sales_Prices__c>();
		Map<Id,Sales_Prices__c> idHolderMap = new Map<Id,Sales_Prices__c>();

		for(Sales_Prices__c erp : mapOfpriAndHolder.values())
		{
			upsertHolderSet.add(erp);
		}

		for(Sales_Prices__c e1 : upsertHolderSet)
		{
			upsertHolderList.add(e1);
		}
		upsert upsertHolderList;
		//query the holder //iterate through key set of PCKC get the records, get the holder map
		for(String s1 : linkedPCKCHoldersMap.keySet())
		{
			List<Sales_Prices__c> pList = new List<Sales_Prices__c>();
			Sales_Prices__c hold = new Sales_Prices__c();
			if(linkedPCKCHoldersMap.containsKey(s1))
			{
				pList = linkedPCKCHoldersMap.get(s1);
			}
			if(mapOfpriAndHolder.containsKey(s1))
			{
				hold = mapOfpriAndHolder.get(s1);
			}
			for(Sales_Prices__c h : pList)
			{
				if(hold.Id != null)
					h.Price_Holder__c = hold.Id;
				h.Approved_Date__c = h.Valid_From__c;
				upsertList.add(h);
			}
		}
		upsert upsertList;
	}

	global void finish(Database.BatchableContext info)
	{
	}
}