/*
 * Name      :   PANetPriceDetail
 * Description  :   This class acts as a business component to retrieve the PA NetPrice details
 * Author      :   Infosys Limited
 * Created Date :   
 *
 * Version    Modified Date    Modified By   Modification
 * -------------------------------------------------------------
 */

public class PANetPriceDetail  implements IPAServiceComponent
{ 
	public String separatorOnPage{get{
		Decimal standardDecimal = 1.1;
		String localeDecimalStr = standardDecimal.format();
		String seperator = localeDecimalStr.subString(1,2);
		return seperator;
	}set;}
	public Pricing_Request_Item__c pricingReqItem{get;set;}
	public NPC_Request__c npcRequest{get;set;}
	public PACalculateNetPrice calNet{get;set;}

	//public PAServiceState paServiceState{get;set;}
	public PANetPriceDetail(PAServiceState paserviceState)
	{
		//this.paServiceState =paserviceState;
		System.debug('****in constructor');
		System.debug('*****pa service state'+paserviceState); 
		System.debug('****paserviceState.currentRequestItem.calNetPrice'+paserviceState.currentRequestItem.calNetPrice);
		calNet = paserviceState.currentRequestItem.calNetPrice;// = new PACalculateNetPrice(); 
		System.debug('****calNet'+calNet);
		pricingReqItem=paserviceState.currentRequestItem.pricingReqItem; //new Pricing_Request_Item__c();
		System.debug('paserviceState.currentRequestItem.pricingReqItem*'+paserviceState.currentRequestItem.pricingReqItem);
		npcRequest=new NPC_Request__c();
	}   

	/*
	 * Author      : 
	 * Method Name  :   npcrequestId
	 * Parameters   :   No parameters
	 * Return type  :   String
	 * Description  :   
	 */

	public String npcrequestId
	{
		set
		{
			System.debug('****value'+value);
			if(value!=null)
			{
				List<NPC_Request__c> npcReqList=[select Id,Pricing_Request_Item__c FROM NPC_Request__c where Id=:value];
				if(npcReqList!=null && npcReqList.size()!=0)
				{
					npcRequest=npcReqList[0];
				}
				System.debug('***calling method');
			}
		}
		get; 
	}

	/*
	 * Author      : 
	 * Method Name  :   setCon
	 * Parameters   :   No parameters
	 * Return type  :   StandardSetController
	 * Description  :   For Pagination
	 */
	public ApexPages.StandardSetController setCon 
	{
		get 
		{
			if(setCon == null) 
			{
				List<NPC_Request__c> npcReqList= [SELECT UOM__c, Unit__c,Per__c,Material__c,Status__c, SystemModstamp, Sales_Organization__c, Sales_Document_Type__c, SAP_Cluster_Id__c, Request__c,
													Quantity__c, Pricing_Request_Item__c,Pricing_Request_Item__r.ERP_pricing_Procedure__c,Pricing_Request_Item__r.ERP_Pricing_Procedure__r.Pricing_Procedure__c,Pricing_Request_Item__r.ERP_Pricing_Procedure__r.Pricing_Procedure_Code__c, Pricing_Date__c, Partner_Code_2__c, Partner_Code_1__c, Partner_2__c, 
													Partner1__c,Pricing_Request_Item__r.Pricing_Condition_Code__c, Name,  Material_Number__c, LastModifiedDate, LastModifiedById, Pricing_Request_Item__r.Pricing_Condition__c,Pricing_Request_Item__r.Rate__c,Pricing_Request_Item__r.Unit__c,
													Pricing_Request_Item__r.Per__c,Pricing_Request_Item__r.UoM__c,Pricing_Request_Item__r.New_Rate__c,Pricing_Request_Item__r.new_Unit__c,Pricing_Request_Item__r.New_Per__c,Pricing_Request_Item__r.New_UoM__c,
													LastActivityDate, IsDeleted, Id, External_ID__c,isSynchronous__c, Division__c, Distribution_Channel__c, CurrencyIsoCode,
													CreatedDate,Stamp_Current_Net_Price__c,Stamp_Floor_Net_Price__c,Stamp_New_Net_Price__c,Stamp_Reference_Net_Price__c,
													CreatedById, Count_of_NPC_Responses__c, Below_Reference_Flag__c, Below_Floor_Flag__c, Below_Current_Flag__c,
													Response_Error_Code__c,Response_Error_Message__c FROM NPC_Request__c WHERE Pricing_Request_Item__c=:pricingReqItem.Id AND Status__c='Active'  ORDER BY Below_Floor_Flag__c DESC, Below_Reference_Flag__c DESC,Below_Current_Flag__c DESC, Material__c ];
				List<NPC_Request__c> finalNPCReqList =new List<NPC_Request__c>();
				List<NPC_Request__c> errorNPCReqList =new List<NPC_Request__c>();
				for(NPC_Request__c npcReq:npcReqList ){
					if(!String.isBlank(npcReq.Stamp_New_Net_Price__c)){
						finalNPCReqList.add(npcReq);
					}
					else{
						errorNPCReqList.add(npcReq);
					}
				}
				for(NPC_Request__c err:errorNPCReqList){
					finalNPCReqList.add(err);
				}
				setCon = new ApexPages.StandardSetController(finalNPCReqList);
			}
			setCon.setPageSize(100);
			return setCon;
		} 
		set;
	}

