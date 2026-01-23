@isTest
private class SchedulePRStatusAbandon_UT {
	static testMethod void SchedulePRStatusAbandonMethod() {
		SchedulePRStatusAbandon sch1 = new SchedulePRStatusAbandon();
		String sch = '0 0 23 * * ? ';
		system.schedule('Merge Job',sch, sch1);
	
	}

}