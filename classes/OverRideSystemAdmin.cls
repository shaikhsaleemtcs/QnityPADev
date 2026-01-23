/**************************************************************************************************************
 ***********************************************Modification Log************************************************
<PP20130808>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   08 Aug 2013
Description         :   Production Issue Fix - Moving query to List to avoid list has no rows exception                                   
 *****************************************************************************************************************/
public with sharing class OverRideSystemAdmin 
{
	public Id pricingRequestId{get;set;}	
	public OverRideSystemAdmin(ApexPages.StandardController controller)
	{
		pricingRequestId = controller.getId();
	}
	public PageReference route()
	{

		List<Profile> profileList = new List<Profile>();
		profileList = [select id from Profile where Name like 'System Administrator' limit 1];
		Id p;
		if(profileList.size() > 0)
		{
			p = profileList[0].Id;
		}

		PageReference returnToPage = new PageReference('/'+pricingRequestId);
		if(Userinfo.getProfileId()==p)
		{
			returnToPage.getParameters().put('nooverride', '1');
		}
		else
		{
			//eturnToPage = new PageReference('/apex/PAPricingRequest?id='+pricingRequestId);
			Pricing_Request__c pr = [select Request_Type__c from Pricing_Request__c where id=:pricingRequestId];
			if(pr.Request_Type__c=='Import' || pr.Request_Type__c=='Mass Import' )
			returnToPage = new PageReference('/apex/PAImportReqItems?id='+pricingRequestId);
			else
			returnToPage = new PageReference('/apex/PAPricingRequest?id='+pricingRequestId);
		}
		return returnToPage;
	}
	public PageReference routeToEdit()
	{
		List<Profile> profileList = new List<Profile>();
		profileList = [select id from Profile where Name like 'System Administrator' limit 1];
		Id p;
		if(profileList.size() > 0)
		{
			p = profileList[0].Id;
		}
		system.debug('PPPPPPPPP'+p);
		PageReference returnToPage = new PageReference('/'+pricingRequestId+'/e');
		if(Userinfo.getProfileId()==p)
		{
			system.debug('In IF');
			returnToPage.getParameters().put('nooverride', '1');
		}
		else
		{
			system.debug('In ELSE');
			returnToPage = new PageReference('/apex/PAPricingRequest?id='+pricingRequestId);
		}
		return returnToPage;
	}
}