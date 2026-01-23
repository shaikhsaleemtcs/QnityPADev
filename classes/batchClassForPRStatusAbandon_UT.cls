@isTest
private class batchClassForPRStatusAbandon_UT {

    static testMethod void batchClassForPRStatusAbandonTestMethod() {
               
        Pricing_Request__c pr = new Pricing_Request__c();
        pr.Bu__c = 'BI_EMEA_Surfaces';
        pr.Request_Approval_Status__c = 'Draft';
        
        List<Pricing_Request__c> lst1 = [SELECT Last_Modified_By__c FROM Pricing_Request__c WHERE Name = 'PR:20150309-240142' ];
        for(Pricing_Request__c p1:lst1){
        //  pr.Last_Modified_By__c = Date.valueOf(p1.get());
        }
    // pr.Last_Modified_By__c
       // pr.Last_Modified_By__c = date.valueOf('2014-01-01');
      //  pr.LastModifiedDate = date.ValueOf('2014-03-10');//'2014-03-10T09:57:36.000+0000';
     //     pr.LastModifiedDate = date.ValueOf('2014-03-10');
        
        Pricing_Request__c pr1 = new Pricing_Request__c();
        pr1.Bu__c = 'BI_EMEA_Surfaces';
        pr1.Request_Approval_Status__c = 'Draft';
        List<Pricing_Request__c> lst2 = [SELECT Last_Modified_By__c FROM Pricing_Request__c WHERE Name = 'PR:20150309-240142' ];
        for(Pricing_Request__c p2:lst2){
        //  pr1.Last_Modified_By__c = Date.valueOf(p2.get());
        }
    //    pr1.LastModifiedDate = date.ValueOf('2014-03-10');
        
        List<sObject> priceRequestList = new List<Pricing_Request__c>();
        priceRequestList.add(pr);
        priceRequestList.add(pr1);
        
        upsert priceRequestList;
       /*
         List<Pricing_Request__c> ls = Test.loadData(Pricing_Request__c.sObjectType, 'batchPRAbondonedTest');
         Pricing_Request__c req = (Pricing_Request__c)ls[0];
         insert ls;
        
        */
        
     //   try{ 
             
            batchClassForPRStatusAbandon bc = new batchClassForPRStatusAbandon();
            
            bc.startQuery = 'SELect id,Request_Approval_Status__c FROM Pricing_Request__c WHERE (Request_Approval_Status__c=\'Abandon\' or Request_Approval_Status__c=\'Draft\' or Request_Approval_Status__c=\'Rejected\' or Request_Approval_Status__c=\'Recalled\') ';
            Test.startTest(); 
            Database.executeBatch(bc, 200); 
        //    Database.executeBatch(bc,List list=new List());
          //  bc.execute(BC, priceRequestList);
            
        //Database.executeBatch(bc);  
        
        test.stopTest();
  //         }catch(Exception e){} 
      
      
    }
}