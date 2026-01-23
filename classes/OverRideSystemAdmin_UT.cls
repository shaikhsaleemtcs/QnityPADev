/*
 * Name      :   OverRideSystemAdmin_UT
 * Description  :   This is the test class for OverRideSystemAdmin
 * Author      :   Infosys Limited
 * Created Date :   
 Date : 29/12/2016
 Change : Merge & Spin- Updated the test  class to update the insert of UserRole and User.
 * Version    Modified Date    Modified By   Modification
 * ------------------------------------------------------------------------------
 */
@isTest
private class OverRideSystemAdmin_UT
{
    
    static testMethod void ctrlPAMainTestMethod()
    {
        //Start: Updated as a part of Merge & Spin to the change the UserRole name.
        Profile p1 =[SELECT Id FROM Profile where name='System Administrator'];
        Profile p2 =[SELECT Id FROM Profile where name='Price Approval-BU Admin'];
        /*
        UserRole r=[SELECT Id FROM UserRole WHERE developerName='BI_EMEA_Surfaces'];
        // 27122016 - Merge&Spin - Updated External ERP Id to Dummy Value   
        //sales Admin Permission Set
        User u1 = new User(Alias='pcopp', Email='test_user@dupont.com', 
                         User_Country__c='UNITED KINGDOM',E_Pass_ID__c='rr9847',
                         External_ERP_ID__c='DummyTest1',UserRoleId=r.id,profileid = p1.id,
                         Username='pa_werner1@jhhgtestinfosys.com.test2',
                         LastName='Coppens', CommunityNickname='acv',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u1;
         // 27122016 - Merge&Spin - Updated External ERP Id to Dummy Value
        User u2 = new User(Alias='pcopp2', Email='test_user2@dupont.com', 
                         User_Country__c='UNITED KINGDOM2',E_Pass_ID__c='rr1235',
                         External_ERP_ID__c='DummyTest2',UserRoleId=r.id,profileid = p2.id,
                         Username='pa_werner21@jhhgtestinfosys.com.test2',
                         LastName='Coppens2', CommunityNickname='acv2',
                         TimeZoneSidKey='America/Los_Angeles', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US');
        insert u2;
        */
       UserRole Ur = TestUserUtil.createTestUserRole('BI-EMEA-Surfaces');
       insert Ur;
       User usr1 = TestUserUtil.createTestUser(Ur.Id,p1.Id,'User1 FirstName','User1 LastName');
       usr1.External_ERP_ID__c='DummyTest1';
       insert usr1;
       User usr2 = TestUserUtil.createTestUser(Ur.Id,p2.Id,'User2 FirstName','User2 LastName');
       usr2.External_ERP_ID__c='DummyTest2';
       insert usr2;
       //End: Updated as a part of Merge & Spin to the change the UserRole name.
        system.runAs(usr1)
        {
            Pricing_Request__c prList = new Pricing_Request__c();
            prList = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                    SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                    Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                    Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                    Request_Approval_Status__c='Draft',Spot_Type__c='not null');
             
            insert prList;
            Apexpages.StandardController stdController = new Apexpages.StandardController(prList);
        
            OverRideSystemAdmin sysAd = new OverRideSystemAdmin(stdController);
            sysAd.route();
        }
        system.runAs(usr2)
        {
            Pricing_Request__c prList = new Pricing_Request__c();
            prList = new Pricing_Request__c(Sold_To__c='Customer1',SoldTo_Code__c='5512345',Sales_Org_Code__c='A640',
                                    SAP_Client_Id__c='510',SAP_Application_Id__c='V',Request_Type__c='Customer Specific',Request_Reason__c='test;test1',
                                    Request_Name__c='test123',Pricing_Request_Type__c='Pricing Task',Division_Code__c='02',
                                    Dist_Channel_Code__c='10',Customer_Specific__c=true,BU__c='BI EMEA SURFACES',
                                    Request_Approval_Status__c='Draft',Spot_Type__c='not null');
             
            insert prList;
            Apexpages.StandardController stdController = new Apexpages.StandardController(prList);
        
            OverRideSystemAdmin sysAd = new OverRideSystemAdmin(stdController);
            sysAd.route();
            sysAd.routeToEdit();
        }
    }
}