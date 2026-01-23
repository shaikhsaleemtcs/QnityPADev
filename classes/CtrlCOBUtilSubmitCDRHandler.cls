/*******************************************************************************
Copyright © 2014 DuPont. All rights reserved. 
Author: Nishant Chopra, Ashish Jain
Email: Nishant_Chopra01@infosys.com
Description:  Class will called from the trigger written on Customer Data Request Object which Extends Trigger Handler Base Class
Change History : Alvin Johnson (alvin_johnson@infosys.com) Added code for R02 Enhancement  
                 <Alvin20150824> 
               : Nishanth.H 15092015> Added for R02 enhancement-Updating selling company code value('1131 - DuPont (Shanghai) Sourcing Center Company, Ltd.')
               : <Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules 

22/22/2016 Merge&Spin: Added size check for list busCompanyRules on line no.144
 ********************************************************************************/ 
public with sharing class CtrlCOBUtilSubmitCDRHandler extends TriggerHandlerBase
{   
    list<Customer_Data_Request__c> dataReqList = new list<Customer_Data_Request__c>();
    list<Customer_Data_Request__c> dataReqList_update = new list<Customer_Data_Request__c>();

    public map<String,ID> queueMap = new map<String,Id>();
    //Fetch RecordTypes..
    public static final string NewCustomerCreation_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','New_Customer_Creation');
    public static final string Miscellaneous_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Miscellaneous_customer_data_request');
    public static final string Partner_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Create_partner_function_Link_Contact_Link_Existing_Partner');
    public static final string Country_Credit_Analyst_Notification_RTYPE = Rtype.getIdByDevName('Business_Rules__c','Country_Credit_Analyst_Notification');
    public static final string CompanyCodeCountry_Rule_Rtype = Rtype.getIdByDevName('Business_Rules__c','Country_Selling_Company_Code_Rules');//<Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules 
        
    /**
     * Name: runOnce
     * Params: None
     * Description: To stop the trigger Running Recursively. 
     */ 

    //To stop Running Recursively..
  @TestVisible  private static boolean run = true;// <Alvin20150623>
    public static boolean runOnce(){
        if(run){
            run=false;
            return true;
        }else{
            return run;
        }
    }

    /**
     * Name: bulkAfter
     * Params: None
     * Description: Method will be called if Trigger is Bulk and After. 
     */ 
    public override void bulkAfter()
    {   

        String ProfileName='';
        ProfileName=currentUserProfile();
        if(profileName !='' && (profileName =='System Administrator' || profileName =='SFDC UTIL CDR Integration Profile')){
            dataReqList = getRequestInformation((List<Customer_Data_Request__c>)Trigger.new);
            if(dataReqList.size()>0){
                for(Customer_Data_Request__c dataReq : dataReqList)
                {   
                    if(runOnce()){
                        fetchQueueMap();

                        if(Trigger.isInsert)
                            datareq.Back_Flow_To_DUPont__c=true;

                        submitRequest(dataReq);
                        dataReqList_update.add(dataReq);
                    }
                }
                if(dataReqList_update.size()>0)
                    update dataReqList_update;
            }
        }
    }

    /**
     * Name: currentUserProfile
     * Params: None
     * Description: Method to get profile of Current user.
     */ 
    public String currentUserProfile(){
        Id ProfileId = UserInfo.getProfileId();
        String profileName=[Select Id,Name from Profile where Id=:ProfileId].Name;
        return profileName;
    }


    /**
     * Name: fetchQueueMap
     * Params: None
     * Description: Method to fetch all the queues and create a map.
     */
    public void fetchQueueMap(){
        QueueMap = new Map <String,Id>();
        list<Group> QueueList = [select Id,Name from Group Where Type = 'Queue'];
        for(Group q:QueueList){
            QueueMap.put(q.Name,q.Id);
        }       
    }

    /**
     * Name: getRequestInformation
     * Params: reqId: Customer_Data_Request__c Id to fetch all the details of the record
     * Description: Method to get details of the record based on the parameter passed.
     */
    public  list<Customer_Data_Request__c> getRequestInformation(list<Customer_Data_Request__c> dataReq){
        list<Customer_Data_Request__c> lst_req = new list<Customer_Data_Request__c>();
        for(Customer_Data_Request__c cusReq : dataReq){
            Customer_Data_Request__c req = new Customer_Data_Request__c();
            Map<String, Schema.SObjectField> fldObjMap = schema.SObjectType.Customer_Data_Request__c.fields.getMap();
            String querySearch= '';
            String query;
            for(String s :fldObjMap.KeySet()){
                querySearch = querySearch + s + ',';
            }
            querySearch = querySearch.removeEnd(',');
            query = 'Select '+  querySearch + ',RecordType.Name,CreatedBy.Id from Customer_Data_Request__c where Id= \''+cusReq.Id+'\'';
            req=database.query(query);
            lst_req.add(req);
        }
        return lst_req;

    }



    /**
     * Name: submitRequest
     * Params: OnboardingReq: Customer_Data_Request__c Id.
     * Description: Method to Assign Owner and Lock the record when ever it is Submitted.
     */ 
    public void submitRequest(Customer_Data_Request__c OnboardingReq)
    {
    
        List<Business_Rules__c> businessRules = new List<Business_Rules__c>();
        List<Business_Rules__c> CANotifica_businessRules = new List<Business_Rules__c>(); 
        system.debug('=============='+CompanyCodeCountry_Rule_Rtype);
        system.debug('=============='+OnboardingReq.Company_Code__c);
        system.debug('==============CompanyCodeCountry_Rule_Rtype--id'+id.valueof(CompanyCodeCountry_Rule_Rtype));
        system.debug('==============CompanyCodeCountry_Rule_Rtype---'+string.valueof(CompanyCodeCountry_Rule_Rtype));
        //<Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules 
        List<Business_Rules__c> busCompanyRules = new List<Business_Rules__c>();
        String CDRCountry='';
        busCompanyRules = [select id, Sold_to_Country__c from Business_Rules__c where recordTypeId = : CompanyCodeCountry_Rule_Rtype and Selling_Company_Code__c = : OnboardingReq.Company_Code__c];
        system.debug('==============busCompanyRules='+busCompanyRules);
        // Merge&Spin Start1 - Added size check on the list busCompanyRules 
        if(busCompanyRules.size()>0){
        	CDRCountry = busCompanyRules[0].Sold_to_Country__c;  
            system.debug('CDRCountry= '+CDRCountry); 
    	}  
        // Merge&Spin End1
        //<Alvin20150929>End
        if((onboardingReq.Request_Status__c !='Closed' && onboardingReq.Request_Status__c !='Draft/Data Gathering'  && onboardingReq.Request_Status__c !='Rejected' && onboardingReq.Request_Status__c !='Request Completed in SAP')){
            if(OnboardingReq.Back_Flow_To_DUPont__c == true){
                OnboardingReq.Last_Modified_Time__c = system.now();
                OnboardingReq.Record_Locked__c=false;
                String OldOwnerId=OnboardingReq.OwnerId;
                String SoldToCountry;
                // Merge&Spin - Added CDRCOuntry in if condition for blank check
                if(OnboardingReq.Sold_to_Country__c !=null && OnboardingReq.Sold_to_Country__c !='' && CDRCountry !=''){
                    if((CDRCountry=='IN - India')&&((OnboardingReq.Sold_to_Country__c.Substring(0,2) !='CN')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='TH')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='HK')))//<Alvin20150929> updated for R02 enhancement to replace selling company codes with business Rules
                        SoldToCountry = 'Others'; 
                    else if((CDRCountry == 'HK - Hong Kong')&&((OnboardingReq.Sold_to_Country__c.Substring(0,2) !='TH')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='IN')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='CN')))//<Alvin20150929> updated for R02 enhancement to replace selling company codes with business Rules
                        SoldToCountry = 'Others';
                    else if((CDRCountry == 'TH - Thailand')&&((OnboardingReq.Sold_to_Country__c.Substring(0,2) !='CN')&& (OnboardingReq.Sold_to_Country__c.Substring(0,2) !='IN')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='HK')))//<Alvin20150929> updated for R02 enhancement to replace selling company codes with business Rules
                        SoldToCountry = 'Others';
                    //Nishanth.H 15092015> Added for R02 enhancement-Updating selling company code value('1131 - DuPont (Shanghai) Sourcing Center Company, Ltd.')  
                    else if((CDRCountry == 'CN - China')&&((OnboardingReq.Sold_to_Country__c.Substring(0,2) !='TH')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='IN')&&(OnboardingReq.Sold_to_Country__c.Substring(0,2) !='HK')))//<Alvin20150824> Added 1310 selling company code for enhancement LE1310 ; //<Alvin20150929> updated for R02 enhancement to replace selling company codes with business Rules
                        SoldToCountry = 'Others';
                    else
                        SoldToCountry = OnboardingReq.Sold_to_Country__c; 
                }
                String CDRReqStatus=OnboardingReq.Request_Status__c;
                string companyCode = '\''+OnboardingReq.Company_Code__c+'\'';
                String Query_businessRules ='select Id,Name,Destination_Queue__c,Credit_Analyst_Notification_Mgr__c from Business_Rules__c where Selling_Company_Code__c ='+'\''+OnboardingReq.Company_Code__c+'\'';
                Query_businessRules += ' and RecordTypeId !='+'\''+Country_Credit_Analyst_Notification_RTYPE+'\'';
                if (OnboardingReq.Request_Status__c !='Awaiting Destination Credit Approval'){
                    Query_businessRules += ' and CDR_Request_Status__c ='+'\''+CDRReqStatus+'\'';
                    businessRules = Database.query(Query_businessRules);
                }else{
                    Query_businessRules += ' and Sold_to_Country__c = '+ '\''+SoldToCountry+'\'' +' and CDR_Request_Status__c =' +'\''+CDRReqStatus+'\'';
                    businessRules = Database.query(Query_businessRules);
                }
                //Asssign CA Notification Manager...
                If(OnboardingReq.Request_Status__c =='Awaiting Credit Approval' || OnboardingReq.Request_Status__c =='Awaiting Destination Credit Approval'){
                    String Query_CANotifica_businessRules = 'select Id,Name,Destination_Queue__c,Credit_Analyst_Notification_Mgr__c from Business_Rules__c where Selling_Company_Code__c ='+'\''+OnboardingReq.Company_Code__c+'\'';
                    Query_CANotifica_businessRules += ' and Sub_Business__c ='+'\''+OnboardingReq.Sub_Business__c+'\'';
                    Query_CANotifica_businessRules += ' and RecordTypeId ='+'\''+Country_Credit_Analyst_Notification_RTYPE+'\'';
                    CANotifica_businessRules = Database.query(Query_CANotifica_businessRules);
                    if(CANotifica_businessRules.size()==1)
                        OnboardingReq.Credit_Analyst_Notification_Mgr__c= CANotifica_businessRules[0].Credit_Analyst_Notification_Mgr__c;
                    else
                        apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.error,'There are more then one country business rules matching the criteria. please contact your adminstrator');
                }
                
                if(businessRules.size()==1){
                    OnboardingReq.Ownerid= QueueMap.get(businessRules[0].Destination_Queue__c);   
                }
                else{
                    apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.error,'There are more then one country business rules matching the criteria. please contact your adminstrator');
                }
                if(Trigger.IsUpdate){
                    if(OldOwnerId != string.valueOf(OnboardingReq.OwnerId))
                        OnboardingReq.Back_Flow_To_DUPont__c=false;
                }else if(Trigger.IsInsert)
                    OnboardingReq.Back_Flow_To_DUPont__c=false;
            }
        }

    }
}