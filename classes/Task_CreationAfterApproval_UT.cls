@isTest
public class Task_CreationAfterApproval_UT
{
    
  static testMethod void TaskCreationAfterApproval()
  {
    //   public static final Id Task_Pricing_Task_RTYPE = Rtype.getIdByDevName('Task','Pricing_Task');
       Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      /* UserRole ur = new UserRole();
       ur.developerName ='BI_EMEA_D630';
       insert ur; */
        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u1 = TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');     
        insert u1;
       system.runAs(u1){
       
        Pricing_Request__c R1= new Pricing_Request__c();
        R1.Request_Name__c='R1 For P1';
        R1.Request_Approval_Status__c='Submitted';
        R1.Request_Reason__c='New Project';
        R1.Request_Type__c = 'Customer Specific';
        R1.Pricing_Request_Type__c = 'Pricing Task';
        R1.Spot_Type__c=null;
        R1.Customer_Specific__c = true; 
        R1.Sales_Org_Code__c='A200';
        R1.BU__c='AP';
        R1.Assigned_To__c=u1.id;   
        R1.Due_Date__c=system.today();  
        R1.Task_Subject__c='TestClassforTaskCreationAfterApproval';
       
        insert R1;
        
        R1.Request_Approval_Status__c='Approved';
        upsert R1;
        
   }      
  }
}