	/*
	 * Author      : 
	 * Method Name  :   getNPCRequests
	 * Parameters   :   No parameters
	 * Return type  :   NPC_Request__c
	 * Description  :   
	 */
	public List<NPC_Request__c> NPCRequests
	{    
		get
		{
			return (List<NPC_Request__c>) setCon.getRecords();
		}
		set;
	}

	/*
	 * Author      : 
	 * Method Name  :   hasPrevious
	 * Parameters   :   No parameters
	 * Return type  :   Boolean
	 * Description  :   
	 */ 
	public Boolean hasPrevious 
	{
		get 
		{
			return setCon.getHasPrevious();
		}
	}

	/*
	 * Author      : 
	 * Method Name  :   hasNext
	 * Parameters   :   No parameters
	 * Return type  :   Boolean
	 * Description  :   
	 */ 
	public Boolean hasNext 
	{
		get 
		{
			return setCon.getHasNext();
		}
	}

	/*
	 * Author      : 
	 * Method Name  :   currentPageNumber
	 * Parameters   :   No parameters
	 * Return type  :   Integer
	 * Description  :   
	 */     
	public Integer currentPageNumber
	{
		get
		{
			return setCon.getPageNumber();
		}
	}

	/*
	 * Author      : 
	 * Method Name  :   currentPageNumber
	 * Parameters   :   No parameters
	 * Return type  :   Integer
	 * Description  :   
	 */     
	public Integer resultSize
	{
		get
		{
			return setCon.getResultSize();
		}
	}

	/*
	 * Author      : 
	 * Method Name  :   totalNoOfPages
	 * Parameters   :   No parameters
	 * Return type  :   Integer
	 * Description  :   
	 */     
	public Integer totalNoOfPages  
	{
		get
		{
			if(math.mod(resultSize,100) == 0)
				return resultSize/100;
			else
				return (resultSize/100)+1;
		}
	}

	/*
	 * Author      : 
	 * Method Name  :   currentPageSize
	 * Parameters   :   No parameters
	 * Return type  :   Integer
	 * Description  :   
	 */   
	private Integer currentPageSize 
	{
		get 
		{
			if(hasNext)
			{ 
				return 100;
			}
			else if(!hasNext && math.mod(resultSize,100) == 0)
			{
				return 100;
			}
			else if(!hasNext && math.mod(resultSize,100) != 0)
			{
				return math.mod(resultSize,100);
			}
			return null;
		}
	}    

	/*
	 * Author      : 
	 * Method Name  :   noOfRecordsDisplayed
	 * Parameters   :   No parameters
	 * Return type  :   String
	 * Description  :   
	 */     
	public String noOfRecordsDisplayed  
	{
		get
		{
			string recDisplay;
			system.debug('%%%% totalNoOfPages'+totalNoOfPages);
			system.debug('%%%% currentPageSize'+currentPageSize);
			system.debug('%%%% currentPageNumber'+currentPageNumber);
			system.debug('%%%% resultSize'+resultSize);
			for(Integer i=1; i<=totalNoOfPages; i++)
			{
				if(i == 1 && i==currentPageNumber && currentPageSize == 100)
				{
					recDisplay = '1-100';
				}
				else if((i == 1 && i==currentPageNumber && currentPageSize != 100))
				{
					recDisplay = '1-'+currentPageSize;
				}
				else if(i!=1 && i==currentPageNumber && currentPageSize == 100)
				{
					Integer X = (100*i)-99;
					Integer Y = 100*i;
					recDisplay = String.valueOf(X)+'-'+String.valueOf(Y);
				}
				else if(i!=1 && i==currentPageNumber && currentPageSize != 100)
				{
					Integer X = (100*i)-99;
					Integer Y = (100*i)+(currentPageSize-100);
					recDisplay = String.valueOf(X)+'-'+String.valueOf(Y);
				}
			}
			system.debug('%%%% recDisplay'+recDisplay);
			return recDisplay;
		}
	}

