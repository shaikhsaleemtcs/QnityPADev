/*******************************************************************************
Copyright Â© 2015 DuPont. All rights reserved. 
Author: Nishant Chopra
Email: nishant_chopra01@infosys.com
Description:  Controller for page: CustomerOnboardingRequest
Change History : Alvin Johnson (alvin_johnson@infosys.com) Added code for R02 Enhancement  
                 <Alvin20150824> 
               : Nishanth.H 15092015> Added for R02 enhancement-Updating selling company code value('1131 - DuPont (Shanghai) Sourcing Center Company, Ltd.')
               : <Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules 
               : <Kala20151001> Added for R02 enhancement in order to replace Credit when DCA and CA are same 
               : <RS20160607> Added condition for showing locked message for closed CDR IS ID-00069926 
               : <Bhargavi 20160919> Added new country Check (IS ID-00072470)           
 ********************************************************************************/ 

public class CtrlCOBUtilCustomerOnboardingRequest{

    public String id { get; set; }
    public static final string NewCustomerCreation_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','New_Customer_Creation');
    public static final string Extend_Existing_Customer_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Extend_Existing_Customer');
    public static final string PARTNERLINKEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Create_partner_function_Link_Contact_Link_Existing_Partner');
    public static final string MISCELLANEOUSEXISTINGCUSTOMER_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Miscellaneous_customer_data_request');
    public static final string MODIFYEXISTINGCUSTDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Existing_Customer_Data');
    public static final string MODIFYCREDITDATA_COB_RTYPE = Rtype.getIdByDevName('Customer_Data_Request__c','Modify_Credit_Data');
    public static final string Country_Credit_Analyst_Notification_RTYPE = Rtype.getIdByDevName('Business_Rules__c','Country_Credit_Analyst_Notification');
    public static final string DOA_Rules_RTYPE = Rtype.getIdByDevName('Business_Rules__c','DOA_Rules'); // <Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules 
    public String ProfileName{get;set;}
    public Customer_Data_Request__c OnboardingReq{get;set;}
    public Boolean displayMainPage{get;set;}
    public Id ReqId;
    public Boolean IsClone=false;
    public Static Id CurrentUserId{get;set;}
    public Static Id selectedRecordTypeId;
    public string RecordTypeName{get;set;}
    public Static Map<String,Id> QueueMap;
    public String IsSaveOrSubmit{get;set;}
    public Boolean isEdit=false;
    public boolean showEditErrorPage{get;set;}
    public boolean isComplete{get;set;}
    public boolean isReject{get;set;}
    public boolean CAReview{get;set;}
    public boolean CSRReview{get;set;}

    public String SubCtrlButtonClicked{get;set;}
    public Boolean DMSProfile{get;set;}
    public boolean CAProfile{get;set;}
    public boolean sendToCA{get;set;}
    public boolean FlagSaveDirectly{get;set;} 
    public Boolean openOtherGroupKey{get;set;}
    public boolean downloadPopUpFlag{get;set;}
    public Boolean IsContactError=false;
    public Boolean isRender{get;set;}
    public Boolean isDataAnalystRender{get;set;}
    public Boolean IsError=false;
    public Boolean PageAccess {get;set;}
    public Boolean Ishide{get;set;}
    public boolean RecordLocked{get;set;}
    public string recordID{get;set;}
    public String CurrencyInDollar;


    /**
     * Name: COBctrlCustomerOnboardingRequest
     * Params: None
     * Description: Constructor of the class.  
     */
    public CtrlCOBUtilCustomerOnboardingRequest(){
        displayMainPage = true;
        showEditErrorPage=false;
        isComplete = false;
        isReject = false;
        CAReview = false;
        FlagSaveDirectly=false;
        CSRReview = false;

        CAProfile=false;
        DMSProfile=false;
        isEdit= false;
        SubCtrlButtonClicked = '';
        sendToCA=false;
        CurrentUserId = userInfo.getUserId();
        ProfileName = currentUserProfile();
        downloadPopUpFlag = false;
        PageAccess=false;
        isEdit= false;
        ishide= false;
        RecordLocked=false;
        isRender= true;
        isDataAnalystRender = true;
        CurrencyInDollar='';

        if(ProfileName.contains('Credit Analyst') || ProfileName.contains('Credit Process Managers')){
            DMSProfile=false;
            CAProfile=true;
        }
        if(ProfileName.contains('Data Analyst') || ProfileName.contains('DMS Process Managers')){
            DMSProfile=true;
            CAProfile=false;
        }
        
       
        fetchQueueMap();
        Map <String,String> currentURLParameters = new Map<String,String>();
        currentURLParameters  = ApexPages.currentPage().getParameters();
        recordID=currentURLParameters.get('Id');
        OnboardingReq = new Customer_Data_Request__c();
        selectedRecordTypeId = currentURLParameters.get('RecordTypeId');
        OnboardingReq.RecordTypeId = selectedRecordTypeId ;
        RecordTypeName=fetchRecordTypeName();
        

        if(currentURLParameters.get('Id')=='null' && (CAProfile==true)){
            system.debug('$$$$$$');
            OnboardingReq.Request_status__c= 'Awaiting Credit Approval';
            OnboardingReq.Credit_Approval_Required__c=true;
            isRender=false;
            isDataAnalystRender = false;
        }

        if(currentURLParameters.get('Id')=='null' && (DMSProfile==true)){
            OnboardingReq.Request_status__c= 'Awaiting Data Analyst (DMS Team) Approval';

            isRender=false;
            isDataAnalystRender = true;
        }  
        
          //Insertion of new Request

        if(currentURLParameters.get('Id')=='null' && currentURLParameters.get('Clone')=='null' ){
            populateRequestorInformation(); //To prepopulate the Requestor Information
            if(currentURLParameters.get('RecordTypeId') !=null)
                IsClone = false;
            isEdit= true;

        }

        if(currentURLParameters.get('btnClicked')!='null'){
            SubCtrlButtonClicked = currentURLParameters.get('btnClicked');
        }

        // Updation of Existing Request

        if(currentURLParameters.get('Id')!='null' && currentURLParameters.get('Clone')=='null' ){
            ReqId = currentURLParameters.get('Id');
            IsClone = false;
            OnboardingReq = getRequestInformation(ReqId);  //to  populate the existing information of the Request
            isEdit= true;
            if(OnboardingReq.Record_Locked__c==true || OnboardingReq.Request_Status__c== 'Closed' ){// <RS20160607> Added condition for showing locked message for closed CDR IS ID-00069926  
                displayMainPage=false;
                showEditErrorPage=true;
            }else if((OnboardingReq.Request_status__c == 'Awaiting Destination Credit Approval' || OnboardingReq.Request_status__c == 'Awaiting Credit Approval') && CAProfile==false){
                displayMainPage=false;
                showEditErrorPage=true;
            }else if(OnboardingReq.Request_Status__c=='Awaiting Data Analyst (DMS Team) Approval' && DMSProfile==false){
                displayMainPage=false;
                showEditErrorPage=true;
            }

        }
        if(OnboardingReq !=null){
            if(OnboardingReq.Credit_Approval_Required__c ==true){
                sendToCA=true;
            }else 
                sendToCA=false;
        }
    }

