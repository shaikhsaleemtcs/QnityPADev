/*
Date : 29/12/2016
Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest 
//(SeeAllData=true)
private class BatchDailyNotifications_UT {
    
    
    static testMethod void BatchDailyNotificationsTestMethod() {
        
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        /*
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];  
        system.debug('roleeeeeeeeee'+r);                 
        User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='testDailyNotification',UserRoleId=r.id,profileid = p.id,
         
                        Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US'); 
        insert u3; 
        */

  
        User usr= TestUserUtil.createTestUser(Ur.Id,p.Id,'Test FirstName','Test LastName');
        insert usr;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
                    
    System.RunAs(usr) 
    {
        List<PABusinessToNotify__c> NotifyList = new List<PABusinessToNotify__c>();
        PABusinessToNotify__c Notify1 = new PABusinessToNotify__c();
        Notify1.Name = 'BI EMEA';
        Notify1.Daily_Notification__c = True;
        NotifyList.add(Notify1);
        PABusinessToNotify__c Notify2 = new PABusinessToNotify__c();
        Notify2.Name = 'BI EMEA1';
        Notify2.Daily_Notification__c = True;
        NotifyList.add(Notify2);
        PABusinessToNotify__c Notify3 = new PABusinessToNotify__c();
        Notify3.Name = 'BI EMEA2';
        Notify3.Daily_Notification__c = True;
        NotifyList.add(Notify3);
        PABusinessToNotify__c Notify4 = new PABusinessToNotify__c();
        Notify4.Name = 'BI EMEA3';
        Notify4.Daily_Notification__c = True;
        NotifyList.add(Notify4);
        
        insert NotifyList;
        
        PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
        paProfilePermissions1.Name = 'Approver';
        paProfilePermissions1.API_NAME__c = 'Price_Approval_Approver';
        insert paProfilePermissions1;
        PermissionSet ps = [SELECT ID From PermissionSet WHERE Name = :PAProfilePermissions__c.getInstance('Approver').API_Name__c];
               
        //String userid=[Select id from user where Alias='pcopp' and Email='ambili_vinay@infosys.com'].id;
        insert new PermissionSetAssignment(AssigneeId = usr.id, PermissionSetId = ps.Id );                    
        Pricing_Request__c s=new Pricing_Request__c();
        s.Current_Approver__c=usr.id;
        s.BU__c = 'BI EMEA';
        s.Request_Approval_Status__c='Submitted';
        
        insert s;
        

        
          BatchDailyNotifications bc=new BatchDailyNotifications();
          
         // Batch7DayDSULead dsulead = new Batch7DayDSULead(selectedday);
          bc.runTestMethod=true;
          Database.executeBatch( bc);
    // Test.startTest(); 

    }
    }    
   
}