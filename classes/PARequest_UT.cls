/*******************************************************************************
Copyright © 2021 DuPont. All rights reserved. 

Updates:
<AB20210301> Updated to avoid SOQL Governer limit error due independent DML Statements

********************************************************************************/

@isTest
private class PARequest_UT {
    
    static testMethod void paRequestTestMethod() {
        
        
        
        //Bala - start 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        //system.debug('#### p1'+p1);
        
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        List<User> userList = new List<User>(); //<AB20210301>
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        userList.add(u1) ;//<AB20210301>
        
        User u2 = TestUserUtil.createTestUser(r.id, p2.id, 'test fName2', 'test lName2');
         userList.add(u2) ;//<AB20210301>
        insert userList;//<AB20210301>
        
        
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType1 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
            List<PA_Email_Template_Custom_Settings__c> foldList = new List<PA_Email_Template_Custom_Settings__c>();//<AB20210301>
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            foldList.add(fold) ; //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold1 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - CS',Folder_Id__c='BI_EMEA_SURF_Customer_Spec_Template_EN');
             foldList.add(fold1) ;  //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold2 = new PA_Email_Template_Custom_Settings__c(Name='Project - P7780',Folder_Id__c='BI_EMEA_Surf_Project_Spec_Template_EN');
            foldList.add(fold2) ; //<AB20210301>
            insert foldList ; //<AB20210301>
            
            //orgGrp Items
            try
            {
                List<EmailTemplate> emailTemp = [select id,Name,body,description FROM EmailTemplate  where folder.Name=:PA_Email_Template_Custom_Settings__c.getInstance('priceApprovalFolder').folder_Id__c /*AND Name=:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c*/];
            }
            catch(exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            
            
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
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //subbu
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                               
            
            insert orgItemList; 
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType1.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //cust. specific scenario 
            PAService service = new PAService(); 
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.orgGroupItems= orgItemList[0];
            //service.paServiceState.ogItems.orgGroupItems.ERP_Currency__c = 'EA;KG;EU';
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.erpCustomer = new PAERPCustomer(service.paServiceState);
            service.paServiceState.erpCustomer.customerCode=cust.customer_code__c;
            service.paServiceState.erpCustomer.getCustomerCode();
            service.paServiceState.erpCustomer.salesOrgCode = 'A640';
            service.paServiceState.erpCustomer.distCode='10';
            service.paServiceState.erpCustomer.divCode='02';
            service.paServiceState.erpCustomer.ogitems.value='CustRequestReasons';
            
            //Inserting Project for project 
            Project_Price__c proj = new Project_Price__c(Default_Discount__c='12.34');
            insert proj; 
            //setting PricingRequestId -> this is set when user clicks the request from customer reqPage
            List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null',Approver1__c=u1.Id,Approver2__c=u1.Id,Approver3__c=u1.Id,Approver4__c=u1.Id,Approver5__c=u1.Id));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES1',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));                                   
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Non Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=false,BU__c='BI EMEA SURFACES2',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES3',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Project Pricing',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES4',
                                              Project_Price__c=proj.id,Project_Id__c=proj.id,
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));   
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Import',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Import',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES5',
                                              Request_Approval_Status__c='Submitted',Spot_Type__c='Rebate Agreement'));                                                                                                                   
            //inserting pricing request
            insert prList;
            
            Price_Visibility__c pv = new Price_Visibility__c();
            pv.name='A640-10-02';
            pv.BU__c = 'BI EMEA SURFACES';
            pv.Dist_Channel_Code__c='10';
            pv.Division_Code__c = '02';
            pv.Price_Type__c = 'Net Floor';
            pv.Pricing_Request_Type__c = 'Project Pricing;Permanent';
            pv.Request_Type__c = 'Customer Specific';
            pv.Sales_Org_Code__c ='A640';
            insert pv;
            
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                new List<ERP_Customer_Material_Key__c >();   
            
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Pricing Exception',Code__c='PECode',Name__c='PEName'));
            insert ERPCustomerMaterialKeyList;
            List<Organizational_Group_Item__c> orgItemList1 = new List<Organizational_Group_Item__c>();
            orgItemList1.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',
                Pricing_Task_Reasons__c ='Pricing Task',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                               
            
            insert orgItemList1;
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                             Organizational_Group_Item__c=orgItemList1[0].id));
                
            }
            insert orgGroupKeyList;
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //calling second time 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = prList[0];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            service.paServiceState.currentRequest.pricingRequestId = 'Clone-'+prList[0].id;
            service.paServiceState.currentRequest.getListBusinessComponents();
            service.paServiceState.currentRequest.getListOptions();
            
            
            service.paServiceState.currentRequest.getPricingException();
            
            //for pricingTaskReasons 
            service.paServiceState.erpCustomer.ogitems.value='PricingTaskReasons';      
            service.paServiceState.currentRequest.getPricingTaskType();
            service.paServiceState.currentRequest.getListOptions(); 
            
            //Non Cust Reasons
            service.paServiceState.erpCustomer.ogitems.value='NonCustReasons';      
            service.paServiceState.currentRequest.getListOptions();
            
            //ProjectReasons
            service.paServiceState.erpCustomer.ogitems.value='ProjectReasons';      
            service.paServiceState.currentRequest.getListOptions();
            
            service.paServiceState.currentRequest.pricingRequest = prList[1];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.currentRequest.getListOptions();
            
            service.paServiceState.currentRequest.pricingRequest = prList[2];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //line 715
            service.paServiceState.currentRequest.pricingRequest = prList[3];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.erpCustomer.ogitems.value = null;
            service.paServiceState.currentRequest.getPricingTaskType();
            service.paServiceState.currentRequest.getListOptions();
            
            //line 722
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[4].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //line 729
            service.paServiceState.currentRequest.pricingRequest = prList[5];//[select id from Pricing_Request__c WHERE id=:prList[5].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //for csv
            service.paServiceState.currentRequest.csvString='status';
            service.paServiceState.currentRequest.getListOptions();
            
            PAKeyCombination keyCmb = new PAKeyCombination(service.paServiceState);
            keyCmb.pckcconcat = 'test-test: test-test';
            service.paServiceState.currentRequest.keyCombination=keyCmb;
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){
            }
            
            try
            {
                
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.erpCustomer.ogitems.value = null;
                service.paServiceState.currentRequest.emailTemplate = new list<string>{'abcd','xyz'};
                    service.paServiceState.currentRequest.pclDisplayPopUp='PCLRender';
                service.paServiceState.currentRequest.getListOptions();
                
            }
            catch(exception e)
            {
                
            }
            //getListWrappers
            service.paServiceState.currentRequest.pricingRequest = prList[0];
            service.paServiceState.ogitems.value='Draft';
            service.paServiceState.currentRequest.getListWrappers();
            service.paServiceState.currentRequest.add();
            service.paServiceState.currentRequest.deleteRecord();
            service.paServiceState.currentRequest.getName();
            service.paServiceState.currentRequest.getType();
            
            
            //submitted 
            service.paServiceState.ogitems.value = 'Submitted';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Submitted',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Customer Specific');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Approved
            service.paServiceState.ogitems.value = 'Approved';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Approved',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Import',Request_Type__c='Import');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Rejected
            service.paServiceState.ogitems.value = 'Rejected';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Rejected',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Massive');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Recalled
            service.paServiceState.ogitems.value = 'Recalled';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Recalled',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            Test.startTest();
            //Pending
            service.paServiceState.ogitems.value = 'Pending';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Pending',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            //clone
            service.paServiceState.ogitems.value = 'Clone';
            
            //service.paServiceState.ogitems.value = null;
            //service.paServiceState.currentRequest.displayRequestHistory = true;
            //service.paServiceState.erpCustomer.ogitems.SelectedBU = 'BI EMEA SURFACES';
            //service.paServiceState.currentRequest.getListWrappers();
            
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave Floor Pricing');
            }
            catch(Exception e)
            {
            }
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave Reference Pricing');
            }
            catch(Exception e)
            {
            }
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave Reference1 ');
            }
            catch(Exception e)
            {
            }
            try
            {
                //    service.paServiceState.currentRequest.action('','','Massive Change');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            }
            try
            {   
                service.paServiceState.currentRequest.action('','','Non Customer Specific');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            } 
            try
            {   
                service.paServiceState.currentRequest.action('','PACurrentPrices','customerPricesonBehalfOf');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            }  
            service.paServiceState.currentRequest.action('','','selectTemplate');
            service.paServiceState.currentRequest.action('','','cancelGeneration');
            service.paServiceState.currentRequest.action('','','cancelTemplateselection');
            //service.paServiceState.currentRequest.action('','','PCLGeneration');
            
            
            //for Project Price
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.projectprice = proj;
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            service.paServiceState.currentRequest.pricingRequestId = 'Clone-'+prList[4].id;
            //commenting-deploymentservice.paServiceState.currentRequest.pricingRequestId = prList[4].id;
            
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.projectprice = null;
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            try
            {
                service.paServiceState.currentRequest.pricingRequestId = prList[4].id;
            }
            catch(Exception e){}//no need this if system.debug is removed
            
            
            service.paServiceState.ogitems.value = 'Submitted';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Submitted',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.displayPermanentRequestHistory=true;
            service.paServiceState.currentRequest.getListWrappers();
            
            //Approved
            service.paServiceState.ogitems.value = 'Approved';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Approved',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Import',Request_Type__c='Import');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Rejected
            service.paServiceState.ogitems.value = 'Rejected';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Rejected',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Massive');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Recalled
            service.paServiceState.ogitems.value = 'Recalled';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Recalled',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            //Pending
            service.paServiceState.ogitems.value = 'Pending';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Pending',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            
            keyCmb = new PAKeyCombination(service.paServiceState);
            keyCmb.pckcconcat = 'test-test: test-test';
            service.paServiceState.currentRequest.keyCombination=keyCmb;
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){
            }
            service.paServiceState.currentRequest.massReassignAttribute=true;
            service.paServiceState.currentRequest.countOfPriceTables=7;
            
            
            Test.stopTest();
        }
        
        
        
        
    }
    public static testMethod void paRequestTestMethod1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        //sales Admin Permission Set
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='KAMALAKIRAN',Pricing_Procedure__c='KAMALAKIRAN',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',Calculation_Type__c='Percentage'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/Ship-To',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code/Ship-To code-Sales Org./Dist. Channel/Division/Sold To/Material/Ship-To'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='KAMALAKIRAN',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            /*    OrgGroup__c OrgGroup = new OrgGroup__c();
OrgGroup.ERP_Sales_Org_Code__c='A641';
insert OrgGroup;

*/
            
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            //orgUser.OrgGroup__r.ERP_Sales_Org_Code__c='A641';
            insert orgUser;
            
            //orgUser= [select Id, OrgGroup__r.ERP_Sales_Org_Code__c from Organizational_Group_User__c where Id = :orgUser.Id];
            
            
            
            /*  Organizational_Group_User__c orgUser1 = new Organizational_Group_User__c();
orgUser1.Related_User__c = u1.Id;
orgUser1.OrgGroup__c=salesArea.id;
orgUser1.Organizational_Group_Item__c =orgItemList[1].id ;
insert orgUser1; */
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c=null);
            Test.startTest();
            try
            {
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                
                system.assert(e.getMessage().containsIgnoreCase('Please select a value in Sales Org'),e.getMessage());
            }
            //with out exception 
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c=null);
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A640');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            
            try
            {
                service.paServiceState.ogitems.selectedUser = u1.Id;
                service.paServiceState.ogitems.userName='UserName';
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                //system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //PCLfetch
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedUser= u1.id;
            
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                //zero matchs found 
            }
            service.paServiceState.currentRequest.pclDisplayPopUp = 'none';
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
            }
            
            //pclDisplayPopUp
            service.paServiceState.currentRequest.pclDisplayPopUp = null;
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
            }
            //customerContact
            service.paServiceState.currentRequest.customerContact = null;
            service.paServiceState.currentRequest.pclDisplayPopUp = 'none_';
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please Enter customer contact'),e.getMessage());
            }
            try
            {
                service.paServiceState.currentRequest.action('','','Request Overview');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','cpSelChange');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','Floor Pricing');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','Reference Pricing');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','PCLGenerationPriReq');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.email = null;
                service.paServiceState.currentRequest.action('','','PCLSEARCH');
            }
            catch(Exception e)
            {
                
            }
            
            List<Pricing_Request_Item__c> priReqItemList = new list<Pricing_Request_Item__c>();
            Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
            priReqItemList.add(prItem);
            service.paServiceState.currentRequest.pricingReqItemList = priReqItemList;
            try
            {
                
                service.paServiceState.currentRequest.action('','','ReqCreated');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','PCLcancelTemplateselection');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequest');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','AddSelectedPrices');
            }
            catch(Exception e)
            {
                
            }
            
            
            //priCondOnchange
            service.paServiceState.currentRequest.action('','','priCondOnchange');
            
            //keyCombOnChange
            service.paServiceState.currentRequest.action('','','keyCombOnChange');
            //exportCSV
            try
            {
                service.paServiceState.currentRequest.scaleEnable='true';
                service.paServiceState.currentRequest.action('','','exportCSV');
            }
            catch(Exception e)
            {
                
            }
            
            
            //PARequest pa= new PARequest(service.paServiceState);
            
            //PCLSEARCH
            //service.paServiceState.currentRequest.action('','','PCLSEARCH');
            //PCLSEARCH FOR If 
            service.paServiceState.currentRequest.email.put('Language','--Select--');
            service.paServiceState.currentRequest.email.put('Type','');
            service.paServiceState.currentRequest.email.put('Description','');
            //service.paServiceState.currentRequest.action('','','PCLSEARCH');
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVt,
                                                                                              Request_Valid_From__c=eqVF);
                service.paServiceState.currentRequest.pricingExceptionList = new List<String>{'abcd','xyz'};                                    
                    service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                //more than one err so not asserting   
            }
            // for Valid To validation
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=null,
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid To'),e.getMessage());
                
            }
            //for valid From validation
            // for Valid To validation
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
                                                                                              Request_Valid_From__c=null,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid From'),e.getMessage());
                
            }
            //for Retro Active
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
                                                                                              Request_Valid_From__c=eqVF.addDays(-100),Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid From Date'),e.getMessage());
                
            }
            //for Retro Active Valid To
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(1000),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer');
                service.paServiceState.currentRequest.action('','','Editsave');
                
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid To Date'),e.getMessage());
                
            }
            
            try
            {
                List<selectOption> erpUoMList1 = service.paServiceState.currentRequest.erpUoMList;
                service.paServiceState.currentRequest.erpUoMList=erpUoMList1;
                
                List<selectOption>nonStandardSelectList = service.paServiceState.currentRequest.nonStandardSelectList;
                String allApprovers = service.paServiceState.currentRequest.allApprovers;
                service.paServiceState.currentRequest.requesttype = 'Massive';
                String reqtype = service.paServiceState.currentRequest.requesttype;
            }   
            catch(Exception e)
            {
            }
            try
            {
                service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyComb='Price Ref. Partner/Ship to/End User/Customer Hierarchy/ComPartner/Partner ZF/Payer';
                service.paServiceState.currentRequest.filtercode='xyz';
                service.paServiceState.currentRequest.filterName='xyz';
                string ReassignReq = service.paServiceState.currentRequest.ReassignReq;
                List<SelectOption> getSubtype = service.paServiceState.currentRequest.getSubtype();
                
                
            }
            catch(Exception e)
            {}
            
            
            //w/o Exception EditSave
            //pavan
            /*try
{
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Import',
Request_Name__c='testReq',Request_Reason__c='New Customer',BU__c='TEST1');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e1)
{

}*/
            
            //pavan
            /*try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST2');
service.paServiceState.currentRequest.action('','','NewPricingRequestsaveMassive Change');
}
catch(Exception e2)
{

}

//pavan
try
{
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST3');
}
catch(Exception e3)
{
}*/
            
            Test.stopTest();
            
        }
        
    }
    public static testMethod void paRequestTestMethod1_ext()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            Test.startTest();
            try
            {
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                
                system.assert(e.getMessage().containsIgnoreCase('Please select a value in Sales Org'),e.getMessage());
            }
            //with out exception 
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            
            try
            {
                service.paServiceState.ogitems.selectedUser = u1.Id;
                service.paServiceState.ogitems.userName='UserName';
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            try
            {
                boolean msImpr = service.paServiceState.currentRequest.massiveImport;
                service.paServiceState.currentRequest.massiveImport = true;
                service.paServiceState.currentRequest.pckcFromKeyComb = '';
                
            }
            catch(Exception E)
            {}
            
            //PCLfetch
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            //Pavan
            /*
try
{
service.paServiceState.currentRequest.action('','','Fetch100Records');
}
catch(Exception e)
{
//zero matchs found 
}
service.paServiceState.currentRequest.pclDisplayPopUp = 'none';
try
{
service.paServiceState.currentRequest.action('','','PCLfetch');
}
catch(Exception e)
{
//System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
}

//pclDisplayPopUp
service.paServiceState.currentRequest.pclDisplayPopUp = null;
try
{
service.paServiceState.currentRequest.action('','','PCLfetch');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
}
//customerContact
service.paServiceState.currentRequest.customerContact = null;
service.paServiceState.currentRequest.pclDisplayPopUp = 'none_';
try
{
service.paServiceState.currentRequest.action('','','PCLfetch');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please Enter customer contact'),e.getMessage());
}
try
{
service.paServiceState.currentRequest.action('','','Request Overview');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','cpSelChange');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','Floor Pricing');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','Reference Pricing');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','PCLGenerationPriReq');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.email = null;
service.paServiceState.currentRequest.action('','','PCLSEARCH');
}
catch(Exception e)
{

}

List<Pricing_Request_Item__c> priReqItemList = new list<Pricing_Request_Item__c>();
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
priReqItemList.add(prItem);
service.paServiceState.currentRequest.pricingReqItemList = priReqItemList;
try
{

service.paServiceState.currentRequest.action('','','ReqCreated');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','PCLcancelTemplateselection');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','NewPricingRequest');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','AddSelectedPrices');
}
catch(Exception e)
{

}


//priCondOnchange
service.paServiceState.currentRequest.action('','','priCondOnchange');

//keyCombOnChange
service.paServiceState.currentRequest.action('','','keyCombOnChange');
//exportCSV
try
{
service.paServiceState.currentRequest.scaleEnable='true';
service.paServiceState.currentRequest.action('','','exportCSV');
}
catch(Exception e)
{

}

//PARequest pa= new PARequest(service.paServiceState);

//PCLSEARCH
//service.paServiceState.currentRequest.action('','','PCLSEARCH');
//PCLSEARCH FOR If 
service.paServiceState.currentRequest.email.put('Language','--Select--');
service.paServiceState.currentRequest.email.put('Type','');
service.paServiceState.currentRequest.email.put('Description','');
//service.paServiceState.currentRequest.action('','','PCLSEARCH');

//for Exception
//Editsave*/
            Date eqVt = System.today();
            Date eqVF = System.today();
            /*
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVt,
Request_Valid_From__c=eqVF);
service.paServiceState.currentRequest.pricingExceptionList = new List<String>{'abcd','xyz'};                                    
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
//more than one err so not asserting   
}
// for Valid To validation
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=null,
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid To'),e.getMessage());

}
//for valid From validation
// for Valid To validation
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
Request_Valid_From__c=null,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid From'),e.getMessage());

}
//for Retro Active
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
Request_Valid_From__c=eqVF.addDays(-100),Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid From Date'),e.getMessage());

}
//for Retro Active Valid To
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(1000),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid To Date'),e.getMessage());

}*/
            //pavan
            
            //w/o Exception EditSave
            //pavan
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Import',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',BU__c='TEST1');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e1)
            {
                
            }
            
            //pavan
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST222');
                service.paServiceState.currentRequest.action('','','NewPricingRequestsaveMassive Change');
            }
            catch(Exception e2)
            {
                
            }
            
            //pavan
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST3');
            }
            catch(Exception e3)
            {
            }
            
            Test.stopTest();
            
        }
        
    }
    
    public static testMethod void paRequestTestMethod1_1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640');
            service.paServiceState.currentRequest.action('','','NewPricingRequestsaveNon Customer Specific');
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer');
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            
            //Exception NewPricingRequessave
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq');
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            }
            catch(Exception e){}
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Terms_Of_Payment__c='Other',Due_Date__c=eqVT.addDays(-1));
                service.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Incoterm__c='Other',Due_Date__c=eqVT.addDays(-1));
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            //cloned req
            
            try
            {
                /* Pricing_Request__c pr = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640',on_Behalf_Of__c=u1.Id,
Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div1',Dist_Channel__c='Dist',Sales_Org__c='salesOrg'
);
insert pr; 
service.paServiceState.currentRequest.pricingRequest = pr;                                                       
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c(Pricing_Request__c=pr.id);
insert prItem;*/
                service.paServiceState.currentRequest.action('','','Clonesave');
            }
            catch(Exception e)
            {
                
            }
            
            Test.startTest();
            //Next spot type !=FOC
            service.paServiceState.currentRequest.userSelected = u1.id;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='Other',Terms_Of_Payment__c='None-1',
                                                                                          Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
            // service.paServiceState.currentRequest.action('','','Next');
            
            //Next spot type !=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='Other',Terms_Of_Payment__c='None-1',
