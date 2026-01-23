// Please dont edit this class - if this is throwing any error please inform nitin_s01@infosys.com
/*
Date : 29/12/2016
Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
Date : 26/8/2022
Chnage: Adding Sales Order item for covering code <SS20220826>
*/
@isTest
private class PAOrganizationalGroupItems_UT {
    
    static testMethod void pAOrganizationalGroupItemsTestMethod() {
        
        //Bala - start 
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        /*
        system.debug('#### p1'+p1);
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
        // [27122016] Merge&Spin: Updated External ERP Id to Dummy Value    
        //sales Admin Permission Set
        User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest1',UserRoleId=r.id,profileid = p1.id,
                         Username='pa_werner1@jhhgtestinfosys.com.test2',
                         LastName='Coppens', CommunityNickname='acv',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User u1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert u1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
       

        System.runAs(u1)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                        From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
                                        
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_UoM__c='kg;lb', ERP_Currency__c=null));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=31,Max_Valid_From_Offset_Cust_Spec__c=91,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=10,Latest_Valid_To_Offset_Cust_Spec__c=25,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=25/*,Approval_Escalation_Price_Requests=6*/));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Price_Requests=5*/));                               
            
            insert orgItemList;
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
            
            Test.StartTest();
            
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u1.Id;
                        
            PAOrganizationalGroupItems orgItems = new PAOrganizationalGroupItems();
            orgItems.selectedBU = Business.id;    
            orgItems.getListOptions();
            orgItems.getListBusinessComponents();
            orgItems.value='SASetup';
            orgItems.setSelectedRecordId(orgItemList[0].id);
            orgItems.getselectedRecordId();
            orgItems.getListWrappers();
            orgItems.deleteRecord();
            orgItems.getName(); 
            orgItems.pricingProcedureId = pp.id;
            orgItems.pricCond = pcList[0].id;
            //orgItems.save();
            orgItems.getAccessProcedureWrappper();
            orgItems.getOrgGroupItems();
            List<SelectOption> selectedUoM=orgItems.selectedUomValues;
            List<SelectOption> selectedCurr=orgItems.selectedCurrencyValues;
            List<SelectOption> getallUoM=orgItems.getALLUom;
            List<SelectOption> getAllCurrency=orgItems.getAllCurrency;
            
            //adding for listValues 
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                    new List<ERP_Customer_Material_Key__c >();   
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Customer Price Group',Code__c='A1',Name__c='CPG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Price Group',Code__c='M1',Name__c='MPG1'));          
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price List Type',Code__c='M1',Name__c='Price List'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Country',Code__c='LU',Name__c='Luxemburg'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Office',Code__c='A11',Name__c='Sales Office'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 3',Code__c='M3',Name__c='MPG3'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price Zone',Code__c='p1',Name__c='pz1'));
            insert ERPCustomerMaterialKeyList;
            
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                Organizational_Group_Item__c=orgItemList[0].id));
                
            }
            insert orgGroupKeyList;
            
            orgItems.getListUnselectedMPG();
            orgItems.getListUnselectedPLType();
            orgItems.getListUnselectedCountry();
            orgItems.getListUnselectedSO();
            orgItems.getListUnselectedMG3();orgItems.getListUnselectedMG4();
            List<string> x = orgItems.ListSelectedMG4;
            x = orgItems.listSelectedMG3;
            x =orgItems.listSelectedSO;
            x = orgItems.listSelectedCountry ;
            x = orgItems.listSelectedPLType;
            x = orgItems.listSelectedMPG; 
            x = orgItems.listSelectedCPG ;
            x = orgItems.listUnselectedCPG; 
            try
            {
                string s = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().contains('Please enter value for mandatory field \'Approval Setup Escalation Time\''),e.getMessage());
                //pavan
                System.assert(e.getMessage().contains('Please enter value for mandatory field \'Latest Valid To Offset'),e.getMessage());
            }
            orgItems.setSelectedRecordId(orgItemList[1].id);
            try
            {
            string s1 = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {   
                System.debug('vipul message' + e.getMessage());
              /*  System.assert(e.getMessage().contains('Earliest Valid From Offset cannot be greater than 30 Days'),e.getMessage());    */         
             /* System.assert(e.getMessage().contains('Approval Setup Escalation Time should be in the range of 1 to 5'),e.getMessage());*/
            }
            //for options >1
            PAOrganizationalGroupItems orgItems1 = new PAOrganizationalGroupItems();
            orgItems1.value='Import';
            orgItems1.selectedBU = Business.id; 
            //orgItems1.orgGroupItems=orgItemList[1].id;
            orgItems1.getListOptions();
            
            PAOrganizationalGroupItems orgItems2 = new PAOrganizationalGroupItems();
            orgItems2.value='BUSetup';
            orgItems2.setSelectedRecordId(Business.id);
            orgItems2.selectedBU = Business.id; 
            orgItems2.getListWrappers();
            
            PAOrganizationalGroupItems orgItems3 = new PAOrganizationalGroupItems();
            orgItems3.selectedBU = null;
            orgItems3.getListOptions(); 
            
            PAOrganizationalGroupItems orgItems4 = new PAOrganizationalGroupItems();
            orgItems4.value='changeSalesAreaClone';
            orgItems4.setSelectedRecordId(Business.id);
            orgItems4.selectedBU = Business.id; 
            orgItems4.getListWrappers();
            
            try
            {
                string s = orgItems3.action('PAGlobalConfig','PAGlobalConfig','BUSetup');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().contains('Business'),e.getMessage());
            }
            //pavan
            /*PAOrganizationalGroupItems orgItems4 = new PAOrganizationalGroupItems();
            orgItems4.selectedBU = Business.id; 
            orgItems4.setSelectedRecordId(orgItemList[2].id);
            orgItems4.save();
            orgItems4.priceMasterPA();
            string s1 = orgItems4.action('PAGlobalConfig','PAGlobalConfig','SASetup');
            
            PAOrganizationalGroupItems orgItems5 = new PAOrganizationalGroupItems();
            orgItems5.selectedBU = Business.id; 
            orgItems5.setSelectedRecordId(orgItemList[2].id);
            orgItems5.save();
            string s2 = orgItems5.action('PAGlobalConfig','PAGlobalConfig','BackToHome');
            
            PAOrganizationalGroupItems orgItems6 = new PAOrganizationalGroupItems();
            orgItems6.selectedBU = Business.id; 
            orgItems6.setSelectedRecordId(orgItemList[2].id);
            orgItems6.save();*/
           // string s3 = orgItems6.action('PAGlobalConfig','PAGlobalConfig','backPriceMasterToConfig');            
        
            orgItems.setSelectedRecordId(orgItemList[1].id);
            selectedCurr=orgItems.selectedCurrencyValues;
            List<SelectOption> opts= orgItems.getAllCG4;

        }      
        Test.StopTest();    
    }

    static testMethod void pAOrganizationalGroupItemsTestMethod2() {
        
        //Bala - start 
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        /*
        system.debug('#### p1'+p1);
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
         //[27122016] Merge&Spin: Updated External ERP Id to Dummy Value  
        //sales Admin Permission Set
        User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest2',UserRoleId=r.id,profileid = p1.id,
                         Username='pa_werner1@jhhgtestinfosys.com.test2',
                         LastName='Coppens', CommunityNickname='acv',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User u1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert u1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
       

        System.runAs(u1)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                        From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
                                        
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
             Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Price_Requests=5*/));                               
            
            insert orgItemList;
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
            
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u1.Id;
            
            Test.StartTest();
            
            PAOrganizationalGroupItems orgItems = new PAOrganizationalGroupItems();
            orgItems.selectedBU = Business.id;    
            orgItems.getListOptions();
            orgItems.getListBusinessComponents();
            orgItems.value='SASetup';
            orgItems.setSelectedRecordId(orgItemList[0].id);
            orgItems.getselectedRecordId();
            orgItems.getListWrappers();
            orgItems.deleteRecord();
            orgItems.getName(); 
            orgItems.pricingProcedureId = pp.id;
            orgItems.pricCond = pcList[0].id;
            //orgItems.save();
            orgItems.getAccessProcedureWrappper();
            orgItems.getOrgGroupItems();
            
            //adding for listValues 
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                    new List<ERP_Customer_Material_Key__c >();   
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Customer Price Group',Code__c='A1',Name__c='CPG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Price Group',Code__c='M1',Name__c='MPG1'));          
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price List Type',Code__c='M1',Name__c='Price List'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Country',Code__c='LU',Name__c='Luxemburg'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Office',Code__c='A11',Name__c='Sales Office'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 3',Code__c='M3',Name__c='MPG3'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='Z0',Name__c='Others'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Value Center',Code__c='VC0',Name__c='Others'));     //<SS20230501> - START
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 2',Code__c='M2',Name__c='MPG2'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Ext Matl Grp',Code__c='E1',Name__c='EMG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price Zone',Code__c='P1',Name__c='PZ1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Distributor Code',Code__c='D4',Name__c='DC4'));  //<SS20230501> - END
            insert ERPCustomerMaterialKeyList;
            
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                Organizational_Group_Item__c=orgItemList[0].id));
                
            }
            insert orgGroupKeyList;
            
            orgItems.getListUnselectedMPG();
            orgItems.getListUnselectedPLType();
            orgItems.getListUnselectedCountry();
            orgItems.getListUnselectedSO();
            orgItems.getListUnselectedMG3();orgItems.getListUnselectedMG4();
            orgItems.getListUnselectedItem();
            orgItems.getListUnselectedVC();     //<SS20230501> - START
            orgItems.getListUnselectedMG2();
            orgItems.getListUnselectedEMG();
            orgItems.getListUnselectedPZ();   //<SS20230501> - END
            List<string> x = orgItems.ListSelectedMG4;
            x = orgItems.listSelectedMG3;
            x =orgItems.listSelectedSO;
            x = orgItems.listSelectedCountry ;
            x = orgItems.listSelectedPLType;
            x = orgItems.listSelectedMPG; 
            x = orgItems.listSelectedCPG ;
            x = orgItems.listUnselectedCPG;
            x = orgItems.ListSelectedCPGReturn;
            x = orgItems.ListSelectedMPGReturn;
            x = orgItems.ListSelectedPLTReturn;
            x = orgItems.ListSelectedSOReturn;
            x = orgItems.ListSelectedCountryReturn;
            x = orgItems.ListSelectedMG3Return;
            x = orgItems.ListSelectedMG4Return;
            x = orgItems.listSelectedVC;    //<SS20230501> - START
            x = orgItems.listSelectedMG2;
            x = orgItems.listSelectedEMG;
            x = orgItems.listSelectedDist;
            x = orgItems.listSelectedPZ;  //<SS20230501> - END
            orgItems.ListSelectedCPGReturn = new List<string>{'Z0-Others','AU-Aus-xxx'};
            orgItems.save();
            
            
            
            orgItems.getOrganizationalGroupItem();
            
            //676
            try
            {
            orgItems.action('','','SASetupSave');
            }
            Catch(Exception e)
            {
            System.debug(e.getMessage());
            }
            //Cancel
            orgItems.action('','','Cancel');
            
            //Massive
            orgItems.action('','','Massive');
            
            try
            {
            //Import
            orgItems.action('','','ImportPrices');
            }
            catch(Exception e){}
            
            orgItems.selectedBU = Business.id;
            orgItems.value = 'Import';    
            orgItems.getListOptions();
            orgItems.action('','','ImportPrices');
            
            //Export
            orgItems.action('','','ExportPrices');
            
            orgItems.value = 'Import';    
            orgItems.getListOptions();
            //Non Cust
            orgItems.action('','','NonCustomerSpecific');
            
            orgItems.value = 'Draft';
            //Draft
            orgItems.getListOptions();
            orgItems.action('','','Draft');
           
            
           // try
            //{
            //Submitted
            orgItems.action('','','Submitted');
            //}catch(Exception e){}
            
            try
            {
            //Approved
            orgItems.action('','','Approved');
            }catch(Exception e){}
            
            try
            {
            //Rejected
            orgItems.action('','','Rejected');
            }catch(Exception e){}
            
            try
            {
            //Recalled
            orgItems.action('','','Recalled');
            }catch(Exception e){}
            
            try
            {
            //Pending
            orgItems.action('','','Pending');
            }catch(Exception e){}
            
            try
            {
            //ApprovalSetup
            orgItems.action('','','ApprovalSetup');
            }catch(Exception e){}
            
            //MDM
            orgItems.action('','','MDM');
            
            //backPriceMaster
            orgItems.action('','','backPriceMaster');
            
            //return null getOrgGroupItems
            orgItems.pricingProcedureId = null;
            orgItems.getOrgGroupItems();
            orgItems.getAccessProcedureWrappper();
            
            //getOrganizationalGroupItem
            orgItems.pricingProcedureId = null;
             orgItems.getOrganizationalGroupItem();
             
            //for page 
             
            System.currentPageReference().getParameters().put('id',pp.id);
             orgItems.getOrganizationalGroupItem();
             
             Test.StopTest();
            
       }              
        
    }
    
    //New method by Vipul
    static testMethod void pAOrganizationalGroupItemsTestMethod3() {
        
        //Bala - start 
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        /*
        system.debug('#### p1'+p1);
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
        //[27122016] Merge&Spin: Updated External ERP Id to Dummy Value   
        //sales Admin Permission Set
        User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest3',UserRoleId=r.id,profileid = p1.id,
                         Username='pa_werner1@jhhgtestinfosys.com.test2',
                         LastName='Coppens', CommunityNickname='acv',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User u1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert u1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
       

        System.runAs(u1)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                        From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
                                        
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
             Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Price_Requests=5*/));                               
            
            insert orgItemList;
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
            
            Test.StartTest();
            
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u1.Id;
            
            PAOrganizationalGroupItems orgItems = new PAOrganizationalGroupItems();
            orgItems.selectedBU = Business.id;    
            orgItems.getListOptions();
            orgItems.getListBusinessComponents();
            orgItems.value='SASetup';
            orgItems.setSelectedRecordId(orgItemList[0].id);
            orgItems.getselectedRecordId();
            orgItems.getListWrappers();
            orgItems.deleteRecord();
            orgItems.getName(); 
            orgItems.pricingProcedureId = pp.id;
            orgItems.pricCond = pcList[0].id;
            //orgItems.save();
            orgItems.getAccessProcedureWrappper();
            orgItems.getOrgGroupItems();
            
            //adding for listValues 
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                    new List<ERP_Customer_Material_Key__c >();   
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Customer Price Group',Code__c='A1',Name__c='CPG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Price Group',Code__c='M1',Name__c='MPG1'));          
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price List Type',Code__c='M1',Name__c='Price List'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Country',Code__c='LU',Name__c='Luxemburg'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Office',Code__c='A11',Name__c='Sales Office'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 3',Code__c='M3',Name__c='MPG3'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='Z0',Name__c='Others'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Type',Code__c='Z0',Name__c='Others'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Item',Code__c='Z0',Name__c='Others')); // <SS20220826>
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Plant',Code__c='Z0',Name__c='Others'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Shipping Condition',Code__c='Z0',Name__c='Others'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Destination Country',Code__c='Z0',Name__c='Others'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Pricing Exception',Code__c='Z0',Name__c='Others'));

            
            insert ERPCustomerMaterialKeyList;
            
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                Organizational_Group_Item__c=orgItemList[0].id));
                
            }
            insert orgGroupKeyList;
            orgItems.priceMasterPA();
            orgItems.getListUnselectedTOP();
            orgItems.getListUnselectedVariant();
            orgItems.getListUnselectedSalesOrderType();
            orgItems.getListUnselectedSalesOrderType();
            orgItems.getListUnselectedSalesOrderItem(); //<SS20220826>
            orgItems.getListUnselectedPlant();
            orgItems.getListUnselectedShippingCondition();
            orgItems.getListUnselectedDestinationCountry();
            orgItems.getListUnselectedPE();
            orgItems.priceMasterPA();
            orgItems.getAccessProcedureWrappper();
                orgItems.getOrgGroupItems();
                orgItems.getOrganizationalGroupItem();
                orgItems.getAllBusinessUsersInfo();
                orgItems.selectedRecordId=String.valueOf([SELECT id from Organizational_Group_Item__c where id=:orgItemList[0].id]);
                
                Test.StopTest();
        }
    }
    //pavan
    static testMethod void pAOrganizationalGroupItemsTestMethod4() {
        
        //Bala - start 
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        /*
        system.debug('#### p1'+p1);
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
        //[27122016] Merge&Spin: Updated External ERP Id to Dummy Value   
        //sales Admin Permission Set
        User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest4',UserRoleId=r.id,profileid = p1.id,
                         Username='pa_werner1@jhhgtestinfosys.com.test2',
                         LastName='Coppens', CommunityNickname='acv',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User u1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert u1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
       

        System.runAs(u1)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                        From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
                                        
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c=null));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=31,Max_Valid_From_Offset_Cust_Spec__c=91,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=10,Latest_Valid_To_Offset_Cust_Spec__c=25,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=25/*,Approval_Escalation_Price_Requests=6*/));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Price_Requests=5*/));                               
            
            insert orgItemList;
            //Pooja
            Organizational_Group_Item__c test1 = new Organizational_Group_Item__c();
            test1.Business__c=Business.id;
            test1.OrgGroup__c=salesArea.id;
            test1.ERP_Pricing_Procedure__c=pp.id;
            test1.Customer_Request_Reasons__c='A;B';
            test1.Approval_Escalation_Price_Requests__c='2 Days';
            test1.Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B';
            test1.ERP_Currency__c=null;
            test1.Enable_Request_Class__c=true;
            test1.Request_Class__c='Request Class1';
            test1.ERP_Material_Group2_Code__c='test';
            test1.Customer_Group_4_Auto_Approval__c='tes;tes1;test3';
            insert test1;
            //End Pooja
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
            
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u1.Id;
            
            //pricing request//Pooja
            Pricing_Request__c pr1 = new Pricing_Request__c();

            pr1.Sold_To__c='Customer1';
            pr1.SoldTo_Code__c='5512345';
            pr1.Sales_Org_Code__c='A640';
            pr1.SAP_Client_Id__c='510';
            pr1.SAP_Application_Id__c='V';
            pr1.Request_Type__c='Customer Specific';
            pr1.Request_Reason__c='test;test1';
            pr1.Request_Name__c='test123';
            pr1.Pricing_Request_Type__c='Pricing Task';
            pr1.Division_Code__c='02';
            pr1.Dist_Channel_Code__c='10';
            pr1.Customer_Specific__c=true;
            pr1.BU__c='BI EMEA SURFACES';
            pr1.Request_Approval_Status__c='Draft';
            pr1.Spot_Type__c='not null';
            
            insert pr1;

            //End Pooja
            /*  
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Customer Specific',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Permanent',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=true,BU__c='BI EMEA SURFACES1',Request_Approval_Status__c='Draft',
            Spot_Type__c='not null'));

            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Non Customer Specific',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Permanent',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=false,BU__c='BI EMEA SURFACES2',Request_Approval_Status__c='Draft',
            Spot_Type__c='not null'));

            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Customer Specific',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=true,BU__c='BI EMEA SURFACES3',Request_Approval_Status__c='Draft',
            Spot_Type__c='Rebate Agreement'));

            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Import',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Import',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=true,BU__c='BI EMEA SURFACES5',Request_Approval_Status__c='Draft',
            Spot_Type__c='Rebate Agreement'));    

            //inserting pricing request            
            insert prList;*/
                        
            PAOrganizationalGroupItems orgItems = new PAOrganizationalGroupItems();
            orgItems.selectedBU = Business.id;    
            orgItems.getListOptions();
            orgItems.getListBusinessComponents();
            orgItems.value='SASetup';
            orgItems.setSelectedRecordId(orgItemList[0].id);
            orgItems.getselectedRecordId();
            orgItems.getListWrappers();
            orgItems.deleteRecord();
            orgItems.getName(); 
            orgItems.pricingProcedureId = pp.id;
            orgItems.pricCond = pcList[0].id;
            //orgItems.save();
            orgItems.getAccessProcedureWrappper();
            orgItems.getOrgGroupItems();
            
            //adding for listValues 
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                    new List<ERP_Customer_Material_Key__c >();   
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Customer Price Group',Code__c='A1',Name__c='CPG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Price Group',Code__c='M1',Name__c='MPG1'));          
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price List Type',Code__c='M1',Name__c='Price List'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Country',Code__c='LU',Name__c='Luxemburg'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Office',Code__c='A11',Name__c='Sales Office'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 3',Code__c='M3',Name__c='MPG3'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales District',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 1',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Incoterms',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Campaign',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Document Currency',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='State',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales District',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 5',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Terms of Payment',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Variant',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Type',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Item',Code__c='M4',Name__c='MPG4')); //<SS20220826>
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Plant',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Shipping Condition',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Destination Country',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='pricing Exception',Code__c='M4',Name__c='MPG4'));

            
            insert ERPCustomerMaterialKeyList;
            
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                Organizational_Group_Item__c=orgItemList[0].id));
                
            }
            insert orgGroupKeyList;
            
            Test.StartTest();
            
            orgItems.getListUnselectedMPG();
            orgItems.getListUnselectedPLType();
            orgItems.getListUnselectedCountry();
            orgItems.getListUnselectedSO();
            orgItems.getListUnselectedMG3();orgItems.getListUnselectedMG4();
            orgItems.rebateQuotesCheck('5512345', '5512345');
            orgItems.getlistUnselectedSD();
            orgItems.getlistUnselectedMG1(); 

            List<string> x = orgItems.ListSelectedMG4;
            x = orgItems.listSelectedMG3;
            x =orgItems.listSelectedSO;
            x = orgItems.listSelectedCountry ;
            x = orgItems.listSelectedPLType;
            x = orgItems.listSelectedMPG; 
            x = orgItems.listSelectedCPG ;
            x = orgItems.listUnselectedCPG;
            x = orgItems.listSelectedMG1 ;
            x = orgItems.listSelectedIncoterms;
            x = orgItems.listSelectedCampaign ;
            x = orgItems.listSelectedDocumentCurrency ;
            x = orgItems.listSelectedState ;
            x = orgItems.listSelectedSD ;
            x = orgItems.listSelectedTOP ;
            x = orgItems.listSelectedVariant ;
            x = orgItems.listSelectedSOT ;
            x = orgItems.listSelectedItem;      //<SS20220826>
            x = orgItems.listSelectedPlant ;
            x = orgItems.listSelectedShippingCondition ;
            x = orgItems.listSelectedDestinationCountry ;
            x = orgItems.listSelectedPE;
            x = orgItems.listSelectedMG5;
            x = orgItems.listSelectedVC;
            String whereClause=orgItems.phWhereClause;
            String phFields=PAOrganizationalGroupItems.phFieldsList;
            String phSobj=PAOrganizationalGroupItems.phSObjectType;
                        
            try
            {
                string s = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().contains('Please enter value for mandatory field \'Approval Setup Escalation Time\''),e.getMessage());
                //pavan
                System.assert(e.getMessage().contains('Please enter value for mandatory field \'Latest Valid To Offset'),e.getMessage());
            }
            orgItems.setSelectedRecordId(orgItemList[1].id);
            try
            {
            string s1 = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {   
                System.debug('vipul message' + e.getMessage());
              /*  System.assert(e.getMessage().contains('Earliest Valid From Offset cannot be greater than 30 Days'),e.getMessage());    */         
             /* System.assert(e.getMessage().contains('Approval Setup Escalation Time should be in the range of 1 to 5'),e.getMessage());*/
            }
            //for options >1
            /*/PAOrganizationalGroupItems orgItems1 = new PAOrganizationalGroupItems();
            orgItems1.value='Import';
            orgItems1.selectedBU = Business.id; 
            //orgItems1.orgGroupItems=orgItemList[1].id;
            orgItems1.getListOptions();
            
            PAOrganizationalGroupItems orgItems2 = new PAOrganizationalGroupItems();
            orgItems2.value='BUSetup';
            orgItems2.setSelectedRecordId(Business.id);
            orgItems2.selectedBU = Business.id; 
            orgItems2.getListWrappers();
            
            PAOrganizationalGroupItems orgItems3 = new PAOrganizationalGroupItems();
            orgItems3.selectedBU = null;
            orgItems3.getListOptions(); 
            try
            {
                string s = orgItems3.action('PAGlobalConfig','PAGlobalConfig','BUSetup');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().contains('Business'),e.getMessage());
            }*/
            
            PAOrganizationalGroupItems orgItems4 = new PAOrganizationalGroupItems();
            orgItems4.selectedBU = Business.id; 
            orgItems4.setSelectedRecordId(orgItemList[2].id);
            orgItems4.save();
            orgItems4.priceMasterPA();
            string s1 = orgItems4.action('PAGlobalConfig','PAGlobalConfig','SASetup');
            
            PAOrganizationalGroupItems orgItems5 = new PAOrganizationalGroupItems();
            orgItems5.selectedBU = Business.id; 
            orgItems5.setSelectedRecordId(orgItemList[2].id);
            orgItems5.save();
            string s2 = orgItems5.action('PAGlobalConfig','PAGlobalConfig','BackToHome');
            
            PAOrganizationalGroupItems orgItems6 = new PAOrganizationalGroupItems();
            orgItems6.selectedBU = Business.id; 
            orgItems6.setSelectedRecordId(orgItemList[2].id);
            orgItems6.save();
           // string s3 = orgItems6.action('PAGlobalConfig','PAGlobalConfig','backPriceMasterToConfig');
           
           //Pooja
            PAOrganizationalGroupItems orgItems7 = new PAOrganizationalGroupItems();
            orgItems7.selectedBU = Business.id;
            orgItems7.selectedUser='meeee';
            orgItems7.isOnbehalfOf=false;
            orgItems7.userName='meee*starstar';
            orgItems7.customerCurrency=false;
            orgItems7.reportUrl='what';
            orgItems7.isViewCustomerPrices='abc';
            orgItems7.isViewPLPrices='cdf';
            orgItems7.isProjectGroupMember=false;
            orgItems7.showPopup=null;
            orgItems7.showLookup='abcde';
            orgItems7.ogItemFromRequest(pr1);
            
            PAOrganizationalGroupItems orgItems8 = new PAOrganizationalGroupItems();
            orgItems8.selectedBU = Business.id;
            List<SelectOption> reqq = orgItems8.requestClassList;
            List<User> list11=orgItems8.allSalesReps;
            boolean a = orgItems8.showPRReport;
            List<PAWrapper> pawrap = orgItems8.businessUsersWrapList; 
            SelectOption[] abc = orgItems8.allMG2;
            Map<String,String> map1 = orgItems8.countOfReqToStatusMap;
            orgItems8.getListUnselectedCampaign();               
            orgItems8.getListUnselectedDocumentCurrency();
            orgItems8.getListUnselectedState();
            orgItems8.getListUnselectedTOP();
            orgItems8.getListUnselectedVariant();
            List<SelectOption> selMG2Val=orgItems8.selectedMG2Values;
            
            orgItems8.orgGroupItems=test1;
            selMG2Val=orgItems8.selectedMG2Values;
            
            List<SelectOption> cg4Values= orgItems8.selectedCG4Values;
            
            //Pooja End        
        }      
        Test.StopTest();    
    }
    
    //new method
    static testMethod void pAOrganizationalGroupItemsTestMethod5() {
        
        //Pooja Changed profile to requester
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
        /*
        system.debug('#### p1'+p1);
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
        //[27122016] Merge&Spin: Updated External ERP Id to Dummy Value   
        //sales Admin Permission Set
        User u1 = new User(Alias='pcopp', Email='ambili_vinay@infosys.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest5',UserRoleId=r.id,profileid = p1.id,
                         Username='pa_werner1@jhhgtestinfosys.com.test2',
                         LastName='Coppens', CommunityNickname='acv',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
        */
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User u1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert u1;
        //End: Updated as a part of Merge & Spin to the change the UserRole name.
        //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
       

        System.runAs(u1)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A580'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                        From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
                                        
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c=null));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=31,Max_Valid_From_Offset_Cust_Spec__c=91,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=10,Latest_Valid_To_Offset_Cust_Spec__c=25,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=25/*,Approval_Escalation_Price_Requests=6*/));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Price_Requests=5*/));                               
            
            insert orgItemList;
            //Pooja
            Organizational_Group_Item__c test1 = new Organizational_Group_Item__c();
            test1.Business__c=Business.id;
            test1.OrgGroup__c=salesArea.id;
            test1.ERP_Pricing_Procedure__c=pp.id;
            test1.Customer_Request_Reasons__c='A;B';
            test1.Approval_Escalation_Price_Requests__c='2 Days';
            test1.Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B';
            test1.ERP_Currency__c=null;
            test1.Enable_Request_Class__c=true;
            test1.Request_Class__c='Request Class1';
            insert test1;
            //End Pooja
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
            
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u1.Id;
            
            //pricing request//Pooja
            Pricing_Request__c pr1 = new Pricing_Request__c();

            pr1.Sold_To__c='Customer1';
            pr1.SoldTo_Code__c='5512345';
            pr1.Sales_Org_Code__c='A640';
            pr1.SAP_Client_Id__c='510';
            pr1.SAP_Application_Id__c='V';
            pr1.Request_Type__c='Customer Specific';
            pr1.Request_Reason__c='test;test1';
            pr1.Request_Name__c='test123';
            pr1.Pricing_Request_Type__c='Pricing Task';
            pr1.Division_Code__c='02';
            pr1.Dist_Channel_Code__c='10';
            pr1.Customer_Specific__c=true;
            pr1.BU__c='BI EMEA SURFACES';
            pr1.Request_Approval_Status__c='Draft';
            pr1.Spot_Type__c='not null';
            
            insert pr1;
            
            //End Pooja
            
            /*  
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Customer Specific',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Permanent',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=true,BU__c='BI EMEA SURFACES1',Request_Approval_Status__c='Draft',
            Spot_Type__c='not null'));

            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Non Customer Specific',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Permanent',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=false,BU__c='BI EMEA SURFACES2',Request_Approval_Status__c='Draft',
            Spot_Type__c='not null'));

            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Customer Specific',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=true,BU__c='BI EMEA SURFACES3',Request_Approval_Status__c='Draft',
            Spot_Type__c='Rebate Agreement'));

            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',
            Sales_Org_Code__c='A640',SAP_Client_Id__c='510',SAP_Application_Id__c='V',
            Request_Type__c='Import',Request_Reason__c='test',Request_Name__c='test123',
            Pricing_Request_Type__c='Import',Division_Code__c='02',Dist_Channel_Code__c='10',
            Customer_Specific__c=true,BU__c='BI EMEA SURFACES5',Request_Approval_Status__c='Draft',
            Spot_Type__c='Rebate Agreement'));    

            //inserting pricing request            
            insert prList;*/
                        
            PAOrganizationalGroupItems orgItems = new PAOrganizationalGroupItems();
            orgItems.selectedBU = Business.id;    
            orgItems.getListOptions();
            orgItems.getListBusinessComponents();
            orgItems.value='SASetup';
            orgItems.setSelectedRecordId(orgItemList[0].id);
            orgItems.getselectedRecordId();
            orgItems.getListWrappers();
            orgItems.deleteRecord();
            orgItems.getName(); 
            orgItems.pricingProcedureId = pp.id;
            orgItems.pricCond = pcList[0].id;
            //orgItems.save();
            orgItems.getAccessProcedureWrappper();
            orgItems.getOrgGroupItems();
            
            //adding for listValues 
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                    new List<ERP_Customer_Material_Key__c >();   
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Customer Price Group',Code__c='A1',Name__c='CPG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Price Group',Code__c='M1',Name__c='MPG1'));          
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price List Type',Code__c='M1',Name__c='Price List'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Country',Code__c='LU',Name__c='Luxemburg'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Office',Code__c='A11',Name__c='Sales Office'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 3',Code__c='M3',Name__c='MPG3'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales District',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 1',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Incoterms',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Campaign',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Document Currency',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='State',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales District',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 5',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Terms of Payment',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Variant',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Type',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Item',Code__c='M4',Name__c='MPG4')); //<SS20220826>
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Plant',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Shipping Condition',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Destination Country',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='pricing Exception',Code__c='M4',Name__c='MPG4'));

            
            insert ERPCustomerMaterialKeyList;
            
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                Organizational_Group_Item__c=orgItemList[0].id));
                
            }
            insert orgGroupKeyList;
            
            Test.StartTest();
            
            orgItems.getListUnselectedMPG();
            orgItems.getListUnselectedPLType();
            orgItems.getListUnselectedCountry();
            orgItems.getListUnselectedSO();
            orgItems.getListUnselectedMG3();orgItems.getListUnselectedMG4();
           // orgItems.rebateQuotesCheck('5512345');
            orgItems.getlistUnselectedSD();
            orgItems.getlistUnselectedMG1(); 

            List<string> x = orgItems.ListSelectedMG4;
            x = orgItems.listSelectedMG3;
            x =orgItems.listSelectedSO;
            x = orgItems.listSelectedCountry ;
            x = orgItems.listSelectedPLType;
            x = orgItems.listSelectedMPG; 
            x = orgItems.listSelectedCPG ;
            x = orgItems.listUnselectedCPG;
            x = orgItems.listSelectedMG1 ;
            x = orgItems.listSelectedIncoterms;
            x = orgItems.listSelectedCampaign ;
            x = orgItems.listSelectedDocumentCurrency ;
            x = orgItems.listSelectedState ;
            x = orgItems.listSelectedSD ;
            x = orgItems.listSelectedTOP ;
            x = orgItems.listSelectedVariant ;
            x = orgItems.listSelectedSOT ;
            x = orgItems.listSelectedPlant ;
            x = orgItems.listSelectedShippingCondition ;
            x = orgItems.listSelectedDestinationCountry ;
            x = orgItems.listSelectedPE;
            x = orgItems.listSelectedMG5;
            x = orgItems.listSelectedVC;
            x = orgItems.listSelectedPZ;
            String whereClause=orgItems.phWhereClause;
            String phFields=PAOrganizationalGroupItems.phFieldsList;
            String phSobj=PAOrganizationalGroupItems.phSObjectType;
                        
            try
            {
                string s = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().contains('Please enter value for mandatory field \'Approval Setup Escalation Time\''),e.getMessage());
                //pavan
                System.assert(e.getMessage().contains('Please enter value for mandatory field \'Latest Valid To Offset'),e.getMessage());
            }
            orgItems.setSelectedRecordId(orgItemList[1].id);
            try
            {
            string s1 = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {   
                System.debug('vipul message' + e.getMessage());
              /*  System.assert(e.getMessage().contains('Earliest Valid From Offset cannot be greater than 30 Days'),e.getMessage());    */         
             /* System.assert(e.getMessage().contains('Approval Setup Escalation Time should be in the range of 1 to 5'),e.getMessage());*/
            }
            //for options >1
            /*/PAOrganizationalGroupItems orgItems1 = new PAOrganizationalGroupItems();
            orgItems1.value='Import';
            orgItems1.selectedBU = Business.id; 
            //orgItems1.orgGroupItems=orgItemList[1].id;
            orgItems1.getListOptions();
            
            PAOrganizationalGroupItems orgItems2 = new PAOrganizationalGroupItems();
            orgItems2.value='BUSetup';
            orgItems2.setSelectedRecordId(Business.id);
            orgItems2.selectedBU = Business.id; 
            orgItems2.getListWrappers();
            
            PAOrganizationalGroupItems orgItems3 = new PAOrganizationalGroupItems();
            orgItems3.selectedBU = null;
            orgItems3.getListOptions(); 
            try
            {
                string s = orgItems3.action('PAGlobalConfig','PAGlobalConfig','BUSetup');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().contains('Business'),e.getMessage());
            }*/
            
            PAOrganizationalGroupItems orgItems4 = new PAOrganizationalGroupItems();
            orgItems4.selectedBU = Business.id; 
            orgItems4.setSelectedRecordId(orgItemList[2].id);
            orgItems4.save();
            orgItems4.priceMasterPA();
            string s1 = orgItems4.action('PAGlobalConfig','PAGlobalConfig','SASetup');
            
            PAOrganizationalGroupItems orgItems5 = new PAOrganizationalGroupItems();
            orgItems5.selectedBU = Business.id; 
            orgItems5.setSelectedRecordId(orgItemList[2].id);
            orgItems5.save();
            string s2 = orgItems5.action('PAGlobalConfig','PAGlobalConfig','BackToHome');
            
            PAOrganizationalGroupItems orgItems6 = new PAOrganizationalGroupItems();
            orgItems6.selectedBU = Business.id; 
            orgItems6.setSelectedRecordId(orgItemList[2].id);
            orgItems6.save();
           // string s3 = orgItems6.action('PAGlobalConfig','PAGlobalConfig','backPriceMasterToConfig');
           
           //Pooja
            PAOrganizationalGroupItems orgItems7 = new PAOrganizationalGroupItems();
            orgItems7.selectedBU = Business.id;
            orgItems7.selectedUser='meeee';
            orgItems7.isOnbehalfOf=false;
            orgItems7.userName='meee*starstar';
            orgItems7.customerCurrency=false;
            orgItems7.reportUrl='what';
            orgItems7.isViewCustomerPrices='abc';
            orgItems7.isViewPLPrices='cdf';
            orgItems7.isProjectGroupMember=false;
            orgItems7.showPopup=null;
            orgItems7.showLookup='abcde';
            orgItems7.ogItemFromRequest(pr1);
            
            PAOrganizationalGroupItems orgItems8 = new PAOrganizationalGroupItems();
            orgItems8.selectedBU = Business.id;
            List<SelectOption> reqq = orgItems8.requestClassList;
            List<User> list11=orgItems8.allSalesReps;
            boolean a = orgItems8.showPRReport;
            List<PAWrapper> pawrap = orgItems8.businessUsersWrapList; 
            SelectOption[] abc = orgItems8.allMG2;
            Map<String,String> map1 = orgItems8.countOfReqToStatusMap;
            orgItems8.getListUnselectedCampaign();               
            orgItems8.getListUnselectedDocumentCurrency();
            orgItems8.getListUnselectedState();
            orgItems8.getListUnselectedTOP();
            orgItems8.getListUnselectedVariant();
            list<String> stingList = orgItems8.listUnselectedIncoterms;
            List<SelectOption> allMg2Val = orgItems8.getAllMG2Values;
            List<SelectOption> selMG2Val=orgItems8.selectedMG2Values;
            //Pooja End        
        }      
        Test.StopTest();    
    }
    
     static testMethod void pAOrganizationalGroupItemsTestMethod6() {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
        UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        insert Ur;
        User u1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
        insert u1;
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
       

        System.runAs(u1)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price_Approval_Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price_Approval_CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            //Pricing Procedure creation
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c=System.Label.SourceClusterCheckP80);
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c=System.Label.SourceClusterCheckP80,
                                                Pricing_Condition_Code__c='ZPSE'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
                        
            //Key Combination          
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c=System.Label.SourceClusterCheckP80,
                                                 Key_Combination_Code__c='A580'));                    
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                        From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
                                        
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c=null));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=31,Max_Valid_From_Offset_Cust_Spec__c=91,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=10,Latest_Valid_To_Offset_Cust_Spec__c=25,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=25/*,Approval_Escalation_Price_Requests=6*/));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Approval_Escalation_Price_Requests__c='2 Days',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Price_Requests=5*/));                               
            
            insert orgItemList;
            //Pooja
            Organizational_Group_Item__c test1 = new Organizational_Group_Item__c();
            test1.Business__c=Business.id;
            test1.OrgGroup__c=salesArea.id;
            test1.ERP_Pricing_Procedure__c=pp.id;
            test1.Customer_Request_Reasons__c='A;B';
            test1.Approval_Escalation_Price_Requests__c='2 Days';
            test1.Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B';
            test1.ERP_Currency__c=null;
            test1.Enable_Request_Class__c=true;
            test1.Request_Class__c='Request Class1';
            insert test1;
            //End Pooja
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
            
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u1.Id;
            
            //pricing request//Pooja
            Pricing_Request__c pr1 = new Pricing_Request__c();

            pr1.Sold_To__c='Customer1';
            pr1.SoldTo_Code__c='5512345';
            pr1.Sales_Org_Code__c='A640';
            pr1.SAP_Client_Id__c='510';
            pr1.SAP_Application_Id__c='V';
            pr1.Request_Type__c='Customer Specific';
            pr1.Request_Reason__c='test;test1';
            pr1.Request_Name__c='test123';
            pr1.Pricing_Request_Type__c='Pricing Task';
            pr1.Division_Code__c='02';
            pr1.Dist_Channel_Code__c='10';
            pr1.Customer_Specific__c=true;
            pr1.BU__c='BI EMEA SURFACES';
            pr1.Request_Approval_Status__c='Draft';
            pr1.Spot_Type__c='not null';
            
            insert pr1;
            
                        
            PAOrganizationalGroupItems orgItems = new PAOrganizationalGroupItems();
            orgItems.selectedBU = Business.id;    
            orgItems.getListOptions();
            orgItems.getListBusinessComponents();
            orgItems.value='SASetup';
            orgItems.setSelectedRecordId(orgItemList[0].id);
            orgItems.getselectedRecordId();
            orgItems.getListWrappers();
            orgItems.deleteRecord();
            orgItems.getName(); 
            orgItems.pricingProcedureId = pp.id;
            orgItems.pricCond = pcList[0].id;
            //orgItems.save();
            orgItems.getAccessProcedureWrappper();
            orgItems.getOrgGroupItems();
            
            //adding for listValues 
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                    new List<ERP_Customer_Material_Key__c >();   
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Customer Price Group',Code__c='A1',Name__c='CPG1'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Price Group',Code__c='M1',Name__c='MPG1'));          
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Price List Type',Code__c='M1',Name__c='Price List'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Country',Code__c='LU',Name__c='Luxemburg'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Office',Code__c='A11',Name__c='Sales Office'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 3',Code__c='M3',Name__c='MPG3'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 4',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales District',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 1',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Incoterms',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Campaign',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Document Currency',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='State',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales District',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Material Group 5',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Terms of Payment',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Variant',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Type',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Sales Order Item',Code__c='M4',Name__c='MPG4')); //<SS20220826>
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Plant',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Shipping Condition',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Destination Country',Code__c='M4',Name__c='MPG4'));
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='pricing Exception',Code__c='M4',Name__c='MPG4'));
            
            insert ERPCustomerMaterialKeyList;
            
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                Organizational_Group_Item__c=orgItemList[0].id));
                
            }
            insert orgGroupKeyList;
            
            Test.StartTest();
            
            //orgItems.listUnselectedCustomerGroup4();
            orgItems.getListUnselectedDist();
           // orgItems.listSelectedCustomerGroup4();
            orgItems.getListUnselectedMPG();
            //orgItems.listSelectedDist();
            orgItems.getListUnselectedPLType();
            orgItems.getListUnselectedCountry();
            orgItems.getListUnselectedSO();
            orgItems.getListUnselectedMG3();orgItems.getListUnselectedMG4();
           // orgItems.rebateQuotesCheck('5512345');
            orgItems.getlistUnselectedSD();
            orgItems.getlistUnselectedMG1(); 

            List<string> x = orgItems.ListSelectedMG4;
            x = orgItems.listSelectedMG3;
            x =orgItems.listSelectedSO;
            x = orgItems.listSelectedCountry ;
            x = orgItems.listSelectedPLType;
            x = orgItems.listSelectedMPG; 
            x = orgItems.listSelectedCPG ;
            x = orgItems.listUnselectedCPG;
            x = orgItems.listSelectedMG1 ;
            x = orgItems.listSelectedIncoterms;
            x = orgItems.listSelectedCampaign ;
            x = orgItems.listSelectedDocumentCurrency ;
            x = orgItems.listSelectedState ;
            x = orgItems.listSelectedSD ;
            x = orgItems.listSelectedTOP ;
            x = orgItems.listSelectedVariant ;
            x = orgItems.listSelectedSOT ;
            x = orgItems.listSelectedPlant ;
            x = orgItems.listSelectedShippingCondition ;
            x = orgItems.listSelectedDestinationCountry ;
            x = orgItems.listSelectedPE;
            x = orgItems.listSelectedMG5;
            String whereClause=orgItems.phWhereClause;
            String phFields=PAOrganizationalGroupItems.phFieldsList;
            String phSobj=PAOrganizationalGroupItems.phSObjectType;
                        
            try
            {
                string s = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().contains('Please enter value for mandatory field \'Latest Valid To Offset'),e.getMessage());
            }
            orgItems.setSelectedRecordId(orgItemList[1].id);
            try
            {
            string s1 = orgItems.action('PAGlobalConfig','PAGlobalConfig','SASetupSave');
            }
            catch(Exception e)
            {   
                System.debug('vipul message' + e.getMessage());
            }
            
            PAOrganizationalGroupItems orgItems4 = new PAOrganizationalGroupItems();
            orgItems4.selectedBU = Business.id; 
            orgItems4.setSelectedRecordId(orgItemList[2].id);
            orgItems4.save();
            orgItems4.priceMasterPA();
            string s1 = orgItems4.action('PAGlobalConfig','PAGlobalConfig','SASetup');
            
            PAOrganizationalGroupItems orgItems5 = new PAOrganizationalGroupItems();
            orgItems5.selectedBU = Business.id; 
            orgItems5.setSelectedRecordId(orgItemList[2].id);
            orgItems5.save();
            //string s2 = orgItems5.action('PAGlobalConfig','PAGlobalConfig','openReportPRByStatus');
            
            PAOrganizationalGroupItems orgItems6 = new PAOrganizationalGroupItems();
            orgItems6.selectedBU = Business.id; 
            orgItems6.setSelectedRecordId(orgItemList[2].id);
            orgItems6.save();
            string s3 = orgItems6.action('PAGlobalConfig','PAGlobalConfig','backPriceMasterToConfig');
           
           //Pooja
            PAOrganizationalGroupItems orgItems7 = new PAOrganizationalGroupItems();
            orgItems7.selectedBU = Business.id;
            orgItems7.selectedUser='meeee';
            orgItems7.isOnbehalfOf=false;
            orgItems7.userName='meee*starstar';
            orgItems7.customerCurrency=false;
            orgItems7.reportUrl='what';
            orgItems7.isViewCustomerPrices='abc';
            orgItems7.isViewPLPrices='cdf';
            orgItems7.isProjectGroupMember=false;
            orgItems7.showPopup=null;
            orgItems7.showLookup='abcde';
            orgItems7.ogItemFromRequest(pr1);
            
            PAOrganizationalGroupItems orgItems8 = new PAOrganizationalGroupItems();
            orgItems8.selectedBU = Business.id;
            List<SelectOption> reqq = orgItems8.requestClassList;
            List<User> list11=orgItems8.allSalesReps;
            boolean a = orgItems8.showPRReport;
            List<PAWrapper> pawrap = orgItems8.businessUsersWrapList; 
            SelectOption[] abc = orgItems8.allMG2;
            Map<String,String> map1 = orgItems8.countOfReqToStatusMap;
            orgItems8.getListUnselectedCampaign();               
            orgItems8.getListUnselectedDocumentCurrency();
            orgItems8.getListUnselectedState();
            orgItems8.getListUnselectedTOP();
            orgItems8.getListUnselectedVariant();
            list<String> stingList = orgItems8.listUnselectedIncoterms;
            list<String> stingList1 = orgItems8.listUnselectedCustomerGroup4;
            list<String> stingList2 = orgItems8.listSelectedCustomerGroup4;
            list<String> stingList3 = orgItems8.listSelectedDist;
            List<SelectOption> allMg2Val = orgItems8.getAllMG2Values;
            List<SelectOption> selMG2Val=orgItems8.selectedMG2Values;
                   
        }      
        Test.StopTest();    
    }
}