/*****************************************************************************
Author: Rohit saini
Email: rohitkumar.saini@tcs.com
Date: 1/22/2016
Description: class to monitor job failures, to create batch monitor object record and mail for any failures.
@version  1.0

<VL20160920>
Last Modified By    :   Vijay Laxmi
Last Modified Date  :   20 Sep 2016
Description         :   Adding a field name (SFDC_Instance__c) to batch monitor object 
********************************************************************************/


global class batch_jobMonitoring implements Schedulable, Database.Batchable<sObject> {
    public static final Integer batchJobSize=1;
    
   //<Start> <VL20160920>
    public static final string sfdcInstance='DuPont Utility';
   //<End> 
    public static final Id systemAdminId=[select id, name from user where name ='BatchSFDC DeployUser' limit 1].id;
    global void execute(SchedulableContext SC) {
          Id batchJobId = Database.executeBatch(new batch_jobMonitoring(), batchJobSize);
        }
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        DateTime lastRun=system.now()-7;
        List<Batch_Monitor__c> lstExistingbatchMonitor= [select id, name, createdDate from Batch_Monitor__c order by createdDate desc];
        if(lstExistingbatchMonitor!=null && lstExistingbatchMonitor.size()>0){
            lastRun=lstExistingbatchMonitor.get(0).createdDate;
        }
        //system.debug('lastRun::'+lastRun);
        String queryString='select id, TotalJobItems, status, NumberOfErrors, MethodName, JobType, JobItemsProcessed, ExtendedStatus, CompletedDate,'+
            'ApexClassID,ApexClass.Name from asyncApexjob where (status=\'failed\' or ExtendedStatus!=null or NumberOfErrors>0 ) and CompletedDate > :lastRun and JobType in (\'BatchApex\', \'ScheduledApex\')';
        if(Test.isrunningTest()){
           queryString='select id, TotalJobItems, status, NumberOfErrors, MethodName, JobType, JobItemsProcessed, ExtendedStatus, CompletedDate,'+
            'ApexClassID, ApexClass.Name from asyncApexjob limit 1';
       }
       return Database.getQueryLocator(queryString);
    }
    public void execute(Database.BatchableContext BC, List<sObject> Scope){
        system.debug('Scope:'+Scope); 
        List<AsyncApexjob> failedjobs=(List<AsyncApexjob>)Scope;
        List<Batch_Monitor__c> lstNewbatchMonitor=new  List<Batch_Monitor__c>();
        for(AsyncApexjob job: failedjobs){
            lstNewbatchMonitor.add(createBatchMonitor(job));
        }
        insert lstNewbatchMonitor;
        
        sendEmail(lstNewbatchMonitor);        
        
    }
    public void finish(Database.BatchableContext BC){
        
     }
    
    void sendEmail(List<Batch_Monitor__c> lstNewbatchMonitor){
        // Create a master list to hold the emails we'll send
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        //  Set list of people who should get the email
        List<String> sendTo = new List<String>();
        for(Batch_Job_Monitoring__c bjm: Batch_Job_Monitoring__c.getAll().values() ){
            sendTo.add(bjm.Recipient_email__c);    
        }
        for(Batch_Monitor__c bm: lstNewbatchMonitor){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();  
            //mail.setReplyTo('doNotReply@dupont.com');
            //mail.setSenderDisplayName('test');
            //mail.saveAsActivity=false;
            //mail.setTargetObjectId(emailUserId1);
            
            mail.setToAddresses(sendTo);
                    
            
            mail.setSubject('Batch Job failed in Util PA');
            String body = 'Dear Admin, <Br/>';
            body += 'A batch Job has failed in Util PA. Batch monitor record has been created for the same. Details below:<Br/>';
            body += '<Br/>Batch monitor ID: &nbsp;'+bm.id;
            body += '<Br/>Batch monitor name: &nbsp;'+bm.name;
            body += '<Br/>Batch Job Error: &nbsp;'+bm.Batch_Job_Error__c;
            body += '<Br/>Status: &nbsp;'+bm.status__c;
            body += '<Br/>AsyncApexJob Id: &nbsp;'+bm.AsyncApexJob_Id__c;
            body += '<Br/>Description: &nbsp;'+bm.Description__c;
            mail.setHtmlBody(body);
            
            // Step 5. Add your email to the master list
            mails.add(mail);
        }    
        Messaging.sendEmail(mails);
        
      }
   
    Batch_Monitor__c createBatchMonitor(AsyncApexjob job){
        
        Batch_Monitor__c bm=new Batch_Monitor__c();
        bm.name='Error in ';
        if(job.ApexClass.name!=null){
           bm.name+='class: '+job.ApexClass.name; 
        }
        if(job.MethodName!=null){
           bm.name+=' method name: '+job.MethodName; 
        }
        bm.name=(bm.name.length()>80?bm.name.substring(0,79): bm.name);
                
        if(job.ExtendedStatus!=null){
            bm.Batch_Job_Error__c=(job.ExtendedStatus.length()>255?job.ExtendedStatus.substring(0,254): job.ExtendedStatus);
        }
        
        if(job.Id!=null){
            bm.AsyncApexJob_Id__c=job.Id;
        }
        
        bm.Status__c=job.status;
        
        //<START><VL20160920> 
        bm.SFDC_Instance__c=sfdcInstance;
        //<End><VL20160920> 
        bm.Description__c='Method name: '+job.MethodName+
            ',\r\n class name: '+ job.ApexClass.name+
            ',\r\n TotalJobItems:'+job.TotalJobItems+
            ',\r\n JobItemsProcessed:'+job.JobItemsProcessed+
            ',\r\n NumberOfErrors:'+job.NumberOfErrors+
            ',\r\n JobType:'+job.JobType+
            ',\r\n CompletedDate:'+job.CompletedDate+
            ',\r\n Exception: '+ job.ExtendedStatus;
        bm.Description__c=bm.Description__c.length()>32768?bm.Description__c.substring(0, 32767):bm.Description__c;
          return bm;
    }
    
    
}