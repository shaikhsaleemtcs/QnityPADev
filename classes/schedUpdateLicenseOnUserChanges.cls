/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  Schedulable class for batchUpdateLicenseOnUserChanges
********************************************************************************/
global class  schedUpdateLicenseOnUserChanges implements Schedulable {
	
	global void execute(SchedulableContext SC) {
        //if (!utilSchedule.isApexScheduleDisabled){
            Database.executeBatch(new batchUpdateLicenseOnUserChanges(),20);
       // }
        	
    }
 	
}