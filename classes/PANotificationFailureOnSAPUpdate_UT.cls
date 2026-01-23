@isTest
public class PANotificationFailureOnSAPUpdate_UT {
	
	
	static testmethod void insertPostingStatus()
	{
		ERP_Sales_Prices_SAP__C price = new ERP_Sales_Prices_SAP__C();
		price.CurrencyIsoCode = 'USD';
		insert price;
	
		Outbond_Notifier__c notifier = new Outbond_Notifier__c();
		notifier.Object_ID__c = price.id;
		notifier.Object_Type__c='ERP_Sales_Prices_SAP__C';
		insert notifier;
		
		Price_Posting_Status__c post = new Price_Posting_Status__c();
		post.Price_Record__c = price.id;
		post.ERP_Sales_Price_SAP__c=price.id;
		post.status__C='52';
		insert post;
		
		Price_Posting_Status__c post2 = new Price_Posting_Status__c();
		post2.Price_Record__c = price.id;
		post2.ERP_Sales_Price_SAP__c=price.id;
		post2.status__C='54';
		insert post2;
	}

}