    /**
     * Name: populateRequestorInformation
     * Params: None
     * Description: Method to populate requestor information.
     */
    public void populateRequestorInformation(){
        User RequestorUser = new User();
        RequestorUser = [Select Id, Name, Phone,Email from User where Id=:CurrentUserId ];
        OnboardingReq.Requestor_Name__c=RequestorUser.Name;
        OnboardingReq.Requestor_phone_number__c=RequestorUser.Phone;
        OnboardingReq.Requestor_Email__c=RequestorUser.Email;
    }

    /** 
     * Name: SendforReviewComment
     * Params: all required for Redirect to New Page
     * Description: Method will be called on when Send for any Review button pressed.
     */ 
    public PageReference SendforReviewComments(){

        PageReference pg = new Pagereference('/apex/SubCustomerOnboardingRequest?RecordTypeId='+OnboardingReq.RecordTypeId+'&Id='+OnboardingReq.Id+'&Clone=null'+'&btnClicked='+SubCtrlButtonClicked);
        pg.setredirect(true);
        return pg; 
    }

    //<Nishant20150623> calling populateCurrency in SaveAndSubmit and doing the remaining functions only when isError is false
    /**
  Name: SaveAndSubmit
     * Params: None
     * Description: Method will be called on when request has to be Saved and Submit.
     */ 
    public PageReference SaveAndSubmit(){
        populateCurrency();
        if(IsError == false){
            if((CAProfile==true) && (OnboardingReq.Request_Initiator__c == null)){
                OnboardingReq.Request_Initiator__c ='CA Initiated';
            }   
            if((DMSProfile==true)&& (OnboardingReq.Request_Initiator__c == null)){
                OnboardingReq.Request_Initiator__c ='DMS Initiated';
            }   
            if(FlagSaveDirectly ==true){
                //code for Validating the Approved Credit Limit and Destination credit limit....
                if(CAProfile==true){
                    if(OnboardingReq.Request_status__c == 'Awaiting Credit Approval'){
                        if(OnboardingReq.RecordTypeId == NewCustomerCreation_COB_RTYPE || OnboardingReq.RecordTypeId == MODIFYEXISTINGCUSTDATA_COB_RTYPE || (OnboardingReq.RecordTypeId == Extend_Existing_Customer_COB_RTYPE && OnboardingReq.Account_Group__c != 'Z002 ( Ship-to party )')){
                            try{
                                Decimal ApprovedCreditLimit = Decimal.valueOf(OnboardingReq.Approved_Credit_Limit__c);
                                if(ApprovedCreditLimit<=0){
                                    OnboardingReq.Approved_Credit_Limit__c.addError('Approved Credit Limit Can contain Only numbers which should be Greater then Zero');
                                    return null;
                                }
                            }
                            Catch(Exception e){
                                OnboardingReq.Approved_Credit_Limit__c.addError('Approved Credit Limit Can contain Only numbers which should be Greater then Zero ');
                                return null;
                            }
                        }
                    } else if(OnboardingReq.Request_status__c == 'Awaiting Destination Credit Approval'){ 
                        if(OnboardingReq.RecordTypeId == NewCustomerCreation_COB_RTYPE || OnboardingReq.RecordTypeId == MODIFYEXISTINGCUSTDATA_COB_RTYPE || (OnboardingReq.RecordTypeId == Extend_Existing_Customer_COB_RTYPE && OnboardingReq.Account_Group__c != 'Z002 ( Ship-to party )')){
                            try{
                                Decimal destinationCreditLimit = Decimal.valueOf(OnboardingReq.Destination_Credit_limit__c);
                                if(destinationCreditLimit<=0){
                                    OnboardingReq.Destination_Credit_limit__c.addError('Destination Credit Limit Can contain Only numbers which should be Greater then Zero');
                                    return null;
                                }
                            }
                            Catch(Exception e){
                                OnboardingReq.Destination_Credit_limit__c.addError('Destination Credit Limit Can contain Only numbers which should be Greater then Zero');
                                return null;
                            }
                        }
                    }
                }
            }
            // End of Validation Rule..
            if(IsSaveOrSubmit=='Save'){ //Normal Save of a record
                if(IsClone ==false && ReqId==null){ //New record creation
                    try{
                        insert OnboardingReq;
                    }
                    catch(exception e){
                        ApexPages.addmessages(e);
                        return null;
                    }
                    return new PageReference('/'+ OnboardingReq.Id);
                }if(IsClone==false && ReqId!=null){ //Updating an existing record
                    try{
                        update OnboardingReq;
                    }
                    catch(exception e){
                        ApexPages.addmessages(e);
                        return null;
                    }
                    return new PageReference('/'+OnboardingReq.Id);
                }else return null;
            }else if(IsSaveOrSubmit=='Submit'){ // Submitting a record that will subject it to Status and Owner Change

                if(IsClone ==false && ReqId==null){ //New record creation
                    try{
                        RequestFlow();
                        insert OnboardingReq ;
                    }
                    catch(exception e){
                        ApexPages.addmessages(e);
                        return null;
                    }
                    //Code for to test sold to country and selling company code
                    Boolean countryFlag=false;
                    if(!DMSProfile==true){
                        String countrycode=null;
                        if(OnboardingReq.Sold_to_Country__c!=null){
                            countrycode=(OnboardingReq.Sold_to_Country__c.substring(5,OnboardingReq.Sold_to_Country__c.length()));
                        }
                        if(countrycode !=null && OnboardingReq.Company_Code__c.contains(countrycode)){
                            countryFlag=true;
                        }
                    }else
                        return new PageReference('/'+OnboardingReq.Id);
                    if(!countryFlag){
                        return new PageReference('/apex/DCASubmittingMessagePage');
                    }else
                        return new PageReference('/'+OnboardingReq.Id);
                        
                }else if(IsClone==false && ReqId!=null){ //Updating an existing record
                    try{
                        RequestFlow();
                        update OnboardingReq ;
                    }
                    catch(exception e){
                        ApexPages.addmessages(e);
                        return null;
                    }
                    //Code for to test sold to country and selling company code
                    Boolean countryFlag=false;
                    if(CAProfile==true){
                        return new PageReference('/apex/DCASubmittingMessagePage');
                    }
                    if(!DMSProfile==true){
                        String countrycode=null;
                        if(OnboardingReq.Sold_to_Country__c!=null){
                            countrycode=(OnboardingReq.Sold_to_Country__c.substring(5,OnboardingReq.Sold_to_Country__c.length()));
                        }
                        if(countrycode !=null && OnboardingReq.Company_Code__c.contains(countrycode)){
                            countryFlag=true;
                        }
                    }else   // Start of Bhargavi 20160919
                            if (DMSProfile==true){
                                system.debug('send for CA review');
                            return new PageReference('/apex/DCASubmittingMessagePage');
                            }  // end of Bhargavi 20160919
                        else 
                        return new PageReference('/'+OnboardingReq.Id);
                    if(!countryFlag){
                        return new PageReference('/apex/DCASubmittingMessagePage');
                    }else
                        return new PageReference('/'+OnboardingReq.Id);
                }else return null;
            }else return null;
        }
        else return null;
    } 



