/*
 * Name		 :   PAscheduleDailyNotification
 * Description  :   This class will schedule the daily batch to send the daily notification to the Approvers.
 * Author	   :   Infosys Limited
 * Created Date :   Anand Darshi
 *
 * Version	  Modified Date	   Modified By	 Modification
 *  1.0			15-02-2013   		 Utkarsh		 Created
 * -------------------------------------------------------------
 */
global class ScheduleDeletionOfAbandonedRequest implements Schedulable{
	global void execute(SchedulableContext SC) {
		/*batchDeletionOfAbandonedRequest sd=new batchDeletionOfAbandonedRequest();
		database.executebatch(sd, 200);*/
		ScheduleProjectStatusChange m = new ScheduleProjectStatusChange();
		String sch = '0 0 0 28 * ? ';
		system.schedule('Merge Job1',sch, m);
	}
}