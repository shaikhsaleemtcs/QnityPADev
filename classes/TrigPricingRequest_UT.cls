@istest
public class TrigPricingRequest_UT {
    
    static testMethod void tiggerHandTest() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        
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
            
            p = new PA_Email_Template_Custom_Settings__c();
            p.Name = 'EscalationNotificationNoBackup';
            p.Template_Id__c = e.Id;
            insert p;
            
            p = new PA_Email_Template_Custom_Settings__c();
            p.Name = 'escalatedToBuAdmin';
            p.Template_Id__c = e.Id;
            insert p;
            
            OrgGroup__c orgGrp = new OrgGroup__c();
            orgGrp.Business__c = 'BI EMEA Surfaces1';
            insert orgGrp;  
            
            Pricing_Request__c prObj = new Pricing_Request__c();
            prObj.Request_Approval_Status__c = 'Submitted';
            prObj.BU__c = 'BI EMEA Surfaces1';
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
            prObjFromDB.Request_Approval_Status__c='Draft';
            upsert prObjFromDB;  
            
            /******************************/
            Pricing_Request_Item__c prItem1 = new Pricing_Request_Item__c();        
            prItem1.Pricing_Request__c = prObjFromDB.id;        
            prItem1.Key_Combination__c='Salea Area/Material'; 
            prItem1.Net_Price_Status__c = 'Waiting For Net Price';           
            insert prItem1; 
            /*****************************/
            
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
            
            prObjFromDB.Current_Level__c ='2';
            prObjFromDB.Approver1__c = user.id;
            prObjFromDB.Approver2__c = user.id;
            prObjFromDB.Approver3__c = user.id;
            prObjFromDB.Approver4__c = user.id;
            prObjFromDB.Approver5__c = user.id;
            prObjFromDB.Approver2_Date__c = system.now();
            prObjFromDB.NPC_Status__c='Waiting For Net Price';
            prObjFromDB.Request_Approval_Status__c='Validated'; 
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
                //delete prObjFromDB;
            }catch(exception e1){}
            Pricing_Request__c prObj22 = new Pricing_Request__c();
            prObj22.Request_Approval_Status__c = 'Submitted';
            prObj22.BU__c = 'BI EMEA Surfaces1';
            prObj22.NPC_Status__c ='Waiting for Submission';
            insert prObj22;  
            list<Pricing_Request__c> delpr = [Select id from Pricing_Request__c where id=:prObj22.id];
            delete delpr;
            
        }
    }
    
}