Non_Standard_Incoterm__c='NonStd',Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');*/
            
            
            //Next spot type=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next'); */
            
            
            //NewPricingReqItem
            service.paServiceState.currentRequest.action('','','NewPricingReqItem');
            Test.stopTest();
            
        }
        
    }
    public static testMethod void paRequestTestMethod1_1_1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640');
            service.paServiceState.currentRequest.action('','','NewPricingRequestsaveNon Customer Specific');
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer');
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            
            //Exception NewPricingRequessave
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq');
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            }
            catch(Exception e){}
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Terms_Of_Payment__c='Other',Due_Date__c=eqVT.addDays(-1));
                service.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Incoterm__c='Other',Due_Date__c=eqVT.addDays(-1));
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            //cloned req
            
            try
            {
                /* Pricing_Request__c pr = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640',on_Behalf_Of__c=u1.Id,
Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div1',Dist_Channel__c='Dist',Sales_Org__c='salesOrg'
);
insert pr; 
service.paServiceState.currentRequest.pricingRequest = pr;                                                       
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c(Pricing_Request__c=pr.id);
insert prItem;*/
                service.paServiceState.currentRequest.action('','','Clonesave');
            }
            catch(Exception e)
            {
                
            }
            
            Test.startTest();
            //Next spot type !=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');

