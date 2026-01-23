/*   Ver.                      Developer                           Changes                              Dependencies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.0                      Neeharika                        Changed PriceType query                None
//  1.1                      Neeharika                        Changed --select-- condition             None
//                                                                  for UAT #72
//  l.2                         Prachi                             Added sapConditionType variable in the query and     None
//                                                                  added a separate query for Pricing Task               

/**************************************************************************************************************
 ***********************************************Modification Log************************************************
<PP20130422>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 Apr 2013
Description         :   Defaulting PC in case only 1 PC - APAC ROLLOUT1(1.3)
 *****************************************************************************************************************
<PP20130612>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   12 June 2013
Description         :   SIT Issue # 65 FIX - Adding code to remove PCs without any KCs mapped in access sequence
                        - APAC ROLLOUT1(1.4)
 *****************************************************************************************************************
<VR20130716>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   16 Jul 2013
Description         :   Adding Logic for Creation of Floor and Reference Prices - APAC ROLLOUT2(1.6)
 *****************************************************************************************************************
<PP20130703>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   03 July 2013
Description         :   UAT Issue #  FIX - Adding code to filter Pricing Task PCs
                        - APAC ROLLOUT1(1.5)
 *****************************************************************************************************************
<PP20131125>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   25 November 2013
Description         :   Display only those PCs in PCL for which KCs are configured - DTT ROLLOUT
 *****************************************************************************************************************
<PP20140121>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   21 January 2014
Description         :   Avoid getListOptions() call in case of Import
 *****************************************************************************************************************
<MS20140429>
Last Modified By    :   Mohit Sinha
Last Modified Date  :   02 May 2014
Description         :   Added logic to populate single select list for NCS,Floor and Refernce  
 ***********************************************************************************************************************/

