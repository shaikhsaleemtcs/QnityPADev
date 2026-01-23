/*   Ver.                       Developer                           Changes                                Dependencies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.1                         Prachi                  Send email on task completion(change requirement)       None
//  1.2                         sanjib,anand           send email on task for project
/**************************************************************************************************************
 ***********************************************Modification Log************************************************

<KS20160420>
Last Modified By    :   Kunal Sharma
Last Modified Date  :   20 April 2016
Description         :   On completion of Pricing Task for BU DPP Polymers EMEA an e-mail notification will fire to the creator of the task
 *****************************************************************************************************************/
 
trigger EmailNotificationOnTaskComplete on Task (after update) {
 List<Id>   projectIds = new List<Id>();
 //Ver 1.1
 List<Id>   pricingrequestIds = new List<Id>();
    for(Task task : Trigger.new)
    {
        //Ver 1.1 Added for Pricing Task
        if(Pricing_Request__c.getSObjectType() == task.WhatId.getSObjectType())
        {
            if(task.status == 'Completed'){
                pricingrequestIds.add(task.WhatId);
            }
        }
        //send mail for CSR for notifying to close Project
        if(Project_Price__c.getSObjectType()==task.WhatId.getSObjectType())
        {
            // If task completed                                 
            if(task.status == 'Completed'){
                projectIds.add(task.WhatId);
            }                               
        }
    }
    //Ver 1.1
    if(pricingrequestIds.size()>0)
    {
        List<Pricing_Request__c> pricingRequestList = [SELECT Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                                          State_Province__c,Spot_Type__c, Sold_To__c,SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                                          SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                                          Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                                          Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                                          LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                                          Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                                          CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c,Assigned_To__r.name,Assigned_To__r.E_Pass_Id__c, Approver5__c, Approver5_Date__c,
                                                          Approver4__c, Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                                                          Approver1_Date__c, Request_Id__c,Last_Modified_by__c,Incoterms_Code__c,created_by__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                                                          Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Project_Header_Approval_Flag__c,
                                                          ComPartner__c,ComPartner_Code__c 
                                                          FROM Pricing_Request__c WHERE  Id IN : pricingrequestIds];                                                  
        //Changes made by Kunal Sharma(752081) IS ID-0067011 START
        List<Business_Region__c> listregion = Business_Region__c.getall().values();
        for(Pricing_Request__c priceReq : pricingRequestList)
        {
            list<String> toAddress= new List<String>();
            USER u =[SELECT email FROM USER WHERE id=:priceReq.ownerId];
            toAddress.add(u.Email);
            Id templateId=[ select id from EmailTemplate where folder.Name='Price Approval Email Templates' and name='Notification for task complete'].id;
            boolean textField = false;
            string targetId;
            string whatId = priceReq.Id;
            if(listregion !=null && listregion.size()>0)
            {
                for (Business_Region__c region : listregion)
                {    
                    if(region.BU_Name__c == priceReq.BU__c)
                    {
                        textField = true;
                    }
                }
            }
                 if(textField == true)
                    {
                         targetId = priceReq.CreatedById;
                    }
                    else
                    {
                         targetId = priceReq.ownerId;
                    }
             //Changes made by Kunal Sharma(752081) IS ID-0067011 END  
            try
            {
                PAUtil.sendEmailMethod(templateId, toAddress,whatId ,targetId);
            }
            catch(exception e)
            {
            }
        }
    }
    if(projectIds.size()>0)
    {    
         list<Project_Price__c> projectObjList =[SELECT ownerId,Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                                            Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,status__c 
                                            FROM Project_Price__c WHERE Id In :projectIds];
        for(Project_Price__c projectObj :projectObjList)
        {
            if(projectObj.Valid_To__c>System.today())
            {
                //to be uncomtdd
                list<String> toAddress= new List<String>();
                USER u =[SELECT email FROM USER WHERE id=:projectObj.ownerId];
                toAddress.add(u.Email);
                Id templateId=[ select id from EmailTemplate where folder.Name='Price Approval Email Templates' and name='Project Task Notification'].id;
                string targetId=projectObj.ownerId;
                string whatId=projectObj.Id;
                //send email 
                try
                {
                    PAUtil.sendEmailMethod(templateId, toAddress,whatId ,targetId);
                    //to be commnted
                }
                catch(exception e)
                {   
                }
            } 
        }
    }
}