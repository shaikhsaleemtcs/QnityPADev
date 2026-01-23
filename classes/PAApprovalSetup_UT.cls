@isTest //(SeeAllData=true)
public class PAApprovalSetup_UT {  
  
    static testMethod void paApprovalSetupTestMethod12() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
                
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
       PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
        approvalsetup.selectedBU = NULL;
        approvalsetup.distChannel = NULL;
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Matl grp1';
        insert erp;
        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Customer Group 2';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Sales District';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 5';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Plant';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Shipping Condition';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Destination Country';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Reason Code';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Payer';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Partner ZF';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB5';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB6';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB7';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB8';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB9';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'FRB10';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Campaign';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Document Currency';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'State';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;

        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
        approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
		
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Sales District';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Matl grp1';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Material Group 5';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Plant';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Shipping Condition';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Destination Country';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Reason Code';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        Test.startTest();
				        approvalSetup.keyField = 'Payer';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'Partner ZF';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB4';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB5';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB6';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB7';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB8';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB9';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
						        approvalSetup.keyField = 'FRB10';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
								        approvalSetup.keyField = 'Campaign';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
								        approvalSetup.keyField = 'Document Currency';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
								        approvalSetup.keyField = 'State';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		Test.stopTest();
        
    }
    
    static testMethod void paApprovalSetupTestMethod2() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'frbnum';
        insert erp;
        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'ComPartner';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
                        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 3';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
       /* approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'PH2';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Sales Office';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'End Use';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
        approvalSetup.keyField = 'Market Segment';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
       /* approvalSetup.keyField = 'Customer Group 2';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
        approvalSetup.keyField = 'frbnum';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'ComPartner';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        //approvalSetup.keyField = 'Sales Org';
        //approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Variant';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Sales Order Type';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Product Hierarchy';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
                         
        approvalSetup.lookupOfVar = 'Approver';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.allotherMixedLookup = 'allothervalues';
        approvalSetup.lookupOfVar = 'Approver';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.SelectedBu = '--None--';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = NULL;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = NULL;
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = NULL;
        approvalSetup.enableRequestClassFlag = false;
                 
        
        approvalSetup.requestClass='Test;Test';
        List<SelectOption> options = approvalSetup.requestClassList;
        List<SelectOption> options2 = approvalSetup.RequestTypeOptionsList;
        approvalSetup.requestTypeFilter = 'Customer Specific%';
        List<SelectOption> options3 = approvalSetup.PriceCategoryOptionsList;
        approvalSetup.requestTypeFilter = 'Non Customer Specific%';
        List<SelectOption> options4 = approvalSetup.PriceCategoryOptionsList;
        approvalSetup.requestTypeFilter = 'xyz';
        List<SelectOption> options5 = approvalSetup.PriceCategoryOptionsList;
        
        Test.startTest();
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
      /*  approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        
        approvalSetup.onEditClick = false;
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        approvalSetup.adminMaster = adminMaster;
        
        approvalSetup.action('PAHome', 'PAHome', 'deleteAdminMasterRecord');
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.getApproverRoles();
        approvalSetup.getListBusinessComponents();
        approvalSetup.getListWrappers();
        approvalSetup.setupObjforDisplayList.add(setupObj);*/
        approvalSetup.allothermixedLookup = 'mixedValues';
        approvalSetup.selectedAppValue='value';
        approvalSetup.action('PAHome', 'PAHome', 'closeAddApproverDisplay');
    }
    
     static testMethod void paApprovalSetupTestMethod10() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
       PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
        approvalsetup.selectedBU = NULL;
        approvalsetup.distChannel = NUll;
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Sales Office';
        insert erp;
        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 3';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        /*erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Plant';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Shipping Condition';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Destination Country';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;*/
        
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
        approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'PH2';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        //approvalSetup.keyField = 'FRB';
        //approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Sales Office';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'End Use';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
     /*   approvalSetup.keyField = 'Market Segment';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
        approvalSetup.keyField = 'Customer Group 2';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        /*approvalSetup.keyField = 'Plant';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Shipping Condition';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Destination Country';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
      /*  approvalSetup.keyField = 'Sales Office';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        //approvalSetup.keyField = 'Sales Org';
        //approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Variant';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Sales Order Type';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Product Hierarchy';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
                
        approvalSetup.lookupOfVar = 'Approver';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.allotherMixedLookup = 'allothervalues';
        approvalSetup.lookupOfVar = 'Approver';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.SelectedBu = '--None--';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = NULL;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = NULL;
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = NULL;
        approvalSetup.enableRequestClassFlag = false;
        
        approvalSetup.requestClass='Test;Test';
        List<SelectOption> options = approvalSetup.requestClassList;
        
        Test.startTest();
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');*/
        
        approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        
        approvalSetup.onEditClick = false;
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        approvalSetup.adminMaster = adminMaster;
        
        approvalSetup.action('PAHome', 'PAHome', 'deleteAdminMasterRecord');
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.getApproverRoles();
        approvalSetup.getListBusinessComponents();
        approvalSetup.getListWrappers();
        approvalSetup.setupObjforDisplayList.add(setupObj);
        approvalSetup.allothermixedLookup = 'allothervalues';
        /*approvalSetup.selectedAppValue='value';
        approvalSetup.action('PAHome', 'PAHome', 'closeAddApproverDisplay');*/
    }
    static testMethod void paApprovalSetupTestMethod() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
       PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';  
        approvalSetup.adminMaster.Request_Class__c = 'Test';    
        if(userList!=null){
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        }
        approvalSetup.selectedKeyFieldValue='Test'; //for fixing arguement cannot be null issue
        approvalSetup.action('PAHome', 'PAHome', 'SubmitCalculation');
        approvalSetup.action('PAHome', 'PAHome', 'displaySpot');
        approvalSetup.action('PAHome', 'PAHome', 'nullifySalesArea');
        approvalSetup.action('PAHome', 'PAHome', 'displayCountry');
        approvalSetup.action('PAHome', 'PAHome', 'selectCountry');
       /* approvalSetup.action('PAHome', 'PAHome', 'closeCountryDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplaySelected');
        approvalSetup.action('PAHome', 'PAHome', 'closeApproverDisplay');
        approvalSetup.allothermixedLookup = 'allothervalues';
        approvalSetup.selectedAppValue='value';
        approvalSetup.action('PAHome', 'PAHome', 'closeAddApproverDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'goToManageApprover');
       /* approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.action('PAHome', 'PAHome', 'goToapprovalSetup');
        approvalSetup.action('PAHome', 'PAHome', 'cancelManageApprovers');
        approvalSetup.action('PAHome', 'PAHome', 'onclickcancelButton');
        approvalSetup.action('PAHome', 'PAHome', 'editSetUpDetail');
        approvalSetup.action('PAHome', 'PAHome', 'goToBULandingPage');
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
    }
    
    //Pooja
    static testMethod void paApprovalSetupTestMethod802() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
       PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';  
        //pooja   
        approvalSetup.adminMaster.Request_Class__c = '';    
        if(userList!=null){
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        }
        approvalSetup.selectedKeyFieldValue='Test'; //for fixing arguement cannot be null issue
        approvalSetup.action('PAHome', 'PAHome', 'SubmitCalculation');
        approvalSetup.action('PAHome', 'PAHome', 'displaySpot');
        approvalSetup.action('PAHome', 'PAHome', 'nullifySalesArea');
        approvalSetup.action('PAHome', 'PAHome', 'displayCountry');
        approvalSetup.action('PAHome', 'PAHome', 'selectCountry');
       /* approvalSetup.action('PAHome', 'PAHome', 'closeCountryDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplaySelected');
        approvalSetup.action('PAHome', 'PAHome', 'closeApproverDisplay');
        approvalSetup.allothermixedLookup = 'allothervalues';
        approvalSetup.selectedAppValue='value';
        approvalSetup.action('PAHome', 'PAHome', 'closeAddApproverDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'goToManageApprover');
       /* approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.action('PAHome', 'PAHome', 'goToapprovalSetup');
        approvalSetup.action('PAHome', 'PAHome', 'cancelManageApprovers');
        approvalSetup.action('PAHome', 'PAHome', 'onclickcancelButton');
        approvalSetup.action('PAHome', 'PAHome', 'editSetUpDetail');
        approvalSetup.action('PAHome', 'PAHome', 'goToBULandingPage');
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
    }
    
    static testMethod void paApprovalSetupTestMethod9() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
       PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        if(userList!=null){
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        }
        approvalSetup.selectedKeyFieldValue='Test'; //for fixing arguement cannot be null issue
       /* approvalSetup.action('PAHome', 'PAHome', 'SubmitCalculation');
        approvalSetup.action('PAHome', 'PAHome', 'displaySpot');
        approvalSetup.action('PAHome', 'PAHome', 'nullifySalesArea');
        approvalSetup.action('PAHome', 'PAHome', 'displayCountry');
        approvalSetup.action('PAHome', 'PAHome', 'selectCountry');*/
        approvalSetup.action('PAHome', 'PAHome', 'closeCountryDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplaySelected');
        approvalSetup.action('PAHome', 'PAHome', 'closeApproverDisplay');
        approvalSetup.allothermixedLookup = 'allothervalues';
        approvalSetup.selectedAppValue='value';
        approvalSetup.action('PAHome', 'PAHome', 'closeAddApproverDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'goToManageApprover');
       /* approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.action('PAHome', 'PAHome', 'goToapprovalSetup');
        approvalSetup.action('PAHome', 'PAHome', 'cancelManageApprovers');
        approvalSetup.action('PAHome', 'PAHome', 'onclickcancelButton');
        approvalSetup.action('PAHome', 'PAHome', 'editSetUpDetail');
        approvalSetup.action('PAHome', 'PAHome', 'goToBULandingPage');
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');*/
    }
    
    static testMethod void paApprovalSetupTestMethod8() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        if(userList!=null){
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        }
        approvalSetup.selectedKeyFieldValue='Test'; //for fixing arguement cannot be null issue
        /*approvalSetup.action('PAHome', 'PAHome', 'SubmitCalculation');
        approvalSetup.action('PAHome', 'PAHome', 'displaySpot');
        approvalSetup.action('PAHome', 'PAHome', 'nullifySalesArea');
        approvalSetup.action('PAHome', 'PAHome', 'displayCountry');
        approvalSetup.action('PAHome', 'PAHome', 'selectCountry');
        approvalSetup.action('PAHome', 'PAHome', 'closeCountryDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'closeDisplaySelected');
        approvalSetup.action('PAHome', 'PAHome', 'closeApproverDisplay');
        approvalSetup.allothermixedLookup = 'allothervalues';
        approvalSetup.selectedAppValue='value';
        approvalSetup.action('PAHome', 'PAHome', 'closeAddApproverDisplay');
        approvalSetup.action('PAHome', 'PAHome', 'goToManageApprover');*/
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.action('PAHome', 'PAHome', 'goToapprovalSetup');
        approvalSetup.action('PAHome', 'PAHome', 'cancelManageApprovers');
        approvalSetup.action('PAHome', 'PAHome', 'onclickcancelButton');
        approvalSetup.action('PAHome', 'PAHome', 'editSetUpDetail');
        approvalSetup.action('PAHome', 'PAHome', 'goToBULandingPage');
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
    }
    
    static testMethod void paApprovalSetupTestMethod1() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
      
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
         
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
         List<PA_BU_Admin_Master__c> SalesAreaOptionList = [select Sales_Organisation__c,Distribution_Channel__c,Division__c,BU__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = 'BI EMEA'];
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        //SalesAreaOptionList.addAll('A640-TestSalesOrg','10-TestDistchannel','02-TestDivision');
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.adminMasterId = adminMaster.Id;
        approvalSetup.requestTypeFilter = 'Customer Specific';
        approvalSetup.requestTypeFilter = 'Non Customer Specific';
        approvalsetup.offsets = 40;
        
        //subbu
       // approvalsetup.enablePopUp = true;
        
       
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        /*approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'SubmitCalculation');
        approvalSetup.action('PAHome', 'PAHome', 'displaySpot');
        approvalSetup.action('PAHome', 'PAHome', 'displayCountry');*/
        approvalSetup.action('PAHome', 'PAHome', 'selectCountry');
        approvalSetup.action('PAHome', 'PAHome', 'editSetUpDetail');
        approvalSetup.action('PAHome', 'PAHome', 'goToBULandingPage');
    }
    
     static testMethod void paApprovalSetupTestMethod11() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
      /*  PA_BU_Admin_Detail__c buadminDetail = new PA_BU_Admin_Detail__c();
          buadminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        buadminDetail.Routing_Parameter__c = 'Required';
        buadminDetail.Approval_Level__c = '1';
        buadminDetail.Approver_Role__c = 'Sales Approver';
        buadminDetail.Key_Field__c = 'Country';
        insert buadminDetail;*/
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.adminMasterId = adminMaster.Id;
        approvalSetup.ManageApprover = 'ManageApprover';
           
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'SubmitCalculation');
        approvalSetup.action('PAHome', 'PAHome', 'displaySpot');
        approvalSetup.action('PAHome', 'PAHome', 'displayCountry');
        approvalSetup.closeCountryDisplay();
       /* approvalSetup.action('PAHome', 'PAHome', 'selectCountry');
        approvalSetup.action('PAHome', 'PAHome', 'editSetUpDetail');
        approvalSetup.action('PAHome', 'PAHome', 'goToBULandingPage');*/
    }
    
    
    static testMethod void paApprovalSetupTestMethod3() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
            
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
    }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
       adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        for(Integer i = 0; i<5; i++){
            
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
            adminDetail.clear();
        }
        
           approvalSetup.keyField = 'Compartner';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Plant';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
                
        approvalSetup.keyField = 'Shipping Condition';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
         approvalSetup.keyField = 'Destination Country';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
          approvalSetup.sortApprovalSetupByFilter();               
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        approvalSetup.onEditClick = false;
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
    }
    static testMethod void paApprovalSetupTestMethod4() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = NULL;
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        for(Integer i = 0; i<5; i++){
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
        }
                        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
    }
    static testMethod void paApprovalSetupTestMethod5() {
    	
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        for(Integer i = 0; i<5; i++){
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
        }
                        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethodafterEdit');
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = NULL;
        insert adminDetail;
        approvalSetup.detailWrapObjectList.clear();
        for(Integer i = 0; i<5; i++){
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
        }
                        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        approvalSetup.keyField = NULL;
        approvalSetup.approverRole = 'Test';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        
    }
    static testMethod void paApprovalSetupTestMethod6() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        RecordType rtype = [SELECT Name  from RecordType where name = 'Business'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType =  rtype;
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c ='Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = NULL;
        insert adminDetail;
        for(Integer i = 0; i<5; i++){
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
        }
                        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        
        //subbu
        approvalSetup.adminDetailId = '123';
        approvalSetup.selectedAppId = '1234';
        approvalSetup.keyFieldValueSearch = 'test';
        approvalSetup.adminMasterIDtoDel = 'test1';
        approvalSetup.countrySelect = true;
        approvalSetup.showGreenFlag = true;
        approvalSetup.nextPage = false;
        
        
      //  Set<String> ss = new Set<String>();
      //  approvalSetup.countryList.add('India');
      //  approvalSetup.buSelectOptions.add(new SelectOption('1','BI EMEA SURFACES'));
        
        
        //end-subbu
        
        approvalSetup.keyField = NULL;
        approvalSetup.approverRole = 'Test';
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.keyFieldIdSearch = 'DE';
        approvalSetup.keyFieldSetAll.add('DE');
        approvalSetup.action('PAHome', 'PAHome', 'searchKeyField');
        setupObj = new Setup_Object__c();
        insert setupObj;
        approvalSetup.setupObjforDisplayList.add(setupObj);
        approvalSetup.setupObjId = approvalSetup.setupObjforDisplayList[0].id;
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.add();
        approvalSetup.save();
        approvalSetup.deleteRecord();
        approvalSetup.getName();
        approvalSetup.getType();
        approvalSetup.validate('Test');
        approvalSetup.getListOptions();
        
        
        
    }
    
     static testMethod void paApprovalSetupTestMethod7() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        orgGroup.Owning_Business__c = 'Corporate';
        insert orgGroup;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Sales Office';
        insert erp;
        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 3';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
        approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
        orgGroup.profit_center_level__c = '4';
        update orgGroup;
        
        Profit_Center__c pc = new Profit_Center__c();
        pc.ERP_Profit_Center_4__c = 'Corporate';
        pc.ERP_Profit_Center_4_Code__c = '4';
        pc.ERP_Profit_Center_5_Code__c = '5';
        pc.ERP_Profit_Center_6_Code__c = '6';
        pc.ERP_Profit_Center_7_Code__c = '7';
        pc.ERP_Profit_Center_8_Code__c = '8';
        pc.ERP_Profit_Center_9_Code__c = '9';
        pc.Final_Level__c = '4';
        insert pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '5';
        update orgGroup;
        
        pc.Final_Level__c = '5';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '6';
        update orgGroup;
        
        pc.Final_Level__c = '6';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '7';
        update orgGroup;
        
        pc.Final_Level__c = '7';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '8';
        update orgGroup;
        
        pc.Final_Level__c = '8';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '9';
        update orgGroup;
        
        pc.Final_Level__c = '9';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Sales Org';
        approvalSetup.salesOrgDisplay = 'test-test';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.selectedAllOtherApprover = 'test';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.selectedMixedApprover = 'test';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'FetchRecordswithOffset');
        approvalSetup.action('PAHome', 'PAHome', 'FetchRecordswithOffsetback');
        
     } 
     
     static testMethod void paApprovalSetupTestMethod13() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        
                try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        OrgGroup__c orgGroup = new OrgGroup__c();
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.selectedKeyFieldValue='Test'; //for fixing arguement cannot be null issue
		approvalSetup.selectedMixedApprover = 'test';
		approvalSetup.selectedAllOtherApprover = 'test';
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        setupObj.Approver_Id__c = userList[0].Id;
        update setupObj;
        approvalSetup.setupObjforDisplayList.add(setupObj);
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        setupObj.Approver_Id__c = null;
        setupObj.Key_Field_Id__c = 'abc';
        update setupObj;
        Setup_Object__c setupObj2 = new Setup_Object__c();
        setupObj2.Key_Field_Id__c = null;
        setupObj2.Approver_Id__c = null;
        //approvalSetup.setupObjforDisplayList.clear();
        approvalSetup.setupObjforDisplayList.add(setupObj2);
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        setupObj.Approver_Id__c = userList[0].Id;
        update setupObj;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        setupObj2.Key_Field_Id__c = 'abc';
        setupObj2.Approver_Id__c = userList[0].Id;
        //approvalSetup.setupObjforDisplayList.add(setupObj);
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
    }  
    
    
    
    //subbu---July2
    
      static testMethod void paApprovalSetupTestMethod601() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        RecordType rtype = [SELECT Name  from RecordType where name = 'Business'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType =  rtype;
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        
        //pooja
        List<PA_BU_Admin_Detail__c> abc1 = approvalSetup.adminDetailDisplayList;
        List<SelectOption> cdf1 = approvalSetup.buSelectOptions;
        set<String> efg1 = approvalSetup.countryList;
        Boolean guess = approvalSetup.enablePopUp;
        
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.detailWrapObjectList.clear();
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c ='Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = NULL;
        insert adminDetail;
        //subbu
                
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.BU__c = 'BI EMEA SURFACES';
        adminMaster.Request_Type__c = 'Permanent';
        adminMaster.Sales_Organisation__c = 'A640';
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        adminMaster.Request_Type__c = 'Select';
        adminMaster.Price_Category__c = 'Select';
        insert adminMaster;
        
        
        for(Integer i = 0; i<5; i++){
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
        }
                        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        
        //subbu
        approvalSetup.adminDetailId = '123';
        approvalSetup.selectedAppId = '1234';
        approvalSetup.keyFieldValueSearch = 'test';
        approvalSetup.adminMasterIDtoDel = 'test1';
        approvalSetup.countrySelect = true;
        approvalSetup.showGreenFlag = true;
        approvalSetup.nextPage = false;
        
        
      //  Set<String> ss = new Set<String>();
      //  approvalSetup.countryList.add('India');
      //  approvalSetup.buSelectOptions.add(new SelectOption('1','BI EMEA SURFACES'));
        
        
        //end-subbu
        
        approvalSetup.keyField = NULL;
        approvalSetup.approverRole = 'Test';
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.keyFieldIdSearch = 'DE';
        approvalSetup.keyFieldSetAll.add('DE');
        approvalSetup.action('PAHome', 'PAHome', 'searchKeyField');
        setupObj = new Setup_Object__c();
        insert setupObj;
        approvalSetup.setupObjforDisplayList.add(setupObj);
        approvalSetup.setupObjId = approvalSetup.setupObjforDisplayList[0].id;
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.add();
        approvalSetup.save();
        approvalSetup.deleteRecord();
        approvalSetup.getName();
        approvalSetup.getType();
        approvalSetup.validate('Test');
        approvalSetup.getListOptions();
        
        
        
    }
    
    //pooja
     static testMethod void paApprovalSetupTestMethod602() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        insert adminDetail;
        
        Setup_Object__c setupObj = new Setup_Object__c();
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        
        RecordType rtype = [SELECT Name  from RecordType where name = 'Business'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType =  rtype;
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.salesOrgDisplay = null;
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Permanent';
        approvalSetup.enableRequestClassFlag = false;
        approvalSetup.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        
        //pooja
        List<PA_BU_Admin_Detail__c> abc1 = approvalSetup.adminDetailDisplayList;
        List<SelectOption> cdf1 = approvalSetup.buSelectOptions;
        set<String> efg1 = approvalSetup.countryList;
        Boolean guess = approvalSetup.enablePopUp;
        
        Setup_Object__c setupObject = new Setup_Object__c();
        approvalSetup.setupObjforDisplayList.add(setupObject); 
        approvalSetup.detailWrapObjectList.clear();
        //subbu
        adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.BU__c = 'BI EMEA SURFACES';
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.Sales_Organisation__c = 'A640';
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
     
        adminMaster.Price_Category__c = 'Permanent';
        insert adminMaster;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c ='Required';
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = NULL;
        insert adminDetail;
        //subbu
                
       
        
        
        for(Integer i = 0; i<5; i++){
            PAWrapper detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(adminDetail);
            approvalSetup.detailWrapObjectList.add(detailWrapObject);
        }
                        
        approvalSetup.SelectedBu = 'BI EMEA Surfaces';
        approvalSetup.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetup.distChannelDisplay = '10-TestDistchannel';
        approvalSetup.divisionSelectDisplay = '02-TestDivision';
        approvalSetup.adminMaster.Price_Category__c = 'Pricing Task';
        approvalSetup.adminMaster.Pricing_Task_Type__c = 'Test Task type';
        
        //subbu
        approvalSetup.adminDetailId = '123';
        approvalSetup.selectedAppId = '1234';
        approvalSetup.keyFieldValueSearch = 'test';
        approvalSetup.adminMasterIDtoDel = 'test1';
        approvalSetup.countrySelect = true;
        approvalSetup.showGreenFlag = true;
        approvalSetup.nextPage = false;
        
        
      //  Set<String> ss = new Set<String>();
      //  approvalSetup.countryList.add('India');
      //  approvalSetup.buSelectOptions.add(new SelectOption('1','BI EMEA SURFACES'));
        
        
        //end-subbu
        
        approvalSetup.keyField = NULL;
        approvalSetup.approverRole = 'Test';
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c = userList[0].Id;
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.keyFieldIdSearch = 'DE';
        approvalSetup.keyFieldSetAll.add('DE');
        approvalSetup.action('PAHome', 'PAHome', 'searchKeyField');
        setupObj = new Setup_Object__c();
        insert setupObj;
        approvalSetup.setupObjforDisplayList.add(setupObj);
        approvalSetup.setupObjId = approvalSetup.setupObjforDisplayList[0].id;
        approvalSetup.action('PAHome', 'PAHome', 'deleteSetupObj');
        approvalSetup.add();
        approvalSetup.save();
        approvalSetup.deleteRecord();
        approvalSetup.getName();
        approvalSetup.getType();
        approvalSetup.validate('Test');
        approvalSetup.getListOptions();
        
        
        
    }
    
  
  
  //subbu
  
   static testMethod void paApprovalSetupTestMethod701() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        adminMaster.Price_Category__c = 'Pricing Task';
        adminMaster.Request_Type__c = 'Customer Specific';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
        //subbu
        List<User> userList1 = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
   /*     PAService paService = new PAService();
       
        PAServiceState paServiceState1 = new PAServiceState();
        
        PAApprovalSetup approvalSetupNew = new PAApprovalSetup(paServiceState1);
         List<PA_BU_Admin_Master__c> SalesAreaOptionList = [select Sales_Organisation__c,Distribution_Channel__c,Division__c,BU__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = 'BI EMEA'];
        approvalSetupNew.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetupNew.distChannelDisplay = '10-TestDistchannel';
        approvalSetupNew.divisionSelectDisplay = '02-TestDivision';
        approvalSetupNew.adminMaster.Price_Category__c = 'Permanent';
        approvalSetupNew.enableRequestClassFlag = false;
        approvalSetupNew.SelectedBu = 'BI EMEA Surfaces';
        //SalesAreaOptionList.addAll('A640-TestSalesOrg','10-TestDistchannel','02-TestDivision');
        approvalSetupNew.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetupNew.setUpObjforAllMultiUser.Mixed_Values__c =userList1[0].Id;
        approvalSetupNew.setUpObjforAllMultiUser.All_Other_Values__c = userList1[0].Id;
        approvalSetupNew.adminMasterId = adminMaster.Id;
        approvalSetupNew.requestTypeFilter = 'Customer Specific';
        approvalSetupNew.requestTypeFilter = 'Non Customer Specific';
        approvalSetupNew.offsets = 500;
        */
        //end-subbu
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        orgGroup.Owning_Business__c = 'Corporate';
        insert orgGroup;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
      
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Sales Office';
        insert erp;
        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 3';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        //subbu
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Country';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        //end
        
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
        approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
        orgGroup.profit_center_level__c = '4';
        update orgGroup;
        
        Profit_Center__c pc = new Profit_Center__c();
        pc.ERP_Profit_Center_4__c = 'Corporate';
        pc.ERP_Profit_Center_4_Code__c = '4';
        pc.ERP_Profit_Center_5_Code__c = '5';
        pc.ERP_Profit_Center_6_Code__c = '6';
        pc.ERP_Profit_Center_7_Code__c = '7';
        pc.ERP_Profit_Center_8_Code__c = '8';
        pc.ERP_Profit_Center_9_Code__c = '9';
        pc.Final_Level__c = '4';
        insert pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '5';
        update orgGroup;
        
        pc.Final_Level__c = '5';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '6';
        update orgGroup;
        
        pc.Final_Level__c = '6';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '7';
        update orgGroup;
        
        pc.Final_Level__c = '7';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '8';
        update orgGroup;
        
        pc.Final_Level__c = '8';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '9';
        update orgGroup;
        
        pc.Final_Level__c = '9';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Sales Org';
        approvalSetup.salesOrgDisplay = 'test-test';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.selectedAllOtherApprover = 'test';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.selectedMixedApprover = 'test';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'FetchRecordswithOffset');
        approvalSetup.action('PAHome', 'PAHome', 'FetchRecordswithOffsetback');
        
     } 
     
     static testMethod void paApprovalSetupTestMethod702() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        adminMaster.Price_Category__c = 'Pricing Task';
        adminMaster.Request_Type__c = 'Customer Specific';
        adminMaster.BU__c = 'BI EMEA SURFACES';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
        //subbu
        List<User> userList1 = [SELECT id from User where isActive = true and E_Pass_ID__c!=null limit 1];
   /*     PAService paService = new PAService();
       
        PAServiceState paServiceState1 = new PAServiceState();
        
        PAApprovalSetup approvalSetupNew = new PAApprovalSetup(paServiceState1);
         List<PA_BU_Admin_Master__c> SalesAreaOptionList = [select Sales_Organisation__c,Distribution_Channel__c,Division__c,BU__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = 'BI EMEA'];
        approvalSetupNew.salesOrgDisplay = 'A640-TestSalesOrg';
        approvalSetupNew.distChannelDisplay = '10-TestDistchannel';
        approvalSetupNew.divisionSelectDisplay = '02-TestDivision';
        approvalSetupNew.adminMaster.Price_Category__c = 'Permanent';
        approvalSetupNew.enableRequestClassFlag = false;
        approvalSetupNew.SelectedBu = 'BI EMEA Surfaces';
        //SalesAreaOptionList.addAll('A640-TestSalesOrg','10-TestDistchannel','02-TestDivision');
        approvalSetupNew.action('PAHome', 'PAHome', 'saveMasterMethod');
        approvalSetupNew.setUpObjforAllMultiUser.Mixed_Values__c =userList1[0].Id;
        approvalSetupNew.setUpObjforAllMultiUser.All_Other_Values__c = userList1[0].Id;
        approvalSetupNew.adminMasterId = adminMaster.Id;
        approvalSetupNew.requestTypeFilter = 'Customer Specific';
        approvalSetupNew.requestTypeFilter = 'Non Customer Specific';
        approvalSetupNew.offsets = 500;
        */
        //end-subbu
        
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        
        List<OrgGroup__c> trial1 = new List<OrgGroup__c>();
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        orgGroup.Owning_Business__c = 'Corporate';
        orgGroup.RecordType = recordType;
        
        
        trial1.add(orgGroup);
        
        insert trial1;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
        PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
        
        
        
        //subbu
        approvalSetup.SalesAreaOptionsList = new List<SelectOption>();
        
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Country';
        insert erp;
        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
    /*    erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 3';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Material Group 4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        //subbu
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Country';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        //end
    */    
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
        approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
        orgGroup.profit_center_level__c = '4';
        update orgGroup;
        
        Profit_Center__c pc = new Profit_Center__c();
        pc.ERP_Profit_Center_4__c = 'Corporate';
        pc.ERP_Profit_Center_4_Code__c = '4';
        pc.ERP_Profit_Center_5_Code__c = '5';
        pc.ERP_Profit_Center_6_Code__c = '6';
        pc.ERP_Profit_Center_7_Code__c = '7';
        pc.ERP_Profit_Center_8_Code__c = '8';
        pc.ERP_Profit_Center_9_Code__c = '9';
        pc.Final_Level__c = '4';
        insert pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '5';
        update orgGroup;
        
        pc.Final_Level__c = '5';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '6';
        update orgGroup;
        
        pc.Final_Level__c = '6';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '7';
        update orgGroup;
        
        pc.Final_Level__c = '7';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '8';
        update orgGroup;
        
        pc.Final_Level__c = '8';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        orgGroup.profit_center_level__c = '9';
        update orgGroup;
        
        pc.Final_Level__c = '9';
        update pc;
        
        approvalSetup.keyField = 'Profit Center';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.keyField = 'Sales Org';
        approvalSetup.salesOrgDisplay = 'test-test';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
        approvalSetup.setUpObjforAllMultiUser.All_Other_Values__c = userList[0].Id;
        approvalSetup.setUpObjforAllMultiUser.Mixed_Values__c =userList[0].Id;
        approvalSetup.selectedAllOtherApprover = 'test';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.selectedMixedApprover = 'test';
        approvalSetup.allothermixedLookup = 'abcd';
        approvalSetup.action('PAHome', 'PAHome', 'saveSetObjectMethod');
        approvalSetup.action('PAHome', 'PAHome', 'FetchRecordswithOffset');
        approvalSetup.action('PAHome', 'PAHome', 'FetchRecordswithOffsetback');
        
     } 
    
    static testMethod void paApprovalSetupTestMethod12_A() {
        //Insert the records
        PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
        adminMaster.Sales_Organisation__c = 'A640'; 
        adminMaster.Distribution_Channel__c = '10';
        adminMaster.Division__c = '02';
        insert adminMaster;
        
        PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = NULL;
        adminDetail.Approval_Level__c = '1';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Country';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '2';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 4';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Not Required';
        adminDetail.Approval_Level__c = '3';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approval_Level__c = '4';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Sales Org';
        insert adminDetail;
        
        adminDetail = new PA_BU_Admin_Detail__c();
        adminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
        adminDetail.Routing_Parameter__c = 'Required';
        adminDetail.Approver_Role__c = 'Sales Approver';
        adminDetail.Key_Field__c = 'Customer Group 2';
        adminDetail.Approval_Level__c = '5';
        insert adminDetail;
        
                
        Setup_Object__c setupObj = new Setup_Object__c();
        setupObj.Key_FIeld__C = 'Country';
        setupObj.Approver_Role__c = 'Sales Approver';
        insert setupObj;
        try{
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
        }
        catch(exception e){}
        
        List<User> userList = [SELECT id from User where isActive = true limit 1];
        
        Group g = new Group();
        g.Name = 'TestGroup';
        g.DeveloperName = 'TestGroup';
        insert g;
        RecordType recordType = [SELECT Name FROM RecordType WHERE Name = 'ERP Sales Area'];
        OrgGroup__c orgGroup = new OrgGroup__c();
        orgGroup.RecordType = recordType;
        orgGroup.ERP_Sales_Org_Code__c = 'A640';
        orgGroup.ERP_Distribution_Channel_Code__c = '10';
        orgGroup.ERP_Division_Code__c = '02';
        orgGroup.Business__c = 'BI';
        insert orgGroup;
        
        ERP_Pricing_Procedure__c epp = new ERP_Pricing_Procedure__c();
        insert epp;
        
        Organizational_Group_Item__c orgItem = new Organizational_Group_Item__c();
        orgItem.Business__c = orgGroup.Id;
        orgItem.OrgGroup__c = orgGroup.Id;
        orgItem.ERP_Pricing_Procedure__c = epp.Id;
        insert orgItem;
        
       PAOrganizationalGroupItems paOrgGroupItems = new PAOrganizationalGroupItems();
        paOrgGroupItems.selectedBU = orgGroup.Id;
        paOrgGroupItems.value = 'SASetup';
        
        PAService paService = new PAService();
        paService.getBusinessComponent('Customer Price Requests','OrganizationalGroupItem');
        
        PAServiceState paServiceState = new PAServiceState();
        paServiceState.ogItems = paOrgGroupItems;
        
        PAApprovalSetup approvalSetup = new PAApprovalSetup(paServiceState);
        approvalSetup.lookupOfVar = 'KeyField';
        approvalSetup.keyField = 'Country';
        approvalSetup.salesOrg = 'A640';
        approvalSetup.distChannel = '10';
        approvalSetup.divisionSelect = '02';
        approvalsetup.selectedBU = NULL;
        approvalsetup.distChannel = NULL;
        
        ERP_Customer_Material_Key__c erp = new ERP_Customer_Material_Key__c();

        Org_Group_ERP_Key__c orgGrpERP = new Org_Group_ERP_Key__c();

        
        erp = new ERP_Customer_Material_Key__c();
        erp.Type__c = 'Customer Group 2';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        erp = new ERP_Customer_Material_Key__c();
        //Added by NSVZ330
		erp.Type__c = 'Customer Group 4';
        insert erp;
        orgGrpERP = new Org_Group_ERP_Key__c();
        orgGrpERP.Organizational_Group_Item__c = orgItem.Id;
        orgGrpERP.ERP_Cus_Mat_Compt_Key__c = erp.Id;
        insert orgGrpERP;
        
        Product_Hierarchy__c ph = new Product_Hierarchy__c();
        ph.PH_Level__c = 2;
        insert ph;
        BU_PH__c  bph = new BU_PH__c ();
        bph.OrgGroup__c = orgGroup.Id;
        bph.Product_Hierarchy__c = ph.Id;
        insert bph;
        
        approvalSetup.salesOrg = 'A640';
        approvalSetup.salesOrgDisplay = 'A640';
		
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Sales District';
		//Added by VZ3360
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Customer Group 2';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Customer Group 4';
 		//Added by VZ3360
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Matl grp1';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        approvalSetup.keyField = 'Material Group 5';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Plant';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Shipping Condition';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Destination Country';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		        approvalSetup.keyField = 'Reason Code';
        Test.startTest();
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
        
				        approvalSetup.keyField = 'Payer';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'Partner ZF';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB4';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB5';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB6';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB7';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB8';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
				        approvalSetup.keyField = 'FRB9';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
						        approvalSetup.keyField = 'FRB10';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
								        approvalSetup.keyField = 'Campaign';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
								        approvalSetup.keyField = 'Document Currency';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
								        approvalSetup.keyField = 'State';
        approvalSetup.action('PAHome', 'PAHome', 'dynamicLookup');
		Test.stopTest();
    }
    
    }