    /**
     * Name: currentUserProfile
     * Params: None
     * Description: Method to get profile of Current user.
     */ 
    public String currentUserProfile(){
        Id ProfileId = UserInfo.getProfileId();
        String profileName=[Select Id,Name from Profile where Id=:ProfileId].Name;
        return profileName;
    }

    /**
     * Name: Cancel
     * Params: None
     * Description: Method will be called when request is cancelled from the page.
     */ 
    public PageReference Cancel(){
        If(ReqId!=null){
            return new PageReference ('/' + ReqId);
        }
        else{
            return new PageReference ('/a0j/o' );
        }
    }
    /**
     * Name: PrepopulateCreditLimit
     * Params: None
     * Description: Method to populate default credit limit.
     */
    public void PrepopulateCreditLimit(){
        If(OnboardingReq.Approved_Terms_of_Payment__c=='CIA-Payment In Advance'){
            OnboardingReq.Approved_Credit_Limit__c= '111';
        }
        else{
            OnboardingReq.Approved_Credit_Limit__c = '0';
        }
        If(OnboardingReq.Destination_Terms_of_Payment__c=='CIA-Payment In Advance'){
            OnboardingReq.Destination_Credit_limit__c= '111';
        }
        else{
            OnboardingReq.Destination_Credit_limit__c= '0';
        }

    }

    /**
     * Name: getRequestInformation
     * Params: reqId: Customer_Data_Request__c Id to fetch all the details of the record
     * Description: Method to get details of the record based on the parameter passed.
     */
    public Customer_Data_Request__c getRequestInformation(Id reqId){
        Customer_Data_Request__c req = new Customer_Data_Request__c();
        Map<String, Schema.SObjectField> fldObjMap = schema.SObjectType.Customer_Data_Request__c.fields.getMap();
        String querySearch= '';
        String query;
        for(String s :fldObjMap.KeySet()){
            querySearch = querySearch + s + ',';
        }
        querySearch = querySearch.removeEnd(',');
        query = 'Select '+  querySearch + ',RecordType.Name,CreatedBy.Id from Customer_Data_Request__c where Id=\''+reqId+'\'';
        req=database.query(query);
        return req;
    }

    /**
     * Name: fetchQueueMap
     * Params: None
     * Description: Method to fetch all the queues and create a map.
     */
    public void fetchQueueMap(){
        QueueMap = new Map <String,Id>();
        list<Group> QueueList = [select Id,Name from Group Where Type = 'Queue'];
        for(Group q:QueueList){
            QueueMap.put(q.Name,q.Id);
        }      
    }

    /**
     * Name: fetchRecordTypeName
     * Params: None
     * Description: Method to fetch RecordType Names.
     */  

    public String fetchRecordTypeName(){
        if(selectedRecordTypeId != null){
            RecordTypeName = [Select Id,Name from RecordType where SobjectType='Customer_Data_Request__c' and IsActive=true and Id=:selectedRecordTypeId ].Name;
            return RecordTypeName;
        }return null;
    }  

