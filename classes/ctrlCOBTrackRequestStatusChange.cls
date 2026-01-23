/*******************************************************************************
Copyright © 2014 DuPont. All rights reserved. 
Author: Ankur Madaan
Email: Ankur_Madaan@infosys.com
Description:  Class of Trigger on Customer Data Request Object which will call Class Instances Which calculate time in each stage..
 ********************************************************************************/ 
public without sharing class ctrlCOBTrackRequestStatusChange extends TriggerHandlerBase {

    list <Customer_Data_Request__c> customertoinsert = new List <Customer_Data_Request__c> ();
    public static boolean run = true; 
    public static integer count = 0;

    /**
     * Name: runOnce
     * Params: None
     * Description: Method to make sure the after update trigger is executed only once.  
     */
    public boolean runOnce(){
        if(run){
            run=false;
            return true;
        }else{
            return run;
        }
    }

    /**
     * Name: bulkAfter
     * Params: lst_dataReqnew
            : lst_dataReqold
     * Description: Method will be called from Trigger when the Tansaction Bulk and After for calculating th etime spent by request in each stage.  
     */
    public void bulkAfter(list<Customer_Data_Request__c> lst_dataReqnew,list<Customer_Data_Request__c> lst_dataReqold)  { 

        if(Trigger.isInsert){
            if(runOnce() && lst_dataReqnew.size()>0){
                DateTime createDate;
                customertoinsert.clear();          
                System.debug('Executing The After insert Trigger to update the time for Request Status change');
                List <Customer_Data_Request__c> custdatareq = new List <Customer_Data_Request__c>();
                custdatareq = getRequestInformation(lst_dataReqnew); 

                for (Customer_Data_Request__c cdrnew: custdatareq){
                    String CreatedModified = cdrnew.CreateModifySync__c;
                    if(cdrnew.Request_Status__c =='Draft/Data Gathering'){
                        if (CreatedModified != null){
                            createDate = DateTime.valueOf(CreatedModified);
                            if(cdrnew.Data_Draft_Gathering_Time__c !=null)
                                cdrnew.Data_Draft_Gathering_Time__c +=calculateTime(system.Now(),createDate);
                            if(cdrnew.Request_Status__c =='Awaiting Destination Credit Approval'){
                                cdrnew.DCA_Approval_Time__c +=calculateTime(system.Now(),createDate);        
                            }else if(cdrnew.Request_Status__c =='Awaiting Credit Approval'){
                                cdrnew.Credit_Approval_Time__c +=calculateTime(system.Now(),createDate);       
                            }else if(cdrnew.Request_Status__c =='Awaiting Data Analyst (DMS Team) Approval'){
                                cdrnew.DMS_Approval_Time__c +=calculateTime(system.Now(),createDate);       
                            }else if(cdrnew.Request_Status__c =='Awaiting DOA approval'){
                                cdrnew.Escalated_Approval_Time__c +=calculateTime(system.Now(),createDate); 
                            }
                        }

                        if (cdrnew.Escalated_Approval_Time__c == null)
                            cdrnew.Escalated_Approval_Time__c=0.0000;

                        cdrnew.Total_Completion_Time__c =cdrnew.Data_Draft_Gathering_Time__c+cdrnew.DMS_Approval_Time__c+cdrnew.Credit_Approval_Time__c+cdrnew.DCA_Approval_Time__c+cdrnew.Escalated_Approval_Time__c;
                        customertoinsert.add(cdrnew);
                    }   
                }
                update customertoinsert;
            }
        }
        if(Trigger.isUpdate){
            if(runOnce() ){
                System.debug('Executing The After Update Trigger for Time Calculation');
                List <Customer_Data_Request__c> custdatareq = new List <Customer_Data_Request__c>();
                custdatareq = getRequestInformation(lst_dataReqnew);  
                for (Customer_Data_Request__c cdrnew: custdatareq){
                    System.debug('1--'+cdrnew.Request_Status__c);
                    for(Customer_Data_Request__c cdrold :lst_dataReqold){
                        if(cdrOld.id == cdrnew.Id){

                            if((cdrold.Request_Status__c  != cdrnew.Request_Status__c) && cdrold.Last_Modified_Time__c !=null ){
                                if(cdrold.Request_Status__c =='Awaiting Destination Credit Approval'){
                                    cdrnew.DCA_Approval_Time__c +=calculateTime(cdrnew.Last_Modified_Time__c,cdrold.Last_Modified_Time__c);
                                }else if(cdrold.Request_Status__c =='Awaiting Credit Approval'){
                                    cdrnew.Credit_Approval_Time__c +=calculateTime(cdrnew.Last_Modified_Time__c,cdrold.Last_Modified_Time__c);       
                                }else if(cdrold.Request_Status__c =='Awaiting Data Analyst (DMS Team) Approval'){
                                    cdrnew.DMS_Approval_Time__c +=calculateTime(cdrnew.Last_Modified_Time__c,cdrold.Last_Modified_Time__c);       
                                }else if(cdrold.Request_Status__c =='Request Sent for Re-Work'){
                                    cdrnew.DMS_Approval_Time__c +=calculateTime(cdrnew.Last_Modified_Time__c,cdrold.Last_Modified_Time__c);       
                                }else if(cdrold.Request_Status__c =='Draft/Data Gathering'){
                                    cdrnew.Data_Draft_Gathering_Time__c +=calculateTime(cdrnew.Last_Modified_Time__c,cdrold.Last_Modified_Time__c);       
                                }else if(cdrold.Request_Status__c =='Awaiting DOA approval'){
                                    cdrnew.Escalated_Approval_Time__c +=calculateTime(cdrnew.Last_Modified_Time__c,cdrold.Last_Modified_Time__c);
                                }

                                if (cdrnew.Escalated_Approval_Time__c == null)
                                    cdrnew.Escalated_Approval_Time__c=0.0000;

                                cdrnew.Total_Completion_Time__c =cdrnew.Data_Draft_Gathering_Time__c+cdrnew.DMS_Approval_Time__c+cdrnew.Credit_Approval_Time__c+cdrnew.DCA_Approval_Time__c+cdrnew.Escalated_Approval_Time__c;
                                customertoinsert.add(cdrnew);
                            }  
                        }   
                    }
                }
                if(customertoinsert.size()>0)
                    update custdatareq;
            }
        }



    }

    /*
     * Name: getRequestInformation
     * Params: 1. List<Customer_Data_Request__c>
     * Description: Method to fetch the list of Customer_Data_Request__c oldmap from db as the transaction has not commited.  
     */    

    public  list<Customer_Data_Request__c> getRequestInformation(list<Customer_Data_Request__c> dataReq){
        list<Customer_Data_Request__c> lst_req = new list<Customer_Data_Request__c>();
        for(Customer_Data_Request__c cusReq : dataReq){
            Customer_Data_Request__c req = new Customer_Data_Request__c();
            Map<String, Schema.SObjectField> fldObjMap = schema.SObjectType.Customer_Data_Request__c.fields.getMap();
            String querySearch= '';
            String query;
            for(String s :fldObjMap.KeySet()){
                querySearch = querySearch + s + ',';
            }
            querySearch = querySearch.removeEnd(',');
            query = 'Select '+  querySearch + ',RecordType.Name,CreatedBy.Id from Customer_Data_Request__c where Id= \''+cusReq.Id+'\'';
            req=database.query(query);
            lst_req.add(req);
        }
        return lst_req; 
    }

    /*
     * Name: calculateTime
     * Params: (1. DateTime toDate, 2. DateTime fromDate)
     * Description: Method to calculate the time in days between the to and from date. 
     */ 
    public Decimal calculateTime(DateTime toDate, DateTime fromDate){
        DateTime currentDate = toDate;
        DateTime OldDate= fromdate;
        if(FromDate !=null){
            integer intDays =  fromDate.Date().daysBetween(currentDate.Date());

            Decimal decHours = ((currentDate.getTime())/1000/60) - ((OldDate.getTime())/1000/60); 
            Decimal daysTaken =   (decHours/60/24);  //Total Time in Hrs between Created date & time of status change            
            return daysTaken;           
        }
        else return null;
    }

}