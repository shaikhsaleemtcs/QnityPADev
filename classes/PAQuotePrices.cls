/*
 * Name         :   PAQuotePrices
 * Description  :   This class converts RPQ requests to Quote prices
 * Author       :   Infosys Limited
 * Created Date :   24-01-2015
 * Version      Modified Date   Modified By             Modification                                            		Dependencies
 *  1.0                         Ibtesamuddin Mohammed   Created this class to convert RPQ requests to Quote prices		None      
 --------------------------------------------------------------------------------------------------------------------------------------------
 */
public class PAQuotePrices{
	public ERP_Key_Combination__c kcrecord{get; set;} 
	public PAQuotePrices(){

	}
	public void storeQuotePrices(List<Pricing_Request__c> RPQTriggerList, Map<Id,Pricing_Request__c> newRequestsMap, Set<Id> RPQpricingReqIdSet){
		try{ 
			String prSel;
			if(RPQpricingReqIdSet.size()>0)
			{
				prSel='(';
				for(String prid:RPQpricingReqIdSet)
				{
					prSel=prSel+'\''+prid+'\',';
				}
				prSel=prSel.substring(0,prSel.length()-1);
				prSel=prSel+')';
			}
			else
				prSel=null;

			//To hold the instance of the price rpqholder
			Rebate_Quote_Price__c rpqholder = new Rebate_Quote_Price__c();
			//To hold the instance of newly created rpqholder
			Rebate_Quote_Price__c newrpqholder =new Rebate_Quote_Price__c();
			//To hold the instance of rpqholder to be extended in case of overlapping rpqholders
			Rebate_Quote_Price__c rpqholder1=new Rebate_Quote_Price__c();
			//To hold the instance of rpqholder to be deleted in case of overlapping rpqholders
			Rebate_Quote_Price__c rpqholder2=new Rebate_Quote_Price__c();
			//To hold the instance of the new pricing Record
			Rebate_Quote_Price__c rpqnewRec=new Rebate_Quote_Price__c();
			//List to hold the appropriate rpqholders
			List<Rebate_Quote_Price__c> apprpqholderList=new List<Rebate_Quote_Price__c>();
			//List to hold the child records of the rpqholder to be deleted
			List<Rebate_Quote_Price__c> rpqupdatechildRecOfDelrpqholderList= new List<Rebate_Quote_Price__c>();
			//List to hold the pricing records to be upserted
			List<Rebate_Quote_Price__c> rpqupsertList =new  List<Rebate_Quote_Price__c>();
			//List to hold the rpqholder to be deleted
			List<Rebate_Quote_Price__c> rpqdelList =new  List<Rebate_Quote_Price__c>();
			List<Rebate_Quote_Price__c> rpqvalidFromList =new List<Rebate_Quote_Price__c>();
			List<Rebate_Quote_Price__c> rpqvalidToList =new List<Rebate_Quote_Price__c>();
			List<Rebate_Quote_Price__c> rpqupdateApprovedPRIList =new List<Rebate_Quote_Price__c>();
			List<Rebate_Quote_Price__c> rpqchildRecordsOfDelrpqholder=new List<Rebate_Quote_Price__c>();
			List<Rebate_Quote_Price__c> rpqholdList=new List<Rebate_Quote_Price__c>();   
			Set<Id> rpqdelSet=new Set<Id>();
			Set<Id> rpqapprovedPRISet =new Set<Id>();
			//Set<Id>  pricingReqIdSet =new Set<Id>(); 
			Set<String> rpqconcateKCSet =new Set<String>(); 
			Set<String> rpqpcSet =new Set<String>();
			Set<String> rpqkcSet =new Set<String>();
			//define a parent price rpqholder Set.
			Map<String,List<Rebate_Quote_Price__c>> rpqlinkedPCKCrpqholdersMap =new Map<String,List<Rebate_Quote_Price__c>>();
			Map<String,List<Rebate_Quote_Price__c>> rpqholderChildMap =new Map<String,List<Rebate_Quote_Price__c>>();
			Map<String,List<Rebate_Quote_Price__c>> delrpqholderChildMap =new Map<String,List<Rebate_Quote_Price__c>>();
			Map<Rebate_Quote_Price__c,Rebate_Quote_Price__c> rpqdelRecOverLaprpqholderMap= new Map<Rebate_Quote_Price__c,Rebate_Quote_Price__c>();
			Map<Pricing_Request_Item__c,Rebate_Quote_Price__c> mapOfpriAndrpqholder =new  Map<Pricing_Request_Item__c,Rebate_Quote_Price__c> ();

			Integer rpqflag;
			Boolean rpqdeleteLogic=false;
			List<Pricing_Request_Item__c> rpqpriApprovedList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('Trig_validatePriceAUNew', 'priApprovedList', (RPQpricingReqIdSet.size()>0?' Pricing_Request__c in '+prSel:''));

			kcrecord = new ERP_Key_Combination__c();
			String rpqIdentifier = rpqpriApprovedList[0].BU__c+'-'+rpqpriApprovedList[0].Sales_Org_Code__c;
			Rebate_Price_Quote_Data__c rpqdata = Rebate_Price_Quote_Data__c.getInstance(rpqIdentifier);
			kcrecord = [select Key_Combination__c,Key_Combination_Code__c from ERP_Key_Combination__c where Key_Combination_Code__c='A790' Limit 1];

			Set<String> rpqexternalConcateSet= new Set<String>();        
			for(Pricing_Request_Item__c pri: rpqpriApprovedList)
			{
				rpqconcateKCSet.add(pri.PCKC__c);
				rpqpcSet.add(pri.Pricing_Condition_Code__c);
				//rpqkcSet.add(pri.Key_Combination_Code__c);
				rpqkcSet.add(kcrecord.Key_Combination_Code__c);
				String rpqexternalConcate = pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+kcrecord.Key_Combination_Code__c+'-'+pri.PCKC__c;
				//String rpqexternalConcate = pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c;
				rpqexternalConcateSet.add(rpqexternalConcate);
			}
			System.debug('**********************rpqconcateKCSet'+rpqconcateKCSet);
			System.debug('**********************rpqpcSet'+rpqpcSet);
			System.debug('**********************rpqkcSet'+rpqkcSet);
			System.debug('**********************rpqkcSet'+rpqexternalConcateSet);
			List<Rebate_Quote_Price__c> rpqholderList = new List<Rebate_Quote_Price__c>();

			Set<String> rpqbuSet= new Set<String>();
			Set<String> rpqsalesorgSet= new Set<String>();
			Set<String> rpqdivSet= new Set<String>();
			Set<String> rpqdistSet= new Set<String>();            
			for(Pricing_Request__c preq : RPQTriggerList)
			{
				rpqbuSet.add(preq.BU__c);
				rpqsalesorgSet.add(preq.Sales_Org_Code__c);
				rpqdivSet.add(preq.Division_Code__c);
				rpqdistSet.add(preq.Dist_Channel_Code__c);
			}
			list<Organizational_Group_Item__c> rpqorgItemPP = [SELECT ERP_Pricing_Procedure__c FROM Organizational_Group_Item__c WHERE 
			                                                   Business__r.Business__c IN :rpqbuSet AND OrgGroup__r.ERP_Sales_Org_Code__c IN :rpqsalesorgSet 
			                                                   AND OrgGroup__r.ERP_Distribution_Channel_Code__c  IN :rpqdistSet AND 
			                                                   OrgGroup__r.ERP_Division_Code__c IN :rpqdivSet];         
			string rpqppOrgItem =  rpqorgItemPP[0].ERP_Pricing_Procedure__c;         
			System.debug('*******************'+rpqppOrgItem);
			System.debug('ConcateKCSET Size:'+rpqconcateKCSet.size()+ ':**********************rpqconcateKCSet'+rpqconcateKCSet);
			System.debug('**********************rpqpcSet'+rpqpcSet);
			System.debug('**********************rpqkcSet'+rpqkcSet);

			if(rpqppOrgItem!=Null && rpqconcateKCSet.size()!=0 && rpqpcSet.size()!=0 && rpqkcSet.size()!=0)
			{
				List<Rebate_Quote_Price__c> holdlist1=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, 
				                                       Approved_Date__c, BU__c, Country__c, Country_Code__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Dist_Channel__c, 
				                                       Distribution_Channel_Code__c, Division__c, Division_Code__c, End_Use__c, End_Use_Code__c, End_User__c, End_User_Code__c, Incoterms_1_Code__c, Incoterms1__c, 
				                                       isPriceHolder__c, Key_Combination__c, Key_Combination_Code__c, Market_Segment__c, Market_Segment_Code__c, markForDeletion__c, Material__c, Material_Code__c, 
				                                       Material_Price_Group__c, Material_Price_Group_Code__c, Per__c, PH1__c, PH1_Code__c, PH2__c, PH2_Code__c, PH3__c, PH3_Code__c, PH4__c, PH4_Code__c, PH5__c, 
				                                       PH5_Code__c, PH6__c, PH6_Code__c, PH7__c, PH7_Code__c, PH8__c, PH8_Code__c, PH9__c, PH9_Code__c, Price_Holder__c, Price_List_Type__c, Price_List_Type_Code__c, 
				                                       Price_Ref_Partner__c, Price_Ref_Partner_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, 
				                                       F_Product_Hierarchy_Code__c, Profit_Center__c, Profit_Center_Code__c, Quantity__c, Rate__c, Sales_Office__c, Sales_Office_Code__c, Sales_Org__c, 
				                                       Sales_Org_Code__c, Sales_Pricing_Procedure__c, SAP_Application_ID__c, SAP_Client_ID__c, SAP_Cluster__c, ShipTo__c, ShipTo_Code__c, Sold_To__c, 
				                                       Sold_To_Code__c, Terms_of_Payment_code__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Customer_Hierarchy_Code__c, Customer_Hierarchy__c, 
				                                       External_ERP_ID__c, Terms_of_Payment__c, Variant__c, Variant_Code__c, Sales_Order_Type__c, Sales_Order_Type_Code__c, Pricing_Request__c, ComPartner__c, 
				                                       ComPartner_Code__c, Discount__c, PCKC__c FROM Rebate_Quote_Price__c WHERE External_ERP_ID__c IN:rpqexternalConcateSet AND PCKC__c IN :rpqconcateKCSet AND 
				                                       Sales_Pricing_Procedure__c=:rpqppOrgItem AND Pricing_Condition_Code__c=:rpqpcSet AND Key_Combination_Code__c=:rpqkcSet AND isPriceholder__c=true];
				System.debug('------Vada-----'+holdlist1);
				for(Rebate_Quote_Price__c h:holdlist1)
				{           
					if(!rpqlinkedPCKCrpqholdersMap.containskey(h.PCKC__c))
					{
						List<Rebate_Quote_Price__c> l=new List<Rebate_Quote_Price__c>();
						l.add(h);
						rpqlinkedPCKCrpqholdersMap.put(h.PCKC__c,l);
					}      
					else
					{  
						List<Rebate_Quote_Price__c> hList = rpqlinkedPCKCrpqholdersMap.get(h.PCKC__c);
						hList.add(h);
						rpqlinkedPCKCrpqholdersMap.put(h.PCKC__c,hList);
					}
					rpqholderList.add(h);
				}
			}

			List<Rebate_Quote_Price__c> linkedPricingRecords=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById 
			                                                  , Approved_Date__c, BU__c, Country__c, Country_Code__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Dist_Channel__c, 
			                                                  Distribution_Channel_Code__c, Division__c, Division_Code__c, End_Use__c, End_Use_Code__c, End_User__c, End_User_Code__c, Incoterms_1_Code__c, Incoterms1__c, 
			                                                  isPriceHolder__c, Key_Combination__c, Key_Combination_Code__c, Market_Segment__c, Market_Segment_Code__c, markForDeletion__c, Material__c, Material_Code__c, 
			                                                  Material_Price_Group__c, Material_Price_Group_Code__c, Per__c, PH1__c, PH1_Code__c, PH2__c, PH2_Code__c, PH3__c, PH3_Code__c, PH4__c, PH4_Code__c, PH5__c, 
			                                                  PH5_Code__c, PH6__c, PH6_Code__c, PH7__c, PH7_Code__c, PH8__c, PH8_Code__c, PH9__c, PH9_Code__c, Price_Holder__c, Price_List_Type__c, Price_List_Type_Code__c, 
			                                                  Price_Ref_Partner__c, Price_Ref_Partner_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, 
			                                                  F_Product_Hierarchy_Code__c, Profit_Center__c, Profit_Center_Code__c, Quantity__c, Rate__c, Sales_Office__c, Sales_Office_Code__c, Sales_Org__c, 
			                                                  Sales_Org_Code__c, Sales_Pricing_Procedure__c, SAP_Application_ID__c, SAP_Client_ID__c, SAP_Cluster__c, ShipTo__c, ShipTo_Code__c, Sold_To__c, 
			                                                  Sold_To_Code__c, Terms_of_Payment_code__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Customer_Hierarchy_Code__c, Customer_Hierarchy__c, 
			                                                  External_ERP_ID__c, Terms_of_Payment__c, Variant__c, Variant_Code__c, Sales_Order_Type__c, Sales_Order_Type_Code__c, Pricing_Request__c, ComPartner__c, 
			                                                  ComPartner_Code__c, Discount__c, PCKC__c From Rebate_Quote_Price__c WHERE Price_holder__c=: rpqholderList];

