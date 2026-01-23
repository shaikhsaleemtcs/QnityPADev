/*
 * Name		 :   PAscheduleDailyNotification
 * Description  :   This class will schedule the daily batch to send the daily notification to the Approvers.
 * Author	   :   Infosys Limited
 * Created Date :   Utkarsh
 *
 * Version	  Modified Date	   Modified By	 Modification
 *  1.0			15-02-2013   		 Utkarsh		 Created
 * -------------------------------------------------------------
 */
global class PAscheduleDailyNotification implements Schedulable{
	global void execute(SchedulableContext SC) {
		BatchDailyNotifications sd=new BatchDailyNotifications();
		database.executebatch(sd, 8);
	}
}