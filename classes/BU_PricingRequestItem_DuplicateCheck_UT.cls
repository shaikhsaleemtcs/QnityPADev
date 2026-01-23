/*
 * Name		 :   BU_PricingRequestItem_DuplicateCheck_UT
 * Description  :   This is the test class for BU_PricingRequestItem_DuplicateCheck
 * Author	   :   Infosys Limited
 * Created Date :   23-03-2013
 *
 * Version	  Modified Date	   Modified By	 Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class BU_PricingRequestItem_DuplicateCheck_UT
{
	static testMethod void BU_PricingRequestItem_DuplicateCheckTestMethod1()
	{
		try
		{
			Date d = Date.valueOf(System.NOW());
			//Inserting Pricing Requests
			List<Pricing_Request__c> pricingRequestList = new List<Pricing_Request__c>();
			Pricing_Request__c pricingReq1 = new Pricing_Request__c();
			pricingReq1.BU__c = 'BI EMEA Surfaces';
			pricingReq1.Sales_Org_Code__c = 'A640';
			pricingReq1.Dist_Channel_Code__c = '10';
			pricingReq1.Division_Code__c = '02';
			pricingReq1.Pricing_Request_Type__c = 'Permanent';
			pricingReq1.Request_Approval_Status__c = 'Draft';
			pricingReq1.Customer_Specific__c = true;
			pricingRequestList.add(pricingReq1);
			Pricing_Request__c pricingReq2 = new Pricing_Request__c();
			pricingReq2.BU__c = 'BI EMEA Surfaces';
			pricingReq2.Sales_Org_Code__c = 'A640';
			pricingReq2.Dist_Channel_Code__c = '10';
			pricingReq2.Division_Code__c = '02';
			pricingReq2.Pricing_Request_Type__c = 'Project Pricing';
			pricingReq2.Request_Approval_Status__c = 'Draft';
			pricingReq2.Customer_Specific__c = true;
			pricingRequestList.add(pricingReq2);
			insert pricingRequestList;

			//Inserting Pricing Request Items corresponding to the above request
			List<Pricing_Request_Item__c> pricingReqItemList = new List<Pricing_Request_Item__c>();
			Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
			priReqItem1.Sales_Org_Code__c = 'A640';
			priReqItem1.Dist_Channel_Code__c = '10';
			priReqItem1.Division_Code__c = '02';
			priReqItem1.Pricing_Request_Type__c = 'Permanent';
			priReqItem1.Approval_Status__c = 'Draft';
			priReqItem1.Customer_Specific__c = true;
			priReqItem1.Pricing_Request__c = pricingReq1.Id;
			priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
			priReqItem1.Key_Combination_Code__c = 'A580';
			priReqItem1.Material_Code__c = 'D123456';
			priReqItem1.Sold_To_Code__c = '5512342';
			priReqItem1.PH1_Code__c = 'A6';
			priReqItem1.New_Valid_From__c = d;
			priReqItem1.New_Valid_To__c = d+30;
			pricingReqItemList.add(priReqItem1);
			Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
			priReqItem2.Sales_Org_Code__c = 'A640';
			priReqItem2.Dist_Channel_Code__c = '10';
			priReqItem2.Division_Code__c = '02';
			priReqItem2.Pricing_Request_Type__c = 'Permanent';
			priReqItem2.Approval_Status__c = 'Draft';
			priReqItem2.Customer_Specific__c = true;
			priReqItem2.Pricing_Request__c = pricingReq1.Id;
			priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
			priReqItem2.Key_Combination_Code__c = 'A580';
			priReqItem2.Material_Code__c = 'D123456';
			priReqItem2.Sold_To_Code__c = '5512342';
			priReqItem2.PH1_Code__c = 'A6';
			priReqItem2.New_Valid_From__c = d+31;
			priReqItem2.New_Valid_To__c = d+60;
			pricingReqItemList.add(priReqItem2);
			insert pricingReqItemList;

			//Inserting Priicng Request Item which overlaps with the above Request Item
			Pricing_Request_Item__c priReqItem3 = new Pricing_Request_Item__c();
			priReqItem3.Sales_Org_Code__c = 'A640';
			priReqItem3.Dist_Channel_Code__c = '10';
			priReqItem3.Division_Code__c = '02';
			priReqItem3.Pricing_Request_Type__c = 'Permanent';
			priReqItem3.Approval_Status__c = 'Draft';
			priReqItem3.Customer_Specific__c = true;
			priReqItem3.Pricing_Request__c = pricingReq1.Id;
			priReqItem3.Pricing_Condition_Code__c = 'ZPSE';
			priReqItem3.Key_Combination_Code__c = 'A580';
			priReqItem3.Material_Code__c = 'D123456';
			priReqItem3.Sold_To_Code__c = '5512342';
			priReqItem3.PH1_Code__c = 'A6';
			priReqItem3.New_Valid_From__c = d+15;
			priReqItem3.New_Valid_To__c = d+30;
			priReqItem3.isNPCApplicable__c= true;
			priReqItem3.Net_Price_Status__c='Mat not found';
			insert priReqItem3;
			
			priReqItem3.Net_Price_Status__c='Waiting for Net Price';
			update priReqItem3;
			
			Pricing_Request_Item__c priReqItem4 = new Pricing_Request_Item__c();
			priReqItem4.Sales_Org_Code__c = 'A640';
			priReqItem4.Dist_Channel_Code__c = '10';
			priReqItem4.Division_Code__c = '02';
			priReqItem4.Pricing_Request_Type__c = 'Permanent';
			priReqItem4.Approval_Status__c = 'Draft';
			priReqItem4.Customer_Specific__c = true;
			priReqItem4.Pricing_Request__c = pricingReq1.Id;
			priReqItem4.Pricing_Condition_Code__c = 'ZPAE';
			priReqItem4.Key_Combination_Code__c = 'A580';
			priReqItem4.Sold_To_Code__c = '5512342';
			priReqItem4.New_Valid_From__c = d+15;
			priReqItem4.New_Valid_To__c = d+30;
			priReqItem4.isNPCApplicable__c= true;
			priReqItem4.Net_Price_Status__c='Mat not found';
			insert priReqItem4;
			
			priReqItem4.Net_Price_Status__c='Waiting for Net Price';
			update priReqItem4;
			
			priReqItem2.isNPCApplicable__c= true;
			priReqItem2.Net_Price_Status__c='Net Price Received';
			priReqItem2.Approval_Status__c='Submitted';
			update priReqItem2;
			
			priReqItem2.Approval_Status__c='Recalled';
			update priReqItem2;
			
			priReqItem2.Approval_Status__c='Recalled';
			update priReqItem2;
			
			priReqItem2.Approval_Status__c='Rejected';
			update priReqItem2;
			
			priReqItem2.Approval_Status__c='Rejected';
			update priReqItem2;
			
			Pricing_Request_Item__c priReqItem5 = new Pricing_Request_Item__c();
			priReqItem5.Sales_Org_Code__c = 'A640';
			priReqItem5.Dist_Channel_Code__c = '10';
			priReqItem5.Division_Code__c = '02';
			priReqItem5.Pricing_Request_Type__c = 'Permanent';
			priReqItem5.Approval_Status__c = 'Draft';
			priReqItem5.Customer_Specific__c = true;
			priReqItem5.Pricing_Request__c = pricingReq1.Id;
			priReqItem5.Pricing_Condition_Code__c = 'ZPAE';
			priReqItem5.Key_Combination_Code__c = 'A580';
			priReqItem5.Sold_To_Code__c = '5512342';
			priReqItem5.New_Valid_From__c = d+15;
			priReqItem5.New_Valid_To__c = d+30;
			insert priReqItem5;
			
		}
		catch(Exception e)
		{

		}		
	}
	static testMethod void BU_PricingRequestItem_DuplicateCheckTestMethod2()
	{
		try
		{
			Date d = Date.valueOf(System.NOW());			
			//Inserting Pricing Requests
			Pricing_Request__c pricingReq1 = new Pricing_Request__c();
			pricingReq1.BU__c = 'BI EMEA Surfaces';
			pricingReq1.Sales_Org_Code__c = 'A640';
			pricingReq1.Dist_Channel_Code__c = '10';
			pricingReq1.Division_Code__c = '02';
			pricingReq1.Pricing_Request_Type__c = 'Project Pricing';
			pricingReq1.Request_Approval_Status__c = 'Draft';
			pricingReq1.Customer_Specific__c = true;
			insert pricingReq1;

			//Inserting Pricing Request Items corresponding to the above request
			Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
			priReqItem1.Sales_Org_Code__c = 'A640';
			priReqItem1.Dist_Channel_Code__c = '10';
			priReqItem1.Division_Code__c = '02';
			priReqItem1.Pricing_Request_Type__c = 'Project';
			priReqItem1.Approval_Status__c = 'Draft';
			priReqItem1.Customer_Specific__c = false;
			priReqItem1.Pricing_Request__c = pricingReq1.Id;
			priReqItem1.Pricing_Condition_Code__c = 'ZD91';
			priReqItem1.Key_Combination_Code__c = 'A619';
			priReqItem1.Material_Code__c = 'D123456';
			priReqItem1.New_Valid_From__c = d;
			priReqItem1.New_Valid_To__c = d+30;
			insert priReqItem1;

			//Inserting Priicng Request Item which overlaps with the above Request Item
			Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
			priReqItem2.Sales_Org_Code__c = 'A640';
			priReqItem2.Dist_Channel_Code__c = '10';
			priReqItem2.Division_Code__c = '02';
			priReqItem2.Pricing_Request_Type__c = 'Project';
			priReqItem2.Approval_Status__c = 'Draft';
			priReqItem2.Customer_Specific__c = false;
			priReqItem2.Pricing_Request__c = pricingReq1.Id;
			priReqItem2.Pricing_Condition_Code__c = 'ZD91';
			priReqItem2.Key_Combination_Code__c = 'A619';
			priReqItem2.Material_Code__c = 'D123456';
			priReqItem2.New_Valid_From__c = d;
			priReqItem2.New_Valid_To__c = d+30;
			insert priReqItem2;
			
			priReqItem2.Net_Price_Status__c='Waiting for Net';
			update priReqItem2;
		}
		catch(Exception e)
		{

		}
	}
    
    static testMethod void BU_PricingRequestItem_DuplicateCheckTestMethod3()
	{
        try{
        Date d = Date.valueOf(System.NOW());
			//Inserting Pricing Requests
			
			Pricing_Request__c pricingReq1 = new Pricing_Request__c();
			pricingReq1.BU__c = 'BI EMEA Surfaces';
			pricingReq1.Sales_Org_Code__c = 'A640';
			pricingReq1.Dist_Channel_Code__c = '10';
			pricingReq1.Division_Code__c = '02';
			pricingReq1.Pricing_Request_Type__c = 'Permanent';
			pricingReq1.Request_Approval_Status__c = 'Draft';
			pricingReq1.Customer_Specific__c = true;
			insert pricingReq1;
			
        
        	Pricing_Request_Item__c priReqItem1 = new Pricing_Request_Item__c();
			priReqItem1.Sales_Org_Code__c = 'A640';
			priReqItem1.Dist_Channel_Code__c = '10';
			priReqItem1.Division_Code__c = '02';
			priReqItem1.Pricing_Request_Type__c = 'Permanent';
			priReqItem1.Approval_Status__c = 'Draft';
			priReqItem1.Customer_Specific__c = true;
			priReqItem1.Pricing_Request__c = pricingReq1.Id;
			priReqItem1.Pricing_Condition_Code__c = 'ZPSE';
			priReqItem1.Key_Combination_Code__c = 'A580';
			priReqItem1.Material_Code__c = 'D123456';
			priReqItem1.Sold_To_Code__c = '5512342';
			priReqItem1.PH1_Code__c = 'A6';
			priReqItem1.New_Valid_From__c = d+1;
			priReqItem1.New_Valid_To__c = d+10;
        	priReqItem1.New_Rate__c = '10';
			insert priReqItem1;
        
        	Pricing_Request__c pricingReq2 = new Pricing_Request__c();
			pricingReq2.BU__c = 'BI EMEA Surfaces';
			pricingReq2.Sales_Org_Code__c = 'A640';
			pricingReq2.Dist_Channel_Code__c = '10';
			pricingReq2.Division_Code__c = '02';
			pricingReq2.Pricing_Request_Type__c = 'Permanent';
			pricingReq2.Request_Approval_Status__c = 'Draft';
			pricingReq2.Customer_Specific__c = true;
			insert pricingReq2;
        
        	Pricing_Request_Item__c priReqItem2 = new Pricing_Request_Item__c();
			priReqItem2.Sales_Org_Code__c = 'A640';
			priReqItem2.Dist_Channel_Code__c = '10';
			priReqItem2.Division_Code__c = '02';
			priReqItem2.Pricing_Request_Type__c = 'Permanent';
			priReqItem2.Approval_Status__c = 'Draft';
			priReqItem2.Customer_Specific__c = true;
			priReqItem2.Pricing_Request__c = pricingReq2.Id;
			priReqItem2.Pricing_Condition_Code__c = 'ZPSE';
			priReqItem2.Key_Combination_Code__c = 'A580';
			priReqItem2.Material_Code__c = 'D123456';
			priReqItem2.Sold_To_Code__c = '5512342';
			priReqItem2.PH1_Code__c = 'A6';
			priReqItem2.New_Valid_From__c = d+2;
			priReqItem2.New_Valid_To__c = d+10;
        	priReqItem2.New_Rate__c = '10';
            insert priReqItem2;
        }
        catch(Exception e){
            
        }
    }
}