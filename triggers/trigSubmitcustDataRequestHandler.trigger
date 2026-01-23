/*******************************************************************************
Copyright © 2014 DuPont. All rights reserved. 
Author: Ankur Madaan
Email: Ankur_Madaan@infosys.com
Description:  Trigger on Customer Data Request Object which will call Class Instances Which calculate time in each stage and submit the Request To Queue
 ********************************************************************************/ 
trigger trigSubmitcustDataRequestHandler on Customer_Data_Request__c (after insert,after update) 
{
     list<Customer_data_request__c> lst_dataReqold= new list<Customer_data_request__c>();
     list<Customer_data_request__c> lst_dataReqnew= new list<Customer_data_request__c>();
     //Instance of Track Time Class..
     ctrlCOBTrackRequestStatusChange InstanceTrackRequestStatusChange = new ctrlCOBTrackRequestStatusChange();
    
     if(Trigger.isUpdate && Trigger.isafter){
     boolean flag=false;
     for(Customer_data_request__c cdrreq :Trigger.new){
         Customer_data_request__c cdrOld = Trigger.oldMap.get(cdrReq.Id); 
         lst_dataReqold.add(cdrold);
         lst_dataReqnew.add(cdrreq);
         if(cdrreq.Request_Status__c != cdrOld.Request_Status__c )
         flag=true;    
     }

     if(flag==true)
      InstanceTrackRequestStatusChange.bulkAfter(lst_dataReqnew,lst_dataReqold);
     }
     
     
     if(Trigger.isInsert && Trigger.isafter){
         for(Customer_data_request__c cdrreq :Trigger.new){
             lst_dataReqnew.add(cdrreq);
         }
         InstanceTrackRequestStatusChange.bulkAfter(lst_dataReqnew,lst_dataReqold);
    
    }
    
    //SubmitcustDataRequestHandler SubmitcustDataRequestHandlerinstance = new SubmitcustDataRequestHandler(); 
    //SubmitcustDataRequestHandlerinstance.onTrigger();
    
    CtrlCOBUtilSubmitCDRHandler CtrlCOBUtilSubmitCDRHandlerinstance = new CtrlCOBUtilSubmitCDRHandler();
    CtrlCOBUtilSubmitCDRHandlerinstance.onTrigger();
    
    //TrackRequestStatusChange trackRequestStatusChangeInstance = new TrackRequestStatusChange ();
    //trackRequestStatusChangeInstance.onTrigger();  
    
   
}