/*******************************************************************************
Copyright © 2015 DuPont. All rights reserved. 
Author: Nishant Chopra
Email: nishant_chopra01@infosys.com
Description:  Controller for page: COB_KPISummaryDashboard_new
Change History : Alvin Johnson (alvin_johnson@infosys.com) Added code for R02 Enhancement  
                 <Alvin20150824> 
 ********************************************************************************/ 
public class ctrlCOBUtilKPISummaryDashboard
{  
    public date myDate{get;set;}
    public date startDate{get;set;}
    public date EndDate{get;set;}
    String companyCodeList;
    String SBU;
    Set<ID> RecordTypeIds = new Set<ID>();
    String startCreatedDatequery = '';
    String endCreatedDatequery = '';
    String startLastModifiedDatequery = '';
    String endLastModifiedDatequery = '';
    
    public integer totalRequestCompleted{get;set;}
    public integer totalRequestCreated {get;set;}
    public integer totalRequestRejected{get;set;}
    public Decimal totalCompInFirstPass{get;set;} 
    public integer InprogressRequest{get;set;}
    public Decimal avgTimeToComplete{get;set;}
    public Decimal AvgTimeComplete{get;set;}
    public Decimal avgDataGatheringTime{get;set;}
    public Decimal avgDataGath{get;set;}
    public Decimal avgDestinationCreditTime{get;set;}
    public Decimal avgDCATime{get;set;}
    public Decimal avgCountryCreditTime{get;set;}
    public Decimal avgCountryCredTime{get;set;}
    public Decimal avgDOATime{get;set;}
    public Decimal averageDOATime{get;set;}
    public Decimal avgDMSTime{get;set;}
    public Decimal averageDMSTime{get;set;}
    public Decimal AvgInProcess{get;set;}
    public Decimal AvgProgress{get;set;}
    public Decimal longestInProgress{get;set;}
    public Decimal longInProgress{get;set;}
    public Decimal totalComplInThreeDays{get;set;}
    public Decimal ReqCompInThreeDays{get;set;}
    public Decimal ReqCompInFirstPass {get;set;}
    
    public String percentcompInThreeDays{get;set;}
    public String percentcompInFirstPass{get;set;}
    
    String countQuery1 = '';
    String check1= '';
    String check = '';
    String averageTotalCompletionquery = '';
    String averageDataGatheringquery = '';
    String averageDestinationCreditquery = '';
    String averageCountryCreditquery = '';
    String averageDOAquery = '';
    String averageDMSquery = '';
    String longestInProgressRecord = '';
    String FirstPass= '';
    
    String queryTotalComp = '';
    String queryTotalComplInThreeDays = '';
    String queryTotalCreated = '';
    String queryTotalRejected = '';
    String queryAvgComplete = '';
    String queryaverageDataGathering = '';
    String queryaverageDCA = '';
    String queryaverageCountryCredit = '';
    String queryDOA = '';
    String queryDMS = '';
    String querylongestinProgress = '';
    String queryAvgInprogressRequest ='';
    String queryTotalInprogressRequest = '';
    String queryFirstPass = '';
    
