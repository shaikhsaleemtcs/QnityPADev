/*******************************************************************************
Copyright © 2019 DuPont. All rights reserved.
Author: Thomas Snyder
Email: tom.snyder@dupont.com, tom@3ddd.com
Description:  Unit test for DD_SandboxPostscript_UT
*******************************************************************************/
@isTest
private class DD_SandboxPostscript_UT {

    private class MockSandboxContext implements SandboxContext
    {
        public ID organizationId(){return '00D200000001111';}
        public ID sandboxId(){return '00D200000001112';}
        public string sandboxName(){return 'mytestsandbox';}
    }


    static testMethod void test_SandboxPostscript() {
        
        SandboxContext context = new MockSandboxContext();
        
        Profile p = [select id from profile where Name='System Administrator' limit 1];
        User u = new User(alias = 'test',
            email='test@betatesters.com',
            emailencodingkey='UTF-8',
            FirstName = 'beta',
            lastname='Tester',
            languagelocalekey='en_US',
            localesidkey='en_US',
            profileid = p.Id,
            timezonesidkey='America/New_York',
            isActive = true,
            username='test@betatesters.com');
        insert u;
        
       
        Lead testLead = new Lead(FirstName = 'Default', LastName = 'Default', Company = 'TestCo.',
                                     Email = 'testemail@yop.com');
        INSERT testLead;
        
        test.startTest();
        
        test.testSandboxPostCopyScript( new DD_SandboxPostscript(), context.organizationID() ,context.sandboxId(), context.sandboxName());
        test.stopTest();
        
        system.assertEquals('test@betatesters.com',[Select email from User where id=:u.id].email, 'Sys Admins with *.invalid emails will be reset. (.invalid will be removed)');
    Contact testContact = new Contact(FirstName = 'Default', LastName = 'Default',
                                         Email = 'testemail@yop2.com');
        INSERT testContact;
        
           Map<String,String> objectFieldMap = new Map<String,String>{'Contact' => 'Email'};
           batchInvalidateCustomerEmailonObject  emailUpdate = new batchInvalidateCustomerEmailonObject (objectFieldMap, 
                                                                                                                         'test@test.com;');
                       Database.executeBatch(emailUpdate);    
   
    }
    
}