    /**
     * Name: CopyProposedCreditData
     * Params: None
     * Description: Method to be called when Copying the Proposed terms in the approved Section.
     */ 
    Public void CopyProposedCreditData(){
        if(OnboardingReq.Copy_Proposed_Credit_Data__c==false){
            OnboardingReq.Copy_Proposed_Credit_Data__c= True;
        }
        else if(OnboardingReq.Copy_Proposed_Credit_Data__c= True){
            OnboardingReq.Copy_Proposed_Credit_Data__c= false;
        }
        if(OnboardingReq.Copy_Proposed_Credit_Data__c == true){
            if(OnboardingReq.Proposed_Terms_of_Payment__c!=null)
                OnboardingReq.Approved_Terms_of_Payment__c = OnboardingReq.Proposed_Terms_of_Payment__c;
            if(OnboardingReq.Proposed_Cash_Management_Group__c!=null)
                OnboardingReq.Approved_Cash_Management_Group__c = OnboardingReq.Proposed_Cash_Management_Group__c;
            if(OnboardingReq.Proposed_Cred_rep_grp__c!=null)
                OnboardingReq.Approved_Cred_rep_grp__c = OnboardingReq.Proposed_Cred_rep_grp__c;
            if(OnboardingReq.Proposed_credit_information_number__c!=null)
                OnboardingReq.Approved_credit_information_number__c = OnboardingReq.Proposed_credit_information_number__c;
            if(OnboardingReq.Proposed_Credit_Limit__c!=null)
                OnboardingReq.Approved_Credit_Limit__c = OnboardingReq.Proposed_Credit_Limit__c;
            if(OnboardingReq.Proposed_Credit_Limit_Currency_Code__c!=null)
                OnboardingReq.Approved_Credit_Limit_Currency_Code__c = OnboardingReq.Proposed_Credit_Limit_Currency_Code__c;
            if(OnboardingReq.Proposed_Credit_Term_Type__c!=null)
                OnboardingReq.Approved_Credit_Term_Type__c = OnboardingReq.Proposed_Credit_Term_Type__c;
            if(OnboardingReq.Proposed_Customer_credit_group__c!=null)
                OnboardingReq.Approved_Customer_credit_group__c = OnboardingReq.Proposed_Customer_credit_group__c;
            if(OnboardingReq.Proposed_Customer_Group__c!=null)
                OnboardingReq.Approved_Customer_Group__c = OnboardingReq.Proposed_Customer_Group__c;
            if(OnboardingReq.Proposed_Non_Standard_Terms_of_Payment__c!=null)
                OnboardingReq.Approved_Non_Standard_Terms_of_Payment__c = OnboardingReq.Proposed_Non_Standard_Terms_of_Payment__c;
            if(OnboardingReq.Proposed_Payment_Index__c!=null)
                OnboardingReq.Approved_Payment_Index__c = OnboardingReq.Proposed_Payment_Index__c;
            if(OnboardingReq.Proposed_Rating__c!=null)
                OnboardingReq.Approved_Rating__c = OnboardingReq.Proposed_Rating__c;
            if(OnboardingReq.Proposed_Reference_date__c!=null)
                OnboardingReq.Approved_Reference_date__c = OnboardingReq.Proposed_Reference_date__c;
            if(OnboardingReq.Proposed_Risk_Category__c!=null)
                OnboardingReq.Approved_Risk_Category__c = OnboardingReq.Proposed_Risk_Category__c;
            if(OnboardingReq.Estimated_Average_Monthly_Purchases__c !=null)
                OnboardingReq.Approved_Average_Monthly_Purchases__c=onboardingReq.Estimated_Average_Monthly_Purchases__c;
            if(OnboardingReq.Estimated_Number_of_Orders_per_Month__c !=null)
                OnboardingReq.Approved_Number_of_Orders_per_Month__c=OnboardingReq.Estimated_Number_of_Orders_per_Month__c ;
        }
        else{
            OnboardingReq.Approved_Cash_Management_Group__c = null;
            OnboardingReq.Approved_Cred_rep_grp__c = null;
            OnboardingReq.Approved_credit_information_number__c = null;
            OnboardingReq.Approved_Credit_Limit__c = null;
            OnboardingReq.Approved_Credit_Limit_Currency_Code__c = null;
            OnboardingReq.Approved_Credit_Term_Type__c = null;
            OnboardingReq.Approved_Customer_credit_group__c = null;
            OnboardingReq.Approved_Customer_Group__c = null; 
            OnboardingReq.Approved_Non_Standard_Terms_of_Payment__c = null;
            OnboardingReq.Approved_Payment_Index__c = null;
            OnboardingReq.Approved_Rating__c = null;
            OnboardingReq.Approved_Reference_date__c = null;
            OnboardingReq.Approved_Risk_Category__c = null;
            OnboardingReq.Approved_Terms_of_Payment__c= null;
            OnboardingReq.Approved_Average_Monthly_Purchases__c=null;
            OnboardingReq.Approved_Number_of_Orders_per_Month__c=null;
        }

        if(OnboardingReq.Proposed_Terms_of_Payment__c =='Others')
            OnboardingReq.Approved_Terms_of_Payment__c ='Other';

    }

    /**
     * Name: CancelAndClose
     * Params: None
     * Description: Method will be called on when request has to be cancelled and closed.
     */ 

    public Pagereference CancelAndClose(){
        if(CAProfile==true || DMSProfile==true){
            OnboardingReq.Send_To_OneDuPont__c  =true;
            OnboardingReq.Sent_To_OneDuPont__c=false;
            OnboardingReq.Record_Locked__c=true;
            OnboardingReq.Request_Status__c='Rejected';

            update OnboardingReq;
        }
        return new PageReference('/'+OnboardingReq.Id);
    }

    /**
     * Name: RedirectCancelAndClose
     * Params: None
     * Description: Method will be called on when request has to be cancelled and closed.
     */ 
    public Pagereference RedirectCancelAndClose(){
        if(IsClone==false && ReqId!=null){
            PageReference pg = new Pagereference('/apex/SubCustomerOnboardingRequest?RecordTypeId='+OnboardingReq.RecordTypeId+'&Id='+ReqId+'&Clone=null');
            pg.setredirect(true);
            return pg; 
        }
        return null;
    }   

