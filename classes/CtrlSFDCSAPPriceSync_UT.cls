@IsTest
public class CtrlSFDCSAPPriceSync_UT {
    
    @isTest
    static void SAPpricesynctest()
    {
        Account acc = new Account(Name = 'Test Account', AccountNumber= 'Test123');
        insert acc; 
        
        List<Account> getact = [select Id, Name from Account where id =: acc.Id]; 
        ApexPages.StandardSetController stdcontroller = new ApexPages.StandardSetController(getact);
        CtrlSFDCSAPPriceSync CSPS = new CtrlSFDCSAPPriceSync(stdcontroller);
    }

}