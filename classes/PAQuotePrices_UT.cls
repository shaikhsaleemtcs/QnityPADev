@isTest
public class PAQuotePrices_UT {
     
     static testMethod void PAQuotePricesTestMethod1(){
            Profile p1 =[SELECT Id FROM Profile where name='System Administrator'];
         // 12/29/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
            UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
            
          /*  User u1 = new User(Alias='sam', Email='ibtesamuddin_MMMM@infosys.comm', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='mh8654',
                         External_ERP_ID__c='123353',UserRoleId=r.id,profileid = p1.id,
                         Username='ibtesamuddin_MMMM@infosys.comm.utqa',
                         LastName='Mohd', CommunityNickname='sam',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');*/
         User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');   
         insert u1;
            //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];

            System.runAs(u1){
                  String priceType='Reference';
                  List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
                  profilePermissionList = TestCustomSettingUtil.testPAProfilePermissions();
                  insert profilePermissionList;
                  
                  
            Date vf = system.today();
            Date vt = system.today().addDays(1);
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='DPT NA A250,AD50,D650 Sales Pricing Procedure',
            Pricing_Procedure_Description__c='DPT NA Sales Pricing Procedure 1',Pricing_Procedure__c='DPT NA Sales Pricing Procedure 1',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='WB1');
            insert pp;
         
            //Pricing Condition
            List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
            pcList.add(new ERP_Pricing_Condition__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='WB1',
                                                Pricing_Condition_Code__c='ZPNG',pricing_Condition__c='Gross Price',
                                                Calculation_Type__c='Quantity'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XFLR1'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='XREF1'));
            pcList.add(new ERP_Pricing_Condition__c(Pricing_Condition_Code__c='ZCOST'));
            insert pcList;
            
            //Key Combination         
            List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A815',key_combination__c='Sales Org./Dist. Channel/Division/Customer Price Group/Material',
                                                 Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Customer Price Group Code/Material Code-Sales Org./Dist. Channel/Division/Customer Price Group/Material'));                      
            kcList.add(new ERP_Key_Combination__c(SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1',
                                                 Key_Combination_Code__c='A790',key_combination__c='Sales Org./Dist. Channel/Division/Sold to/End User/Material',
                                                 Key_Combination_Tech__c='Sales Org. Code/Dist. Channel Code/Division Code/Sold to Code/End User Code/Material Code-Sales Org./Dist. Channel/Division/Sold to/End User/Material'));                      
            
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='X120'));
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='A790'));
            kcList.add(new ERP_Key_Combination__c(Key_Combination_Code__c='XCOST'));
            insert kcList;
            
            ERP_Access_Sequence__c acSq = new ERP_Access_Sequence__c(Sales_Pricing_Procedure__c=pp.id,Floor_Pricing_Condition__c=pcList[1].id,
                                                Is_End_User_Rebate__c=true,Pricing_Condition__c=pcList[0].id,Reference_Pricing_Condition__c=pcList[2].id,
                                                Pricing_Key_Combination__c=kcList[0].id,Floor_Key_Combination__c=kcList[1].id,Reference_Key_Combination__c=kcList[1].id,
                                                Cost_Pricing_Condition__c=pcList[3].id,Cost_Key_Combination__c=kcList[3].id);
            
            insert acSq;
          
            OrgGroup__c orgGroup1 = new OrgGroup__c(Business__c='DPT NA',RecordTypeId=rType.id,ERP_Sales_Org_Code__c='AD50',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            OrgGroup__c orgGroup2 = new OrgGroup__c(ERP_Sales_Org_Code__c='AD50',ERP_Distribution_Channel_Code__c='10',ERP_Division_Code__c='02');
            Insert orgGroup1;
            Insert orgGroup2;
          
            Organizational_Group_Item__c buOrgGroup=new  Organizational_Group_Item__c();
            buOrgGroup.Business__c=orgGroup1.id;
            buOrgGroup.OrgGroup__c=orgGroup2.id;
            buOrgGroup.ERP_Pricing_Procedure__c=pp.id; 
            buOrgGroup.Retroactive_Limit__c=0;
            insert buOrgGroup;
            
            PAQuery__c pq = new PAQuery__c();
            pq.Variable__c = 'priApprovedList';
            pq.Class__c = 'Trig_validatePriceAUNew';
            pq.Query__c = 'SELECT New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,New_Volume__c, Price_Reduction__c, New_Volume_UoM__c,Ship_To_Country__c,Ship_To_Country_Code__c,country_code__c, Pricing_Request__r.End_User__c,Pricing_Request__r.End_User_Code__c,Pricing_Request__r.Sold_To__c,Pricing_Request__r.SoldTo_Code__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c, ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Sales_Order_Type_Code__c,Sales_Order_Type__c,Valid_To__c,BU__c, Valid_From__c, UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp, Stamp_Reference_Price__c, Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, ShipTo_Code__c, Scaled_Price_Flag__c, Scale_UoM_Scale_Unit__c, Scale_Type__c, Scale_Type_Code__c, Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c, Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, Scale_Quantity_Scale_Value10__c, Scale_Basis__c, Scale_Basis_Code__c, ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c, ScaleRate10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Customer_Hierarchy__c, Customer_Hierarchy_Code__c, Sales_Office_Code__c, SAP_Cluster__c, SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c, Profit_Center__c, Profit_Center_Code__c, Product_Hierarchy__c, Product_Hierarchy_Code__c, Pricing_Task_UoM__c, Pricing_Request__c,Pricing_Request__r.Request_Type__c,Pricing_Request__r.Customer_Specific__c,Pricing_Request__r.On_Behalf_Of__c, Pricing_Request_Type__c, Pricing_Condition__c, Pricing_Condition_Code__c, Price_List_Type__c, Price_List_Type_Code__c, Plus_Minus__c, Plus_Minus_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c, PH7_Code__c, PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, PH2_Code__c, PH1__c, PH1_Code__c, PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c, New_Per__c, Name, Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, LastModifiedById, LastActivityDate, Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, Incoterms2__c, Inco_terms__c, Id, Gap__c, Gap_Pricing_Request_Item__c, Expire__c, End_User__c, End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c, ERP_Pricing_Procedure__c, Division__c, Division_Code__c, Dist_Channel__c, Dist_Channel_Code__c, Disc_Ref__c, Customer_Specific__c, Customer_Price_Group__c, Customer_Price_Group_Code__c, Currency__c, CurrencyIsoCode,CreatedDate, CreatedById, Country__c, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c, Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c, Below_Reference_Price__c, Below_Reference_Flag__c, Below_Floor_Price__c, Below_Floor_Flag__c, Below_Current_Flag__c, Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c ,Pricing_Request__r.OwnerId,Price_Ref_Partner__c,Price_Ref_Partner_Code__c, ERP_Pricing_Procedure__r.SAP_Cluster__c,Material_Group_1__c, Material_Group_1_Code__c,Char_Name__c,Kcode__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Pricing_request_item__c';
            insert pq;
            
            Test.startTest();
            
                Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
                pricingRequest1.Pricing_Request_Type__c = 'Permanent';
                pricingRequest1.Request_Type__c = 'Customer Specific';
                pricingRequest1.BU__c = 'DPT NA';
                pricingRequest1.Sales_Org_Code__c = 'AD50';
                pricingRequest1.Dist_Channel_Code__c = '10';
                pricingRequest1.Division_Code__c = '02';
                pricingRequest1.SoldTo_Code__c = 'T001';
                pricingRequest1.Is_End_User_Rebate__c=true;
                pricingRequest1.Request_Valid_From__c=vf;
                pricingRequest1.Request_Valid_To__c=vt;
                
                insert pricingRequest1;
                
                List<Pricing_Request_Item__c> pricingReqItemToUpdate = new List<Pricing_Request_Item__c>();
                
                Pricing_Request_Item__c pricRequestItem1 = new Pricing_Request_Item__c();
                
                pricRequestItem1.CURRENCYISOCODE = 'USD';
                pricRequestItem1.PRICING_REQUEST__C = pricingRequest1.Id;
                pricRequestItem1.APPROVAL_STATUS__C = 'Draft';
                pricRequestItem1.BELOW_CURRENT_FLAG__C = false;
                pricRequestItem1.BELOW_FLOOR_FLAG__C = false;
                pricRequestItem1.BELOW_REFERENCE_FLAG__C = false;
                pricRequestItem1.COUNTRY__C = 'Germany';
                pricRequestItem1.CUSTOMER_SPECIFIC__C = true;
                pricRequestItem1.DIST_CHANNEL_CODE__C = '10';
                pricRequestItem1.DIST_CHANNEL__C = 'DuPont Std';
                pricRequestItem1.DIVISION_CODE__C = '02';
                pricRequestItem1.DIVISION__C = 'GSD Standard';
                pricRequestItem1.PRICING_CONDITION_CODE__C = 'ZPNG';
                pricRequestItem1.PRICING_CONDITION__C = 'Gross Price';
                pricRequestItem1.NEW_VALID_FROM__C = vf;
                pricRequestItem1.NEW_VALID_TO__C = vt;
                pricRequestItem1.End_User_Code__c ='55470156';
                pricRequestItem1.KEY_COMBINATION_CODE__C = 'A790';
                pricRequestItem1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                pricRequestItem1.SALES_ORG_CODE__C = 'AD50';
                pricRequestItem1.MATERIAL_CODE__C = 'D11992510';
                pricRequestItem1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                pricRequestItem1.UNIT__C = '%';
                pricRequestItem1.UOM__C = 'EA';
                pricRequestItem1.NEW_PER__C = 1;
                pricRequestItem1.Rate__c = '10';
                pricRequestItem1.SOLD_TO_CODE__C = '55470156';
                pricRequestItem1.New_Rate__c = '10';
                pricRequestItem1.Quantity__c = '10';
                pricRequestItem1.Price_Reduction__c = 10;
                
                pricingReqItemToUpdate.add(pricRequestItem1);
                
                Pricing_Request_Item__c pricRequestItem12 = new Pricing_Request_Item__c();
                
                pricRequestItem12.CURRENCYISOCODE = 'USD';
                pricRequestItem12.PRICING_REQUEST__C = pricingRequest1.Id;
                pricRequestItem12.APPROVAL_STATUS__C = 'Draft';
                pricRequestItem12.BELOW_CURRENT_FLAG__C = false;
                pricRequestItem12.BELOW_FLOOR_FLAG__C = false;
                pricRequestItem12.BELOW_REFERENCE_FLAG__C = false;
                pricRequestItem12.COUNTRY__C = 'Germany';
                pricRequestItem12.CUSTOMER_SPECIFIC__C = true;
                pricRequestItem12.DIST_CHANNEL_CODE__C = '10';
                pricRequestItem12.DIST_CHANNEL__C = 'DuPont Std';
                pricRequestItem12.DIVISION_CODE__C = '02';
                pricRequestItem12.DIVISION__C = 'GSD Standard';
                pricRequestItem12.PRICING_CONDITION_CODE__C = 'ZPNG';
                pricRequestItem12.PRICING_CONDITION__C = 'Gross Price';
                pricRequestItem12.NEW_VALID_FROM__C = vf;
                pricRequestItem12.NEW_VALID_TO__C = vt;
                pricRequestItem12.End_User_Code__c ='55470156';
                pricRequestItem12.KEY_COMBINATION_CODE__C = 'A790';
                pricRequestItem12.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                pricRequestItem12.SALES_ORG_CODE__C = 'AD50';
                pricRequestItem12.MATERIAL_CODE__C = 'D19992510';
                pricRequestItem12.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                pricRequestItem12.UNIT__C = '%';
                pricRequestItem12.UOM__C = 'EA';
                pricRequestItem12.NEW_PER__C = 1;
                pricRequestItem12.Rate__c = '10';
                pricRequestItem12.SOLD_TO_CODE__C = '55470156';
                pricRequestItem12.New_Rate__c = '10';
                pricRequestItem12.Quantity__c = '10';
                pricRequestItem12.Price_Reduction__c = 10;
                
                pricingReqItemToUpdate.add(pricRequestItem12);
                
                
                Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
                pricRequestItem2.CURRENCYISOCODE = 'USD';
                pricRequestItem2.PRICING_REQUEST__C = pricingRequest1.Id;
                pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
                pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
                pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
                pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
                pricRequestItem2.COUNTRY__C = 'Germany';
                pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
                pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
                pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
                pricRequestItem2.DIVISION_CODE__C = '2';
                pricRequestItem2.DIVISION__C = 'GSD Standard';
                
                pricRequestItem2.EXPIRE__C = false;
                pricRequestItem2.GAP__C = false;
                pricRequestItem2.KEY_COMBINATION_CODE__C = 'A790';
                pricRequestItem2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                pricRequestItem2.MATERIAL_CODE__C = 'D11992510';
                pricRequestItem2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                pricRequestItem2.NEW_PER__C = 1;
                pricRequestItem2.NON_COMMERCIAL_PRODUCTS__C = false;
                pricRequestItem2.PH1_CODE__C = 'A6';
                pricRequestItem2.PH2_CODE__C = 'S1';
                pricRequestItem2.PH3_CODE__C = '13';
                pricRequestItem2.PER__C = 1; 
                 
                pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
                pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
                pricRequestItem2.PRICING_REQUEST_TYPE__C = 'Permanent';
                pricRequestItem2.PRODUCT_HIERARCHY_CODE__C = 'A6S113############';
                pricRequestItem2.Rate__c = '10';
                pricRequestItem2.SAP_APPLICATION_ID__C = 'V';
                pricRequestItem2.SAP_CLIENT_ID__C = '510';
                pricRequestItem2.SALES_ORG_CODE__C = 'AD50';
                pricRequestItem2.SALES_ORG__C = 'Surf Dup Disa 3640';
                pricRequestItem2.SCALED_PRICE_FLAG__C = true;
                pricRequestItem2.SOLD_TO_CODE__C = '55470156';
                pricRequestItem2.UNIT__C = '%';
                pricRequestItem2.UOM__C = 'EA';
                pricRequestItem2.VALID_FROM__C = Date.newInstance(2013, 10,10);
                pricRequestItem2.VALID_TO__C = Date.newInstance(2014, 10,10);
                pricRequestItem2.NEW_VALID_FROM__C = vf;
                pricRequestItem2.NEW_VALID_TO__C = vt;
                pricRequestItem2.EDIT__C = false;
                pricRequestItem2.NEW__C = false;
                pricRequestItem2.SCALE_BASIS__C = 'Quantity';
                pricRequestItem2.SCALE_TYPE__C = 'From';
                //pricRequestItem2.SCALE__C = 'Ascending';
                pricRequestItem2.Country__c='INDIA';
                pricRequestItem2.Country_Code__c='IN';
                pricRequestItem2.Customer_Price_Group__c='TEST';
                pricRequestItem2.Customer_Price_Group_Code__c='A';
                pricRequestItem2.Disc_Ref__c='01';
                pricRequestItem2.End_Use__c='TEST';
                pricRequestItem2.End_User_Code__c ='55470156';
                pricRequestItem2.Market_Segment__c='TESTM';
                pricRequestItem2.Market_Segment_Code__c='TEST';
                pricRequestItem2.Material_Price_Group__c='Price Group 1';
                pricRequestItem2.Material_Price_Group_Code__c='P';
                pricRequestItem2.Price_List_Type__c='TEST';
                pricRequestItem2.Price_List_Type_Code__c='P1';
                pricRequestItem2.Price_Ref_Partner__c='TEST';
                pricRequestItem2.Price_Ref_Partner_Code__c='55470156';
                pricRequestItem2.Sales_Office__c='A615';
                pricRequestItem2.Sales_Office_Code__c='TESTSALESOFFICE';
                pricRequestItem2.Terms_Of_Payment__c='TEST';
                pricRequestItem2.Terms_Of_Payment_Code__c='TEST';
                pricRequestItem2.ShipTo__c='TEST';
                pricRequestItem2.ShipTo_Code__c='55470156';
                pricRequestItem2.New_Rate__c = '10';
                pricRequestItem2.Quantity__c = '10';
                pricRequestItem2.Price_Reduction__c = 10;
                pricRequestItem2.Payer_Code__c = 'ABC';
                
                pricingReqItemToUpdate.add(pricRequestItem2);
                //end 
                
                //To cover KC SAP for expire scenario
                Pricing_Request_Item__c pricRequestItem3 = new Pricing_Request_Item__c();
                pricRequestItem3=pricRequestItem2.clone(false,true);
                pricRequestItem3.Expire__c=true;
                pricingReqItemToUpdate.add(pricRequestItem3);
                
                Pricing_Request_Item__c pricRequestItem4 = new Pricing_Request_Item__c();
                pricRequestItem4.CURRENCYISOCODE = 'USD';
                pricRequestItem4.PRICING_REQUEST__C = pricingRequest1.Id;
                pricRequestItem4.APPROVAL_STATUS__C = 'Draft';
                pricRequestItem4.BELOW_CURRENT_FLAG__C = false;
                pricRequestItem4.BELOW_FLOOR_FLAG__C = false;
                pricRequestItem4.BELOW_REFERENCE_FLAG__C = false;
                pricRequestItem4.COUNTRY__C = 'Germany';
                pricRequestItem4.CUSTOMER_SPECIFIC__C = true;
                pricRequestItem4.DIST_CHANNEL_CODE__C = '10';
                pricRequestItem4.DIST_CHANNEL__C = 'DuPont Std';
                pricRequestItem4.DIVISION_CODE__C = '02';
                pricRequestItem4.DIVISION__C = 'GSD Standard';
                pricRequestItem4.PRICING_CONDITION_CODE__C = 'ZPNG';
                pricRequestItem4.PRICING_CONDITION__C = 'Gross Price';
                pricRequestItem4.NEW_VALID_FROM__C = vf;
                pricRequestItem4.NEW_VALID_TO__C = vt;
                pricRequestItem4.End_User_Code__c ='55470166';
                pricRequestItem4.KEY_COMBINATION_CODE__C = 'A790';
                pricRequestItem4.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                pricRequestItem4.SALES_ORG_CODE__C = 'AD50';
                pricRequestItem4.MATERIAL_CODE__C = 'D11992510';
                pricRequestItem4.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                pricRequestItem4.UNIT__C = '%';
                pricRequestItem4.UOM__C = 'EA';
                pricRequestItem4.NEW_PER__C = 1;
                pricRequestItem4.Rate__c = '10';
                pricRequestItem4.SOLD_TO_CODE__C = '55470165';
                pricRequestItem4.New_Rate__c = '10';
                pricRequestItem4.Quantity__c = '10';
                pricRequestItem4.Price_Reduction__c = 10;
                
                pricingReqItemToUpdate.add(pricRequestItem4);

                insert pricingReqItemToUpdate;
                
                List<Rebate_Quote_Price__c> erpListToInsert=new List<Rebate_Quote_Price__c>();
                //Holder1
    
                Rebate_Quote_Price__c erp1=new Rebate_Quote_Price__c();
                erp1.Sales_Pricing_Procedure__c=buOrgGroup.ERP_Pricing_Procedure__c;
                erp1.CURRENCYISOCODE = 'USD';
                erp1.COUNTRY__C = 'Germany';
                erp1.Distribution_Channel_Code__c = '10';
                erp1.DIST_CHANNEL__C = 'DuPont Std';
                erp1.DIVISION_CODE__C = '02';
                erp1.DIVISION__C = 'GSD Standard';
                erp1.KEY_COMBINATION_CODE__C = 'A790';
                erp1.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                erp1.MATERIAL_CODE__C = 'D11992510';
                erp1.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                erp1.PER__C = 1;
                erp1.PRICING_CONDITION_CODE__C = 'ZPNG';
                erp1.PRICING_CONDITION__C = 'Gross Price';
                erp1.Rate__c = 10;
                erp1.SAP_APPLICATION_ID__C = 'V';
                erp1.SAP_CLIENT_ID__C = '510';
                erp1.SALES_ORG_CODE__C = 'AD50';
                erp1.SALES_ORG__C = 'Surf Dup Disa 3640';
                erp1.SOLD_TO_CODE__C = '55470156';
                erp1.UNIT__C = '%';
                erp1.UOM__C = 'EA';
                erp1.VALID_FROM__C = vf-1;
                erp1.VALID_TO__C = vf-1;
                erp1.isPriceHolder__c=true;
                erp1.BU__c='DPT NA';
                erp1.End_User_Code__c='55470156';
                erpListToInsert.add(erp1);
                
                Rebate_Quote_Price__c erp12=new Rebate_Quote_Price__c();
                erp12.Sales_Pricing_Procedure__c=buOrgGroup.ERP_Pricing_Procedure__c;
                erp12.CURRENCYISOCODE = 'USD';
                erp12.COUNTRY__C = 'Germany';
                erp12.Distribution_Channel_Code__c = '10';
                erp12.DIST_CHANNEL__C = 'DuPont Std';
                erp12.DIVISION_CODE__C = '02';
                erp12.DIVISION__C = 'GSD Standard';
                erp12.KEY_COMBINATION_CODE__C = 'A790';
                erp12.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                erp12.MATERIAL_CODE__C = 'D11992510';
                erp12.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                erp12.PER__C = 1;
                erp12.PRICING_CONDITION_CODE__C = 'ZPNG';
                erp12.PRICING_CONDITION__C = 'Gross Price';
                erp12.Rate__c = 10;
                erp12.SAP_APPLICATION_ID__C = 'V';
                erp12.SAP_CLIENT_ID__C = '510';
                erp12.SALES_ORG_CODE__C = 'AD50';
                erp12.SALES_ORG__C = 'Surf Dup Disa 3640';
                erp12.SOLD_TO_CODE__C = '55470156';
                erp12.UNIT__C = '%';
                erp12.UOM__C = 'EA';
                erp12.VALID_FROM__C = vf-1;
                erp12.VALID_TO__C = vf-1;
                erp12.isPriceHolder__c=true;
                erp12.BU__c='DPT NA';
                erp12.End_User_Code__c='55470156';
                //pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c
                insert erp12;
                 
                Rebate_Quote_Price__c erp13=new Rebate_Quote_Price__c();
                erp13.Sales_Pricing_Procedure__c=buOrgGroup.ERP_Pricing_Procedure__c;
                erp13.CURRENCYISOCODE = 'USD';
                erp13.COUNTRY__C = 'Germany';
                erp13.Distribution_Channel_Code__c = '10';
                erp13.DIST_CHANNEL__C = 'DuPont Std';
                erp13.DIVISION_CODE__C = '02';
                erp13.DIVISION__C = 'GSD Standard';
                erp13.KEY_COMBINATION_CODE__C = 'A790';
                erp13.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                erp13.MATERIAL_CODE__C = 'D11992510';
                erp13.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                erp13.PER__C = 1;
                erp13.PRICING_CONDITION_CODE__C = 'ZPNG';
                erp13.PRICING_CONDITION__C = 'Gross Price';
                erp13.Rate__c = 10;
                erp13.SAP_APPLICATION_ID__C = 'V';
                erp13.SAP_CLIENT_ID__C = '510';
                erp13.SALES_ORG_CODE__C = 'AD50';
                erp13.SALES_ORG__C = 'Surf Dup Disa 3640';
                erp13.SOLD_TO_CODE__C = '55470156';
                erp13.UNIT__C = '%';
                erp13.UOM__C = 'EA';
                erp13.VALID_FROM__C = vf-1;
                erp13.VALID_TO__C = vf-1;
                erp13.isPriceHolder__c=false;
                erp13.Price_Holder__c = erp12.id;
                erp13.BU__c='DPT NA';
                erp13.End_User_Code__c='55470156';
                //pri.BU__c+'-'+pri.Sales_Org_Code__c+'-'+pri.Pricing_Condition_Code__c+'-'+pri.Key_Combination_Code__c+'-'+pri.PCKC__c
                erpListToInsert.add(erp13);
                
                Rebate_Quote_Price__c erp2=new Rebate_Quote_Price__c();
                erp2.Sales_Pricing_Procedure__c=buOrgGroup.ERP_Pricing_Procedure__c;
                erp2.CURRENCYISOCODE = 'USD';
                erp2.COUNTRY__C = 'Germany';
                erp2.Distribution_Channel_Code__c = '10';
                erp2.DIST_CHANNEL__C = 'DuPont Std';
                erp2.DIVISION_CODE__C = '02';
                erp2.DIVISION__C = 'GSD Standard';
                erp2.KEY_COMBINATION_CODE__C = 'A790';
                erp2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                erp2.MATERIAL_CODE__C = 'D11992510';
                erp2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                erp2.PER__C = 1;
                erp2.PRICING_CONDITION_CODE__C = 'ZPNG';
                erp2.PRICING_CONDITION__C = 'Gross Price';
                erp2.Rate__c = 10;
                erp2.SAP_APPLICATION_ID__C = 'V';
                erp2.SAP_CLIENT_ID__C = '510';
                erp2.SALES_ORG_CODE__C = 'AD50';
                erp2.SALES_ORG__C = 'Surf Dup Disa 3640';
                erp2.SOLD_TO_CODE__C = '55470165';
                erp2.UNIT__C = '%';
                erp2.UOM__C = 'EA';
                erp2.VALID_FROM__C = vf-1;
                erp2.VALID_TO__C = vf-1;
                erp2.isPriceHolder__c=true;
                erp2.BU__c='DPT NA';
                erp2.End_User_Code__c='55470166';
                erpListToInsert.add(erp2);

                insert erpListToInsert;
                  
                pricingRequest1.Request_Approval_Status__c='Approved';
                update pricingRequest1;
    
            Test.stopTest();
        }
     } 
}