public with sharing class PAPricingCondition implements IPAServiceComponent
{
	public list<String> PCLselectedPricingCondition{get;set;}
	public PARequest request{get;set;} //Request Variable added Jan 5
	public PAOrganizationalGroupItems paOrgItems {get;set;}
	public String selectedPricingCondition{   //has to be set only from Visual force page.** //hold the salesforce id
		set{
			System.debug('**in setter pc before if'+value);
			if(value != null && value!='--Select--')
			{
				System.debug('**in setter pc');
				pricingCondition=new ERP_Pricing_Condition__c();
				pricingCondition = [SELECT  SystemModstamp, Status__c, Scale_Type__c,
				                    Scale_Type_Code__c, Scale_Basis_Code__c, Scale_Base__c, SAP_Condition_Type__c, SAP_Cluster__c, SAP_Client_Id__c,
				                    SAP_Application_Id__c, Pricing_Condition__c, Pricing_Condition_Description__c, Pricing_Condition_Code__c, Price_Types__c,
				                    Plus_Minus__c, Plus_Minus_Code__c, OwnerId, Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted,
				                    Id, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
				                    Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c FROM ERP_Pricing_Condition__c WHERE  Id = :value];
			}
			selectedPricingCondition = value;
		}
		get;
	}
	public String selectedPricingConditionName;
	public ERP_Pricing_Condition__c pricingCondition {get;set;}
	public ERP_Pricing_Condition__c erpPricingCondition {get;set;}
	public PAServiceState pricingConditionState {get;set;}
	public PAPricingCondition(PARequest request)
	{
		this.request = request;
	}
	public PAPricingCondition(PAServiceState paServiceState)
	{
		this.pricingConditionState = paServiceState;
		if(PAServiceState.currentRequest!=null)
			request = paServiceState.currentRequest;
		//paOrgItems will be populated on non scenario flow
		else
			paOrgItems = paServiceState.ogItems;
		system.debug('***pricondcheck'+request+'***'+paOrgItems);

	}
	public string action(String newPagelabel,String currentPageLabel, String desiredAction)
	{
		return null;
	}
	public void add() {

	}
	public void deleteRecord()
	{

	}

	public List<SObject> getListBusinessComponents()
	{
		return null;
	}
	public List<SelectOption> getListOptions()
	{
		String conditionClass;
		String priceType;
		//adding variable for SAP condition type (true/false) - 20th March -Prachi
		boolean sapConditionType;
		//added variable for project pc
		String Projectprice='';
		List<selectOption> pcOptions = new List<selectOption>();
		System.debug('*****'+PCLselectedPricingCondition+'*****pricingConditionState: '+pricingConditionState);
		//   System.debug('Current request:-'+pricingConditionState.currentRequest.salesPriceSAP.relatedWrappersList);
		System.debug('Current request:-'+pricingConditionState.currentRequestItem );
		//since on pageload the getter method is called it ends up in null pointer hence checking the condition to render
		//<PP20140121>
		if((pricingConditionState.currentRequest.pricingRequest.Sales_Org_Code__c!=null || pricingConditionState.currentRequest.customer.paERPCustomer.customer_Code__c !=null)
				&& (pricingConditionState.ogItems.value !='Import'&& (pricingConditionState.currentRequest.pricingRequest.Request_Type__c!='Import')))
		{
			system.debug('**** Inside If'+pricingConditionState.currentRequest.pricingRequest.Sales_Org_Code__c+'div code'+pricingConditionState.currentRequest.customer.divCode);
			string distCode,divCode,salesOrgCode;
			if(pricingConditionState.currentRequest.customer.paERPCustomer.sales_org_code__c!=null)
			{
				System.debug('**check reques type'+pricingConditionState.currentRequest.pricingRequest);            

				if(pricingConditionState.currentRequest.pricingRequest.pricing_Request_type__c==null && pricingConditionState.currentProjectPrice!=null && pricingConditionState.currentProjectPrice.currentRequest.pricingRequest.pricing_Request_type__c=='Project Pricing'){
					pricingConditionState.currentRequest.pricingRequest.pricing_Request_type__c=pricingConditionState.currentProjectPrice.currentRequest.pricingRequest.pricing_Request_type__c;
				}
				if(pricingConditionState.currentRequest.pricingRequest.pricing_Request_type__c=='Project Pricing' )
				{

					system.debug('i am here testing');
					//<TJ20150602>
					priceType='Project';
					/*String disc='Discount';
					String pric='Price';
					conditionClass = '('+'\''+disc+'\''+','+'\''+pric+'\''+')';*/
					conditionClass = '';
					sapConditionType = true;
				}

				//commenting  SAP condition type can be True/False
				else if(pricingConditionState.currentRequest.pricingRequest.pricing_Request_type__c=='Pricing Task')
				{
					//<PP20130703> -- Ver 1.5 START
					if(pricingConditionState.currentRequest.pricingRequest.Spot_Type__c == 'Spot Price')
					{
						priceType='Pricing Task-Spot';
					}
					else if(pricingConditionState.currentRequest.pricingRequest.Spot_Type__c == 'Free of Charge')
					{
						priceType='Pricing Task-FOC';
					}
					else if(pricingConditionState.currentRequest.pricingRequest.Spot_Type__c == 'Display')
					{
						priceType='Pricing Task-Display';
					}
					//<PP20130703> -- Ver 1.5 END
				}

				//added by sanjib for issue number UAT 20
				else if(pricingConditionState.currentRequest.pricingRequest.pricing_Request_type__c=='Permanent')
				{
					priceType='Standard';
					conditionClass = '';
					sapConditionType = true;
				}
				else
				{
					priceType='Standard';
					Projectprice='Project';
					conditionClass = '';
					sapConditionType = true;
				}
				distCode = pricingConditionState.currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
				divCode = pricingConditionState.currentRequest.customer.paERPCustomer.Division_code__c;
				salesOrgCode = pricingConditionState.currentRequest.customer.paERPCustomer.sales_org_code__c;

			}
			//if Export and non customer specific
			else
			{   
				//<VR20130716> Ver 1.6 VR 2013-07-16 APAC Rollout2-Including Floor and Reference in the price type for query
				if(pricingConditionState.currentRequest.pricingRequest.Request_Type__c !=null
						&& pricingConditionState.currentRequest.pricingRequest.Request_Type__c.contains('Non Customer Specific')
						&& request.requestServiceState.ogItems.value != 'Export')
				{
					conditionClass ='';
					sapConditionType = false;
				}               
				else
				{
					priceType= 'Standard';
					//Added to include Project Pricing Conditions in Export
					if(request.requestServiceState.ogItems.value == 'Export')
						Projectprice= 'Project';
					conditionClass ='';
					sapConditionType = true;
				}
				distCode = pricingConditionState.currentRequest.pricingRequest.Dist_Channel_Code__c;
				divCode = pricingConditionState.currentRequest.pricingRequest.Division_Code__c;
				salesOrgCode = pricingConditionState.currentRequest.pricingRequest.Sales_Org_Code__c;
				//for Export scenario since Request is not inserted we check the following logic
				if(distCode.contains('-')||divCode.contains('-')||salesOrgCode.contains('-'))
				{
					distCode = distCode.split('-')[0];
					divCode = divCode.split('-')[0];
					salesOrgCode = salesOrgCode.split('-')[0];
				}
			}
			string selectedBU = pricingConditionState.ogItems.selectedBU;//request.customer.ogitems.selectedBU;
			OrgGroup__c SalesAreaSelected=new OrgGroup__c();
			//get the Pricing Procedure for the Bu and salesarea
			List<Organizational_Group_Item__c> orgGrpList = new List<Organizational_Group_Item__c>();
			Organizational_Group_Item__c orgGroupItemInPC = new Organizational_Group_Item__c();
			orgGrpList = [select Retroactive_Limit__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,OrgGroup__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division__c,Business__r.Business__c,ERP_Pricing_Procedure__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c
			              from Organizational_Group_Item__c
			              WHERE Business__c=:selectedBU AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:distCode AND OrgGroup__r.ERP_Division_Code__c=:divCode AND OrgGroup__r.ERP_Sales_Org_Code__c=:salesOrgCode];
			if(orgGrpList!=null && orgGrpList.size()!=0)
			{
				orgGroupItemInPC = orgGrpList[0];
			}

			//Added - bala(populating based on step number)
			//Ver 1.2 Starts ---- Added sapConditionType variable to check the SAP condition type as it has to be FALSE for Pricing Task - 20th march
			List<ERP_Procedure_Conditions__c> proConList;

			// writting a separate query for Pricing Task as SAP condition type can be True/False -20th march - Prachi
			if(pricingConditionState.currentRequest.pricingRequest.pricing_Request_type__c == 'Pricing Task')
			{
				proConList=[SELECT Pricing_Condition__c,Sales_Pricing_Procedure__c,Pricing_Condition__r.Pricing_Condition_Code__c,
				            Pricing_Condition__r.Pricing_Condition_Description__c,Pricing_Condition__r.Pricing_Condition__c,
				            Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Scale_Base__c,
				            Pricing_Condition__r.Check_Scale__c,Step__c FROM ERP_Procedure_Conditions__c WHERE
				            Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND
				            Pricing_Condition__r.Price_Types__c includes (:priceType) order by Step__c ASC NULLS LAST];
			}
			//<VR20130716> Ver 1.6 VR 2013-07-16 APAC Rollout2-Modified the query to query Floor and Reference Conditions also for Export
			else if(pricingConditionState.ogItems != null && pricingConditionState.ogItems.value != null && pricingConditionState.ogItems.value =='Export'){
				proConList=[SELECT Pricing_Condition__c,Sales_Pricing_Procedure__c,Pricing_Condition__r.Pricing_Condition_Code__c,
				            Pricing_Condition__r.Pricing_Condition_Description__c,Pricing_Condition__r.Pricing_Condition__c,
				            Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Scale_Base__c,
				            Pricing_Condition__r.Check_Scale__c,Step__c FROM ERP_Procedure_Conditions__c WHERE
				            Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND
				            Pricing_Condition__r.Price_Types__c includes (:priceType,:Projectprice,'Floor','Reference','Net Floor','Net Reference')
				order by Step__c ASC NULLS LAST];
			}
			//<MS20140429>Adding query for single NCS Request including floor and reference
			//else if(pricingConditionState.ogItems != null && pricingConditionState.ogItems.value != null && pricingConditionState.ogItems.value =='NonCustReasons'){
			else if(pricingConditionState.currentRequest.pricingRequest.Request_Type__c !=null
					&& pricingConditionState.currentRequest.pricingRequest.Request_Type__c.contains('Non Customer Specific'))
			{
				proConList=[SELECT Pricing_Condition__c,Sales_Pricing_Procedure__c,Pricing_Condition__r.Pricing_Condition_Code__c,
				            Pricing_Condition__r.Pricing_Condition_Description__c,Pricing_Condition__r.Pricing_Condition__c,
				            Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Scale_Base__c,
				            Pricing_Condition__r.Check_Scale__c,Step__c FROM ERP_Procedure_Conditions__c WHERE
				            Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND
				            Pricing_Condition__r.Price_Types__c includes ('Standard','Floor','Reference','Net Floor','Net Reference')
				order by Step__c ASC NULLS LAST];
			}
			else
			{
				System.debug('hiiiiii'+priceType+Projectprice +'sales pricing procedure'+orgGroupItemInPC.ERP_Pricing_Procedure__c);
				System.debug('***sap cond type'+sapConditionType+'***condiciton clas'+conditionClass);
				proConList=[SELECT Pricing_Condition__c,Sales_Pricing_Procedure__c,Pricing_Condition__r.Pricing_Condition_Code__c,
				            Pricing_Condition__r.Pricing_Condition_Description__c,Pricing_Condition__r.Pricing_Condition__c,
				            Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Scale_Base__c,
				            Pricing_Condition__r.Check_Scale__c,Step__c FROM ERP_Procedure_Conditions__c WHERE
				            Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND
				            Pricing_Condition__r.SAP_Condition_Type__c =:sapConditionType AND Pricing_Condition__r.Price_Types__c
				            includes (:priceType,:Projectprice) AND Pricing_Condition__r.Condition_class__c like :conditionClass+'%' order by
				            Step__c ASC NULLS LAST];
			}       

			//Ver 1.2 Ends                                           
			// changing reference in the query Pricing_Condition__r.Price_Type__c=:priceType

			System.debug('***proConList'+proConList.size());

			Map<string,ERP_Procedure_Conditions__c> priCondMap = new Map<string,ERP_Procedure_Conditions__c>();
			Set<ERP_Procedure_Conditions__c> erpProcConditions = new Set<ERP_Procedure_Conditions__c>(); 

			for(ERP_Procedure_Conditions__c proConObj : proConList) {
				priCondMap.put(proConObj.Pricing_Condition__c,proConObj);
			}
			//<PP20130422> -- Ver 1.3 - Commented so that '--Select--' is added later

			//<PP20130612> START
			boolean customerSpecific = false;
			List<String> keyCombType;
			List<ERP_Access_Sequence__c>accSqList = new List<ERP_Access_Sequence__c>();
			system.debug('***ogitems'+pricingConditionState.ogItems);
			if(pricingConditionState.ogItems != null && pricingConditionState.ogItems.value != null && pricingConditionState.ogItems.value =='Export')
			{
				accSqList = [SELECT Id,Pricing_Condition__c,Pricing_Condition__r.Security_Access__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :priCondMap.keySet() AND
				             Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND
				             Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard','Project','Floor','Reference','Net Floor','Net Reference')]; 
				system.debug('***accseq'+accSqList);        
			}
			else
			{
				if(pricingConditionState.currentRequest.pricingRequest.Request_Type__c == 'Customer Specific'
					|| pricingConditionState.currentRequest.pricingRequest.Request_Type__c == 'Massive'
						|| pricingConditionState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Project Pricing')
				{
					customerSpecific = true;
				}
				if(pricingConditionState.currentRequest.pricingRequest.Pricing_Request_Type__c=='Project Pricing' && request.requestServiceState.ogItems.value != 'PCLDisableSelect')
				{
					accSqList = [SELECT Id,Pricing_Condition__c,Pricing_Condition__r.Security_Access__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :priCondMap.keySet() AND
					             Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND 
					             Pricing_Key_Combination__r.Customer_Specific__c = :customerSpecific AND
					             Pricing_Key_Combination__r.Key_Combination_type__c includes('Project')];
				}
				else if(pricingConditionState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && request.requestServiceState.ogItems.value != 'PCLDisableSelect')
				{
					accSqList = [SELECT Id,Pricing_Condition__c,Pricing_Condition__r.Security_Access__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :priCondMap.keySet() AND
					             Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND 
					             Pricing_Key_Combination__r.Customer_Specific__c = :customerSpecific AND
					             Pricing_Key_Combination__r.Key_Combination_type__c includes('Spot')];
				}
				//<MS20140429>Adding query for single NCS Request including floor and reference
				else if(pricingConditionState.currentRequest.pricingRequest.Request_Type__c !=null
						&& pricingConditionState.currentRequest.pricingRequest.Request_Type__c.contains('Non Customer Specific'))
				{
					accSqList = [SELECT Id,Pricing_Condition__c,Pricing_Condition__r.Security_Access__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :priCondMap.keySet() AND
					             Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND 
					             Pricing_Key_Combination__r.Customer_Specific__c = :customerSpecific AND
					             Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard','Floor','Reference')];
				}
				else if(request.requestServiceState.ogItems.value != 'PCLDisableSelect')
				{
					accSqList = [SELECT Id,Pricing_Condition__c,Pricing_Condition__r.Security_Access__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :priCondMap.keySet() AND
					             Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND 
					             Pricing_Key_Combination__r.Customer_Specific__c = :customerSpecific AND
					             Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard')];
				}
				//<PP20131125> START
				else if(request.requestServiceState.ogItems.value == 'PCLDisableSelect')
				{
					accSqList = [SELECT Id,Pricing_Condition__c,Pricing_Condition__r.Security_Access__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :priCondMap.keySet() AND
					             Sales_Pricing_Procedure__c = :orgGroupItemInPC.ERP_Pricing_Procedure__c AND 
					             Pricing_Key_Combination__r.Customer_Specific__c = true];
				}
				//<PP20131125> END
			}
			//Neeharika- make Restrict pricing-START
			Boolean isPresentInGroup=false;
			List<GroupMember> groupList = [SELECT GroupId,UserOrGroupId FROM GroupMember WHERE UserOrGroupId=:Userinfo.getUserId() AND GroupId IN (SELECT Id FROM Group WHERE Name=:'Price Approval - Restricted PC')];
			if(groupList!=null && groupList.size()!=0 ){
				isPresentInGroup=true;
			}
			//Neeharika-END-make Restrict pricing
			if(accSqList.size() != 0)
			{
				for(ERP_Access_Sequence__c acc : accSqList)
				{                   
					//Shiva- make Restrict pricing-START
					if((acc.Pricing_Condition__r.Security_Access__c != 'Restrict') ||
							(acc.Pricing_Condition__r.Security_Access__c == 'Restrict' && isPresentInGroup))
					{
						erpProcConditions.add(priCondMap.get(acc.Pricing_Condition__c));
					}
					//Shiva-END-make Restrict pricing
				}
			}

			//<PP20131125> START
			for(ERP_Procedure_Conditions__c proCons : erpProcConditions)
			{
				pcOptions.add(new Selectoption(proCons.Pricing_Condition__c,proCons.Pricing_Condition__r.Pricing_Condition_Code__c+' - '+proCons.Pricing_Condition__r.Pricing_Condition__c));
			}

			pcOptions.sort();
		}
		//<PP20130422> -- Ver 1.3 START
		if(pcOptions != null && pcOptions.size() > 1 && request.requestServiceState.ogItems.value != 'PCLDisableSelect')
		{
			pcOptions.add(0,new SelectOption('--Select--','--Select--'));
		}
		//<PP20131125>
		else if(pcOptions != null && pcOptions.size() == 1 && request.requestServiceState.ogItems.value != 'PCLDisableSelect')
		{
			selectedPricingCondition = pcOptions[0].getValue();
			if(String.isBlank(pricingConditionState.currentRequest.keyCombination.keyCombinationID))
			{
				pricingConditionState.currentRequest.keyCombination.setKeyCombinationID('callKCSetter');
			}           
			if(request.requestServiceState.ogItems.value == 'Export')
			{
				pcOptions.add(0,new SelectOption('--Select--','--Select--'));
			}           
		}
		if(pricingConditionState != null && pricingConditionState.currentRequest != null && pricingConditionState.currentRequest.salesPriceSAP != null
			&& ((pricingConditionState.currentRequest.keyCombination != null && pricingConditionState.currentRequest.keyCombination.keyCombinationID == null)
					|| (pricingConditionState.currentRequest.keyCombination != null && pricingConditionState.currentRequest.keyCombination.keyCombinationID == '--Select--')
					|| (pricingConditionState.currentRequest.pricingCondition != null && pricingConditionState.currentRequest.pricingCondition.selectedPricingCondition == null)
					|| (pricingConditionState.currentRequest.pricingCondition != null && pricingConditionState.currentRequest.pricingCondition.selectedPricingCondition == '--Select--')))
				pricingConditionState.currentRequest.salesPriceSAP.relatedWrappersList = new List<PARelatedList>();
		//<PP20130422> -- Ver 1.3 END
		return pcOptions;
	}
	public List<PARelatedList> getListWrappers() {
		return null;
	}
	public String getName() {
		return null;
	}
	public void getPCFromCodeAndCluster(String pcCode,String clusterId)
	{
		List<ERP_Pricing_Condition__c> erpPCList = new List<ERP_Pricing_Condition__c>();
		erpPCList = [SELECT Id FROM ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c = :pcCode AND SAP_Cluster__c = :clusterId];
		if(erpPCList != null && erpPCList.size() != 0)
		{
			this.selectedPricingCondition = erpPCList[0].Id;
		}
	}
	public void getPCFromCodeAndSAPCluster(String pcCode,String clusterId,String appId, String clientId)
	{
		List<ERP_Pricing_Condition__c> erpPCList = new List<ERP_Pricing_Condition__c>();

		System.debug('****pcCode '+pcCode);
		System.debug('***clusterId '+clusterId);
		System.debug('***appId '+appId);
		System.debug('***clientId '+clientId);

		erpPCList = [SELECT  SystemModstamp, Status__c,Scale_Type__c,
		             Scale_Type_Code__c, Scale_Basis_Code__c, Scale_Base__c, SAP_Condition_Type__c, SAP_Cluster__c, SAP_Client_Id__c,
		             SAP_Application_Id__c, Pricing_Condition__c, Pricing_Condition_Description__c, Pricing_Condition_Code__c, Price_Types__c,
		             Plus_Minus__c, Plus_Minus_Code__c, OwnerId, Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted,
		             Id, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
		             Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c FROM ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c = :pcCode AND SAP_Cluster__c = :clusterId
		             AND SAP_Application_Id__c = :appId AND SAP_Client_Id__c = :clientId];

		if(erpPCList != null && erpPCList.size() != 0)
		{
			this.selectedPricingCondition = erpPCList[0].Id;
		}
	}
	public void getPCFromName(String pcCode)
	{
		this.selectedPricingCondition = [SELECT Id FROM ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c = :pcCode].Id;
	}
	public string getSelectedPricingConditionName()
	{
		system.debug('***pclpricond'+selectedPricingCondition);

		if(selectedPricingCondition!=null)
		{
			selectedPricingConditionName = [SELECT Pricing_Condition__c FROM ERP_Pricing_Condition__c WHERE Id=:selectedPricingCondition].Pricing_Condition__c;
		}
		if(PCLselectedPricingCondition!=null && PCLselectedPricingCondition.size()!=0)
		{
			list<String> PCLselectedConditionType=new list<String>();
			list<ERP_Pricing_Condition__c> PCLPricingCondition=new list<ERP_Pricing_Condition__c>();
			PCLPricingCondition = [SELECT Pricing_Condition__c FROM ERP_Pricing_Condition__c WHERE Id in:PCLselectedPricingCondition];

			for(ERP_Pricing_Condition__c s:PCLPricingCondition){
				PCLselectedConditionType.add(s.Pricing_Condition__c);
			}
			for(integer j=0;j<PCLselectedConditionType.size();j++){
				if(j==0){
					selectedPricingConditionName=PCLselectedConditionType[j];
				}
				else
				{
					selectedPricingConditionName+=','+PCLselectedConditionType[j];
					system.debug('++KeyCombinationName'+selectedPricingConditionName);
				}
			}
		}
		return selectedPricingConditionName;
	}
	public void save()
	{

	}
	public void  setSelectedPricingConditionName(string selectedPricingConditionName)
	{
		this.selectedPricingConditionName = selectedPricingConditionName;
	}
	public String validate(String desiredAction)
	{
		return null;
	}
}