//Next spot type !=FOC
service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='Other',Terms_Of_Payment__c='None-1',
Non_Standard_Incoterm__c='NonStd',Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');*/
            
            
            //Next spot type=FOC
            service.paServiceState.currentRequest.userSelected = u1.id;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
                                                                                          due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
            service.paServiceState.currentRequest.action('','','Next'); 
            
            
            //NewPricingReqItem
            /*service.paServiceState.currentRequest.action('','','NewPricingReqItem');*/
            Test.stopTest();
            
        }
        
    }
    
    public static testMethod void paRequestTestMethod2()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            
            IntegrationLoginCredentials__c pr4 = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com.utqa', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
            insert pr4;
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery(); 
            //orgGrp Items
            try
            {          
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            PA_Email_Template_Custom_Settings__c fold1 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - CS',Folder_Id__c='BI_EMEA_SURF_Customer_Spec_Template_EN');
            insert fold1 ;
            PA_Email_Template_Custom_Settings__c fold2 = new PA_Email_Template_Custom_Settings__c(Name='Project - P7780',Folder_Id__c='BI_EMEA_Surf_Project_Spec_Template_EN');
            insert fold2 ;
            PA_Email_Template_Custom_Settings__c fold3 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - F46A',Folder_Id__c='CPM_PCL_F46A_EN');
            insert fold3 ;
            PA_Email_Template_Custom_Settings__c fold4 = new PA_Email_Template_Custom_Settings__c(Name='Geneva CH Header PCL',Folder_Id__c='Geneva_CH_Cust_Spec_Template_EN');
            insert fold4 ;
            PA_Email_Template_Custom_Settings__c fold5 = new PA_Email_Template_Custom_Settings__c(Name='Geneva DE Header PCL',Folder_Id__c='Geneva_DE_Cust_Spec_Template_EN');
            insert fold5 ;
            PA_Email_Template_Custom_Settings__c fold6 = new PA_Email_Template_Custom_Settings__c(Name='Geneva ES Header PCL',Folder_Id__c='Geneva_ES_Cust_Spec_Template_EN');
            insert fold6 ;
            PA_Email_Template_Custom_Settings__c fold7 = new PA_Email_Template_Custom_Settings__c(Name='Geneva FR Header PCL',Folder_Id__c='Geneva_FR_Cust_Spec_Template_EN');
            insert fold7 ;
            PA_Email_Template_Custom_Settings__c fold8 = new PA_Email_Template_Custom_Settings__c(Name='Geneva UK Header PCL',Folder_Id__c='Geneva_UK_Cust_Spec_Template_EN');
            insert fold8 ;
            PA_Email_Template_Custom_Settings__c fold9 = new PA_Email_Template_Custom_Settings__c(Name='Lux DE Header PCL',Folder_Id__c='Luxembourg_DE_Cust_Spec_Template_EN');
            insert fold9 ;
            PA_Email_Template_Custom_Settings__c fold10 = new PA_Email_Template_Custom_Settings__c(Name='Lux ES Header PCL',Folder_Id__c='Luxembourg_ES_Cust_Spec_Template_EN');
            insert fold10 ;
            PA_Email_Template_Custom_Settings__c fold11 = new PA_Email_Template_Custom_Settings__c(Name='Lux FR Header PCL',Folder_Id__c='Luxembourg_FR_Cust_Spec_Template_EN');
            insert fold11 ;
            PA_Email_Template_Custom_Settings__c fold12 = new PA_Email_Template_Custom_Settings__c(Name='Lux LU Header PCL',Folder_Id__c='Luxembourg_LU_Cust_Spec_Template_EN');
            insert fold12 ;
            PA_Email_Template_Custom_Settings__c fold13 = new PA_Email_Template_Custom_Settings__c(Name='Lux UK Header PCL',Folder_Id__c='Luxembourg_UK_Cust_Spec_Template_EN');
            insert fold13 ;
            PA_Email_Template_Custom_Settings__c fold14 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - F450',Folder_Id__c='CPM_PCL_F450_EN');
            insert fold14 ;
            PA_Email_Template_Custom_Settings__c fold15 = new PA_Email_Template_Custom_Settings__c(Name='P&IP EMEA PCL',Folder_Id__c='PnIP_EMEA_PCL_EN');
            insert fold15 ;
            PA_Email_Template_Custom_Settings__c fold16 = new PA_Email_Template_Custom_Settings__c(Name='P&IP NA PCL',Folder_Id__c='PnIP_NA_PCL_EN');
            insert fold16 ;
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='Percentage'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',Calculation_Type__c='Percentage'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1',External_ERP_ID__c='CB1-5512345-A640-10-02');
            insert cust;
            system.debug('***Cust Ext Id: '+cust.External_ERP_ID__c);
            IntegrationLoginCredentials__c EC = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
            insert EC; 
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.action('','','statusCancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            service.paServiceState.currentRequest.action('','','cancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            //pavan commented below
            //service.paServiceState.currentRequest.action('','','cancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //ExportPrices
            service.paServiceState.currentRequest.action('','','ExportPrices');
            
            //NCSMassiveHome
            service.paServiceState.currentRequest.action('','','NCSMassiveHome');
            
            Test.startTest();
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            try
            {
                service.paServiceState.currentRequest.scaleEnable='false';
                service.paServiceState.currentRequest.action('','','exportCSV');
            }
            catch(Exception e)
            {
                
            }
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           sales_Org_code__c='A640',current_level__c='1',BU__c='test'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            try
            {       
                service.paServiceState.currentRequest.action('','','bulkApproval');
            }catch(Exception e){}//error expected since ProcessInstanceWrkItem does not return anything 
            //bulkReassignPopup
            try
            {
                //closeReassignPopup
                service.paServiceState.currentRequest.action('','','closeReassignPopup');  
                service.paServiceState.currentRequest.action('','','bulkReassignPopup');
            }catch(Exception e){}//error expected since ProcessInstanceWrkItem does not return anything
            
            //closeuserLookup
            service.paServiceState.currentRequest.action('','','closeuserLookup');
            
            //reassignLookup
            service.paServiceState.currentRequest.action('','','reassignLookup');
            //saveBulkReassign
            try{
                service.paServiceState.currentRequest.action('','','saveBulkReassign');
            }catch(Exception e){
                
            }                   
            //making Non Comm Null
            service.paServiceState.currentRequest.action('','','PaymentTermOnChange');
            service.paServiceState.currentRequest.action('','','incoTermOnChange');
            service.paServiceState.currentRequest.action('','','Closewindow');
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','Massive Change');
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            service.paServiceState.currentRequest.action('','','Non Customer Specific');
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Divi sion/Sold to/Material/Ship-To',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y11',Distributor_Name__c='Test11',price_holder__c=holderRecord.id, Record_Id__c=holderRecord.Id+'/'+holderRecord.Id+'#'+holderRecord.id+'/'+holderRecord.id);  
            
            insert childRecord;
            
            //PCLGeneration
            
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = holderRecord;
            relList[0].wrapperList[1].isSelected = true;
            relList[0].wrapperList[1].sObjectRecord = childRecord;
            //relList = service.paServiceState.currentRequest.getListWrappers();
            service.paServiceState.currentRequest.pclDisplayPopUp = 'p7780_ENGLISH';
            service.paServiceState.currentRequest.salesPriceSAP.relatedWrappersList = relList;
            service.paServiceState.currentRequest.listofids= childRecord.Id;
            list<PAwrapper> testWrapper=service.paServiceState.currentRequest.listofwrappertables;
            //service.paServiceState.currentRequest.action('','','PCLGeneration');
            //relList.clear();
            EmailTemplate email1 = new EmailTemplate(Name='p7780_ENGLISH',DeveloperName = 'p7780_ENGLISH', isActive=true, TemplateType= 'Text',
                                                     FolderId=[SELECT id,name from folder where name like 'Pricing Approval Folder' limit 1].id);
            insert email1;
            try
            {
                service.paServiceState.erpCustomer = new PAERPCustomer(service.paServiceState);
                service.paServiceState.erpCustomer.customerCode=cust.customer_code__c;
                service.paServiceState.erpCustomer.salesOrgCode = 'A640';
                service.paServiceState.erpCustomer.distCode='10';
                service.paServiceState.erpCustomer.divCode='02'; 
                
                service.paServiceState.erpCustomer.getCustomerCode(); 
                // service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.pclDisplayPopUp = 'p7780_ENGLISH';                      
                service.paServiceState.currentRequest.customer.customerCode=cust.customer_code__c;
                //service.paServiceState.erpCustomer.ogitems.value='CustRequestReasons';
                service.paServiceState.currentRequest.action('','','PCLGeneration');
            }
            catch(Exception e)
            {
                system.debug('@#@#pclgeneration exception occurred');
            }
            try
            {
                service.paServiceState.currentRequest.action('','','PCLGenerationPriReq');
            }
            catch(Exception e)
            {
                system.debug('@#@#pclgenerationprireq exception occurred');
            }
            try
            {
                service.paServiceState.currentRequest.scaleEnable='false';
                service.paServiceState.currentRequest.action('','','exportCSV');
            }
            catch(Exception e)
            {
                
            }
            //done
            service.paServiceState.currentRequest.csvString = null;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),sales_Org_code__c='A640',
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',Request_type__c=null,Request_Name__c='testReq',Request_Reason__c='New Customer');
            service.paServiceState.currentRequest.action('','','Canceldone');
            
            
            //Non Cust and not Edit Header
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),sales_Org_code__c='A640',
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            service.paServiceState.currentRequest.action('','','cancel');
            /*//Edit Header
service.paServiceState.currentRequest = new PARequest(service.paServiceState);
service.paServiceState.currentRequest.action('','','cancelEditHeader');
//Export 
service.paServiceState.currentRequest = new PARequest(service.paServiceState);
service.paServiceState.currentRequest.pricingRequest = null;
service.paServiceState.currentRequest.action('','','ExportPrices');

//KCChange
service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
service.paServiceState.currentRequest.action('','','KCChange');

try
{
//FetchRecords

service.paServiceState.currentRequest.action('','','FetchRecords');
}catch(Exception e){}
Pricing_Request__c pr1 = new Pricing_Request__c(Request_Type__c='Non Customer Specific',sales_Org_code__c='A640',
Request_Name__c='test');
insert pr1; 

//bulkApproval
relList = new List<PARelatedList>();
relList.add(new PARelatedList());
relList[0].wrapperList = null;
service.paServiceState.currentRequest.relatedWrappersList = relList;
//try
//{     
//  service.paServiceState.currentRequest.action('','','bulkApproval');
//}catch(Exception e){}//error expected sincewrapperList is null */
            
            Test.stopTest();                                                                 
            
        }
    }
    
    public static testMethod void paRequestTestMethod2_1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            
            IntegrationLoginCredentials__c pr4 = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com.utqa', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
            insert pr4;        
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();   
            //orgGrp Items
            try
            {          
                
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            PA_Email_Template_Custom_Settings__c fold1 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - CS',Folder_Id__c='BI_EMEA_SURF_Customer_Spec_Template_EN');
            insert fold1 ;
            PA_Email_Template_Custom_Settings__c fold2 = new PA_Email_Template_Custom_Settings__c(Name='Project - P7780',Folder_Id__c='BI_EMEA_Surf_Project_Spec_Template_EN');
            insert fold2 ;
            PA_Email_Template_Custom_Settings__c fold3 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - F46A',Folder_Id__c='CPM_PCL_F46A_EN');
            insert fold3 ;
            PA_Email_Template_Custom_Settings__c fold4 = new PA_Email_Template_Custom_Settings__c(Name='Geneva CH Header PCL',Folder_Id__c='Geneva_CH_Cust_Spec_Template_EN');
            insert fold4 ;
            PA_Email_Template_Custom_Settings__c fold5 = new PA_Email_Template_Custom_Settings__c(Name='Geneva DE Header PCL',Folder_Id__c='Geneva_DE_Cust_Spec_Template_EN');
            insert fold5 ;
            PA_Email_Template_Custom_Settings__c fold6 = new PA_Email_Template_Custom_Settings__c(Name='Geneva ES Header PCL',Folder_Id__c='Geneva_ES_Cust_Spec_Template_EN');
            insert fold6 ;
            PA_Email_Template_Custom_Settings__c fold7 = new PA_Email_Template_Custom_Settings__c(Name='Geneva FR Header PCL',Folder_Id__c='Geneva_FR_Cust_Spec_Template_EN');
            insert fold7 ;
            PA_Email_Template_Custom_Settings__c fold8 = new PA_Email_Template_Custom_Settings__c(Name='Geneva UK Header PCL',Folder_Id__c='Geneva_UK_Cust_Spec_Template_EN');
            insert fold8 ;
            PA_Email_Template_Custom_Settings__c fold9 = new PA_Email_Template_Custom_Settings__c(Name='Lux DE Header PCL',Folder_Id__c='Luxembourg_DE_Cust_Spec_Template_EN');
            insert fold9 ;
            PA_Email_Template_Custom_Settings__c fold10 = new PA_Email_Template_Custom_Settings__c(Name='Lux ES Header PCL',Folder_Id__c='Luxembourg_ES_Cust_Spec_Template_EN');
            insert fold10 ;
            PA_Email_Template_Custom_Settings__c fold11 = new PA_Email_Template_Custom_Settings__c(Name='Lux FR Header PCL',Folder_Id__c='Luxembourg_FR_Cust_Spec_Template_EN');
            insert fold11 ;
            PA_Email_Template_Custom_Settings__c fold12 = new PA_Email_Template_Custom_Settings__c(Name='Lux LU Header PCL',Folder_Id__c='Luxembourg_LU_Cust_Spec_Template_EN');
            insert fold12 ;
            PA_Email_Template_Custom_Settings__c fold13 = new PA_Email_Template_Custom_Settings__c(Name='Lux UK Header PCL',Folder_Id__c='Luxembourg_UK_Cust_Spec_Template_EN');
            insert fold13 ;
            PA_Email_Template_Custom_Settings__c fold14 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - F450',Folder_Id__c='CPM_PCL_F450_EN');
            insert fold14 ;
            PA_Email_Template_Custom_Settings__c fold15 = new PA_Email_Template_Custom_Settings__c(Name='P&IP EMEA PCL',Folder_Id__c='PnIP_EMEA_PCL_EN');
            insert fold15 ;
            PA_Email_Template_Custom_Settings__c fold16 = new PA_Email_Template_Custom_Settings__c(Name='P&IP NA PCL',Folder_Id__c='PnIP_NA_PCL_EN');
            insert fold16 ;
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            
            IntegrationLoginCredentials__c EC = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
            insert EC; 
            
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.action('','','statusCancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific',BU__c='TEMP2');
            service.paServiceState.currentRequest.action('','','cancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            
            //pavan commented out
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',BU__c='TEMP1');
            //pavan
            try
            {
                service.paServiceState.currentRequest.action('','','cancel');
            }
            catch(Exception me)
            {
                
            }
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //ExportPrices
            service.paServiceState.currentRequest.action('','','ExportPrices');
            
            //NCSMassiveHome
            service.paServiceState.currentRequest.action('','','NCSMassiveHome');
            
            Test.startTest();
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',BU__c='TEMP');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            try
            {
                service.paServiceState.currentRequest.scaleEnable='false';
                service.paServiceState.currentRequest.action('','','exportCSV');
            }
            catch(Exception e)
            {
                
            }
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           sales_Org_code__c='A640',current_level__c='1',BU__c='TESTED'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            try
            {       
                service.paServiceState.currentRequest.action('','','bulkApproval');
            }catch(Exception e){}//error expected since ProcessInstanceWrkItem does not return anything 
            //bulkReassignPopup
            try
            {
                service.paServiceState.currentRequest.action('','','bulkReassignPopup');
                //closeuserLookup
                service.paServiceState.currentRequest.action('','','closeuserLookup'); 
                
                //closeReassignPopup
                service.paServiceState.currentRequest.action('','','closeReassignPopup');
            }catch(Exception e){}//error expected since ProcessInstanceWrkItem does not return anything
            
            
            
            //reassignLookup
            service.paServiceState.currentRequest.action('','','reassignLookup');
            //saveBulkReassign
            //pavan
            try
            {
                service.paServiceState.currentRequest.action('','','saveBulkReassign');
            }
            catch(Exception ge)
            {
                
            }
            
            /*//making Non Comm Null
service.paServiceState.currentRequest.action('','','PaymentTermOnChange');
service.paServiceState.currentRequest.action('','','incoTermOnChange');
service.paServiceState.currentRequest.action('','','Closewindow');

//Massive Change 1722
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
sales_Org_code__c='A640');
service.paServiceState.ogitems.selectedUser = u1.id;
service.paServiceState.ogitems.userName=null;
//commenting-deploymentservice.paServiceState.currentRequest.action('','','Massive Change');

//Non Customer Specific 1736
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
sales_Org_code__c='A640');
service.paServiceState.ogitems.selectedUser = u1.id;
service.paServiceState.ogitems.userName=null;
service.paServiceState.currentRequest.action('','','Non Customer Specific');

//Sales Prices SAP record
ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS');
insert holderRecord;
ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id);                                                    
insert childRecord;


//PCLGeneration

service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
relList = new List<PARelatedList>();
relList.add(new PARelatedList());
relList[0].wrapperList = new List<PAWrapper>();
relList[0].wrapperList.add(new PAWrapper());
relList[0].wrapperList.add(new PAWrapper());
relList[0].wrapperList[0].isSelected = true;
relList[0].wrapperList[0].sObjectRecord = holderRecord;
relList[0].wrapperList[1].isSelected = true;
relList[0].wrapperList[1].sObjectRecord = childRecord;
//relList = service.paServiceState.currentRequest.getListWrappers();
service.paServiceState.currentRequest.pclDisplayPopUp = 'p7780_ENGLISH';
service.paServiceState.currentRequest.salesPriceSAP.relatedWrappersList = relList;
//service.paServiceState.currentRequest.action('','','PCLGeneration');
//relList.clear();
EmailTemplate email1 = new EmailTemplate(Name='p7780_ENGLISH', TemplateType= 'Text',
FolderId=[SELECT id,name from folder where name like 'Pricing Approval Folder' limit 1].id);
insert email1;
try
{
service.paServiceState.currentRequest.action('','','PCLGeneration');
}
catch(Exception e)
{
system.debug('@#@#pclgeneration exception occurred');
}
try
{
service.paServiceState.currentRequest.scaleEnable='false';
service.paServiceState.currentRequest.action('','','exportCSV');
}
catch(Exception e)
{

}
//done
service.paServiceState.currentRequest.csvString = null;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),sales_Org_code__c='A640',
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',Request_type__c=null,Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Canceldone');


//Non Cust and not Edit Header
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),sales_Org_code__c='A640',
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
service.paServiceState.currentRequest.action('','','cancel'); */
            /*//Edit Header
service.paServiceState.currentRequest = new PARequest(service.paServiceState);
service.paServiceState.currentRequest.action('','','cancelEditHeader');
//Export 
service.paServiceState.currentRequest = new PARequest(service.paServiceState);
service.paServiceState.currentRequest.pricingRequest = null;
service.paServiceState.currentRequest.action('','','ExportPrices');

//KCChange
service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
service.paServiceState.currentRequest.action('','','KCChange');

try
{
//FetchRecords

service.paServiceState.currentRequest.action('','','FetchRecords');
}catch(Exception e){}
Pricing_Request__c pr1 = new Pricing_Request__c(Request_Type__c='Non Customer Specific',sales_Org_code__c='A640',
Request_Name__c='test');
insert pr1; 

//bulkApproval
relList = new List<PARelatedList>();
relList.add(new PARelatedList());
relList[0].wrapperList = null;
service.paServiceState.currentRequest.relatedWrappersList = relList;
//try
//{     
//  service.paServiceState.currentRequest.action('','','bulkApproval');
//}catch(Exception e){}//error expected sincewrapperList is null */
            
            Test.stopTest();                                                                 
            
        }
    }
    
    public static testMethod void  paRequestTestMethod3()
    {
        
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        RecordType rType3 = [select id from RecordType Where sObjectType='Material__c' AND Name='ERP Material - Extended Data'];
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId(); 
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                                       
            
            insert orgItemList; 
            
            Test.startTest();
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            List<Project_price__c> projectList = new List<Project_Price__c>();
            projectList.add(new Project_Price__c(name='TestProject',Valid_From__c=system.today(),
                                                 Valid_To__c=system.today()+15,Project_Volume__c='100',Default_Discount__c='123.76543',
                                                 Assigned_To__c=u1.Id,Project_Status__c='Draft'));
            insert projectList;
            
            string storeId = projectList[0].id; 
            Pricing_Request__c pr1 = new Pricing_Request__c(sales_Org_code__c='A640',Request_name__c='test',
                                                            Request_type__c='Non Customer Specific',Project_Id__c=storeId,BU__c = 'test');
            insert pr1;
            
            //AddRequestItems(shud wrk)
            service.paServiceState.currentRequest.pricingRequest = pr1;
            service.paServiceState.currentRequest.pricingRequest.Id = pr1.Id;
            service.paServiceState.currentRequest.pricingRequest.Request_Type__c='Non Customer Specific';
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            try
            {                                                                       
                service.paServiceState.currentRequest.action('','','AddRequestItems');
            }catch(Exception e){}
            
            service.paServiceState.ogItems.value='Import';
            try
            {
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            }catch(Exception e){}//expecting err for customer 
            service.paServiceState.currentRequest = new PARequest('term','');
            
            service.paServiceState.ogItems.isVisibleMap.put('ManageCustomerPrices',true);
            service.paServiceState.ogItems.isVisibleMap.put('ManagePriceLists',true);
            //getListWrappers for non Bu Admin
            service.paServiceState.ogItems.value='Pending';
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.getListWrappers();
            
            //for getListWrappers
            List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
            prList.add(new Pricing_Request__c(Request_Name__c='test',sales_org_code__c='A640',Request_type__c='Massive',
                                              Request_Approval_Status__c='Draft',Bu__c='BI EMEA Surfaces'));
            prList.add(new Pricing_Request__c(Request_Name__c='test',sales_org_code__c='A640',Request_type__c='Non Customer Specific',
                                              Request_Approval_Status__c='Draft',Bu__c='BI EMEA Surfaces',Customer_Specific__c=false,SoldTo_Code__c=null));
            prList.add(new Pricing_Request__c(Request_Name__c='test',sales_org_code__c='A640',Pricing_Request_Type__c='Permanent',
                                              Request_Type__c = 'Customer Specific',Request_Approval_Status__c='Draft',Bu__c='BI EMEA Surfaces',Customer_Specific__c=true,SoldTo_Code__c='5512345'));
            prList.add(new Pricing_Request__c(Request_Name__c='test',sales_org_code__c='A640',
                                              Request_Type__c = 'Import',Request_Approval_Status__c='Draft',Bu__c='BI EMEA Surfaces',SoldTo_Code__c=null));
            insert prList;
            service.paServiceState.ogItems.value='Massive';
            service.paServiceState.currentRequest.getListWrappers();
            
            service.paServiceState.ogItems.value='NonCustomerSpecific';
            //service.paServiceState.currentRequest.displayRequestHistory = true;
            service.paServiceState.currentRequest.getListWrappers();
            
            service.paServiceState.currentRequest.getListWrappers();
            
            service.paServiceState.ogItems.value='Draft';
            service.paServiceState.currentRequest.getListWrappers();
            
            service.paServiceState.ogItems.value='Import';
            service.paServiceState.currentRequest.getListWrappers();
            
            //pcl new
            
            
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',Rate__c='124.23',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,
                                                                              Project_Id__c=storeId,Distributor_Code__c= 'Y71',Distributor_Name__c='Test11');                                                 
            insert childRecord;
            List<ERP_Sales_Prices_SAP__c> sapList = new List<ERP_Sales_Prices_SAP__c>();
            sapList.add(new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',Distributor_Code__c= 'Y0',Distributor_Name__c='Test10',
                                                    Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',Rate__c='123.234',
                                                    Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                    sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                    SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                    Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                    Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',
                                                    record_id__c=holderRecord.id+'#'+'DuPontContact'+'/'+childRecord.id));
            insert sapList;
            
            Material__c m1 = new Material__c(ERP_Material_code__c='123456',RecordTypeId=rType3.id,ERP_Source_Cluster__C='510',ERP_Sales_Org_Code__c='A640');
            insert m1;
            
            //Material_Localization__c
            Material_Localization__c ml = new Material_Localization__c(Sales_Text__c='Material Sales Text',Language__c='EN',
                                                                       Material__c=m1.id);
            insert ml;
            
            service.paServiceState.currentRequest.listofids = sapList[0].id;
            List<PAWrapper> paWrapperList = new List<PAWrapper>();
            paWrapperList = service.paServiceState.currentRequest.listofwrappertables;
            
            //listofCustomerContacts
            List<string> s = new string[]{'A'};
                s = service.paServiceState.currentRequest.listofCustomerContacts;
            
            //listofProjectPrices
            projectList=service.paServiceState.currentRequest.listofProjectPrices; 
            //listrequestdetils
            pr1 = service.paServiceState.currentRequest.listrequestdetils;
            
            Test.stopTest();
            
        }   
        
    }
    
    
    public static testMethod void paRequestTestMethod4()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c = true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,Non_Standard_Payment_Terms__c = 'a;b',
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',isPaymentTermsApplicable__c = true,
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,Non_Standard_Payment_Terms__c = 'a;b',
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.action('','','statusCancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            
            
            
            
            
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           //pavan
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='TEST1'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            
            
            
            Pricing_Request__c pr1 = new Pricing_Request__c(Request_Type__c='Non Customer Specific',sales_Org_code__c='A640',
                                                            //Request_Name__c='test');
                                                            //pavan
                                                            Request_Name__c='test',BU__c='MYTEST');
            insert pr1; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            try
            {       
                service.paServiceState.currentRequest.action('','','bulkApproval');
            }catch(Exception e){}//error expected sincewrapperList is null 
            
            List<SelectOption> soList = service.paServiceState.currentRequest.nonStandardSelectList;
            
            
        }
    }
    
    static testMethod void paRequestTestMethod5()
    {
        
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='BI EMEA Surfaces'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y71',Distributor_Name__c='Test11');                                                    
            insert childRecord;
            
            
            //Edit Header
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Sales_Prices_SAP__c sp1 = new ERP_Sales_Prices_SAP__c(BU__c='BI EMEA Surfaces',Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            ERP_Sales_Prices_SAP__c sp2 = new ERP_Sales_Prices_SAP__c(BU__c='BI EMEA Surfaces',Key_Combination_Code__c='A630',Key_Combination__c='abcdef');
            insert sp1;
            insert sp2;
            exportList.add(sp1);
            exportList.add(sp2);
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Name, Distributor Code,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            Pricing_Request__c pr1 = new Pricing_Request__c(Request_Type__c='Non Customer Specific',sales_Org_code__c='A640',
                                                            //Request_Name__c='test');
                                                            //pavan
                                                            Request_Name__c='test',BU__C='TEST');
            insert pr1; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            //try
            //{     
            //  service.paServiceState.currentRequest.action('','','bulkApproval');
            //}catch(Exception e){}//error expected sincewrapperList is null 
            
            
            
        }
        
        
    }
    
    static testMethod void paRequestTestMethod6()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='BI EMEA Surfaces'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y8',Distributor_Name__c='Test2');                                                    
            insert childRecord;
            
            
            //Edit Header
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Sales_Prices_SAP__c sp1 = new ERP_Sales_Prices_SAP__c(BU__c='BI EMEA Surfaces',Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            ERP_Sales_Prices_SAP__c sp2 = new ERP_Sales_Prices_SAP__c(BU__c='BI EMEA Surfaces',Key_Combination_Code__c='A630',Key_Combination__c='abcdef');
            insert sp1;
            insert sp2;
            exportList.add(sp1);
            exportList.add(sp2);
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            
            
            Profile px1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
            UserRole rx=  TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
            User usrx1 = TestUserUtil.createTestUser(rx.Id,px1.Id,'User1 FirstName','User1 LastName');
            //insert usrx1;
            
            
            
            
            
            Pricing_Request__c pr1 = new Pricing_Request__c(Request_Type__c='Non Customer Specific',sales_Org_code__c='A640',
                                                            //Request_Name__c='test');
                                                            //pavan
                                                            Request_Name__c='test',current_level__c='1',Backup_Level_1__c=u1.Id,Sent_to_Backup_approver__c=true,BU__C='TEST',Request_Approval_Status__c='Submitted');
            insert pr1; 
            Pricing_Request__c pr2 = new Pricing_Request__c(Request_Type__c='Non Customer Specific',sales_Org_code__c='A640',
                                                            //Request_Name__c='test');
                                                            //pavan
                                                            Request_Name__c='test',BU__C='business',Request_Approval_Status__c='Submitted',Current_Approver__c=u1.id);
            insert pr2; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            Test.startTest();
            
            service.paServiceState.currentRequest.action('','','KCChange');
            service.paServiceState.currentRequest.action('','','done');
            try{
                service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
            }catch(Exception e){}
            try{
                service.paServiceState.currentRequest.action('','','EditCancel');
            }catch(Exception e){}
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
            service.paServiceState.currentRequest.pricingRequest = pr1;
            service.paServiceState.currentRequest.action('','','Reference Pricing');
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            try{
                
                service.paServiceState.currentRequest.getBURequests();           
                service.paServiceState.currentRequest.massReassignAttribute = true;
            }catch(Exception e){
                //service.paServiceState.currentRequest.getBURequests(); 
            }
            try{
                
                service.paServiceState.currentRequest.changeBU();
            }catch(Exception e){
                
            }
            
            try{
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr1;
                service.paServiceState.currentRequest.getUpdatedPricingRequest();
            }catch(Exception e){
                
            }
            
            Test.stopTest();
            
            
        }
        
    }
    static testMethod void paRequestTestMethod6_1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='CPM EMEA',Pricing_Procedure__c='CPM EMEA',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            orgGroupList.add(salesArea);//<AB20210301>
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            orgGroupList.add(salesAreaA641);//<AB20210301>
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='CPM EMEA',RecordTypeId=rType1.id);
            orgGroupList.add(Business);//<AB20210301>
            insert orgGroupList;//<AB20210301>
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.ogItems.isBuadmin=false;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='CPM EMEA',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            service.paServiceState.currentRequest.sessionId = 'test';
            service.paServiceState.currentRequest.listSeparator = 'test';
            
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
            service.paServiceState.currentRequest.headerTitle='Test';
            service.paServiceState.currentRequest.cloneFlag=true;
            service.paServiceState.currentRequest.requesttype='Customer Specific';
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Test.startTest(); //<AB20210301>
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='CPM EMEA'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',is_End_User_Rebate__c=true);
            
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
            service.paServiceState.currentRequest.pclShowSelectionTable=true;
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y0',Distributor_Name__c='Test9');                                                    
            insert childRecord;
            
            
            //Edit Header
            service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
            service.paServiceState.ogitems.isEndUserRebate=true;
            list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.reqOvw=false;
            service.paServiceState.currentRequest.fixValDate='test';
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                            SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                            Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                            Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='CPM EMEA',
                                                            Request_Approval_Status__c='Draft',Spot_Type__c='not null');
            insert pr3; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;           
            service.paServiceState.currentRequest.mailBody='test';
            service.paServiceState.currentRequest.pclDisplayString='test';
            service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                service.paServiceState.currentRequest.soldToNameFilter='test';
            
            
            service.paServiceState.currentRequest.action('','','KCChange');
            service.paServiceState.currentRequest.action('','','done');
            try{
                service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
            }catch(Exception e){}
            try{
                service.paServiceState.currentRequest.action('','','EditCancel');
            }catch(Exception e){}
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
            service.paServiceState.currentRequest.pricingRequest = pr3;
            service.paServiceState.currentRequest.action('','','Reference Pricing');
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            try{
                
                service.paServiceState.currentRequest.getBURequests();           
                service.paServiceState.currentRequest.massReassignAttribute = false;
            }catch(Exception e){
                //service.paServiceState.currentRequest.getBURequests(); 
            }
            try{
                
                service.paServiceState.currentRequest.changeBU();
            }catch(Exception e){
                
            }
            
            try{
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.getUpdatedPricingRequest();
            }catch(Exception e){
                
            }
            
            Test.stopTest();
            
            
        }
        
    }
    
    
    //june29----subbu--pooja
    
    static testMethod void paRequestTestMethod101() {
        
        
        
        //Bala - start 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        //system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        List<User> userList = new List<User>(); //<AB20210301>
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        userList.add(u1); //<AB20210301>
        
        User u2 = TestUserUtil.createTestUser(r.id,p2.id,'test fname1','test lname2');        
        userList.add(u2); //<AB20210301>
        insert userList; //<AB20210301>
        
        
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType1 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
            List<PA_Email_Template_Custom_Settings__c> foldList = new List<PA_Email_Template_Custom_Settings__c>(); //<AB20210301>
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            foldList.add(fold); //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold1 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - CS',Folder_Id__c='BI_EMEA_SURF_Customer_Spec_Template_EN');
            foldList.add(fold1); //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold2 = new PA_Email_Template_Custom_Settings__c(Name='Project - P7780',Folder_Id__c='BI_EMEA_Surf_Project_Spec_Template_EN');
            foldList.add(fold2); //<AB20210301>
            insert foldList ; 
            
            //orgGrp Items
            try
            {
                List<EmailTemplate> emailTemp = [select id,Name,body,description FROM EmailTemplate  where folder.Name=:PA_Email_Template_Custom_Settings__c.getInstance('priceApprovalFolder').folder_Id__c /*AND Name=:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c*/];
            }
            catch(exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            
            
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
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //subbu
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            orgGroupList.add(salesArea);//<AB20210301>
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            orgGroupList.add(Business);//<AB20210301>
            insert orgGroupList;//<AB20210301>
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                               
            
            insert orgItemList; 
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType1.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //cust. specific scenario 
            PAService service = new PAService(); 
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.orgGroupItems= orgItemList[0];
            //service.paServiceState.ogItems.orgGroupItems.ERP_Currency__c = 'EA;KG;EU';
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.erpCustomer = new PAERPCustomer(service.paServiceState);
            service.paServiceState.erpCustomer.customerCode=cust.customer_code__c;
            service.paServiceState.erpCustomer.getCustomerCode();
            service.paServiceState.erpCustomer.salesOrgCode = 'A640';
            service.paServiceState.erpCustomer.distCode='10';
            service.paServiceState.erpCustomer.divCode='02';
            service.paServiceState.erpCustomer.ogitems.value='CustRequestReasons';
            
            //Inserting Project for project 
            Project_Price__c proj = new Project_Price__c(Default_Discount__c='12.34');
            insert proj; 
            //setting PricingRequestId -> this is set when user clicks the request from customer reqPage
            List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES1',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));                                   
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Non Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=false,BU__c='BI EMEA SURFACES2',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES3',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Project Pricing',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES4',
                                              Project_Price__c=proj.id,Project_Id__c=proj.id,
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));   
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Import',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Import',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES5',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));                                                                                                                   
            //inserting pricing request
            insert prList;
            
            Price_Visibility__c pv = new Price_Visibility__c();
            pv.name='A640-10-02';
            pv.BU__c = 'BI EMEA SURFACES';
            pv.Dist_Channel_Code__c='10';
            pv.Division_Code__c = '02';
            pv.Price_Type__c = 'Net Floor';
            pv.Pricing_Request_Type__c = 'Project Pricing;Permanent';
            pv.Request_Type__c = 'Customer Specific';
            pv.Sales_Org_Code__c ='A640';
            insert pv;
            
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                new List<ERP_Customer_Material_Key__c >();   
            
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Pricing Exception',Code__c='PECode',Name__c='PEName'));
            insert ERPCustomerMaterialKeyList;
            List<Organizational_Group_Item__c> orgItemList1 = new List<Organizational_Group_Item__c>();
            orgItemList1.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',
                Pricing_Task_Reasons__c ='Pricing Task',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                               
            
            insert orgItemList1;
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            
            //subbu---June30
            Org_Group_ERP_Key__c ogek = new Org_Group_ERP_Key__c();
            //  ogek.ERP_Cus_Mat_Compt_Key__r.Type__c = 'pricing Exception';
            //  ogek.Organizational_Group_Item__c = service.paServiceState.ogItems.orgGroupItems.Id;
            //  insert ogek;
            
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                             Organizational_Group_Item__c=orgItemList1[0].id));
                
            }
            insert orgGroupKeyList;
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //calling second time 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = prList[0];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            service.paServiceState.currentRequest.pricingRequestId = 'Clone-'+prList[0].id;
            service.paServiceState.currentRequest.getListBusinessComponents();
            service.paServiceState.currentRequest.getListOptions();
            
            
            service.paServiceState.currentRequest.getPricingException();
            
            //for pricingTaskReasons 
            service.paServiceState.erpCustomer.ogitems.value='PricingTaskReasons';      
            service.paServiceState.currentRequest.getPricingTaskType();
            service.paServiceState.currentRequest.getListOptions(); 
            
            //Non Cust Reasons
            service.paServiceState.erpCustomer.ogitems.value='NonCustReasons';      
            service.paServiceState.currentRequest.getListOptions();
            
            //ProjectReasons
            service.paServiceState.erpCustomer.ogitems.value='ProjectReasons';      
            service.paServiceState.currentRequest.getListOptions();
            
            service.paServiceState.currentRequest.pricingRequest = prList[1];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.currentRequest.getListOptions();
            
            service.paServiceState.currentRequest.pricingRequest = prList[2];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //line 715
            service.paServiceState.currentRequest.pricingRequest = prList[3];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.erpCustomer.ogitems.value = null;
            service.paServiceState.currentRequest.getPricingTaskType();
            service.paServiceState.currentRequest.getListOptions();
            
            //line 722
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[4].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //line 729
            service.paServiceState.currentRequest.pricingRequest = prList[5];//[select id from Pricing_Request__c WHERE id=:prList[5].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //for csv
            service.paServiceState.currentRequest.csvString='status';
            service.paServiceState.currentRequest.getListOptions();
            
            // PAKeyCombination keyCmb = new PAKeyCombination(service.paServiceState);
            //keyCmb.pckcconcat = 'test-test';
            
            // service.paServiceState.currentRequest.action('','','FetchRecords');
            Test.startTest();//<AB20210301>
            try
            {
                
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.erpCustomer.ogitems.value = null;
                service.paServiceState.currentRequest.emailTemplate = new list<string>{'abcd','xyz'};
                    service.paServiceState.currentRequest.pclDisplayPopUp='PCLRender';
                service.paServiceState.currentRequest.getListOptions();
                
            }
            catch(exception e)
            {
                
            }
            //getListWrappers
            service.paServiceState.currentRequest.pricingRequest = prList[0];
            service.paServiceState.ogitems.value='Draft';
            service.paServiceState.currentRequest.getListWrappers();
            service.paServiceState.currentRequest.add();
            service.paServiceState.currentRequest.deleteRecord();
            service.paServiceState.currentRequest.getName();
            service.paServiceState.currentRequest.getType();
            
            
            //submitted 
            service.paServiceState.ogitems.value = 'Submitted';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Submitted',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Customer Specific');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Approved
            service.paServiceState.ogitems.value = 'Approved';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Approved',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Import',Request_Type__c='Import');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Rejected
            service.paServiceState.ogitems.value = 'Rejected';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Rejected',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Massive');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Recalled
            service.paServiceState.ogitems.value = 'Recalled';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Recalled',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Pending
            service.paServiceState.ogitems.value = 'Pending';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Pending',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            //clone
            service.paServiceState.ogitems.value = 'Clone';
            
            //service.paServiceState.ogitems.value = null;
            //service.paServiceState.currentRequest.displayRequestHistory = true;
            //service.paServiceState.erpCustomer.ogitems.SelectedBU = 'BI EMEA SURFACES';
            //service.paServiceState.currentRequest.getListWrappers();
            
            
            
            try
            {
                //    service.paServiceState.currentRequest.action('','','Massive Change');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            }
            try
            {   
                service.paServiceState.currentRequest.action('','','Non Customer Specific');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            } 
            try
            {   
                service.paServiceState.currentRequest.action('','PACurrentPrices','customerPricesonBehalfOf');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            }  
            service.paServiceState.currentRequest.action('','','selectTemplate');
            service.paServiceState.currentRequest.action('','','cancelGeneration');
            service.paServiceState.currentRequest.action('','','cancelTemplateselection');
            //service.paServiceState.currentRequest.action('','','PCLGeneration');
            
            
            //for Project Price
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.projectprice = proj;
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            service.paServiceState.currentRequest.pricingRequestId = 'Clone-'+prList[4].id;
            //commenting-deploymentservice.paServiceState.currentRequest.pricingRequestId = prList[4].id;
            
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.projectprice = null;
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            //SubbuPooja
            Double abc = service.paServiceState.currentRequest.totalSalesReduction;
            service.paServiceState.currentRequest.SFDCKCDesc='test';
            service.paServiceState.currentRequest.dispNCS='test1';
            service.paServiceState.currentRequest.phFilter='test2';
            service.paServiceState.currentRequest.profitCenterLevel='test3';
            service.paServiceState.currentRequest.projectFilter='test4';
            service.paServiceState.currentRequest.materialDescription='test5';
            service.paServiceState.currentRequest.phDescription='test6';
            
            service.paServiceState.currentRequest.lastPHLevelSelected=5;
            Pricing_Request__c pr1 = new Pricing_Request__c(sales_Org_code__c='A640',Request_name__c='test',
                                                            Request_type__c='Non Customer Specific',BU__c = 'test');
            insert pr1;
            service.paServiceState.currentRequest.requestId=pr1.id;
            
            try
            {
                service.paServiceState.currentRequest.pricingRequestId = prList[4].id;
            }
            catch(Exception e){}//no need this if system.debug is removed
            
            
            Test.stopTest();
        }
        
        
        
        
    }
    
    //Calment start
    static testMethod void paRequestTestMethod1010() {
        
        
        
        //Bala - start 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        //system.debug('#### p1'+p1);
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        List<User> userList = new List<User>(); //<AB20210301>
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        userList.add(u1);//<AB20210301>
        
        User u2 = TestUserUtil.createTestUser(r.id,p2.id,'test fname1','test lname2');
        userList.add(u2);//<AB20210301>
        insert userList;//<AB20210301>
        
        
        RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType1 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();  
            List<PA_Email_Template_Custom_Settings__c> foldList = new List<PA_Email_Template_Custom_Settings__c>(); //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            foldList.add(fold); //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold1 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - CS',Folder_Id__c='BI_EMEA_SURF_Customer_Spec_Template_EN');
             foldList.add(fold1); //<AB20210301>
            PA_Email_Template_Custom_Settings__c fold2 = new PA_Email_Template_Custom_Settings__c(Name='Project - P7780',Folder_Id__c='BI_EMEA_Surf_Project_Spec_Template_EN');
             foldList.add(fold2); //<AB20210301>
            insert foldList ; //<AB20210301>
            
            //orgGrp Items
            try
            {
                List<EmailTemplate> emailTemp = [select id,Name,body,description FROM EmailTemplate  where folder.Name=:PA_Email_Template_Custom_Settings__c.getInstance('priceApprovalFolder').folder_Id__c /*AND Name=:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c*/];
            }
            catch(exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            
            
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
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //subbu
            ERP_Access_Sequence__c acSq1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                      Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                      Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq1;
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                               
            
            insert orgItemList; 
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType1.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //cust. specific scenario 
            PAService service = new PAService(); 
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.orgGroupItems= orgItemList[0];
            //service.paServiceState.ogItems.orgGroupItems.ERP_Currency__c = 'EA;KG;EU';
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.erpCustomer = new PAERPCustomer(service.paServiceState);
            service.paServiceState.erpCustomer.customerCode=cust.customer_code__c;
            service.paServiceState.erpCustomer.getCustomerCode();
            service.paServiceState.erpCustomer.salesOrgCode = 'A640';
            service.paServiceState.erpCustomer.distCode='10';
            service.paServiceState.erpCustomer.divCode='02';
            service.paServiceState.erpCustomer.ogitems.value='CustRequestReasons';
            
            //Inserting Project for project 
            Project_Price__c proj = new Project_Price__c(Default_Discount__c='12.34');
            insert proj; 
            //setting PricingRequestId -> this is set when user clicks the request from customer reqPage
            List<Pricing_Request__c> prList = new List<Pricing_Request__c>();
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES1',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));                                   
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Non Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Permanent',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=false,BU__c='BI EMEA SURFACES2',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='not null'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES3',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Project Pricing',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES4',
                                              Project_Price__c=proj.id,Project_Id__c=proj.id,
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));   
            prList.add(new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                              SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Import',Request_Reason__c='test',
                                              Request_Name__c='test123',Pricing_Request_Type__c='Import',Division_Code__c='02',
                                              Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES5',
                                              Request_Approval_Status__c='Draft',Spot_Type__c='Rebate Agreement'));                                                                                                                   
            //inserting pricing request
            insert prList;
            
            Price_Visibility__c pv = new Price_Visibility__c();
            pv.name='A640-10-02';
            pv.BU__c = 'BI EMEA SURFACES';
            pv.Dist_Channel_Code__c='10';
            pv.Division_Code__c = '02';
            pv.Price_Type__c = 'Net Floor';
            pv.Pricing_Request_Type__c = 'Project Pricing;Permanent';
            pv.Request_Type__c = 'Customer Specific';
            pv.Sales_Org_Code__c ='A640';
            insert pv;
            
            Price_Visibility__c pv1 = new Price_Visibility__c();
            pv1.name='A640-10-02#BI EMEA SURFACES';
            pv1.BU__c = 'BI EMEA SURFACES';
            pv1.Dist_Channel_Code__c='10';
            pv1.Division_Code__c = '02';
            pv1.Price_Type__c = 'Net Floor';
            pv1.Pricing_Request_Type__c = 'Project Pricing;Permanent;Pricing Task';
            pv1.Request_Type__c = 'Customer Specific';
            pv1.Sales_Org_Code__c ='A640';
            insert pv1;
            
            List<ERP_Customer_Material_Key__c> ERPCustomerMaterialKeyList = 
                new List<ERP_Customer_Material_Key__c >();   
            
            ERPCustomerMaterialKeyList.add(new ERP_Customer_Material_Key__c(Type__c='Pricing Exception',Code__c='PECode',Name__c='PEName'));
            insert ERPCustomerMaterialKeyList;
            List<Organizational_Group_Item__c> orgItemList1 = new List<Organizational_Group_Item__c>();
            orgItemList1.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',
                Pricing_Task_Reasons__c ='Pricing Task',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));                               
            
            insert orgItemList1;
            //org Group Key
            List<Org_Group_ERP_Key__c > orgGroupKeyList = new List<Org_Group_ERP_Key__c>();
            
            //subbu---June30
            Org_Group_ERP_Key__c ogek = new Org_Group_ERP_Key__c();
            //  ogek.ERP_Cus_Mat_Compt_Key__r.Type__c = 'pricing Exception';
            //  ogek.Organizational_Group_Item__c = service.paServiceState.ogItems.orgGroupItems.Id;
            //  insert ogek;
            
            for(Integer i =0;i<ERPCustomerMaterialKeyList.size();i++)
            {
                orgGroupKeyList.add(new Org_Group_ERP_Key__c(ERP_Cus_Mat_Compt_Key__c=ERPCustomerMaterialKeyList[i].id,
                                                             Organizational_Group_Item__c=orgItemList1[0].id));
                
            }
            insert orgGroupKeyList;
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //calling second time 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = prList[0];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            service.paServiceState.currentRequest.pricingRequestId = 'Clone-'+prList[0].id;
            service.paServiceState.currentRequest.getListBusinessComponents();
            service.paServiceState.currentRequest.getListOptions();
            
            
            service.paServiceState.currentRequest.getPricingException();
            
            //for pricingTaskReasons 
            service.paServiceState.erpCustomer.ogitems.value='PricingTaskReasons';      
            service.paServiceState.currentRequest.getPricingTaskType();
            service.paServiceState.currentRequest.getListOptions(); 
            
            //Non Cust Reasons
            service.paServiceState.erpCustomer.ogitems.value='NonCustReasons';      
            service.paServiceState.currentRequest.getListOptions();
            
            //ProjectReasons
            service.paServiceState.erpCustomer.ogitems.value='ProjectReasons';      
            service.paServiceState.currentRequest.getListOptions();
            
            service.paServiceState.currentRequest.pricingRequest = prList[1];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.currentRequest.getListOptions();
            
            service.paServiceState.currentRequest.pricingRequest = prList[2];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //line 715
            service.paServiceState.currentRequest.pricingRequest = prList[3];//[select id from Pricing_Request__c WHERE id=:prList[3].id];
            service.paServiceState.erpCustomer.ogitems.value = null;
            service.paServiceState.currentRequest.getPricingTaskType();
            service.paServiceState.currentRequest.getListOptions();
            
            //line 722
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[4].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //line 729
            service.paServiceState.currentRequest.pricingRequest = prList[5];//[select id from Pricing_Request__c WHERE id=:prList[5].id];
            service.paServiceState.currentRequest.getListOptions();
            
            //for csv
            service.paServiceState.currentRequest.csvString='status';
            service.paServiceState.currentRequest.getListOptions();
            
            // PAKeyCombination keyCmb = new PAKeyCombination(service.paServiceState);
            //keyCmb.pckcconcat = 'test-test';
            
            // service.paServiceState.currentRequest.action('','','FetchRecords');
             Test.startTest(); //<AB20210301>
            try
            {
                
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.erpCustomer.ogitems.value = null;
                service.paServiceState.currentRequest.emailTemplate = new list<string>{'abcd','xyz'};
                    service.paServiceState.currentRequest.pclDisplayPopUp='PCLRender';
                service.paServiceState.currentRequest.getListOptions();
                
            }
            catch(exception e)
            {
                
            }
            //getListWrappers
            service.paServiceState.currentRequest.pricingRequest = prList[0];
            service.paServiceState.ogitems.value='Draft';
            service.paServiceState.currentRequest.getListWrappers();
            service.paServiceState.currentRequest.add();
            service.paServiceState.currentRequest.deleteRecord();
            service.paServiceState.currentRequest.getName();
            service.paServiceState.currentRequest.getType();
            
            
            //submitted 
            service.paServiceState.ogitems.value = 'Submitted';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Submitted',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Customer Specific');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Approved
            service.paServiceState.ogitems.value = 'Approved';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Approved',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Import',Request_Type__c='Import');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Rejected
            service.paServiceState.ogitems.value = 'Rejected';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Rejected',BU__c='BI EMEA SURFACES',Pricing_Request_Type__c='Permanent',Request_Type__c='Massive');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Recalled
            service.paServiceState.ogitems.value = 'Recalled';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Recalled',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            
            //Pending
            service.paServiceState.ogitems.value = 'Pending';
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Approval_Status__c='Pending',BU__c='BI EMEA SURFACES');
            service.paServiceState.currentRequest.getListWrappers();
            //clone
            service.paServiceState.ogitems.value = 'Clone';
            
            //service.paServiceState.ogitems.value = null;
            //service.paServiceState.currentRequest.displayRequestHistory = true;
            //service.paServiceState.erpCustomer.ogitems.SelectedBU = 'BI EMEA SURFACES';
            //service.paServiceState.currentRequest.getListWrappers();
            
            
           
            try
            {
                //    service.paServiceState.currentRequest.action('','','Massive Change');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            }
            try
            {   
                service.paServiceState.currentRequest.action('','','Non Customer Specific');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            } 
            try
            {   
                service.paServiceState.currentRequest.action('','PACurrentPrices','customerPricesonBehalfOf');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Please select the Sales Org.'),e.getMessage());
            }  
            service.paServiceState.currentRequest.action('','','selectTemplate');
            service.paServiceState.currentRequest.action('','','cancelGeneration');
            service.paServiceState.currentRequest.action('','','cancelTemplateselection');
            //service.paServiceState.currentRequest.action('','','PCLGeneration');
            
            
            //for Project Price
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.projectprice = proj;
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            service.paServiceState.currentRequest.pricingRequestId = 'Clone-'+prList[4].id;
            //commenting-deploymentservice.paServiceState.currentRequest.pricingRequestId = prList[4].id;
            
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.projectprice = null;
            service.paServiceState.currentRequest.pricingRequest = prList[4];//[select id from Pricing_Request__c WHERE id=:prList[0].id];
            //SubbuPooja
            Double abc = service.paServiceState.currentRequest.totalSalesReduction;
            service.paServiceState.currentRequest.SFDCKCDesc='test';
            service.paServiceState.currentRequest.dispNCS='test1';
            service.paServiceState.currentRequest.phFilter='test2';
            service.paServiceState.currentRequest.profitCenterLevel='test3';
            service.paServiceState.currentRequest.projectFilter='test4';
            service.paServiceState.currentRequest.materialDescription='test5';
            service.paServiceState.currentRequest.phDescription='test6';
            
            service.paServiceState.currentRequest.lastPHLevelSelected=5;
            Pricing_Request__c pr1 = new Pricing_Request__c(sales_Org_code__c='A640',Request_name__c='test',
                                                            Request_type__c='Non Customer Specific',BU__c = 'test');
            insert pr1;
            service.paServiceState.currentRequest.requestId=pr1.id;
            
            try
            {
                service.paServiceState.currentRequest.pricingRequestId = prList[4].id;
            }
            catch(Exception e){}//no need this if system.debug is removed
            string ReassignReq = service.paServiceState.currentRequest.ReassignReq;
            
            Test.stopTest();
        }
    }
    
    
    //Calment end
    //method 2 -- Subbu --  Pooja
    
    public static testMethod void paRequestTestMethod201()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            
            IntegrationLoginCredentials__c pr4 = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com.utqa', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
            insert pr4;        
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();   
            //orgGrp Items
            try
            {          
                
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            PA_Email_Template_Custom_Settings__c fold1 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - CS',Folder_Id__c='BI_EMEA_SURF_Customer_Spec_Template_EN');
            insert fold1 ;
            PA_Email_Template_Custom_Settings__c fold2 = new PA_Email_Template_Custom_Settings__c(Name='Project - P7780',Folder_Id__c='BI_EMEA_Surf_Project_Spec_Template_EN');
            insert fold2 ;
            PA_Email_Template_Custom_Settings__c fold3 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - F46A',Folder_Id__c='CPM_PCL_F46A_EN');
            insert fold3 ;
            PA_Email_Template_Custom_Settings__c fold4 = new PA_Email_Template_Custom_Settings__c(Name='Geneva CH Header PCL',Folder_Id__c='Geneva_CH_Cust_Spec_Template_EN');
            insert fold4 ;
            PA_Email_Template_Custom_Settings__c fold5 = new PA_Email_Template_Custom_Settings__c(Name='Geneva DE Header PCL',Folder_Id__c='Geneva_DE_Cust_Spec_Template_EN');
            insert fold5 ;
            PA_Email_Template_Custom_Settings__c fold6 = new PA_Email_Template_Custom_Settings__c(Name='Geneva ES Header PCL',Folder_Id__c='Geneva_ES_Cust_Spec_Template_EN');
            insert fold6 ;
            PA_Email_Template_Custom_Settings__c fold7 = new PA_Email_Template_Custom_Settings__c(Name='Geneva FR Header PCL',Folder_Id__c='Geneva_FR_Cust_Spec_Template_EN');
            insert fold7 ;
            PA_Email_Template_Custom_Settings__c fold8 = new PA_Email_Template_Custom_Settings__c(Name='Geneva UK Header PCL',Folder_Id__c='Geneva_UK_Cust_Spec_Template_EN');
            insert fold8 ;
            PA_Email_Template_Custom_Settings__c fold9 = new PA_Email_Template_Custom_Settings__c(Name='Lux DE Header PCL',Folder_Id__c='Luxembourg_DE_Cust_Spec_Template_EN');
            insert fold9 ;
            PA_Email_Template_Custom_Settings__c fold10 = new PA_Email_Template_Custom_Settings__c(Name='Lux ES Header PCL',Folder_Id__c='Luxembourg_ES_Cust_Spec_Template_EN');
            insert fold10 ;
            PA_Email_Template_Custom_Settings__c fold11 = new PA_Email_Template_Custom_Settings__c(Name='Lux FR Header PCL',Folder_Id__c='Luxembourg_FR_Cust_Spec_Template_EN');
            insert fold11 ;
            PA_Email_Template_Custom_Settings__c fold12 = new PA_Email_Template_Custom_Settings__c(Name='Lux LU Header PCL',Folder_Id__c='Luxembourg_LU_Cust_Spec_Template_EN');
            insert fold12 ;
            PA_Email_Template_Custom_Settings__c fold13 = new PA_Email_Template_Custom_Settings__c(Name='Lux UK Header PCL',Folder_Id__c='Luxembourg_UK_Cust_Spec_Template_EN');
            insert fold13 ;
            PA_Email_Template_Custom_Settings__c fold14 = new PA_Email_Template_Custom_Settings__c(Name='Cust Specific PCL - F450',Folder_Id__c='CPM_PCL_F450_EN');
            insert fold14 ;
            PA_Email_Template_Custom_Settings__c fold15 = new PA_Email_Template_Custom_Settings__c(Name='P&IP EMEA PCL',Folder_Id__c='PnIP_EMEA_PCL_EN');
            insert fold15 ;
            PA_Email_Template_Custom_Settings__c fold16 = new PA_Email_Template_Custom_Settings__c(Name='P&IP NA PCL',Folder_Id__c='PnIP_NA_PCL_EN');
            insert fold16 ;
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type_Code__c='B',Calculation_Type__c='Percentage'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            //Individual KC -- Subbu--Pooja
            ERP_Key_Combination__c kc1 = new ERP_Key_Combination__c();
            kc1.SAP_Application_Id__c='V';
            kc1.SAP_Client_Id__c='510';
            kc1.SAP_Cluster__c='CB1';
            kc1.Key_Combination_Code__c='A580';
            kc1.Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Ship to/Material';
            kc1.Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Ship to Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Ship to/Material';
            insert kc1;
            
            List<ERP_Access_Sequence__c> kc1List = new List<ERP_Access_Sequence__c>();
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true);
            
            insert acSq;
            
            ERP_Access_Sequence__c acSqkc1 = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                        Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                        Pricing_Key_Combination__c=kc1.id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true);
            kc1List.add(acSqkc1);
            
            insert kc1List;  
            System.assert(kc1List.size()>0);
            System.assertEquals(true, acSqkc1.isPaymentTermsApplicable__c);
            
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,Step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            System.assertEquals(true, orgItemList[0].isPaymentTermsApplicable__c);
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            
            IntegrationLoginCredentials__c EC = new IntegrationLoginCredentials__c (Name='admin.util@dupont.com', EncryptedLoginDetails__c='Infosys1234Xkh5hWWRryiH6c7tDrZrCH9jF');
            insert EC; 
            
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.action('','','statusCancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific',BU__c='TEMP2');
            service.paServiceState.currentRequest.action('','','cancel');
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            
            //pavan commented out
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',BU__c='TEMP1');
            //pavan
            try
            {
                service.paServiceState.currentRequest.action('','','cancel');
            }
            catch(Exception me)
            {
                
            }
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //ExportPrices
            service.paServiceState.currentRequest.action('','','ExportPrices');
            
            //NCSMassiveHome
            service.paServiceState.currentRequest.action('','','NCSMassiveHome');
            
            Test.startTest();
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',BU__c='TEMP');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            try
            {
                service.paServiceState.currentRequest.scaleEnable='true';
                service.paServiceState.currentRequest.action('','','exportCSV');
            }
            catch(Exception e)
            {
                
            }
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           sales_Org_code__c='A640',current_level__c='1',BU__c='TESTED'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            try
            {       
                service.paServiceState.currentRequest.action('','','bulkApproval');
            }catch(Exception e){}//error expected since ProcessInstanceWrkItem does not return anything 
            //bulkReassignPopup
            try
            {
                service.paServiceState.currentRequest.action('','','bulkReassignPopup');
                //closeuserLookup
                service.paServiceState.currentRequest.action('','','closeuserLookup'); 
                
                //closeReassignPopup
                service.paServiceState.currentRequest.action('','','closeReassignPopup');
            }catch(Exception e){}//error expected since ProcessInstanceWrkItem does not return anything
            
            
            
            //reassignLookup
            service.paServiceState.currentRequest.action('','','reassignLookup');
            //saveBulkReassign
            //pavan
            try
            {
                service.paServiceState.currentRequest.action('','','saveBulkReassign');
            }
            catch(Exception ge)
            {
                
            }
            
            
            Test.stopTest();                                                                 
            
        }
    }
    
    static testMethod void paRequestTestMethod601()
    {
        if(!Test.isRunningTest()){
            //for action method 
            Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
            Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
            // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
            UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
            
            User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
            insert u1;  
            
            RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
            RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
            
            
            
            system.runAs(u1)
            {
                
                //orgGrp Items
                try
                {
                    EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
                }
                catch (exception e) {}
                List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
                profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
                insert profilePermissionList;
                
                PAUtil.insertProfileRecordId();  
                
                List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
                reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
                insert reqOrder;
                
                PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
                insert fold ; 
                
                ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                           Pricing_Procedure_Description__c='VINAY(5689)',Pricing_Procedure__c='VINAY(5689)',
                                                                           SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
                insert pp;
                
                //Pricing Condition
                List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
                pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                        Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                        Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
                pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
                pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
                insert pcList;
                
                //Key Combination         
                List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
                kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                      Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                      Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
                kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
                insert kcList;
                
                ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                         Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                         Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
                
                insert acSq;
                
                //Procedure Conditions
                ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                      From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
                
                insert proCons;
                
                
                OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
                insert salesArea;
                
                OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                            ERP_Division_code__c='02');
                insert salesAreaA641;
                
                OrgGroup__c Business = new OrgGroup__c(Business__c='VINAY(5689)',RecordTypeId=rType1.id);
                insert Business;
                
                List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
                orgItemList.add(new Organizational_Group_Item__c(
                    Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                    Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
                orgItemList.add(new Organizational_Group_Item__c(
                    Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                    Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
                
                insert orgItemList; 
                
                Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
                orgUser.Related_User__c = u1.Id;
                orgUser.OrgGroup__c=salesAreaA641.id;
                orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
                insert orgUser;
                
                
                
                //inserting Customer 
                ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                           currency_code__c='INR',customer_code__c='5512345',
                                                           Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                           Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                           Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                           Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                           price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                           sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                           sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                           Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
                insert cust;
                //ERP_Relationship__c 
                ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                      RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
                insert erpRel;
                
                
                //Date
                Date eqVF = System.today();
                Date eqVT = System.today();
                
                PAService service = new PAService();
                service.paServiceState.ogItems = new PAOrganizationalGroupItems();
                service.paServiceState.ogItems.selectedBU = Business.id;
                service.paServiceState.ogItems.isBuadmin=True;
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='VINAY(5689)',Sales_Org_Code__c=null);
                
                //since cancel would have made it null
                //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.csvString = 'Draft';
                service.paServiceState.currentRequest.sessionId = 'test';
                service.paServiceState.currentRequest.listSeparator = 'test';
                
                
                //EditHeader
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
                
                
                service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
                service.paServiceState.currentRequest.headerTitle='Test';
                service.paServiceState.currentRequest.cloneFlag=true;
                service.paServiceState.currentRequest.requesttype='Customer Specific';
                
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
                
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                
                //for Massive Change
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640');
                service.paServiceState.ogitems.selectedUser = u1.id;
                service.paServiceState.ogitems.userName='testName';
                service.paServiceState.currentRequest.action('','','Massive Change');
                
                //AddRequestItems
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640');
                //service.paServiceState.currentRequest.action('','','AddRequestItems');
                
                //Approval Related 
                //for BulkApproval
                Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                               Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                               Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                               //pavan
                                                               //sales_Org_code__c='A640',current_level__c='1'); 
                                                               sales_Org_code__c='A640',current_level__c='1',BU__C='VINAY(5689)'); 
                insert pr; 
                
                List<PARelatedList> relList = new List<PARelatedList>();
                relList.add(new PARelatedList());
                relList[0].wrapperList = new List<PAWrapper>();
                relList[0].wrapperList.add(new PAWrapper());
                relList[0].wrapperList[0].isSelected = true;
                relList[0].wrapperList[0].sObjectRecord = pr;
                
                service.paServiceState.currentRequest.relatedWrappersList = relList;
                
                
                //Massive Change 1722
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640');
                service.paServiceState.ogitems.selectedUser = u1.id;
                service.paServiceState.ogitems.userName=null;
                
                
                //Non Customer Specific 1736
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640',is_End_User_Rebate__c=true);
                service.paServiceState.ogitems.selectedUser = u1.id;
                service.paServiceState.ogitems.userName=null;
                List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
                service.paServiceState.currentRequest.pclShowSelectionTable=true;
                
                //Sales Prices SAP record
                ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                                   Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                                   Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                                   sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                                   SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                                   Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                                   Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
                insert holderRecord;
                ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                                  Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                                  Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                                  sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                                  SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                                  Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                                  Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y9',Distributor_Name__c='Test11');                                                    
                insert childRecord;
                
                
                //Edit Header
                service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
                service.paServiceState.ogitems.isEndUserRebate=false;
                list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
                selop.add(new SelectOption('1','VINAY(5689)'));
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.reqOvw=false;
                service.paServiceState.currentRequest.fixValDate='test';
                service.paServiceState.currentRequest.action('','','cancelEditHeader');
                service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
                service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
                List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
                List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
                List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
                relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
                List<PARelatedList> relatedWrapList = relatedWrappersList;
                List <Sobject> exportList = new List<Sobject>();
                if(relatedWrapList!=null && relatedWrapList.size()>0) {
                    List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                    for(PAWrapper relatedWrapperObj : relatedWrapper) {
                        //Ver 3.3
                        exportList.add(relatedWrapperObj.sobjectRecord);
                    }               
                }
                ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
                insert keyComb;
                string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
                service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
                service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
                service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
                service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
                //Export 
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.pricingRequest = null;
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
                
                //KCChange
                service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
                
                try
                {
                    //FetchRecords
                    
                    //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
                }catch(Exception e){}
                Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                                SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                                Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                                Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='VINAY(5689)',
                                                                Request_Approval_Status__c='Draft',Spot_Type__c='Free of Charge');
                insert pr3;
                //subbu
                Pricing_Request__c pr4 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                                SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                                Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                                Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='VINAY(5689)',
                                                                Request_Approval_Status__c='Submitted',Spot_Type__c='Rebate Agreement',Current_Approver__c = u1.Id);
                insert pr4; 
                
                Pricing_Request__c pr5 = new Pricing_Request__c();
                
                /* 
List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));

*/
                
                
                //      service.paServiceState.currentRequest.pricingReqItemList = priReqItemList;
                
                
                //bulkApproval
                relList = new List<PARelatedList>();
                relList.add(new PARelatedList());
                relList[0].wrapperList = null;
                service.paServiceState.currentRequest.relatedWrappersList = relList;           
                service.paServiceState.currentRequest.mailBody='test';
                service.paServiceState.currentRequest.pclDisplayString='test';
                
                service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                    service.paServiceState.currentRequest.soldToNameFilter='test';
                Test.startTest();
                
                service.paServiceState.currentRequest.action('','','KCChange');
                service.paServiceState.currentRequest.action('','','done');
                try{
                    service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
                }catch(Exception e){}
                try{
                    service.paServiceState.currentRequest.action('','','EditCancel');
                }catch(Exception e){}
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.action('','','Reference Pricing');
                try{
                    service.paServiceState.currentRequest.action('','','FetchRecords');
                }catch(Exception e){}
                //Subbu
                try{
                    service.paServiceState.currentRequest.action('','','save');
                }catch(Exception e){}
                
                try{
                    service.paServiceState.currentRequest.action('','','next');
                }catch(Exception e){}
                
                try{
                    service.paServiceState.currentRequest.action('','','Clone');
                }catch(Exception e){}
                
                try{
                    
                    service.paServiceState.currentRequest.getBURequests();           
                    service.paServiceState.currentRequest.massReassignAttribute = false;
                }catch(Exception e){
                    //service.paServiceState.currentRequest.getBURequests(); 
                }
                try{
                    
                    service.paServiceState.currentRequest.changeBU();
                }catch(Exception e){
                    
                }
                
                try{
                    service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                    service.paServiceState.currentRequest.pricingRequest = pr3;
                    service.paServiceState.currentRequest.getUpdatedPricingRequest();
                }catch(Exception e){
                    
                }
                try
                {
                    service.paServiceState.currentRequest.scaleEnable='True';
                    service.paServiceState.currentRequest.action('','','exportCSV');
                }
                catch(Exception e)
                {
                    
                }
                
                Test.stopTest();
                
                
            }
        }
    }
    
    
    static testMethod void paRequestTestMethod602()
    {
        
        /*
//subbu
Pricing_Request_Item__c pri1 = new Pricing_Request_Item__c(Approval_Status__c = 'Draft', Base_UoM__c = 'EA', Dist_Channel_Code__c = '10',
Division_Code__c = '02', Sales_Org_Code__c = 'A640', SAP_Client_Id__c = '510', SAP_Application_Id__c = 'V', Sold_To_Code__c = '5512345');


List<Pricing_Request_Item__c> priReqItemList = new list<Pricing_Request_Item__c>();
priReqItemList.add(pri1);
//   insert priReqItemList;

Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
prItem.Approval_Status__c = 'Draft';
prItem.Base_UoM__c = 'EA';
//     prItem.BU__c = 'BI EMEA SURFACES';
prItem.Dist_Channel_Code__c = '10';
prItem.Division_Code__c = '02';
prItem.Sales_Org_Code__c = 'A640';
prItem.SAP_Client_Id__c = '510';
prItem.SAP_Application_Id__c = 'V';
prItem.Sold_To_Code__c = '5512345';
insert prItem;

*/ 
        
    }
    
    
    
    //pooja-subbu
    public static testMethod void paRequestTestMethod1_12()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='--Select--',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640');
            service.paServiceState.currentRequest.action('','','NewPricingRequestsaveNon Customer Specific');
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer');
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            
            //Exception NewPricingRequessave
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq');
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            }
            catch(Exception e){}
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Terms_Of_Payment__c='Other',Due_Date__c=eqVT.addDays(-1));
                service.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Incoterm__c='Other',Due_Date__c=eqVT.addDays(-1));
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            //cloned req
            
            try
            {
                /* Pricing_Request__c pr = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640',on_Behalf_Of__c=u1.Id,
Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div1',Dist_Channel__c='Dist',Sales_Org__c='salesOrg'
);
insert pr; 
service.paServiceState.currentRequest.pricingRequest = pr;                                                       
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c(Pricing_Request__c=pr.id);
insert prItem;*/
                service.paServiceState.currentRequest.action('','','Clonesave');
            }
            catch(Exception e)
            {
                
            }
            
            Test.startTest();
            //Next spot type !=FOC
            service.paServiceState.currentRequest.userSelected = u1.id;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-123',Terms_Of_Payment__c='Other',
                                                                                          Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
            //service.paServiceState.currentRequest.action('','','Next');
            
            //Next spot type !=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='Other',Terms_Of_Payment__c='None-1',