			for(Pricing_Request_Item__c pri: rpqpriApprovedList) 
			{                
				rpqholder=new Rebate_Quote_Price__c();
				newrpqholder=new Rebate_Quote_Price__c();
				rpqdeleteLogic=false;
				rpqholdList=new List<Rebate_Quote_Price__c>();    //can be removed         

				if(rpqlinkedPCKCrpqholdersMap.containsKey(pri.PCKC__c))
				{
					rpqholdList=new List<Rebate_Quote_Price__c>();
					rpqholdList = rpqlinkedPCKCrpqholdersMap.get(pri.PCKC__c).deepClone(true);
					rpqholdList=PAUtil.sortList(rpqholdList,'Valid_To__c','desc');                        
				}
				else
				{
					// no rpqholder present fot the PCKC of the request Item.                        
					newrpqholder= new Rebate_Quote_Price__c();
					newrpqholder = copyValues(newrpqholder,pri);                       

					mapOfpriAndrpqholder.put(pri,newrpqholder);                             
				}
				system.debug('rpqholdList size is '+rpqholdList.size());          
				if(rpqholdList.size()!=0)
				{
					rpqflag=0;
					Integer counter=0;
					apprpqholderList=new List<Rebate_Quote_Price__c>();


					for(Integer i=0;i<rpqholdList.size();i++)
					{

						if(((pri.New_Valid_From__c >= rpqholdList.get(i).Valid_From__c && pri.New_Valid_From__c <= rpqholdList.get(i).Valid_To__c+1) || (pri.New_Valid_To__c >= rpqholdList.get(i).Valid_From__c-1 && pri.New_Valid_To__c <= rpqholdList.get(i).Valid_To__c))||((rpqholdList.get(i).Valid_From__c >=pri.New_Valid_From__c && rpqholdList.get(i).Valid_From__c <=pri.New_Valid_To__c)||(rpqholdList.get(i).Valid_To__c>=pri.New_Valid_From__c &&rpqholdList.get(i).Valid_From__c <= pri.New_Valid_To__c)))
						{   
							apprpqholderList.add(rpqholdList.get(i));         
						}
					}
					if(apprpqholderList!=null && apprpqholderList.size()==0)
					{

						newrpqholder= new Rebate_Quote_Price__c();
						newrpqholder = copyValues(newrpqholder,pri);                
						mapOfpriAndrpqholder.put(pri,newrpqholder);     
					}
					//If size==1, there is only one approppriate rpqholder
					else if(apprpqholderList!=null && apprpqholderList.size()==1)
					{
						rpqholder =apprpqholderList.get(0);
						rpqflag=1; 
						mapOfpriAndrpqholder.put(pri,rpqholder);
					}
					else
					{
						apprpqholderList= PAUtil.sortList(apprpqholderList, 'Valid_To__c','asc');
						if(apprpqholderList!=null && apprpqholderList.size()!=0)
						{
							rpqholder=apprpqholderList.get(0);
							mapOfpriAndrpqholder.put(pri,rpqholder);
						}
						for(Integer i=1;i<apprpqholderList.size();i++)
						{
							rpqdelList.add(apprpqholderList.get(i));
							rpqdelRecOverLaprpqholderMap.put(apprpqholderList.get(i),apprpqholderList.get(0));
						}  
					}                
				}
			}
			Set<Rebate_Quote_Price__c> upsertrpqholderSet=new Set<Rebate_Quote_Price__c>();
			List<Rebate_Quote_Price__c> upsertrpqholderList =new   List<Rebate_Quote_Price__c>();
			Map<Id,Rebate_Quote_Price__c> idrpqholderMap=new  Map<Id,Rebate_Quote_Price__c>();
			for(Rebate_Quote_Price__c erp:mapOfpriAndrpqholder.values())
			{
				upsertrpqholderSet.add(erp);
			}
			for(Rebate_Quote_Price__c e1:upsertrpqholderSet)
			{
				upsertrpqholderList.add(e1);
			}

