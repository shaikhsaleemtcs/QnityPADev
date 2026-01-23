@isTest
private class ScheduleProjectStatusChange_UT
{
	static testMethod void ScheduleProjectStatusChangeMethod() 
	{   
		
		ScheduleProjectStatusChange m = new ScheduleProjectStatusChange();
		String sch = '0 24 15 * * ? ';
		system.schedule('Merge Job',sch, m);
	} 
	
}