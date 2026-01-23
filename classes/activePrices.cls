/*
 * Name      :      activePrices
 * Description  :   This class acts as a controller to Active_Prices_Batch VF Page
 * Author      :    Tata Consultancy Services <CC20191007>
 * Created Date :   07 October 2019
 *
 *   Ver.                     Developer                           Changes                                          Dependancies
---------------------------------------------------------------------------------------------------------------------------------------
 *
 
*/

Public class activePrices{
    public Map<String,List<Id>> batchIds=new Map<String,List<Id>>();
    public Id batchId;
    Boolean batchStatusBool;
    public string selectedBusiness{get;set;}
    
    Public activePrices(){
        selectedBusiness=System.currentPagereference().getParameters().get('BuName');
    }
    
    public list<selectOption> getBusinessList(){
        Id loggedInUser = UserInfo.getUserId();
        set<string> tempSet = new set<string>();
        List<string> tempList = new List<string>();
        list<selectOption> businesslist = new list<selectOption>();
        list<Organizational_Group_User__c> ogiList = new list<Organizational_Group_User__c>();
        ogiList  = [select Organizational_Group_Item__r.Business__r.Business__c from Organizational_Group_User__c where Related_User__r.id =: loggedInUser and Organizational_Group_Item__r.Business__r.Business__c != null];
        if(ogiList != null && ogiList.size()>0){
            for(Organizational_Group_User__c og: ogiList){ 
                tempset.add(og.Organizational_Group_Item__r.Business__r.Business__c);               
            }
            if(tempSet!=null && tempSet.size()>0){
                tempList.addAll(tempset);
                tempList.sort();
            }
            if(tempList!= null && tempList.size()>0){
                if(tempList.size()>1){
                    businesslist.add(new SelectOption('--Select--','--Select--'));
                }
                for(string bu: tempList){ 
                    businesslist.add(new SelectOption(bu,bu));
                }
            }
            return businesslist;
        }else{
            return null;
        }
    }
    
    Public void executeButton(){
        batchStatusBool = false;
        checkBatchStatus();
        if(selectedBusiness!= null && selectedBusiness!='--Select--'){
            if(batchStatusBool == false){
                try{
                    markActivePrices obj = new markActivePrices(selectedBusiness);
                    batchId = Database.executeBatch(obj, 2000);
                    System.debug('***batch executed successfully');
                    List<Id> businessBatch=new List<Id>();
                    if(batchIds.containskey(selectedBusiness)){
                        businessBatch = batchIds.get(selectedBusiness);
                    }
                    businessBatch.add(batchId);
                    batchIds.put(selectedBusiness,businessBatch);
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Active Price Report preparation is in Progress for '+ selectedBusiness+'. You will be receiving an e-mail notification when it is completed.'));
                }
                catch(Exception e){
                    System.debug('**(Exception caught '+e);
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'An error has occured. Please contact system Administrator.'));
                }
                 
            }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Active Price Reporting run is already in Progress for '+ selectedBusiness+'. Please wait for the completion.')); 
            } 
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select a value for the Business'));
        }
    }
    
    public void checkBatchStatus(){
        List<Id> currentbatchs=new List<Id>();
        if(batchIds != null && batchIds.size()>0 ){
            for(String batch : batchIds.keyset()){
                if(batch == selectedBusiness){
                    currentbatchs=batchIds.get(batch);
                    break;
                }
            }
            List<AsyncApexJob> job = [SELECT Id, Status FROM AsyncApexJob WHERE Status != 'Completed' and Id =: currentbatchs];
            
            if(job!=null && job.size()>0){
                batchStatusBool = true;
            }else{
                batchStatusBool = false;
            }
        }
    }
}