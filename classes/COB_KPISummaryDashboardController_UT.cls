@isTest

public class COB_KPISummaryDashboardController_UT{
    
    public static testMethod void KPISummary() { 
        
        test.StartTest();
        Customer_Data_Request__c req = new Customer_Data_Request__c();
        Id CustCrRecordTypeId = Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('New Customer Creation').getRecordTypeId();
        req.Requestor_Email__c = 'nishanth_h@infosys.com';
        req.SF_Region__c ='Asia Pacific';
        req.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
        req.SBU__c='A2 - DuPont Protection Technologies';
        req.recordTypeId=CustCrRecordTypeId ;
        req.Group_Key__c ='6000000';
        req.Distribution_Channel__c = '10-Dupont Std';
        req.Account_Group__c='Z001(Sold-to Party)';
        req.Division__c = '01-Product Division 01';
        req.Customer_Name__c='Test Customer';
        req.Sold_to_Street__c='Walters Street';
        req.Sold_to_City__c='New Jersey';
        req.Request_Status__c = 'Closed';
        req.Sold_to_Country__c='US-USA';
        req.Sold_to_e_mail__c='sam@gmail.com';
        req.Proposed_Terms_of_Payment__c='15 PROX';
        req.Proposed_Credit_Limit__c='100';
        req.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
        req.Default_Incoterms_2__c='Test Term';
        req.Estimated_Average_Monthly_Purchases__c=100;
        req.Estimated_Number_of_Orders_per_Month__c=20;
        req.Registration_number__c='458889';
        req.Sold_To_Office_House_Number__c = '124';
        req.Sold_to_State_Province__c ='Michigun';
        req.Record_Locked__c=false;
        req.Relevant_for_POD__c=false;
        req.Total_Completion_Time__c=50;
        req.Data_Draft_Gathering_Time__c=10;
        req.DCA_Approval_Time__c=5;
        req.Credit_Approval_Time__c=2;
        req.Escalated_Approval_Time__c=1;
        req.DMS_Approval_Time__c=3;
        insert req;
        COB_KPISummaryDashboardController kpi=new COB_KPISummaryDashboardController();
        kpi.startDate= date.newInstance(2014, 11, 21);
        kpi.EndDate= date.newInstance(2015, 11, 21);
        kpi.totalRequestCompleted=5;
        kpi.DateSubmit();
        
        kpi.getSBUCode();
        kpi.getSBU();
        kpi.setSBU('abc');
        kpi.getsellingCompanyCode();
        kpi.getcompanyCodeList();
        kpi.setcompanyCodeList('pqr');
        
        req.Total_Completion_Time__c=0;
        req.Data_Draft_Gathering_Time__c=0;
        req.DCA_Approval_Time__c=0;
        req.Credit_Approval_Time__c=0;
        req.Escalated_Approval_Time__c=0;
        req.DMS_Approval_Time__c=0;
        update req;
        kpi.totalRequestCompleted=0;
        kpi.DateSubmit();     
        test.StopTest();
        
    }
    
    //Added by Sumida on 10/09/24 to cover ctrlCOBUtilKPISummaryDashboard
    public static testMethod void KPISummaryctrl() { 
        test.StartTest();
        Customer_Data_Request__c req = new Customer_Data_Request__c();
        Id CustCrRecordTypeId = Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('New Customer Creation').getRecordTypeId();
        req.Requestor_Email__c = 'test@test.com';
        req.SF_Region__c ='Asia Pacific';
        req.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
        req.SBU__c='A2 - DuPont Protection Technologies';
        req.recordTypeId=CustCrRecordTypeId ;
        req.Group_Key__c ='6000000';
        req.Distribution_Channel__c = '10-Dupont Std';
        req.Account_Group__c='Z001(Sold-to Party)';
        req.Division__c = '01-Product Division 01';
        req.Customer_Name__c='Test Customer';
        req.Sold_to_Street__c='Walters Street';
        req.Sold_to_City__c='New Jersey';
        req.Request_Status__c = 'Closed';
        req.Sold_to_Country__c='US-USA';
        req.Sold_to_e_mail__c='sam@test.com';
        req.Proposed_Terms_of_Payment__c='15 PROX';
        req.Proposed_Credit_Limit__c='100';
        req.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
        req.Default_Incoterms_2__c='Test Term';
        req.Estimated_Average_Monthly_Purchases__c=100;
        req.Estimated_Number_of_Orders_per_Month__c=20;
        req.Registration_number__c='458889';
        req.Sold_To_Office_House_Number__c = '124';
        req.Sold_to_State_Province__c ='Michigun';
        req.Record_Locked__c=false;
        req.Relevant_for_POD__c=false;
        req.Total_Completion_Time__c=50;
        req.Data_Draft_Gathering_Time__c=10;
        req.DCA_Approval_Time__c=5;
        req.Credit_Approval_Time__c=2;
        req.Escalated_Approval_Time__c=1;
        req.DMS_Approval_Time__c=3;
        insert req;
        ctrlCOBUtilKPISummaryDashboard kpi=new ctrlCOBUtilKPISummaryDashboard();
        kpi.startDate= date.newInstance(2014, 11, 21);
        kpi.EndDate= date.newInstance(2015, 11, 21);
        kpi.totalRequestCompleted=5;
        kpi.DateSubmit();
        kpi.getSBUCode();
        kpi.getSBU();
        kpi.setSBU('abc');
        kpi.getsellingCompanyCode();
        kpi.getcompanyCodeList();
        kpi.setcompanyCodeList('pqr');
        req.Total_Completion_Time__c=0;
        req.Data_Draft_Gathering_Time__c=0;
        req.DCA_Approval_Time__c=0;
        req.Credit_Approval_Time__c=0;
        req.Escalated_Approval_Time__c=0;
        req.DMS_Approval_Time__c=0;
        update req;
        kpi.totalRequestCompleted=0;
        kpi.DateSubmit();     
        test.StopTest();
    }
}