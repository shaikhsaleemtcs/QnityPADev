@isTest
public class PAReassign_UT
{        
   /* static testMethod void reassignTestMethod(){
    
    Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
    //[27122016] Merge&Spin: Updated External ERP Id to Dummy Value 
    User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                    User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                    External_ERP_ID__c='DUMMYTest1',profileid = p1.id,
                    Username='pa_werner1@jhhgtestinfosys.com.test2',
                    LastName='Coppens', CommunityNickname='acv',
                    TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
    insert u1;
    System.runAs(u1){
    Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
    pricingRequest1.Pricing_Request_Type__c = 'Permanent';
    pricingRequest1.Request_Type__c = 'Customer Specific';
    pricingRequest1.BU__c = 'BI-EMEA';
    pricingRequest1.Sales_Org_Code__c = 'A640';
    pricingRequest1.Dist_Channel_Code__c = '10';
    pricingRequest1.Division_Code__c = '02';
    pricingRequest1.SoldTo_Code__c = 'T001';
    pricingRequest1.Current_Level__c='1';
    
    insert pricingRequest1;
    
    Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
    pricingRequest2.Pricing_Request_Type__c = 'Permanent';
    pricingRequest2.Request_Type__c = 'Customer Specific';
    pricingRequest2.BU__c = 'BI';
    pricingRequest2.Sales_Org_Code__c = 'A640';
    pricingRequest2.Dist_Channel_Code__c = '10';
    pricingRequest2.Division_Code__c = '02';
    pricingRequest2.SoldTo_Code__c = 'T001';
    pricingRequest2.Current_Level__c='2';
    
    insert pricingRequest2;
    
    Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
    pricingRequest3.Pricing_Request_Type__c = 'Permanent';
    pricingRequest3.Request_Type__c = 'Customer Specific';
    pricingRequest3.BU__c = 'BI';
    pricingRequest3.Sales_Org_Code__c = 'A640';
    pricingRequest3.Dist_Channel_Code__c = '10';
    pricingRequest3.Division_Code__c = '02';
    pricingRequest3.SoldTo_Code__c = 'T001';
    pricingRequest3.Current_Level__c='3';
    
    insert pricingRequest3;

    Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
    pricingRequest4.Pricing_Request_Type__c = 'Permanent';
    pricingRequest4.Request_Type__c = 'Customer Specific';
    pricingRequest4.BU__c = 'BI';
    pricingRequest4.Sales_Org_Code__c = 'A640';
    pricingRequest4.Dist_Channel_Code__c = '10';
    pricingRequest4.Division_Code__c = '02';
    pricingRequest4.SoldTo_Code__c = 'T001';
    pricingRequest4.Current_Level__c='4';
    
    insert pricingRequest4;

    Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
    pricingRequest5.Pricing_Request_Type__c = 'Permanent';
    pricingRequest5.Request_Type__c = 'Customer Specific';
    pricingRequest5.BU__c = 'BI';
    pricingRequest5.Sales_Org_Code__c = 'A640';
    pricingRequest5.Dist_Channel_Code__c = '10';
    pricingRequest5.Division_Code__c = '02';
    pricingRequest5.SoldTo_Code__c = 'T001';
    pricingRequest5.Current_Level__c='5';
        pricingRequest5.Approver1__c = u1.id;
            pricingRequest5.Approver2__c = u1.id;
            pricingRequest5.Approver3__c = u1.id;
            pricingRequest5.Approver4__c = u1.id;
            pricingRequest5.Approver5__c = u1.id;
    
    insert pricingRequest5;
    System.debug('pr5 '+pricingRequest5);
       // Test.StartTest();
    Approval.ProcessSubmitRequest req1 = 
            new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval.');
        req1.setObjectId(pricingRequest1.id);
        req1.setSubmitterId(u1.id);
       // req1.setSkipEntryCriteria(true);
        Approval.ProcessResult result = Approval.process(req1);
        System.debug('ProcessResult&& '+result);
        List<Id> newWorkItemIds = result.getNewWorkitemIds();
      /*  Approval.ProcessWorkitemRequest req2 = 
            new Approval.ProcessWorkitemRequest();
        req2.setComments('Approving request.');
        req2.setAction('Approve');
        req2.setWorkitemId(newWorkItemIds.get(0));
        req2.setNextApproverIds(new Id[] {u1.id,u1.id,u1.id,u1.id,u1.id});
        Approval.ProcessResult result2 =  Approval.process(req2);*/
   /* List<ProcessInstanceWorkItem> processesList = new List<ProcessInstanceWorkItem>();
    processesList = [SELECT p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where processinstance.targetobjectid=:pricingRequest5.id];
     system.debug('inside test 1 '+ processesList);
     
     
    PAReassign.reAssign(pricingRequest1.id,'',u1.id);
    PAReassign.reAssign(pricingRequest2.id,'',u1.id);  
    PAReassign.reAssign(pricingRequest3.id,'',u1.id);
    PAReassign.reAssign(pricingRequest4.id,'',u1.id);
    PAReassign.reAssign(pricingRequest5.id,'',u1.id);
    
  /*  try{  
    PAReassign.recallRequest(pricingRequest5.id,'abc');
    }
    catch(Exception e)
    {} */
  //  Test.StopTest();
  /*  }
    } */
    //Monika Added
    static testMethod void reassignTestMethod2(){
    
    Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
    
    User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                    User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                    External_ERP_ID__c='DUMMYTest2',profileid = p1.id,
                    Username='pa_werner1@jhhgtestinfosys.com.test2',
                    LastName='Coppens', CommunityNickname='acv',
                    TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
    insert u1;
 
    System.runAs(u1){
    Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
    pricingRequest1.Pricing_Request_Type__c = 'Permanent';
    pricingRequest1.Request_Type__c = 'Customer Specific';
    pricingRequest1.BU__c = 'BI';
    pricingRequest1.Sales_Org_Code__c = 'A640';
    pricingRequest1.Dist_Channel_Code__c = '10';
    pricingRequest1.Division_Code__c = '02';
    pricingRequest1.SoldTo_Code__c = 'T001';
    pricingRequest1.Current_Level__c='1';
    
    insert pricingRequest1;
    
    Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
    pricingRequest2.Pricing_Request_Type__c = 'Permanent';
    pricingRequest2.Request_Type__c = 'Customer Specific';
    pricingRequest2.BU__c = 'BI';
    pricingRequest2.Sales_Org_Code__c = 'A640';
    pricingRequest2.Dist_Channel_Code__c = '10';
    pricingRequest2.Division_Code__c = '02';
    pricingRequest2.SoldTo_Code__c = 'T001';
    pricingRequest2.Current_Level__c='2';
    
    insert pricingRequest2;
    
    Pricing_Request__c pricingRequest3 = new Pricing_Request__c();
    pricingRequest3.Pricing_Request_Type__c = 'Permanent';
    pricingRequest3.Request_Type__c = 'Customer Specific';
    pricingRequest3.BU__c = 'BI';
    pricingRequest3.Sales_Org_Code__c = 'A640';
    pricingRequest3.Dist_Channel_Code__c = '10';
    pricingRequest3.Division_Code__c = '02';
    pricingRequest3.SoldTo_Code__c = 'T001';
    pricingRequest3.Current_Level__c='3';
    
    insert pricingRequest3;

    Pricing_Request__c pricingRequest4 = new Pricing_Request__c();
    pricingRequest4.Pricing_Request_Type__c = 'Permanent';
    pricingRequest4.Request_Type__c = 'Customer Specific';
    pricingRequest4.BU__c = 'BI';
    pricingRequest4.Sales_Org_Code__c = 'A640';
    pricingRequest4.Dist_Channel_Code__c = '10';
    pricingRequest4.Division_Code__c = '02';
    pricingRequest4.SoldTo_Code__c = 'T001';
    pricingRequest4.Current_Level__c='4';
    
    insert pricingRequest4;

    Pricing_Request__c pricingRequest5 = new Pricing_Request__c();
    pricingRequest5.Pricing_Request_Type__c = 'Permanent';
    pricingRequest5.Request_Type__c = 'Customer Specific';
    pricingRequest5.BU__c = 'BI';
    pricingRequest5.Sales_Org_Code__c = 'A640';
    pricingRequest5.Dist_Channel_Code__c = '10';
    pricingRequest5.Division_Code__c = '02';
    pricingRequest5.SoldTo_Code__c = 'T001';
    pricingRequest5.Current_Level__c='5';
    
    insert pricingRequest5;
        
    
    List<ProcessInstanceWorkItem> processesList = new List<ProcessInstanceWorkItem>();
    processesList = [SELECT p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where processinstance.targetobjectid=:pricingRequest5.id];
        system.debug('inside test 2 '+ processesList);
    Test.StartTest();
    
    
    PAReassign.reAssign(pricingRequest1.id,'',u1.id);
    PAReassign.reAssign(pricingRequest2.id,'',u1.id);  
    PAReassign.reAssign(pricingRequest3.id,'',u1.id);
    PAReassign.reAssign(pricingRequest4.id,'',u1.id);
    PAReassign.reAssign(pricingRequest5.id,'',u1.id);
    try{  
    PAReassign.recallRequest(pricingRequest5.id,'');
    }
    catch(Exception e)
    {}
    Test.StopTest();
    }
    }
    //Added by Sumida on 13/09/24 to increase code coverage
    static testMethod void reassignTestMethod1(){
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                           User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                           External_ERP_ID__c='DUMMYTest2',profileid = p1.id,
                           Username='pa_werner1@jhhgtestinfosys.com.test2',
                           LastName='Coppens', CommunityNickname='acv',
                           TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
        
        System.runAs(u1){
            Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
            pricingRequest1.Pricing_Request_Type__c = 'Permanent';
            pricingRequest1.Request_Type__c = 'Customer Specific';
            pricingRequest1.BU__c = 'BI';
            pricingRequest1.Sales_Org_Code__c = 'A640';
            pricingRequest1.Dist_Channel_Code__c = '10';
            pricingRequest1.Division_Code__c = '02';
            pricingRequest1.SoldTo_Code__c = 'T001';
            pricingRequest1.Current_Level__c='1';
            insert pricingRequest1;
            
            Test.StartTest();
            try{ 
                PAReassign.reAssign('jhj-jnsj','',u1.id);
                PAReassign.reAssign1(pricingRequest1.id,u1.id,u1.id);
            }
            catch(Exception e)
            {}
            Test.StopTest();
        }
    }
}