@isTest 
//(SeeAllData=true)
private class batchProjectStatusChange_UT {  
    static testMethod void batchProjectStatusChange() {
        list<String> h=new list<String>();   
        String profileId=[select Id,name from Profile where name='XXX_Deactivated User' limit 1].Id;   
        user testuser=new user(firstname='abc',lastname='xyz',email='abc@xyz.com',username='abc_cba_salesforce_DuPont-123456@xyz.com',alias='abc',CommunityNickname='Test',profileId=profileId,EmailEncodingKey='UTF-8',LocaleSidKey='en_US',LanguageLocaleKey='en_US',TimeZoneSidKey='Asia/Kolkata'); 
          insert testuser;   h.add('prachi');     
          Project_Price__c c=new Project_Price__c();    
          c.Valid_To__c=system.today()-1;    
          c.Project_Status__c='Draft';    
          c.isApproved__c=true;    
          c.ownerId=testuser.Id;    
          insert c; 
          System.debug('Project Price'+c);     
          Pricing_Request__c s=new Pricing_Request__c();      
          s.BU__c = 'BI EMEA Surfaces';
          s.Project_Price__c=c.id;       
          insert s;       
          //pAUtil m=new PAUtil();        
          batchProjectStatusChange bc=new batchProjectStatusChange();              
          Database.executeBatch(bc, 200);               
          Test.startTest();   
          }
    }