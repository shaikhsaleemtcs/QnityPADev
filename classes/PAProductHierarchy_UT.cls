/*
 * Name      :   PAProductHierarchy_UT
 * Description  :   This is the test class for PAProductHierarchy
 * Author      :   Infosys Limited
 * Created Date :   25-03-2013
 *
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class PAProductHierarchy_UT
{
    static testMethod void PAProductHierarchyTestMethod()
    {
        
        List<PAProfilePermissions__c> profilePSList = new List<PAProfilePermissions__c>();
        PAProfilePermissions__c profilePS1 = new PAProfilePermissions__c();
        profilePS1.Name = 'Sales Admin';
        profilePS1.Name__c = 'Price Approval-Sales Admin';
        profilePS1.API_Name__c = 'Price_Approval_Sales_Admin';
        profilePSList.add(profilePS1);
        PAProfilePermissions__c profilePS2 = new PAProfilePermissions__c();
        profilePS2.Name = 'Approver';
        profilePS2.Name__c = 'Price Approval-Approver';
        profilePS2.API_Name__c = 'Price_Approval_Approver';
        profilePSList.add(profilePS2);
        PAProfilePermissions__c profilePS3 = new PAProfilePermissions__c();
        profilePS3.Name = 'BU Admin';
        profilePS3.Name__c = 'Price Approval-BU Admin';
        profilePS3.API_Name__c = '';
        profilePSList.add(profilePS3);
        PAProfilePermissions__c profilePS4 = new PAProfilePermissions__c();
        profilePS4.Name = 'Price Requester';
        profilePS4.Name__c = 'Price Approval-Price Requester';
        profilePS4.API_Name__c = '';
        profilePSList.add(profilePS4);
        PAProfilePermissions__c profilePS5 = new PAProfilePermissions__c();
        profilePS5.Name = 'IT Admin';
        profilePS5.Name__c = 'Price Approval-IT Admin';
        profilePS5.API_Name__c = '';
        profilePSList.add(profilePS5);
        insert profilePSList;
        
        List<Product_Hierarchy__c> PHList = new List<Product_Hierarchy__c>();
        Product_Hierarchy__c PH1 = new Product_Hierarchy__c();
        PH1.PH_Code__c = 'A6';
        PH1.PH_Level__c = 1;
        PHList.add(PH1);
        Product_Hierarchy__c PH2 = new Product_Hierarchy__c();
        PH2.PH_Code__c = 'A6S1';
        PH2.PH_Level__c = 2;
        PHList.add(PH2);
        
        Product_Hierarchy__c PH3 = new Product_Hierarchy__c();
        PH3.PH_Code__c = 'A6S4';
        PH3.PH_Level__c = 2;
        PHList.add(PH3);
        Product_Hierarchy__c PH4 = new Product_Hierarchy__c();
        PH4.PH_Code__c = 'A6S112';
        PH4.PH_Level__c = 3;
        PHList.add(PH4);
        
        Product_Hierarchy__c PH5 = new Product_Hierarchy__c();
        PH5.PH_Code__c = 'B6';
        PH5.PH_Level__c = 1;
        PHList.add(PH5);
        
        Product_Hierarchy__c PH6 = new Product_Hierarchy__c();
        PH6.PH_Code__c = 'A6S112AA';
        PH6.PH_Level__c = 4;
        PHList.add(PH6);
        insert PHList;

        OrgGroup__c orgGrp = new OrgGroup__c();
        orgGrp.Business__c = 'Surfaces';
        insert orgGrp;

        //paph.selectedBUFromPage = orgGrp.Id;
        List<BU_PH__c> buphList = new List<BU_PH__c>();
        BU_PH__c buph1 = new BU_PH__c();
        buph1.Product_Hierarchy__c = PHList[0].Id;
        buph1.OrgGroup__c = orgGrp.Id;
        buph1.Business_Description__c = 'Test1';
        buphList.add(buph1);
        BU_PH__c buph2 = new BU_PH__c();
        buph2.Product_Hierarchy__c = PHList[1].Id;
        buph2.OrgGroup__c = orgGrp.Id;
        //buph2.Business_Description__c = 'Test2';
        buphList.add(buph2);
        BU_PH__c buph3 = new BU_PH__c();
        buph3.Product_Hierarchy__c = PHList[2].Id;
        buph3.OrgGroup__c = orgGrp.Id;
        buph3.Business_Description__c = 'Test3';
        buphList.add(buph3);
        BU_PH__c buph4 = new BU_PH__c();
        buph4.Product_Hierarchy__c = PHList[3].Id;
        buph4.OrgGroup__c = orgGrp.Id;
        //buph4.Business_Description__c = 'Test4';
        buphList.add(buph4);
        BU_PH__c buph5 = new BU_PH__c();
        buph5.Product_Hierarchy__c = PHList[4].Id;
        buph5.OrgGroup__c = orgGrp.Id;
        buph5.Business_Description__c = 'Test5';
        buphList.add(buph5);
        BU_PH__c buph6 = new BU_PH__c();
        buph6.Product_Hierarchy__c = PHList[5].Id;
        buph6.OrgGroup__c = orgGrp.Id;
        buph6.Business_Description__c = 'Test6';
        buphList.add(buph6);
        insert buphList;
        
        
        // For populating getListOptions() of orgGrpItem
            RecordType rType = [select id from RecordType Where sObjectType='OrgGroup__c' AND Name='Business'];
        
            OrgGroup__c salesArea = new OrgGroup__c(ERP_Sales_Org_code__c='A640',ERP_Distribution_Channel_Code__c='10',
                                            ERP_Division_code__c='02');
            insert salesArea;
                        
            OrgGroup__c Business = new OrgGroup__c(Business__c='BI EMEA Surfaces',RecordTypeId=rType.id);
            insert Business;
            
            ERP_Pricing_Procedure__c pp = new ERP_Pricing_Procedure__c(Pricing_Procedure_Code__c='ZA640A',
            Pricing_Procedure_Description__c='BI EMEA Surfaces',Pricing_Procedure__c='BI EMEA Surfaces',
            SAP_Application_Id__c='V',SAP_Client_Id__c='510',SAP_Cluster__c='CB1');
            insert pp;
            
            List<Organizational_Group_Item__c> orgItemList = new List<Organizational_Group_Item__c>();
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c=null));
            orgItemList.add(new Organizational_Group_Item__c(
            Business__c=Business.id,OrgGroup__c=salesArea.id,ERP_Pricing_Procedure__c=pp.id,
                    Customer_Request_Reasons__c='A;B',Non_Customer_Permanent_Request_Reasons__c='Non-A;Non-B',
                    ERP_Currency__c='USD',ERP_UoM__c ='KG',
                    Pricing_Task_Reasons__c ='Pricing Task',
                    Rebate_Agreement__c ='Rebate',Pricing_Task_Type__c='Spot',Retroactive_Limit__c=31,Max_Valid_From_Offset_Cust_Spec__c=91,
                    Latest_Valid_From_Offset_Non_Cust_Spec__c=10,Latest_Valid_To_Offset_Cust_Spec__c=25,
                    Latest_Valid_To_Offset_Non_Cust_Spec__c=25/*,Approval_Escalation_Price_Requests=6*/));
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
            orgUser.Related_User__c = userInfo.getUserId();
            orgUser.OrgGroup__c=salesArea.id;
            orgUser.Organizational_Group_Item__c =orgItemList[0].id ;
            insert orgUser;
        //End
        
        PAOrganizationalGroupItems paOGItems = new PAOrganizationalGroupItems();
        paOGItems.selectedBU = Business.id; 
        paOGItems.selectedRecordId= orgGrp.Id;
        
        
        try{
        PAProductHierarchy Paprh= new PAProductHierarchy();
        Paprh.selectedPHValue = 'A6S1';
        Paprh.getListWrappers();
        System.debug('test dee inside try1');
        paprh.Validate('error');
        PAOrganizationalGroupItems paOGItems1 = new PAOrganizationalGroupItems();
        paOGItems1.selectedBU = null; 
        paOGItems1.selectedRecordId= null; 
        System.debug('test dee inside try');
        }
        Catch (Exception e){}
        System.debug('test dee inside catch');
        PAProductHierarchy Paph= new PAProductHierarchy();
        PAServiceState paSS = new PAServiceState();
        paSS.ogitems = new PAOrganizationalGroupItems();
        paSS.ogitems.selectedBU = paOGItems.selectedBU;
        PAProductHierarchy PH= new PAProductHierarchy(paSS);
        
        PH.paOGItem=paOGItems;
        PH.getListOptions();
        PH.getListBusinessComponents();
        PH.deleteRecord();
        PH.selectedPHValue = 'A6S1';
        PH.getListWrappers();
        
        PH.getName();
            PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetup');
            PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetupFetchPH');
            PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetupPHSave');
            PH.action('PAGlobalConfig', 'PAGlobalConfig', 'Cancel');
             PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetup_PHSave');
            PH.selectedPHValue = 'D6##14########';
            PH.relatedWrappersList=PH.getListWrappers();
            try{
            PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetupNamePHSave');
            }
            catch(exception e){
            }
            try{
            PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetupAddNewPH');
            }
            catch(exception e){
            }
        PH.selectedPHValue = '';
        PH.getListWrappers();
        PH.valuePH = 'BUSetupAddNewPH';
        PH.save();
        PH.action('PAGlobalConfig', 'PAGlobalConfig', 'BUSetup_PHSave');
        
        PH.selectedPHValue = '';
        PH.NewPH = 'B6';
        PH.save();
        
        try{
        PH.checkIfBuPhExists = true;
        PH.save();
        }catch(Exception ex){}
    }
    
    
}