			upsert upsertrpqholderList;

			List<Rebate_Quote_Price__c> allrpqholdersList=[SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, 
			                                               Approved_Date__c, BU__c, Country__c, Country_Code__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Dist_Channel__c, 
			                                               Distribution_Channel_Code__c, Division__c, Division_Code__c, End_Use__c, End_Use_Code__c, End_User__c, End_User_Code__c, Incoterms_1_Code__c, Incoterms1__c, 
			                                               isPriceHolder__c, Key_Combination__c, Key_Combination_Code__c, Market_Segment__c, Market_Segment_Code__c, markForDeletion__c, Material__c, Material_Code__c, 
			                                               Material_Price_Group__c, Material_Price_Group_Code__c, Per__c, PH1__c, PH1_Code__c, PH2__c, PH2_Code__c, PH3__c, PH3_Code__c, PH4__c, PH4_Code__c, PH5__c, 
			                                               PH5_Code__c, PH6__c, PH6_Code__c, PH7__c, PH7_Code__c, PH8__c, PH8_Code__c, PH9__c, PH9_Code__c, Price_Holder__c, Price_List_Type__c, Price_List_Type_Code__c, 
			                                               Price_Ref_Partner__c, Price_Ref_Partner_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, 
			                                               F_Product_Hierarchy_Code__c, Profit_Center__c, Profit_Center_Code__c, Quantity__c, Rate__c, Sales_Office__c, Sales_Office_Code__c, Sales_Org__c, 
			                                               Sales_Org_Code__c, Sales_Pricing_Procedure__c, SAP_Application_ID__c, SAP_Client_ID__c, SAP_Cluster__c, ShipTo__c, ShipTo_Code__c, Sold_To__c, 
			                                               Sold_To_Code__c, Terms_of_Payment_code__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Customer_Hierarchy_Code__c, Customer_Hierarchy__c, 
			                                               External_ERP_ID__c, Terms_of_Payment__c, Variant__c, Variant_Code__c, Sales_Order_Type__c, Sales_Order_Type_Code__c, Pricing_Request__c, ComPartner__c, 
			                                               ComPartner_Code__c, Discount__c, PCKC__c From Rebate_Quote_Price__c WHERE Id=: upsertrpqholderList];

