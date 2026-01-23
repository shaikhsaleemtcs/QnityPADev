/***********************************************************************************************
Email :rohitkumar.saini@tcs.com
Date :2015/1/26
Description : Test class for batch_jobMonitoring class

<SS20220826> string value changed
 ***********************************************************************************************/
@isTest

public class batch_jobMonitoring_UT {
  public static testMethod void test_Unitcase1() {
          Batch_Job_Monitoring__c testEmail=new Batch_Job_Monitoring__c(name='sys admin', Recipient_email__c='test@salesforce.com');
          insert testEmail;
         test.startTest();
        batch_jobMonitoring hcu = new batch_jobMonitoring();
      //<SS20220826> changed below string value
        String sch = '00 00 00 * * ? *';
        String jobID = system.schedule('batch job monitoring test', sch, hcu);

         test.stopTest();
    }   
    
    
}