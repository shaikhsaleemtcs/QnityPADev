@isTest
private class   ScheduleDeletionOfAbandonedRequest_UT
{
    static testMethod void ScheduleDeletionOfAbandonedRequestChangeMethod() 
    {   
        Test.startTest();
        ScheduleDeletionOfAbandonedRequest  m = new ScheduleDeletionOfAbandonedRequest();
        String sch = '0 24 15 * * ? ';
        system.schedule('Merge Job2',sch, m);
        test.stopTest();
    } 
    
}