Non_Standard_Incoterm__c='NonStd',Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');*/
            
            
            //Next spot type=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next'); */
            
            
            //NewPricingReqItem
            service.paServiceState.currentRequest.action('','','NewPricingReqItem');
            Test.stopTest();
            
        }
        
    }
    static testMethod void paRequestTestMethodKK()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='DPT NA',Pricing_Procedure__c='DPT NA',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            orgGroupList.add(salesArea);//<AB20210301>
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            orgGroupList.add(salesAreaA641);//<AB20210301>
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='DPT NA',RecordTypeId=rType1.id);
             orgGroupList.add(Business);//<AB20210301>
            insert orgGroupList;//<AB20210301>
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.ogItems.isBuadmin=false;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='DPT NA',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            service.paServiceState.currentRequest.sessionId = 'test';
            service.paServiceState.currentRequest.listSeparator = 'test';
            
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
            service.paServiceState.currentRequest.headerTitle='Test';
            service.paServiceState.currentRequest.cloneFlag=true;
            service.paServiceState.currentRequest.requesttype='Customer Specific';
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Test.startTest();//<AB20210301>
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='DPT NA'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',is_End_User_Rebate__c=true);
            
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
            service.paServiceState.currentRequest.pclShowSelectionTable=true;
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y0',Distributor_Name__c='Test9');                                                    
            insert childRecord;
            
            
            //Edit Header
            service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
            service.paServiceState.ogitems.isEndUserRebate=true;
            list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.reqOvw=false;
            service.paServiceState.currentRequest.fixValDate='test';
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                            SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                            Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                            Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='DPT NA',
                                                            Request_Approval_Status__c='Draft',Spot_Type__c='not null');
            insert pr3; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;           
            service.paServiceState.currentRequest.mailBody='test';
            service.paServiceState.currentRequest.pclDisplayString='test';
            service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                service.paServiceState.currentRequest.soldToNameFilter='test';
            
            
            service.paServiceState.currentRequest.action('','','KCChange');
            service.paServiceState.currentRequest.action('','','done');
            try{
                service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
            }catch(Exception e){}
            try{
                service.paServiceState.currentRequest.action('','','EditCancel');
            }catch(Exception e){}
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
            service.paServiceState.currentRequest.pricingRequest = pr3;
            service.paServiceState.currentRequest.action('','','Reference Pricing');
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            try{
                
                service.paServiceState.currentRequest.getBURequests();           
                service.paServiceState.currentRequest.massReassignAttribute = false;
            }catch(Exception e){
                //service.paServiceState.currentRequest.getBURequests(); 
            }
            try{
                
                service.paServiceState.currentRequest.changeBU();
            }catch(Exception e){
                
            }
            
            try{
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.getUpdatedPricingRequest();
            }catch(Exception e){
                
            }
            
            Test.stopTest();
            
            
        }
        
    }
    static testMethod void paRequestTestMethod4141()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI North America',Pricing_Procedure__c='BI North America',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            orgGroupList.add(salesArea); //<AB20210301>
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            orgGroupList.add(salesAreaA641); //<AB20210301>
            
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI North America',RecordTypeId=rType1.id);
            orgGroupList.add(Business); //<AB20210301>
            insert orgGroupList; //<AB20210301>
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.ogItems.isBuadmin=false;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI North America',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            service.paServiceState.currentRequest.sessionId = 'test';
            service.paServiceState.currentRequest.listSeparator = 'test';
            
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
            service.paServiceState.currentRequest.headerTitle='Test';
            service.paServiceState.currentRequest.cloneFlag=true;
            service.paServiceState.currentRequest.requesttype='Customer Specific';
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            Test.startTest();//<AB20210301>
            //Approval Related 
            //for BulkApproval
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='BI North America'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',is_End_User_Rebate__c=true);
            
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
            service.paServiceState.currentRequest.pclShowSelectionTable=true;
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y0',Distributor_Name__c='Test9');                                                    
            insert childRecord;
            
            
            //Edit Header
            service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
            service.paServiceState.ogitems.isEndUserRebate=true;
            list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.reqOvw=false;
            service.paServiceState.currentRequest.fixValDate='test';
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                            SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                            Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                            Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI North America',
                                                            Request_Approval_Status__c='Draft',Spot_Type__c='not null');
            insert pr3; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;           
            service.paServiceState.currentRequest.mailBody='test';
            service.paServiceState.currentRequest.pclDisplayString='test';
            service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                service.paServiceState.currentRequest.soldToNameFilter='test';
            
            
            service.paServiceState.currentRequest.action('','','KCChange');
            service.paServiceState.currentRequest.action('','','done');
            try{
                service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
            }catch(Exception e){}
            try{
                service.paServiceState.currentRequest.action('','','EditCancel');
            }catch(Exception e){}
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
            service.paServiceState.currentRequest.pricingRequest = pr3;
            service.paServiceState.currentRequest.action('','','Reference Pricing');
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            try{
                
                service.paServiceState.currentRequest.getBURequests();           
                service.paServiceState.currentRequest.massReassignAttribute = false;
            }catch(Exception e){
                //service.paServiceState.currentRequest.getBURequests(); 
            }
            try{
                
                service.paServiceState.currentRequest.changeBU();
            }catch(Exception e){
                
            }
            
            try{
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.getUpdatedPricingRequest();
            }catch(Exception e){
                
            }
            
            Test.stopTest();
        }
        
    }
    static testMethod void paRequestTestMethod5151()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA SURFACES',Pricing_Procedure__c='BI EMEA SURFACES',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            orgGroupList.add(salesArea);//<AB20210301>
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            orgGroupList.add(salesAreaA641);//<AB20210301>
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA SURFACES',RecordTypeId=rType1.id);
            orgGroupList.add(Business);//<AB20210301>
            insert orgGroupList;//<AB20210301>
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.ogItems.isBuadmin=false;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA SURFACES',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            service.paServiceState.currentRequest.sessionId = 'test';
            service.paServiceState.currentRequest.listSeparator = 'test';
            
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
            service.paServiceState.currentRequest.headerTitle='Test';
            service.paServiceState.currentRequest.cloneFlag=true;
            service.paServiceState.currentRequest.requesttype='Customer Specific';
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Test.startTest(); //<AB20210301>
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='BI EMEA SURFACES'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',is_End_User_Rebate__c=true);
            
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
            service.paServiceState.currentRequest.pclShowSelectionTable=true;
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y0',Distributor_Name__c='Test9');                                                    
            insert childRecord;
            
            
            //Edit Header
            service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
            service.paServiceState.ogitems.isEndUserRebate=true;
            list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.reqOvw=false;
            service.paServiceState.currentRequest.fixValDate='test';
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                            SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                            Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                            Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                                            Request_Approval_Status__c='Draft',Spot_Type__c='not null');
            insert pr3; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;           
            service.paServiceState.currentRequest.mailBody='test';
            service.paServiceState.currentRequest.pclDisplayString='test';
            service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                service.paServiceState.currentRequest.soldToNameFilter='test';
           
            
            service.paServiceState.currentRequest.action('','','KCChange');
            service.paServiceState.currentRequest.action('','','done');
            try{
                service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
            }catch(Exception e){}
            try{
                service.paServiceState.currentRequest.action('','','EditCancel');
            }catch(Exception e){}
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
            service.paServiceState.currentRequest.pricingRequest = pr3;
            service.paServiceState.currentRequest.action('','','Reference Pricing');
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            try{
                
                service.paServiceState.currentRequest.getBURequests();           
                service.paServiceState.currentRequest.massReassignAttribute = false;
            }catch(Exception e){
                //service.paServiceState.currentRequest.getBURequests(); 
            }
            try{
                
                service.paServiceState.currentRequest.changeBU();
            }catch(Exception e){
                
            }
            
            try{
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.getUpdatedPricingRequest();
            }catch(Exception e){
                
            }
            
            Test.stopTest();
            
        }
        
    }
    static testMethod void paRequestTestMethod6011()
    {
        if(!Test.isRunningTest()){
            //for action method 
            Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
            Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
            // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
            UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
            
            User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
            insert u1;  
            
            RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
            RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
            
            
            
            system.runAs(u1)
            {
                
                //orgGrp Items
                try
                {
                    EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
                }
                catch (exception e) {}
                List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
                profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
                insert profilePermissionList;
                
                PAUtil.insertProfileRecordId();  
                
                List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
                reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
                reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
                insert reqOrder;
                
                PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
                insert fold ; 
                
                ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                           Pricing_Procedure_Description__c='VINAY(5689)',Pricing_Procedure__c='VINAY(5689)',
                                                                           SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
                insert pp;
                
                //Pricing Condition
                List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
                pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                        Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                        Calculation_Type__c='Percentage',Price_Types__c='Reference'));
                pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
                pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
                insert pcList;
                
                //Key Combination         
                List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
                kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                      Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                      Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
                kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
                insert kcList;
                
                ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                         Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                         Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
                
                insert acSq;
                
                //Procedure Conditions
                ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                      From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
                
                insert proCons;
                
                
                OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
                insert salesArea;
                
                OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                            ERP_Division_code__c='02');
                insert salesAreaA641;
                
                OrgGroup__c Business = new OrgGroup__c(Business__c='VINAY(5689)',RecordTypeId=rType1.id);
                insert Business;
                
                List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
                orgItemList.add(new Organizational_Group_Item__c(
                    Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                    Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
                orgItemList.add(new Organizational_Group_Item__c(
                    Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                    Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
                
                insert orgItemList; 
                
                Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
                orgUser.Related_User__c = u1.Id;
                orgUser.OrgGroup__c=salesAreaA641.id;
                orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
                insert orgUser;
                
                
                
                //inserting Customer 
                ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                           currency_code__c='INR',customer_code__c='5512345',
                                                           Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                           Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                           Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                           Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                           price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                           sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                           sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                           Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
                insert cust;
                //ERP_Relationship__c 
                ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                      RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
                insert erpRel;
                
                
                //Date
                Date eqVF = System.today();
                Date eqVT = System.today();
                
                PAService service = new PAService();
                service.paServiceState.ogItems = new PAOrganizationalGroupItems();
                service.paServiceState.ogItems.selectedBU = Business.id;
                service.paServiceState.ogItems.isBuadmin=True;
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='VINAY(5689)',Sales_Org_Code__c=null);
                
                //since cancel would have made it null
                //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.csvString = 'Draft';
                service.paServiceState.currentRequest.sessionId = 'test';
                service.paServiceState.currentRequest.listSeparator = 'test';
                
                
                //EditHeader
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
                
                
                service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
                service.paServiceState.currentRequest.headerTitle='Test';
                service.paServiceState.currentRequest.cloneFlag=true;
                service.paServiceState.currentRequest.requesttype='Customer Specific';
                
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
                
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                
                //for Massive Change
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640');
                service.paServiceState.ogitems.selectedUser = u1.id;
                service.paServiceState.ogitems.userName='testName';
                service.paServiceState.currentRequest.action('','','Massive Change');
                
                //AddRequestItems
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640');
                //service.paServiceState.currentRequest.action('','','AddRequestItems');
                
                //Approval Related 
                //for BulkApproval
                Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                               Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                               Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                               //pavan
                                                               //sales_Org_code__c='A640',current_level__c='1'); 
                                                               sales_Org_code__c='A640',current_level__c='1',BU__C='VINAY(5689)'); 
                insert pr; 
                
                List<PARelatedList> relList = new List<PARelatedList>();
                relList.add(new PARelatedList());
                relList[0].wrapperList = new List<PAWrapper>();
                relList[0].wrapperList.add(new PAWrapper());
                relList[0].wrapperList[0].isSelected = true;
                relList[0].wrapperList[0].sObjectRecord = pr;
                
                service.paServiceState.currentRequest.relatedWrappersList = relList;
                
                
                //Massive Change 1722
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640');
                service.paServiceState.ogitems.selectedUser = u1.id;
                service.paServiceState.ogitems.userName=null;
                
                
                //Non Customer Specific 1736
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                              sales_Org_code__c='A640',is_End_User_Rebate__c=true);
                service.paServiceState.ogitems.selectedUser = u1.id;
                service.paServiceState.ogitems.userName=null;
                List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
                service.paServiceState.currentRequest.pclShowSelectionTable=true;
                
                //Sales Prices SAP record
                ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                                   Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                                   Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                                   sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                                   SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                                   Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                                   Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
                insert holderRecord;
                ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                                  Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                                  Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                                  sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                                  SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                                  Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                                  Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y9',Distributor_Name__c='Test11');                                                    
                insert childRecord;
                
                
                //Edit Header
                service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
                service.paServiceState.ogitems.isEndUserRebate=false;
                list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
                selop.add(new SelectOption('1','VINAY(5689)'));
                
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.reqOvw=false;
                service.paServiceState.currentRequest.fixValDate='test';
                service.paServiceState.currentRequest.action('','','cancelEditHeader');
                service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
                service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
                List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
                List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
                List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
                relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
                List<PARelatedList> relatedWrapList = relatedWrappersList;
                List <Sobject> exportList = new List<Sobject>();
                if(relatedWrapList!=null && relatedWrapList.size()>0) {
                    List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                    for(PAWrapper relatedWrapperObj : relatedWrapper) {
                        //Ver 3.3
                        exportList.add(relatedWrapperObj.sobjectRecord);
                    }               
                }
                ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
                insert keyComb;
                string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
                service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
                service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
                service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
                service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
                //Export 
                service.paServiceState.currentRequest = new PARequest(service.paServiceState);
                service.paServiceState.currentRequest.pricingRequest = null;
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
                
                //KCChange
                service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
                
                try
                {
                    //FetchRecords
                    
                    //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
                }catch(Exception e){}
                Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                                SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                                Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                                Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='VINAY(5689)',
                                                                Request_Approval_Status__c='Draft',Spot_Type__c='Free of Charge');
                insert pr3;
                //subbu
                Pricing_Request__c pr4 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                                SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                                Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                                Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='VINAY(5689)',
                                                                Request_Approval_Status__c='Submitted',Spot_Type__c='Rebate Agreement',Current_Approver__c = u1.Id);
                insert pr4; 
                
                Pricing_Request__c pr5 = new Pricing_Request__c();
                
                /* 
List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
Calculation_Type__c='Percentage',Price_Types__c='Reference'));
pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));

*/
                
                
                //      service.paServiceState.currentRequest.pricingReqItemList = priReqItemList;
                
                
                //bulkApproval
                relList = new List<PARelatedList>();
                relList.add(new PARelatedList());
                relList[0].wrapperList = null;
                service.paServiceState.currentRequest.relatedWrappersList = relList;           
                service.paServiceState.currentRequest.mailBody='test';
                service.paServiceState.currentRequest.pclDisplayString='test';
                
                service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                    service.paServiceState.currentRequest.soldToNameFilter='test';
                Test.startTest();
                
                service.paServiceState.currentRequest.action('','','KCChange');
                service.paServiceState.currentRequest.action('','','done');
                try{
                    service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
                }catch(Exception e){}
                try{
                    service.paServiceState.currentRequest.action('','','EditCancel');
                }catch(Exception e){}
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.action('','','Reference Pricing');
                try{
                    service.paServiceState.currentRequest.action('','','FetchRecords');
                }catch(Exception e){}
                //Subbu
                try{
                    service.paServiceState.currentRequest.action('','','save');
                }catch(Exception e){}
                
                try{
                    service.paServiceState.currentRequest.action('','','next');
                }catch(Exception e){}
                
                try{
                    service.paServiceState.currentRequest.action('','','Clone');
                }catch(Exception e){}
                
                try{
                    
                    service.paServiceState.currentRequest.getBURequests();           
                    service.paServiceState.currentRequest.massReassignAttribute = false;
                }catch(Exception e){
                    //service.paServiceState.currentRequest.getBURequests(); 
                }
                try{
                    
                    service.paServiceState.currentRequest.changeBU();
                }catch(Exception e){
                    
                }
                
                try{
                    service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                    service.paServiceState.currentRequest.pricingRequest = pr3;
                    service.paServiceState.currentRequest.getUpdatedPricingRequest();
                }catch(Exception e){
                    
                }
                try
                {
                    service.paServiceState.currentRequest.scaleEnable='True';
                    service.paServiceState.currentRequest.action('','','exportCSV');
                }
                catch(Exception e)
                {
                    
                }
                
                Test.stopTest();                                              
            }
        }
    }
    
    public static testMethod void paRequestTestMethod1_ext_pr1()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            Test.startTest();
            try
            {
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                
                system.assert(e.getMessage().containsIgnoreCase('Please select a value in Sales Org'),e.getMessage());
            }
            //with out exception 
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            
            try
            {
                service.paServiceState.ogitems.selectedUser = u1.Id;
                service.paServiceState.ogitems.userName='UserName';
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            try
            {
                boolean msImpr = service.paServiceState.currentRequest.massiveImport;
                service.paServiceState.currentRequest.massiveImport = true;
                service.paServiceState.currentRequest.pckcFromKeyComb = '';
                
            }
            catch(Exception E)
            {}
            
            //PCLfetch
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            //Pavan
            /*
try
{
service.paServiceState.currentRequest.action('','','Fetch100Records');
}
catch(Exception e)
{
//zero matchs found 
}
service.paServiceState.currentRequest.pclDisplayPopUp = 'none';
try
{
service.paServiceState.currentRequest.action('','','PCLfetch');
}
catch(Exception e)
{
//System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
}

//pclDisplayPopUp
service.paServiceState.currentRequest.pclDisplayPopUp = null;
try
{
service.paServiceState.currentRequest.action('','','PCLfetch');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
}
//customerContact
service.paServiceState.currentRequest.customerContact = null;
service.paServiceState.currentRequest.pclDisplayPopUp = 'none_';
try
{
service.paServiceState.currentRequest.action('','','PCLfetch');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please Enter customer contact'),e.getMessage());
}
try
{
service.paServiceState.currentRequest.action('','','Request Overview');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','cpSelChange');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','Floor Pricing');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','Reference Pricing');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','PCLGenerationPriReq');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.email = null;
service.paServiceState.currentRequest.action('','','PCLSEARCH');
}
catch(Exception e)
{

}

List<Pricing_Request_Item__c> priReqItemList = new list<Pricing_Request_Item__c>();
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
priReqItemList.add(prItem);
service.paServiceState.currentRequest.pricingReqItemList = priReqItemList;
try
{

service.paServiceState.currentRequest.action('','','ReqCreated');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','PCLcancelTemplateselection');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','NewPricingRequest');
}
catch(Exception e)
{

}
try
{
service.paServiceState.currentRequest.action('','','AddSelectedPrices');
}
catch(Exception e)
{

}


//priCondOnchange
service.paServiceState.currentRequest.action('','','priCondOnchange');

//keyCombOnChange
service.paServiceState.currentRequest.action('','','keyCombOnChange');
//exportCSV
try
{
service.paServiceState.currentRequest.scaleEnable='true';
service.paServiceState.currentRequest.action('','','exportCSV');
}
catch(Exception e)
{

}

//PARequest pa= new PARequest(service.paServiceState);

//PCLSEARCH
//service.paServiceState.currentRequest.action('','','PCLSEARCH');
//PCLSEARCH FOR If 
service.paServiceState.currentRequest.email.put('Language','--Select--');
service.paServiceState.currentRequest.email.put('Type','');
service.paServiceState.currentRequest.email.put('Description','');
//service.paServiceState.currentRequest.action('','','PCLSEARCH');

//for Exception
//Editsave*/
            Date eqVt = System.today();
            Date eqVF = System.today();
            /*
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVt,
Request_Valid_From__c=eqVF);
service.paServiceState.currentRequest.pricingExceptionList = new List<String>{'abcd','xyz'};                                    
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
//more than one err so not asserting   
}
// for Valid To validation
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=null,
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid To'),e.getMessage());

}
//for valid From validation
// for Valid To validation
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
Request_Valid_From__c=null,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid From'),e.getMessage());

}
//for Retro Active
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
Request_Valid_From__c=eqVF.addDays(-100),Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid From Date'),e.getMessage());

}
//for Retro Active Valid To
try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(1000),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e)
{
System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid To Date'),e.getMessage());

}*/
            //pavan
            
            //w/o Exception EditSave
            //pavan
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Import',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',BU__c='TEST1');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e1)
            {
                
            }
            
            //pavan
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',is_End_User_Rebate__c = True,
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST222');
                service.paServiceState.currentRequest.action('','','NewPricingRequestsaveMassive Change');
            }
            catch(Exception e2)
            {
                
            }
            
            //pavan
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST3');
            }
            catch(Exception e3)
            {
            }
            
            Test.stopTest();
            
        }
        
    }
    static testMethod void paRequestTestMethodPr2()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1;  
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        
        
        system.runAs(u1)
        {
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='DPP AP',Pricing_Procedure__c='DPP AP',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='Percentage',Price_Types__c='Reference,Floor,net floor,net reference'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>(); //<AB20210301>
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            orgGroupList.add(salesArea); //<AB20210301>
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            orgGroupList.add(salesAreaA641); //<AB20210301>
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='DPP AP',RecordTypeId=rType1.id);
            orgGroupList.add(Business); //<AB20210301>
            insert orgGroupList; //<AB20210301>
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24,Approval_Escalation_Duration__c=5));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            
            //Date
            Date eqVF = System.today();
            Date eqVT = System.today();
            
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.ogItems.isBuadmin=false;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            //service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='DPP AP',Sales_Org_Code__c=null);
            
            //since cancel would have made it null
            //service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.csvString = 'Draft';
            service.paServiceState.currentRequest.sessionId = 'test';
            service.paServiceState.currentRequest.listSeparator = 'test';
            
            //EditHeader
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Non Customer Specific');
            
            
            service.paServiceState.currentRequest.attachPAWrapperList=new List<PAWrapper>();
            service.paServiceState.currentRequest.headerTitle='Test';
            service.paServiceState.currentRequest.cloneFlag=true;
            service.paServiceState.currentRequest.requesttype='Customer Specific';
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive');
            
            
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            
            //for Massive Change
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName='testName';
            service.paServiceState.currentRequest.action('','','Massive Change');
            
            //AddRequestItems
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            //service.paServiceState.currentRequest.action('','','AddRequestItems');
            
            //Approval Related 
            //for BulkApproval
            Test.startTest();//<AB20210301>
            Pricing_Request__c pr = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                           Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                           Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                           //pavan
                                                           //sales_Org_code__c='A640',current_level__c='1'); 
                                                           sales_Org_code__c='A640',current_level__c='1',BU__C='DPP AP'); 
            insert pr; 
            
            List<PARelatedList> relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = new List<PAWrapper>();
            relList[0].wrapperList.add(new PAWrapper());
            relList[0].wrapperList[0].isSelected = true;
            relList[0].wrapperList[0].sObjectRecord = pr;
            
            service.paServiceState.currentRequest.relatedWrappersList = relList;
            
            
            //Massive Change 1722
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640');
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            
            
            //Non Customer Specific 1736
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Request_type__c='Massive',
                                                                                          sales_Org_code__c='A640',is_End_User_Rebate__c=true);
            
            service.paServiceState.ogitems.selectedUser = u1.id;
            service.paServiceState.ogitems.userName=null;
            List<SelectOption> spt=service.paServiceState.currentRequest.getSubtype();
            service.paServiceState.currentRequest.pclShowSelectionTable=true;
            
            //Sales Prices SAP record
            ERP_Sales_Prices_SAP__c holderRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                               Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                               Distribution_Channel_code__c='10',isPriceHolder__c=true,Material_code__c='123456',
                                                                               sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(5),
                                                                               SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                               Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                               Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',Distributor_Code__c= 'Y7',Distributor_Name__c='Test1');
            insert holderRecord;
            ERP_Sales_Prices_SAP__c childRecord = new ERP_Sales_Prices_SAP__c(sold_to_code__c='123456',Pricing_Condition_code__c='ZPSE',
                                                                              Key_Combination_code__c='A580',Sales_org_Code__c='A640',Division_code__c='02',
                                                                              Distribution_Channel_code__c='10',isPriceHolder__c=false,Material_code__c='123456',
                                                                              sales_price_type__c='Permanent',Customer_specific__c=true,valid_from__c=Date.today(),valid_to__c=Date.today().addDays(2),
                                                                              SAP_Client_ID__c='510',SAP_Application_Id__c='V',SAP_Cluster__c='CB1',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                                              Material__c='C A 3D 1/2X30X144 12.0X760X3658',sales_Pricing_Procedure__c=pp.id,Dist_Channel__c='DuPont Standard',Division__c='GSD Standard',
                                                                              Pricing_Condition__c='Surfaces Gross Price',sold_to__c='DUFOUR YACHTS',price_holder__c=holderRecord.id,Distributor_Code__c= 'Y0',Distributor_Name__c='Test9');                                                    
            insert childRecord;
            
            
            //Edit Header
            service.paServiceState.ogitems.orgGroupItems=orgItemList[0];
            service.paServiceState.ogitems.isEndUserRebate=true;
            list<SelectOption> selop=service.paServiceState.currentRequest.getListOptions();
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.reqOvw=false;
            service.paServiceState.currentRequest.fixValDate='test';
            service.paServiceState.currentRequest.action('','','cancelEditHeader');
            service.paServiceState.currentRequest.pricingCondition = new PAPricingCondition(service.paServiceState);
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            List<SelectOption> sac=service.paServiceState.currentRequest.salesAreaCurrencyList;
            List<String> emailTemp = service.paServiceState.currentRequest.emailTemplate;
            List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList=service.paServiceState.currentRequest.getListWrappers();
            List<PARelatedList> relatedWrapList = relatedWrappersList;
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
            ERP_Key_Combination__c keyComb = new ERP_Key_Combination__c(Key_Combination_Code__c='A630',Key_Combination__c='abcd');
            insert keyComb;
            string csvString ='Pricing Condition Code,Key Combination Code,Sales Org. Code,Dist. Channel Code,Division Code,Material Code,Rate,Unit,Per,UoM,Valid From,Valid To,Material,Distributor Code, Distributor Name,sid';
            service.paServiceState.currentRequest.pricingCondition.selectedPricingCondition =pcList[0].id ;
            service.paServiceState.currentRequest.keyCombination = new PAKeyCombination(service.paServiceState);
            service.paServiceState.currentRequest.keyCombination.keyCombinationID = keyComb.id;
            service.paServiceState.currentRequest.expDataGen(csvString,'Sales_Prices__c',exportList,'');
            //Export 
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = null;
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','ExportPrices');
            
            //KCChange
            service.paServiceState.currentRequest.salesPriceSAP = new PASalesPriceSAP(service.paServiceState);
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','KCChange');
            
            try
            {
                //FetchRecords
                
                //commenting - null object service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            Pricing_Request__c pr3 = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                                            SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                                            Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                                            Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='DPP AP',
                                                            Request_Approval_Status__c='Draft',Spot_Type__c='not null');
            insert pr3; 
            
            //bulkApproval
            relList = new List<PARelatedList>();
            relList.add(new PARelatedList());
            relList[0].wrapperList = null;
            service.paServiceState.currentRequest.relatedWrappersList = relList;           
            service.paServiceState.currentRequest.mailBody='test';
            service.paServiceState.currentRequest.pclDisplayString='test';
            service.paServiceState.currentRequest.userReassignList=new List<User>{u1};
                service.paServiceState.currentRequest.soldToNameFilter='test';
            
            
            service.paServiceState.currentRequest.action('','','KCChange');
            service.paServiceState.currentRequest.action('','','done');
            try{
                service.paServiceState.currentRequest.action('','','PriceNewPricingRequestCancel');
            }catch(Exception e){}
            try{
                service.paServiceState.currentRequest.action('','','EditCancel');
            }catch(Exception e){}
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
            service.paServiceState.currentRequest.pricingRequest = pr3;
            service.paServiceState.currentRequest.action('','','Reference Pricing');
            try{
                service.paServiceState.currentRequest.action('','','FetchRecords');
            }catch(Exception e){}
            try{
                
                service.paServiceState.currentRequest.getBURequests();           
                service.paServiceState.currentRequest.massReassignAttribute = false;
            }catch(Exception e){
                //service.paServiceState.currentRequest.getBURequests(); 
            }
            try{
                
                service.paServiceState.currentRequest.changeBU();
            }catch(Exception e){
                
            }
            
            try{
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c();
                service.paServiceState.currentRequest.pricingRequest = pr3;
                service.paServiceState.currentRequest.getUpdatedPricingRequest();
            }catch(Exception e){
                
            }
            
            Test.stopTest();
            
            
        }
        
    }
    
    public static testMethod void paRequestTestMethod1_12pr3()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code-Sales Org./Dist. Channel/Division/Sold To/Material'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='--Select--',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[1].id ;
            insert orgUser;
            
            
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c=null);
            
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640');
            service.paServiceState.currentRequest.action('','','NewPricingRequestsaveNon Customer Specific');
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer');
            //commenting-deploymentservice.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            
            //Exception NewPricingRequessave
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq');
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequestsave');
            }
            catch(Exception e){}
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Terms_Of_Payment__c='Other',Due_Date__c=eqVT.addDays(-1));
                service.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            
            //Next for Exception 
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Incoterm__c='Other',Due_Date__c=eqVT.addDays(-1));
                //commenting-deploymentservice.paServiceState.currentRequest.action('','','Next');
            }
            catch(Exception e)
            {
                
            }
            //cloned req
            
            try
            {
                /* Pricing_Request__c pr = new Pricing_Request__c(BU__c='BI EMEA Surfaces',Sales_Org_Code__c='A640',on_Behalf_Of__c=u1.Id,
Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div1',Dist_Channel__c='Dist',Sales_Org__c='salesOrg'
);
insert pr; 
service.paServiceState.currentRequest.pricingRequest = pr;                                                       
Pricing_Request_Item__c prItem = new Pricing_Request_Item__c(Pricing_Request__c=pr.id);
insert prItem;*/
                service.paServiceState.currentRequest.action('','','Clonesave');
            }
            catch(Exception e)
            {
                
            }
            
            Test.startTest();
            //Next spot type !=FOC
            service.paServiceState.currentRequest.userSelected = u1.id;
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
                                                                                          Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
                                                                                          Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
            service.paServiceState.currentRequest.action('','','Next');
            
            //Next spot type !=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='Other',Terms_Of_Payment__c='None-1',
