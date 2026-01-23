/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  General controller for User Object
********************************************************************************/
public class UserHandler extends TriggerHandlerBase{
    
    public override void bulkafter() {  
        if (Trigger.isInsert || Trigger.isUpdate){ //If Insert or Update operation is performed
            ctrlUpdateLicensesOnUserChange.userRecordChanged(trigger.old,trigger.new,Trigger.isInsert,Trigger.isUpdate);                      
        }                    
    }
}