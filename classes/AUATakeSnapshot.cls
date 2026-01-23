/******************************************************************************* 
Copyright © 2016 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  Class for Taking Snapshot of User Information in object User Access Review Details Custom Object
through a batch class batchAUATakeSnapshot
********************************************************************************/
global class AUATakeSnapshot {
    private static final integer MAXROWS = Limits.getLimitQueryRows();
    webservice static AsyncApexJob startSnapshotProcess(Id AuditProcessId) {
        return captureUserInfo(AuditProcessId);
    }
    
    private static AsyncApexJob captureUserInfo(Id AuditProcessId){        
        try{
            User_Access_Review__c uar = [Select id,name,Snapshot_Date__c,Snapshot_Status__c,Snapshot_Taken_By__c From User_Access_Review__c where Id = : AuditProcessId Limit :MAXROWS];
            uar.Snapshot_Status__c='In Progress';
            uar.Snapshot_Taken_By__c= UserInfo.getUserId();
            upsert uar;
            
            ID batchprocessid = Database.executeBatch(new batchAUATakeSnapshot(AuditProcessId),50);            
            return [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors 
                    FROM AsyncApexJob WHERE ID =: batchprocessid Limit :MAXROWS];
           
        }catch(Exception e){
            System.debug('Exception Occured');
            e.getStackTraceString();           
        }
        
         return null;
    }
}