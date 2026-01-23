/************************************************************************************************************
<NRD20150812>
 Created By    :   Neelesh Ratn Dwivedi
 Description   :   Scheduled class to abandon Pricing Requests which are pending in Draft, Recalled and Rejected status for 20 days.
***********************************************************************************************************************/

global class SchedulePRStatusAbandon implements Schedulable{
	global void execute(SchedulableContext SC) {
		batchClassForPRStatusAbandon sd=new batchClassForPRStatusAbandon();
		database.executebatch(sd, 200);
	}

    }