    /**
     * Name: CopyProposedToDestinationCreditData
     * Params: None
     * Description: Method to be called when Copying the Proposed Datain the approved Section.
     */ 
    Public void CopyProposedToDestinationCreditData(){
        if(OnboardingReq.Copy_Proposed_Data__c ==false){
            OnboardingReq.Copy_Proposed_Data__c = True;
        }
        else if(OnboardingReq.Copy_Proposed_Data__c = True){
            OnboardingReq.Copy_Proposed_Data__c = false;
        }
        if(OnboardingReq.Copy_Proposed_Data__c == true){
            if(OnboardingReq.Proposed_Terms_of_Payment__c!=null)
                OnboardingReq.Destination_Terms_of_Payment__c = OnboardingReq.Proposed_Terms_of_Payment__c;
            if(OnboardingReq.Proposed_Non_Standard_Terms_of_Payment__c!=null)
                OnboardingReq.Dest_Non_Standard_Terms_of_Payment__c = OnboardingReq.Proposed_Non_Standard_Terms_of_Payment__c;
            if(OnboardingReq.Proposed_Credit_Term_Type__c!=null)
                OnboardingReq.Destination_credit_term_type__c = OnboardingReq.Proposed_Credit_Term_Type__c;
            if(OnboardingReq.Proposed_Credit_Limit__c!=null)    
                OnboardingReq.Destination_Credit_limit__c = OnboardingReq.Proposed_Credit_Limit__c;
            if(OnboardingReq.Proposed_Credit_Limit_Currency_Code__c!=null)  
                OnboardingReq.Destination_Credit_Limit_Currency_code__c = OnboardingReq.Proposed_Credit_Limit_Currency_Code__c;
            if(OnboardingReq.Proposed_Risk_Category__c!=null)
                OnboardingReq.Destination_risk_category__c = OnboardingReq.Proposed_Risk_Category__c;

        }else{
            OnboardingReq.Destination_Terms_of_Payment__c = null;
            OnboardingReq.Dest_Non_Standard_Terms_of_Payment__c= null;
            OnboardingReq.Destination_credit_term_type__c = null;
            OnboardingReq.Destination_Credit_limit__c = null;
            OnboardingReq.Destination_Credit_Limit_Currency_code__c = null;
            OnboardingReq.Destination_risk_category__c= null;
        }

        if(OnboardingReq.Proposed_Terms_of_Payment__c =='Others')
            OnboardingReq.Destination_Terms_of_Payment__c ='Other';
    }
    //<Kala20151001> Added for R02 enhancement in order to replace Credit when DCA and CA are same 
    /**
     * Name: CopyDestinationToApprovedCreditData
     * Params: None
     * Description: Method to be called when Copying the destination Data in the approved Section.
     */ 
    Public void CopyDestinationToApprovedCreditData(){

        if(OnboardingReq.Destination_Terms_of_Payment__c!=null)
            OnboardingReq.Approved_Terms_of_Payment__c = OnboardingReq.Destination_Terms_of_Payment__c;
        if(OnboardingReq.Dest_Non_Standard_Terms_of_Payment__c!=null)
            OnboardingReq.Approved_Non_Standard_Terms_of_Payment__c = OnboardingReq.Dest_Non_Standard_Terms_of_Payment__c;
        if(OnboardingReq.Destination_credit_term_type__c!=null)
            OnboardingReq.Approved_Credit_Term_Type__c = OnboardingReq.Destination_credit_term_type__c;
        if(OnboardingReq.Destination_Credit_limit__c!=null)    
            OnboardingReq.Approved_Credit_Limit__c = OnboardingReq.Destination_Credit_limit__c;
        if(OnboardingReq.Destination_Credit_Limit_Currency_code__c!=null)  
            OnboardingReq.Approved_Credit_Limit_Currency_Code__c = OnboardingReq.Destination_Credit_Limit_Currency_code__c;
        if(OnboardingReq.Destination_risk_category__c!=null)
            OnboardingReq.Approved_Risk_Category__c = OnboardingReq.Destination_risk_category__c;

    }
    
    /**
     * Name: setApprovedCreditTermType
     * Params: None
     * Description: Method to set Approved credit Term Type.
     */ 
    Public void setApprovedCreditTermType(){
        if(OnboardingReq.Copy_Proposed_Credit_Data__c ==true && Apexpages.currentPage().getParameters().get('SecondParam')!=null && Apexpages.currentPage().getParameters().get('SecondParam')!=''){
            OnboardingReq.Approved_Credit_Term_Type__c = Apexpages.currentPage().getParameters().get('SecondParam');
            OnboardingReq.Approved_Risk_Category__c = null;
        }
    }

    /**
     * Name: setDestinationCreditTermType
     * Params: None
     * Description: Method to set Destination credit Term Type.
     */ 
    Public void setDestinationCreditTermType(){
        if(OnboardingReq.Copy_Proposed_Data__c ==true && Apexpages.currentPage().getParameters().get('FourthParam')!=null && Apexpages.currentPage().getParameters().get('ForthParam')!=''){
            OnboardingReq.Destination_credit_term_type__c = Apexpages.currentPage().getParameters().get('FourthParam');
            OnboardingReq.Destination_Risk_Category__c = null;
        }
    }


    //<Nishant20150623> Changed populateCurrency from void to PageReference in order to have validations
    /**
     * Name: populateCurrency
     * Params: None
     * Description: Method will be called to convert the Approved Credit limit currency in Dollars.
     */ 
    public PageReference populateCurrency(){
        if(OnboardingReq !=null){
            Decimal approvedCredEstimated=0.0;
            if(OnboardingReq.Approved_Credit_Limit__c !='' && OnboardingReq.Approved_Credit_Limit__c !=null && OnboardingReq.Account_Group__c !='Z002 (Ship-to party)'){
                if(OnboardingReq.Approved_Credit_Limit_Currency_Code__c !='' && OnboardingReq.Approved_Credit_Limit_Currency_Code__c !=null){
                    String CurrencyCode =OnboardingReq.Approved_Credit_Limit_Currency_Code__c.subString(0,3);
                    CurrencyType curType =[Select Id,ConversionRate,IsoCode,IsActive From CurrencyType Where IsoCode =:CurrencyCode and IsActive =true];
                    try {
                        if(curType !=null){
                            Decimal proposedCred = Decimal.valueof(OnboardingReq.Approved_Credit_Limit__c);
                            if (proposedCred != 0){
                                approvedCredEstimated = proposedCred.Divide(curType.ConversionRate,2,System.RoundingMode.UP); 
                                CurrencyInDollar = String.ValueOf(approvedCredEstimated);

                            }
                            else {
                                CurrencyInDollar = String.ValueOf(approvedCredEstimated);

                            }
                        }
                    }  
                    Catch(exception e){
                        OnboardingReq.Approved_Credit_Limit__c.addError('Proposed Credit Limit Can contain Only numbers which should be Greater then Zero.');
                        return null;
                    }
                    if(Decimal.valueof(CurrencyInDollar) > 999999999.0000){
                        system.debug('Checking the USD value'+CurrencyInDollar);
                        this.IsError = true;
                        OnboardingReq.Approved_Credit_Limit__c.addError('Approved Credit Limit cannot be more than 999,999,999.0000 USD');
                        return null;
                    } else{
                        this.IsError = false;       
                        return null;
                    }                   
                } else return null;
            } else return null;
        } else return null;
    }


