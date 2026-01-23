@isTest
public with sharing class PAMultiselectController_UT{
    static testMethod void multiselectControllerTestMethod(){
    
        PAMultiselectController mc = new PAMultiselectController();
        
        mc.leftOptions = new List<SelectOption>();
        mc.rightOptions = new List<SelectOption>();
        
        mc.leftOptionsHidden = 'A&a&b&b&C&c';
        mc.rightOptionsHidden = '';
        
        System.assertEquals(mc.leftOptions.size(),3);
        System.assertEquals(mc.rightOptions.size(),0);
    }
}