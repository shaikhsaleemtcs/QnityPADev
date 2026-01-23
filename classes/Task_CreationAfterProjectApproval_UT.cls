@isTest
public class Task_CreationAfterProjectApproval_UT
{
  
  static testMethod void TaskCreationAfterProjectApproval()
  {  Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
      // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

    User u= TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');
      system.runAs(u){
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
        P2.isApproved__c=true;
        P2.Project_status__c='Draft';
        P2.Assigned_To__c=u.id;
        insert P2;
        
        Project_Price__c P3= new Project_Price__c();
        P3.Name='P2';
        P3.Valid_From__c=system.today();
        P3.Valid_To__c=system.today()+15;       
        P3.Project_Volume__c='100';
        P3.Default_Discount__c='10';
        P3.isApproved__c=true;
        P3.Project_status__c='Draft';
        P3.Assigned_To__c=u.id;
        insert P3;
        
          /*Project_Price__c P4= new Project_Price__c();
        P4.Name='P2';
        P4.Valid_From__c=system.today();
        P4.Valid_To__c=system.today()+15;       
        P4.Project_Volume__c='100';
        P4.Default_Discount__c='10';
        p4.isApproved__c=true;
        p4.Project_status__c='Approved';
        p4.Assigned_To__c=u.id;
        insert P4;*/
        
         Project_Price__c P5= new Project_Price__c();
        P5.Name='P2';
        P5.Valid_From__c=system.today();
        P5.Valid_To__c=system.today()+15;       
        P5.Project_Volume__c='100';
        P5.Default_Discount__c='10';
        P5.isApproved__c=false;
        P5.Project_status__c='Draft';
        P5.Assigned_To__c=u.id;
        insert P5;
        
        Project_Price__c P6= new Project_Price__c();
        P6.Name='P2';
        P6.Valid_From__c=system.today();
        P6.Valid_To__c=system.today()+15;       
        P6.Project_Volume__c='100';
        P6.Default_Discount__c='10';
        P6.isApproved__c=false;
        P6.Project_status__c='Draft';
        P6.Assigned_To__c=u.id;
        insert P6;
        
       
                
        Pricing_Request__c R1= new Pricing_Request__c();
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
        R1.BU__c='BI EMEA Surfaces';
        insert R1;
        
        Pricing_Request__c R2= new Pricing_Request__c();
        R2.Request_Name__c='R2 For P2';
        R2.Request_Approval_Status__c='Submitted';
        R2.Request_Reason__c='New Project';
        R2.Request_Type__c = 'Customer Specific';
        R2.Pricing_Request_Type__c = 'Project Pricing';
        R2.Spot_Type__c=null;
        R2.Customer_Specific__c = true;     
        R2.Project_Price__c=P2.id;
        R2.Project_Id__c=P2.Project_Id__c;
        R2.Project_Name__c=P2.Name;
        R2.BU__c='BI EMEA Surfaces';
        insert R2;     
                
        Pricing_Request__c R3= new Pricing_Request__c();
        R3.Request_Name__c='R2 For P2';
        R3.Request_Approval_Status__c='Submitted';
        R3.Request_Reason__c='New Project';
        R3.Request_Type__c = 'Customer Specific';
        R3.Pricing_Request_Type__c = 'Project Pricing';
        R3.Spot_Type__c=null;
        R3.Customer_Specific__c = true;     
        R3.Project_Price__c=P3.id;
        R3.Project_Id__c=P3.Project_Id__c;
        R3.Project_Name__c=P3.Name;
        R3.BU__c='BI EMEA Surfaces';
        insert R3;
        
          /* Pricing_Request__c R4= new Pricing_Request__c();
        R4.Request_Name__c='R2 For P2';
        R4.Request_Approval_Status__c='Submitted';
        R4.Request_Reason__c='New Project';
        R4.Request_Type__c = 'Customer Specific';
        R4.Pricing_Request_Type__c = 'Project Pricing';
        R4.Spot_Type__c=null;
        R4.Customer_Specific__c = true;     
        R4.Project_Price__c=P4.id;
        R4.Project_Id__c=P4.Project_Id__c;
        R4.Project_Name__c=P4.Name;
        insert R4;*/
        
        Pricing_Request__c R5= new Pricing_Request__c();
        R5.Request_Name__c='R2 For P2';
        R5.Request_Approval_Status__c='Submitted';
        R5.Request_Reason__c='New Project';
        R5.Request_Type__c = 'Customer Specific';
        R5.Pricing_Request_Type__c = 'Project Pricing';
        R5.Spot_Type__c=null;
        R5.Customer_Specific__c = true;     
        R5.Project_Price__c=P5.id;
        R5.Project_Id__c=P5.Project_Id__c;
        R5.Project_Name__c=P5.Name;
        R5.BU__c='BI EMEA Surfaces';
        insert R5;
        
        Pricing_Request__c R6= new Pricing_Request__c();
        R6.Request_Name__c='R2 For P2';
        R6.Request_Approval_Status__c='Submitted';
        R6.Request_Reason__c='New Project';
        R6.Request_Type__c = 'Customer Specific';
        R6.Pricing_Request_Type__c = 'Project Pricing';
        R6.Spot_Type__c=null;
        R6.Customer_Specific__c = true;     
        R6.Project_Price__c=P6.id;
        R6.Project_Id__c=P6.Project_Id__c;
        R6.Project_Name__c=P6.Name;
        R6.BU__c='BI EMEA Surfaces';
        insert R6;
        
        // For Non-selective query issue
        ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
        Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
        SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
        insert pp;
            
        OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
        insert salesArea;
                        
        OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA');
        insert Business;
            
        List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
        orgItemList.add(new Organizational_Group_Item__c(
        Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                ERP_Currency__c=null));
         insert orgItemList;  
         // End
         
       
        
         
        Task t = new Task();      
        t.whatId=p2.id;      
        insert t;
        
        PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();

        R1.Request_Approval_Status__c='Submitted';
        upsert R1;
        
        R2.BU__C = Business.Business__c;
        R2.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
        R2.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
        R2.Division_Code__c = salesArea.ERP_Division_code__c;
        R2.Request_Approval_Status__c='Approved';
        //upsert R2;
        R3.Request_Approval_Status__c='Abandoned';
        upsert R3;
        /*R4.Request_Approval_Status__c='Recalled';
        upsert R4;
        R4.Request_Approval_Status__c='Rejected';
        upsert R4;  */
        
        R5.BU__C = Business.Business__c;
        R5.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
        R5.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
        R5.Division_Code__c = salesArea.ERP_Division_code__c;
        R5.Request_Approval_Status__c='Approved';
        //upsert R5;
        R6.Request_Approval_Status__c='Abandoned';
        upsert R6;
        
      }
  }
  static testMethod void TaskCreationAfterProjectApproval1()
  {
     Project_Price__c P7= new Project_Price__c();   
        P7.Name='P1';
        P7.Valid_From__c=system.today();
        P7.Valid_To__c=system.today()+15;       
        P7.Project_Volume__c='100';
        P7.Default_Discount__c='10';
        P7.isApproved__c=false;
        P7.Project_status__c='Submitted';       
        insert P7;
        
          Project_Price__c P8= new Project_Price__c();   
        P8.Name='P1';
        P8.Valid_From__c=system.today();
        P8.Valid_To__c=system.today()+15;       
        P8.Project_Volume__c='100';
        P8.Default_Discount__c='10';
        P8.isApproved__c=false;
        P8.Project_status__c='Submitted';       
        insert P8;
      Pricing_Request__c R7= new Pricing_Request__c();
        R7.Request_Name__c='R2 For P2';
        R7.Request_Approval_Status__c='Submitted';
        R7.Request_Reason__c='New Project';
        R7.Request_Type__c = 'Customer Specific';
        R7.Pricing_Request_Type__c = 'Project Pricing';
        R7.Spot_Type__c=null;
        R7.Customer_Specific__c = true;     
        R7.Project_Price__c=P7.id;
        R7.Project_Id__c=P7.Project_Id__c;
        R7.Project_Name__c=P7.Name;
        R7.BU__c='BI EMEA Surfaces';
        insert R7;
        
        Pricing_Request__c R8= new Pricing_Request__c();
        R8.Request_Name__c='R2 For P2';
        R8.Request_Approval_Status__c='Submitted';
        R8.Request_Reason__c='New Project';
        R8.Request_Type__c = 'Customer Specific';
        R8.Pricing_Request_Type__c = 'Project Pricing';
        R8.Spot_Type__c=null;
        R8.Customer_Specific__c = true;     
        R8.Project_Price__c=P8.id;
        R8.Project_Id__c=P8.Project_Id__c;
        R8.Project_Name__c=P8.Name;
        R8.BU__c='BI EMEA Surfaces';
        insert R8;
    R7.Request_Approval_Status__c='Rejected';
        upsert R7;
        R8.Request_Approval_Status__c='Recalled';
        upsert R8;
  }

static testMethod void TaskCreationAfterProjectApproval2()
  {  Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
      // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
       User u = TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');     
        insert u;
      system.runAs(u){
        Project_Price__c P4= new Project_Price__c();
        P4.Name='P2';
        P4.Valid_From__c=system.today();
        P4.Valid_To__c=system.today()+15;       
        P4.Project_Volume__c='100';
        P4.Default_Discount__c='10';
        P4.isApproved__c=true;
        P4.Project_status__c='Approved';
        P4.Assigned_To__c=u.id;
        insert P4;
        
        
        Pricing_Request__c R4= new Pricing_Request__c();
        R4.Request_Name__c='R2 For P2';
        R4.Request_Approval_Status__c='Submitted';
        R4.Request_Reason__c='New Project';
        R4.Request_Type__c = 'Customer Specific';
        R4.Pricing_Request_Type__c = 'Project Pricing';
        R4.Spot_Type__c=null;
        R4.Customer_Specific__c = true;     
        R4.Project_Price__c=P4.id;
        R4.Project_Id__c=P4.Project_Id__c;
        R4.Project_Name__c=P4.Name;
        R4.BU__c='BI EMEA Surfaces';
        insert R4;
        
        
        R4.Request_Approval_Status__c='Recalled';
        upsert R4;
        R4.Request_Approval_Status__c='Rejected';
        upsert R4;  
        
        
      }
  }
  //pooja
    static testMethod void TaskCreationAfterProjectApproval3(){

      Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];
      
           // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
       User u = TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');     
        insert u;
        system.runAs(u){
        
        Project_Price__c P1= new Project_Price__c();   
        P1.Name='P1';
        P1.Valid_From__c=system.today();
        P1.Valid_To__c=system.today()+15;       
        P1.Project_Volume__c='100';
        P1.Default_Discount__c='10';
        P1.isApproved__c=false;
        P1.Project_status__c='Submitted';       
        insert P1;    
        
        Pricing_Request__c R1= new Pricing_Request__c();
        R1.Request_Name__c='R1 For P1';
        R1.Request_Approval_Status__c='Submitted';
        R1.Request_Reason__c='New Project';
        R1.Request_Type__c = 'Customer Specific';
        R1.Pricing_Request_Type__c = 'Project Pricing';
        R1.Spot_Type__c=null;
        R1.Customer_Specific__c = true;     
        R1.Project_Price__c=P1.id;
        R1.Project_Id__c=P1.Project_Id__c;
        R1.Project_Name__c=P1.Name;
        R1.BU__c='BI EMEA Surfaces';
        insert R1;
        
        //R1.Request_Approval_Status__c='Approved';        
        //update R1;
        
        
        
     /*   List<Project_Price__C> ppl = new List<Project_Price__C>();
        Project_Price__c P2= new Project_Price__c();   
        P2.Name='P1';
        P2.Valid_From__c=system.today();
        P2.Valid_To__c=system.today()+15;       
        P2.Project_Volume__c='100';
        P2.Default_Discount__c='10';
        P2.isApproved__c=false;
        P2.Project_status__c='Approved';*/
        
        List<ID> appIds = new List<ID>();
        appIds.add(P1.Id);
        
        List <Pricing_Request__c> prObjFromDB = new List<Pricing_Request__c>([SELECT id FROM Pricing_Request__c WHERE id = :appIds[0]]);
        
        //ppl.add(P1);
        
      }
    }
    
    //Added method to approve pricing request via bulk method-<PG20180926>
    static testMethod void TaskCreationAfterProjectApproval4()
  {
       Profile p =[SELECT Id FROM Profile where name='Price Approval-Price requester'];      
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

       User u= TestUserUtil.createTestUser(r.id, p.id, 'test fName', 'test lName');
       
       //ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c(SAP_Cluster__c='CB1');
        //insert epp;
         // For Non-selective query issue
        ERP_Pricing_Procedure__c epp = NEW ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='A641',
        Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
        SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
        insert epp;
        
            
        OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
        insert salesArea;
                        
        OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces');
        insert Business;
            
        List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
        orgItemList.add(new Organizational_Group_Item__c(
        Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=epp.id,
                Customer_Request_Reasons__c='CP01-Customer negotiation; CP02-New customer',Non_Customer_Permanent_Request_Reasons__c='NC01-Extending current prices; NC02-New materials',
                ERP_Currency__c=null));
         insert orgItemList;  
         // End
         
        Project_Price__c P7= new Project_Price__c();   
        P7.Name='P1';
        P7.Valid_From__c=system.today();
        P7.Valid_To__c=system.today()+15;       
        P7.Project_Volume__c='100';
        P7.Default_Discount__c='10';
        P7.isApproved__c=false;
        P7.Project_status__c='Submitted';  
        P7.Assigned_To__c=u.id;    
        insert P7;
        
        Project_Price__c P8= new Project_Price__c();   
        P8.Name='P1';
        P8.Valid_From__c=system.today();
        P8.Valid_To__c=system.today()+15;       
        P8.Project_Volume__c='100';
        P8.Default_Discount__c='10';
        P8.isApproved__c=false;
        P8.Project_status__c='Submitted';   
        P8.Assigned_To__c=u.id;    
        insert P8;
        
        Pricing_Request__c R7= new Pricing_Request__c();
        R7.Request_Name__c='R2 For P2';
        R7.Request_Approval_Status__c='Submitted';
        R7.Request_Reason__c='New Project';
        R7.Request_Type__c = 'Customer Specific';
        R7.Pricing_Request_Type__c = 'Project Pricing';
        R7.Spot_Type__c=null;
        R7.Customer_Specific__c = true;     
        R7.Project_Price__c=P7.id;
        R7.Project_Id__c=P7.Project_Id__c;
        R7.Project_Name__c=P7.Name;
        R7.BU__c='BI EMEA Surfaces';  
        R7.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
        R7.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
        R7.Division_Code__c = salesArea.ERP_Division_code__c;          
        insert R7;
    
     
         
    
    Pricing_Request_Item__c prItemm = new Pricing_Request_Item__c();
        prItemm.Pricing_Request__c = R7.Id;
        //prItemm.BU__c='BI EMEA Surfaces';
        prItemm.Below_Current_Flag__c = true;
        prItemm.Below_Floor_Flag__c = false;
        prItemm.Below_Reference_Flag__c =false;
        prItemm.Key_Combination__c = 'Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
        prItemm.New_Rate__c = '10';
        prItemm.Rate__c  = '15';
        prItemm.Quantity__c = '10';
        prItemm.New_Unit__c = 'USD';
        prItemm.New_Valid_From__c = system.today();
        prItemm.New_Valid_To__c = system.today();
        prItemm.Material_Code__c = 'TestCode';
        prItemm.Sales_Org_Code__c = 'A641';
        prItemm.Key_Combination_Code__c = 'A694';
        prItemm.SAP_Cluster__c = 'CB1';
        prItemm.ERP_Pricing_Procedure__c = epp.id;
        prItemm.Pricing_Condition_Code__c= 'ZD9G';
        
        insert prItemm;
        
      
        Pricing_Request__c R8= new Pricing_Request__c();
        R8.Request_Name__c='R2 For P2';
        R8.Request_Approval_Status__c='Submitted';
        R8.Request_Reason__c='New Project';
        R8.Request_Type__c = 'Customer Specific';
        R8.Pricing_Request_Type__c = 'Project Pricing';
        R8.Spot_Type__c=null;
        R8.Customer_Specific__c = true;     
        R8.Project_Price__c=P8.id;
        R8.Project_Id__c=P8.Project_Id__c;
        R8.Project_Name__c=P8.Name;
        R8.Project_Name__c=P8.Name;
        R8.BU__c='BI EMEA Surfaces';
        R8.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
        R8.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
        R8.Division_Code__c = salesArea.ERP_Division_code__c;
        insert R8;
        
    Pricing_Request_Item__c prItemn = new Pricing_Request_Item__c();
        prItemn.Pricing_Request__c = R8.Id;
        //prItemn.BU__c='BI EMEA Surfaces';
        prItemn .Below_Current_Flag__c = true;
        prItemn .Below_Floor_Flag__c = false;
        prItemn.Below_Reference_Flag__c =false;
        prItemn.Key_Combination__c = 'Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
        prItemn.New_Rate__c = '10';
        prItemn.Rate__c  = '15';
        prItemn.Quantity__c = '10';
        prItemn.New_Unit__c = 'USD';
        prItemn.New_Valid_From__c = system.today();
        prItemn.New_Valid_To__c = system.today();
        prItemn.Material_Code__c = 'TestCode';
        prItemn.Sales_Org_Code__c = 'A641';
        prItemn.Key_Combination_Code__c = 'A694';
        prItemn.SAP_Cluster__c = 'CB1';
        prItemn.ERP_Pricing_Procedure__c = epp.id;
        prItemn.Pricing_Condition_Code__c= 'ZD9G';
        insert prItemn;
    
        R7.Request_Approval_Status__c='Submitted';
        
        upsert R7;
        R8.Request_Approval_Status__c='Submitted';
        upsert R8;
        Task t1 = new Task();      
        t1.whatId=p7.id;      
        insert t1;
        
        Task t2 = new Task();      
        t2.whatId=p8.id;      
        insert t2;
        
    List<Pricing_Request__c> plist = new List<Pricing_Request__c>();
                
        R7.Request_Approval_Status__c='Approved';
        R8.Request_Approval_Status__c='Approved';
        
        plist.add(R7);
        plist.add(R8);
        
        upsert plist;
       
  }
}