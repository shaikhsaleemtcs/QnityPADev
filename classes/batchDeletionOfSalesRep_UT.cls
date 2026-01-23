@Istest
public class batchDeletionOfSalesRep_UT {
	
static testmethod void batchDeletionOfSalesRep_UT()
{
    ERP_Customer__c erpCustomer1 = new ERP_Customer__c();
    erpCustomer1.Customer_Code__c = 'T001';
    erpCustomer1.Sales_Org_Code__c = 'A640';
    erpCustomer1.Distribution_Channel_Code__c = '10';
    erpCustomer1.Division_Code__c = '02';
    erpCustomer1.Currency_Code__c = 'USD';
    insert erpCustomer1;
    
    ERP_Relationship__c  relation = new ERP_Relationship__c();
	relation.Deletion_Flag__c = true;
    relation.ERP_Customer__c = erpCustomer1.id;
	insert relation;
	
    // testing batch class
    batchDeletionOfSalesRep batch = new batchDeletionOfSalesRep();
    database.executeBatch(batch);
    
    // testing scheduler
    batchDeletionOfSalesRep scheduler = new batchDeletionOfSalesRep();
	String sch = '0 0 * * * ?';
	system.schedule('deleteSalesRep', sch, scheduler );
}
}