			for(Rebate_Quote_Price__c erphold:allrpqholdersList)
			{
				idrpqholderMap.put(erphold.Id,erphold);
			}

			Boolean createMarkedForDeletionRec=false;
			for(Pricing_Request_Item__c pri1:mapOfpriAndrpqholder.keySet())
			{
				//intially it is false, becomes true when the condition is satisfied
				createMarkedForDeletionRec=false;
				if(mapOfpriAndrpqholder.get(pri1)!=null && idrpqholderMap.containsKey(mapOfpriAndrpqholder.get(pri1).Id))
				{   
					rpqholder= idrpqholderMap.get(mapOfpriAndrpqholder.get(pri1).Id);
				}
				else
				{
					rpqholder=new Rebate_Quote_Price__c();
				}
				if(rpqholder!=null && rpqholder.Id!=null)
				{
					if(!pri1.expire__c)
					{
						//instantiate a new record
						rpqnewRec= new Rebate_Quote_Price__c();
						rpqnewRec.Price_holder__c=rpqholder.Id;    //VVIMP

						if((pri1.New_Valid_To__c < pri1.Valid_to__c ) && pri1.Pricing_Request_Type__c=='Project')
						{
							createMarkedForDeletionRec =true;
						}

						if((pri1.New_Valid_To__c > rpqholder.Valid_to__c || pri1.New_Valid_From__c < rpqholder.Valid_From__c ) && pri1.Pricing_Request_Type__c!='Project' )
						{
							if(pri1.New_Valid_To__c > rpqholder.Valid_to__c)
							{
								rpqholder.Valid_To__c=pri1.New_Valid_To__c;
							}
							if(pri1.New_Valid_From__c < rpqholder.Valid_From__c)
							{
								rpqholder.Valid_From__c=pri1.New_Valid_From__c; 
							}
							//add the rpqholder into rpqupsertList
							rpqupsertList.add(rpqholder);
						} 
						//System.debug('****upsert list1'+rpqupsertList);

						//newly added--irrespective of date/  rate change..          
						rpqnewRec.Valid_From__c = pri1.New_Valid_From__c;
						rpqnewRec.Valid_To__c = pri1.New_Valid_To__c;
						rpqnewRec.Approved_Date__c=System.now();
						rpqnewRec.BU__c=pri1.BU__c;
						rpqnewRec.Discount__c=pri1.Price_Reduction__c; 
						rpqnewRec.Country__c = pri1.Country__c;
						rpqnewRec.Country_code__c = pri1.Country_Code__c;
						rpqnewRec.Customer_Price_Group__c = pri1.Customer_Price_Group__c;
						rpqnewRec.Customer_Price_Group_Code__c = pri1.Customer_Price_Group_Code__c; 
						rpqnewRec.Dist_Channel__c = pri1.Dist_Channel__c;
						rpqnewRec.Distribution_Channel_Code__c = pri1.Dist_Channel_Code__c;
						rpqnewRec.Division__c = pri1.Division__c;
						rpqnewRec.Division_Code__c = pri1.Division_Code__c;
						rpqnewRec.End_Use__c =  pri1.End_Use__c;
						rpqnewRec.End_Use_Code__c = pri1.End_Use_Code__c;
						rpqnewRec.End_User__c = pri1.Pricing_Request__r.End_User__c;
						rpqnewRec.End_User_Code__c = pri1.Pricing_Request__r.End_User_Code__c;
						rpqnewRec.Customer_Hierarchy__c = pri1.Customer_Hierarchy__c;
						rpqnewRec.Customer_Hierarchy_Code__c = pri1.Customer_Hierarchy_Code__c;
						rpqnewRec.Incoterms1__c = pri1.Inco_terms__c;           
						rpqnewRec.Incoterms_1_Code__c = pri1.Incoterms_Code__c;
						rpqnewRec.Key_Combination__c=kcrecord.Key_Combination__c;
						if(kcrecord.Key_Combination_Code__c != null && kcrecord.Key_Combination_Code__c.length() > 4)
							rpqnewRec.Key_Combination_Code__c=kcrecord.Key_Combination_Code__c.substring(0,4);
						else
							rpqnewRec.Key_Combination_Code__c=kcrecord.Key_Combination_Code__c;
						rpqnewRec.Material__c = pri1.Material__c;
						rpqnewRec.Material_Code__c = pri1.Material_Code__c;
						rpqnewRec.Material_Price_Group__c = pri1.Material_price_Group__c;
						rpqnewRec.Material_Price_Group_Code__c = pri1.Material_Price_Group_Code__c;
						rpqnewRec.Per__c=pri1.New_Per__c;
						rpqnewRec.PH1__c = pri1.PH1__c;
						rpqnewRec.PH1_Code__c = pri1.PH1_Code__c;
						rpqnewRec.PH2__c = pri1.PH2__c;
						rpqnewRec.PH2_Code__c = pri1.PH2_Code__c;
						rpqnewRec.PH3__c = pri1.PH3__c;
						rpqnewRec.PH3_Code__c = pri1.PH3_Code__c;
						rpqnewRec.PH4__c = pri1.PH4__c;
						rpqnewRec.PH4_Code__c = pri1.PH4_Code__c;
						rpqnewRec.PH5__c = pri1.PH5__c;
						rpqnewRec.PH5_Code__c = pri1.PH5_Code__c;
						rpqnewRec.PH6__c = pri1.PH6__c;
						rpqnewRec.PH6_Code__c = pri1.PH6_Code__c;
						rpqnewRec.PH7__c = pri1.PH7__c;
						rpqnewRec.PH7_Code__c = pri1.PH7_Code__c;
						rpqnewRec.PH8__c = pri1.PH8__c;
						rpqnewRec.PH8_Code__c = pri1.PH8_Code__c;
						rpqnewRec.PH9__c = pri1.PH9__c;
						rpqnewRec.PH9_Code__c = pri1.PH9_Code__c;
						rpqnewRec.Price_List_Type__c = pri1.Price_List_Type__c;
						rpqnewRec.Price_List_Type_Code__c = pri1.Price_List_Type_Code__c;
						rpqnewRec.Pricing_Condition__c = pri1.Pricing_Condition__c;
						rpqnewRec.Pricing_Condition_Code__c = pri1.Pricing_Condition_Code__c;
						rpqnewRec.Product_Hierarchy__c = pri1.Product_Hierarchy__c;
						rpqnewRec.Product_Hierarchy_Code__c = pri1.Product_Hierarchy_Code__c;
						rpqnewRec.Profit_Center__c = pri1.Profit_Center__c;
						rpqnewRec.Profit_Center_Code__c = pri1.Profit_Center_Code__c;         
						rpqnewRec.Rate__c=Double.valueOf(pri1.New_Rate__c);
						rpqnewRec.Sales_Office__c = pri1.Sales_Office__c;
						rpqnewRec.Sales_Office_Code__c = pri1.Sales_Office_Code__c;
						rpqnewRec.Sales_Org__c = pri1.Sales_Org__c;
						rpqnewRec.Sales_Org_Code__c = pri1.Sales_Org_Code__c;
						rpqnewRec.Sales_Pricing_Procedure__c=pri1.ERP_Pricing_Procedure__c;
						rpqnewRec.SAP_Application_Id__c = pri1.SAP_Application_Id__c;
						rpqnewRec.SAP_Client_Id__c = pri1.SAP_Client_ID__c;
						rpqnewRec.SAP_Cluster__c= pri1.SAP_Cluster__c;
						rpqnewRec.ShipTo_Code__c=pri1.ShipTo_Code__c;
						rpqnewRec.ShipTo__c=pri1.ShipTo__c;
						if(String.isBlank(pri1.Payer_Code__c)){
							rpqnewRec.Sold_To__c=pri1.Pricing_Request__r.Sold_To__c;
							rpqnewRec.Sold_To_Code__c=pri1.Pricing_Request__r.SoldTo_Code__c;
						}else{
							rpqnewRec.Sold_To__c='';
							rpqnewRec.Sold_To_Code__c='';
						}
						rpqnewRec.Terms_Of_Payment_Code__c = pri1.Terms_of_Payment_Code__c;
						rpqnewRec.Pricing_request__c=pri1.Pricing_request__c;
						rpqnewRec.Terms_Of_Payment__c = pri1.Terms_of_Payment__c;
						rpqnewRec.UoM__c=pri1.New_UoM__c;
						rpqnewRec.Unit__c=pri1.New_Unit__c;
						rpqnewRec.Market_Segment_Code__c=pri1.Market_Segment_Code__c;
						rpqnewRec.Market_Segment__c=pri1.Market_Segment__c;
						rpqnewRec.Variant_Code__c=pri1.Variant_Code__c;
						rpqnewRec.Variant__c=pri1.Variant__c;
						rpqnewRec.ComPartner_Code__c=pri1.ComPartner_Code__c;
						rpqnewRec.ComPartner__c=pri1.ComPartner__c;
						rpqnewRec.Sales_Order_Type_Code__c=pri1.Sales_Order_Type_Code__c;
						rpqnewRec.Sales_Order_Type__c=pri1.Sales_Order_Type__c;
						rpqnewRec.Quantity__c = Double.valueOf(pri1.Quantity__c);
						rpqnewRec.OwnerId=pri1.Pricing_Request__r.OwnerId; 
						rpqnewRec.Price_Ref_Partner_Code__c=pri1.Price_Ref_Partner_Code__c;
						rpqnewRec.Price_Ref_Partner__c=pri1.Price_Ref_Partner__c;

						sObject sObj = (sObject)pri1 ; 
						List<String> kcSplitList =new List<String>();
						rpqnewRec.KC_SAP__c='';
						kcSplitList = kcrecord.Key_Combination__c.split('/');
						for(String kc:kcSplitList)
						{
							if(('Sales Org.').equalsIgnoreCase(kc))
							{
								rpqnewRec.KC_SAP__c =rpqnewRec.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
							}
							if(('Division').equalsIgnoreCase(kc))
							{
								rpqnewRec.KC_SAP__c =rpqnewRec.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
							}
							if(('Dist. Channel').equalsIgnoreCase(kc))
							{
								rpqnewRec.KC_SAP__c =rpqnewRec.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
							}
							if(('Sold to').equalsIgnoreCase(kc))
							{

								String soldTo=String.valueOf(sobj.get('Sold_To_Code__c'));
								if(soldTo <> null) {
									soldTo = (soldTo.leftPad(10)).replaceAll(' ', '0');
									rpqnewRec.KC_SAP__c =rpqnewRec.KC_SAP__c + soldTo;
								}

							}
							if(('Material').equalsIgnoreCase(kc))
							{

								String matCode = String.valueOf(sobj.get('Material_Code__c'));
								if(!String.isBlank(matCode))
									matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
								rpqnewRec.KC_SAP__c =rpqnewRec.KC_SAP__c + matCode;
							}

							if(('End User').equalsIgnoreCase(kc))
							{

								String endUser=String.valueOf(sobj.get('End_User_Code__c'));
								if(endUser <> null)
								{
									endUser = (endUser.leftPad(10)).replaceAll(' ', '0');
									rpqnewRec.KC_SAP__c =rpqnewRec.KC_SAP__c + endUser;
								}

							}

							rpqnewRec.KC_SAP__c.trim();
						}

						rpqupsertList.add(rpqnewRec); 
					}                       
					if(pri1.expire__c || createMarkedForDeletionRec)
					{
						//expire price scenario
						Rebate_Quote_Price__c rpqnewRec1=new Rebate_Quote_Price__c();

						if(pri1.Pricing_Request_Type__c!='Project')
						{
							rpqnewRec1.Valid_From__c=pri1.New_Valid_To__c + 1 ;
							rpqnewRec1.Valid_To__c= Date.newInstance(3999,12,31);
						}

						rpqnewRec1.Price_holder__c=rpqholder.Id;
						rpqnewRec1.markForDeletion__c=true; //imp
						rpqnewRec1.BU__c=pri1.BU__c; 
						rpqnewRec1.Discount__c=pri1.Price_Reduction__c; 
						rpqnewRec1.Approved_Date__c=System.now();
						rpqnewRec1.Dist_Channel__c = pri1.Dist_Channel__c;
						rpqnewRec1.Distribution_Channel_Code__c = pri1.Dist_Channel_Code__c;
						rpqnewRec1.Division__c = pri1.Division__c;
						rpqnewRec1.Division_Code__c = pri1.Division_Code__c;
						rpqnewRec1.End_Use__c =  pri1.End_Use__c;
						rpqnewRec1.End_Use_Code__c = pri1.End_Use_Code__c;
						rpqnewRec1.End_User__c = pri1.Pricing_Request__r.End_User__c;
						rpqnewRec1.End_User_Code__c = pri1.Pricing_Request__r.End_User_Code__c;
						rpqnewRec1.Customer_Hierarchy__c = pri1.Customer_Hierarchy__c;
						rpqnewRec1.Customer_Hierarchy_Code__c = pri1.Customer_Hierarchy_Code__c;
						rpqnewRec1.Key_Combination__c = kcrecord.Key_Combination__c;
						if(kcrecord.Key_Combination_Code__c != null && kcrecord.Key_Combination_Code__c.length() > 4)
							rpqnewRec1.Key_Combination_Code__c=kcrecord.Key_Combination_Code__c.substring(0,4);
						else
							rpqnewRec1.Key_Combination_Code__c = kcrecord.Key_Combination_Code__c;
						rpqnewRec1.Material__c = pri1.Material__c;
						rpqnewRec1.Material_Code__c = pri1.Material_Code__c;
						rpqnewRec1.Material_Price_Group__c = pri1.Material_Price_Group__c;
						rpqnewRec1.Material_Price_Group_Code__c = pri1.Material_Price_Group_Code__c;
						rpqnewRec1.Per__c=pri1.New_Per__c; 
						rpqnewRec1.PH1__c = pri1.PH1__c;
						rpqnewRec1.PH1_Code__c = pri1.PH1_Code__c;
						rpqnewRec1.PH2__c = pri1.PH2__c;
						rpqnewRec1.PH2_Code__c = pri1.PH2_Code__c;
						rpqnewRec1.PH3__c = pri1.PH3__c;
						rpqnewRec1.PH3_Code__c = pri1.PH3_Code__c;
						rpqnewRec1.PH4__c = pri1.PH4__c;
						rpqnewRec1.PH4_Code__c = pri1.PH4_Code__c;
						rpqnewRec1.PH5__c = pri1.PH5__c;
						rpqnewRec1.PH5_Code__c = pri1.PH5_Code__c;
						rpqnewRec1.PH6__c = pri1.PH6__c;
						rpqnewRec1.PH6_Code__c = pri1.PH6_Code__c;
						rpqnewRec1.PH7__c = pri1.PH7__c;
						rpqnewRec1.PH7_Code__c = pri1.PH7_Code__c;
						rpqnewRec1.PH8__c = pri1.PH8__c;
						rpqnewRec1.PH8_Code__c = pri1.PH8_Code__c;
						rpqnewRec1.PH9__c = pri1.PH9__c;
						rpqnewRec1.PH9_Code__c = pri1.PH9_Code__c;
						rpqnewRec1.Price_List_Type__c = pri1.Price_List_Type__c;
						rpqnewRec1.Price_List_Type_Code__c = pri1.Price_List_Type_Code__c;
						rpqnewRec1.Pricing_Condition__c = pri1.Pricing_Condition__c;
						rpqnewRec1.Pricing_Condition_Code__c = pri1.Pricing_Condition_Code__c;
						rpqnewRec1.Product_Hierarchy__c = pri1.Product_Hierarchy__c;
						rpqnewRec1.Product_Hierarchy_Code__c = pri1.Product_Hierarchy_Code__c;
						rpqnewRec1.Rate__c=Decimal.valueof(pri1.New_Rate__c);  
						rpqnewRec1.Sales_Office__c = pri1.Sales_Office__c;
						rpqnewRec1.Sales_Office_Code__c = pri1.Sales_Office_Code__c;
						rpqnewRec1.Sales_Org__c = pri1.Sales_Org__c;
						rpqnewRec1.Sales_Org_Code__c = pri1.Sales_Org_Code__c;
						rpqnewRec1.Sales_Pricing_Procedure__c=pri1.ERP_Pricing_Procedure__c;
						rpqnewRec1.SAP_Application_Id__c = pri1.SAP_Application_Id__c;
						rpqnewRec1.SAP_Client_Id__c = pri1.SAP_Client_ID__c;
						rpqnewRec1.SAP_Cluster__c= pri1.SAP_Cluster__c;
						rpqnewRec1.ShipTo_Code__c=pri1.ShipTo_Code__c;
						rpqnewRec1.ShipTo__c=pri1.ShipTo__c; 
						if(String.isBlank(pri1.Payer_Code__c)){     
							rpqnewRec1.Sold_To__c=pri1.Pricing_Request__r.Sold_To__c;
							rpqnewRec1.Sold_To_Code__c=pri1.Pricing_Request__r.SoldTo_Code__c;
						}else{
							rpqnewRec1.Sold_To__c='';
							rpqnewRec1.Sold_To_Code__c='';
						}         
						rpqnewRec1.Terms_Of_Payment_Code__c = pri1.Terms_of_Payment_Code__c;
						rpqnewRec1.Terms_Of_Payment__c = pri1.Terms_of_Payment__c;
						rpqnewRec1.UoM__c=pri1.New_UoM__c;
						rpqnewRec1.Unit__c=pri1.New_Unit__c;
						rpqnewRec1.Market_Segment_Code__c=pri1.Market_Segment_Code__c;
						rpqnewRec1.Market_Segment__c=pri1.Market_Segment__c;
						rpqnewRec1.Pricing_request__c=pri1.Pricing_request__c;
						rpqnewRec.Quantity__c = Double.valueOf(pri1.Quantity__c);

						sObject sObj = (sObject)pri1 ; 
						List<String> kcSplitList =new List<String>();
						rpqnewRec1.KC_SAP__c='';
						kcSplitList = kcrecord.Key_Combination__c.split('/');
						for(String kc:kcSplitList)
						{
							if(('Sales Org.').equalsIgnoreCase(kc))
							{
								rpqnewRec1.KC_SAP__c =rpqnewRec1.KC_SAP__c + String.valueOf(sobj.get('Sales_Org_Code__c'));
							}
							if(('Division').equalsIgnoreCase(kc))
							{
								rpqnewRec1.KC_SAP__c =rpqnewRec1.KC_SAP__c + String.valueOf(sobj.get('Division_Code__c'));
							}
							if(('Dist. Channel').equalsIgnoreCase(kc))
							{
								rpqnewRec1.KC_SAP__c =rpqnewRec1.KC_SAP__c + String.valueOf(sobj.get('Dist_Channel_Code__c'));
							}
							if(('Sold to').equalsIgnoreCase(kc))
							{

								String soldTo=String.valueOf(sobj.get('Sold_To_Code__c'));
								if(soldTo <> null) {
									soldTo = (soldTo.leftPad(10)).replaceAll(' ', '0');
									rpqnewRec1.KC_SAP__c =rpqnewRec1.KC_SAP__c + soldTo;
								}

							}
							System.debug('*****created mark fr del'+rpqnewRec.KC_SAP__c+kc);
							if(('Material').equalsIgnoreCase(kc))
							{

								String matCode = String.valueOf(sobj.get('Material_Code__c'));
								if(!String.isBlank(matCode))
									matCode = (matCode.rightPad(18)).replaceAll(' ', '#');
								rpqnewRec1.KC_SAP__c =rpqnewRec1.KC_SAP__c + matCode;
							}
							System.debug('*****created mark fr del'+rpqnewRec.KC_SAP__c+kc);


							if(('End User').equalsIgnoreCase(kc))
							{

								String endUser=String.valueOf(sobj.get('End_User_Code__c'));
								if(endUser <> null)
								{
									endUser = (endUser.leftPad(10)).replaceAll(' ', '0');
									rpqnewRec1.KC_SAP__c =rpqnewRec1.KC_SAP__c + endUser;
								}

							}

							rpqnewRec1.KC_SAP__c.trim(); 
						}

						System.debug('*****created mark fr del'+rpqnewRec.KC_SAP__c+kcSplitList);
						rpqupsertList.add(rpqnewRec1);

						if(pri1.Pricing_Request_Type__c!='Project')
						{
							rpqholder.Valid_To__c=pri1.New_Valid_To__c;
							rpqupsertList.add(rpqholder);
						}
					} 


				}  
			}

