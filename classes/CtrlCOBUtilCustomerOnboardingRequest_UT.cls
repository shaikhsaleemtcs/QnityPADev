/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 

Updates:
<AB20210301> Updated to avoid SOQL Governer limit error due independent DML Statements

********************************************************************************/

@isTest
public class CtrlCOBUtilCustomerOnboardingRequest_UT{
    
    /*public static final string NewCustomerCreation_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','New_Customer_Creation');
    public static final string Extend_Existing_Customer_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Extend_Existing_Customer');
    public static final string PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Create_partner_function_Link_Contact_Link_Existing_Partner');
    public static final string MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Miscellaneous_customer_data_request');
    public static final string MODIFYEXISTINGCUSTDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Existing_Customer_Data');
    public static final string MODIFYCREDITDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Credit_Data');
    public static string CompanyCodeCountry_Rule_Rtype = Rtype.getIdByDevName('Business_Rules__c','Country_Selling_Company_Code_Rules'); 
    public static final string country_Rules_RTYPE = Rtype.getIdByDevName('Business_Rules__c','Country Rules Record'); 
    public static final string doa_Rules_RTYPE = Rtype.getIdByDevName('Business_Rules__c','DOA Rules'); 
    
    static testmethod void CustomerOnboardingRequest(){
        List<Business_Rules__c> brlist = new List<Business_Rules__c>();
        Business_Rules__c br = new Business_Rules__c();
        br.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
        br.selling_company_code__c ='0003 - E.I. DuPont India Private Limited';
        br.Sold_to_Country__c = 'IN - India';
        br.Destination_Queue__c = 'Customer On-boarding CA - India Queue';
        brlist.add(br);
        /*Business_Rules__c br1 = new Business_Rules__c();
br1.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br1.selling_company_code__c ='0078 - ELECT. MATLS DUP DONGGUAN';
br1.Sold_to_Country__c = 'CN - China';
brlist.add(br1);
Business_Rules__c br2 = new Business_Rules__c();
br2.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br2.selling_company_code__c ='0029 - DU PONT CHINA LIMITED';
br2.Sold_to_Country__c = 'HK - Hong Kong';
brlist.add(br2); 
        insert brlist;
        
        User us1 = new user();
        us1.profileId = [Select Id,Name from Profile where Name ='Credit Process Managers' limit 1][0].id;
        us1.firstname='Rupesh'; 
        us1.lastname='Agrawala';
        us1.alias = 'standt'; 
        us1.email='standarduser66@testorg.com';
        us1.emailencodingkey='UTF-8';
        us1.languagelocalekey='en_US';
        us1.localesidkey='en_US';
        us1.timezonesidkey='America/Los_Angeles';
        us1.username='standarduser66@testorg.com';
        insert us1;
        
        
        User us2 = new user();
        us2.profileId = [Select Id,Name from Profile where Name ='Credit Analyst' limit 1][0].id;
        us2.firstname='Mayank'; 
        us2.lastname='Pat';
        us2.alias = 'standt'; 
        us2.email='standarduser7@testorg.com';
        us2.emailencodingkey='UTF-8';
        us2.languagelocalekey='en_US';
        us2.localesidkey='en_US';
        us2.timezonesidkey='America/Los_Angeles';
        us2.username='standarduser7@testorg.com';
        insert us2;
        
        User runUser = [select id from user where isactive = true and 
                        (profileId = :[Select id from profile where name = 'Credit Analyst']) limit 1];
        System.runAs(runUser){
            
            
            
            test.StartTest();
            
            
            
            Customer_Data_Request__c cdr1 = new Customer_Data_Request__c();
            Id RecId = [Select Id, Name from RecordType where DeveloperName = 'New_Customer_Creation' limit 1].Id;    
            
            cdr1.Requestor_Name__c = UserInfo.getUserId();
            cdr1.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            cdr1.SF_Region__c ='Asia Pacific';
            cdr1.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
            cdr1.Distribution_Channel__c = '10-Dupont Std';
            cdr1.Account_Group__c='Z001(Sold-to Party)';
            cdr1.Division__c = '01-Product Division 01';
            cdr1.Customer_Name__c='Test Customer1';
            cdr1.Sold_to_Street__c='Walters Street';
            cdr1.Sold_to_City__c='New Jersey';
            cdr1.Sold_to_Country__c ='IN - India';
            cdr1.Sold_to_e_mail__c='sam1@gmail.com';
            //cdr1.Customer_Contact_Name__c='Test1';
            //cdr1.Customer_Contact_Telephone__c='123232323';
            cdr1.Default_Incoterms_2__c='Test Term';
            cdr1.Estimated_Average_Monthly_Purchases__c=100;
            cdr1.Estimated_Number_of_Orders_per_Month__c=20;
            cdr1.Registration_number__c='458889';
            cdr1.Sold_To_Office_House_Number__c = '124';
            cdr1.Sold_to_State_Province__c ='Michigun';
            cdr1.Proposed_Cash_Management_Group__c = 'FC - Receivables in foreign currency';
            cdr1.Proposed_Cred_rep_grp__c = '00P-Sabine Combrink';
            cdr1.Proposed_credit_information_number__c = 100;
            cdr1.Proposed_Credit_Limit__c='100';
            cdr1.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            cdr1.Proposed_Credit_Term_Type__c='Cash In Advance';
            cdr1.Proposed_Customer_credit_group__c = 'A100 : COMPOSITES';
            cdr1.Proposed_Non_Standard_Terms_of_Payment__c = '15 PROX';   
            cdr1.Proposed_Payment_Index__c = 1234;
            cdr1.Proposed_Rating__c = 'Star';
            cdr1.Proposed_Reference_date__c = date.newInstance(2014, 11, 21);
            cdr1.Proposed_Risk_Category__c = '102 - Automatic Approval';
            cdr1.Proposed_Terms_of_Payment__c = 'Others';
            cdr1.Request_Status__c = 'Awaiting Credit Approval';
            cdr1.Approved_Credit_Limit__c = '2000';
            cdr1.Destination_Credit_limit__c = '3000';
            cdr1.Proposed_Credit_Limit__c = '586';
            cdr1.Preferred_Bank_Name__c = 'Other';
            cdr1.Record_Locked__c=false;
            cdr1.Relevant_for_POD__c=false; 
            cdr1.Approved_Terms_of_Payment__c='Cash In Advance';
            cdr1.Destination_Terms_of_Payment__c='Cash In Advance';
            cdr1.Copy_Proposed_Credit_Data__c=true;
            cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Customer_Group__c='Z00';  
            cdr1.Approved_Risk_Category__c='null';
            cdr1.Copy_Proposed_Data__c=true;
            cdr1.Destination_risk_category__c='NA';
            //cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Credit_Term_Type__c='Cash';
            
            cdr1.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
            cdr1.recordtypeid = recid;
            insert cdr1;
            
            
            
            // ApexPages.currentPage().getParameters().put('currentURLParameters',cdr1.id) ;
            ApexPages.currentPage().getParameters().put('id',cdr1.id) ;
            ApexPages.currentPage().getParameters().put('RecordTypeId',NewCustomerCreation_COB_RTYPE ) ;
            ApexPages.currentPage().getParameters().put('Clone','null') ;
            
            
            
            CtrlCOBUtilCustomerOnboardingRequest cob=new CtrlCOBUtilCustomerOnboardingRequest();
            cob.CopyDestinationToApprovedCreditData();
            
            cob.populateRequestorInformation();
            cob.SendforReviewComments();
            
            cob.DMSProfile=true;
            cob.OnboardingReq.Request_Initiator__c=null;
            cob.SaveAndSubmit();
            
            cob.CAProfile=true;
            cob.OnboardingReq.Request_Initiator__c=null;
            cob.FlagSaveDirectly=true;
            cob.openOtherGroupKey=true;
            cob.OnboardingReq.Approved_Credit_Limit__c='0';
            cob.OnboardingReq.Request_status__c ='Awaiting Credit Approval';
            
            cob.OnboardingReq.RecordTypeId=NewCustomerCreation_COB_RTYPE;
            cob.SaveAndSubmit();
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Destination Credit Approval';
            //cob.OnboardingReq.Destination_Credit_limit__c='0';
            cob.SaveAndSubmit();
            
            cob.IsSaveOrSubmit='Save';
            cob.IsClone=false;
            //cob.ReqId=null;
            cob.SaveAndSubmit();
            cob.IsSaveOrSubmit='Submit';
            cob.SaveAndSubmit();
            
            //cob.RelatedlistItemsValidation();
            
            cob.Cancel();
            
            cob.PrepopulateCreditLimit();
            cob.OnboardingReq.Copy_Proposed_Credit_Data__c =true;
            cob.CopyProposedCreditData();
            
            cob.OnboardingReq.Copy_Proposed_Credit_Data__c =false;
            cob.CopyProposedCreditData();
            
            cob.CancelAndClose();
            cob.RedirectCancelAndClose();
            
            cob.OnboardingReq.Copy_Proposed_Data__c =false;
            cob.CopyProposedToDestinationCreditData();
            
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            cob.CopyProposedToDestinationCreditData();
            
            
            
            
            cob.populateCurrency();
            
            
            // OnboardingReq.RecordTypeId
            
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            ApexPages.currentPage().getParameters().put('SecondParam','param');
            cob.setApprovedCreditTermType();
            
            ApexPages.currentPage().getParameters().put('FourthParam','param');
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            cob.setDestinationCreditTermType();
            
            Id RecId1 = [Select Id, Name from RecordType where DeveloperName = 'Country_Rules_Record' limit 1].Id;  
            Business_Rules__c busRul1 = new Business_Rules__c();
            busRul1.Credit_Limit_Lower__c=101;
            busRul1.Credit_Limit_Upper__c=500;
            busRul1.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            
            busRul1.recordTypeId=RecId1;
            insert busRul1;
            
            
            Id RecId2 = [Select Id, Name from RecordType where DeveloperName = 'DOA_Rules' limit 1].Id;  
            Business_Rules__c busRul2 = new Business_Rules__c();
            busRul2.Credit_Limit_Lower__c=102;
            busRul2.Credit_Limit_Upper__c=500;
            busRul2.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            //busRul2.CDR_Record_type__c='New Customer Creation';
            busRul2.recordTypeId=RecId2;
            insert busRul2;
            cob.RequestFlow(); 
            
            Id RecId3 = [Select Id, Name from RecordType where DeveloperName = 'Country_Credit_Analyst_Notification' limit 1].Id;  
            Business_Rules__c busRul3 = new Business_Rules__c();
            busRul3.Credit_Limit_Lower__c=102;
            busRul3.Credit_Limit_Upper__c=500;
            busRul3.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            //busRul3.CDR_Record_type__c='New Customer Creation';
            busRul3.recordTypeId=RecId2;
            insert busRul3;
            cob.RequestFlow();           
            
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Credit Approval';   
            cob.CurrencyInDollar='200'; 
            
            
            cob.OnboardingReq.Destination_Credit_Approver__c='Rupesh Agrawala';
            cob.OnboardingReq.Company_Code__c='0003 - E.I. DuPont India Private Limited';
            cob.CSRReview=true;
            cob.RequestFlow();
            
            cob.CSRReview=false;
            cob.OnboardingReq.Request_status__c ='Awaiting Destination Credit Approval';
            cob.RequestFlow();
            
            
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Credit Approval';
            
            //cob.IsDOAApprovalRequired=true;
            //cob.IsDcaNDoaApproverSame =false;
            cob.RequestFlow();
            
            cob.OnboardingReq.Request_status__c= 'Awaiting Data Analyst (DMS Team) Approval';
            cob.RequestFlow();
            
            cob.OnboardingReq.Request_status__c= 'Awaiting DOA Approval';
            cob.RequestFlow();
            
            cob.CAProfile=false;
            cob.DMSProfile=true;
            cob.isComplete=true;
            cob.RequestFlow();
            
            test.StopTest();
            
            cob.isComplete=false;
            cob.isReject=true;
            cob.RequestFlow();
            
            cob.isReject=false;
            cob.CAReview = true;
            cob.RequestFlow();
            
            
            
            cob.CAReview =false;
            cob.CSRReview =true;
            cob.RequestFlow();
            
            
            
            /*cob.isReject=true;
cob.CAReview =true;
cob.CSRReview =true;
cob.RequestFlow();
            
        }
        
    }
    
    static testmethod void CustomerOnboardingRequest3(){
        List<Business_Rules__c> brlist = new List<Business_Rules__c>();
        Business_Rules__c br = new Business_Rules__c();
        br.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
        br.selling_company_code__c ='0003 - E.I. DuPont India Private Limited';
        br.Sold_to_Country__c = 'IN - India';
        br.Destination_Queue__c = 'Customer On-boarding CA - India Queue';
        br.CDR_Request_Status__c = 'Awaiting Credit Approval';
        brlist.add(br);
        insert brlist;
        
        User us2 = new user();
        us2.profileId = [Select Id,Name from Profile where Name ='Credit Process Managers' limit 1][0].id;
        us2.firstname='Rupesh'; 
        us2.lastname='Agrawala';
        us2.alias = 'standt'; 
        us2.email='standarduser66@testorg.com';
        us2.emailencodingkey='UTF-8';
        us2.languagelocalekey='en_US';
        us2.localesidkey='en_US';
        us2.timezonesidkey='America/Los_Angeles';
        us2.username='standarduser66@testorg.com';
        insert us2;
        
        
        User us3 = new user();
        us3.profileId = [Select Id,Name from Profile where Name ='Credit Analyst' limit 1][0].id;
        us3.firstname='Mayank'; 
        us3.lastname='Pat2';
        us3.alias = 'standt2'; 
        us3.email='standarduser8@testorg.com';
        us3.emailencodingkey='UTF-8';
        us3.languagelocalekey='en_US';
        us3.localesidkey='en_US';
        us3.timezonesidkey='America/Los_Angeles';
        us3.username='standarduser8@testorg.com';
        insert us3;    
        
        //<AB20210301> Moved Block out of runas because Group is not writable for Credit Analyst. Taken reference from CustomerOnboardingRequest6 Method
         List<Group> grlist = new List<Group>();
            Group testGroup = new Group();
            testGroup.Name = 'testGroup';
            testGroup.DeveloperName = 'ABC';
            testGroup.type = 'Queue';
            INSERT testGroup;
        //<AB20210301>
        
        User runUser = [select id from user where isactive = true and 
                        (profileId = :[Select id from profile where name = 'Credit Analyst']) limit 1];
        System.runAs(runUser){
            
           
            grlist.add(testGroup);
            
            List<GroupMember> GMlist = new List<GroupMember>();
            GroupMember gm = new GroupMember();
            gm.GroupId = testGroup.ID;
            gm.UserOrGroupId = runUser.ID;
            gmList.add(gm);
            
            
            
            
            Customer_Data_Request__c cdr1 = new Customer_Data_Request__c();
            Id RecId = [Select Id, Name from RecordType where DeveloperName = 'New_Customer_Creation' limit 1].Id;    
            
            cdr1.Requestor_Name__c = UserInfo.getUserId();
            cdr1.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            cdr1.SF_Region__c ='Asia Pacific';
            cdr1.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
            cdr1.Distribution_Channel__c = '10-Dupont Std';
            cdr1.Account_Group__c='Z001(Sold-to Party)';
            cdr1.Division__c = '01-Product Division 01';
            cdr1.Customer_Name__c='Test Customer1';
            cdr1.Sold_to_Street__c='Walters Street';
            cdr1.Sold_to_City__c='New Jersey';
            cdr1.Sold_to_Country__c ='IN - India';
            cdr1.Sold_to_e_mail__c='sam1@gmail.com';
            //cdr1.Customer_Contact_Name__c='Test1';
            //cdr1.Customer_Contact_Telephone__c='123232323';
            cdr1.Default_Incoterms_2__c='Test Term';
            cdr1.Estimated_Average_Monthly_Purchases__c=100;
            cdr1.Estimated_Number_of_Orders_per_Month__c=20;
            cdr1.Registration_number__c='458889';
            cdr1.Sold_To_Office_House_Number__c = '124';
            cdr1.Sold_to_State_Province__c ='Michigun';
            cdr1.Proposed_Cash_Management_Group__c = 'FC - Receivables in foreign currency';
            cdr1.Proposed_Cred_rep_grp__c = '00P-Sabine Combrink';
            cdr1.Proposed_credit_information_number__c = 100;
            cdr1.Proposed_Credit_Limit__c='100';
            cdr1.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            cdr1.Proposed_Credit_Term_Type__c='Cash In Advance';
            cdr1.Proposed_Customer_credit_group__c = 'A100 : COMPOSITES';
            cdr1.Proposed_Non_Standard_Terms_of_Payment__c = '15 PROX';   
            cdr1.Proposed_Payment_Index__c = 1234;
            cdr1.Proposed_Rating__c = 'Star';
            cdr1.Proposed_Reference_date__c = date.newInstance(2014, 11, 21);
            cdr1.Proposed_Risk_Category__c = '102 - Automatic Approval';
            cdr1.Proposed_Terms_of_Payment__c = 'Others';
            cdr1.Request_Status__c = 'Awaiting Credit Approval';
            cdr1.Approved_Credit_Limit__c = '2000';
            cdr1.Destination_Credit_limit__c = '3000';
            cdr1.Proposed_Credit_Limit__c = '586';
            cdr1.Preferred_Bank_Name__c = 'Other';
            cdr1.Record_Locked__c=false;
            cdr1.Relevant_for_POD__c=false; 
            cdr1.Approved_Terms_of_Payment__c='Cash In Advance';
            cdr1.Destination_Terms_of_Payment__c='Cash In Advance';
            cdr1.Copy_Proposed_Credit_Data__c=true;
            cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Customer_Group__c='Z00';  
            cdr1.Approved_Risk_Category__c='null';
            cdr1.Copy_Proposed_Data__c=true;
            cdr1.Destination_risk_category__c='NA';
            //cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Credit_Term_Type__c='Cash';
            
            cdr1.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
            cdr1.recordtypeid = recid;
            insert cdr1;
            
            
            
            // ApexPages.currentPage().getParameters().put('currentURLParameters',cdr1.id) ;
            ApexPages.currentPage().getParameters().put('id',cdr1.id) ;
            ApexPages.currentPage().getParameters().put('RecordTypeId',NewCustomerCreation_COB_RTYPE ) ;
            ApexPages.currentPage().getParameters().put('Clone','null') ;
            
            Id RecId1 = [Select Id, Name from RecordType where DeveloperName = 'Country_Rules_Record' limit 1].Id;  
            Business_Rules__c busRul1 = new Business_Rules__c();
            busRul1.Credit_Limit_Lower__c=101;
            busRul1.Credit_Limit_Upper__c=500;
            busRul1.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            
            busRul1.recordTypeId=RecId1;
            insert busRul1;
            
            
            Id RecId2 = [Select Id, Name from RecordType where DeveloperName = 'DOA_Rules' limit 1].Id;  
            Business_Rules__c busRul2 = new Business_Rules__c();
            busRul2.Credit_Limit_Lower__c=102;
            busRul2.Credit_Limit_Upper__c=500;
            busRul2.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            //busRul2.CDR_Record_type__c='New Customer Creation';
            busRul2.recordTypeId=RecId2;
            insert busRul2;
            
            
            Id RecId3 = [Select Id, Name from RecordType where DeveloperName = 'Country_Credit_Analyst_Notification' limit 1].Id;  
            Business_Rules__c busRul3 = new Business_Rules__c();
            busRul3.Credit_Limit_Lower__c=102;
            busRul3.Credit_Limit_Upper__c=500;
            busRul3.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            //busRul3.CDR_Record_type__c='New Customer Creation';
            busRul3.recordTypeId=RecId2;
            insert busRul3;
            
            test.StartTest();
            CtrlCOBUtilCustomerOnboardingRequest cob=new CtrlCOBUtilCustomerOnboardingRequest();
            cob.CopyDestinationToApprovedCreditData();
            
            cob.populateRequestorInformation();
            cob.SendforReviewComments();
            
            cob.DMSProfile=false;
            boolean countryFlag=false;
            boolean IsDOAApprovalRequired=false;
            boolean IsDcaNDoaApproverSame=false;
            boolean IsDcaNCaApproverSame=true;
            
            cob.OnboardingReq.Request_Initiator__c=null;
            cob.SaveAndSubmit();
            
            cob.CAProfile=false;
            cob.OnboardingReq.Request_Initiator__c=null;
            cob.FlagSaveDirectly=true;
            cob.openOtherGroupKey=true;
            cob.OnboardingReq.Approved_Credit_Limit__c='0';
            cob.OnboardingReq.Request_status__c ='Awaiting Credit Approval';
            
            cob.OnboardingReq.RecordTypeId=NewCustomerCreation_COB_RTYPE;
            cob.SaveAndSubmit();
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Destination Credit Approval';
            //cob.OnboardingReq.Destination_Credit_limit__c='0';
            cob.SaveAndSubmit();
            
            cob.IsSaveOrSubmit='Save';
            cob.IsClone=false;
            //cob.ReqId=null;
            cob.SaveAndSubmit();
            cob.IsSaveOrSubmit='Submit';
            cob.SaveAndSubmit();
            
            //cob.RelatedlistItemsValidation();
            
            cob.Cancel();
            
            cob.PrepopulateCreditLimit();
            cob.OnboardingReq.Copy_Proposed_Credit_Data__c =true;
            cob.CopyProposedCreditData();
            
            cob.OnboardingReq.Copy_Proposed_Credit_Data__c =false;
            cob.CopyProposedCreditData();
            
            cob.CancelAndClose();
            cob.RedirectCancelAndClose();
            
            cob.OnboardingReq.Copy_Proposed_Data__c =false;
            cob.CopyProposedToDestinationCreditData();
            
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            cob.CopyProposedToDestinationCreditData();
            
            
            
            
            cob.populateCurrency();
            
            
            // OnboardingReq.RecordTypeId
            
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            ApexPages.currentPage().getParameters().put('SecondParam','param');
            cob.setApprovedCreditTermType();
            
            ApexPages.currentPage().getParameters().put('FourthParam','param');
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            cob.setDestinationCreditTermType();
            
            
            cob.RequestFlow();           
            
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Credit Approval';   
            cob.CurrencyInDollar='200'; 
            
            
            cob.OnboardingReq.Destination_Credit_Approver__c='Rupesh Agrawala';
            cob.OnboardingReq.Company_Code__c='0003 - E.I. DuPont India Private Limited';
            cob.CSRReview=true;
            cob.RequestFlow();
            
            cob.CSRReview=false;
            cob.OnboardingReq.Request_status__c ='Awaiting Destination Credit Approval';
            cob.RequestFlow();
            
            
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Credit Approval';
            
            //cob.IsDOAApprovalRequired=true;
            //cob.IsDcaNDoaApproverSame =false;
            cob.RequestFlow();
            
            cob.OnboardingReq.Request_status__c= 'Awaiting Data Analyst (DMS Team) Approval';
            cob.RequestFlow();
            
            cob.OnboardingReq.Request_status__c= 'Awaiting DOA Approval';
            cob.RequestFlow();
            
            cob.CAProfile=false;
            cob.DMSProfile=true;
            cob.isComplete=true;
            cob.RequestFlow();
            
            test.StopTest();
            
            cob.isComplete=false;
            cob.isReject=true;
            cob.RequestFlow();
            
            cob.isReject=false;
            cob.CAReview = true;
            cob.RequestFlow();
            
            
            
            cob.CAReview =false;
            cob.CSRReview =true;
            cob.RequestFlow();
            
            
            
            /*cob.isReject=true;
cob.CAReview =true;
cob.CSRReview =true;
cob.RequestFlow();
            
        }
        
    }
    
    static testmethod void CustomerOnboardingRequest5(){
        List<Business_Rules__c> brlist = new List<Business_Rules__c>();
        Business_Rules__c br = new Business_Rules__c();
        br.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
        br.selling_company_code__c ='0003 - E.I. DuPont India Private Limited';
        br.Sold_to_Country__c = 'IN - India';
        br.Destination_Queue__c = 'Customer On-boarding CA - India Queue';
        brlist.add(br);
        /*Business_Rules__c br1 = new Business_Rules__c();
br1.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br1.selling_company_code__c ='0078 - ELECT. MATLS DUP DONGGUAN';
br1.Sold_to_Country__c = 'CN - China';
brlist.add(br1);
Business_Rules__c br2 = new Business_Rules__c();
br2.recordtypeid = CompanyCodeCountry_Rule_Rtype ;
br2.selling_company_code__c ='0029 - DU PONT CHINA LIMITED';
br2.Sold_to_Country__c = 'HK - Hong Kong';
brlist.add(br2); 
        insert brlist;
        
        User us3 = new user();
        us3.profileId = [Select Id,Name from Profile where Name ='Credit Process Managers' limit 1][0].id;
        us3.firstname='Rupesh'; 
        us3.lastname='Agrawala';
        us3.alias = 'standt'; 
        us3.email='standarduser66@testorg.com';
        us3.emailencodingkey='UTF-8';
        us3.languagelocalekey='en_US';
        us3.localesidkey='en_US';
        us3.timezonesidkey='America/Los_Angeles';
        us3.username='standarduser66@testorg.com';
        insert us3;
        
        User us4 = new user();
        us4.profileId = [Select Id,Name from Profile where Name ='Credit Analyst' limit 1][0].id;
        us4.firstname='Mayank'; 
        us4.lastname='Pat4';
        us4.alias = 'standt4'; 
        us4.email='standarduser9@testorg.com';
        us4.emailencodingkey='UTF-8';
        us4.languagelocalekey='en_US';
        us4.localesidkey='en_US';
        us4.timezonesidkey='America/Los_Angeles';
        us4.username='standarduser9.new@testorg.com';//<AB20210301> Old Value: standarduser9@testorg.com
        insert us4;       
        
        
        User runUser = [select id from user where isactive = true and 
                        (profileId = :[Select id from profile where name = 'Credit Analyst']) limit 1];
        System.runAs(runUser){
            
            
            
            test.StartTest();
            
            
            
            Customer_Data_Request__c cdr1 = new Customer_Data_Request__c();
            Id RecId = [Select Id, Name from RecordType where DeveloperName = 'New_Customer_Creation' limit 1].Id;    
            
            cdr1.Requestor_Name__c = UserInfo.getUserId();
            cdr1.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            cdr1.SF_Region__c ='Asia Pacific';
            cdr1.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
            cdr1.Distribution_Channel__c = '10-Dupont Std';
            cdr1.Account_Group__c='Z001(Sold-to Party)';
            cdr1.Division__c = '01-Product Division 01';
            cdr1.Customer_Name__c='Test Customer1';
            cdr1.Sold_to_Street__c='Walters Street';
            cdr1.Sold_to_City__c='New Jersey';
            cdr1.Sold_to_Country__c ='IN - India';
            cdr1.Sold_to_e_mail__c='sam1@gmail.com';
            //cdr1.Customer_Contact_Name__c='Test1';
            //cdr1.Customer_Contact_Telephone__c='123232323';
            cdr1.Default_Incoterms_2__c='Test Term';
            cdr1.Estimated_Average_Monthly_Purchases__c=100;
            cdr1.Estimated_Number_of_Orders_per_Month__c=20;
            cdr1.Registration_number__c='458889';
            cdr1.Sold_To_Office_House_Number__c = '124';
            cdr1.Sold_to_State_Province__c ='Michigun';
            cdr1.Proposed_Cash_Management_Group__c = 'FC - Receivables in foreign currency';
            cdr1.Proposed_Cred_rep_grp__c = '00P-Sabine Combrink';
            cdr1.Proposed_credit_information_number__c = 100;
            cdr1.Proposed_Credit_Limit__c='100';
            cdr1.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            cdr1.Proposed_Credit_Term_Type__c='Cash In Advance';
            cdr1.Proposed_Customer_credit_group__c = 'A100 : COMPOSITES';
            cdr1.Proposed_Non_Standard_Terms_of_Payment__c = '15 PROX';   
            cdr1.Proposed_Payment_Index__c = 1234;
            cdr1.Proposed_Rating__c = 'Star';
            cdr1.Proposed_Reference_date__c = date.newInstance(2014, 11, 21);
            cdr1.Proposed_Risk_Category__c = '102 - Automatic Approval';
            cdr1.Proposed_Terms_of_Payment__c = 'Others';
            cdr1.Request_Status__c = 'Awaiting Credit Approval';
            cdr1.Approved_Credit_Limit__c = '2000';
            cdr1.Destination_Credit_limit__c = '3000';
            cdr1.Proposed_Credit_Limit__c = '586';
            cdr1.Preferred_Bank_Name__c = 'Other';
            cdr1.Record_Locked__c=false;
            cdr1.Relevant_for_POD__c=false; 
            cdr1.Approved_Terms_of_Payment__c='Cash In Advance';
            cdr1.Destination_Terms_of_Payment__c='Cash In Advance';
            cdr1.Copy_Proposed_Credit_Data__c=true;
            cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Customer_Group__c='Z00';  
            cdr1.Approved_Risk_Category__c='null';
            cdr1.Copy_Proposed_Data__c=true;
            cdr1.Destination_risk_category__c='NA';
            //cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Credit_Term_Type__c='Cash';
            
            cdr1.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
            cdr1.recordtypeid = recid;
            insert cdr1;
            
            
            
            // ApexPages.currentPage().getParameters().put('currentURLParameters',cdr1.id) ;
            ApexPages.currentPage().getParameters().put('id',cdr1.id) ;
            ApexPages.currentPage().getParameters().put('RecordTypeId',NewCustomerCreation_COB_RTYPE ) ;
            ApexPages.currentPage().getParameters().put('Clone','null') ;
            
            
            
            CtrlCOBUtilCustomerOnboardingRequest cob=new CtrlCOBUtilCustomerOnboardingRequest();
            cob.CopyDestinationToApprovedCreditData();
            
            cob.populateRequestorInformation();
            cob.SendforReviewComments();
            
            cob.DMSProfile=true;
            cob.OnboardingReq.Request_Initiator__c=null;
            cob.SaveAndSubmit();
            
            cob.CAProfile=true;
            cob.OnboardingReq.Request_Initiator__c=null;
            cob.FlagSaveDirectly=true;
            cob.openOtherGroupKey=true;
            cob.OnboardingReq.Approved_Credit_Limit__c='0';
            cob.OnboardingReq.Request_status__c ='Awaiting Credit Approval';
            
            cob.OnboardingReq.RecordTypeId=NewCustomerCreation_COB_RTYPE;
            cob.SaveAndSubmit();
            boolean IsDcaNCaApproverSame = true;
            boolean IsDcaNDoaApproverSame = true;
            boolean IsDOAApprovalRequired = false;
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Destination Credit Approval';
            //cob.OnboardingReq.Destination_Credit_limit__c='0';
            cob.SaveAndSubmit();
            
            cob.IsSaveOrSubmit='Save';
            cob.IsClone=false;
            //cob.ReqId=null;
            cob.SaveAndSubmit();
            cob.IsSaveOrSubmit='Submit';
            cob.SaveAndSubmit();
            
            //cob.RelatedlistItemsValidation();
            
            cob.Cancel();
            
            cob.PrepopulateCreditLimit();
            cob.OnboardingReq.Copy_Proposed_Credit_Data__c =true;
            cob.CopyProposedCreditData();
            
            cob.OnboardingReq.Copy_Proposed_Credit_Data__c =false;
            cob.CopyProposedCreditData();
            
            cob.CancelAndClose();
            cob.RedirectCancelAndClose();
            
            cob.OnboardingReq.Copy_Proposed_Data__c =false;
            cob.CopyProposedToDestinationCreditData();
            
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            cob.CopyProposedToDestinationCreditData();
            
            
            
            
            cob.populateCurrency();
            
            
            // OnboardingReq.RecordTypeId
            
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            ApexPages.currentPage().getParameters().put('SecondParam','param');
            cob.setApprovedCreditTermType();
            
            ApexPages.currentPage().getParameters().put('FourthParam','param');
            cob.OnboardingReq.Copy_Proposed_Data__c =true;
            cob.setDestinationCreditTermType();
            
            Id RecId1 = [Select Id, Name from RecordType where DeveloperName = 'Country_Rules_Record' limit 1].Id;  
            Business_Rules__c busRul1 = new Business_Rules__c();
            busRul1.Credit_Limit_Lower__c=101;
            busRul1.Credit_Limit_Upper__c=500;
            busRul1.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            
            busRul1.recordTypeId=RecId1;
            insert busRul1;
            
            
            Id RecId2 = [Select Id, Name from RecordType where DeveloperName = 'DOA_Rules' limit 1].Id;  
            Business_Rules__c busRul2 = new Business_Rules__c();
            busRul2.Credit_Limit_Lower__c=102;
            busRul2.Credit_Limit_Upper__c=500;
            busRul2.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            //busRul2.CDR_Record_type__c='New Customer Creation';
            busRul2.recordTypeId=RecId2;
            insert busRul2;
            cob.RequestFlow(); 
            
            Id RecId3 = [Select Id, Name from RecordType where DeveloperName = 'Country_Credit_Analyst_Notification' limit 1].Id;  
            Business_Rules__c busRul3 = new Business_Rules__c();
            busRul3.Credit_Limit_Lower__c=102;
            busRul3.Credit_Limit_Upper__c=500;
            busRul3.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            //busRul3.CDR_Record_type__c='New Customer Creation';
            busRul3.recordTypeId=RecId2;
            insert busRul3;
            cob.RequestFlow();           
            
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Credit Approval';   
            cob.CurrencyInDollar='200'; 
            
            
            cob.OnboardingReq.Destination_Credit_Approver__c='Rupesh Agrawala';
            cob.OnboardingReq.Company_Code__c='0003 - E.I. DuPont India Private Limited';
            cob.CSRReview=true;
            cob.RequestFlow();
            
            cob.CSRReview=false;
            cob.OnboardingReq.Request_status__c ='Awaiting Destination Credit Approval';
            cob.RequestFlow();
            
            
            
            cob.OnboardingReq.Request_status__c = 'Awaiting Credit Approval';
            
            //cob.IsDOAApprovalRequired=true;
            //cob.IsDcaNDoaApproverSame =false;
            cob.RequestFlow();
            
            cob.OnboardingReq.Request_status__c= 'Awaiting Data Analyst (DMS Team) Approval';
            cob.RequestFlow();
            
            cob.OnboardingReq.Request_status__c= 'Awaiting DOA Approval';
            cob.RequestFlow();
            
            cob.CAProfile=false;
            cob.DMSProfile=true;
            cob.isComplete=true;
            cob.RequestFlow();
            
            test.StopTest();
            
            cob.isComplete=false;
            cob.isReject=true;
            cob.RequestFlow();
            
            cob.isReject=false;
            cob.CAReview = true;
            cob.RequestFlow();
            
            
            
            cob.CAReview =false;
            cob.CSRReview =true;
            cob.RequestFlow();
            
            
            
            /*cob.isReject=true;
cob.CAReview =true;
cob.CSRReview =true;
cob.RequestFlow();
            
        }
        
    }
    
    
    static testmethod void CustomerOnboardingRequest1(){
        test.StartTest();
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Credit Analyst']; 
        User u = new User(Alias = 'standt45', Email='1@testorg.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing1212', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='1@testorg.com');
        
        System.runAs(u){
            
            ApexPages.currentPage().getParameters().put('id','null') ;
            ApexPages.currentPage().getParameters().put('Clone','null');
            
            CtrlCOBUtilCustomerOnboardingRequest cob1=new CtrlCOBUtilCustomerOnboardingRequest();
            
            cob1.IsSaveOrSubmit='Save';
            cob1.IsClone=false;
            cob1.ReqId=null;
            cob1.SaveAndSubmit();
            
            cob1.IsSaveOrSubmit='Submit';
            cob1.SaveAndSubmit();
            
            
            
            
            
            
            test.StopTest();
        }
    }
    
    static testmethod void CustomerOnboardingRequest2(){
        test.StartTest();
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Data Analyst']; 
        User u = new User(Alias = 'standt45', Email='1@testorg.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing1212', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='1@testorg.com');
        
        System.runAs(u){
            
            ApexPages.currentPage().getParameters().put('id','null') ;
            
            
            CtrlCOBUtilCustomerOnboardingRequest cob2=new CtrlCOBUtilCustomerOnboardingRequest();
            
            
            
            
        }
    }
    
    static testmethod void CustomerOnboardingRequest6(){
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Credit Analyst']; 
        User u = new User(Alias = 'standt45', Email='1@testorg.com', 
                          EmailEncodingKey='UTF-8', LastName='Testing1212', LanguageLocaleKey='en_US', 
                          LocaleSidKey='en_US', ProfileId = p.Id, 
                          TimeZoneSidKey='America/Los_Angeles', UserName='1@testorg.com');
        insert u;
        
        Group testGroup = new Group();
        testGroup.Name = 'testq';
        testGroup.DeveloperName = 'testq';
        testGroup.type = 'Queue';
        INSERT testGroup;
        
        
        
        GroupMember gm = new GroupMember();
        gm.GroupId = testGroup.ID;
        gm.UserOrGroupId = u.ID;
        insert gm;
        System.runAs(u){
            test.StartTest();
            Customer_Data_Request__c cdr1 = new Customer_Data_Request__c();
            Id RecId = [Select Id, Name from RecordType where DeveloperName = 'New_Customer_Creation' limit 1].Id;    
            
            cdr1.Requestor_Name__c = UserInfo.getUserId();
            cdr1.Requestor_Email__c = 'harjeet_singh04@infosys.com';
            cdr1.SF_Region__c ='Asia Pacific';
            cdr1.Company_Code__c = '0003 - E.I. DuPont India Private Limited';
            cdr1.Distribution_Channel__c = '10-Dupont Std';
            cdr1.Account_Group__c='Z001(Sold-to Party)';
            cdr1.Division__c = '01-Product Division 01';
            cdr1.Customer_Name__c='Test Customer1';
            cdr1.Sold_to_Street__c='Walters Street';
            cdr1.Sold_to_City__c='New Jersey';
            cdr1.Sold_to_Country__c ='IN - India';
            cdr1.Sold_to_e_mail__c='sam1@gmail.com';
            //cdr1.Customer_Contact_Name__c='Test1';
            //cdr1.Customer_Contact_Telephone__c='123232323';
            cdr1.Default_Incoterms_2__c='Test Term';
            cdr1.Estimated_Average_Monthly_Purchases__c=100;
            cdr1.Estimated_Number_of_Orders_per_Month__c=20;
            cdr1.Registration_number__c='458889';
            cdr1.Sold_To_Office_House_Number__c = '124';
            cdr1.Sold_to_State_Province__c ='Michigun';
            cdr1.Proposed_Cash_Management_Group__c = 'FC - Receivables in foreign currency';
            cdr1.Proposed_Cred_rep_grp__c = '00P-Sabine Combrink';
            cdr1.Proposed_credit_information_number__c = 100;
            cdr1.Proposed_Credit_Limit__c='100';
            cdr1.Proposed_Credit_Limit_Currency_Code__c='USD-American Dollar';
            cdr1.Proposed_Credit_Term_Type__c='Cash In Advance';
            cdr1.Proposed_Customer_credit_group__c = 'A100 : COMPOSITES';
            cdr1.Proposed_Non_Standard_Terms_of_Payment__c = '15 PROX';   
            cdr1.Proposed_Payment_Index__c = 1234;
            cdr1.Proposed_Rating__c = 'Star';
            cdr1.Proposed_Reference_date__c = date.newInstance(2014, 11, 21);
            cdr1.Proposed_Risk_Category__c = '102 - Automatic Approval';
            cdr1.Proposed_Terms_of_Payment__c = 'Others';
            cdr1.Request_Status__c = 'Awaiting Credit Approval';
            cdr1.Approved_Credit_Limit__c = '2000';
            cdr1.Destination_Credit_limit__c = '3000';
            cdr1.Proposed_Credit_Limit__c = '586';
            cdr1.Preferred_Bank_Name__c = 'Other';
            cdr1.Record_Locked__c=false;
            cdr1.Relevant_for_POD__c=false; 
            cdr1.Approved_Terms_of_Payment__c='Cash In Advance';
            cdr1.Destination_Terms_of_Payment__c='Cash In Advance';
            cdr1.Copy_Proposed_Credit_Data__c=true;
            cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Customer_Group__c='Z00';  
            cdr1.Approved_Risk_Category__c='null';
            cdr1.Copy_Proposed_Data__c=true;
            cdr1.Destination_risk_category__c='NA';
            //cdr1.Proposed_Customer_Group__c='Z00';
            cdr1.Approved_Credit_Term_Type__c='Cash';
            
            cdr1.Request_Status__c='Awaiting Destination Credit Approval';
            cdr1.recordtypeid = recid;
            insert cdr1;
            
            Business_Rules__c busRul1 = new Business_Rules__c();
            busRul1.recordtypeid=country_Rules_RTYPE ;
            busRul1.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            busRul1.CDR_Request_Status__c = 'Awaiting Credit Approval';
            busRul1.Destination_Queue__c ='testq';
            
            insert busRul1;
            
            Business_Rules__c busRul2 = new Business_Rules__c();
            busRul2.recordtypeid=doa_Rules_RTYPE ;
            busRul2.Selling_Company_Code__c='0003 - E.I. DuPont India Private Limited';
            busRul2.CDR_Request_Status__c = 'Awaiting Credit Approval';
            busRul2.Destination_Queue__c ='testq';
            busRul2.Credit_Limit_Lower__c = 100;
            busRul2.Credit_Limit_Upper__c= 500;
            insert busRul2;
            
            
            
            
            
            
            
            
            
            CtrlCOBUtilCustomerOnboardingRequest cob1=new CtrlCOBUtilCustomerOnboardingRequest();
            cob1.OnboardingReq= cdr1;
            cob1.IsSaveOrSubmit = 'Submit';
            cob1.IsClone = false;
            cob1.ReqId = cdr1.id;
            cob1.SaveAndSubmit();
            
            cob1.OnboardingReq.Request_Status__c = 'Awaiting Credit Approval';
            cob1.OnboardingReq.Proposed_Credit_Limit__c = '200';
            cob1.OnboardingReq.Approved_Credit_Limit__c ='200';
            cob1.OnboardingReq.Approved_Credit_Limit_Currency_Code__c='USD-American Dollar';
            cob1.SaveAndSubmit();
            
            CtrlCOBUtilCustomerOnboardingRequest cob2=new CtrlCOBUtilCustomerOnboardingRequest();
            cob2.OnboardingReq= cdr1;
            cob2.IsSaveOrSubmit = 'Submit';
            cob2.IsClone = false;
            cob2.ReqId = cdr1.id;
            cob2.OnboardingReq.Request_Status__c = 'Awaiting Credit Approval';
            cob2.OnboardingReq.Proposed_Credit_Limit__c = '2';
            cob2.OnboardingReq.Approved_Credit_Limit__c ='2';
            cob2.SaveAndSubmit();
        }
        test.StopTest();
    }*/
}