/*
 * Name		 :   PAChangeSalesArea_UT
 * Description  :   This is the test class for PAChangeSalesArea
 * Author	   :   Infosys Limited
 * Created Date :   20-03-2013
 *
 * Version	  Modified Date	   Modified By	 Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class PAChangeSalesArea_UT
{
	static testMethod void PAChangeSalesAreaTestMethod()
	{
		PAChangeSalesArea changeSA = new PAChangeSalesArea();
		List<ERP_Customer__c> erpCustList = new List<ERP_Customer__c>();
		ERP_Customer__c cust = new ERP_Customer__c();
		cust.Customer_Code__c = '123';
		cust.Sales_Org_Code__c='A640';
		cust.Distribution_Channel_Code__c='10';
		cust.Division_Code__c='02';
		erpCustList.add(cust);
		ERP_Customer__c cust1 = new ERP_Customer__c();
		cust1.Customer_Code__c = '123';
		cust1.Sales_Org_Code__c='A641';
		cust1.Distribution_Channel_Code__c='10';
		cust1.Division_Code__c='02';
		erpCustList.add(cust1);
		insert erpCustList;
		
		Recordtype recType = [select id,name from Recordtype where name = 'Business'];
		Recordtype recType1 = [select id,name from Recordtype where name = 'ERP Sales Area'];
		List<OrgGroup__c> orgGrpList = new List<OrgGroup__c>();
		OrgGroup__c orgGrp = new OrgGroup__c();
		orgGrp.Business__c = 'Surfaces';
		orgGrp.RecordTypeId = recType.id;
		orgGrpList.add(orgGrp);
		OrgGroup__c orgGrp1 = new OrgGroup__c();
		orgGrp1.ERP_Sales_Org_Code__c = 'A640';
		orgGrp1.ERP_Distribution_Channel_Code__c='10';
		orgGrp1.ERP_Division_Code__c='02';
		orgGrp1.RecordTypeId = recType1.id;
		orgGrpList.add(orgGrp1);
		OrgGroup__c orgGrp2 = new OrgGroup__c();
		orgGrp2.ERP_Sales_Org_Code__c = 'A641';
		orgGrp2.ERP_Distribution_Channel_Code__c='10';
		orgGrp2.ERP_Division_Code__c='02';
		orgGrp2.RecordTypeId = recType1.id;
		orgGrpList.add(orgGrp2);
		insert orgGrpList;
		
		ERP_Pricing_Procedure__c erpPP = new ERP_Pricing_Procedure__c();
		erpPP.Pricing_Procedure_Code__c = 'PP001';
		erpPP.Pricing_Procedure__c = 'PP Surfaces';
		insert erpPP;
		
		List<Organizational_Group_Item__c> ogItemList = new List<Organizational_Group_Item__c>();
		Organizational_Group_Item__c ogItem = new Organizational_Group_Item__c();
		ogItem.ERP_Pricing_Procedure__c = erpPP.Id;
		ogItem.Business__c = orgGrpList[0].id;
		ogItem.OrgGroup__c = orgGrpList[1].id;
		ogItemList.add(ogItem);
		Organizational_Group_Item__c ogItem1 = new Organizational_Group_Item__c();
		ogItem1.ERP_Pricing_Procedure__c = erpPP.Id;
		ogItem1.Business__c = orgGrpList[0].id;
		ogItem1.OrgGroup__c = orgGrpList[2].id;
		ogItemList.add(ogItem1);
		insert ogItemList;
		
		List<Organizational_Group_User__c> ogUserList = new List<Organizational_Group_User__c>();
		Organizational_Group_User__c ogUser = new Organizational_Group_User__c();
		ogUser.Organizational_Group_Item__c=ogItemList[0].id;
		ogUser.OrgGroup__c=orgGrpList[1].id;
		ogUser.Related_User__c=UserInfo.getUserId();
		ogUserList.add(ogUser);
		Organizational_Group_User__c ogUser1 = new Organizational_Group_User__c();
		ogUser1.Organizational_Group_Item__c=ogItemList[1].id;
		ogUser1.OrgGroup__c=orgGrpList[2].id;
		ogUser1.Related_User__c=UserInfo.getUserId();
		ogUserList.add(ogUser1);
		insert ogUserList;
		
		changeSA.selectedBusiness = orgGrpList[0].id;
		changeSA.action();
		changeSA.displayPopUpWindow();
		changeSA.dosearch();
		changeSA.returnData();
		changeSA.closeWindow();
		
		
	}
}