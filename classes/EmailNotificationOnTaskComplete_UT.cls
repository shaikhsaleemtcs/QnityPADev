/*
Date : 29/12/2016
Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
*/
@isTest 
private class EmailNotificationOnTaskComplete_UT {
    
   
    static testMethod void EmailNotificationOnTaskCompleteTestMethod() {
       //Start: Updated as a part of Merge & Spin to the change the UserRole name.
       Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
       /*
       UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
    
       User u1= new User(Firstname='test2test2',Alias='Hill1', Email='test@test.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='qw3214',External_ERP_ID__c='345678',profileid = p.id,
                         Username='testingtset2645@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm1', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
                         
                         insert u1;
                    
       system.debug('ProfileId '+p.id);
              system.debug('User '+r.id);
       */
       UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
       insert Ur;
       User usr = TestUserUtil.createTestUser(Ur.Id,p.Id,'User FirstName','User LastName');
       insert usr;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
       system.runAs(usr){
           
             
       List<Id> projId =new List<Id>();
       
       Project_Price__c P1= new Project_Price__c();   
       P1.Name='P1';
       P1.Valid_From__c=system.today();
       P1.Valid_To__c=system.today()+15;        
       P1.Project_Volume__c='100';
       P1.Default_Discount__c='10';
       p1.isApproved__c=false;
       p1.Project_status__c='Approved';
       p1.Assigned_To__c=usr.id; 
                      
       insert P1;     
    
       Task t = new Task();   
       t.whatId=p1.id; 
       t.Status='inprogress';       
       insert t;
       t.Status='completed';
       upsert t;        
       
       
 }
       }
 static testMethod void EmailNotificationOnTaskCompleteTestMethod1() {
 
       //Start: Updated as a part of Merge & Spin to the change the UserRole name.
       Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
       /*
       UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
      // insert r;
       User u1= new User(Firstname='test2test2',Alias='Hill', Email='test@test.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='1234qw',External_ERP_ID__c='234567',profileid = p.id,
                         Username='testingtset2676@dupont.com.uttest2',UserRoleId=r.id, LastName='Hill', CommunityNickname='mm', TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
                         
                         insert u1;
       */
       UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
       insert Ur;
       User usr = TestUserUtil.createTestUser(Ur.Id,p.Id,'User FirstName','User LastName');
       insert usr;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
       system.runAs(usr){
           
             
            
       
        List<Id> pricingId =new List<Id>();
        Pricing_Request__c v=new Pricing_Request__c();
        v.BU__c='p1';
        insert v;
        
        Task t1 = new Task();     
        t1.whatId=v.id;
        t1.Status='inprogress';     
        insert t1;
       t1.Status='Completed';     
        upsert t1;
 }
       }
 }