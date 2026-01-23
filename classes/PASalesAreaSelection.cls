// bala - Added variable userIdComponent and modified the way to populate Sales Area
/**************************************************************************************************************
 ***********************************************Modification Log************************************************
<PP20130724>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 Jul 2013
Description         :   Added logic to query for Enable Request Class and Request Class of OGI - APAC ROLLOUT2
 *****************************************************************************************************************
<TJ20140519>
 Last Modified By   :   Tarun
 Last Modified Date :   19 May 2014
 Description        :   Label for Help Link.
 *****************************************************************************************************************/
public with sharing class PASalesAreaSelection implements IPAComponent
{
	//variables
	public List<Organizational_Group_Item__c> salesArea {get;set;}   //The list which will hold all the Sales Area belongs to the selected BU
	public string salesAreaSelected {get;set;}   //Used to display the selected Sales Area in the page
	public string divisionSelected {get;set;}
	public string distChannelSelected {get;set;}
	public string salesOrgSelected {get;set;}
	public boolean dispSAPopup {get;set;}   //flag used to render Sales Area pop up
	public string buIdComponent {get;set;}
	public string buCode {get;set;}   //Used to display the BuCode
	public List<Organizational_Group_Item__c> buOrgList {get;set;}   //The list which holds the BU Org Group for the selected BU
	public string userIdComponent{get;set;}//userIdFromPage
	public list<Organizational_Group_User__c> ogUsersSA {get;set;}
	public string salesAreaId {get;set;}   //used to hold the id of the Sales Area selected
	//For setting current page label

	// <SP20140603> - START
	private boolean displayBoolean = true;
	public boolean enablePopUpBoolean 
	{
		get
		{
			if(enablePopUpBoolean == null) 
			{  
				enablePopUpBoolean = false;
			}

			return enablePopUpBoolean;
		}
		set
		{
			enablePopUpBoolean = value;
			system.debug('enablePopUpBoolean'+enablePopUpBoolean);
			if(enablePopUpBoolean == true && displayBoolean == true)
			{
				displayPopUpWindow();
			}
		}
	}
	//<SP20140603> - END

	//<TJ20140519>
	public String label{get;set;}

	//constructor 
	public PASalesAreaSelection()
	{
		dispSAPopup=false;
	}//constructor ends

	/*
	 * Author      : 
	 * Method Name  :   action
	 * Parameters   :   
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference action()
	{
		return null;
	} 

	/*
	 * Author      : 
	 * Method Name  :   displayPopUpWindowMethod
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference displayPopUpWindow()
	{
		return saPopUpOpen();
	}

	/*
	 * Author      : 
	 * Method Name  :   searchCustomer
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference dosearch()
	{
		return null;
	}
	/*
	 * Author      : 
	 * Method Name  :   returnData
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference returnData()
	{
		enablePopUpBoolean=false;
		return saPopUpClose();
	}

	/*
	 * Author      : 
	 * Method Name  :   closeWindow
	 * Parameters   :  
	 * Return type  :   PageReference
	 * Description  :   
	 */
	public PageReference closeWindow()
	{
		return saPopUpClose();
	}
	/*
	 * Author      :
	 * Method Name : saPopUpOpen
	 * Parameters  : None
	 * Return type : void
	 * Description : Used to display the Sales Area Pop Up
	 */
	public PageReference saPopUpOpen() 
	{
		dispSAPopup=true;
		displayBoolean = false; // <SP20140603> 
		ogUsersSA = new List<Organizational_Group_User__c>();
		if(String.isBlank(userIdComponent))
		{
			userIdComponent = userinfo.getUserId();
		}
		system.debug('@@@@ buIdComponent : ' +buIdComponent+'*** After UserId'+userIdComponent);  
		//<PP20130724>
		ogUsersSA = [SELECT OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel__c,
		             OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division__c,OrgGroup__r.ERP_Division_Code__c ,
		             Organizational_Group_Item__r.Request_Class__c,Organizational_Group_Item__r.Enable_Request_Class__c,
		             Organizational_Group_Item__r.Business__c,Organizational_Group_Item__r.Business__r.Business__c FROM Organizational_Group_User__c
		             WHERE Related_User__c =:userIdComponent AND (Organizational_Group_Item__r.Business__c=:buIdComponent OR
		            		 Organizational_Group_Item__r.Business__r.Business__c=:buIdComponent) ORDER BY OrgGroup__r.ERP_Sales_Org_Code__c];
		System.debug('*** After list size'+ogUsersSA );
		return null;
	}

	/*
	 * Author      : 
	 * Method Name : saPopUpClose
	 * Parameters  : None
	 * Return type : void
	 * Description : Used to close the Sales Area Pop Up
	 */
	private PageReference saPopUpClose() 
	{
		dispSAPopup=false;
		return null;
	}
	//<TJ20140519>
	public PageReference helpLink()
	{
		PAHelpLinks__c link;
		link = PAHelpLinks__c.getInstance(label);
		system.debug('**Link '+link.Help_Link__c);
		PageReference pref=new PageReference(link.Help_Link__c);
		pref.setRedirect(false);
		system.debug('**PREF '+pref);
		return pref;
	}
}