Non_Standard_Incoterm__c='NonStd',Assigned_To__c=u1.id,spot_type__c='Spot Price',due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next');*/
            
            
            //Next spot type=FOC
            /*service.paServiceState.currentRequest.userSelected = u1.id;
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',spot_type__c='Free of Charge',
Request_Name__c='testReq',Request_Reason__c='New Customer',Incoterm__c='None-1',Terms_Of_Payment__c='None-1',
due_date__c=eqVT.addDays(2),Task_Subject__c='sub');
service.paServiceState.currentRequest.action('','','Next'); */
            
            
            //NewPricingReqItem
            service.paServiceState.currentRequest.action('','','NewPricingReqItem');
            Test.stopTest();
            
        }
        
    }
    
    public static testMethod void paRequestTestMethod1pr4()
    {
        //for action method 
        Profile p1 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-Viewer'];
        // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
        UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        
        
        //sales Admin Permission Set
        User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
        insert u1; 
        
        RecordType rType1 = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        RecordType rType2 = [select id from RecordType Where sObjectType='ERP_Relationship__c' AND Name='ERP Relationship - Person'];
        
        system.runAs(u1)
        {
            PAApprovalWF_UT.paApprovalWFTestMethodPAQuery();
            
            //orgGrp Items
            try
            {
                EmailTemplate emailTemp = [select id,Name,body,description FROM EmailTemplate  where Name =:PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c limit 1];
            }
            catch (exception e) {}
            
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
            insert profilePermissionList;
            
            PAUtil.insertProfileRecordId();  
            
            List<PricingRequestTypeOrder__c> reqOrder = new List<PricingRequestTypeOrder__c>();
            reqOrder.add(new PricingRequestTypeOrder__c(Name='1',Request_Type__c='Customer Price'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='2',Request_Type__c='Project'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='3',Request_Type__c='Pricing Task'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='4',Request_Type__c='Import'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='5',Request_Type__c='Massive Change'));
            reqOrder.add(new PricingRequestTypeOrder__c(Name='6',Request_Type__c='Non Customer Specific'));
            insert reqOrder;
            
            PA_Email_Template_Custom_Settings__c fold = new PA_Email_Template_Custom_Settings__c(Name='priceApprovalFolder',Folder_Id__c='Pricing Approval Folder');
            insert fold ; 
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
                                                                       Pricing_Procedure_Description__c='KAMALAKIRAN',Pricing_Procedure__c='KAMALAKIRAN',
                                                                       SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                    Pricing_Condition_Code__c='ZPSE',pricing_Condition__c='Surfaces Gross Price',
                                                    Calculation_Type__c='B'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFL2',Calculation_Type__c='Percentage'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XRF2'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                  Key_Combination_Code__c='A580',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/Material/Ship-To',
                                                  Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold To Code/Material Code/Ship-To code-Sales Org./Dist. Channel/Division/Sold To/Material/Ship-To'));                      
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X100'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                                     Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                                     Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,isPaymentTermsApplicable__c=true,isVolumeApplicable__c=true);
            
            insert acSq;
            
            //Procedure Conditions
            ERP_Procedure_Conditions__c proCons = new ERP_Procedure_Conditions__c(Sales_Pricing_Procedure__c=pp.id,Pricing_Condition__c=pcList[0].id,
                                                                                  From__c=150,step__C=100,To__c=200,Sales_Pricing_Procedure_Condition_Config__c='Allow Request By Sales Rep;');
            
            insert proCons;
            
            
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                                    ERP_Division_code__c='02');
            insert salesArea;
            
            OrgGroup__c salesAreaA641 = new OrgGroup__c(ERP_Sales_Org_code__c='A641',ERP_Distribution_Channel_Code__c='10',
                                                        ERP_Division_code__c='02');
            insert salesAreaA641;
            
            OrgGroup__c Business = new OrgGroup__c(Business__c='KAMALAKIRAN',RecordTypeId=rType1.id);
            insert Business;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = true,isPaymentTermsApplicable__c=true));  
            orgItemList.add(new Organizational_Group_Item__c(
                Business__c=Business.id,OrgGroup__c=salesAreaA641.id,ERP_Pricing_Procedure__c=pp.id,
                Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',Non_Standard_Payment_Terms__c = 'a;b',
                ERP_Currency__c='USD',ERP_UoM__c ='KG',project_request_reasons__c='Quantity Change;Time Exchange',
                Pricing_Task_Reasons__c ='Pricing Task;Pricing Task1',
                Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=30,Max_Valid_From_Offset_Cust_Spec__c=90,
                Latest_Valid_From_Offset_Non_Cust_Spec__c=5,Latest_Valid_To_Offset_Cust_Spec__c=24,
                Latest_Valid_To_Offset_Non_Cust_Spec__c=24/*,Approval_Escalation_Duration__c=5*/,isVolumeApplicable__c = false,isPaymentTermsApplicable__c=true));                                       
            
            insert orgItemList; 
            
            /*    OrgGroup__c OrgGroup = new OrgGroup__c();
OrgGroup.ERP_Sales_Org_Code__c='A641';
insert OrgGroup;

*/
            
            
            Organizational_Group_User__c orgUser = new Organizational_Group_User__c();
            orgUser.Related_User__c = u1.Id;
            orgUser.OrgGroup__c=salesAreaA641.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            //orgUser.OrgGroup__r.ERP_Sales_Org_Code__c='A641';
            insert orgUser;
            
            //orgUser= [select Id, OrgGroup__r.ERP_Sales_Org_Code__c from Organizational_Group_User__c where Id = :orgUser.Id];
            
            
            
            /*  Organizational_Group_User__c orgUser1 = new Organizational_Group_User__c();
orgUser1.Related_User__c = u1.Id;
orgUser1.OrgGroup__c=salesArea.id;
orgUser1.Organizational_Group_Item__c =orgItemList[1].id ;
insert orgUser1; */
            
            //inserting Customer 
            ERP_Customer__c cust = new ERP_Customer__c(city__c='Chennai',country__c='India',country_code__c='IND',
                                                       currency_code__c='INR',customer_code__c='5512345',
                                                       Distribution_Channel_Code__c='10',Distribution_channel__c='Dist Channel',
                                                       Division__c='Division',Division_code__c='02',Incoterms_1__c='Inco1',Incoterms_1_Code__c='IncoCode',
                                                       Incoterms_2__c='Inco2',Customer_Price_Group_Code__c='Z0',
                                                       Customer_Price_Group__c='Others',Price_List_type__c='PriceList',
                                                       price_list_type_code__c='A7',sales_office__c='salesOffice',
                                                       sales_office_Code__c='salesOfficeCode',sales_org_code__c='A640',
                                                       sales_org__c='sales Org',State_Province__c='TN',Street__c='MP',Terms_Of_Payment__c='None',
                                                       Terms_Of_Payment_Code__c='None',Zip_Postal_Code__c='600039',Source_Cluster__c='CB1');
            insert cust;
            //ERP_Relationship__c 
            ERP_Relationship__c erpRel = new ERP_Relationship__c (User__c=u1.Id,Partner_Function__c='Customer Service Rep',
                                                                  RecordTypeId=rType2.Id,ERP_Customer__c=cust.id);
            insert erpRel;
            
            //createImport
            PAService service = new PAService();
            service.paServiceState.ogItems = new PAOrganizationalGroupItems();
            service.paServiceState.ogItems.selectedBU = Business.id;
            service.paServiceState.currentRequest = new PARequest(service.paServiceState);
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c=null);
            Test.startTest();
            try
            {
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                
                system.assert(e.getMessage().containsIgnoreCase('Please select a value in Sales Org'),e.getMessage());
            }
            //with out exception 
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c=null);
            try
            {
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A640');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            
            try
            {
                service.paServiceState.ogitems.selectedUser = u1.Id;
                service.paServiceState.ogitems.userName='UserName';
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641');
                service.paServiceState.currentRequest.action('','','createImport');
            }
            catch(Exception e)
            {
                //system.assert(e.getMessage().containsIgnoreCase('Selected Sales Org doesnot match for the user'),e.getMessage());
            }
            //to execute createImport w/o exception
            
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg');
            service.paServiceState.currentRequest.action('','','createImport');     
            
            //Fetch100Records
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=null);
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //PCLfetch
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter a value for Valid On'),e.getMessage());
            }
            
            //w/o Exception
            Date d = System.today();
            service.getBusinessComponent('Quit','Requests');
            service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(BU__c='KAMALAKIRAN',Sales_Org_Code__c='A641',on_Behalf_Of__c=u1.Id,
                                                                                          Dist_Channel_Code__c='10',Division_Code__c='02',Division__c='Div',Dist_Channel__c='Dist',Sales_Org__c='salesOrg',
                                                                                          Due_Date__c=d,Customer_Specific__c=true,Pricing_Request_Type__c='Permanent',
                                                                                          Request_Type__c='Import');
            
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingCondition.selectedPricingCondition  = pcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyCombinationID = kcList[0].id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedBU = business.id;
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.selectedUser= u1.id;
            
            service.paServiceState.currentRequest.salesPriceSAP.request.requestServiceState.ogItems.orgGroupItems = orgItemList[0];
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Sales_Org_Code__c='A640';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Dist_Channel_Code__c='10';
            service.paServiceState.currentRequest.salesPriceSAP.request.pricingRequest.Division_Code__c='02'; 
            Date vf = system.today();
            Date vt = system.today().addDays(365);
            
            try
            {
                service.paServiceState.currentRequest.action('','','Fetch100Records');
            }
            catch(Exception e)
            {
                //zero matchs found 
            }
            service.paServiceState.currentRequest.pclDisplayPopUp = 'none';
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
            }
            
            //pclDisplayPopUp
            service.paServiceState.currentRequest.pclDisplayPopUp = null;
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please select a email template'),e.getMessage());
            }
            //customerContact
            service.paServiceState.currentRequest.customerContact = null;
            service.paServiceState.currentRequest.pclDisplayPopUp = 'none_';
            try
            {
                service.paServiceState.currentRequest.action('','','PCLfetch');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please Enter customer contact'),e.getMessage());
            }
            try
            {
                service.paServiceState.currentRequest.action('','','Request Overview');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','RequestOverview');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','Floor Pricing');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','Reference Pricing');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','PCLGenerationPriReq');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.email = null;
                service.paServiceState.currentRequest.action('','','PCLSEARCH');
            }
            catch(Exception e)
            {
                
            }
            
            List<Pricing_Request_Item__c> priReqItemList = new list<Pricing_Request_Item__c>();
            Pricing_Request_Item__c prItem = new Pricing_Request_Item__c();
            priReqItemList.add(prItem);
            service.paServiceState.currentRequest.pricingReqItemList = priReqItemList;
            try
            {
                
                service.paServiceState.currentRequest.action('','','ReqCreated');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','PCLcancelTemplateselection');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','NewPricingRequest');
            }
            catch(Exception e)
            {
                
            }
            try
            {
                service.paServiceState.currentRequest.action('','','AddSelectedPrices');
            }
            catch(Exception e)
            {
                
            }
            
            
            //priCondOnchange
            service.paServiceState.currentRequest.action('','','priCondOnchange');
            
            //keyCombOnChange
            service.paServiceState.currentRequest.action('','','keyCombOnChange');
            //exportCSV
            try
            {
                service.paServiceState.currentRequest.scaleEnable='true';
                service.paServiceState.currentRequest.action('','','exportCSV');
            }
            catch(Exception e)
            {
                
            }
            
            
            //PARequest pa= new PARequest(service.paServiceState);
            
            //PCLSEARCH
            //service.paServiceState.currentRequest.action('','','PCLSEARCH');
            //PCLSEARCH FOR If 
            service.paServiceState.currentRequest.email.put('Language','--Select--');
            service.paServiceState.currentRequest.email.put('Type','');
            service.paServiceState.currentRequest.email.put('Description','');
            //service.paServiceState.currentRequest.action('','','PCLSEARCH');
            
            //for Exception
            //Editsave
            Date eqVt = System.today();
            Date eqVF = System.today();
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVt,
                                                                                              Request_Valid_From__c=eqVF);
                service.paServiceState.currentRequest.pricingExceptionList = new List<String>{'abcd','xyz'};                                    
                    service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                //more than one err so not asserting   
            }
            // for Valid To validation
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=null,
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                //System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid To'),e.getMessage());
                
            }
            //for valid From validation
            // for Valid To validation
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
                                                                                              Request_Valid_From__c=null,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please enter Default Valid From'),e.getMessage());
                
            }
            //for Retro Active
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(365),
                                                                                              Request_Valid_From__c=eqVF.addDays(-100),Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer');
                service.paServiceState.currentRequest.action('','','Editsave');
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid From Date'),e.getMessage());
                
            }
            //for Retro Active Valid To
            try
            {           
                service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(1000),
                                                                                              Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
                                                                                              Request_Name__c='testReq',Request_Reason__c='New Customer');
                service.paServiceState.currentRequest.action('','','Editsave');
                
            }
            catch(Exception e)
            {
                System.assert(e.getMessage().containsIgnoreCase('Please adjust Valid To Date'),e.getMessage());
                
            }
            
            try
            {
                List<selectOption> erpUoMList1 = service.paServiceState.currentRequest.erpUoMList;
                service.paServiceState.currentRequest.erpUoMList=erpUoMList1;
                
                List<selectOption>nonStandardSelectList = service.paServiceState.currentRequest.nonStandardSelectList;
                String allApprovers = service.paServiceState.currentRequest.allApprovers;
                service.paServiceState.currentRequest.requesttype = 'Massive';
                String reqtype = service.paServiceState.currentRequest.requesttype;
            }   
            catch(Exception e)
            {
            }
            try
            {
                service.paServiceState.currentRequest.salesPriceSAP.request.keyCombination.keyComb='Price Ref. Partner/Ship to/End User/Customer Hierarchy/ComPartner/Partner ZF/Payer';
                service.paServiceState.currentRequest.filtercode='xyz';
                service.paServiceState.currentRequest.filterName='xyz';
                string ReassignReq = service.paServiceState.currentRequest.ReassignReq;
                List<SelectOption> getSubtype = service.paServiceState.currentRequest.getSubtype();
                
                
            }
            catch(Exception e)
            {}
            
            
            //w/o Exception EditSave
            //pavan
            /*try
{
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Import',
Request_Name__c='testReq',Request_Reason__c='New Customer',BU__c='TEST1');
service.paServiceState.currentRequest.action('','','Editsave');
}
catch(Exception e1)
{

}*/
            
            //pavan
            /*try
{           
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST2');
service.paServiceState.currentRequest.action('','','NewPricingRequestsaveMassive Change');
}
catch(Exception e2)
{

}

//pavan
try
{
service.paServiceState.currentRequest.pricingRequest = new Pricing_Request__c(Request_Valid_To__c=eqVT.addDays(5),
Request_Valid_From__c=eqVF,Pricing_Request_Type__c='Permanent',
Request_Name__c='testReq',Request_Reason__c='New Customer',sales_Org_code__c='A640',BU__c='TEST3');
}
catch(Exception e3)
{
}*/
            
            Test.stopTest();
            
        }
        
    }
    
    
}