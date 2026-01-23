/*
 * Name      :   PricingRequestHandler_UT
 * Description  :   This is the test class for PAServiceState
 * Author      :   Infosys Limited
 * Created Date :   21-03-2013
 *
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
 @isTest
private class PricingRequestHandler_UT
{          
   static testMethod void prBIBUTestMethod() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

         // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');    
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName',user1.id);    
       user2.out_of_office__c=true;
        user2.out_of_Office_start_date__c = system.today();
        user2.out_of_Office_End_date__c = system.today();
        insert user2;
        system.runas(user1){
            
        User user = user2;
        
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
            
        //<mg20160121>  
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'escalatedToBuAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;  
            
            
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.NPC_Status__c ='Waiting for Submission';
        insert prObj;  
        
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();        
        prItem2.Pricing_Request__c = prObj.id;        
        prItem2.Key_Combination__c='Salea Area/Material';
        prItem2.Net_Price_Status__c = '';               
        insert prItem2;
            
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();        
        prItem.Pricing_Request__c = prObj.id;        
        prItem.Key_Combination__c='Salea Area/Material'; 
        prItem.Net_Price_Status__c = 'Waiting For Net Price';           
        insert prItem;              
        
        update prObj;
            
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];           
        
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        
        /******************/
        prObjFromDB.Approver1_Date__c = system.now();
        prObjFromDB.NPC_Status__c='Waiting For Submission';
        prObjFromDB.Request_Approval_Status__c='Canceled';      
        prObjFromDB.SoldTo_Code__c='Test';             
        upsert prObjFromDB;  
        
        /******************************/
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();        
        prItem1.Pricing_Request__c = prObjFromDB.id;        
        prItem1.Key_Combination__c='Salea Area/Material'; 
        prItem1.Net_Price_Status__c = 'Waiting For Net Price';           
        insert prItem1; 
        /*****************************/
        
        /********************************************
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c=erpCustomer.id;
        erpRelationship.user__c=user.id;
        erpRelationship.Partner_Function_Code__c = 'ZR';     
        insert erpRelationship; 
        
        *********************************************/  
        
        //////Pooja
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver1_Date__c = system.now();
        prObjFromDB.NPC_Status__c='Waiting For Submission';
        prObjFromDB.Request_Approval_Status__c='Submitted';      
                    
        upsert prObjFromDB;
        ///End Pooja            
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Approver2_Date__c = system.now();
        prObjFromDB.NPC_Status__c='Waiting For Net Price';
        prObjFromDB.Request_Approval_Status__c='Submitted'; 
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /*******************/
        
        upsert prObjFromDB;
        
        
        prObjFromDB.Current_Level__c ='3';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Approver3_Date__c = system.now();
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /*******************/
        prObjFromDB.Request_Approval_Status__c='Submitted';
        prObjFromDB.NPC_Status__c = 'Waiting for Net Price';
        upsert prObjFromDB;
        
        
        prObjFromDB.Current_Level__c ='4';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver4_Date__c = system.now();
        //prObjFromDB.Request_Approval_Status__c='Approved';    
        prObjFromDB.SoldTo_Code__c='Test'; //   
        upsert prObjFromDB;
        
        
        prObjFromDB.Current_Level__c ='5';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver5_Date__c = system.now();
        upsert prObjFromDB;
        
        PricingRequestHandler base = new PricingRequestHandler();
        //RType.SObjectRTypes type = base.rTypes;
        Pricing_Request__c so = new Pricing_Request__c();
        
        try{
        delete prObjFromDB;
        }catch(exception e1){}
        
        //base.cacheRecordsByRT = Null;
        base.rTypeIdToSetting(prObjFromDB.Id);
        base.getRecordsByRT('test');
        //base.bulkbefore();
        base.bulkAfter();
        //base.bulkBefore();
        base.beforeInsert(so);
        base.beforeUpdate(so,so);
        base.beforeDelete(so);
        base.afterInsert(so);
        base.afterUpdate(so,so);
        base.afterDelete(so);
        base.andFinally();
        //Schema.DescribeSObjectResult dsr = base.DSR;
        //RType.SObjectRTypes rtypes = base.rTypes;
        //MAP<string,RecordTypeSettings__c> rtsettings = base.rTSettings;
        //MAP<id,RecordType> maprtypes = base.mapRTypes;
        //MAP<string, MAP<id,SObject>> recByRT = base.recordsByRT;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        prObjFromDB.Sent_to_BUAdmin__c = true;
        probjfromdb.current_approver__c = userinfo.getuserid();
        update prObjFromDB;
        base.bulkbefore();
        
        }catch(Exception e1){}
        
        }
    }
    
    static testMethod void prBIBUTestMethod1(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');   
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName', user1.id);    
        insert user2;
        system.runas(user1){
            
        User user = user1;
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Request_Type__c='import'; 
        prObj.Sent_to_Backup_approver__c = false;
        insert prObj;
        //<AJ20160121>
        Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();        
        prItem1.Pricing_Request__c = prObj.id;        
        prItem1.Key_Combination__c='Salea Area/Material'; 
        prItem1.Net_Price_Status__c = 'Waiting For Net Price';    
        prItem1.Pricing_Request_Type__c ='Floor';       
        insert prItem1; 
        
        /***************************
        Pricing_Request_Item__c pri = new Pricing_Request_Item__c();
        pri.Pricing_Request__c=prObj.Id;
        insert pri;
        *********************
        Pricing_Request_Item__c pri=[select Id, Key_Combination_Code__c,Pricing_Request__c, Pricing_Request__r.SAP_Cluster__c from Pricing_Request_Item__c where Pricing_Request__c=:prObj.Id LIMIT 1];
        /****************************/
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver2__c = NULL;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        
        prObjFromDB.Approver1_Date__c = system.now();
        upsert prObjFromDB;
        
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver2__c = NULL;
        prObjFromDB.Approver3__c = NULL;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        
        prObjFromDB.Approver1_Date__c = system.now();
        upsert prObjFromDB;
        
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver2__c = NULL;
        prObjFromDB.Approver3__c = NULL;
        prObjFromDB.Approver4__c = NULL;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver1_Date__c = system.now();
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_approver__c = true;
        prObjFromDB.Sent_to_BUAdmin__c= true;
        probjfromdb.current_approver__c = userinfo.getuserid();
        upsert prObjFromDB;
        }catch(Exception e1){}
        //adding pooja
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver2_Date__c = system.now();
        try{
        upsert prObjFromDB;
        }catch(exception e1){}
        //end
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver3__c = NULL;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver2_Date__c = system.now();
        try{
        upsert prObjFromDB;
        }catch(exception e1){}
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver3__c = NULL;
        prObjFromDB.Approver4__c = NULL;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /*******************/
        prObjFromDB.Approver2_Date__c = system.now();
        try{
        upsert prObjFromDB;
        }catch(exception e1){}
        
        prObjFromDB.Current_Level__c ='3';
        prObjFromDB.Approver4__c = NULL;
        prObjFromDB.Approver5__c = user.id;
        /*******************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /******************/
        prObjFromDB.Approver3_Date__c = system.now();
        try{
        upsert prObjFromDB;
        }catch(exception e1){}
        }
    }
    
    
    static testMethod void prBIBUTestMethod2(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

       // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');   
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName',user1.id);    
        insert user2;
        system.runas(user1){
            
        
        //User user = [SELECT Name, Id FROM User where isActive = true AND DelegatedApproverId <> NULL limit 1];
        User user = user2;
        
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.BU__c = 'BI EMEA Surfaces';
        insert prObj;

        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /********************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /********************/
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_approver__c = true;
        prObjFromDB.Sent_to_BUAdmin__c= true;
        probjfromdb.current_approver__c = userinfo.getuserid();
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /********************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /********************/
        try{
        upsert prObjFromDB;
        prObjFromDB.Sent_to_Backup_approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        prObjFromDB.Current_Level__c ='3';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /********************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /********************/
        try{
        upsert prObjFromDB;
        prObjFromDB.Sent_to_Backup_approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        prObjFromDB.Current_Level__c ='4';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        try{
        upsert prObjFromDB;
        prObjFromDB.Sent_to_Backup_approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        }
        
    }
    static testMethod void prBIBUTestMethod3(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName',user1.id);     
        insert user2;
        system.runas(user1){
            
        User user = user2;

        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.BU__c = 'BI EMEA Surfaces';
        insert prObj;

        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.BU__c='DPP Polymers EMEA';
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        }
    }
    static testMethod void prBIBUTestMethod4(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 =TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');         
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName',user1.id);         
        insert user2;
        system.runas(user1){
            
        User user = user2;

        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.SoldTo_Code__c = 'Test';
        insert prObj;

        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='3';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.SoldTo_Code__c = 'Test';
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        }
    }
    static testMethod void prBIBUTestMethod5(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');         
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName', user1.id);       
        insert user2;
        system.runas(user1){
       PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
            
        User user = user2;
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;

        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'FinalApprovalNotification';
        p.Template_Id__c = e.Id;
        insert p;

        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'OnBehalfNotification';
        p.Template_Id__c = e.Id;
        insert p;          
            
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;

        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.Current_Level__c ='3';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user.id;
        prObj.Approver2__c = user.id;
        prObj.Approver3__c = user.id;
        prObj.Approver4__c = user.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user.Id;
        prObj.SoldTo_Code__c='Test';
        prObj.SAP_Cluster__c='GP1';
        prObj.Sales_Org_Code__c = 'A640';
        prObj.Dist_Channel_Code__c = '10';
        prObj.Division_Code__c = '02';
        insert prObj;
                
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
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
        
        //added by sumita to fix code coverage 22 Jan 2016 start
        List<Organizational_Group_User__c> ogUserList = new List<Organizational_Group_User__c>();
        Organizational_Group_User__c ogUser = new Organizational_Group_User__c();
        ogUser.Organizational_Group_Item__c=orgItemList[0].id;
        ogUser.OrgGroup__c=salesArea.id;
        ogUser.Related_User__c=UserInfo.getUserId();
        ogUserList.add(ogUser);
        Organizational_Group_User__c ogUser1 = new Organizational_Group_User__c();
        ogUser1.Organizational_Group_Item__c=orgItemList[0].id;
        ogUser1.OrgGroup__c=salesArea.id;
        ogUser1.Related_User__c=UserInfo.getUserId();
        ogUserList.add(ogUser1);
        insert ogUserList;
        //added by sumita to fix code coverage 22 Jan 2016 end
         
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='4';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /********************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /*******************/   
        prObjFromDB.BU__C = Business.Business__c;
        prObjFromDB.Sales_Org_Code__c = salesArea.ERP_Sales_Org_code__c;
        prObjFromDB.Dist_Channel_Code__c =salesArea.ERP_Distribution_Channel_Code__c;
        prObjFromDB.Division_Code__c = salesArea.ERP_Division_code__c;
        prObjFromDB.SoldTo_Code__c = 'Test';
        prObjFromDB.SAP_Cluster__c = null;
        upsert prObjFromDB;
        
        ERP_Customer__c erpCustomer = new ERP_Customer__c();
        erpCustomer.Name='erpCustomer';
        erpCustomer.External_ERP_ID__c = prObjFromDB.SAP_Cluster__c + '-' + prObjFromDB.SoldTo_Code__c + '-' + prObjFromDB.Sales_Org_Code__c + '-' + prObjFromDB.Dist_Channel_Code__c + '-' + prObjFromDB.Division_Code__c;  
        erpCustomer.Sales_Org_Code__c= '234567';
        erpCustomer.Division_Code__c= '345678';    
        erpCustomer.Distribution_Channel_Code__c= '456789';                
        erpCustomer.Street__c= 'street';    
        erpCustomer.City__c= 'city';    
        erpCustomer.Country__c= 'country';    
        erpCustomer.ZIP_Postal_Code__c= '123456';    
        erpCustomer.Customer_code__c= 'Test';                               
            
        insert erpCustomer;    
        
        
        
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c=erpCustomer.id;
        erpRelationship.user__c=user.id;
        erpRelationship.Partner_Function_Code__c = 'ZR';     
        insert erpRelationship;   
        
       
        system.debug('ERP Ext ID ::: ' + erpCustomer.External_ERP_ID__c + '  ::: ' + erpRelationship.user__c);
        try{
        prObjFromDB.Request_Approval_Status__c = 'Approved';
        upsert prObjFromDB;
            
        prObjFromDB.Request_Approval_Status__c = 'Submitted';            
        upsert prObjFromDB; 
        }
        catch(Exception e2){}
        }
    }
    
    static testMethod void prBIBUTestMethod6(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

       // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = new User(Alias='pcopp', Email='ambili_vinay@test.com.test', User_Country__c='UNITED KINGDOM',
                             E_Pass_ID__c='rr9847',External_ERP_ID__c='123653',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test2',LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user1;
        
        User user2 = new User(Alias='pcopp41', Email='ambili_vinay14@test.com', User_Country__c='UNITED KINGDOM',
                            out_of_office__c=false,E_Pass_ID__c='rr9844',External_ERP_ID__c='123940',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test41',LastName='Coppens4', CommunityNickname='ac4v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user2;
         User user4 = new User(Alias='pcopp1', Email='ambili_vinay1@test.com', User_Country__c='UNITED KINGDOM',
                            out_of_office__c=true,E_Pass_ID__c='rr9847',External_ERP_ID__c='123950',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test4',LastName='Coppens1', CommunityNickname='ac1v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user4;
        system.runas(user1){
            
        User user = [SELECT Name, Id FROM User where isActive = true  AND DelegatedApproverId <> NULL limit 1];
        User user3 = [SELECT Name, Id FROM User where isActive = true AND out_of_office__c = true  AND DelegatedApproverId <> NULL limit 1];
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.Current_Level__c ='3';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user.id;
        prObj.Approver2__c = user.id;
        prObj.Approver3__c = user3.id;
        prObj.Approver4__c = user.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user3.Id;
        prObj.SoldTo_Code__c = 'Test';
            prObj.Sent_to_Backup_Approver__c = false;
        insert prObj;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='4';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.SoldTo_Code__c = 'Test';
            prObjFromDB.Sent_to_Backup_Approver__c = true;
        update prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        update prObjFromDB;
        }catch(Exception e1){}
        
        }
    }
    
    static testMethod void prBIBUTestMethod7(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        
         // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        //UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];

        User user1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',
                             E_Pass_ID__c='rr9847',External_ERP_ID__c='123653',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test2',LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user1;
        
        User user2 = new User(Alias='pcopp1', Email='ambili_vinay1@infosys.com', User_Country__c='UNITED KINGDOM',
                            out_of_office__c=true,E_Pass_ID__c='rr9847',External_ERP_ID__c='123950',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test21',LastName='Coppens1', CommunityNickname='ac1v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user2;
        system.runas(user1){
            
        User user = [SELECT Name, Id FROM User where isActive = true  AND DelegatedApproverId <> NULL limit 1];
        User user3 = [SELECT Name, Id FROM User where isActive = true AND out_of_office__c = true  AND DelegatedApproverId <> NULL limit 1];
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.Current_Level__c ='2';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user.id;
        prObj.Approver2__c = user3.id;
        prObj.Approver3__c = user.id;
        prObj.Approver4__c = user.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user3.Id;
        prObj.SoldTo_Code__c = 'Test';
        insert prObj;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='3';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.SoldTo_Code__c = 'Test';
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        }
    }
    
    
    static testMethod void prBIBUTestMethod9(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
         // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        // UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];

        User user1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',
                            E_Pass_ID__c='rr9847',External_ERP_ID__c='123653',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test2',LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user1;
        
        User user2 = new User(Alias='pcopp1', Email='ambili_vinay1@infosys.com', User_Country__c='UNITED KINGDOM',
                            out_of_office__c=true,E_Pass_ID__c='rr9847',External_ERP_ID__c='123950',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test21',LastName='Coppens1', CommunityNickname='ac1v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user2;
        system.runas(user1){
            
        User user = [SELECT Name, Id FROM User where isActive = true  AND DelegatedApproverId <> NULL limit 1];
        User user3 = [SELECT Name, Id FROM User where isActive = true AND out_of_office__c = true  AND DelegatedApproverId <> NULL limit 1];
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.Current_Level__c ='4';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user.id;
        prObj.Approver2__c = user.id;
        prObj.Approver3__c = user.id;
        prObj.Approver4__c = user3.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user3.Id;
        prObj.SoldTo_Code__c = 'Test';
        insert prObj;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='5';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.SoldTo_Code__c = 'Test';
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        }
    }
    
    static testMethod void prBIBUTestMethod10(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        
         // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
       // UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];

        User user1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',
                             E_Pass_ID__c='rr9847',External_ERP_ID__c='123653',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test2',LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user1;
        
        User user2 = new User(Alias='pcopp1', Email='ambili_vinay1@infosys.com', User_Country__c='UNITED KINGDOM',
                            out_of_office__c=true,E_Pass_ID__c='rr9847',External_ERP_ID__c='123950',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test21',LastName='Coppens1', CommunityNickname='ac1v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user2;
        system.runas(user1){
            
        User user = [SELECT Name, Id FROM User where isActive = true  AND DelegatedApproverId <> NULL limit 1];
        User user3 = [SELECT Name, Id FROM User where isActive = true AND out_of_office__c = true  AND DelegatedApproverId <> NULL limit 1];
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.Current_Level__c ='1';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user3.id;
        prObj.Approver2__c = user.id;
        prObj.Approver3__c = user.id;
        prObj.Approver4__c = user.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user3.Id;
        prObj.SoldTo_Code__c = 'Test';
        insert prObj;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.SoldTo_Code__c = 'Test';
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        }
    }
    
    //pooja
    
    static testMethod void prBIBUTestMethod11() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

         // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
      //  UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];

        User user1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',
                            E_Pass_ID__c='rr9847',External_ERP_ID__c='123653',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test2',LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user1;
        
        User user2 = new User(Alias='pcopp1', Email='ambili_vinay1@infosys.com', User_Country__c='UNITED KINGDOM',
                            E_Pass_ID__c='rr9847',External_ERP_ID__c='123950',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test21',LastName='Coppens1', CommunityNickname='ac1v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user2;
        system.runas(user1){
            
        User user = [SELECT Name, Id FROM User where isActive = true AND DelegatedApproverId <> NULL limit 1];
        
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
       p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;  
            
            
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.NPC_Status__c ='Waiting for Submission';           
        prObj.SoldTo_Code__c = 'Test';
        insert prObj;  
        
        Pricing_Request_Item__c prItem2 = new Pricing_Request_Item__c();        
        prItem2.Pricing_Request__c = prObj.id;        
        prItem2.Key_Combination__c='Salea Area/Material';
        prItem2.Net_Price_Status__c = '';               
        insert prItem2;
            
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();        
        prItem.Pricing_Request__c = prObj.id;        
        prItem.Key_Combination__c='Salea Area/Material'; 
        prItem.Net_Price_Status__c = 'Waiting For Net Price';           
        insert prItem;              
            
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];           
        
        prObjFromDB.Current_Level__c ='1';
        prObjFromDB.Approver1__c = NULL;
        prObjFromDB.Approver2__c = NULL;
        prObjFromDB.Approver3__c = NULL;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Approver1_Date__c = system.now();
        //prObjFromDB.NPC_Status__c='Waiting For Submission';
        /******************************/
        prObjFromDB.NPC_Status__c='Waiting For Net Price';
        /******************************/
        prObjFromDB.Request_Approval_Status__c='Submitted';      
        prObjFromDB.SoldTo_Code__c = 'Test';            
        upsert prObjFromDB;
        
        PricingRequestHandler base = new PricingRequestHandler();
        //RType.SObjectRTypes type = base.rTypes;
        Pricing_Request__c so = new Pricing_Request__c();
        
        try{
        delete prObjFromDB;
        }catch(exception e1){}
        
        //base.cacheRecordsByRT = Null;
        base.rTypeIdToSetting(prObjFromDB.Id);
        base.getRecordsByRT('test');
        //base.bulkbefore();
        base.bulkAfter();
        //base.bulkBefore();
        base.beforeInsert(so);
        base.beforeUpdate(so,so);
        base.beforeDelete(so);
        base.afterInsert(so);
        base.afterUpdate(so,so);
        base.afterDelete(so);
        base.andFinally();
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        upsert prObjFromDB;
        base.bulkbefore();
        
        }catch(Exception e1){}
        }
    }   
    static testMethod void prBIBUTestMethod12(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

         // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        // UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];

        User user1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',
                             E_Pass_ID__c='rr9847',External_ERP_ID__c='123653',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test2',LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user1;
        
        User user2 = new User(Alias='pcopp1', Email='ambili_vinay1@infosys.com', User_Country__c='UNITED KINGDOM',
                            out_of_office__c=true,E_Pass_ID__c='rr9847',External_ERP_ID__c='123950',UserRoleId=r.id,profileid = p1.id,
                            isActive=true, Username='pa_werner1@jhhgtestinfosys.com.test21',LastName='Coppens1', CommunityNickname='ac1v',
                            DelegatedApproverId = user1.Id, TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='de_DE', EmailEncodingKey='UTF-8', 
                            LanguageLocaleKey='de');    
        insert user2;
        system.runas(user1){
            
        User user = [SELECT Name, Id FROM User where isActive = true  AND DelegatedApproverId <> NULL limit 1];
        User user3 = [SELECT Name, Id FROM User where isActive = true AND out_of_office__c = true  AND DelegatedApproverId <> NULL limit 1];
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        //mansi
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'escalatedToBuAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;
        
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;
        
        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Submitted';
        prObj.Current_Level__c ='1';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user3.id;
        prObj.Approver2__c = user.id;
        prObj.Approver3__c = user.id;
        prObj.Approver4__c = user.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user3.Id;
        prObj.SoldTo_Code__c = 'Test';
        insert prObj;
        
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='2';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        prObjFromDB.current_Approver__c = user3.Id;
        prObjFromDB.SoldTo_Code__c = 'Test';
        upsert prObjFromDB;
        
        try{
        prObjFromDB.Sent_to_Backup_Approver__c = true;
        prObjFromDB.Sent_to_BUadmin__c = true;
        upsert prObjFromDB;
        }catch(Exception e1){}
        
        }
    }    
    
    static testMethod void prBIBUTestMethod13(){
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];

        // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');

        User user1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');         
        insert user1;
        
        User user2 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName', user1.id);   
        insert user2;
        system.runas(user1){
       PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
            
        User user = user2;
        EmailTemplate e = [SELECT Id FROM EmailTemplate Limit 1];
        
        PA_Email_Template_Custom_Settings__c p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationtoBUAdmin';
        p.Template_Id__c = e.Id;
        insert p;
        
        /*p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationToBackupApprover';
        p.Template_Id__c = e.Id;
        insert p;*/
        
        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'EscalationNotificationNoBackup';
        p.Template_Id__c = e.Id;
        insert p;

        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'FinalApprovalNotification';
        p.Template_Id__c = e.Id;
        insert p;

        p = new PA_Email_Template_Custom_Settings__c();
        p.Name = 'OnBehalfNotification';
        p.Template_Id__c = e.Id;
        insert p;          
            
        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'BI EMEA Surfaces';
        insert orgGrp;

        Pricing_Request__c prObj = new Pricing_Request__c();
        prObj.Request_Approval_Status__c = 'Draft';
        prObj.Current_Level__c ='3';
        prObj.BU__c = 'BI EMEA Surfaces';
        prObj.Approver1__c = user.id;
        prObj.Approver2__c = user.id;
        prObj.Approver3__c = user.id;
        prObj.Approver4__c = user.id;
        prObj.Approver5__c = user.id;
        prObj.current_Approver__c = user.Id;
        prObj.SoldTo_Code__c='Test';
        prObj.SAP_Cluster__c='GP1';
        prObj.Sales_Org_Code__c = 'A640';
        prObj.Dist_Channel_Code__c = '10';
        prObj.Division_Code__c = '02';
        insert prObj;
                
        Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
        prItem.Pricing_Request__c = prObj.id;
        prItem.Key_Combination__c='Salea Area/Material';
        insert prItem;
        
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
        
        //added by sumita to fix code coverage 22 Jan 2016 start
        List<Organizational_Group_User__c> ogUserList = new List<Organizational_Group_User__c>();
        Organizational_Group_User__c ogUser = new Organizational_Group_User__c();
        ogUser.Organizational_Group_Item__c=orgItemList[0].id;
        ogUser.OrgGroup__c=salesArea.id;
        ogUser.Related_User__c=UserInfo.getUserId();
        ogUserList.add(ogUser);
        Organizational_Group_User__c ogUser1 = new Organizational_Group_User__c();
        ogUser1.Organizational_Group_Item__c=orgItemList[0].id;
        ogUser1.OrgGroup__c=salesArea.id;
        ogUser1.Related_User__c=UserInfo.getUserId();
        ogUserList.add(ogUser1);
        insert ogUserList;
        //added by sumita to fix code coverage 22 Jan 2016 end
         
        Pricing_Request__c prObjFromDB = [SELECT id FROM Pricing_Request__c WHERE id = :prObj.id];
        
        prObjFromDB.Current_Level__c ='4';
        prObjFromDB.Approver1__c = user.id;
        prObjFromDB.Approver2__c = user.id;
        prObjFromDB.Approver3__c = user.id;
        prObjFromDB.Approver4__c = user.id;
        prObjFromDB.Approver5__c = user.id;
        /********************/
        prObjFromDB.Backup_Level_1__c = user.Id;
        prObjFromDB.Backup_Level_2__c = user.Id;
        prObjFromDB.Backup_Level_3__c = user.Id;
        prObjFromDB.Backup_Level_4__c = user.Id;
        prObjFromDB.Backup_Level_5__c = user.Id;
        /*******************/   
        prObjFromDB.BU__C = Business.Business__c;
        prObjFromDB.Sales_Org_Code__c = null ;//salesArea.ERP_Sales_Org_code__c;
        prObjFromDB.Dist_Channel_Code__c = null ;//salesArea.ERP_Distribution_Channel_Code__c;
        prObjFromDB.Division_Code__c = null ;// salesArea.ERP_Division_code__c;
        prObjFromDB.SoldTo_Code__c = 'Test';
        prObjFromDB.SAP_Cluster__c = null;
        upsert prObjFromDB;
        
        ERP_Customer__c erpCustomer = new ERP_Customer__c();
        erpCustomer.Name='erpCustomer';
        erpCustomer.External_ERP_ID__c = prObjFromDB.SAP_Cluster__c + '-' + prObjFromDB.SoldTo_Code__c + '-' + prObjFromDB.Sales_Org_Code__c + '-' + prObjFromDB.Dist_Channel_Code__c + '-' + prObjFromDB.Division_Code__c;  
        erpCustomer.Sales_Org_Code__c= '234567';
        erpCustomer.Division_Code__c= '345678';    
        erpCustomer.Distribution_Channel_Code__c= '456789';                
        erpCustomer.Street__c= 'street';    
        erpCustomer.City__c= 'city';    
        erpCustomer.Country__c= 'country';    
        erpCustomer.ZIP_Postal_Code__c= '123456';    
        erpCustomer.Customer_code__c= 'Test';                               
            
        insert erpCustomer;    
        
        ERP_Relationship__c erpRelationship = new ERP_Relationship__c();
        erpRelationship.ERP_Customer__c=erpCustomer.id;
        erpRelationship.user__c=user.id;
        erpRelationship.Partner_Function_Code__c = 'ZR';     
        insert erpRelationship;   
        
       
        system.debug('ERP Ext ID 2 ::: ' + erpCustomer.External_ERP_ID__c + '  ::: ' + erpRelationship.user__c);
        try{
        prObjFromDB.Request_Approval_Status__c = 'Submitted';            
        upsert prObjFromDB; 
        }
        catch(Exception e2){}
        }
    }    
}