/*
 * Name      :   PARequestItem_UT
 * Description  :   This is the test class for PARequestItem
 * Author      :   Infosys Limited
 * Created Date :   21-03-2013
 *
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 * 12/29/2016 - Merge&Spin - Updated the test  class to update the insert of UserRole and User 
 */
 
   
@isTest
private class PAProjectPrice_UT {
       
    static testMethod void paProjectPriceTestMethod1() 
    {
     
        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
        UserRole r=  TestUserUtil.createTestUserRole('BI-EMEA-Surfaces'); 
        
        system.debug('roleeeeeeeeee'+r);                   
      /*  User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
        
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname');
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
                  List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
                  profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
                  insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.Approval_Escalation_Price_Requests = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
        
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            
            
            
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
            try{
                paProjectPrice.action('','','FetchMaterialRecords');
            }
            catch(Exception e){}
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
            paProjectPrice.currentRequest.incotermsFilter='IN-02-03';
            paProjectPrice.currentRequest.salesDistrictFilter='IN-02-03';
            paProjectPrice.currentRequest.endUserFilter='EU-02';
            paProjectPrice.currentRequest.shipToFilter='SH-02';
            paProjectPrice.currentRequest.countryFilter='IND-02-333';
            paProjectPrice.currentRequest.shipToCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.paymentTermsFilter='IND-02-333';
            paProjectPrice.currentRequest.marketSegmentFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup1Filter='IND-02-333';
            paProjectPrice.currentRequest.variantFilter='IND-02-333';
            paProjectPrice.currentRequest.contractFilter='IND-02-333';
            paProjectPrice.currentRequest.comPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup5KeyFilter='IND-02-333';
            paProjectPrice.currentRequest.plantFilter='IND-02-333';
            paProjectPrice.currentRequest.shippingConditionFilter='IND-02-333';
            paProjectPrice.currentRequest.destinationCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.salesOrderTypeFilter='IND-02-333';
            paProjectPrice.currentRequest.priceRefPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.endUseFilter='IND-02-333';
            paProjectPrice.currentRequest.partnerZFFilter='IND-02-333';
            paProjectPrice.currentRequest.payerFilter='IND-02-333';
            paProjectPrice.currentRequest.discRefNoFilter='IND-02-333';
            paProjectPrice.currentRequest.fixValDateFilter='IND-02-333';
            paProjectPrice.currentRequest.campaignFilter='IND-02-333';
            paProjectPrice.currentRequest.documentCurrencyFilter='IND-02-333';
            paProjectPrice.currentRequest.stateFilter='IND-02-333';
            
            
            try{
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','AddMaterialToRequest');
            }
            catch(Exception e){}
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            //addSelectedMaterialToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description'; 
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paKeyCombination.erpKeyCombination.id; 
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
            try{
                
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
          
            //addMaterialToRequest
            Material__c M2= new Material__c();
            M2.Name='Corian Sheet';
            M2.ERP_Material_Code__c='D118124';
            M2.ERP_Source_Cluster__c='WB1';
            M2.ERP_Sales_Org_Code__c='D630';
            M2.ERP_Distribution_Channel_Code__c='10';
            M2.ERP_Deletion_Flag__c=false;
            M2.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M2;
            paProjectPrice.currentRequest.materialFilter='D118124';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
             paProjectPrice.action('','','goToRequest');
            
            //to display error after validation (request)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            try{ Test.startTest();       
                     paProjectPrice.action('','','AddMaterialToRequest'); 
                  Test.stopTest();
               }
            catch(Exception e){}
            //to display error after validation (filter)
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter=null;
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            //to display error after validation (Material code)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter='D000000';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            
            //
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/MPG/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.mpgFilter =null; 
            

            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';                            
            
            
            
            //Fetch PH Records
            Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A6##12';
           PH1.PH_Level__c=6;
            insert PH1;
            
            BU_PH__c buph = new BU_PH__c();
            buph.Product_Hierarchy__c=PH1.id;
            //buph.Product_Hierarchy__r.Description__c='DUPONT SURFACES';
            //buph.Product_Hierarchy__r.PH_Code__c='A6';
           // buph.Product_Hierarchy__r.PH_Level__c=1;
            //buph.Business_Description__c='BI Surfaces - all';
            buph.OrgGroup__c=orgGroup1.Id;
            insert buph;
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }

        }

    }
    
    static testMethod void paProjectPriceTestMethod1_1() 
    {
        test.starttest();
        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
       // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces'); 
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname');
        system.debug('roleeeeeeeeee'+r);                   
      /*  User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.Approval_Escalation_Price_Requests = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='yes';
       
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
        
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            
            
            
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
       
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
         
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
  
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            //addSelectedMaterialToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description'; 
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paKeyCombination.erpKeyCombination.id; 
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
         
          
            //addMaterialToRequest
            Material__c M2= new Material__c();
            M2.Name='Corian Sheet';
            M2.ERP_Material_Code__c='D118124';
            M2.ERP_Source_Cluster__c='WB1';
            M2.ERP_Sales_Org_Code__c='D630';
            M2.ERP_Distribution_Channel_Code__c='10';
            M2.ERP_Deletion_Flag__c=false;
            M2.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M2;
            paProjectPrice.currentRequest.materialFilter='D118124';
       
            //to display error after validation (request)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
        
            //to display error after validation (filter)
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter=null;
       
            //to display error after validation (Material code)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter='D000000';
     
            //
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/MPG/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.mpgFilter =null; 

            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
            Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A6##12';
           PH1.PH_Level__c=6;
            insert PH1;
            
            BU_PH__c buph = new BU_PH__c();
            buph.Product_Hierarchy__c=PH1.id;
            //buph.Product_Hierarchy__r.Description__c='DUPONT SURFACES';
            //buph.Product_Hierarchy__r.PH_Code__c='A6';
           // buph.Product_Hierarchy__r.PH_Level__c=1;
            //buph.Business_Description__c='BI Surfaces - all';
            buph.OrgGroup__c=orgGroup1.Id;
            insert buph;
            
            
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList;
            //PH lengthe equal to KC PH6
            Product_Hierarchy__c PH2 = new Product_Hierarchy__c();
            //PH2.PH_Code__c='A6S112152233';//commented
            PH2.PH_Code__c='A6##12';
            PH2.PH_Level__c=6;
            insert PH2;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.keyCombination.erpKeyCombination.Key_Combination_Code__c='KC1';
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paProjectPrice.currentRequest.keyCombination.erpKeyCombination.id;
            //paProjectPrice.currentRequest.phFilter='A6##1215##33';//commented
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=6;
            try{
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e){}
            
        }
        test.stoptest();
    }


    
      
    static testMethod void paProjectPriceTestMethod2() 
    {      
     
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
      /*  User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3){
        List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
        profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
        insert profilePermissionList;
        
        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = '';
        erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
        erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.SAP_Application_Id__c = 'V';
        erpPricingProcedure.SAP_Client_Id__c = '510';
        erpPricingProcedure.SAP_Cluster__c = 'WB1';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
        Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.id;
        orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
        orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup.ERP_DIVISION_CODE__C='02';
        orgGroup.ERP_DIVISION__C='GSD Standard';
        orgGroup.ERP_SALES_ORG_CODE__C='D630';
        orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup.OWNING_BUSINESS__C='';
        orgGroup.OWNING_ORG__C='';
        orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
        insert orgGroup;
    
        OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '02';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
         orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
        //orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
        //orgGrpItem.CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Competitive pricing;Extending current prices;Pricing campaign;Other reason';
        orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem.ERP_UOM__C = 'EA;SH';
        orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem.RETROACTIVE_LIMIT__C =30;
        orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem.Rebate_Agreement__c='';
        orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem;
        
         ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='Sample-0001';
         //customer.Sales_Area__c='D6301002';
         customer.Sales_Org_Code__c='D630';
         customer.Distribution_Channel_Code__c='10';
         customer.Division_Code__c='02';
         customer.name='Test Customer';
         customer.Customer_Code__c='AT';
         customer.country__c='GERMANY';
         customer.Sales_Office__c='';
         customer.Street__c='';
         customer.City__c='';
         customer.Source_Cluster__c='WB1';  
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
         insert customer;
        
        List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
        pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
        pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
        pricingCondition1.SAP_Cluster__c = 'WB1';
        pricingCondition1.SAP_Application_Id__c = 'V';
        pricingCondition1.SAP_Client_Id__c = '510';
        pricingCondition1.Price_Types__c = 'Project';
        pricingCondition1.SAP_Condition_Type__c = true;
        pricingCondition1.Condition_class__c = 'Price';
        pricingCondition1.Plus_Minus_Code__c='X';
        pricingCondition1.Plus_Minus__c='Negative';
        pricingConditionsList.add(pricingCondition1);
        insert pricingConditionsList;
        
        ERP_Sales_Prices_SAP__c erpSAP= new ERP_Sales_Prices_SAP__c();
        erpSAP.Key_Combination_Code__c ='A580';
        erpSAP.SAP_Cluster__c='CB1';
        insert erpSAP;        
        
        ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
        keyCombinationList.add(keyCombObj1);
        insert keyCombinationList;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup1.Id;
        paOrgGroupItems.value = 'Project';
        paOrgGroupItems.orgGroupItems=orgGrpItem;
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        paServiceState.ogItems.isProjectGroupMember=true;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
        paERPCustomer.ogitems = paOrgGroupItems;
        paERPCustomer.paERPCustomer = customer;
        
        PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
        paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
        paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
        paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
        
        PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
        paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
        paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
        
        PARequest paRequest = new PARequest(paServiceState);
        paRequest.userSelected=u3.id;
        paRequest.keyCombination=paKeyCombination;
        paRequest.pricingCondition=paPricingCondition;
        paRequest.customer=paERPCustomer;
        
        paRequest.pricingRequest = new Pricing_Request__c();
        paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
        paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
        paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
        paServiceState.currentRequest=paRequest;
        
        PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
     
        paProjectPrice.currentRequest=paRequest;
        paProjectPrice.currentRequest.customer=paERPCustomer;
        paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
        
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.Project_Status__c='Draft';
        paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
        paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        
        Project_Price__c P2= new Project_Price__c();
        P2.Name='P2';
        P2.Valid_From__c=system.today();
        P2.Valid_To__c=system.today()+15;
        P2.Project_status__c='Approved';
        P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        P2.Project_Volume__c='100';
        P2.Default_Discount__c='10';
        P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert P2;
        
        Project_Price__c approvedProject= new Project_Price__c();
        approvedProject.Name='approvedProject';
        approvedProject.Valid_From__c=system.today()-10;
        approvedProject.Valid_To__c=system.today()+25;
        approvedProject.Project_status__c='Approved';
        approvedProject.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        approvedProject.Project_Volume__c='100';
        approvedProject.Default_Discount__c='10';
        approvedProject.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert approvedProject;
        
        //get ERPSAP record for approved project
        ERP_Sales_Prices_SAP__c sap1 =new ERP_Sales_Prices_SAP__c ();
        sap1.Project_Id__c=P2.Project_Id__c;
        sap1.Price_Holder__c=null;
        sap1.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1;
        
        ERP_Sales_Prices_SAP__c sap1H =new ERP_Sales_Prices_SAP__c ();
        sap1H.Project_Id__c=P2.Project_Id__c;
        sap1H.Price_Holder__c=sap1.id;
        sap1H.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1H.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1H.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1H.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1H;
        paProjectPrice.projectselection='clone';
            system.debug('TESTINGTESTING');
        List<PARelatedList>  relatedList= paProjectPrice.getListWrappers();
         system.debug('relatedList***' + relatedList);
        
        //clone a aproved project 
        
        
        // clone a aproved project (add selecetd Record)
        paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
        paProjectPrice.selectedProjectId='clone-'+P2.id;
        paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
        paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
        paProjectPrice.projectSelection = 'editApproved';
        list<ERP_Sales_Prices_SAP__c> pricingRecord = new list<ERP_Sales_Prices_SAP__c>();
        for(PARelatedList wRec1 : paProjectPrice.relatedListSAPRecord)
        {   
            for( PAWrapper w :  wRec1.wrapperList) 
            {
                if(w.isSelected != true)
                { 
                    w.isSelected=true;
                    
                    pricingRecord.add( (ERP_Sales_Prices_SAP__c) w.sobjectRecord);
                }
            }
        }
        ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c=pricingRecord[0].Key_Combination_Code__c,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c=pricingRecord[0].SAP_Cluster__c,SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        insert keyCombObj2;
        paProjectPrice.doRoundOff='NO';
        try
        {
             paProjectPrice.action('','','addClonedMaterialToRequest');
        }
        catch(Exception e){}
        paProjectPrice.doRoundOff='yes';
        try
        {
             paProjectPrice.action('','','addClonedMaterialToRequest');
        }
        catch(Exception e){}
        
        try
        {
             paProjectPrice.action('','','doneAddedToRequestClone'); 
        }
        catch(Exception e)
        {
        }
        
        //clone a aproved project (done)
        paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
        paProjectPrice.selectedProjectId='clone-'+P2.id;
        paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
        paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        for(PARelatedList wRec1 : paProjectPrice.relatedListSAPRecord)
        {   
            for( PAWrapper w :  wRec1.wrapperList) 
            {
                if(w.isSelected != true)
                { 
                    w.isSelected=true;
                }
            }
        }
        try
        {
             paProjectPrice.action('','','doneAddedToRequestClone'); 
        }
        catch(Exception e)
        {
        }
        
         //Edit approved project (v dates) 
         paProjectPrice.selectedProjectId='edit-'+approvedProject.id;
         paProjectPrice.projectPrice.Valid_From__c=system.today()-5;
         paProjectPrice.projectPrice.Valid_To__c=system.today()+20;
         paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Request';
         paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time Extension';
         try{
         paProjectPrice.action('','','addRecordToReqForApprovedProject');
         }catch(Exception e){}
          Test.startTest();
         try{
                paProjectPrice.action('','','doneAddedToRequestApproved');
         }
         catch(Exception e){} 
        
         
         //Edit Approved Project (volume)yes
         paProjectPrice.selectedProjectId='edit-'+P2.id;
         paProjectPrice.projectPrice.Project_Volume__c='120';
        //101 queries paProjectPrice.action('','','EditApprovrdProject');
         paProjectPrice.action('','','yesRecordLevelChange');
         
                           
         //Edit Approved Project (volume) No
         paProjectPrice.selectedProjectId='edit-'+P2.id;
         paProjectPrice.projectPrice.Project_Volume__c='120';
         Test.stoptest();
/*       paProjectPrice.action('','','EditApprovrdProject');
          Test.stopTest();

         try
         {
            paProjectPrice.action('','','NoRecordLevelChange'); 
         }
         catch(Exception e){}
         paProjectPrice.action('','','closeAlertMessage');
         */ 
        }
    } 
    
      static testMethod void paProjectPriceTestMethod3() 
      {    
        Test.starttest();
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
       /* User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];
            
            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.Id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
         
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //validate (insertProject)
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name=null;
            paProjectPrice.projectPrice.Valid_From__c=null;
            paProjectPrice.projectPrice.Valid_To__c=null;
            paProjectPrice.projectPrice.Project_Volume__c=null;
            paProjectPrice.projectPrice.Default_Discount__c=null;
            paProjectPrice.projectPrice.Assigned_To__c=null;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.PricingCondition_Id__c=null;
            paProjectPrice.currentRequest.pricingCondition.selectedPricingCondition=null;
            paProjectPrice.currentRequest.userSelected=null;
            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today()-5;
            paProjectPrice.projectPrice.Valid_To__c=system.today()-5;
            paProjectPrice.ProjectPrice.Project_Description__c='agcjhggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggguuuuuuuuuuuuuuuuuugggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggjjjjjjjjjjjjjjjjjjjjjjj';
            paProjectPrice.projectPrice.Default_Discount__c='hgddgvke78891397d csc';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today()+750;
            paProjectPrice.projectPrice.Valid_To__c=system.today()+705;
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            
           //validate Request
           paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null;
           paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
           paProjectPrice.validate('validateRequest');
           
           List<ERP_Pricing_Condition__c> pricingConditionsList1 = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition2 = new ERP_Pricing_Condition__c();
            pricingCondition2.Pricing_Condition_Code__c = 'XPROJ';
            pricingCondition2.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition2.SAP_Cluster__c = 'WB1';
            pricingCondition2.SAP_Application_Id__c = 'V';
            pricingCondition2.SAP_Client_Id__c = '510';
            pricingCondition2.Price_Types__c = 'Project';
            pricingCondition2.SAP_Condition_Type__c = true;
            pricingCondition2.Condition_class__c = 'Price';
            pricingCondition2.Plus_Minus_Code__c='X';
            pricingCondition2.Plus_Minus__c='Negative';
            pricingConditionsList1.add(pricingCondition2);
            insert pricingConditionsList1;
            
            //ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            //List<ERP_Key_Combination__c> keyCombinationList1 = new List<ERP_Key_Combination__c>();
            //keyCombinationList.add(keyCombObj2);
            //Insert keyCombinationList1;
            
            PAPricingCondition paPricingCondition1=new PAPricingCondition(paServiceState);
            paPricingCondition1.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList1[0];
            paPricingCondition1.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList1[0]).Id;
            paPricingCondition1.pricingCondition.Plus_Minus_Code__c='X';
            
           
           //validate validateKeyValue                                                                                                                      <SS20230501>
           paProjectPrice.currentRequest.keyCombination.KeyCombinationName='soldTo/FRB/Ship to/Sales office/CPG/Material Price Group/Price List Type/Terms Of Payment/Incoterms/End User/End Use/Price Ref. Partner/Market Segment/Variant/Contract No./ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/Sales Order Type/Sales Order Item/Value Center/Material Group 2/External Matl Grp/Price Zone/Ship-To Country/Kcode/Material Group 1/Sales District/Partner ZF/Payer/Disc Ref No/FixValDate/Campaign/Document Currency/State';
           //paProjectPrice.currentRequest.profitCenterFilter='test-test';
           paProjectPrice.currentRequest.profitCenterFilter=null;
           
           //paProjectPrice.currentRequest.shipToFilter='test-test';
           paProjectPrice.currentRequest.shipToFilter=null;
           
           paProjectPrice.currentRequest.salesOfficeFilter=null;
           paProjectPrice.currentRequest.salesOfficeFilter=null;
           paProjectPrice.currentRequest.cpgFilter=null;
           paProjectPrice.currentRequest.mpgFilter=null;
           paProjectPrice.currentRequest.priceListTypeFilter=null;
           paProjectPrice.currentRequest.paymentTermsFilter=null;
           paProjectPrice.currentRequest.incotermsFilter=null;
           paProjectPrice.currentRequest.endUserFilter=null;
           paProjectPrice.currentRequest.endUseFilter=null;
           paProjectPrice.currentRequest.priceRefPartnerFilter=null;
           paProjectPrice.currentRequest.marketSegmentFilter=null;
           paProjectPrice.currentRequest.variantFilter=null;
           paProjectPrice.currentRequest.contractFilter=null;
           paProjectPrice.currentRequest.comPartnerFilter=null;
           paProjectPrice.currentRequest.materialGroup5KeyFilter=null;
           paProjectPrice.currentRequest.plantFilter=null;
           paProjectPrice.currentRequest.shippingConditionFilter=null;
           paProjectPrice.currentRequest.destinationCountryFilter=null;
           paProjectPrice.currentRequest.salesOrderTypeFilter=null;
           paProjectPrice.currentRequest.shipToCountryFilter=null;
           paProjectPrice.currentRequest.kcodeFilter=null;
           paProjectPrice.currentRequest.materialGroup1Filter=null;
           paProjectPrice.currentRequest.salesDistrictFilter=null;
           paProjectPrice.currentRequest.partnerZFFilter=null;
           paProjectPrice.currentRequest.payerFilter=null;
           paProjectPrice.currentRequest.discRefNoFilter=null;
           paProjectPrice.currentRequest.fixValDateFilter=null;
           paProjectPrice.currentRequest.campaignFilter=null;
           paProjectPrice.currentRequest.documentCurrencyFilter=null;
           paProjectPrice.currentRequest.stateFilter=null;
           
           paProjectPrice.currentRequest.pricingCondition=paPricingCondition1;
           //paProjectPrice.currentRequest.pricingCondition.selectedPricingCondition='XPROJ';
           paProjectPrice.currentRequest.projectFilter=null;
           paProjectPrice.validate('validateKeyValue');
           
           
           //validate FilterCriteria
           paProjectPrice.currentRequest.keyCombination.KeyCombinationName='soldTo/FRB/Ship to/Sales office/CPG/Material/Price List Type/Terms Of Payment/Incoterms';
           paProjectPrice.currentRequest.materialFilter=null;
           paProjectPrice.validate('validateFilterCriteria');
           
          //validation (Edit Approved Project)
          //Future Project
          Project_Price__c P8= new Project_Price__c();
          P8.Name='P7';
          P8.Valid_From__c=system.today()+5;
          P8.Valid_To__c=system.today()+15;
          P8.Project_status__c='Approved';
          P8.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
          P8.Project_Volume__c='100';
          P8.Default_Discount__c='10';
          P8.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
          insert P8; 
          
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.Valid_From__c=null;
          paProjectPrice.projectPrice.Valid_To__c=null;
          paProjectPrice.projectPrice.default_Discount__c=null;
          paProjectPrice.projectPrice.project_volume__c=null;
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){}
          
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.Valid_From__c=system.today()-2;
          paProjectPrice.projectPrice.Valid_To__c=system.today()-3;
          
          paProjectPrice.projectPrice.default_Discount__c='123,456,8978,6'; //to throw locale error INVALID DISCOUNT
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){}
        
          //only dd is edited
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.default_Discount__c='12.98765'; 
          paProjectPrice.doRoundOff='NO';
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
          paProjectPrice.doRoundOff='yes';
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
          
         
          
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
          
          
          //VF is > then previous approved VF
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.Project_Volume__c='120';
          paProjectPrice.projectPrice.Valid_From__c=system.today()+10;
          paProjectPrice.projectPrice.Valid_To__c=system.today()-6;
          paProjectPrice.currentRequest.pricingCondition.pricingCondition=paPricingCondition.pricingCondition;
          paProjectPrice.projectPrice.default_Discount__c='@123456tyretws'; //to throw locale error INVALID DECIMAL
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){
          }
          
          //started Project
          Project_Price__c P9= new Project_Price__c();
          P9.Name='P7';
          P9.Valid_From__c=system.today()-5;
          P9.Valid_To__c=system.today()+15;
          P9.Project_status__c='Approved';
          P9.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
          P9.Project_Volume__c='100';
          P9.Default_Discount__c='10';
          P9.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
          insert P9; 
          
          
          Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            PH1.PH_Code__c='A6S112AA';
            PH1.PH_Level__c=4;
            insert PH1;
          BU_PH__c buPh = new BU_PH__c(
                                OrgGroup__c=orgGroup1.id,
                                Product_Hierarchy__c=PH1.id);
            insert buPh;
            //insert keyCombObj1;
            buPh = [Select id,Business_Description__c,OrgGroup__c,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c FROM BU_PH__c Where id =:buPh.id];
            paProjectPrice.relatedListFetchRecord = new List<PARelatedList>();
            paProjectPrice.relatedListFetchRecord.add(new PARelatedList());
            paProjectPrice.relatedListFetchRecord[0].wrapperList = new List<PAWrapper>();
            paProjectPrice.relatedListFetchRecord[0].wrapperList.add(new PAWrapper());
            paProjectPrice.relatedListFetchRecord[0].wrapperList[0].isSelected = true;
            paProjectPrice.relatedListFetchRecord[0].wrapperList[0].sobjectRecord = buPh;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName = ' ';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationId = keyCombObj1.id;
            paProjectPrice.currentRequest.cpgFilter = 'cpg-cpg';
            paProjectPrice.currentRequest.mpgFilter = 'mpg-mpg';
            paProjectPrice.currentRequest.salesOfficeFilter = 'soff-soff';
            paProjectPrice.currentRequest.priceListTypeFilter = 'plst-plst';
            paProjectPrice.currentRequest.endUserFilter = 'end-end';
            paProjectPrice.currentRequest.countryFilter = 'ct-ct';
            paProjectPrice.currentRequest.paymentTermsFilter = 'pay-pay';
            paProjectPrice.currentRequest.marketSegmentFilter = 'mseg-mseg';
            paProjectPrice.currentRequest.endUseFilter = 'end-end';
            paProjectPrice.currentRequest.priceRefPartnerFilter = 'pref-pref';
            try {
                paProjectPrice.action('','','addSelectedPHToRequest');
            }
            catch(Exception e) {}
          
          
          
          
          paProjectPrice.selectedProjectId='edit-'+P9.id;
          paProjectPrice.projectPrice.Project_Volume__c='120';
          paProjectPrice.projectPrice.Valid_From__c=system.today()+6;
          paProjectPrice.projectPrice.Valid_To__c=null;
          paProjectPrice.projectPrice.default_Discount__c='123.567848';
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
             
        }  
        Test.stopTest();
    } 
    
    static testMethod void paProjectPriceTestMethod4() 
    {
           Test.starttest();
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
       /* User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];
            
            List<OrgGroup__c> ogList=new List<OrgGroup__c>();
            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            ogList.add(orgGroup) ;
            
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            ogList.add(orgGroup1) ;
            
            insert ogList;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
        //  orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            List<Project_Price__c> ppList=new List<Project_Price__c>();
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10.346579';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P1;
            ppList.add(P1);
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P2;
            ppList.add(P2);
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P3;
            ppList.add(P3);
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P4;
            
            ppList.add(P4);
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P5;
            
            ppList.add(P5);
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P5';
            P6.Valid_From__c=system.today()-20;
            P6.Valid_To__c=system.today()-10;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P6;
            
            ppList.add(P6);
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P7';
            P7.Valid_From__c=system.today()-20;
            P7.Valid_To__c=system.today()-10;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            P7.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            //insert P7;
            
            ppList.add(P7);
            
            insert ppList;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            //insert R1;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            //insert R3;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            //insert R4;
            
            Pricing_Request__c R5= new Pricing_Request__c();
            R5.Request_Name__c='R5 For P5';
            R5.Request_Approval_Status__c='Draft';
            R5.Request_Reason__c='New Project';
            R5.Request_Type__c = 'Customer Specific';
            R5.Pricing_Request_Type__c = 'Project Pricing';
            R5.Spot_Type__c=null;
            R5.Customer_Specific__c = true;
            R5.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R5.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R5.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R5.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R5.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R5.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R5.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R5.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R5.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R5.City__c = paERPCustomer.paERPCustomer.City__c;
            R5.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R5.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R5.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R5.Project_Price__c=P5.id;
            R5.Project_Id__c=P5.Project_Id__c;
            R5.Project_Name__c=P5.Name;
            R5.Bu__c='Sample';
            //insert R5;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R7 For P7';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R7.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R7.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R7.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R7.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R7.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R7.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R7.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R7.City__c = paERPCustomer.paERPCustomer.City__c;
            R7.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R7.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R7.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R7.Project_Price__c=P5.id;
            R7.Project_Id__c=P5.Project_Id__c;
            R7.Project_Name__c=P5.Name;
            R7.Bu__c='Sample';
            //insert R7;
            
            List<Pricing_Request__c> prList=new List<Pricing_Request__c>();
            prList.add(R1);
            prList.add(R3);
            prList.add(R4);
            prList.add(R5);
            prList.add(R7);
            
            insert prList;
             test.stoptest();
            
            paProjectPrice.getListBusinessComponents(); 
            paProjectPrice.getListOptions(); 
            paProjectPrice.save(); 
            paProjectPrice.deleteRecord(); 
            paProjectPrice.getName();
            paProjectPrice.action('','','all');
            paProjectPrice.action('','','NoRoundOff');
             //
            paProjectPrice.action('PANewProject','PANewProject','new');
            paProjectPrice.action('PANewProject','PANewProject','current');
            paProjectPrice.action('PANewProject','PANewProject','cancelNewProject');
            
            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
            //Edit Draft Project 
            paProjectPrice.selectedProjectId='edit-'+P1.id;
            paProjectPrice.projectPrice=P1;
            paProjectPrice.projectPrice.Project_Volume__c='200';
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('','','EditProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('','','EditProject');
            }
            catch(Exception e){}
            paProjectPrice.action('','','doneAddedToRequest');
            
            //Edit Draft Project(return error messg)
            paProjectPrice.selectedProjectId='edit-'+P1.id;
            paProjectPrice.projectPrice=P1;
            paProjectPrice.projectPrice.Project_Volume__c=null;
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('','','EditProject');
            }
            catch(Exception e){}
            
            //ProjectID 
            // project ID for Draft project and request Draft
          
            paProjectPrice.selectedProjectId='projectId-'+P1.id;
        
            
            // project ID for approved  projectr no request
              
            paProjectPrice.selectedProjectId='projectId-'+P2.id;
            
            
            // project ID for rejected  project and request rejected
        
            paProjectPrice.selectedProjectId='projectId-'+P3.id; 
        
            
            // project ID for recalled  project and request recalled
        
            paProjectPrice.selectedProjectId='projectId-'+P4.id;  
        
            
            // project ID for Approved  project and Draft request
        
            paProjectPrice.selectedProjectId='projectId-'+P5.id;  
        
            
            // project ID for submitted  project and request submitted
        
            paProjectPrice.selectedProjectId='projectId-'+P7.id;
        
            
            // project ID for completed  project and request completed
        
            paProjectPrice.selectedProjectId='projectId-'+P6.id; 
        
                
         }  
   
    } 
    static testMethod void paProjectPriceTestMethod5() 
    {
        Test.starttest();   
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
       /* User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];
            
            OrgGroup__c orgGroup= new OrgGroup__c();
            //orgGroup.NAME='OG-0000001749';
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            //orgGroup.ACCOUNT_RULE__C='';
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            //orgGroup.TYPE__C='ERP';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            //orgGroup.BUSINESS__C='';
            insert orgGroup;
            
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
        //  orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
            //orgGrpItem.CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Competitive pricing;Extending current prices;Pricing campaign;Other reason';
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             //customer.Sales_Area__c='D6301002';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            //get ERPSAP record for approved project
            ERP_Sales_Prices_SAP__c sap1 =new ERP_Sales_Prices_SAP__c ();
            sap1.Project_Id__c=P2.Project_Id__c;
            sap1.Price_Holder__c=null;
            sap1.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
            sap1.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
            sap1.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
            sap1.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
            insert sap1;
            
            ERP_Sales_Prices_SAP__c sap1H =new ERP_Sales_Prices_SAP__c ();
            sap1H.Project_Id__c=P2.Project_Id__c;
            sap1H.Price_Holder__c=sap1.id;
            sap1H.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
            sap1H.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
            sap1H.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
            sap1H.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
            insert sap1H;
            paProjectPrice.projectselection='clone';
            system.debug('TESTING2TESTING');
            paProjectPrice.currentRequest.phFilter='A6##12';
            system.debug('TESTING3TESTING');
            List<PARelatedList>  relatedList= paProjectPrice.getListWrappers();
            
            //Clone Validation error message
            //clone a approved project (return validation message insert project) (done added to request)
            paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
            paProjectPrice.selectedProjectId='clone-'+P2.id;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
            paProjectPrice.projectPrice.Name=null;
            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
            try
            {
                 paProjectPrice.action('','','doneAddedToRequestClone'); 
            }
            catch(Exception e){}
            //clone a approved project (return validation message insert project) ( added to request)
            paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
            paProjectPrice.selectedProjectId='clone-'+P2.id;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
            paProjectPrice.projectPrice.Name=null;
            try
            {
                 paProjectPrice.action('','','addClonedMaterialToRequest');
            }
            catch(Exception e){}
            
            //clone a approved project (return validation message insert request)(doneAdded)
            paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
            paProjectPrice.selectedProjectId='clone-'+P2.id;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null;
            try
            {
                 paProjectPrice.action('','','doneAddedToRequestClone'); 
            }
            catch(Exception e){}
            //clone a approved project (return validation message insert request)(addedCloned)
            paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
            paProjectPrice.selectedProjectId='clone-'+P2.id;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null;
            try
            {
                 paProjectPrice.action('','','addClonedMaterialToRequest');
            }
            catch(Exception e){}
                
         } 
         Test.stoptest(); 
    }
    static testMethod void paProjectPriceTestMethod6() 
    {      
        Test.starttest();
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname');  
        
        system.debug('roleeeeeeeeee'+r);                   
       /* User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3){
        List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
        profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
        insert profilePermissionList;
        
        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = '';
        erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
        erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.SAP_Application_Id__c = 'V';
        erpPricingProcedure.SAP_Client_Id__c = '510';
        erpPricingProcedure.SAP_Cluster__c = 'WB1';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
        Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.id;
        orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
        orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup.ERP_DIVISION_CODE__C='02';
        orgGroup.ERP_DIVISION__C='GSD Standard';
        orgGroup.ERP_SALES_ORG_CODE__C='D630';
        orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup.OWNING_BUSINESS__C='';
        orgGroup.OWNING_ORG__C='';
        orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
        insert orgGroup;
    
        OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '02';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
         orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
    //  orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
        //orgGrpItem.CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Competitive pricing;Extending current prices;Pricing campaign;Other reason';
        orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem.ERP_UOM__C = 'EA;SH';
        orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem.RETROACTIVE_LIMIT__C =30;
        orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem.Rebate_Agreement__c='';
        orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem;
        
         ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='Sample-0001';
         //customer.Sales_Area__c='D6301002';
         customer.Sales_Org_Code__c='D630';
         customer.Distribution_Channel_Code__c='10';
         customer.Division_Code__c='02';
         customer.name='Test Customer';
         customer.Customer_Code__c='AT';
         customer.country__c='GERMANY';
         customer.Sales_Office__c='';
         customer.Street__c='';
         customer.City__c='';
         customer.Source_Cluster__c='WB1';  
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
         insert customer;
        
        List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
        pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
        pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
        pricingCondition1.SAP_Cluster__c = 'WB1';
        pricingCondition1.SAP_Application_Id__c = 'V';
        pricingCondition1.SAP_Client_Id__c = '510';
        pricingCondition1.Price_Types__c = 'Project';
        pricingCondition1.SAP_Condition_Type__c = true;
        pricingCondition1.Condition_class__c = 'Price';
        pricingCondition1.Plus_Minus_Code__c='X';
        pricingCondition1.Plus_Minus__c='Negative';
        pricingConditionsList.add(pricingCondition1);
        insert pricingConditionsList;
        
        ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
        keyCombinationList.add(keyCombObj1);
        Insert keyCombinationList;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup1.Id;
        paOrgGroupItems.value = 'Project';
        paOrgGroupItems.orgGroupItems=orgGrpItem;
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        paServiceState.ogItems.isProjectGroupMember=true;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
        paERPCustomer.ogitems = paOrgGroupItems;
        paERPCustomer.paERPCustomer = customer;
        
        PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
        paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
        paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
        paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
        
        PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
        paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
        paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
        
        PARequest paRequest = new PARequest(paServiceState);
        paRequest.userSelected=u3.id;
        paRequest.keyCombination=paKeyCombination;
        paRequest.pricingCondition=paPricingCondition;
        paRequest.customer=paERPCustomer;
        
        paRequest.pricingRequest = new Pricing_Request__c();
        paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
        paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
        paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
        paServiceState.currentRequest=paRequest;
        
        PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
     
        paProjectPrice.currentRequest=paRequest;
        paProjectPrice.currentRequest.customer=paERPCustomer;
        paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
        
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.Project_Status__c='Draft';
        paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
        paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
        paProjectPrice.projectSelection = 'editApproved';
        Project_Price__c P2= new Project_Price__c();
        P2.Name='P2';
        P2.Valid_From__c=system.today();
        P2.Valid_To__c=system.today()+15;
        P2.Project_status__c='Approved';
        P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        P2.Project_Volume__c='100';
        P2.Default_Discount__c='10';
        P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert P2;
        
        Project_Price__c approvedProject= new Project_Price__c();
        approvedProject.Name='approvedProject';
        approvedProject.Valid_From__c=system.today()-10;
        approvedProject.Valid_To__c=system.today()+25;
        approvedProject.Project_status__c='Approved';
        approvedProject.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        approvedProject.Project_Volume__c='100';
        approvedProject.Default_Discount__c='10';
        approvedProject.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert approvedProject;
        
        //get ERPSAP record for approved project
        ERP_Sales_Prices_SAP__c sap1 =new ERP_Sales_Prices_SAP__c ();
        sap1.Project_Id__c=P2.Project_Id__c;
        sap1.Price_Holder__c=null;
        sap1.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1;
        
        ERP_Sales_Prices_SAP__c sap1H =new ERP_Sales_Prices_SAP__c ();
        sap1H.Project_Id__c=P2.Project_Id__c;
        sap1H.Price_Holder__c=sap1.id;
        sap1H.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1H.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1H.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1H.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1H;
        paProjectPrice.projectselection='clone';
        List<PARelatedList>  relatedList= paProjectPrice.getListWrappers();
        
        
        //clone a aproved project 
        
        
        // clone a aproved project (add selecetd Record)
        paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
        paProjectPrice.selectedProjectId='clone-'+P2.id;
        paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
        paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        
        
        //clone a aproved project (done)
        paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
        paProjectPrice.selectedProjectId='clone-'+P2.id;
        paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
        paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        
         
                           
         //Edit Approved Project (volume) No
         paProjectPrice.selectedProjectId='edit-'+P2.id;
         paProjectPrice.projectPrice.Project_Volume__c='120';
         paProjectPrice.action('','','EditApprovrdProject');
         try
         {
            paProjectPrice.action('','','NoRecordLevelChange'); 
         }
         catch(Exception e){}
         paProjectPrice.action('','','closeAlertMessage');
            
        }
        Test.stoptest(); 
    }
    
static testMethod void paProjectPriceTestMethod7() 
    {
    Test.starttest();
        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
        /*User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
        //  orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='NO';
            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
        
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            
            
            
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
            try{
                paProjectPrice.action('','','FetchMaterialRecords');
            }
            catch(Exception e){}
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','AddMaterialToRequest');
            }
            catch(Exception e){}
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            
            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
        
        
            
        
            //Fetch PH Records
            Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A6##12';
            PH1.PH_Level__c=6;
            insert PH1;
            
            BU_PH__c buph1 = new BU_PH__c();
            buph1.Product_Hierarchy__c=PH1.id;
            buph1.OrgGroup__c=orgGroup1.Id;
            insert buph1;
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=3;
            List<PARelatedList>  relatedList;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e){}
            
            //PH lengthe equal to KC PH6
            Product_Hierarchy__c PH2 = new Product_Hierarchy__c();
            //PH2.PH_Code__c='A6S112152233';
            PH2.PH_Code__c='A6##12';
            PH2.PH_Level__c=6;
            insert PH2;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.keyCombination.erpKeyCombination.Key_Combination_Code__c='KC1';
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paProjectPrice.currentRequest.keyCombination.erpKeyCombination.id;
            //paProjectPrice.currentRequest.phFilter='A6##1215##33';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=6;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e){}
            
            // addSelectedPHToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description';
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            PARelatedList c = new PARelatedList();
            c.sObjectTypeName=BU_PH__c.sObjectType.getDescribe().getName().toLowerCase();
            c.keyCombinationColumns =SObjectType.BU_PH__c.fieldSets.getMap().get('PAProjectPH').getFields();
            c.wrapperList = new List<PAWrapper>();
            
            BU_PH__c buPh = new BU_PH__c();
            list<BU_PH__c>  BUPHListFinal =new list<BU_PH__c>();
            buPh.Product_Hierarchy__c=PH2.id;
            buPh.Business_Description__c='PH Description';
            insert buPh;
            BUPHListFinal.add(buPh);
            for(BU_PH__c b: BUPHListFinal)
            { 
                PAWrapper rw = new PAWrapper();
                rw.stringMap =new map<string,string>();
                rw.sobjectRecord = b;
                rw.isSelected = false; 
                c.wrapperList.add(rw);
            }
            paProjectPrice.relatedListFetchRecord.add(c);
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
            try{    
                    paProjectPrice.action('','','addSelectedPHToRequest');
                }
            catch(Exception e){}
            paProjectPrice.action('','','goToRequest');
            
           
            
            
            
            
            
        }
        Test.stoptest();
    } 

static testmethod void PAProjectPriceTestmethod8()
{
       
        
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
        /*User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3){
        List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
        profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
        insert profilePermissionList;
        
        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = '';
        erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
        erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.SAP_Application_Id__c = 'V';
        erpPricingProcedure.SAP_Client_Id__c = '510';
        erpPricingProcedure.SAP_Cluster__c = 'WB1';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
        Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.id;
        orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
        orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup.ERP_DIVISION_CODE__C='02';
        orgGroup.ERP_DIVISION__C='GSD Standard';
        orgGroup.ERP_SALES_ORG_CODE__C='D630';
        orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup.OWNING_BUSINESS__C='';
        orgGroup.OWNING_ORG__C='';
        orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
        insert orgGroup;
    
        OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '02';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
         orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
        //orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
        //orgGrpItem.CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Competitive pricing;Extending current prices;Pricing campaign;Other reason';
        orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem.ERP_UOM__C = 'EA;SH';
        orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem.RETROACTIVE_LIMIT__C =30;
        orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem.Rebate_Agreement__c='';
        orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem;
        
         ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='Sample-0001';
         //customer.Sales_Area__c='D6301002';
         customer.Sales_Org_Code__c='D630';
         customer.Distribution_Channel_Code__c='10';
         customer.Division_Code__c='02';
         customer.name='Test Customer';
         customer.Customer_Code__c='AT';
         customer.country__c='GERMANY';
         customer.Sales_Office__c='';
         customer.Street__c='';
         customer.City__c='';
         customer.Source_Cluster__c='WB1';  
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
         insert customer;
        
        List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
        pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
        pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
        pricingCondition1.SAP_Cluster__c = 'WB1';
        pricingCondition1.SAP_Application_Id__c = 'V';
        pricingCondition1.SAP_Client_Id__c = '510';
        pricingCondition1.Price_Types__c = 'Project';
        pricingCondition1.SAP_Condition_Type__c = true;
        pricingCondition1.Condition_class__c = 'Price';
        pricingCondition1.Plus_Minus_Code__c='X';
        pricingCondition1.Plus_Minus__c='Negative';
        pricingConditionsList.add(pricingCondition1);
        insert pricingConditionsList;
        
        ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
        keyCombinationList.add(keyCombObj1);
        Insert keyCombinationList;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup1.Id;
        paOrgGroupItems.value = 'Project';
        paOrgGroupItems.orgGroupItems=orgGrpItem;
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        paServiceState.ogItems.isProjectGroupMember=true;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
        paERPCustomer.ogitems = paOrgGroupItems;
        paERPCustomer.paERPCustomer = customer;
        
        PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
        paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
        paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
        paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
        
        PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
        paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
        paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
        
        PARequest paRequest = new PARequest(paServiceState);
        paRequest.userSelected=u3.id;
        paRequest.keyCombination=paKeyCombination;
        paRequest.pricingCondition=paPricingCondition;
        paRequest.customer=paERPCustomer;
        
        paRequest.pricingRequest = new Pricing_Request__c();
        paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
        paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
        paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
        paServiceState.currentRequest=paRequest;
        
        PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
     
        paProjectPrice.currentRequest=paRequest;
        paProjectPrice.currentRequest.customer=paERPCustomer;
        paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
        
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.Project_Status__c='Approved';
        paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
        paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        
        Project_Price__c P2= new Project_Price__c();
        P2.Name='P2';
        P2.Valid_From__c=system.today();
        P2.Valid_To__c=system.today()+15;
        P2.Project_status__c='Approved';
        P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        P2.Project_Volume__c='100';
        P2.Default_Discount__c='10';
        P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert P2;
        
        Project_Price__c approvedProject= new Project_Price__c();
        approvedProject.Name='approvedProject';
        approvedProject.Valid_From__c=system.today()-10;
        approvedProject.Valid_To__c=system.today()+25;
        approvedProject.Project_status__c='Approved';
        approvedProject.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        approvedProject.Project_Volume__c='100';
        approvedProject.Default_Discount__c='10';
        approvedProject.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        approvedProject.Project_Description__c='test';
        insert approvedProject;
        
        //get ERPSAP record for approved project
        ERP_Sales_Prices_SAP__c sap1 =new ERP_Sales_Prices_SAP__c ();
        sap1.Project_Id__c=P2.Project_Id__c;
        sap1.Price_Holder__c=null;
        sap1.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1;
        
        ERP_Sales_Prices_SAP__c sap1H =new ERP_Sales_Prices_SAP__c ();
        sap1H.Project_Id__c=P2.Project_Id__c;
        sap1H.Price_Holder__c=sap1.id;
        sap1H.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1H.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1H.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1H.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1H;
        paProjectPrice.projectselection='clone';
            system.debug('TESTINGTESTING');
        List<PARelatedList>  relatedList= paProjectPrice.getListWrappers();
        
      
        //clone a aproved project (done)
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        for(PARelatedList wRec1 : paProjectPrice.relatedListSAPRecord)
        {   
            for( PAWrapper w :  wRec1.wrapperList) 
            {
                if(w.isSelected != true)
                { 
                    w.isSelected=true;
                }
            }
        }
       
       Test.startTest();
         //Edit approved project (v dates) 
         paProjectPrice.selectedProjectId='edit-'+approvedProject.id;
         paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Request';
         paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time Extension';
       
         /******
         paProjectPrice.currentRequest.keyCombination.KeyCombinationName='soldTo/FRB/Ship to/Sales office/CPG/Material Price Group/Price List Type/Terms Of Payment/Incoterms/End User/End Use/Price Ref. Partner/Market Segment/Variant/Contract No./ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/Sales Order Type/Ship-To Country/Kcode/Material Group 1/Sales District/Partner ZF/Payer/Disc Ref No/FixValDate/Campaign/Document Currency/State';
           paProjectPrice.currentRequest.profitCenterFilter='test-test';         
           
           paProjectPrice.currentRequest.shipToFilter='test-test';           
           
           paProjectPrice.currentRequest.salesOfficeFilter='test-test';
           paProjectPrice.currentRequest.salesOfficeFilter='test-test';
           paProjectPrice.currentRequest.cpgFilter='test-test';
           paProjectPrice.currentRequest.mpgFilter='test-test';
           paProjectPrice.currentRequest.priceListTypeFilter='test-test';
           paProjectPrice.currentRequest.paymentTermsFilter='test-test';
           paProjectPrice.currentRequest.incotermsFilter='test-test';
           paProjectPrice.currentRequest.endUserFilter='test-test';
           paProjectPrice.currentRequest.endUseFilter='test-test';
           paProjectPrice.currentRequest.priceRefPartnerFilter='test-test';
           paProjectPrice.currentRequest.marketSegmentFilter='test-test';
           paProjectPrice.currentRequest.variantFilter='test-test';
           paProjectPrice.currentRequest.contractFilter='test-test';
           paProjectPrice.currentRequest.comPartnerFilter='test-test';
           paProjectPrice.currentRequest.materialGroup5KeyFilter='test-test';
           paProjectPrice.currentRequest.plantFilter='test-test';
           paProjectPrice.currentRequest.shippingConditionFilter='test-test';
           paProjectPrice.currentRequest.destinationCountryFilter='test-test';
           paProjectPrice.currentRequest.salesOrderTypeFilter='test-test';
           paProjectPrice.currentRequest.shipToCountryFilter='test-test';
           paProjectPrice.currentRequest.kcodeFilter='test-test';
           paProjectPrice.currentRequest.materialGroup1Filter='test-test';
           paProjectPrice.currentRequest.salesDistrictFilter='test-test';
           paProjectPrice.currentRequest.partnerZFFilter='test-test';
           paProjectPrice.currentRequest.payerFilter='test-test';
           paProjectPrice.currentRequest.discRefNoFilter='test-test';
           paProjectPrice.currentRequest.fixValDateFilter='test-test';
           paProjectPrice.currentRequest.campaignFilter='test-test';
           paProjectPrice.currentRequest.documentCurrencyFilter='test-test';
           paProjectPrice.currentRequest.stateFilter='test-test';
         
         
         
         ****/
        
         //Edit Approved Project (volume) No
         paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
         paProjectPrice.projectSelection = 'editApproved';
         try
         {
           paProjectPrice.action('','','EditApprovrdProject');
         }
         catch(Exception e)
         {}
         


          
        }
    
}

