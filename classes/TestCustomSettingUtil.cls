/*
 * 12/29/2016 - Merge&Spin - Created Util class for custom settings
 * */
@isTest
public class TestCustomSettingUtil {

    public static List<PAProfilePermissions__c> testPAProfilePermissions(){
         List<PAProfilePermissions__c> profilePermissionList = new List<PAProfilePermissions__c>();
                  profilePermissionList.add(new PAProfilePermissions__c(Name='Sales Admin',API_Name__c='Price_Approval_Sales_Admin'));
                  profilePermissionList.add(new PAProfilePermissions__c(Name='Approver',API_Name__c='Price Approval-Approver'));
                  profilePermissionList.add(new PAProfilePermissions__c(Name='CSR',API_Name__c='Price Approval-CSR'));
                  profilePermissionList.add(new PAProfilePermissions__c(Name='BU Admin',Name__c='Price Approval-BU Admin'));
                   profilePermissionList.add(new PAProfilePermissions__c(Name='IT Admin',Name__c='Price Approval-IT Admin'));
                  profilePermissionList.add(new PAProfilePermissions__c(Name='Price Requester',Name__c='Price Approval-Price Requester'));
                return profilePermissionList;        
        
    }
    //<20171403> Merge&Spin: Added method to create test data for PAKeyCombinationUpdate__c custom setting
    public static void PAKeyCombinationUpdateTestData(){
        List<PAKeyCombinationUpdate__c> PAKeyCombinationUpdateList = new List<PAKeyCombinationUpdate__c>();
        PAKeyCombinationUpdateList.add(new PAKeyCombinationUpdate__c(Name='A692',NewKCCode__c='A986'));
        PAKeyCombinationUpdateList.add(new PAKeyCombinationUpdate__c(Name='A920',NewKCCode__c='A578'));
        PAKeyCombinationUpdateList.add(new PAKeyCombinationUpdate__c(Name='A560',NewKCCode__c='A533'));
        PAKeyCombinationUpdateList.add(new PAKeyCombinationUpdate__c(Name='A691',NewKCCode__c='A534'));
        PAKeyCombinationUpdateList.add(new PAKeyCombinationUpdate__c(Name='A693',NewKCCode__c='A805'));
        PAKeyCombinationUpdateList.add(new PAKeyCombinationUpdate__c(Name='A949',NewKCCode__c='A674'));
        insert PAKeyCombinationUpdateList;
    }
    
  /*  public static void createSkipTriggerTestData(){
        Test.loadData(Skip_All_Triggers_PA__c.sObjectType,'Skip_All_Triggers_PA_TestData');
    }*/
}