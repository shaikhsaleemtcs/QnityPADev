@isTest
public class ProjectDeletionOnRequestDeletion_UT
{
    static testMethod void ProjectDeletionOnRequestDeletion()
    {
    
    Project_Price__c P1= new Project_Price__c();
   
        P1.Name='P1';
        P1.Valid_From__c=system.today();
        P1.Valid_To__c=system.today()+15;       
        P1.Project_Volume__c='100';
        P1.Default_Discount__c='10';
        p1.isApproved__c=false;
        p1.Project_status__c='Draft';       
        insert P1;    
        
        Project_Price__c P2= new Project_Price__c();
        P2.Name='P2';
        P2.Valid_From__c=system.today();
        P2.Valid_To__c=system.today()+15;       
        P2.Project_Volume__c='100';
        P2.Default_Discount__c='10';
        p2.isApproved__c=true;
        p2.Project_status__c='Draft';
        insert P2;
                
        Pricing_Request__c R1= new Pricing_Request__c();
        R1.BU__c='Test';
        R1.Request_Name__c='R1 For P1';
        R1.Request_Approval_Status__c='Draft';
        R1.Request_Reason__c='New Project';
        R1.Request_Type__c = 'Customer Specific';
        R1.Pricing_Request_Type__c = 'Project Pricing';
        R1.Spot_Type__c=null;
        R1.Customer_Specific__c = true;     
        R1.Project_Price__c=P1.id;
        R1.Project_Id__c=P1.Project_Id__c;
        R1.Project_Name__c=P1.Name;
        R1.Sales_Org_Code__c='A250';
        insert R1;
        
        Pricing_Request__c R2= new Pricing_Request__c();
        R2.BU__c='Test';
        R2.Request_Name__c='R2 For P2';
        R2.Request_Approval_Status__c='Draft';
        R2.Request_Reason__c='New Project';
        R2.Request_Type__c = 'Customer Specific';
        R2.Pricing_Request_Type__c = 'Project Pricing';
        R2.Spot_Type__c=null;
        R2.Customer_Specific__c = true;     
        R2.Project_Price__c=P2.id;
        R2.Project_Id__c=P2.Project_Id__c;
        R2.Project_Name__c=P2.Name;
        R2.Sales_Org_Code__c='A250';
        insert R2;
       
       
       delete R1;
        delete R2;      
    }
}