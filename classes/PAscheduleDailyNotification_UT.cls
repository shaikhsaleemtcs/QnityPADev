@isTest
private class PAscheduleDailyNotification_UT
{
	static testMethod void pascheduleDailyNotificationMethod() 
	{   
		/*
		BatchDailyNotifications sd=new BatchDailyNotifications();
		database.executebatch(sd, 8);*/
		PAscheduleDailyNotification m = new PAscheduleDailyNotification();
		String sch = '0 24 15 * * ? ';
		system.schedule('Merge Job',sch, m);
		
	   
	} 
	
}