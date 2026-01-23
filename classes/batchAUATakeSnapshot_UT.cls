/*******************************************************************************
Copyright © 2016 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  Unit Test for batchAUATakeSnapshot
********************************************************************************/
@isTest
public class batchAUATakeSnapshot_UT {
    public static testMethod void LoadData() {
        User_Access_Review__c uar = new User_Access_Review__c(name='Test User Access Review Audit 2016',Process_Owner__c=UserInfo.getUserId(), Start_Date__c=Date.today());
        Insert uar;
        executeTest(uar);
    }
    
    public static  void executeTest(User_Access_Review__c uar) {
        Test.startTest();
         ID batchprocessid = Database.executeBatch(new batchAUATakeSnapshot(uar.id),50);
        Test.stopTest();
    }

}