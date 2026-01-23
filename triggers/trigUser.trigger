/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  This trigger updates the license consumed for license object record when user record is updated

Caveates:
Need batch to reverify permission set license assignement as its a separate table and the trigger is currently not available on the object 
permission set license assignment

********************************************************************************/
trigger trigUser on User (after insert, after update) {
   // if(ctrlUpdateLicensesOnUserChange.runOnce()){
        if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){// Call User Handler After Insert or After Update        
            UserHandler uhObj = new UserHandler();
            uhObj.onTrigger();
        }
   // }
}