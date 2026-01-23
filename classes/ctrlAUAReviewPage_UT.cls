/*******************************************************************************
Copyright © 2016 DuPont. All rights reserved. 
Author: Abhinav Bhatnagar
Email: abhinav.bhatnagar@dupont.com
Description:  Unit Test for ctrlAUAReviewPage
********************************************************************************/
@isTest
//Merge&Spin - Removed SeeAllData
//(SeeAllData=true)

private class ctrlAUAReviewPage_UT {
        
    public static testMethod void LoadData() {
        Test.startTest();
        User_Access_Review__c uar = new User_Access_Review__c(name='Test User Access Review Audit 2016',Process_Owner__c=UserInfo.getUserId(), Start_Date__c=Date.today());
        Insert uar;
        
        User_Access_Review_Details__c uard = new User_Access_Review_Details__c(CompanyName__c='DUPONT (THAILAND) LIMITED',Program__c='CPC',User_Owning_Org__c='AGCP-CPC' ,User_Owning_SBU_Org__c='Crop Protection',Approval__c='De-Activate',Approver__c=UserInfo.getUserId(),Audit_Process__c=uar.id,Review_Date__c=Date.today(),Name='Test User1',Org__c='DuPont',User_Email_Id__c='Test1@test.com',User_Id__c=UserInfo.getUserId(),User_ePass_Id__c='test4234',User_Name__c=Userinfo.getFirstName()+','+UserInfo.getLastName(),User_Permission_Sets__c='Test',User_Profile__c='Test',User_Public_Group__c='Test',User_Roles__c='Test',User_Type__c='Test',User_Grouping__C='CPC',User_Country__c='India', User_Region__c='Asia Pacific');
        User_Access_Review_Details__c uard1 = new User_Access_Review_Details__c(CompanyName__c='DUPONT (THAILAND) LIMITED',Program__c='CPC',User_Owning_Org__c='AGCP-CPC' ,User_Owning_SBU_Org__c='Crop Protection',Approval__c='De-Activate',Approver__c=UserInfo.getUserId(),Audit_Process__c=uar.id,Review_Date__c=Date.today(),Name='Test User2',Org__c='DuPont',User_Email_Id__c='Test2@test.com',User_Id__c=UserInfo.getUserId(),User_ePass_Id__c='test4235',User_Name__c=Userinfo.getFirstName()+','+UserInfo.getLastName(),User_Permission_Sets__c='Test',User_Profile__c='Test',User_Public_Group__c='Test',User_Roles__c='Test',User_Type__c='Test',User_Grouping__C='CPC',User_Country__c='India', User_Region__c='Asia Pacific');
        User_Access_Review_Details__c uard2 = new User_Access_Review_Details__c(CompanyName__c='DUPONT (THAILAND) LIMITED',Program__c='CPC',User_Owning_Org__c='AGCP-CPC' ,User_Owning_SBU_Org__c='Crop Protection',Approval__c='De-Activate',Approver__c=UserInfo.getUserId(),Audit_Process__c=uar.id,Review_Date__c=Date.today(),Name='Test User3',Org__c='DuPont',User_Email_Id__c='Test3@test.com',User_Id__c=UserInfo.getUserId(),User_ePass_Id__c='test4236',User_Name__c=Userinfo.getFirstName()+','+UserInfo.getLastName(),User_Permission_Sets__c='Test',User_Profile__c='Test',User_Public_Group__c='Test',User_Roles__c='Test',User_Type__c='Test',User_Grouping__C='CPC',User_Country__c='India', User_Region__c='Asia Pacific');
        List<User_Access_Review_Details__c> uards = new List<User_Access_Review_Details__c>();
        uards.add(uard);
        uards.add(uard1);
        uards.add(uard2);
        
        insert uards;
        
        apexpages.currentpage().getparameters().put('Id',uar.id);
        executeTest(uar);
        Test.stopTest();
    }
    
    public static  void executeTest(User_Access_Review__c uar) {
        testTakeSnapshot(uar); 
        testAUAReviewPageController();
    }
    
    public static  void testAUAReviewPageController()    
    {
        ctrlAUAReviewPage carp = new ctrlAUAReviewPage(); 
        carp.oname = 'User Access Review Details';
        carp.getUserAccessReviewDetails('NAME','DESC');
        
        carp.showfields();    
        loadFields(carp);
        
        Apexpages.Currentpage().getParameters().put('callingFrom','showRecords');
        carp.refreshTable();
        carp.sortbyField = 'Name';
        carp.sortDirection = 'ASC';
        Apexpages.Currentpage().getParameters().put('callingFrom','showRecords');
        carp.refreshTable();
        
        testPagination(carp);
    }
    
    public static  void testTakeSnapshot(User_Access_Review__c uar) {
        AUATakeSnapshot.startSnapshotProcess(uar.id);
    }
    
    public static void testPagination(ctrlAUAReviewPage carp){
        carp.getFields();
        Apexpages.Currentpage().getParameters().put('callingFrom','Beginning');
        carp.refreshTable();
        Apexpages.Currentpage().getParameters().put('callingFrom','Next');
        carp.refreshTable();
        Apexpages.Currentpage().getParameters().put('callingFrom','Next');
        carp.refreshTable();
        Apexpages.Currentpage().getParameters().put('callingFrom','Previous');
        carp.refreshTable();
        Apexpages.Currentpage().getParameters().put('callingFrom','End');
        carp.refreshTable();
        
        carp.getDisablePrevious(); 
        carp.getDisableNext();  
        carp.getTotal_size(); 
        carp.getPageNumber();
        carp.sortTable();
        
        String strMyList = carp.myList;
        carp.cancel();
        carp.showpage = String.valueOf(2);
        
        Apexpages.Currentpage().getParameters().put('callingFrom','changePage');
        carp.refreshTable();
        
        carp.columnLabels[0].getName();
        carp.columnLabels[0].getLabel();
        carp.save();
    }
    
    
    public static void loadFields(ctrlAUAReviewPage carp){
        carp.finalsFields = new String[]{};
            for(String s:carp.fieldsMap.Keyset()){
                carp.finalsFields.add(carp.fieldsMap.get(s));
            }
    }
    
    
}