			upsert rpqupsertList;
			if(rpqdelList.size()!=0)
			{
				rpqdelSet=new Set<Id>();
				for(Rebate_Quote_Price__c d: rpqdelList)
				{
					rpqdelSet.add(d.Id);
				}
				List<Rebate_Quote_Price__c> childRecOfDelrpqholder = [SELECT Id, OwnerId, IsDeleted, Name, CurrencyIsoCode, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById,  
				                                                      Approved_Date__c, BU__c, Country__c, Country_Code__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Dist_Channel__c, 
				                                                      Distribution_Channel_Code__c, Division__c, Division_Code__c, End_Use__c, End_Use_Code__c, End_User__c, End_User_Code__c, Incoterms_1_Code__c, Incoterms1__c, 
				                                                      isPriceHolder__c, Key_Combination__c, Key_Combination_Code__c, Market_Segment__c, Market_Segment_Code__c, markForDeletion__c, Material__c, Material_Code__c, 
				                                                      Material_Price_Group__c, Material_Price_Group_Code__c, Per__c, PH1__c, PH1_Code__c, PH2__c, PH2_Code__c, PH3__c, PH3_Code__c, PH4__c, PH4_Code__c, PH5__c, 
				                                                      PH5_Code__c, PH6__c, PH6_Code__c, PH7__c, PH7_Code__c, PH8__c, PH8_Code__c, PH9__c, PH9_Code__c, Price_Holder__c, Price_List_Type__c, Price_List_Type_Code__c, 
				                                                      Price_Ref_Partner__c, Price_Ref_Partner_Code__c, Pricing_Condition__c, Pricing_Condition_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, 
				                                                      F_Product_Hierarchy_Code__c, Profit_Center__c, Profit_Center_Code__c, Quantity__c, Rate__c, Sales_Office__c, Sales_Office_Code__c, Sales_Org__c, 
				                                                      Sales_Org_Code__c, Sales_Pricing_Procedure__c, SAP_Application_ID__c, SAP_Client_ID__c, SAP_Cluster__c, ShipTo__c, ShipTo_Code__c, Sold_To__c, 
				                                                      Sold_To_Code__c, Terms_of_Payment_code__c, Unit__c, UoM__c, Valid_From__c, Valid_To__c, Customer_Hierarchy_Code__c, Customer_Hierarchy__c, 
				                                                      External_ERP_ID__c, Terms_of_Payment__c, Variant__c, Variant_Code__c, Sales_Order_Type__c, Sales_Order_Type_Code__c, Pricing_Request__c, ComPartner__c, 
				                                                      ComPartner_Code__c, Discount__c, PCKC__c From Rebate_Quote_Price__c WHERE Price_holder__c IN:rpqdelSet];
				//put del records and list of its child records in a map
				for(Rebate_Quote_Price__c childOfDel:childRecOfDelrpqholder)
				{
					if(!delrpqholderChildMap.containskey(childOfDel.Price_holder__c))
					{
						List<Rebate_Quote_Price__c> l1=new List<Rebate_Quote_Price__c>();
						l1.add(childOfDel);
						delrpqholderChildMap.put(childOfDel.Price_holder__c,l1);
					}      
					else
					{ 
						List<Rebate_Quote_Price__c> delChildList = delrpqholderChildMap.get(childOfDel.Price_holder__c);
						delChildList.add(childOfDel);
						delrpqholderChildMap.put(childOfDel.Price_holder__c,delChildList);
					}
				}  
				//end
				Set<Rebate_Quote_Price__c> delrpqholdersSet= new Set<Rebate_Quote_Price__c>();
				delrpqholdersSet=rpqdelRecOverLaprpqholderMap.keySet();          
				for(Rebate_Quote_Price__c e :delrpqholdersSet)
				{
					Rebate_Quote_Price__c newHold=rpqdelRecOverLaprpqholderMap.get(e);
					if(delrpqholderChildMap.get(e.Id)!=null)
						rpqchildRecordsOfDelrpqholder= delrpqholderChildMap.get(e.Id);
					for(Rebate_Quote_Price__c c1:rpqchildRecordsOfDelrpqholder) {
						c1.Price_holder__c = newHold.Id;
						rpqupdatechildRecOfDelrpqholderList.add(c1);          
					}           
				}   

				upsert rpqupdatechildRecOfDelrpqholderList;
				set<Rebate_Quote_Price__c> deleteset =new  Set<Rebate_Quote_Price__c>();
				deleteset.addAll(rpqdelList);
				rpqdelList = new list<Rebate_Quote_Price__c>();
				rpqdelList.addAll(deleteset);
				if(rpqdelList.size()!=0)
					delete rpqdelList;                                                        
			}

		}Catch(Exception e){
			system.debug(e.getMessage()+' at '+e.getLineNumber());
		}
	}
	private Rebate_Quote_Price__c copyValues(Rebate_Quote_Price__c newholder, Pricing_Request_Item__c pri){

		newholder.Valid_From__c = pri.New_Valid_From__c;
		newholder.Valid_To__c = pri.New_Valid_To__c;  
		newHolder.Approved_Date__c=System.now();
		newHolder.BU__c=pri.BU__c;
		newHolder.Discount__c=pri.Price_Reduction__c; 
		newHolder.Dist_Channel__c = pri.Dist_Channel__c;
		newHolder.Distribution_Channel_Code__c = pri.Dist_Channel_Code__c;
		newHolder.Division__c = pri.Division__c;
		newHolder.Division_Code__c = pri.Division_Code__c;
		newHolder.End_Use__c =  pri.End_Use__c;
		newHolder.End_Use_Code__c = pri.End_Use_Code__c;
		newHolder.End_User__c = pri.Pricing_Request__r.End_User__c;
		newHolder.End_User_Code__c = pri.Pricing_Request__r.End_User_Code__c;
		newHolder.Customer_Hierarchy__c = pri.Customer_Hierarchy__c;
		newHolder.Customer_Hierarchy_Code__c = pri.Customer_Hierarchy_Code__c;
		newHolder.Key_Combination__c=kcrecord.Key_Combination__c;
		if(kcrecord.Key_Combination_Code__c != null && kcrecord.Key_Combination_Code__c.length() > 4)
			newHolder.Key_Combination_Code__c=kcrecord.Key_Combination_Code__c.substring(0,4);
		else
			newHolder.Key_Combination_Code__c=kcrecord.Key_Combination_Code__c;
		newHolder.Material__c = pri.Material__c;
		newHolder.Material_Code__c = pri.Material_Code__c;
		newHolder.Material_Price_Group__c = pri.Material_Price_Group__c;
		newHolder.Material_Price_Group_Code__c = pri.Material_Price_Group_Code__c;
		newHolder.PH1__c = pri.PH1__c;
		newHolder.PH1_Code__c = pri.PH1_Code__c;
		newHolder.PH2__c = pri.PH2__c;
		newHolder.PH2_Code__c = pri.PH2_Code__c;
		newHolder.PH3__c = pri.PH3__c;
		newHolder.PH3_Code__c = pri.PH3_Code__c;
		newHolder.PH4__c = pri.PH4__c;
		newHolder.PH4_Code__c = pri.PH4_Code__c;
		newHolder.PH5__c = pri.PH5__c;
		newHolder.PH5_Code__c = pri.PH5_Code__c;
		newHolder.PH6__c = pri.PH6__c;
		newHolder.PH6_Code__c = pri.PH6_Code__c;
		newHolder.PH7__c = pri.PH7__c;
		newHolder.PH7_Code__c = pri.PH7_Code__c;
		newHolder.PH8__c = pri.PH8__c;
		newHolder.PH8_Code__c = pri.PH8_Code__c;
		newHolder.PH9__c = pri.PH9__c;
		newHolder.PH9_Code__c = pri.PH9_Code__c;
		newHolder.Price_List_Type__c = pri.Price_List_Type__c;
		newHolder.Price_List_Type_Code__c = pri.Price_List_Type_Code__c;
		newHolder.Pricing_Condition__c=pri.Pricing_Condition__c;
		newHolder.Pricing_Condition_Code__c=pri.Pricing_Condition_Code__c;
		newHolder.Product_Hierarchy__c = pri.Product_Hierarchy__c;
		newHolder.Product_Hierarchy_Code__c = pri.Product_Hierarchy_Code__c;
		newHolder.Sales_Office__c = pri.Sales_Office__c;
		newHolder.Sales_Office_Code__c = pri.Sales_Office_Code__c;
		newHolder.Sales_Org__c = pri.Sales_Org__c;
		newHolder.Sales_Org_Code__c = pri.Sales_Org_Code__c;
		newHolder.Sales_Pricing_Procedure__c=pri.ERP_Pricing_Procedure__c;  
		newHolder.SAP_Application_Id__c =pri.SAP_Application_Id__c;
		newHolder.SAP_Client_ID__c=pri.SAP_Client_ID__c;
		newHolder.SAP_Cluster__c= pri.SAP_Cluster__c;
		newHolder.ShipTo__c=pri.ShipTo__c;
		newHolder.ShipTo_Code__c=pri.ShipTo_Code__c;
		if(String.isBlank(pri.Payer_Code__c)){
			newHolder.Sold_To__c=pri.Pricing_Request__r.Sold_To__c;   
			newHolder.Sold_To_Code__c=pri.Pricing_Request__r.SoldTo_Code__c;
		}else{
			newHolder.Sold_To__c='';   
			newHolder.Sold_To_Code__c='';
		}

		newHolder.Terms_Of_Payment_Code__c = pri.Terms_of_Payment_Code__c;
		newHolder.Terms_Of_Payment__c = pri.Terms_of_Payment__c;
		newHolder.Market_Segment_Code__c=pri.Market_Segment_Code__c;
		newHolder.Market_Segment__c=pri.Market_Segment__c;
		newHolder.Pricing_request__c=pri.Pricing_request__c;
		newHolder.Variant_Code__c=pri.Variant_Code__c;
		newHolder.Variant__c=pri.Variant__c;
		newHolder.ComPartner_Code__c=pri.ComPartner_Code__c;
		newHolder.ComPartner__c=pri.ComPartner__c;
		newHolder.Sales_Order_Type_Code__c=pri.Sales_Order_Type_Code__c;
		newHolder.Sales_Order_Type__c=pri.Sales_Order_Type__c;
		newHolder.OwnerId=pri.Pricing_Request__r.OwnerId;  
		newHolder.Price_Ref_Partner_Code__c=pri.Price_Ref_Partner_Code__c;
		newHolder.Price_Ref_Partner__c=pri.Price_Ref_Partner__c;
		newHolder.isPriceHolder__c=true; 
		return newHolder;


	}

}