/*********************************************************************************************
Copyright © 2020 DuPont. All rights reserved. 
Author: Rajan Kumar Mishra
Email: rajankumar.mishra@tcs.com
Last Modified Date : 12th Feb 2020
Description: This is test class for controller class "SandboxRefreshTemplateController".
**********************************************************************************************/
@isTest
Private class SandboxRefreshTemplateController_UT {

    @isTest
    static void testRunApexClass() {
        String orgId;
        Test.startTest();
            Test.testSandboxPostCopyScript(
                new SandboxRefreshTemplateController(), UserInfo.getOrganizationId(),
                    UserInfo.getOrganizationId(), UserInfo.getOrganizationName());
        
			orgId = UserInfo.getOrganizationId();
        Test.stopTest();
        
        System.assertEquals(orgId, UserInfo.getOrganizationId());
    }
}