	/*
	 * Author      : 
	 * Method Name  :   viewNetPriceDetails
	 * Parameters   :   No parameters
	 * Return type  :   void
	 * Description  :   
	 */ 
	public void viewNetPriceDetails()
	{
		//Query Pricing RequestITem from the Id
		//Query the NPC request from the selected Id
		//Query the response and call the method calculateNPC(npcRequestIdSet, splitCondRateMap ,priItemList,true); 
		Decimal standardDecimal = 1.1;
		String localeDecimalStr = standardDecimal.format();
		String seperator = localeDecimalStr.subString(1,2);
		if(pricingReqItem.New_rate__c!=null){
			pricingReqItem.New_Rate__c= pricingReqItem.New_rate__c.replace(seperator,'.');
		}
		System.debug('***npcRequest'+npcRequest);
		Set<Id> npcRequestIdSet= new Set<Id>();
		npcRequestIdSet.add(npcRequest.Id);
		//query teh repsonse for that request
		List<NPC_Response__c> npcResponse=[select Id,NPC_Message_Type__c,NPC_Message__c,Condition_Rate_Key__c,  F_Response_Status__c FROM NPC_Response__c where NPC_Request__c=:npcRequestIdSet  AND F_Response_Status__c='Active'];
		if(npcResponse!=null && npcResponse.size()!=0)
		{
			if( npcResponse[0].NPC_Message_Type__c=='E')
			{   System.debug('***in E'+npcResponse[0].NPC_Message__c);
			throw new PAException(npcResponse[0].NPC_Message__c,ApexPages.severity.Error); 
			}
			String varkey =npcResponse[0].Condition_Rate_Key__c;
			Map<String,List<String>> splitCondRateMap=new  Map<String,List<String>>();
			if(varkey!=null)
			{ 
				splitCondRateMap= calNet.splitVarKey(varKey); 
			} 
			System.debug('****splitCondRateMap'+splitCondRateMap); 
			List<Pricing_Request_Item__c> priItemList =new List<Pricing_Request_Item__c>();
			priItemList.add(pricingReqItem); 

			try{
				calNet.calculateNPC(npcRequestIdSet, splitCondRateMap ,priItemList,true);   
			}
			catch(Exception e){
				System.debug('*****in exception'+e.getMessage());
				throw new  PAException(e.getMessage(),ApexPages.Severity.ERROR);
			}
			System.debug('****done');

		}
	}
	/*
	 * Author      : 
	 * Method Name  :   getListBusinessComponents
	 * Parameters   :   No parameters
	 * Return type  :   List<sObject>
	 * Description  :   
	 */
	public List<sObject> getListBusinessComponents()
	{
		return null;
	}

	/*
	 * Author      : 
	 * Method Name  :   getListOptions
	 * Parameters   :   No parameters
	 * Return type  :   List<selectOption>
	 * Description  :   
	 */
	public List<SelectOption> getListOptions()
	{
		return null;
	}

	/*
	 * Author      : 
	 * Method Name  :   getListWrappers
	 * Parameters   :   No parameters
	 * Return type  :   List<PARelatedList>
	 * Description  :   
	 */
	public List<PARelatedList> getListWrappers()
	{
		return null;
	}


	/*
	 * Author      : 
	 * Method Name  :   save
	 * Parameters   :   No parameters
	 * Return type  :   void
	 * Description  :   
	 */
	public void save(){
	}

	/*
	 * Author      : 
	 * Method Name  :   deleteRecord
	 * Parameters   :   No parameters
	 * Return type  :   void
	 * Description  :   
	 */ 
	public void deleteRecord(){
	}

	/*
	 * Author      : 
	 * Method Name  :   validate
	 * Parameters   :   String
	 * Return type  :   String
	 * Description  :   
	 */
	public String validate(String desiredAction){
		return null;
	}

	/*
	 * Author      : 
	 * Method Name  :   action
	 * Parameters   :   String,String,String
	 * Return type  :   String
	 * Description  :   
	 */
	public String action(String newPagelabel,String currentPageLabel, String desiredAction)
	{
		System.debug('*****ViewNetPriceDetails'+desiredAction);
		if(desiredAction!=null && desiredAction.containsIgnoreCase('ViewNetPriceDetailsAsynch'))
		{
			try{
				viewNetPriceDetails();
			}
			catch(PAException e){
				System.debug('*****in exception'+e.getMessage());
				throw new  PAException(e.getMessage(),ApexPages.Severity.ERROR);
			}
			catch(Exception e){
				System.debug('*****in exception'+e.getMessage());
			}
			return newPagelabel;
		}
		if(desiredAction!=null && desiredAction.containsIgnoreCase('SkipToEditReqItem'))
		{
			setCon=null; //for view state control 
			return newPagelabel;
		}
		return newPagelabel;
	}

	/*
	 * Author      : 
	 * Method Name  :   getName
	 * Parameters   :   No parameters
	 * Return type  :   String
	 * Description  :   
	 */
	public String getName()
	{
		return null;
	}   
}