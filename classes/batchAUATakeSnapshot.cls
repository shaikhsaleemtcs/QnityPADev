/******************************************************************************* 
Copyright © 2016 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  Batch Class for Taking Snapshot of User Information in object User Access Review Details Custom Object
********************************************************************************/
global class batchAUATakeSnapshot implements Database.Batchable<sObject> {
    private static final integer MAXROWS = Limits.getLimitQueryRows();
    private static final String USERIDPREFIX = '005';
    private static final String SNAPSHOTCOMPLETED = 'Completed';
    private static final String COMMADELIMITER = ',';
    private static final String SEMICOLONDELIMITER = ';';
    private static final String BLANK = '';
    private static final String SPACE = ' ';
    private static final String EXCEPTIONOCCURED = 'Exception Occured =====>>>>>>\n';
    
    public Id AuditProcessId{get;set;}
    
    global batchAUATakeSnapshot(Id apid){
        AuditProcessId = apid;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        try{ 
            if(!Test.isRunningTest()){         
                return Database.getQueryLocator([SELECT Employment_Status__c,CompanyName,Program__c,Email,E_Pass_ID__c,FirstName,Id,Key_User__c,LastName,Name,Username,UserOwningSBUOrg__c,UserRoleId,UserType,User__c,User_Owning_Org__c,IsActive,user.profile.name, user.UserRole.Name, user.User_Country__c, user.User_Region__c,Approving_Business__c, user.LastLoginDate, Access_Type__c  FROM User WHERE IsActive = true AND (Access_Type__c!='Integrator' AND Access_Type__c!='Static') AND UserType != 'Guest' LIMIT :MAXROWS]);        
            }else{
                return Database.getQueryLocator([SELECT Employment_Status__c,CompanyName,Program__c,Email,E_Pass_ID__c,FirstName,Id,Key_User__c,LastName,Name,Username,UserOwningSBUOrg__c,UserRoleId,UserType,User__c,User_Owning_Org__c,IsActive,user.profile.name, user.UserRole.Name, user.User_Country__c, user.User_Region__c,Approving_Business__c, user.LastLoginDate, Access_Type__c FROM User WHERE IsActive = true  AND (Access_Type__c!='Integrator' AND Access_Type__c!='Static') AND UserType != 'Guest' LIMIT 50]);        
            }
        }catch(Exception e){
            system.debug(EXCEPTIONOCCURED+e.getStackTraceString());
            return null;
        }
    }
    
    global void execute(Database.BatchableContext BC, List<User> userInfos) {
        try{
            captureUserInfo(userInfos,AuditProcessId);
        }catch(Exception e){
            system.debug(EXCEPTIONOCCURED+e.getStackTraceString());            
        }
    }   
    
    global void finish(Database.BatchableContext BC) {
        try{
            User_Access_Review__c uar = [Select id,name,Snapshot_Date__c,Snapshot_Status__c,Snapshot_Taken_By__c From User_Access_Review__c where Id = : AuditProcessId LIMIT :MAXROWS];
            uar.Snapshot_Date__c = Date.today();
            uar.Snapshot_Status__c = SNAPSHOTCOMPLETED;
            upsert uar;        
        }catch(Exception e){
            system.debug(EXCEPTIONOCCURED+e.getStackTraceString());            
        }
    }
    
    
    public static void captureUserInfo(List<User> userInfos, Id AuditProcessId){       
        List<User_Access_Review_Details__c> uards = new List<User_Access_Review_Details__c>();
        Map<id,String> userPermSet = getUsersPermSets();        
        
        for(User userInfo: userInfos){
            User_Access_Review_Details__c uard= new User_Access_Review_Details__c();
            uard.user_type__c = userInfo.UserType;
            uard.Org__c = System.UserInfo.getOrganizationName();
            uard.User_Email_Id__c = userInfo.Email;
            uard.User_ePass_Id__c = userInfo.E_Pass_ID__c; /*Chan15082016*/
            uard.User_Name__c = userInfo.Username;
            uard.User_Id__c = userInfo.Id;            
            uard.Name = userInfo.FirstName+SPACE+userInfo.LastName;
            uard.Audit_Process__c = AuditProcessId;
            uard.User_Profile__c = userInfo.profile.name;
            uard.User_Roles__c = userInfo.UserRole.Name;
            uard.User_Permission_Sets__c = userPermSet.get(userInfo.Id)!=null?userPermSet.get(userInfo.Id):BLANK;
            uard.User_Public_Group__c = getUsersPGSets(userInfo.Id);
            uard.User_Grouping__c = userInfo.User__c; /*Chan15082016*/
            uard.User_Country__c = userInfo.User_Country__c;
            uard.User_Region__c = userInfo.User_Region__c;
            uard.User_Owning_Org__c = userInfo.User_Owning_Org__c;
            uard.User_Owning_SBU_Org__c = userInfo.UserOwningSBUOrg__c;
            uard.CompanyName__c = userInfo.CompanyName;
            uard.Program__c = userInfo.Program__c;
            uard.Approving_Business__c = userInfo.Approving_Business__c;
            uard.User_Last_Login__c = userInfo.LastLoginDate;
            uard.User_Access_Type__c = userInfo.Access_Type__c ;  /*Chan15082016*/
            uards.add(uard);            
        }        
            if(uards!=null && !uards.isEmpty()){
            List<Database.UpsertResult> results = database.upsert(uards,false);
            for(Database.UpsertResult theResult:results) {
                if(theResult.isSuccess())
                    continue;
                List<Database.Error> errors = theResult.getErrors();
                for(Database.Error theError:Errors) {
                    System.debug(System.LoggingLevel.ERROR,'Error Received: ' + theError.getMessage());
                }
            }  
        }
    }


    
    
    public static Map<id,String> getUsersPermSets(){
        Map<id,String> userPermSet = new Map<id, String>();
        String permSets =BLANK;
        for(PermissionSetAssignment psa: [select Assignee.id,Assignee.Name, PermissionSet.Name from PermissionSetAssignment WHERE NOT(PermissionSet.Name like 'X%') order by Assignee.Name, PermissionSet.Name  LIMIT :MAXROWS]){
            if(userPermSet.get(psa.Assignee.id)==null){
                userPermSet.put(psa.Assignee.id,psa.PermissionSet.Name);  
            }else{        
                permSets = userPermSet.get(psa.Assignee.id);
                userPermSet.remove(psa.Assignee.id);
                userPermSet.put(psa.Assignee.id,permSets+COMMADELIMITER+SPACE+psa.PermissionSet.Name);  
            }            
        }
        return userPermSet;
    }
    
    public static String getUsersPGSets(Id userId){
        Group[] grps = getGroupsForUser(userId);
        String strGrps = BLANK;
        for(Group grp:grps){
            strGrps = strGrps==BLANK?grp.name:strGrps+SEMICOLONDELIMITER+grp.name;
        }
        return strGrps;
    }
    
    
    // return list of all groups the user belongs to via direct or indirect membership
    public static Group[] getGroupsForUser(Id userId){        
        Set<Id> groupIds = getGroupsForIds(new Set<Id>{userId});
        return [select Id, Name from Group where Id IN: groupIds  LIMIT :MAXROWS];        
    }
    
    // return all ids the user belongs to via direct or indirect membership
    public static Set<Id> getGroupsForIds(Set<Id> userOrGroupIds){        
        Set<Id> output = new Set<Id>();        
        Set<Id> nestedGroupIds = new Set<Id>();
        
        // only query actual groups and not roles and queues
        list<GroupMember> records = [select id, GroupId, UserOrGroupId from GroupMember where UserOrGroupId =: userOrGroupIds and UserOrGroupId != null and Group.Type = 'Regular'  LIMIT :MAXROWS];
        
        for (GroupMember record:records)
        {
            // found a group, remember for traversal
            if (!(record.UserOrGroupId + BLANK).startsWith(USERIDPREFIX)){
                nestedGroupIds.add(record.UserOrGroupId);   
            }else{
                output.add(record.GroupId);
            }
        }
        
        // call self to get nested groups we found
        if (nestedGroupIds.size() > 0){
            output.addAll(getGroupsForIds(nestedGroupIds));
        }        
        return output;
    }    
}