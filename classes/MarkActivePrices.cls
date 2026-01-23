/*
 * Name      :      MarkActivePrices
 * Description  :   This Batch class marks all active prices for the provided business.
 * Author      :    Tata Consultancy Services <CC20191007>
 * Created Date :   07 October 2019
 *
 *   Ver.                     Developer                           Changes                                          Dependancies
---------------------------------------------------------------------------------------------------------------------------------------
 *
 
*/

global class MarkActivePrices implements Database.Batchable<sObject>, Database.Stateful{
    global final String selectedBu;
    global Map<String,ERP_Sales_Prices_SAP__c> allPrices= new Map<String,ERP_Sales_Prices_SAP__c>();
    global List<ERP_Sales_Prices_SAP__c> allActivePrices= new List<ERP_Sales_Prices_SAP__c>();
    global List<ERP_Sales_Prices_SAP__c> allNonPrices=new List<ERP_Sales_Prices_SAP__c>();
    
    global MarkActivePrices(String bu){
        selectedBu=bu;
    }

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'select id,Price_Holder__c,PCKC__c,markForDeletion__c,isActive__c,Valid_From__c,Valid_To__c from ERP_Sales_Prices_SAP__c where isPriceHolder__c=false and Price_Holder__c!=null and BU__c like \'%'+selectedBu+'%\' order by PCKC__c,Approved_Date__c desc';
        system.debug('***query '+query);
        system.debug('***bu'+selectedBu);
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<ERP_Sales_Prices_SAP__c> scope){
        if(scope!=null){
            for(ERP_Sales_Prices_SAP__c price : scope){
                if(allPrices!=null && allPrices.containsKey(price.PCKC__c)){
                    if(price.isActive__c==true){
                        price.isActive__c=false;
                        allNonPrices.add(price);
                    }
                }
                else{
                    system.debug('****pckc '+price.PCKC__c+' **valid from '+price.Valid_From__c+' ****valid to '+price.Valid_To__c+' **deletion '+price.markForDeletion__c+' **active '+price.isActive__c);
                    if(price.Valid_From__c<= System.today() && price.Valid_To__c>= System.today()){
                        allPrices.put(price.PCKC__c,price);
                        if(price.markForDeletion__c==false){
                            if(price.isActive__c==false){
                                price.isActive__c=true;
                                allActivePrices.add(price);
                            }
                        }
                        else{
                            if(price.isActive__c==true){
                                price.isActive__c=false;
                                allNonPrices.add(price);
                            }
                        }
                    }
                    else{
                        if(price.isActive__c==true){
                            price.isActive__c=false;
                            allNonPrices.add(price);
                        }
                    }
                }
            }
            System.debug('Count of allActivePrices '+allActivePrices.size());
            System.debug('Count of allNonPrices '+allNonPrices.size());
            System.debug('Count of allPrices '+allPrices.size());
            if(allActivePrices!=null && allActivePrices.size()>0){
                update allActivePrices;
                allActivePrices.clear();
            }
            if(allNonPrices!=null && allNonPrices.size()>0){
                update allNonPrices; 
                allNonPrices.clear();
            }
            
            // to work for Bulk data
            if(allPrices.size()>=48000){
                Set<String> allPricesKeySet=allPrices.keySet();
                List<String> allPricesKeyList= new List<String>();
                allPricesKeyList.addall(allPricesKeySet);
                String lastElement=allPricesKeyList[allPricesKeyList.size()-1];
                ERP_Sales_Prices_SAP__c lastPrice=allPrices.get(lastElement);
                allPrices.clear();
                allPrices.put(lastElement,lastPrice);
            }
        }
        
    }

    global void finish(Database.BatchableContext BC){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        User userEmail=[select Email from user where id=:UserInfo.getUserId() limit 1];
        String[] toAddresses = new String[] {userEmail.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Active Price Reporting is Completed for '+selectedBu);
        string temp=EncodingUtil.urlEncode(selectedBu, 'UTF-8');
        String reportlink=System.Label.ActivePricesReportLink;
        mail.setHtmlBody('<html lang="ja"><body>Please <a href="'+reportlink+temp+'">click </a>to run the report of Active Prices for '+ selectedBu +'.<footer><p>Thank you,<br>Salesforce.com Price Approval</p></footer></body></html>');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}