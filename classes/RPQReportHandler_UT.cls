@isTest
public class RPQReportHandler_UT {
          
     static testMethod void RPQReportHandlerTestMethod1(){
        Profile p1 =[SELECT Id FROM Profile where name='System Administrator'];
             // 12/30/2016 - Merge&Spin -Updated the test  class to update the insert of UserRole and User
           UserRole r= TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
            
           User u1 = TestUserUtil.createTestUser(r.id, p1.id, 'test fName', 'test lName');     
            insert u1;
           
            //creating RecordType
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];

            System.runAs(u1){
                
                 PAProfilePermissions__c paProfilePermissions = new PAProfilePermissions__c();
                    paProfilePermissions.Name = 'Sales Admin';
                    insert paProfilePermissions;
                    
                    PAProfilePermissions__c paProfilePermissions1 = new PAProfilePermissions__c();
                    paProfilePermissions1.Name = 'Approver';
                    insert paProfilePermissions1;
                    
                    PAProfilePermissions__c paProfilePermissions2 = new PAProfilePermissions__c();
                    paProfilePermissions2.Name = 'CSR';
                    insert paProfilePermissions2;
                    
                    PAProfilePermissions__c paProfilePermissions3 = new PAProfilePermissions__c();
                    paProfilePermissions3.Name = 'BU Admin';
                    insert paProfilePermissions3;
                    
                    PAProfilePermissions__c paProfilePermissions4 = new PAProfilePermissions__c();
                    paProfilePermissions4.Name = 'Price Requester';
                    insert paProfilePermissions4;
                    
                    PAProfilePermissions__c paProfilePermissions5 = new PAProfilePermissions__c();
                    paProfilePermissions5.Name = 'Project Group';
                    paProfilePermissions5.API_NAME__c = 'TestGroup';
                    insert paProfilePermissions5;
                    
                    PAProfilePermissions__c paProfilePermissions6 = new PAProfilePermissions__c();
                    paProfilePermissions6.Name = 'IT Admin';
                    insert paProfilePermissions6;
            
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
                
                Test.startTest();
                    Pricing_Request__c pricingRequest1 = new Pricing_Request__c();
                    pricingRequest1.Pricing_Request_Type__c = 'Permanent';
                    pricingRequest1.Request_Type__c = 'Customer Specific';
                    pricingRequest1.BU__c = 'DPT NA';
                    pricingRequest1.Sales_Org_Code__c = 'AD50';
                    pricingRequest1.Dist_Channel_Code__c = '10';
                    pricingRequest1.Division_Code__c = '02';
                    pricingRequest1.SoldTo_Code__c = '55470155';
                    pricingRequest1.Is_End_User_Rebate__c=true;
                    pricingRequest1.Request_Valid_From__c=vf;
                    pricingRequest1.Request_Valid_To__c=vt;
                    pricingRequest1.Request_Approval_Status__c='Draft';
                    pricingRequest1.End_User_Code__c = '55470156';
                    pricingRequest1.total_deal_value__c = 200;
                    pricingRequest1.Customer_Specific__c = true;
                    pricingRequest1.On_Behalf_Of__c = u1.id;
                    insert pricingRequest1;
                    
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
                    pricRequestItem1.SOLD_TO_CODE__C = '55470155';
                    pricRequestItem1.New_Rate__c = '10';
                    pricRequestItem1.Quantity__c = '10';
                    pricRequestItem1.Price_Reduction__c = 10;
                    
                    insert pricRequestItem1;
                    
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
                    erp1.SOLD_TO_CODE__C = '55470155';
                    erp1.UNIT__C = '%';
                    erp1.UOM__C = 'EA';
                    erp1.VALID_FROM__C = vf;
                    erp1.VALID_TO__C = vt;
                    erp1.isPriceHolder__c=true;
                    erp1.BU__c='DPT NA';
                    erp1.End_User_Code__c='55470156';
                    erp1.Pricing_Request__c = pricingRequest1.id;
                    erp1.Quantity__c = 10;
                    erp1.Discount__c = 10;
                    insert erp1;
                    
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
                    erp12.SOLD_TO_CODE__C = '55470155';
                    erp12.UNIT__C = '%';
                    erp12.UOM__C = 'EA';
                    erp12.VALID_FROM__C = vf;
                    erp12.VALID_TO__C = vt;
                    erp12.isPriceHolder__c=false;
                    erp12.Price_Holder__c=erp1.id;
                    erp12.BU__c='DPT NA';
                    erp12.End_User_Code__c='55470156';
                    erp12.Quantity__c = 10;
                    erp12.Discount__c = 10;
                    erp12.Pricing_Request__c = pricingRequest1.id;
                    insert erp12;
                    
                    pricingRequest1.Request_Approval_Status__c='Approved';
                    update pricingRequest1;
                    
                    
                    Pricing_Request__c pricingRequest2 = new Pricing_Request__c();
                    pricingRequest2.Pricing_Request_Type__c = 'Permanent';
                    pricingRequest2.Request_Type__c = 'Customer Specific';
                    pricingRequest2.BU__c = 'DPT NA';
                    pricingRequest2.Sales_Org_Code__c = 'AD50';
                    pricingRequest2.Dist_Channel_Code__c = '10';
                    pricingRequest2.Division_Code__c = '02';
                    pricingRequest2.SoldTo_Code__c = '55470155';
                    pricingRequest2.Is_End_User_Rebate__c=true;
                    pricingRequest2.Request_Valid_From__c=vf;
                    pricingRequest2.Request_Valid_To__c=vt;
                    pricingRequest2.Request_Approval_Status__c='Draft';
                    pricingRequest2.End_User_Code__c = '55470158';
                    pricingRequest2.total_deal_value__c = 200;
                    pricingRequest2.Customer_Specific__c = true;
                    pricingRequest2.On_Behalf_Of__c = u1.id;
                    
                    insert pricingRequest2;
                    
                    Pricing_Request_Item__c pricRequestItem2 = new Pricing_Request_Item__c();
                    
                    pricRequestItem2.CURRENCYISOCODE = 'USD';
                    pricRequestItem2.PRICING_REQUEST__C = pricingRequest2.Id;
                    pricRequestItem2.APPROVAL_STATUS__C = 'Draft';
                    pricRequestItem2.BELOW_CURRENT_FLAG__C = false;
                    pricRequestItem2.BELOW_FLOOR_FLAG__C = false;
                    pricRequestItem2.BELOW_REFERENCE_FLAG__C = false;
                    pricRequestItem2.COUNTRY__C = 'Germany';
                    pricRequestItem2.CUSTOMER_SPECIFIC__C = true;
                    pricRequestItem2.DIST_CHANNEL_CODE__C = '10';
                    pricRequestItem2.DIST_CHANNEL__C = 'DuPont Std';
                    pricRequestItem2.DIVISION_CODE__C = '02';
                    pricRequestItem2.DIVISION__C = 'GSD Standard';
                    pricRequestItem2.PRICING_CONDITION_CODE__C = 'ZPNG';
                    pricRequestItem2.PRICING_CONDITION__C = 'Gross Price';
                    pricRequestItem2.NEW_VALID_FROM__C = vf;
                    pricRequestItem2.NEW_VALID_TO__C = vt;
                    pricRequestItem2.End_User_Code__c ='55470158';
                    pricRequestItem2.KEY_COMBINATION_CODE__C = 'A790';
                    pricRequestItem2.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                    pricRequestItem2.SALES_ORG_CODE__C = 'AD50';
                    pricRequestItem2.MATERIAL_CODE__C = 'D11992510';
                    pricRequestItem2.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                    pricRequestItem2.UNIT__C = '%';
                    pricRequestItem2.UOM__C = 'EA';
                    pricRequestItem2.NEW_PER__C = 1;
                    pricRequestItem2.Rate__c = '10';
                    pricRequestItem2.SOLD_TO_CODE__C = '55470155';
                    pricRequestItem2.New_Rate__c = '10';
                    pricRequestItem2.Quantity__c = '10';
                    pricRequestItem2.Price_Reduction__c = 10;
                    
                    insert pricRequestItem2;
                    
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
                    erp2.SOLD_TO_CODE__C = '55470155';
                    erp2.UNIT__C = '%';
                    erp2.UOM__C = 'EA';
                    erp2.VALID_FROM__C = vf;
                    erp2.VALID_TO__C = vt;
                    erp2.isPriceHolder__c=true;
                    erp2.BU__c='DPT NA';
                    erp2.End_User_Code__c='55470158';
                    erp2.Quantity__c = 10;
                    erp2.Pricing_Request__c = pricingRequest2.id;
                    erp2.Discount__c = 10;
                    insert erp2;
                    
                    Rebate_Quote_Price__c erp22=new Rebate_Quote_Price__c();
                    erp22.Sales_Pricing_Procedure__c=buOrgGroup.ERP_Pricing_Procedure__c;
                    erp22.CURRENCYISOCODE = 'USD';
                    erp22.COUNTRY__C = 'Germany';
                    erp22.Distribution_Channel_Code__c = '10';
                    erp22.DIST_CHANNEL__C = 'DuPont Std';
                    erp22.DIVISION_CODE__C = '02';
                    erp22.DIVISION__C = 'GSD Standard';
                    erp22.KEY_COMBINATION_CODE__C = 'A790';
                    erp22.KEY_COMBINATION__C = 'Sales Org./Dist. Channel/Division/Sold to/End User/Material';
                    erp22.MATERIAL_CODE__C = 'D11992510';
                    erp22.MATERIAL__C = 'C POP UP SPACE SAVING BASKET DRAINER';
                    erp22.PER__C = 1;
                    erp22.PRICING_CONDITION_CODE__C = 'ZPNG';
                    erp22.PRICING_CONDITION__C = 'Gross Price';
                    erp22.Rate__c = 10;
                    erp22.SAP_APPLICATION_ID__C = 'V';
                    erp22.SAP_CLIENT_ID__C = '510';
                    erp22.SALES_ORG_CODE__C = 'AD50';
                    erp22.SALES_ORG__C = 'Surf Dup Disa 3640';
                    erp22.SOLD_TO_CODE__C = '55470155';
                    erp22.UNIT__C = '%';
                    erp22.UOM__C = 'EA';
                    erp22.VALID_FROM__C = vf;
                    erp22.VALID_TO__C = vt;
                    erp22.isPriceHolder__c=false;
                    erp22.Price_Holder__c=erp2.id;
                    erp22.BU__c='DPT NA';
                    erp22.End_User_Code__c='55470158';
                    erp22.Quantity__c = 10;
                    erp22.Pricing_Request__c = pricingRequest2.id;
                    erp22.Discount__c = 10;
                    insert erp22;
                    
                    pricingRequest2.Request_Approval_Status__c='Approved';
                    update pricingRequest2;
                    
                    PAOrganizationalGroupItems po = new PAOrganizationalGroupItems();
                    PAServiceState ps = new PAServiceState();
                    ps.ogitems = po;
                    ps.ogitems.selectedBU=orgGroup1.id;
                    ps.ogitems.buIdToNameMap = new Map<Id,String>();
                    ps.ogitems.buIdToNameMap.put(orgGroup1.id,'DPT NA');
                    RPQReportHandler rpqHp = new RPQReportHandler();
                    RPQReportHandler rpqH = new RPQReportHandler(ps);
                    rpqH.selectedBUName = 'DPT NA';
                    rpqH.loadState();
                    rpqH.selectedReport='1';
                    rpqH.RunReport1();
                    rpqH.fetchChartData();
                    rpqH.selectedReport='2';
                    rpqH.RunReport2();
                    rpqH.fetchChartData();
                    rpqH.selectedReport='3';
                    rpqH.RunReport3();
                    rpqH.fetchChartData();
                    rpqH.selectedReport='4';
                    rpqH.RunReport4();
                    rpqH.fetchChartData();
                    rpqH.getName();
                    rpqH.action('a','b','c');
                    rpqH.validate('a');
                    rpqH.deleteRecord();
                    rpqH.save();
                    rpqH.getListWrappers();
                    rpqH.getListOptions();
                    rpqH.getListBusinessComponents();
                    rpqH.businessaction = 'exportRPQ';
                    rpqH.ExportData();
                    
                Test.stopTest();
            }
     }
}