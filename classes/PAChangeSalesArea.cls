/**********************************************************************************************************************
 ***********************************************Modification Log********************************************************
<PP20131021>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   21 October 2013
Description         :   ROLLOUT 2 SIT Issue # 11 FIX - Adding State__c and ZIP_Postal_Code__c to the query
 ***********************************************************************************************************************/
public with sharing class PAChangeSalesArea implements IPAComponent
{

	//variables
	public list<ERP_Customer__c> perm_custRecord {get;set;}
	public String soldToCode {get;set;}
	public Id CSAId {get;set;}
	public  Boolean flagCSA {get;set;}
	public String selectedBusiness {get;set;}
	//For setting current page label

	//constructor
	public PAChangeSalesArea()
	{
		perm_custRecord = new list<ERP_Customer__c>();
		system.debug('&&& soldToCode '+soldToCode);
		flagCSA = false;
		system.debug('&&& flagCSA '+flagCSA);
	}

	//Methods
	/*
	 * Author	   : 
	 * Method Name  :   action
	 * Parameters   :   
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference action(){
		return null;
	} 

	/*
	 * Author	   : 
	 * Method Name  :   displayPopUpWindowMethod
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference displayPopUpWindow() {
		return actionCSA();
	}

	/*
	 * Author	   : 
	 * Method Name  :   searchCustomer
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference dosearch() {
		return null;
	}
	/*
	 * Author	   : 
	 * Method Name  :   returnData
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference returnData(){
		return closeActionCSA();
	}

	/*
	 * Author	   : 
	 * Method Name  :   closeWindow
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference closeWindow(){
		return closeActionCSA();
	}

	/*
	 * Author	  : Anand Darshi
	 * Method Name : pro_fetchProjectMethod
	 * Parameters  : No parameters
	 * Return type : void 
	 * Description : Fetch current projects and completed projects on clicking Fetch Projects or Fetch All Projects.
	 */

	private PageReference closeActionCSA()
	{
		flagCSA = false;
		return null;
		//ApexPages.currentPage().getParameters().put('SAreaLink','true'); --commented on jan17th--refactoring
	}

	/*
	 * Author	  : Anand Darshi
	 * Method Name : actionCSA
	 * Parameters  : No parameters
	 * Return type : void 
	 * Description : Shows the customer details of multiple SalesArea.
	 */

	private PageReference actionCSA()
	{

		system.debug('###change sales area');
		flagCSA = true;
		system.debug('&&& flagCSA '+flagCSA);
		perm_custRecord = new list<ERP_Customer__c>();
		system.debug('&&& soldToCode '+soldToCode);

		List<String> OGSAId = new List<String>();
		List<String> salesOrgList = new List<String>();
		List<String>  distChannelList = new List<String>();
		List<String> divisionList = new List<String>(); 
		List<Organizational_Group_User__c> OGU = [SELECT Organizational_Group_Item__c,OrgGroup__c FROM Organizational_Group_User__c WHERE Related_User__c=:UserInfo.getUserId() AND Organizational_Group_Item__r.Business__c=:selectedBusiness];

		system.debug('&&& OGU '+OGU);

		for(Organizational_Group_User__c X:OGU)
		{
			OGSAId.add(X.OrgGroup__c);
		}

		system.debug('&&& OGSAId '+OGSAId);

		List<OrgGroup__c> OGSalesArea = [SELECT ERP_Sales_Org_Code__c,ERP_Distribution_Channel_Code__c,ERP_Division_Code__c FROM OrgGroup__c WHERE Id IN:OGSAId];

		system.debug('&&& OGSalesArea '+OGSalesArea);

		for(OrgGroup__c X:OGSalesArea)
		{
			salesOrgList.add(X.ERP_Sales_Org_Code__c);
			distChannelList.add(X.ERP_Distribution_Channel_Code__c);
			divisionList.add(X.ERP_Division_Code__c);
		}
		system.debug('&&& salesOrgList '+salesOrgList);
		system.debug('&&& distChannelList '+distChannelList);
		system.debug('&&& divisionList '+divisionList);
		//<PP20131021>
		perm_custRecord=[SELECT  Customer_Code__c,Name,Country__c,Street__c,Sales_Office__c,City__c,Account_Group__c,Distribution_Channel__c,Distribution_Channel_Code__c,
						Division__c,Division_Code__c,PO_Box__c,Sales_Org__c,Sales_Org_Code__c,State_Province__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
						Incoterms_1_Code__c,Incoterms_1__c,Incoterms_2__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,State__c,ZIP_Postal_Code__c
						FROM ERP_Customer__c WHERE Customer_Code__c = :soldToCode AND Sales_Org_Code__c IN:salesOrgList AND Distribution_Channel_Code__c IN:distChannelList AND Division_Code__c IN:divisionList];
		system.debug('&&& rec '+perm_custRecord);
		system.debug('&&& rec size'+perm_custRecord.size());
		return null;
	}
}