    /**
     * Name: RequestFlow
     * Params: none
     * Description: Method to Assign Owner and Lock the record when ever it is Submitted.
     */ 
    Public void RequestFlow(){
        fetchQueueMap();
        //populateCurrency();
        String CountryRuleRecordType='Country Rules Record';
        String DOARuleRecordType='DOA Rules';
        Boolean IsDOAApprovalRequired=false;
        Boolean IsDcaNDoaApproverSame=false;
        Boolean IsDcaNCaApproverSame=false;
        
        list<Id> QueueListIdsCa = new list<Id>();
        
        User DCAApprover=new User();

        list<Id> lst_CAProfileId =new list<Id>();
        list<Id> QueueListIds = new list<Id>();            
        Map<String, String> mapSellNQ = new Map<String, String>();
        list<Business_Rules__c> lst_DOAQueues = new list<Business_Rules__c>();
        lst_DOAQueues = [select id, Selling_Company_Code__c, Destination_Queue__c from Business_Rules__c where recordtypeId = : DOA_Rules_RTYPE];
        //<Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules
        for(Business_Rules__c bs : lst_DOAQueues){
            if(!mapSellNQ.containsKey(bs.Selling_Company_Code__c)){
                mapSellNQ.put(bs.Selling_Company_Code__c,bs.Destination_Queue__c);
            }
        }
        
        //<Alvin20150929> Added for R02 enhancement to replace selling company codes with business Rules 
        /* mapSellNQ.put('0003 - E.I. DuPont India Private Limited', 'Customer On-boarding DOA - India Queue');
            mapSellNQ.put('0029 - DU PONT CHINA LIMITED', 'Customer On-boarding DOA - Hong Kong Que');
            mapSellNQ.put('4860 - DUP (Thailand) Ltd', 'Customer On-boarding DOA - Thailand Queu');
            mapSellNQ.put('0078 - ELECT. MATLS DUP DONGGUAN', 'Customer On-boarding DOA - China Queue');
            mapSellNQ.put('0218 - DuPont Trading Shanghai', 'Customer On-boarding DOA - China Queue');
            mapSellNQ.put('0701 - DUP AGRIC CHEM LTD', 'Customer On-boarding DOA - China Queue');
            mapSellNQ.put('1131 - DuPont (Shanghai) Sourcing Center Company, Ltd.', 'Customer On-boarding DOA - China Queue'); //Nishanth.H 15092015> Added for R02 enhancement-Updating selling company code value('1131 - DuPont (Shanghai) Sourcing Center Company, Ltd.')
            mapSellNQ.put('1132 - DuPont(China) RD and Mgmt', 'Customer On-boarding DOA - China Queue');
            mapSellNQ.put('1142 - DUP SURFCE GUANGZHOU', 'Customer On-boarding DOA - China Queue');
            mapSellNQ.put('1210 - DUP (SHENZHEN) INDUS', 'Customer On-boarding DOA - China Queue');
            mapSellNQ.put('1310 - DuPont Apollo (Shenzhen)', 'Customer On-boarding DOA - China Queue');//<Alvin20150824> Added 1310 selling company code for enhancement LE1310
            mapSellNQ.put('2791 - Du Pont China Holding Co.', 'Customer On-boarding DOA - China Queue');*/
        //<Alvin20150929>End


        for(Profile pro :[Select Id,Name from Profile where Name='Credit Analyst' OR Name ='Credit Process Managers'])
            lst_CAProfileId.add(pro.Id);
                if(lst_CAProfileId.size()>0){
                     
                    if(OnboardingReq.Destination_Credit_Approver__c!='' && OnboardingReq.Destination_Credit_Approver__c!=null){
                        DCAApprover =[Select Id, Name, Phone,Email from User where Name=:OnboardingReq.Destination_Credit_Approver__c And ProfileId In:lst_CAProfileId Limit 1];
                    }
                    //<Kala20151001> Added for R02 enhancement in order to replace Credit when DCA and CA are same
                    else if(OnboardingReq.Request_Status__c=='Awaiting Credit Approval' || OnboardingReq.Request_status__c == 'Awaiting Destination Credit Approval')  {
                           // OnboardingReq.Credit_Approval_Required__c=true;
                        DCAApprover = [Select Id, Name, Phone,Email from User where id=:UserInfo.getUserId() And ProfileId In:lst_CAProfileId Limit 1];
                    }
                }
                for(Group Grp : [select Id,Name from Group Where Type = 'Queue' And Name =:mapSellNQ.get(OnboardingReq.Company_Code__c)])
                    QueueListIds.add(grp.Id);                       


                        list<GroupMember> QueueGrpMem = [Select UserOrGroupId From GroupMember where GroupId In:QueueListIds];
                        if(DCAApprover !=null && QueueGrpMem.size()>0){
                            for(GroupMember grpMem : QueueGrpMem){
                                if(DCAApprover.Id ==grpMem.UserOrGroupId)
                                    IsDcaNDoaApproverSame=true;
                            }
                        }



                        Business_Rules__c busRuleDOA = new Business_Rules__c();
                        OnboardingReq.Last_Modified_Time__c = system.now();

                        map<String,list<Business_Rules__c>> mapRecTypNBusRule= new map<String,list<Business_Rules__c>>();
                        list<Business_Rules__c> lst_BusinessRule = new list<Business_Rules__c>();
                        map<String,String> mapSelReqStaNDestQue=new map<String,String>();
                        for(Business_Rules__c busRul : [select id, Selling_Company_Code__c,RecordType.Name,Sub_Business__c,Credit_Limit_Upper__c,Credit_Limit_Lower__c,Sold_to_Country__c,Destination_Queue__c,Escalated_Approver__c,CDR_Request_Status__c From Business_Rules__c Where RecordtypeId <> : Country_Credit_Analyst_Notification_RTYPE]){
                            if(mapRecTypNBusRule.containsKey(busRul.RecordType.Name))
                                mapRecTypNBusRule.get(busRul.RecordType.Name).add(busRul);
                            else
                                mapRecTypNBusRule.put(busRul.RecordType.Name,new list<Business_Rules__c>{busRul});
                            lst_BusinessRule.add(busRul);
                        }
                        
                        system.debug('rules = '+lst_BusinessRule);
                        if(lst_BusinessRule.size()>0 ){
                            if(mapRecTypNBusRule.size()>0){
                                for(Business_Rules__c businessRul :lst_BusinessRule){
                                    if(mapRecTypNBusRule.get(CountryRuleRecordType) !=null){
                                        String SelNReqStatus=businessRul.Selling_Company_Code__c+' - '+ businessRul.CDR_Request_Status__c;
                                        mapSelReqStaNDestQue.put(SelNReqStatus,businessRul.Destination_Queue__c);
                                    }
                                }
                                //<Kala20151001> Added for R02 enhancement in order to replace Credit when DCA and CA are same
                                if(OnboardingReq.Request_status__c == 'Awaiting Destination Credit Approval'){
                                    String SelNReqStaNQue;
                                    SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+'Awaiting Credit Approval';
                                    for(Group Grp : [select Id,Name from Group Where Type = 'Queue' And Id =:QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue))])
                                        QueueListIdsCa.add(grp.Id);                     

                                            list<GroupMember> QueueGrpMemCA = [Select UserOrGroupId From GroupMember where GroupId In:QueueListIdsCa];
                                            if(QueueGrpMemCA.size()>0){
                                                for(GroupMember grpMem : QueueGrpMemCA){
                                                    if(UserInfo.getUserId()== grpMem.UserOrGroupId)
                                                        IsDcaNCaApproverSame=true;                                                  
                                                }
                                                if(IsDcaNCaApproverSame==true){
                                                    CopyDestinationToApprovedCreditData();
                                                    populateCurrency();                                                 
                                                }
                                            } 
                                }
                                if(mapRecTypNBusRule.get(DOARuleRecordType) !=null){
                                    for(Business_Rules__c busRules:lst_BusinessRule){
                                        if(CurrencyInDollar !=null && CurrencyInDollar !='' && (OnboardingReq.Request_status__c == 'Awaiting Credit Approval' || OnboardingReq.Request_status__c == 'Awaiting Destination Credit Approval')){
                                            if(busRules.Credit_Limit_Lower__c !=null && busRules.Credit_Limit_Upper__c !=null){
                                                system.debug('  Credit_Limit_Lower__c   '+busRules.Credit_Limit_Lower__c + '  Credit_Limit_Upper__c  '+ busRules.Credit_Limit_Upper__c+ ' CurrencyInDollar  '+ CurrencyInDollar + '  Decimal.valueOf(CurrencyInDollar)  '+ Decimal.valueOf(CurrencyInDollar));
                                                if(Decimal.valueOf(CurrencyInDollar) >= busRules.Credit_Limit_Lower__c && Decimal.valueOf(CurrencyInDollar) < busRules.Credit_Limit_Upper__c){
                                                    if(busRules.Selling_Company_Code__c == OnboardingReq.Company_Code__c && busRules.Sub_Business__c == OnboardingReq.Sub_Business__c){
                                                        IsDOAApprovalRequired=true; 
                                                        busRuleDOA=busRules;
                                                    }
                                                }
                                            }
                                        }
                                    }                       
                                }
                            }
                        }

                        system.debug('rules = '+busRuleDOA);
                        if(mapSelReqStaNDestQue.size()>0 ){
                            String SelNReqStaNQue;

                            if(CAProfile==true){

                                if(CSRReview==true){
                                    OnboardingReq.Request_Status__c='Draft/Data Gathering';
                                    OnboardingReq.Record_Locked__c = true;
                                    OnboardingReq.Send_To_OneDuPont__c=true;
                                    OnboardingReq.Sent_To_OneDuPont__c=false;
                                    OnboardingReq.Back_Flow_To_DUPont__c=true;
                                }
                                else{
                                    if(OnboardingReq.Request_status__c == 'Awaiting Destination Credit Approval'){
                                        //<Kala20151001> added for R02 enhancement in order to replace Credit when DCA and CA are same      
                                        if(IsDcaNCaApproverSame== false){
                                            OnboardingReq.Request_Status__c='Awaiting Credit Approval';
                                            SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                            OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));
                                            OnboardingReq.Send_To_OneDuPont__c=true;
                                            OnboardingReq.Sent_To_OneDuPont__c=false;
                                            OnboardingReq.Back_Flow_To_DUPont__c=false;
                                        }
                                        else{
                                            if(IsDcaNDoaApproverSame == false && IsDOAApprovalRequired == true && busRuleDOA !=null){
                                                OnboardingReq.OwnerId=QueueMap.get(busRuleDOA.Destination_Queue__c);
                                                OnboardingReq.Escalated_Approver_Name__c =busRuleDOA.Escalated_Approver__c;
                                                OnboardingReq.Send_To_OneDuPont__c=true;
                                                OnboardingReq.Sent_To_OneDuPont__c=false;
                                                OnboardingReq.Back_Flow_To_DUPont__c=false;
                                                OnboardingReq.Country_Credit_Comments__c='The Destination Credit Manager and CA Manager is same for this request. So CA Approval is not required separately. Destination Credit data is copied to Approved Credit';
                                                OnboardingReq.Request_Status__c='Awaiting DOA Approval';
                                            }
                                            else if(IsDcaNDoaApproverSame == true && IsDOAApprovalRequired == false){
                                                OnboardingReq.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
                                                SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                                OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));
                                                OnboardingReq.Escalated_Approver_Comments__c='Since the DCA and DOA approver is the same, DOA Approval is not required.';
                                                OnboardingReq.Country_Credit_Comments__c='The Destination Credit Manager and CA Manager is same for this request. So CA Approval is not required separately. Destination Credit data is copied to Approved Credit';
                                                OnboardingReq.Send_To_OneDuPont__c=true;
                                                OnboardingReq.Sent_To_OneDuPont__c=false;
                                                OnboardingReq.Back_Flow_To_DUPont__c=false;
                                            }
                                            else if(IsDcaNDoaApproverSame == false && IsDOAApprovalRequired == false){
                                                OnboardingReq.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
                                                SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                                OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));
                                                OnboardingReq.Escalated_Approver_Comments__c='Since the Credit Limit is low, DOA Approval is not required.';
                                                OnboardingReq.Country_Credit_Comments__c='The Destination Credit Manager and CA Manager is same for this request. So CA Approval is not required separately. Destination Credit data is copied to Approved Credit';
                                                OnboardingReq.Send_To_OneDuPont__c=true;
                                                OnboardingReq.Sent_To_OneDuPont__c=false;
                                                OnboardingReq.Back_Flow_To_DUPont__c=false;
                                            }
                                            else{
                                                OnboardingReq.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
                                                SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                                OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));
                                                OnboardingReq.Escalated_Approver_Comments__c='The Destination Credit Manager, CA Manager and DOA Manager is same for this request. So Credit Approval and DOA Approval is not required seperately.';
                                                OnboardingReq.Country_Credit_Comments__c='The Destination Credit Manager, CA Manager and DOA Approver is same for this request. So CA Approval and DOA Approval is not required separately. Destination Credit data is copied to Approved Credit';
                                                OnboardingReq.Send_To_OneDuPont__c=true;
                                                OnboardingReq.Sent_To_OneDuPont__c=false;
                                                OnboardingReq.Back_Flow_To_DUPont__c=false;
                                            }
                                        }
                                        //<Kala20151001> Ends
                                    }
                                    else if(OnboardingReq.Request_status__c == 'Awaiting Credit Approval'){
                                        if(IsDOAApprovalRequired == true){
                                            if(IsDcaNDoaApproverSame == false){
                                                if(busRuleDOA !=null){
                                                    OnboardingReq.OwnerId=QueueMap.get(busRuleDOA.Destination_Queue__c);
                                                    OnboardingReq.Escalated_Approver_Name__c =busRuleDOA.Escalated_Approver__c;
                                                    OnboardingReq.Send_To_OneDuPont__c=true;
                                                    OnboardingReq.Sent_To_OneDuPont__c=false;
                                                    OnboardingReq.Back_Flow_To_DUPont__c=false;
                                                    OnboardingReq.Request_Status__c='Awaiting DOA Approval';
                                                }
                                            }else{
                                                OnboardingReq.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
                                                SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                                OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));
                                                OnboardingReq.Escalated_Approver_Comments__c='The Destination Credit Manager and DOA Manager is same for this request. So DOA Approval is not required seperately.';

                                                OnboardingReq.Send_To_OneDuPont__c=true;
                                                OnboardingReq.Sent_To_OneDuPont__c=false;
                                                OnboardingReq.Back_Flow_To_DUPont__c=false;
                                            }
                                        }else{
                                            OnboardingReq.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
                                            SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                            OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));

                                            OnboardingReq.Send_To_OneDuPont__c=true;
                                            OnboardingReq.Sent_To_OneDuPont__c=false;
                                            OnboardingReq.Back_Flow_To_DUPont__c=false;
                                        }
                                    }else if(OnboardingReq.Request_status__c == 'Awaiting DOA Approval'){
                                        OnboardingReq.Request_Status__c='Awaiting Data Analyst (DMS Team) Approval';
                                        SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                        OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));

                                        OnboardingReq.Send_To_OneDuPont__c=true;
                                        OnboardingReq.Sent_To_OneDuPont__c=false;
                                        OnboardingReq.Back_Flow_To_DUPont__c=false;
                                    }

                                }
                            }else if(DMSProfile==true){
                                if(isComplete==true){
                                    OnboardingReq.Request_Status__c='Request Completed in SAP';
                                    OnboardingReq.Record_Locked__c= true;
                                    OnboardingReq.Send_To_OneDuPont__c=true;
                                    OnboardingReq.Sent_To_OneDuPont__c=false;
                                    OnboardingReq.Back_Flow_To_DUPont__c=true;
                                }
                                else if(isReject==true){
                                    OnboardingReq.Request_Status__c='Rejected';
                                    OnboardingReq.Record_Locked__c= true;
                                    OnboardingReq.Send_To_OneDuPont__c=true;
                                    OnboardingReq.Sent_To_OneDuPont__c=false;
                                    OnboardingReq.Back_Flow_To_DUPont__c=true;
                                }
                                else if(CAReview == true){
                                    OnboardingReq.Request_Status__c='Awaiting Credit Approval';

                                    SelNReqStaNQue= OnboardingReq.Company_Code__c+' - '+OnboardingReq.Request_Status__c;
                                    OnboardingReq.OwnerId=QueueMap.get(mapSelReqStaNDestQue.get(SelNReqStaNQue));
                                    OnboardingReq.Send_To_OneDuPont__c=true;
                                    OnboardingReq.Sent_To_OneDuPont__c=false;
                                    OnboardingReq.Back_Flow_To_DUPont__c=false;
                                }
                                else if(CSRReview == true){
                                    OnboardingReq.Record_Locked__c= true;
                                    OnboardingReq.Request_Status__c='Draft/Data Gathering';
                                    OnboardingReq.Send_To_OneDuPont__c=true;
                                    OnboardingReq.Sent_To_OneDuPont__c=false;
                                    OnboardingReq.Back_Flow_To_DUPont__c=true;
                                }
                            }  
                        }

    }
}