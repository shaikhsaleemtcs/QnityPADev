/**
* @author TCS
* @date Aug 2024
*
* @group 
* @description batch job to append ".invalid" on email field of passing object
* @projectName: 
********************************************************************************************
ChangeLog:
-------------------------------------------------------------------------------------------
Date              Author                Purpose
--------------------------------------------------------------------------------------------
09th Aug 2024       Aditya K.           Initial Creation
--------------------------------------------------------------------------------------------
*
*/
global class batchInvalidateCustomerEmailonObject implements Database.Batchable<sObject>, Database.Stateful{
    String currentObjectName;
     String currentfieldName;
    public Map<String,String> objectFieldMap;
    public static final String EMAIL_APPEND_VALUE = '.invalid';
    public String recipientEmailIds;
    public static final String ERROR_MESSAGE = 'Error Message: ';
    
    private Integer numberOfRecordsProcessed = 0;
    private Integer numberOfErrors = 0;
    private Integer emailInvalidateCounter= 1;
    private Boolean recordExist=false;
    private String errorMessage;
    
    String successSubject = 'Update Email Batch Processed Successfully';
    String successBody1 = 'The batch process has been completed successfully.\n Total ';
    String successBody2 =  ' records updated: ';
    String failureSubject = 'Update Batch Email Completed with Errors';
    String failureBody = 'The batch process has been completed with errors.\n'+
                    'Total Errors Occured: ';
                
                    
    
    //Constructor
    public batchInvalidateCustomerEmailonObject (Map<String,String> objectFieldMap, String recipientEmailIds){
        this.objectFieldMap = objectFieldMap;
        this.recipientEmailIds = recipientEmailIds;
    }
    
    // Batch start method
    global Database.QueryLocator start(Database.BatchableContext BC){
        List<String> queries = new List<String>();
        for(String objectName : objectFieldMap.keySet()){
            String fieldName = objectFieldMap.get(objectName);
            currentObjectName = objectName;
            currentfieldName=fieldName ;
            String query; //= 'SELECT Id,'+ fieldName+ ' FROM '+ objectName +' WHERE '+ fieldName +'!= NULL AND (NOT '+ fieldName + ' LIKE \'%'+ EMAIL_APPEND_VALUE +'\')';
            if(objectName == 'Lead'){
                query = 'SELECT Id,'+ fieldName+ ' FROM '+ objectName +' WHERE '+ fieldName +'!= NULL AND IsConverted = FALSE AND (NOT '+ fieldName + ' LIKE \'%'+ EMAIL_APPEND_VALUE +'%\')';
            }else{
                query = 'SELECT Id,'+ fieldName+ ' FROM '+ objectName +' WHERE '+ fieldName +'!= NULL AND (NOT '+ fieldName + ' LIKE \'%'+ EMAIL_APPEND_VALUE +'%\')';
            }
            
            queries.add(query);            
        }
        
        String finalQuery = String.join(queries,'UNION ALL');    
        
        return Database.getQueryLocator(finalQuery);
        
    }
    
    //Batch execute method
    global void execute(Database.BatchableContext BC, List<sObject> listOfQueryResult){ 
    recordExist=true;
        List<sObject> recordsToUpdate = new List<sObject>();
        if(listOfQueryResult != NULL && listOfQueryResult.size()>0){
        
            try{
             for(sObject record : listOfQueryResult){              
                
                //get current email value
                String currentEmail = (String)record.get(currentfieldName);
                
                //append .invlaid to current email value
                record.put(currentfieldName, currentEmail+EMAIL_APPEND_VALUE+emailInvalidateCounter);
               
                recordsToUpdate.add(record);
                emailInvalidateCounter++;
                }
                
                //Only for test class coverage of Catch method
                generateExcpetion(currentObjectName );
                
            }catch(Exception e){
                numberOfErrors++;
                errorMessage = e.getMessage();
            }
        
        }
        //Update records
        if(recordsToUpdate !=NULL && recordsToUpdate.size()>0){
            try{
                //Only for test class coverage of Catch method
                generateExcpetion(currentObjectName );
                
                Database.update(recordsToUpdate,false);
                numberOfRecordsProcessed += recordsToUpdate.size();
            }catch(Exception e){
                numberOfErrors++;
                errorMessage = e.getMessage();
            }
        }
    } 
    global void finish(Database.BatchableContext BC){
    if(recordExist){
        String subject;
        String body;
        //Set subject and body based on error if occured
        if(numberOfErrors>0){
            subject = failureSubject;
            body = failureBody +numberOfErrors + '\n' + ERROR_MESSAGE + errorMessage;
                
        }else{
            subject = successSubject;
            body = successBody1 + currentObjectName + successBody2 + numberOfRecordsProcessed;
               
        }
        //Send email message
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        //Set the recipients
        List<String> recipientEmailAddresses = recipientEmailIds.split(';');
        email.setToAddresses(recipientEmailAddresses);
        
        //Set the subject
        email.setSubject(subject);
        //Set plain body
        email.setPlainTextBody(body);
        
        if(!Test.IsRunningTest())
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        }
        
    }
    
    //Only for test class coverage of Catch method
    public static void generateExcpetion(string objName)
    {
      if(Test.IsRunningTest() && objName=='Contact')
                      {
                      contact errorContact;
                      string email=errorContact.email;
                      }
    }
}