    public List<AggregateResult> avgComp{get;set;} 
    public List<AggregateResult> avgDataGathering{get;set;}
    public List<AggregateResult> avgDCA{get;set;}
    public List<AggregateResult> avgCountryCredit{get;set;}
    public List<AggregateResult> avgDeletionOfAuthority{get;set;}
    public List<AggregateResult> avgDMS{get;set;}
    public List<AggregateResult> avgInprogressRequest{get;set;}
    public List<AggregateResult> longestInProg{get;set;}
    public Customer_Data_Request__c OnboardingReq{get;set;}
    
    
    public ctrlCOBUtilKPISummaryDashboard() 
    {   
        OnboardingReq = new Customer_Data_Request__c();
        Id CustCrRecordTypeId= Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('New Customer Creation').getRecordTypeId();
        Id ExCustDataRecordTypeId= Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('Modify Existing Customer Data').getRecordTypeId();
        Id MiscustDataRecordTypeId= Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('Miscellaneous customer data request').getRecordTypeId();
        Id ExtendCustRecordTypeId= Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('Extend Existing Customer').getRecordTypeId();      
        Id PartnerFunRecordTypeId= Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('Create partner function/Link Contact/Link Existing Partner').getRecordTypeId();
        Id ModifyCreditDate= Schema.SObjectType.Customer_Data_Request__c.getRecordTypeInfosByName().get('Modify Credit Data').getRecordTypeId();
              
        RecordTypeIds.add(CustCrRecordTypeId);
        RecordTypeIds.add(ExCustDataRecordTypeId);
        RecordTypeIds.add(MiscustDataRecordTypeId);
        RecordTypeIds.add(ExtendCustRecordTypeId);
        RecordTypeIds.add(PartnerFunRecordTypeId);
        RecordTypeIds.add(ModifyCreditDate);
        DateSubmit();
        
   }
        public List<SelectOption> getSBUCode() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('--None--','--None--'));
            options.add(new SelectOption('A2 - DuPont Protection Technologies','A2 - DuPont Protection Technologies'));
            options.add(new SelectOption('A6 - Building Innovations','A6 - Building Innovations'));
            options.add(new SelectOption('AD - DuPont Protection Technologies','AD - DuPont Protection Technologies'));
            options.add(new SelectOption('B9 - DuPont Performance Polymers','B9 - DuPont Performance Polymers'));
            options.add(new SelectOption('C5 - Electronics and Communications','C5 - Electronics and Communications'));
            options.add(new SelectOption('D6 - Building Innovations','D6 - Building Innovations'));
            options.add(new SelectOption('D6 - DuPont Protection Technologies','D6 - DuPont Protection Technologies'));
            options.add(new SelectOption('F4 - Electronics and Communications','F4 - Electronics and Communications'));
            options.add(new SelectOption('F8 - DuPont Crop Protection','F8 - DuPont Crop Protection'));
            options.add(new SelectOption('F8 - Nutrition & Health','F8 - Nutrition & Health'));
            options.add(new SelectOption('G2 - Packaging & Industrial Polymers','G2 - Packaging & Industrial Polymers'));
            options.add(new SelectOption('G3 - DuPont Protection Technologies','G3 - DuPont Protection Technologies'));
            options.add(new SelectOption('I4 - DUPONT SAFETY RESOURCES BUSINESS','I4 - DUPONT SAFETY RESOURCES BUSINESS'));
            options.add(new SelectOption('K8 - Industrial Bioscience','K8 - Industrial Bioscience'));
            return options;
        }
            
        public String getSBU() {
            return SBU;
        }
        
        public void setSBU(String SBU) {
            this.SBU= SBU;
        }
        
      public List<SelectOption> getsellingCompanyCode() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('--None--','--None--'));
            options.add(new SelectOption('0003 - E.I. DuPont India Private Limited','0003 - E.I. DuPont India Private Limited'));
            options.add(new SelectOption('0029 - DU PONT CHINA LIMITED','0029 - DU PONT CHINA LIMITED'));
            options.add(new SelectOption('0078 - ELECT. MATLS DUP DONGGUAN','0078 - ELECT. MATLS DUP DONGGUAN'));
            options.add(new SelectOption('0218 - DuPont Trading Shanghai','0218 - DuPont Trading Shanghai'));
            options.add(new SelectOption('0701 - DUP AGRIC CHEM LTD','0701 - DUP AGRIC CHEM LTD'));
            options.add(new SelectOption('1131 - Du Pont China Holding Co.','1131 - Du Pont China Holding Co.'));
            options.add(new SelectOption('1132 - DuPont(China) RD and Mgmt','1132 - DuPont(China) RD and Mgmt'));
            options.add(new SelectOption('1142 - DUP SURFCE GUANGZHOU','1142 - DUP SURFCE GUANGZHOU'));
            options.add(new SelectOption('1210 - DUP (SHENZHEN) INDUS','1210 - DUP (SHENZHEN) INDUS'));
            options.add(new SelectOption('1310 - DuPont Apollo (Shenzhen)','1310 - DuPont Apollo (Shenzhen)'));//<Alvin20150824> Added 1310 selling company code for enhancement LE1310
            options.add(new SelectOption('2791 - Du Pont China Holding Co.','2791 - Du Pont China Holding Co.'));
            options.add(new SelectOption('4860 - DUP (Thailand) Ltd','4860 - DUP (Thailand) Ltd'));
            return options;
        }
            
        public String getcompanyCodeList() {
            return companyCodeList;
        }
        
        public void setcompanyCodeList(String companyCodeList) {
            this.companyCodeList= companyCodeList;
        }  
        
     
     public void DateSubmit()
     {
     startDate = OnboardingReq.Start_Date__c;
     endDate=OnboardingReq.End_Date__c;
     if(String.isBlank(companyCodeList)||companyCodeList == '--None--')
         companyCodeList= '%';
         
    if(String.isBlank(SBU)||SBU == '--None--')
         SBU= '%';
      
     countQuery1 = 'SELECT count() FROM Customer_Data_Request__c WHERE  (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND RecordTypeId IN :RecordTypeIds';
     averageTotalCompletionquery = 'SELECT AVG(Total_Completion_Time__c) aver FROM Customer_Data_Request__c WHERE (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND RecordTypeId IN :RecordTypeIds';  
     averageDataGatheringquery = 'SELECT AVG(Data_Draft_Gathering_Time__c) aver FROM Customer_Data_Request__c WHERE  (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND RecordTypeId IN :RecordTypeIds'; 
     averageDestinationCreditquery = 'SELECT AVG(DCA_Approval_Time__c) aver FROM Customer_Data_Request__c WHERE  (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND DCA_Approval_Time__c> 0 AND RecordTypeId IN :RecordTypeIds'; 
     averageCountryCreditquery = 'SELECT AVG(Credit_Approval_Time__c) aver FROM Customer_Data_Request__c WHERE  (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND Credit_Approval_Time__c> 0 AND RecordTypeId IN :RecordTypeIds'; 
     averageDOAquery = 'SELECT AVG(Escalated_Approval_Time__c) aver FROM Customer_Data_Request__c WHERE  (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND Escalated_Approval_Time__c> 0 AND RecordTypeId IN :RecordTypeIds'; 
     averageDMSquery = 'SELECT AVG(DMS_Approval_Time__c) aver FROM Customer_Data_Request__c WHERE (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND RecordTypeId IN :RecordTypeIds';  
      
     longestInProgressRecord = 'SELECT MAX(Total_Completion_Time__c) aver FROM Customer_Data_Request__c WHERE  (Company_Code__c like :companyCodeList OR Company_Code__c =  \'\') AND (SBU__c like :SBU OR SBU__c = \'\') AND RecordTypeId IN :RecordTypeIds';  
     FirstPass = ' AND Cycle_Count__c = 0';
     check = ' AND Total_Completion_Time__c <=3';
     
     if(startDate != null)
     {
         Date mystartDate = date.newinstance(startDate.year(), startDate.month(), startDate.day());
         startCreatedDatequery = ' AND DAY_ONLY(CreatedDate )>= :mystartDate';
         startLastModifiedDatequery = ' AND DAY_ONLY(LastModifiedDate)>= :mystartDate';
     }
     if(endDate != null)
     {
         Date myEndDate = date.newinstance(EndDate.year(), EndDate.month(), EndDate.day());
         endCreatedDatequery = ' AND DAY_ONLY(CreatedDate)<= :myEndDate';
         endLastModifiedDatequery = ' AND DAY_ONLY(LastModifiedDate)<= :myEndDate';
     }
    
    queryTotalCreated = countQuery1 + startCreatedDatequery + endCreatedDatequery ; 
    queryTotalComp = countQuery1  + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')';
    queryTotalComplInThreeDays= queryTotalComp + check ;
    queryFirstPass = countQuery1+ FirstPass + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')'; //<Alvin 07082015> Addded Request completed in SAP also
    queryTotalRejected = countQuery1 + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Rejected\')';
    queryAvgComplete = averageTotalCompletionquery  + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')';
    queryaverageDataGathering = averageDataGatheringquery + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')' +' AND (Request_Initiator__c != \'DMS Initiated\' AND Request_Initiator__c != \'CA Initiated\')';
    queryaverageDCA =  averageDestinationCreditquery + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')' ;
    queryaverageCountryCredit =  averageCountryCreditquery + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')';
    queryDOA = averageDOAquery + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')';
    queryDMS = averageDMSquery + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c = \'Closed\' OR Request_Status__c = \'Request Completed in SAP\')';
    querylongestinProgress = longestInProgressRecord + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c != \'Closed\' AND Request_Status__c != \'Rejected\' AND Request_Status__c != \'Request Completed in SAP\')'; 
    queryTotalInprogressRequest = countQuery1 + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c != \'Closed\' AND Request_Status__c != \'Rejected\' AND Request_Status__c != \'Request Completed in SAP\')'; 
    queryAvgInprogressRequest = averageTotalCompletionquery + startLastModifiedDatequery + endLastModifiedDatequery +' AND (Request_Status__c != \'Closed\' AND Request_Status__c != \'Rejected\' AND Request_Status__c != \'Request Completed in SAP\')'; 
    
     totalRequestCreated = database.countquery(queryTotalCreated);   
     totalRequestCompleted=database.countquery(queryTotalComp);
     totalComplInThreeDays=database.countquery(queryTotalComplInThreeDays);
     totalRequestRejected =database.countquery(queryTotalRejected );
     totalCompInFirstPass =database.countquery(queryFirstPass); 
     avgComp=database.query(queryAvgComplete);
     avgDataGathering=database.query(queryaverageDataGathering );
     avgDCA=database.query(queryaverageDCA);
     avgCountryCredit=database.query(queryaverageCountryCredit );
     avgDeletionOfAuthority=database.query(queryDOA);
     avgDMS=database.query(queryDMS);
     longestInProg=database.query(querylongestinProgress);
     InprogressRequest=database.countquery(queryTotalInprogressRequest );
     avgInprogressRequest=database.query(queryAvgInprogressRequest);     
     //Average Time to Complete
     if(avgComp!=null && avgComp.size()>0) 
        {
            for (AggregateResult ar : avgComp)
            {
            if(ar.get('aver')!=null){
                AvgTimeComplete = (Decimal)ar.get('aver');
                avgTimeToComplete= AvgTimeComplete.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    avgTimeToComplete=0;
                }       
            }
        }
        else{
            avgTimeToComplete=0;
        }
        //Average Time Data Gathering
     if(avgDataGathering!=null && avgDataGathering.size()>0  ) 
        {
            for (AggregateResult ar : avgDataGathering)
            {
            if(ar.get('aver')!=null){
                avgDataGath= (Decimal)ar.get('aver');
                avgDataGatheringTime= avgDataGath.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    avgDataGatheringTime=0;
                }       
            }
        }
        else{
            avgDataGatheringTime=0;
        }
       
       //Average Time Destination Credit
     if(avgDCA!=null && avgDCA.size()>0  ) 
        {
            for (AggregateResult ar : avgDCA)
            {
            if(ar.get('aver')!=null){
                avgDCATime= (Decimal)ar.get('aver');
                avgDestinationCreditTime= avgDCATime.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    avgDestinationCreditTime=0;
                }       
            }
        }
        else{
            avgDestinationCreditTime=0;
        }
        
        
        //Average Time Country Credit
     if(avgCountryCredit!=null && avgCountryCredit.size()>0  ) 
        {
            for (AggregateResult ar : avgCountryCredit)
            {
            if(ar.get('aver')!=null){
                avgCountryCredTime= (Decimal)ar.get('aver');
                avgCountryCreditTime= avgCountryCredTime.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    avgCountryCreditTime=0;
                }       
            }
        }
        else{
            avgCountryCreditTime=0;
        }
        
         //Average Time DOA Credit
     if(avgDeletionOfAuthority!=null && avgDeletionOfAuthority.size()>0  ) 
        {
            for (AggregateResult ar : avgDeletionOfAuthority)
            {
            if(ar.get('aver')!=null){
                averageDOATime= (Decimal)ar.get('aver');
                avgDOATime= averageDOATime.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    avgDOATime=0;
                }       
            }
        }
        else{
            avgDOATime=0;
        }
        
        
         //Average Time DMS
     if(avgDMS!=null && avgDMS.size()>0  ) 
        {
            for (AggregateResult ar : avgDMS)
            {
            if(ar.get('aver')!=null){
                averageDMSTime= (Decimal)ar.get('aver');
                avgDMSTime= averageDMSTime.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    avgDMSTime=0;
                }       
            }
        }
        else{
            avgDMSTime=0;
        }
        
        
     //Longest InProcess
     if(longestInProg!=null && longestInProg.size()>0  ) 
        {
            for (AggregateResult ar : longestInProg)
            {
            if(ar.get('aver')!=null){
                longInProgress = (Decimal)ar.get('aver');
                longestInProgress= longInProgress.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    longestInProgress=0;
                }       
            }
        }
        else{
            longestInProgress=0;
        }
        
      //Average InProcess
     if(avgInprogressRequest!=null && avgInprogressRequest.size()>0  ) 
        {
            for (AggregateResult ar : avgInprogressRequest)
            {
            if(ar.get('aver')!=null){
                AvgProgress = (Decimal)ar.get('aver');
                AvgInProcess= AvgProgress.setScale(4, RoundingMode.HALF_UP);  }  
                else{
                    AvgInProcess=0;
                }       
            }
        }
        else{
            AvgInProcess=0;
        } 
        
     //% Completed within 3 days AND % Completed in First Pass
     
     if(totalRequestCompleted != 0 && totalRequestCompleted!= null)
     {
         ReqCompInThreeDays = (totalComplInThreeDays/totalRequestCompleted)*100;
         percentcompInThreeDays=  string.valueOf(ReqCompInThreeDays.setScale(2))+'%';
         ReqCompInFirstPass = (totalCompInFirstPass /totalRequestCompleted)*100;
         percentcompInFirstPass=  string.valueOf(ReqCompInFirstPass.setScale(2))+'%';
     }  
     if(totalRequestCompleted == 0 )
     {
         percentcompInThreeDays= '0%';
         percentcompInFirstPass= '0%';
     }       
   }  
}