/*******************************************************************************
Copyright © 2014 DuPont. All rights reserved. 
Author: Mounika Kompalli, Harjeet Singh
Email: Mounika_Kompalli@infosys.com, Harjeet_Singh04@infosys.com
Description:  Batch to generate and email CSV of all the Completed requests on a weeekly basis.
 ********************************************************************************/ 

global class ExporterCSV implements System.Schedulable {

    global void execute(SchedulableContext sc) {
        List<customer_data_request__c> acclist = new List<customer_data_request__c>();
        acclist = [Select Name, RecordType.Name , Customer_Name__c,Account_Group__c,Request_Status__c,SF_Region__c,Company_Code__c,Sales_Organization__c,SBU__c,
                   Group_Key__c,Distribution_Channel__c,Division__c,Approved_Credit_Term_Type__c,Approved_Credit_Limit_Currency_Code__c,LastModifiedDate,Approved_Terms_of_Payment__c,Owner.Name,CreatedBy.Name from customer_data_request__c where
                   Request_Status__c='Closed' and LastModifiedDate =LAST_WEEK];
        string header = 'Record Id ,Type Of Request, Customer Name , Account Group , Request Status , Region , Company code, Sales Organization , SBU , Group Key , Distribution Channel , Division , Approved Terms of Payment,Approved Credit Term Type , Currency code, Owner, Created By \n';

        string finalstr = header ;

        for(customer_data_request__c a: acclist)
        {
            string recordString = a.Name + ',' + a.RecordType.Name + ',' + a.Customer_name__c + ',' + a.Account_Group__c + ',' + a.Request_Status__c + 
            a.SF_Region__c + ',' + a.Company_Code__c + ',' + a.Sales_Organization__c + ',' + a.SBU__c + a.Group_Key__c + ',' + a.Distribution_Channel__c + ',' + a.Division__c + ',' +a.Approved_Terms_of_Payment__c+','+ a.Approved_Credit_Term_Type__c +
            a.Approved_Credit_Limit_Currency_Code__c + ','+a.Owner.Name +',' + a.CreatedBy.Name+','+ '\n';
            finalstr = finalstr + recordString;
        }

        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Closed Requests Report.csv';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        csvAttc.setContentType('text/csv');
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'sravanthi.lakkimsetty@gmail.com'};
        String subject = 'Weekly Report on Closed Requests';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Hi, Please find the weekly report on all the closed requests');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
}