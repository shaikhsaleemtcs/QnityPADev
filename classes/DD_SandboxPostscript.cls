/*******************************************************************************
Copyright © 2019 DuPont. All rights reserved.
Author: Thomas Snyder
Email: tom.snyder@dupont.com, tom@3ddd.com
Description:  

This class implements the SandboxPostCopy as is intended to be run on every sandbox refresh from PROD
This script will perform the following tasks on a newly generated sandbox:
1.  Disable scheduled reports and other job types (see JOBTYPES_TO_ABORT)
2.  Change email address (remove .invalid) for all active system admins
3.  Set Disable Geo Validation field =False in Custom setting OrgSetting


<8/22/2024 Shanker Kumar> Added 1 more activities in script
4. Make Lead & Contact email as ".invalid". more objects can be added via configuration(metadata Sandbox_Refresh_Activities_Configuration__mdt)

*******************************************************************************/

global class DD_SandboxPostscript implements SandboxPostCopy {      
    /*
* Data Export (0)
* Weekly Export (1)
Test (2)
* Dashboard Refresh (3)
* Reporting Snapshot (4)
System (5)
Scheduled Apex (7)
* Report Run (8)
Batch Job (9)
* Analytics Notification (A)
* Duns Right Async Batch Monitor (B)
Scheduled ELT Dataflow (C)
* Sitemap Generation (E)
*/
    public final static SET<string> JOBTYPES_TO_ABORT = new SET<string> { '0','1','3','4','8','A','B','E'};
        public final static String PS_SPECIFIC_SETTINGS_ID = '00D41000002FFQJEA4';
    //public final static String NH_SPECIFIC_SETTINGS_ID = '00D4100000130uKEAQ';
    public final static String MS_SPECIFIC_SETTINGS_ID = '00D460000001W8rEAE';
    //public final static String IB_SPECIFIC_SETTINGS_ID = '00D41000002j88gEAA';
    public final static String OTHER_SPECIFIC_SETTINGS_ID = '00D41000002HN0KEAW';
    public final static String PROFILE_SYSTEM_ADMINISTRATOR = 'System Administrator';
    public final static String INVALID_VALUE = '.invalid';
    public final static String INVALID_VALUE_CONDITION = '%.invalid';
    public final static String ACCOUNT_GEO_VALIDATION = 'Account_Geo_Validation';
    public final static String ABORT_SCHEDULED_JOBS = 'Abort_Scheduled_Jobs';
    public final static String CORRECT_SYSTEM_ADMIN_EMAIL = 'Correct_System_Admin_Email';
    public final static String EXECUTION_STATUS_RECEPIENT_EMAILS = 'Execution_Status_Recepient_Emails';
    public final static String INVALIDATE_EMAIL = 'Invalidate_Email';
    public final static String TRUE_CHECK = 'TRUE';
    
    // SandboxPostCopy interface
    global void runApexClass(SandboxContext context) {
        init();
    }
    
    // get settings/options  
    public static void init() {
        //public static void init(String orgId) {
        //get custom sandbox metadata 
          Map<String, Sandbox_Refresh_Activities_Configuration__mdt> mapOfSandboxRefreshMetadata = getSandboxRefreshMetadata();
       OrgSettings orgSettings = getOrgSettings();
        if(mapOfSandboxRefreshMetadata != NULL){
                   for(String key : mapOfSandboxRefreshMetadata.keySet()){
          //if(key == ACCOUNT_GEO_VALIDATION)
                    //disableGeoValidation();

 if(key == ABORT_SCHEDULED_JOBS)
                    disableScheduledJobs(orgSettings.JobTypesToAbort);

 if(key == CORRECT_SYSTEM_ADMIN_EMAIL)
                    updateAdminEmails();
                
               
                 
                //Activity 4
                if(key.contains(INVALIDATE_EMAIL) && mapOfSandboxRefreshMetadata.get(key).Object_API_Name__c != NULL &&
                   mapOfSandboxRefreshMetadata.get(key).Field_API_Name__c != NULL){
                       Map<String,String> objectFieldMap = new Map<String,String>{mapOfSandboxRefreshMetadata.get(key).Object_API_Name__c => mapOfSandboxRefreshMetadata.get(key).Field_API_Name__c};
                           batchInvalidateCustomerEmailonObject  emailUpdate = new batchInvalidateCustomerEmailonObject (objectFieldMap, 
                                                                                                                         mapOfSandboxRefreshMetadata.get(EXECUTION_STATUS_RECEPIENT_EMAILS).Email__c);
                       Database.executeBatch(emailUpdate);    
                   }
            }
        }
    }
    
    
    //Object to define the all options/settings for postscript,  use  getOrgSettings(Id ProdOrgId) to define org based
    private class OrgSettings {     
        SET<string> JobTypesToAbort {get; set;}
        OrgSettings() {
            JobTypesToAbort = JOBTYPES_TO_ABORT;
        }
    }       
    
    private static OrgSettings getOrgSettings() {
        string ProdOrgId ='';
        OrgSettings rtn = new OrgSettings();
        if (ProdOrgId == PS_SPECIFIC_SETTINGS_ID)   {
            //PS Specific Settings
        }  
        /*else if (ProdOrgId == NH_SPECIFIC_SETTINGS_ID)   {
            //NH  Specific Settings
        }  */
        else if (ProdOrgId == MS_SPECIFIC_SETTINGS_ID)   {
            //MS  Specific Settings
        }
        /*else if (ProdOrgId == IB_SPECIFIC_SETTINGS_ID)   {
            //IB  Specific Settings
        }  */
        else if (ProdOrgId == OTHER_SPECIFIC_SETTINGS_ID)   {
            
        }  
        else  {}       
        
        return rtn; 
    }
    /* public static void disableGeoValidation(){
        UserInfo.getOrganizationId();
        GeneralSettings__c gs = GeneralSettings__c.getOrgDefaults();
        if (gs==null)
            gs = new GeneralSettings__c(SetupOwnerId=UserInfo.getOrganizationId(), Disable_GeoValidation__c=true);
        else
            gs.Disable_GeoValidation__c=true;
            
          
        upsert gs; 
    }
*/  
    
    //  Updates select users emails so they can refresh passwords if need be
    public static void updateAdminEmails() {//string sandboxName
        
         LIST<User> users = [Select Id, name, username, email, isActive from User where  IsActive=true AND Profile.Name='System Administrator' AND email like '%.invalid'];
        for (User u : users) {
           
            u.email=u.email.removeEnd('.invalid');
           
        }
        update users;
    }
    
    
    //  Abort Select Jobs (JOBTYPES_TO_ABORT)
    public static void disableScheduledJobs(SET<string> JobTypesToAbort) {
        for(CronTrigger ct : [SELECT CreatedById,CreatedDate,CronExpression,CronJobDetailId,CronJobDetail.Name,EndTime,Id,
            LastModifiedById,NextFireTime,OwnerId,PreviousFireTime,StartTime,State,TimesTriggered
            FROM CronTrigger WHERE CronJobDetail.JobType in :JobTypesToAbort]){
                if(!test.isrunningtest()){system.abortJob(ct.Id);}
        }
    }  
    
    
    
    // fetch activity enablement status. Only Active activities are selected
    public static Map<String,Sandbox_Refresh_Activities_Configuration__mdt> getSandboxRefreshMetadata(){
        Map<String,Sandbox_Refresh_Activities_Configuration__mdt> mapOfSandboxRefreshMetadata = new Map<String,Sandbox_Refresh_Activities_Configuration__mdt>();
        List<Sandbox_Refresh_Activities_Configuration__mdt> listOfMetadataRecords = [SELECT Label, Activity__c,Email__c, Field_API_Name__c, Object_API_Name__c
                                                                                     FROM Sandbox_Refresh_Activities_Configuration__mdt
                                                                                     WHERE Activity__c = 'TRUE'];
        
        for(Sandbox_Refresh_Activities_Configuration__mdt sRAC : listOfMetadataRecords){
            mapOfSandboxRefreshMetadata.put(sRAC.Label, sRAC);
        }
        return mapOfSandboxRefreshMetadata;
    }
    
}