static testMethod void paProjectPriceTestMethod9() 
      {    
      Test.starttest();
        
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
        /*User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];
            
            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.Id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
         
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //validate (insertProject)
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name=null;
            paProjectPrice.projectPrice.Valid_From__c=null;
            paProjectPrice.projectPrice.Valid_To__c=null;
            paProjectPrice.projectPrice.Project_Volume__c=null;
            paProjectPrice.projectPrice.Default_Discount__c=null;
            paProjectPrice.projectPrice.Assigned_To__c=null;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.PricingCondition_Id__c=null;
            paProjectPrice.currentRequest.pricingCondition.selectedPricingCondition=null;
            paProjectPrice.currentRequest.userSelected=null;
            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today()-5;
            paProjectPrice.projectPrice.Valid_To__c=system.today()-5;
            paProjectPrice.ProjectPrice.Project_Description__c='agcjhggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggguuuuuuuuuuuuuuuuuugggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggjjjjjjjjjjjjjjjjjjjjjjj';
            paProjectPrice.projectPrice.Default_Discount__c='hgddgvke78891397d csc';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today()+750;
            paProjectPrice.projectPrice.Valid_To__c=system.today()+705;
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            
           //validate Request
           paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null;
           paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
           paProjectPrice.validate('validateRequest');
           
           List<ERP_Pricing_Condition__c> pricingConditionsList1 = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition2 = new ERP_Pricing_Condition__c();
            pricingCondition2.Pricing_Condition_Code__c = 'XPROJ';
            pricingCondition2.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition2.SAP_Cluster__c = 'WB1';
            pricingCondition2.SAP_Application_Id__c = 'V';
            pricingCondition2.SAP_Client_Id__c = '510';
            pricingCondition2.Price_Types__c = 'Project';
            pricingCondition2.SAP_Condition_Type__c = true;
            pricingCondition2.Condition_class__c = 'Price';
            pricingCondition2.Plus_Minus_Code__c='X';
            pricingCondition2.Plus_Minus__c='Negative';
            pricingConditionsList1.add(pricingCondition2);
            insert pricingConditionsList1;
            
            //ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            //List<ERP_Key_Combination__c> keyCombinationList1 = new List<ERP_Key_Combination__c>();
            //keyCombinationList.add(keyCombObj2);
            //Insert keyCombinationList1;
            
            PAPricingCondition paPricingCondition1=new PAPricingCondition(paServiceState);
            paPricingCondition1.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList1[0];
            paPricingCondition1.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList1[0]).Id;
            paPricingCondition1.pricingCondition.Plus_Minus_Code__c='X';
            
           
           //validate validateKeyValue                                                                                                                                                                                                                                                           <SS20230501>
           paProjectPrice.currentRequest.keyCombination.KeyCombinationName='soldTo/FRB/Ship to/Sales office/CPG/Material Price Group/Price List Type/Terms Of Payment/Incoterms/End User/End Use/Price Ref. Partner/Market Segment/Variant/Contract No./ComPartner/Material Group 5 Key/Plant/Shipping Condition/Destination Country/Sales Order Type/Sales Order Item/Value Center/Material Group 2/External Matl Grp/Price Zone/Ship-To Country/Kcode/Material Group 1/Sales District/Partner ZF/Payer/Disc Ref No/FixValDate/Campaign/Document Currency/State';
           paProjectPrice.currentRequest.profitCenterFilter='test-test';         
           
           paProjectPrice.currentRequest.shipToFilter='test-test';           
           
           paProjectPrice.currentRequest.salesOfficeFilter='test-test';
           paProjectPrice.currentRequest.salesOfficeFilter='test-test';
           paProjectPrice.currentRequest.cpgFilter='test-test';
           paProjectPrice.currentRequest.mpgFilter='test-test';
           paProjectPrice.currentRequest.priceListTypeFilter='test-test';
           paProjectPrice.currentRequest.paymentTermsFilter='test-test';
           paProjectPrice.currentRequest.incotermsFilter='test-test';
           paProjectPrice.currentRequest.endUserFilter='test-test';
           paProjectPrice.currentRequest.endUseFilter='test-test';
           paProjectPrice.currentRequest.priceRefPartnerFilter='test-test';
           paProjectPrice.currentRequest.marketSegmentFilter='test-test';
           paProjectPrice.currentRequest.variantFilter='test-test';
           paProjectPrice.currentRequest.contractFilter='test-test';
           paProjectPrice.currentRequest.comPartnerFilter='test-test';
           paProjectPrice.currentRequest.materialGroup5KeyFilter='test-test';
           paProjectPrice.currentRequest.plantFilter='test-test';
           paProjectPrice.currentRequest.shippingConditionFilter='test-test';
           paProjectPrice.currentRequest.destinationCountryFilter='test-test';
           paProjectPrice.currentRequest.salesOrderTypeFilter='test-test';
           paProjectPrice.currentRequest.shipToCountryFilter='test-test';
           paProjectPrice.currentRequest.kcodeFilter='test-test';
           paProjectPrice.currentRequest.materialGroup1Filter='test-test';
           paProjectPrice.currentRequest.salesDistrictFilter='test-test';
           paProjectPrice.currentRequest.partnerZFFilter='test-test';
           paProjectPrice.currentRequest.payerFilter='test-test';
           paProjectPrice.currentRequest.discRefNoFilter='test-test';
           paProjectPrice.currentRequest.fixValDateFilter='test-test';
           paProjectPrice.currentRequest.campaignFilter='test-test';
           paProjectPrice.currentRequest.documentCurrencyFilter='test-test';
           paProjectPrice.currentRequest.stateFilter='test-test';
           paProjectPrice.currentRequest.salesOrderItemFilter = 'test-test'; //<SS20230501> - START
           paProjectPrice.currentRequest.valuecenterFilter = 'test-test';
           paProjectPrice.currentRequest.materialgroup2Filter = 'test-test';
           paProjectPrice.currentRequest.extMaterialGroupFilter = 'test-test';
           paProjectPrice.currentRequest.prizezoneFilter = 'test-test';  //<SS20230501> - END
            
           paProjectPrice.currentRequest.pricingCondition=paPricingCondition1;
           //paProjectPrice.currentRequest.pricingCondition.selectedPricingCondition='XPROJ';
           paProjectPrice.currentRequest.projectFilter=null;
           paProjectPrice.validate('validateKeyValue');
           
           
           //validate FilterCriteria
           paProjectPrice.currentRequest.keyCombination.KeyCombinationName='soldTo/FRB/Ship to/Sales office/CPG/Material/Price List Type/Terms Of Payment/Incoterms';
           paProjectPrice.currentRequest.materialFilter=null;
           paProjectPrice.validate('validateFilterCriteria');
           
          //validation (Edit Approved Project)
          //Future Project
          Project_Price__c P8= new Project_Price__c();
          P8.Name='P7';
          P8.Valid_From__c=system.today()+5;
          P8.Valid_To__c=system.today()+15;
          P8.Project_status__c='Approved';
          P8.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
          P8.Project_Volume__c='100';
          P8.Default_Discount__c='10';
          P8.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
          insert P8; 
          
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.Valid_From__c=null;
          paProjectPrice.projectPrice.Valid_To__c=null;
          paProjectPrice.projectPrice.default_Discount__c=null;
          paProjectPrice.projectPrice.project_volume__c=null;
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){}
          
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.Valid_From__c=system.today()-2;
          paProjectPrice.projectPrice.Valid_To__c=system.today()-3;
          
          paProjectPrice.projectPrice.default_Discount__c='123,456,8978,6'; //to throw locale error INVALID DISCOUNT
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){}
        
          //only dd is edited
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.default_Discount__c='12.98765'; 
          paProjectPrice.doRoundOff='NO';
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
          paProjectPrice.doRoundOff='yes';
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
          
         
          
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){ }
          
          
          //VF is > then previous approved VF
          paProjectPrice.selectedProjectId='edit-'+P8.id;
          paProjectPrice.projectPrice.Project_Volume__c='120';
          paProjectPrice.projectPrice.Valid_From__c=system.today()+10;
          paProjectPrice.projectPrice.Valid_To__c=system.today()-6;
          paProjectPrice.currentRequest.pricingCondition.pricingCondition=paPricingCondition.pricingCondition;
          paProjectPrice.projectPrice.default_Discount__c='@123456tyretws'; //to throw locale error INVALID DECIMAL
          try{
          paProjectPrice.action('','','EditApprovrdProject');
          }
          catch(Exception e){
          }
          
          //started Project
          Project_Price__c P9= new Project_Price__c();
          P9.Name='P7';
          P9.Valid_From__c=system.today()-5;
          P9.Valid_To__c=system.today()+15;
          P9.Project_status__c='Approved';
          P9.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
          P9.Project_Volume__c='100';
          P9.Default_Discount__c='10';
          P9.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
          insert P9; 
          
          
          Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            PH1.PH_Code__c='A6S112AA';
            PH1.PH_Level__c=4;
            insert PH1;
          BU_PH__c buPh = new BU_PH__c(
                                OrgGroup__c=orgGroup1.id,
                                Product_Hierarchy__c=PH1.id);
            insert buPh;
            //insert keyCombObj1;
            buPh = [Select id,Business_Description__c,OrgGroup__c,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c FROM BU_PH__c Where id =:buPh.id];
            paProjectPrice.relatedListFetchRecord = new List<PARelatedList>();
            paProjectPrice.relatedListFetchRecord.add(new PARelatedList());
            paProjectPrice.relatedListFetchRecord[0].wrapperList = new List<PAWrapper>();
            paProjectPrice.relatedListFetchRecord[0].wrapperList.add(new PAWrapper());
            paProjectPrice.relatedListFetchRecord[0].wrapperList[0].isSelected = true;
            paProjectPrice.relatedListFetchRecord[0].wrapperList[0].sobjectRecord = buPh;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName = ' ';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationId = keyCombObj1.id;
            paProjectPrice.currentRequest.cpgFilter = 'cpg-cpg';
            paProjectPrice.currentRequest.mpgFilter = 'mpg-mpg';
            paProjectPrice.currentRequest.salesOfficeFilter = 'soff-soff';
            paProjectPrice.currentRequest.priceListTypeFilter = 'plst-plst';
            paProjectPrice.currentRequest.endUserFilter = 'end-end';
            paProjectPrice.currentRequest.countryFilter = 'ct-ct';
            paProjectPrice.currentRequest.paymentTermsFilter = 'pay-pay';
            paProjectPrice.currentRequest.marketSegmentFilter = 'mseg-mseg';
            paProjectPrice.currentRequest.endUseFilter = 'end-end';
            paProjectPrice.currentRequest.priceRefPartnerFilter = 'pref-pref';
            
            paProjectPrice.currentRequest.profitCenterFilter = 'test-test';         
           
           paProjectPrice.currentRequest.shipToFilter = 'test-test';           
           
           paProjectPrice.currentRequest.salesOfficeFilter = 'test-test';
           paProjectPrice.currentRequest.salesOfficeFilter = 'test-test';
           paProjectPrice.currentRequest.cpgFilter = 'test-test';
           paProjectPrice.currentRequest.mpgFilter = 'test-test';
           paProjectPrice.currentRequest.priceListTypeFilter = 'test-test';
           paProjectPrice.currentRequest.paymentTermsFilter = 'test-test';
           paProjectPrice.currentRequest.incotermsFilter = 'test-test';
           paProjectPrice.currentRequest.endUserFilter = 'test-test';
           paProjectPrice.currentRequest.endUseFilter = 'test-test';
           paProjectPrice.currentRequest.priceRefPartnerFilter = 'test-test';
           paProjectPrice.currentRequest.marketSegmentFilter = 'test-test';
           paProjectPrice.currentRequest.variantFilter = 'test-test';
           paProjectPrice.currentRequest.contractFilter = 'test-test';
           paProjectPrice.currentRequest.comPartnerFilter = 'test-test';
           paProjectPrice.currentRequest.materialGroup5KeyFilter = 'test-test';
           paProjectPrice.currentRequest.plantFilter = 'test-test';
           paProjectPrice.currentRequest.shippingConditionFilter = 'test-test';
           paProjectPrice.currentRequest.destinationCountryFilter = 'test-test';
           paProjectPrice.currentRequest.salesOrderTypeFilter = 'test-test';
           paProjectPrice.currentRequest.shipToCountryFilter = 'test-test';
           paProjectPrice.currentRequest.kcodeFilter = 'test-test';
           paProjectPrice.currentRequest.materialGroup1Filter = 'test-test';
           paProjectPrice.currentRequest.salesDistrictFilter = 'test-test';
           paProjectPrice.currentRequest.partnerZFFilter = 'test-test';
           paProjectPrice.currentRequest.payerFilter = 'test-test';
           paProjectPrice.currentRequest.discRefNoFilter = 'test-test';
           paProjectPrice.currentRequest.fixValDateFilter = 'test-test';
           paProjectPrice.currentRequest.campaignFilter = 'test-test';
           paProjectPrice.currentRequest.documentCurrencyFilter = 'test-test';
           paProjectPrice.currentRequest.stateFilter = 'test-test';
           paProjectPrice.currentRequest.salesOrderItemFilter = 'test-test';  //<SS20230501> - START
           paProjectPrice.currentRequest.valuecenterFilter = 'test-test' ;
           paProjectPrice.currentRequest.materialgroup2Filter = 'test-test';
           paProjectPrice.currentRequest.extMaterialGroupFilter = 'test-test';
           paProjectPrice.currentRequest.prizezoneFilter = 'test-test'; //<SS20230501> - END
            
            try {
                paProjectPrice.action('','','addSelectedPHToRequest');
                paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e) {}
          
          
          
          
          paProjectPrice.selectedProjectId='edit-'+P9.id;
          paProjectPrice.projectPrice.Project_Volume__c='120';
          paProjectPrice.projectPrice.Valid_From__c=system.today()+6;
          paProjectPrice.projectPrice.Valid_To__c=null;
          paProjectPrice.projectPrice.default_Discount__c='123.567848';
          try{
          paProjectPrice.action('','','EditApprovrdProject');          
          
          paProjectPrice.action('','','addSelectedMaterialsToRequest');
            
          }catch(Exception e){ }
             
        } 
        Test.stoptest();
         
    } 
    
    static testMethod void paProjectPriceTestMethod101() 
    {
    
        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
        /*User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.Approval_Escalation_Price_Requests = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
        
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            
            
            
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
            try{
                paProjectPrice.action('','','FetchMaterialRecords');
            }
            catch(Exception e){}
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
            paProjectPrice.currentRequest.incotermsFilter='IN-02-03';
            paProjectPrice.currentRequest.salesDistrictFilter='IN-02-03';
            paProjectPrice.currentRequest.endUserFilter='EU-02';
            paProjectPrice.currentRequest.shipToFilter='SH-02';
            paProjectPrice.currentRequest.countryFilter='IND-02-333';
            paProjectPrice.currentRequest.shipToCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.paymentTermsFilter='IND-02-333';
            paProjectPrice.currentRequest.marketSegmentFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup1Filter='IND-02-333';
            paProjectPrice.currentRequest.variantFilter='IND-02-333';
            paProjectPrice.currentRequest.contractFilter='IND-02-333';
            paProjectPrice.currentRequest.comPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup5KeyFilter='IND-02-333';
            paProjectPrice.currentRequest.plantFilter='IND-02-333';
            paProjectPrice.currentRequest.shippingConditionFilter='IND-02-333';
            paProjectPrice.currentRequest.destinationCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.salesOrderTypeFilter='IND-02-333';
            paProjectPrice.currentRequest.priceRefPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.endUseFilter='IND-02-333';
            paProjectPrice.currentRequest.partnerZFFilter='IND-02-333';
            paProjectPrice.currentRequest.payerFilter='IND-02-333';
            paProjectPrice.currentRequest.discRefNoFilter='IND-02-333';
            paProjectPrice.currentRequest.fixValDateFilter='IND-02-333';
            paProjectPrice.currentRequest.campaignFilter='IND-02-333';
            paProjectPrice.currentRequest.documentCurrencyFilter='IND-02-333';
            paProjectPrice.currentRequest.stateFilter='IND-02-333';
            paProjectPrice.currentRequest.salesOrderItemFilter = 'IND-02-333'; //<SS20230501> - START
            paProjectPrice.currentRequest.valuecenterFilter = 'IND-02-333';
            paProjectPrice.currentRequest.materialgroup2Filter = 'IND-02-333';
            paProjectPrice.currentRequest.extMaterialGroupFilter = 'IND-02-333';
            paProjectPrice.currentRequest.prizezoneFilter = 'IND-02-333';  // <SS20230501> - END
            
            try{
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','AddMaterialToRequest');
            }
            catch(Exception e){}
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            //addSelectedMaterialToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description'; 
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paKeyCombination.erpKeyCombination.id; 
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
            try{
                
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
          
            //addMaterialToRequest
            Material__c M2= new Material__c();
            M2.Name='Corian Sheet';
            M2.ERP_Material_Code__c='D118124';
            M2.ERP_Source_Cluster__c='WB1';
            M2.ERP_Sales_Org_Code__c='D630';
            M2.ERP_Distribution_Channel_Code__c='10';
            M2.ERP_Deletion_Flag__c=false;
            M2.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M2;
            paProjectPrice.currentRequest.materialFilter='D118124';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
             paProjectPrice.action('','','goToRequest');
            
            //to display error after validation (request)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            try{ Test.startTest();       
                     paProjectPrice.action('','','AddMaterialToRequest'); 
                  Test.stopTest();
               }
            catch(Exception e){}
            //to display error after validation (filter)
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter=null;
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            //to display error after validation (Material code)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter='D000000';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            
            //
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/MPG/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.mpgFilter =null; 
            

            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';                            
            
            
            
            //Fetch PH Records
            Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A6##12';
           PH1.PH_Level__c=6;
            insert PH1;
            
            BU_PH__c buph = new BU_PH__c();
            buph.Product_Hierarchy__c=PH1.id;
            //buph.Product_Hierarchy__r.Description__c='DUPONT SURFACES';
            //buph.Product_Hierarchy__r.PH_Code__c='A6';
           // buph.Product_Hierarchy__r.PH_Level__c=1;
            //buph.Business_Description__c='BI Surfaces - all';
            buph.OrgGroup__c=orgGroup1.Id;
            insert buph;
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }
            //Subbu Pooja
            list<Material__c> materialRecordListTest  =new list<Material__c>();
            insert materialRecordListTest;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList1;
            try{
              relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }
            
            PAProjectPrice paProjectPrice1 = new PAProjectPrice(paServiceState);
            paProjectPrice1.disableDefDiscount();
        }

    }
    //Pooja Subbu
    static testMethod void paProjectPriceTestMethod102() 
    {

        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname');   
        
        system.debug('roleeeeeeeeee'+r);                   
      /*  User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.Approval_Escalation_Price_Requests = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Rebate';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
        
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            
            
            
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
            try{
                paProjectPrice.action('','','FetchMaterialRecords');
            }
            catch(Exception e){}
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
            paProjectPrice.currentRequest.incotermsFilter='IN-02-03';
            paProjectPrice.currentRequest.salesDistrictFilter='IN-02-03';
            paProjectPrice.currentRequest.endUserFilter='EU-02';
            paProjectPrice.currentRequest.shipToFilter='SH-02';
            paProjectPrice.currentRequest.countryFilter='IND-02-333';
            paProjectPrice.currentRequest.shipToCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.paymentTermsFilter='IND-02-333';
            paProjectPrice.currentRequest.marketSegmentFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup1Filter='IND-02-333';
            paProjectPrice.currentRequest.variantFilter='IND-02-333';
            paProjectPrice.currentRequest.contractFilter='IND-02-333';
            paProjectPrice.currentRequest.comPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup5KeyFilter='IND-02-333';
            paProjectPrice.currentRequest.plantFilter='IND-02-333';
            paProjectPrice.currentRequest.shippingConditionFilter='IND-02-333';
            paProjectPrice.currentRequest.destinationCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.salesOrderTypeFilter='IND-02-333';
            paProjectPrice.currentRequest.priceRefPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.endUseFilter='IND-02-333';
            paProjectPrice.currentRequest.partnerZFFilter='IND-02-333';
            paProjectPrice.currentRequest.payerFilter='IND-02-333';
            paProjectPrice.currentRequest.discRefNoFilter='IND-02-333';
            paProjectPrice.currentRequest.fixValDateFilter='IND-02-333';
            paProjectPrice.currentRequest.campaignFilter='IND-02-333';
            paProjectPrice.currentRequest.documentCurrencyFilter='IND-02-333';
            paProjectPrice.currentRequest.stateFilter='IND-02-333';
            
            
            try{
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','AddMaterialToRequest');
            }
            catch(Exception e){}
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P5;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            //addSelectedMaterialToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description'; 
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paKeyCombination.erpKeyCombination.id; 
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
            try{
                
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
          
            //addMaterialToRequest
            Material__c M2= new Material__c();
            M2.Name='Corian Sheet';
            M2.ERP_Material_Code__c='D118124';
            M2.ERP_Source_Cluster__c='WB1';
            M2.ERP_Sales_Org_Code__c='D630';
            M2.ERP_Distribution_Channel_Code__c='10';
            M2.ERP_Deletion_Flag__c=false;
            M2.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M2;
            paProjectPrice.currentRequest.materialFilter='D118124';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
             paProjectPrice.action('','','goToRequest');
            
            //to display error after validation (request)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            try{ Test.startTest();       
                     paProjectPrice.action('','','AddMaterialToRequest'); 
                  Test.stopTest();
               }
            catch(Exception e){}
            //to display error after validation (filter)
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter=null;
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            //to display error after validation (Material code)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter='D000000';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            
            //
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/MPG/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.mpgFilter =null; 
            

            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';                            
            
            
            
            //Fetch PH Records
            Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A6##12';
           PH1.PH_Level__c=6;
            insert PH1;
            
            BU_PH__c buph = new BU_PH__c();
            buph.Product_Hierarchy__c=PH1.id;
            //buph.Product_Hierarchy__r.Description__c='DUPONT SURFACES';
            //buph.Product_Hierarchy__r.PH_Code__c='A6';
           // buph.Product_Hierarchy__r.PH_Level__c=1;
            //buph.Business_Description__c='BI Surfaces - all';
            buph.OrgGroup__c=orgGroup1.Id;
            insert buph;
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }
            //Subbu Pooja
            list<Material__c> materialRecordListTest  =new list<Material__c>();
            insert materialRecordListTest;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList1;
            try{
              relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }
            
            PAProjectPrice paProjectPrice1 = new PAProjectPrice(paServiceState);
            paProjectPrice1.disableDefDiscount();
        }

    }
    
    static testMethod void paProjectPriceTestMethod201() 
    {      
        
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname'); 
        
        system.debug('roleeeeeeeeee'+r);                   
        /*User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
            PermissionSet ps = new PermissionSet();
            ps.Name = 'Price_Approval_Sales_Admin'; 
            PermissionSetAssignment psa = new PermissionSetAssignment();
            psa.PermissionSetId = ps.Id;
            psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3){
        List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
        profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
        profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
        insert profilePermissionList;
        
        ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
        erpPricingProcedure.Doc_Type__c = '';
        erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
        erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
        erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
        erpPricingProcedure.SAP_Application_Id__c = 'V';
        erpPricingProcedure.SAP_Client_Id__c = '510';
        erpPricingProcedure.SAP_Cluster__c = 'WB1';
        erpPricingProcedure.Status__c = 'Active';
        insert erpPricingProcedure;
        
        Recordtype recType = [select id,name from Recordtype where name = 'Business'];
        
        OrgGroup__c orgGroup= new OrgGroup__c();
        orgGroup.CURRENCYISOCODE='USD';
        orgGroup.RECORDTYPEID=recType.id;
        orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
        orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
        orgGroup.ERP_DIVISION_CODE__C='02';
        orgGroup.ERP_DIVISION__C='GSD Standard';
        orgGroup.ERP_SALES_ORG_CODE__C='D630';
        orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
        orgGroup.OWNING_BUSINESS__C='';
        orgGroup.OWNING_ORG__C='';
        orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
        insert orgGroup;
    
        OrgGroup__c orgGroup1 = new orgGroup__c();
        orgGroup1.Business__c = 'BI EMEA Envelopes';
        orgGroup1.RecordTypeId = recType.Id;
        orgGroup1.ERP_Distribution_Channel_Code__c = '10';
        orgGroup1.ERP_Sales_Org_Code__c = 'D630';
        orgGroup1.ERP_Division_Code__c = '02';
        orgGroup1.OWNING_BUSINESS__C='Building Innovations';
        orgGroup1.TYPE__C='ERP';
        insert orgGroup1;
        
        Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
        orgGrpItem.Business__c = (orgGroup1).id;
        orgGrpItem.OrgGroup__c = (orgGroup).id;
         orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
        orgGrpItem.CURRENCYISOCODE = 'USD';
        //orgGrpItem.APPROVAL_ESCALATION_DURATION__C = 23;
        //orgGrpItem.CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Competitive pricing;Extending current prices;Pricing campaign;Other reason';
        orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
        orgGrpItem.ERP_UOM__C = 'EA;SH';
        orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
        orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
        orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
        orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
        orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
        orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
        orgGrpItem.RETROACTIVE_LIMIT__C =30;
        orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
        orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
        orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
        orgGrpItem.Rebate_Agreement__c='Annual Agreement';
        orgGrpItem.Rebate_Agreement__c='';
        orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
        insert orgGrpItem;
        
         ERP_Customer__c customer=new ERP_Customer__c();
         customer.Account_Group_Code__c='Z001';
         customer.Customer_Code__c='Sample-0001';
         //customer.Sales_Area__c='D6301002';
         customer.Sales_Org_Code__c='D630';
         customer.Distribution_Channel_Code__c='10';
         customer.Division_Code__c='02';
         customer.name='Test Customer';
         customer.Customer_Code__c='AT';
         customer.country__c='GERMANY';
         customer.Sales_Office__c='';
         customer.Street__c='';
         customer.City__c='';
         customer.Source_Cluster__c='WB1';  
         customer.Deletion_Flag__c=false;
         customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
         insert customer;
        
        List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
        ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
        pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
        pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
        pricingCondition1.SAP_Cluster__c = 'WB1';
        pricingCondition1.SAP_Application_Id__c = 'V';
        pricingCondition1.SAP_Client_Id__c = '510';
        pricingCondition1.Price_Types__c = 'Project';
        pricingCondition1.SAP_Condition_Type__c = true;
        pricingCondition1.Condition_class__c = 'Price';
        pricingCondition1.Plus_Minus_Code__c='X';
        pricingCondition1.Plus_Minus__c='Negative';
        pricingConditionsList.add(pricingCondition1);
        insert pricingConditionsList;
        
        ERP_Sales_Prices_SAP__c erpSAP= new ERP_Sales_Prices_SAP__c();
        erpSAP.Key_Combination_Code__c ='A580';
        erpSAP.SAP_Cluster__c='CB1';
        insert erpSAP;        
        
        ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
        keyCombinationList.add(keyCombObj1);
        insert keyCombinationList;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup1.Id;
        paOrgGroupItems.value = 'Project';
        paOrgGroupItems.orgGroupItems=orgGrpItem;
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        paServiceState.ogItems.isProjectGroupMember=true;
        
        PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
        paERPCustomer.ogitems = paOrgGroupItems;
        paERPCustomer.paERPCustomer = customer;
        
        PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
        paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
        paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
        paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
        
        PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
        paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
        paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
        
        PARequest paRequest = new PARequest(paServiceState);
        paRequest.userSelected=u3.id;
        paRequest.keyCombination=paKeyCombination;
        paRequest.pricingCondition=paPricingCondition;
        paRequest.customer=paERPCustomer;
        
        paRequest.pricingRequest = new Pricing_Request__c();
        paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
        paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
        paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
        paServiceState.currentRequest=paRequest;
        
        PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
     
        paProjectPrice.currentRequest=paRequest;
        paProjectPrice.currentRequest.customer=paERPCustomer;
        paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
        
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.Project_Status__c='Draft';
        paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
        paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        
        Project_Price__c P2= new Project_Price__c();
        P2.Name='P2';
        P2.Valid_From__c=system.today();
        P2.Valid_To__c=system.today()+15;
        P2.Project_status__c='Approved';
        P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        P2.Project_Volume__c='100';
        P2.Default_Discount__c='10.5';
        P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert P2;
        
        Project_Price__c approvedProject= new Project_Price__c();
        approvedProject.Name='approvedProject';
        approvedProject.Valid_From__c=system.today()-10;
        approvedProject.Valid_To__c=system.today()+25;
        approvedProject.Project_status__c='Approved';
        approvedProject.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
        approvedProject.Project_Volume__c='100';
        approvedProject.Default_Discount__c='10';
        approvedProject.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
        insert approvedProject;
        
        //get ERPSAP record for approved project
        ERP_Sales_Prices_SAP__c sap1 =new ERP_Sales_Prices_SAP__c ();
        sap1.Project_Id__c=P2.Project_Id__c;
        sap1.Price_Holder__c=null;
        sap1.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1;
        
        ERP_Sales_Prices_SAP__c sap1H =new ERP_Sales_Prices_SAP__c ();
        sap1H.Project_Id__c=P2.Project_Id__c;
        sap1H.Price_Holder__c=sap1.id;
        sap1H.Pricing_Condition_Code__c=paPricingCondition.pricingCondition.Pricing_Condition_Code__c; 
        sap1H.Pricing_Condition__c=paPricingCondition.pricingCondition.Pricing_Condition__c;
        sap1H.Key_Combination_Code__c=paKeyCombination.erpKeyCombination.Key_Combination_Code__c;
        sap1H.Key_Combination__c=paKeyCombination.erpKeyCombination.Key_Combination__c;
        insert sap1H;
        paProjectPrice.projectselection='clone';
            system.debug('TESTINGTESTING');
        List<PARelatedList>  relatedList= paProjectPrice.getListWrappers();
         system.debug('relatedList***' + relatedList);
        
        //clone a aproved project 
        
        
        // clone a aproved project (add selecetd Record)
        paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
        paProjectPrice.selectedProjectId='clone-'+P2.id;
        paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
        paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c='15.8765443';
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
        paProjectPrice.projectSelection = 'editApproved';
        list<ERP_Sales_Prices_SAP__c> pricingRecord = new list<ERP_Sales_Prices_SAP__c>();
        for(PARelatedList wRec1 : paProjectPrice.relatedListSAPRecord)
        {   
            for( PAWrapper w :  wRec1.wrapperList) 
            {
                if(w.isSelected != true)
                { 
                    w.isSelected=true;
                    
                    pricingRecord.add( (ERP_Sales_Prices_SAP__c) w.sobjectRecord);
                }
            }
        }
        ERP_Key_Combination__c keyCombObj2 = new ERP_Key_Combination__c(Key_Combination_Code__c=pricingRecord[0].Key_Combination_Code__c,Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c=pricingRecord[0].SAP_Cluster__c,SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
        insert keyCombObj2;
        paProjectPrice.doRoundOff='NO';
        try
        {
             paProjectPrice.action('','','addClonedMaterialToRequest');
        }
        catch(Exception e){}
        paProjectPrice.doRoundOff='yes';
        try
        {
             paProjectPrice.action('','','addClonedMaterialToRequest');
        }
        catch(Exception e){}
        
        try
        {
             paProjectPrice.action('','','doneAddedToRequestClone'); 
        }
        catch(Exception e)
        {
        }
        
        //clone a aproved project (done)
        paProjectPrice.currentRequest.pricingRequest= new Pricing_Request__c ();
        paProjectPrice.selectedProjectId='clone-'+P2.id;
        paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test Clone Request';
        paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='New Project';
        paProjectPrice.projectPrice= new Project_Price__c();
        paProjectPrice.projectPrice.Name='TestProject';
        paProjectPrice.projectPrice.Valid_From__c=system.today();
        paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
        paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
        paProjectPrice.projectPrice.Default_Discount__c=string.valueOf(-15);
        paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
        paProjectPrice.projectPrice.PricingCondition_Id__c =paPricingCondition.selectedPricingCondition;
        paProjectPrice.relatedListSAPRecord=relatedList;
        for(PARelatedList wRec1 : paProjectPrice.relatedListSAPRecord)
        {   
            for( PAWrapper w :  wRec1.wrapperList) 
            {
                if(w.isSelected != true)
                { 
                    w.isSelected=true;
                }
            }
        }
        try
        {
             paProjectPrice.action('','','doneAddedToRequestClone'); 
        }
        catch(Exception e)
        {
        }
        
         //Edit approved project (v dates) 
         paProjectPrice.selectedProjectId='edit-'+approvedProject.id;
         paProjectPrice.projectPrice.Valid_From__c=system.today()-5;
         paProjectPrice.projectPrice.Valid_To__c=system.today()+20;
         paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Request';
         paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time Extension';
         try{
         paProjectPrice.action('','','addRecordToReqForApprovedProject');
         }catch(Exception e){}
         Test.startTest();
         try{
                paProjectPrice.action('','','doneAddedToRequestApproved');
         }
         catch(Exception e){} 
         
         
         //Edit Approved Project (volume)yes
         paProjectPrice.selectedProjectId='edit-'+P2.id;
         paProjectPrice.projectPrice.Project_Volume__c='120';
        //101 queries paProjectPrice.action('','','EditApprovrdProject');
         paProjectPrice.action('','','yesRecordLevelChange');
         
                           
         //Edit Approved Project (volume) No
         paProjectPrice.selectedProjectId='edit-'+P2.id;
         paProjectPrice.projectPrice.Project_Volume__c='120';
/*       paProjectPrice.action('','','EditApprovrdProject');
          Test.stopTest();

         try
         {
            paProjectPrice.action('','','NoRecordLevelChange'); 
         }
         catch(Exception e){}
         paProjectPrice.action('','','closeAlertMessage');
         */ 
        }
    }
    
    static testMethod void paProjectPriceTestMethod103() 
    {

        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname');   
        
        system.debug('roleeeeeeeeee'+r);                   
      /*  User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.Approval_Escalation_Price_Requests = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
        
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            
            
            
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P7;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
            try{
                paProjectPrice.action('','','FetchMaterialRecords');
            }
            catch(Exception e){}
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
            paProjectPrice.currentRequest.incotermsFilter='IN-02-03';
            paProjectPrice.currentRequest.salesDistrictFilter='IN-02-03';
            paProjectPrice.currentRequest.endUserFilter='EU-02';
            paProjectPrice.currentRequest.shipToFilter='SH-02';
            paProjectPrice.currentRequest.countryFilter='IND-02-333';
            paProjectPrice.currentRequest.shipToCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.paymentTermsFilter='IND-02-333';
            paProjectPrice.currentRequest.marketSegmentFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup1Filter='IND-02-333';
            paProjectPrice.currentRequest.variantFilter='IND-02-333';
            paProjectPrice.currentRequest.contractFilter='IND-02-333';
            paProjectPrice.currentRequest.comPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup5KeyFilter='IND-02-333';
            paProjectPrice.currentRequest.plantFilter='IND-02-333';
            paProjectPrice.currentRequest.shippingConditionFilter='IND-02-333';
            paProjectPrice.currentRequest.destinationCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.salesOrderTypeFilter='IND-02-333';
            paProjectPrice.currentRequest.priceRefPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.endUseFilter='IND-02-333';
            paProjectPrice.currentRequest.partnerZFFilter='IND-02-333';
            paProjectPrice.currentRequest.payerFilter='IND-02-333';
            paProjectPrice.currentRequest.discRefNoFilter='IND-02-333';
            paProjectPrice.currentRequest.fixValDateFilter='IND-02-333';
            paProjectPrice.currentRequest.campaignFilter='IND-02-333';
            paProjectPrice.currentRequest.documentCurrencyFilter='IND-02-333';
            paProjectPrice.currentRequest.stateFilter='IND-02-333';
            
            
            try{
                 paProjectPrice.action('','','addSelectedPHToRequest');
                 
            }
            catch(Exception e){}
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','AddMaterialToRequest');
            }
            catch(Exception e){}
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P7;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            //addSelectedMaterialToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description'; 
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paKeyCombination.erpKeyCombination.id; 
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
            try{
                
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}
          
            //addMaterialToRequest
            Material__c M2= new Material__c();
            M2.Name='Corian Sheet';
            M2.ERP_Material_Code__c='D118124';
            M2.ERP_Source_Cluster__c='WB1';
            M2.ERP_Sales_Org_Code__c='D630';
            M2.ERP_Distribution_Channel_Code__c='10';
            M2.ERP_Deletion_Flag__c=false;
            M2.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M2;
            paProjectPrice.currentRequest.materialFilter='D118124';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
             paProjectPrice.action('','','goToRequest');
            
            //to display error after validation (request)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            try{ Test.startTest();       
                     paProjectPrice.action('','','AddMaterialToRequest'); 
                  Test.stopTest();
               }
            catch(Exception e){}
            //to display error after validation (filter)
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter=null;
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            //to display error after validation (Material code)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter='D000000';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            
            //
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/MPG/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.mpgFilter =null; 
            

            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';                            
            
            
            
            //Fetch PH Records
            Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A6##12';
           PH1.PH_Level__c=6;
            insert PH1;
            
            BU_PH__c buph = new BU_PH__c();
            buph.Product_Hierarchy__c=PH1.id;
            //buph.Product_Hierarchy__r.Description__c='DUPONT SURFACES';
            //buph.Product_Hierarchy__r.PH_Code__c='A6';
           // buph.Product_Hierarchy__r.PH_Level__c=1;
            //buph.Business_Description__c='BI Surfaces - all';
            buph.OrgGroup__c=orgGroup1.Id;
            insert buph;
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }

        }

    }
    
    static testMethod void paProjectPriceTestMethod104() 
    {

        // TO DO: implement unit test
        // Load the test Pricing Request data from the static resource
        Profile p =[SELECT Id FROM Profile where name='Price Approval-Price Requester'];
         // 01/04/2017 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
       UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
        User u3 = TestUserUtil.createTestUser(r.id, p.id, 'Test fname', 'Test lname');   
        
        system.debug('roleeeeeeeeee'+r);                   
       /* User u3 =  new User(Alias='pcopp', Email='ambili_vinay@infosys.com', User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847' ,
                            External_ERP_ID__c='99999999',UserRoleId=r.id,profileid = p.id,
                            Username='pa_werner1@jhhgtestinfosys.com.test2', LastName='Coppens', CommunityNickname='acv',
                            TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');   */
                      
        PermissionSet ps = new PermissionSet();
        ps.Name = 'Price_Approval_Sales_Admin'; 
        PermissionSetAssignment psa = new PermissionSetAssignment();
        psa.PermissionSetId = ps.Id;
        psa.AssigneeId = u3.Id;            
                                    
        system.runAs(u3)
        {
            List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
            profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
            profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
            insert profilePermissionList;
            
            ERP_Pricing_Procedure__c erpPricingProcedure = new ERP_Pricing_Procedure__c();
            erpPricingProcedure.Doc_Type__c = '';
            erpPricingProcedure.Pricing_Procedure__c = 'ERP_PP-00001';
            erpPricingProcedure.Pricing_Procedure_Description__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.Pricing_Procedure_Code__c = 'ZD630A';
            erpPricingProcedure.Pricing_Procedure__c = 'NOW Standard Pricing- EU';
            erpPricingProcedure.SAP_Application_Id__c = 'V';
            erpPricingProcedure.SAP_Client_Id__c = '510';
            erpPricingProcedure.SAP_Cluster__c = 'WB1';
            erpPricingProcedure.Status__c = 'Active';
            insert erpPricingProcedure;
            
            Recordtype recType = [select id,name from Recordtype where name = 'Business'];

            OrgGroup__c orgGroup= new OrgGroup__c();
            orgGroup.CURRENCYISOCODE='USD';
            orgGroup.RECORDTYPEID=recType.id;
            orgGroup.ERP_DISTRIBUTION_CHANNEL_CODE__C='10';
            orgGroup.ERP_DISTRIBUTION_CHANNEL__C='DuPont Std';
            orgGroup.ERP_DIVISION_CODE__C='02';
            orgGroup.ERP_DIVISION__C='GSD Standard';
            orgGroup.ERP_SALES_ORG_CODE__C='D630';
            orgGroup.ERP_SALES_ORG__C='NOW DUP LUX 3430';
            orgGroup.OWNING_BUSINESS__C='';
            orgGroup.OWNING_ORG__C='';
            orgGroup.EXTERNAL_ERP_ID__C='Askjlkj';
            insert orgGroup;
        
            OrgGroup__c orgGroup1 = new orgGroup__c();
            orgGroup1.Business__c = 'BI EMEA Envelopes';
            orgGroup1.RecordTypeId = recType.Id;
            orgGroup1.ERP_Distribution_Channel_Code__c = '10';
            orgGroup1.ERP_Sales_Org_Code__c = 'D630';
            orgGroup1.ERP_Division_Code__c = '02';
            orgGroup1.OWNING_BUSINESS__C='Building Innovations';
            orgGroup1.TYPE__C='ERP';
            insert orgGroup1;
            
            Organizational_Group_Item__c orgGrpItem= new Organizational_Group_Item__c();
            orgGrpItem.Business__c = (orgGroup1).id;
            orgGrpItem.OrgGroup__c = (orgGroup).id;
             orgGrpItem.ERP_Pricing_Procedure__c = erpPricingProcedure.Id;
            orgGrpItem.CURRENCYISOCODE = 'USD';
            //orgGrpItem.Approval_Escalation_Price_Requests = 23;
            orgGrpItem.ERP_CURRENCY__C = 'USD;RUB';
            orgGrpItem.ERP_UOM__C = 'EA;SH';
            orgGrpItem.INCLUDE_CUSTOMER_CURRENCY__C = true;
            orgGrpItem.LATEST_VALID_FROM_OFFSET_NON_CUST_SPEC__C = 90;
            orgGrpItem.LATEST_VALID_TO_OFFSET_CUST_SPEC__C = 12;
            orgGrpItem.LATEST_VALID_TO_OFFSET_NON_CUST_SPEC__C = 12;
            orgGrpItem.MAX_VALID_FROM_OFFSET_CUST_SPEC__C = 90;
            orgGrpItem.NON_CUSTOMER_PERMANENT_REQUEST_REASONS__C = 'Extending current prices; New materials; Periodic price review; Other reason; Pricing Compaign; Seasonal price';
            orgGrpItem.RETROACTIVE_LIMIT__C =30;
            orgGrpItem.CUSTOMER_REQUEST_REASONS__C = 'Seasonal price; Pricing campaign; Slow moving inventory; Customer negotiation; New customer; New materials; Competitive pricing; Extending current prices; Other reason';
            orgGrpItem.PRICING_TASK_REASONS__C = '002-Trade fair sales activity;F06-Demonstration to Customer;F09-Research & Development;F12-Replacement;F15-Sales Promotion;M12- Pricing Discrepancy;M13-Quantity Correction;M31-Commercial Adjustment;S01-Paid Sample sales;Non-standard product;Other reason';
            orgGrpItem.PROJECT_REQUEST_REASONS__C = 'Quantity Change;Time extension;Quantity and time change;Product change';
            orgGrpItem.Rebate_Agreement__c='Annual Agreement';
            orgGrpItem.Rebate_Agreement__c='';
            orgGrpItem.Pricing_Task_Type__c='Spot Price; Free of Charge; Rebate Agreement; Display';
            orggrpitem.Default_Per_UoM_Setup__c='Product Hierarchy Config';
            insert orgGrpItem;
            
             ERP_Customer__c customer=new ERP_Customer__c();
             customer.Account_Group_Code__c='Z001';
             customer.Customer_Code__c='Sample-0001';
             customer.Sales_Org_Code__c='D630';
             customer.Distribution_Channel_Code__c='10';
             customer.Division_Code__c='02';
             customer.name='Test Customer';
             customer.Customer_Code__c='AT';
             customer.country__c='GERMANY';
             customer.Sales_Office__c='';
             customer.Street__c='';
             customer.City__c='';
             customer.Source_Cluster__c='WB1';  
             customer.Deletion_Flag__c=false;
             customer.RecordTypeId =Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');       
             insert customer;
            
            List<ERP_Pricing_Condition__c> pricingConditionsList = new List<ERP_Pricing_Condition__c>();
            ERP_Pricing_Condition__c pricingCondition1 = new ERP_Pricing_Condition__c();
            pricingCondition1.Pricing_Condition_Code__c = 'ZD9G';
            pricingCondition1.Pricing_Condition__c = 'ProjectDiscountBLIND';
            pricingCondition1.SAP_Cluster__c = 'WB1';
            pricingCondition1.SAP_Application_Id__c = 'V';
            pricingCondition1.SAP_Client_Id__c = '510';
            pricingCondition1.Price_Types__c = 'Project';
            pricingCondition1.SAP_Condition_Type__c = true;
            pricingCondition1.Condition_class__c = 'Price';
            pricingCondition1.Plus_Minus_Code__c='X';
            pricingCondition1.Plus_Minus__c='Negative';
            pricingConditionsList.add(pricingCondition1);
            insert pricingConditionsList;
            
            ERP_Key_Combination__c keyCombObj1 = new ERP_Key_Combination__c(Key_Combination_Code__c='A580',Key_Combination__c='Sales Org./Dist. Channel/Division/Sold to/Material',SAP_Cluster__c='CB1',SAP_Client_Id__c='510',SAP_Application_Id__c='V',Customer_Specific__c=false,Key_Combination_type__c='Standard');
            List<ERP_Key_Combination__c> keyCombinationList = new List<ERP_Key_Combination__c>();
            keyCombinationList.add(keyCombObj1);
            Insert keyCombinationList;
            
            PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
            paOrgGroupItems.selectedBU = orgGroup1.Id;
            paOrgGroupItems.value = 'Project';
            paOrgGroupItems.orgGroupItems=orgGrpItem;
            
            PAServiceState paServiceState = new PAServiceState();
            paServiceState.ogItems = paOrgGroupItems;
            paServiceState.ogItems.isProjectGroupMember=true;
            
            PAERPCustomer paERPCustomer = new PAERPCustomer(paServiceState);
            paERPCustomer.ogitems = paOrgGroupItems;
            paERPCustomer.paERPCustomer = customer;
            
            PAPricingCondition paPricingCondition=new PAPricingCondition(paServiceState);
            paPricingCondition.pricingCondition=(ERP_Pricing_Condition__c)pricingConditionsList[0];
            paPricingCondition.pricingCondition.Plus_Minus_Code__c='X';
            paPricingCondition.selectedPricingCondition = ((ERP_Pricing_Condition__c)pricingConditionsList[0]).Id;
            
            PAKeyCombination  paKeyCombination = new  PAKeyCombination(paServiceState);
            paKeyCombination.erpKeyCombination=(ERP_Key_Combination__c)keyCombinationList[0];
            paKeyCombination.keyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            
            PARequest paRequest = new PARequest(paServiceState);
            paRequest.userSelected=u3.id;
            paRequest.keyCombination=paKeyCombination;
            paRequest.pricingCondition=paPricingCondition;
            paRequest.customer=paERPCustomer;
            
            paRequest.pricingRequest = new Pricing_Request__c();
            paRequest.pricingRequest.Sales_Org_Code__c=paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            paRequest.pricingRequest.Division_Code__c=paERPCustomer.paERPCustomer.Division_Code__c; 
            paRequest.pricingRequest.Dist_Channel_Code__c=paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            paServiceState.currentRequest=paRequest;
            
            PAProjectPrice paProjectPrice = new PAProjectPrice(paServiceState);
            paProjectPrice.currentRequest=paRequest;
            paProjectPrice.currentRequest.customer=paERPCustomer;
            paProjectPrice.currentRequest.pricingCondition=paPricingCondition;
            
            //insert project
            paProjectPrice.projectPrice= new Project_Price__c();
            paProjectPrice.projectPrice.Name='TestProject';
            paProjectPrice.projectPrice.Valid_From__c=system.today();
            paProjectPrice.projectPrice.Valid_To__c=system.today()+15;
            paProjectPrice.projectPrice.Project_Volume__c=string.valueOf(100);
            paProjectPrice.projectPrice.Default_Discount__c='123.76543';
            paProjectPrice.projectPrice.Assigned_To__c=(Id)paProjectPrice.currentRequest.userSelected;
            paProjectPrice.projectPrice.Project_Status__c='Draft';
            paProjectPrice.projectPrice.Sold_To_Code__c=paERPCustomer.customerCode;
            paProjectPrice.projectPrice.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            paProjectPrice.doRoundOff='NO';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
            paProjectPrice.doRoundOff='yes';
            try{
            paProjectPrice.action('PANewProject','PANewProject','insertProject');
            }
            catch(Exception e){}
           
            Project_Price__c P1= new Project_Price__c();
            P1.Name='P1';
            P1.Valid_From__c=system.today();
            P1.Valid_To__c=system.today()+15;
            P1.Project_status__c='Draft';
            P1.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P1.Project_Volume__c='100';
            P1.Default_Discount__c='10';
            P1.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P1;
            
            Pricing_Request__c R1= new Pricing_Request__c();
            R1.Request_Name__c='R1 For P1';
            R1.Request_Approval_Status__c='Draft';
            R1.Request_Reason__c='New Project';
            R1.Request_Type__c = 'Customer Specific';
            R1.Pricing_Request_Type__c = 'Project Pricing';
            R1.Spot_Type__c=null;
            R1.Customer_Specific__c = true;
            R1.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R1.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R1.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R1.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R1.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R1.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R1.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R1.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R1.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R1.City__c = paERPCustomer.paERPCustomer.City__c;
            R1.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R1.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R1.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R1.Project_Price__c=P1.id;
            R1.Project_Id__c=P1.Project_Id__c;
            R1.Project_Name__c=P1.Name;
            R1.Bu__c='Sample';
            insert R1;
            
            Project_Price__c P2= new Project_Price__c();
            P2.Name='P2';
            P2.Valid_From__c=system.today();
            P2.Valid_To__c=system.today()+15;
            P2.Project_status__c='Approved';
            P2.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P2.Project_Volume__c='100';
            P2.Default_Discount__c='10';
            P2.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P2;
            
            Project_Price__c P3= new Project_Price__c();
            P3.Name='P2';
            P3.Valid_From__c=system.today();
            P3.Valid_To__c=system.today()+15;
            P3.Project_status__c='Rejected';
            P3.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P3.Project_Volume__c='100';
            P3.Default_Discount__c='10';
            P3.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P3;
            
            Pricing_Request__c R3= new Pricing_Request__c();
            R3.Request_Name__c='R3 For P3';
            R3.Request_Approval_Status__c='Rejected';
            R3.Request_Reason__c='New Project';
            R3.Request_Type__c = 'Customer Specific';
            R3.Pricing_Request_Type__c = 'Project Pricing';
            R3.Spot_Type__c=null;
            R3.Customer_Specific__c = true;
            R3.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R3.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R3.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R3.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R3.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R3.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R3.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R3.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R3.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R3.City__c = paERPCustomer.paERPCustomer.City__c;
            R3.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R3.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R3.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R3.Project_Price__c=P3.id;
            R3.Project_Id__c=P3.Project_Id__c;
            R3.Project_Name__c=P3.Name;
            R3.Bu__c='Sample';
            insert R3;
            
            Project_Price__c P4= new Project_Price__c();
            P4.Name='P4';
            P4.Valid_From__c=system.today();
            P4.Valid_To__c=system.today()+15;
            P4.Project_status__c='Recalled';
            P4.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P4.Project_Volume__c='100';
            P4.Default_Discount__c='10';
            P4.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P4;
            
            Pricing_Request__c R4= new Pricing_Request__c();
            R4.Request_Name__c='R4 For P4';
            R4.Request_Approval_Status__c='Recalled';
            R4.Request_Reason__c='New Project';
            R4.Request_Type__c = 'Customer Specific';
            R4.Pricing_Request_Type__c = 'Project Pricing';
            R4.Spot_Type__c=null;
            R4.Customer_Specific__c = true;
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            R4.Zip_PostalCode__c = paERPCustomer.paERPCustomer.Zip_Postal_Code__c;
            R4.City__c = paERPCustomer.paERPCustomer.City__c;
            R4.Street__c = paERPCustomer.paERPCustomer.Street__c;
            R4.Country__c = paERPCustomer.paERPCustomer.Country__c;
            R4.State_Province__c = paERPCustomer.paERPCustomer.State_Province__c;
            R4.Project_Price__c=P4.id;
            R4.Project_Id__c=P4.Project_Id__c;
            R4.Project_Name__c=P4.Name;
            R4.Bu__c='Sample';
            insert R4;
            
            Project_Price__c P5= new Project_Price__c();
            P5.Name='P5';
            P5.Valid_From__c=system.today();
            P5.Valid_To__c=system.today()+15;
            P5.Project_status__c='Approved';
            P5.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P5.Project_Volume__c='100';
            P5.Default_Discount__c='10';
            P5.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P5;
            
            Project_Price__c P6= new Project_Price__c();
            P6.Name='P6';
            P6.Valid_From__c=system.today()-9;
            P6.Valid_To__c=system.today()-1;
            P6.Project_status__c='Completed';
            P6.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P6.Project_Volume__c='100';
            P6.Default_Discount__c='10';
            P6.Sold_To_Code__c=paERPCustomer.paERPCustomer.customer_code__c;
            insert P6;
            
            Project_Price__c P7= new Project_Price__c();
            P7.Name='P5';
            P7.Valid_From__c=system.today();
            P7.Valid_To__c=system.today()+15;
            P7.Project_status__c='Submitted';
            P7.PricingCondition_Id__c=paPricingCondition.selectedPricingCondition;
            P7.Project_Volume__c='100';
            P7.Default_Discount__c='10';
            R4.Dist_Channel_Code__c =paERPCustomer.paERPCustomer.Distribution_Channel_Code__c;
            R4.Dist_Channel__c = paERPCustomer.paERPCustomer.Distribution_Channel__c;
            R4.Division_Code__c = paERPCustomer.paERPCustomer.Division_Code__c;
            R4.Division__c = paERPCustomer.paERPCustomer.Division__c;
            R4.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;   
            R4.Sales_Org__c = paERPCustomer.paERPCustomer.Sales_Org__c;
            R4.Sold_To__c = paERPCustomer.paERPCustomer.Name;
            R4.soldto_code__c=paERPCustomer.paERPCustomer.customer_code__c; // Ver 2.6
            insert P7;
            
            Pricing_Request__c R7= new Pricing_Request__c();
            R7.Request_Name__c='R4 For P4';
            R7.Request_Approval_Status__c='Submitted';
            R7.Request_Reason__c='New Project';
            R7.Request_Type__c = 'Customer Specific';
            R7.Pricing_Request_Type__c = 'Project Pricing';
            R7.Spot_Type__c=null;
            R7.Customer_Specific__c = true;
            R7.Project_Price__c=P7.id;
            R7.Project_Id__c=P7.Project_Id__c;
            R7.Project_Name__c=P7.Name;
            R7.Sales_Org_Code__c = paERPCustomer.paERPCustomer.Sales_Org_Code__c;
            R7.Bu__c='Sample';
            insert R7;
            
            //all, current
            paProjectPrice.projectSelection='current';
            List<PARelatedList> projectRecordsCurrent=paProjectPrice.getListWrappers();
            paProjectPrice.projectSelection='all';
            List<PARelatedList> projectRecordsall= paProjectPrice.getListWrappers();
          Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
            //PH1.PH_Code__c='A6S112AA';//commented
            PH1.PH_Code__c='A62AF5SDG54SDG44FF';
             PH1.PH_Level__c=9;
            insert PH1;
            
            BU_PH__c buph = new BU_PH__c();
            buph.Product_Hierarchy__c=PH1.id;
            buph.Default_UOM__c='KG';
            buph.Default_Per__c=2;
            //buph.Product_Hierarchy__r.Description__c='DUPONT SURFACES';
            //buph.Product_Hierarchy__r.PH_Code__c='A6';
           // buph.Product_Hierarchy__r.PH_Level__c=1;
            //buph.Business_Description__c='BI Surfaces - all';
            buph.OrgGroup__c=orgGroup1.Id;
            insert buph;
          
            //Fetch Records Material
            Material__c M1= new Material__c();
            M1.Name='Corian Sheet';
            M1.ERP_Material_Code__c='D118123';
            M1.ERP_Source_Cluster__c='WB1';
            M1.ERP_Sales_Org_Code__c='D630';
            M1.ERP_Distribution_Channel_Code__c='10';
            M1.ERP_Deletion_Flag__c=false;
            M1.Product_Hierarchy__c='A62AF5SDG54SDG44FF';
            M1.ERP_Product_Hierarchy_Level_1_Code__c='A6';
            M1.ERP_Product_Hierarchy_Level_2_Code__c='2A';
            M1.ERP_Product_Hierarchy_Level_3_Code__c='F5';
            M1.ERP_Product_Hierarchy_Level_4_Code__c='SD';
            M1.ERP_Product_Hierarchy_Level_5_Code__c='G5';
            M1.ERP_Product_Hierarchy_Level_6_Code__c='4S';
            M1.ERP_Product_Hierarchy_Level_7_Code__c='DG';
            M1.ERP_Product_Hierarchy_Level_8_Code__c='44';
            M1.ERP_Product_Hierarchy_Level_9_Code__c='FF';
            M1.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M1;
            Material__c M3= new Material__c();
            M3.Name='Corian Sheet';
            M3.ERP_Material_Code__c='D118125';
            M3.ERP_Source_Cluster__c='WB1';
            M3.ERP_Sales_Org_Code__c='D630';
            M3.ERP_Distribution_Channel_Code__c='10';
            M3.ERP_Deletion_Flag__c=false;
            M3.Product_Hierarchy__c='A62AF5SDG54SDG44FF';
            M3.ERP_Product_Hierarchy_Level_1_Code__c='A6';
            M3.ERP_Product_Hierarchy_Level_2_Code__c='2A';
            M3.ERP_Product_Hierarchy_Level_3_Code__c='F5';
            M3.ERP_Product_Hierarchy_Level_4_Code__c='SD';
            M3.ERP_Product_Hierarchy_Level_5_Code__c='G5';
            M3.ERP_Product_Hierarchy_Level_6_Code__c='4S';
            M3.ERP_Product_Hierarchy_Level_7_Code__c='DG';
            M3.ERP_Product_Hierarchy_Level_8_Code__c='44';
            M3.ERP_Product_Hierarchy_Level_9_Code__c='FF';
            M3.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M3;
                        
            //Fetch Records to throw exception after validation insertRequest
            paProjectPrice.currentRequest.projectPrice=P7;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.materialFilter='D118123';
            try{
                paProjectPrice.action('','','FetchMaterialRecords');
            }
            catch(Exception e){}
            
            //addSelectedMaterialsToRequest throw exception after validation ValidateKeyValue
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.cpgFilter =null;
            paProjectPrice.currentRequest.incotermsFilter='IN-02-03';
            paProjectPrice.currentRequest.salesDistrictFilter='IN-02-03';
            paProjectPrice.currentRequest.endUserFilter='EU-02';
            paProjectPrice.currentRequest.shipToFilter='SH-02';
            paProjectPrice.currentRequest.countryFilter='IND-02-333';
            paProjectPrice.currentRequest.shipToCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.paymentTermsFilter='IND-02-333';
            paProjectPrice.currentRequest.marketSegmentFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup1Filter='IND-02-333';
            paProjectPrice.currentRequest.variantFilter='IND-02-333';
            paProjectPrice.currentRequest.contractFilter='IND-02-333';
            paProjectPrice.currentRequest.comPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.materialGroup5KeyFilter='IND-02-333';
            paProjectPrice.currentRequest.plantFilter='IND-02-333';
            paProjectPrice.currentRequest.shippingConditionFilter='IND-02-333';
            paProjectPrice.currentRequest.destinationCountryFilter='IND-02-333';
            paProjectPrice.currentRequest.salesOrderTypeFilter='IND-02-333';
            paProjectPrice.currentRequest.priceRefPartnerFilter='IND-02-333';
            paProjectPrice.currentRequest.endUseFilter='IND-02-333';
            paProjectPrice.currentRequest.partnerZFFilter='IND-02-333';
            paProjectPrice.currentRequest.payerFilter='IND-02-333';
            paProjectPrice.currentRequest.discRefNoFilter='IND-02-333';
            paProjectPrice.currentRequest.fixValDateFilter='IND-02-333';
            paProjectPrice.currentRequest.campaignFilter='IND-02-333';
            paProjectPrice.currentRequest.documentCurrencyFilter='IND-02-333';
            paProjectPrice.currentRequest.stateFilter='IND-02-333';
            
            
            try{
                 paProjectPrice.action('','','addSelectedPHToRequest');
                 
            }
            catch(Exception e){}
            
            //AddMaterialToRequest throw exception after validation ValidateRequest
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            paProjectPrice.currentRequest.cpgFilter =null;
            try{
                 paProjectPrice.action('','','AddMaterialToRequest');
            }
            catch(Exception e){}
            
            //Fetch Material Records
            paProjectPrice.currentRequest.projectPrice=P7;
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='TestClass'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/CPG/Material';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.materialFilter='D118123,D118125';
            paProjectPrice.relatedListFetchRecord= new List<PARelatedList>();
            paProjectPrice.action('','','FetchMaterialRecords');
            
            //addSelectedMaterialToRequest
            paProjectPrice.currentRequest.cpgFilter ='CPG-CPG Description';
            paProjectPrice.currentRequest.mpgFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.salesOfficeFilter ='MPG-MPG Description';
            paProjectPrice.currentRequest.priceListTypeFilter ='MPG-MPG Description'; 
            paProjectPrice.currentRequest.keyCombination.keyCombinationID=paKeyCombination.erpKeyCombination.id; 
            paProjectPrice.projectPrice.project_status__c='Approved';
            paProjectPrice.projectPrice.valid_From__c=system.today()+3;
            for(PARelatedList wRec1 : paProjectPrice.relatedListFetchRecord)
            {   
                for( PAWrapper w :  wRec1.wrapperList) 
                {
                    if(w.isSelected != true)
                    { 
                        w.isSelected=true;
                    }
                }
            }
            try{
                
                 paProjectPrice.action('','','addSelectedMaterialsToRequest');
            }
            catch(Exception e){}             
          
            //addMaterialToRequest
            Material__c M2= new Material__c();
            M2.Name='Corian Sheet';
            M2.ERP_Material_Code__c='D118124';
            M2.ERP_Source_Cluster__c='WB1';
            M2.ERP_Sales_Org_Code__c='D630';
            M2.ERP_Distribution_Channel_Code__c='10';
            M2.ERP_Deletion_Flag__c=false;
            M2.RecordTypeId=Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
            insert M2;
            paProjectPrice.currentRequest.materialFilter='D118124';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
             paProjectPrice.action('','','goToRequest');
            
            //to display error after validation (request)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c=null; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c=null;
            try{ Test.startTest();       
                     paProjectPrice.action('','','AddMaterialToRequest'); 
                  Test.stopTest();
               }
            catch(Exception e){}
            //to display error after validation (filter)
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter=null;
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            //to display error after validation (Material code)
            paProjectPrice.currentRequest.pricingRequest.Request_Name__c='Test'; 
            paProjectPrice.currentRequest.pricingRequest.Request_Reason__c='Time extention';
            paProjectPrice.currentRequest.materialFilter='D000000';
            try{        
                     paProjectPrice.action('','','AddMaterialToRequest'); 
               }
            catch(Exception e){}
            
            //
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/MPG/Sold to/Project Id/Material';
            paProjectPrice.currentRequest.mpgFilter =null; 
            

            paProjectPrice.editHeaderApproved = 'editHeaderApprovedProject';
            paProjectPrice.projectSelection = 'editApproved';                            
            
            
            
            //Fetch PH Records
            
            
            paProjectPrice.currentRequest.keyCombination.KeyCombinationName='Sales Org./Dist. Channel/Division/Sold to/Project Id/PH1/PH2/PH3/PH4/PH5/PH6';
            paProjectPrice.currentRequest.phFilter='A6##12';
            paProjectPrice.projectSelection='FetchRecords';
            paProjectPrice.currentRequest.lastPHLevelSelected=1;
            List<PARelatedList>  relatedList;
            try
            {
                relatedList= paProjectPrice.getListWrappers();
            }
            catch(exception e)
            {
                
            }

        }
    }
}