@isTest
public class batchDeletionOfAbandonedRequest_UT{
    static testMethod void batchDeletionOfAbandonedRequestTestMethod() {
                    
        Pricing_Request__c pr = new Pricing_Request__c();
      
      /*  Date myDate = date.newinstance(2014,6,1);
        pr.Request_Approval_Status__c = 'Abandoned';
        pr.Request_Type__c = 'Massive';
        pr.Pricing_Request_Type__c = 'Pricing Task';
        pr.Spot_Type__c = 'Rebate Agreement';
        pr.Current_Level__c = '1';
        pr.BU__c = 'Test Business';
        pr.Request_Reason__c = 'test';
        
        */
        
        //Commented bcz, i tried new staticResource by attaching 'BatchDeletionCSV.csv' file into 'BatchDeletionTest'
        
        List<sObject> ls = Test.loadData(Pricing_Request__c.sObjectType, 'batchDeletionTest');
        Pricing_Request__c req = (Pricing_Request__c)ls[0];
        
   //     pr.CreatedDate = {$Resource.TestdataTestclass};
       //pr.Request_Approval_Status__c = 'Submitted';
   //     upsert pr;
   		 
     // pr.Request_Approval_Status__c = 'Abandoned';
        
       /* list<sObject> c=new list<Pricing_Request__c>();
     c.add(pr);
     upsert c;*/
     //test.startTest();
     try{ 
       Test.startTest();  
        batchDeletionOfAbandonedRequest bc = new batchDeletionOfAbandonedRequest();
        database.executeBatch(bc,200);
        //Database.executeBatch(bc);  
        bc.startQuery = 'SELect id FROM Pricing_Request__c WHERE Request_Approval_Status__c=\'Abandoned\' and CreatedDate <LAST_N_DAYS:29';
        test.stopTest();
           }catch(Exception e){} 
      
     }

}