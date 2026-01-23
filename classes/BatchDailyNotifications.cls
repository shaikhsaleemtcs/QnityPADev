/*
 * Name      :   PAscheduleDailyNotification
 * Description  :   This class will create the batch to send the daily notification to the Approvers.
 * Author      :   Infosys Limited
 * Created Date :   Utkarsh
 *
 * Version    Modified Date    Modified By   Modification
 *  1.1       26-02-2013         sanjib
    1.2        2-3-2013        sanjib
    1.3        20-Oct-2016    Shyam Bansal     IS ID-00075995
 * ------------------------------------------------------------- 
 */
global class BatchDailyNotifications implements Database.Batchable<sObject>
{
    public boolean runTestMethod=false;
    public List<User> approverUserList = new List<User>();    
    global Database.QueryLocator start(Database.BatchableContext BC)
    { 
        List<Id> allAssigneeIds = new List<Id>();
        set<Id> uniqueId = new set<Id>();
        List<User> userList = [SELECT id, email FROM User WHERE isactive = true]; 
        List<PermissionSetAssignment> psa = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId IN 
                                            (SELECT Id FROM PermissionSet WHERE Name =:PAProfilePermissions__c.getInstance('Approver').API_Name__c)]; 
        List<PermissionSetAssignment> permAss = [Select AssigneeId From PermissionSetAssignment where Id IN :psa AND AssigneeId IN:userList]; 
        for(PermissionSetAssignment per:permAss)
        {
            allAssigneeIds.add(per.assigneeId);
         }
        uniqueId.addAll(allAssigneeIds);
        string startQuery = 'SELECT id, email, E_Pass_Id__c, Name FROM User WHERE isactive = true AND Id IN :uniqueId order by FirstName';
        startQuery += this.runTestMethod ? ' LIMIT 1' : '';
        return Database.getQueryLocator(startQuery);    
     }  
     public String content; 
     global void execute(Database.BatchableContext BC, List<sObject> returnedUsersFromQuery)
    {
        //<NRD20150508> Add PR number issue
        List<Pricing_Request__c> pricingRequestList = [select Name,BU__c,Request_Approval_Status__c,Sold_To__c,current_approver__c,Pricing_Request_Type__c,Request_Name__c,CreatedBy.name from Pricing_Request__c where Request_Approval_Status__c='Submitted' order by current_approver__c];
        List<Pricing_Request__c> pricingRequestSpecifictoUser = new List<Pricing_Request__c>();
        approverUserList = returnedUsersFromQuery;
        system.debug('** pricingRequestList'+pricingRequestList);
        system.debug('** pricingRequestList size '+pricingRequestList.size());  
        List<Messaging.SingleEmailMessage> emailList  = new List<Messaging.SingleEmailMessage>();   
        for(User user : approverUserList)
        {
            pricingRequestSpecifictoUser.clear();
            for(Pricing_Request__c pr : pricingRequestList)
            { 
                system.debug('***PABusinessToNotify__c'+PABusinessToNotify__c.getInstance(pr.BU__c).Daily_Notification__c);
                system.debug('*** pr.Current_Approver__c'+pr.Current_Approver__c+'******user.Id'+user.Id);
                if(PABusinessToNotify__c.getInstance(pr.BU__c).Daily_Notification__c == true && pr.Current_Approver__c == user.Id) 
                {
                    pricingRequestSpecifictoUser.add(pr);
                }
            }   
            system.debug('***pricingRequestSpecifictoUser'+pricingRequestSpecifictoUser);
            system.debug('***pricingRequestSpecifictoUser size '+pricingRequestSpecifictoUser.size());
            String o='';
            //<NRD20150508> Add PR number issue
            content='<table border="2" >  <caption><H3>' +'</H3></caption>  <tr><th>Request Number</th><th>Request Type</th><th>Request Name</th><th>Customer</th><th>Created By</th></tr>';   
            for(Pricing_Request__c c:pricingRequestSpecifictoUser)
            {
                //<NRD20150508> Add PR number issue
                content+='<tr><td>'+c.Name+'</td><td>'+c.Pricing_Request_Type__c+'</td><td>'+c.Request_Name__c+'</td><td>'+c.Sold_To__c+'</td><td>'+c.CreatedBy.name+'</td></tr>';  
            
            }   
            content+='</table>';
            o+=content; 
            content=o;
            string url1 = URL.getSalesforceBaseUrl().toExternalForm();
            url1 = url1+'/apex/pahome';
            if(pricingRequestSpecifictoUser.size()>0)
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setBccSender(false);
                mail.setUseSignature(false);
                mail.setSaveAsActivity(false);
                system.debug('***Email Id'+user.email); 
                string [] toaddress= New string[]{user.email};
                mail.setSubject('SFDC PA Daily notification summary – Requests pending for your approval');
              //[SHYAMB10202016] - replaced with below line..  mail.setHtmlBody('Dear Approver,<br><br>Confidential<br><br>The following requests are assigned to you and awaiting your approval.<br>'+Content+'<br><br>Please log into Salesforce.com Price Approval to approve or reject these requests. <br><br>To view the details of the pricing requests click this link <br>'+url1+'<br><br>Thank you,<br>Salesforce.com');
                mail.setHtmlBody('Dear Approver,<br><br>Confidential<br><br>The following requests are assigned to you and awaiting your approval.<br>'+Content+'<br><br>Please log into Salesforce.com Price Approval to approve or reject these requests. <br><br>To view the details of the pricing requests click this link <br>'+url1+'<br><br><p style="color:red;">Please do not reply to this daily approval notification summary. Kindly login to the system to approve/reject the Price Requests.</p><br><br>Thank you,<br>Salesforce.com');
                mail.setToAddresses(toaddress);
                emailList.add(mail); 
            }
        }   
        Messaging.sendEmail(emailList);     
    }
    global void finish(Database.BatchableContext BC){}
}