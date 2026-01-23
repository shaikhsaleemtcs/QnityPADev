/************************************************************************************************************
<HL20140902>
 Created By    :   Hema latha
 Description   :   To identify the Pricing Requests pending in Draft Recalled and Rejected status for 20 days.
***********************************************************************************************************************/
global class  batchClassForPRStatusAbandon implements Database.Batchable<sObject>{

    
    public Date vt=System.today();
    public string startQuery = 'SELect id,Request_Approval_Status__c FROM Pricing_Request__c WHERE (Request_Approval_Status__c=\'Draft\' or Request_Approval_Status__c=\'Rejected\' or Request_Approval_Status__c=\'Recalled\')  and Last_Modified_By__c<LAST_N_DAYS:60';
    global Database.QueryLocator start(Database.BatchableContext BC)
    { 
        return Database.getQueryLocator(startQuery);    
    }
    global void execute(Database.BatchableContext BC, List<sObject> sList)
    {
        List<Pricing_Request__c> tempList = new List<Pricing_Request__c>();
        List<Pricing_Request__c> prList=(List<Pricing_Request__c>)sList; 
        
        if(prList.size()>0)
        {
          for(Pricing_Request__c h:prList)
          {
           
            h.Request_Approval_Status__c='Abandoned';
            tempList.add(h);
          }
          update tempList;
        }
    }
    global void finish(Database.BatchableContext BC)
    {
    } 

}