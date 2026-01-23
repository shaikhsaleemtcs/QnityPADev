/**************************************************************************************************************
 ***********************************************Modification Log************************************************
<PS20130417>
Last Modified By    :   Prachi Sinha
Last Modified Date  :   17 Apr 2013
Description         :   Adding a new key field(Customer Group2 from ERP Customer object)APAC Roll Out1(2.3)                     
 *****************************************************************************************************************
<BR20130424>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   24 Apr 2013
Description         :   Added Attachments_on_Customer_Prices__c in query of pricing request(2.4)                        
 *****************************************************************************************************************
<UD20130726>
Last Modified By    :  Utkarsh
Last Modified Date  :   26 July 2013
Description         :   Added condition for Status check in Bulk approval(2.5)
 *****************************************************************************************************************                        
<PP20130722>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 Jul 2013
Description         :   Added Request Class and Pricing Exception in queries - APAC ROLLOUT2
 *****************************************************************************************************************
<NS20130821>
Last Modified By    :   Neeharika
Last Modified Date  :   21 Aug 2013
Description         :   1)Added 'Landing_Cost__c' fields to queries
 *****************************************************************************************************************
<PP20131111>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   11 November 2013
Description         :   Approval routing while NPC auto-submit - ROLLOUT2
 *****************************************************************************************************************
<PP20140120>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   20 December 2014
Description         :   Approval routing
 *****************************************************************************************************************
<VR20140221>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   21 Feb 2014
Description         :   Global Rollout - Reassign and Recall implementation
 *****************************************************************************************************************
<BB20140321>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   21 March 2014
Description         :   Added logic to populate the Auto Approve level with Approver.
 *****************************************************************************************************************
<BB20140404>
Last Modified By    :  Bisnupriya Budek
Last Modified Date  :  04 Arpril 2014
Description         :  CAPITAL PROJECT - 1. Added Error_Indicator__c  in the query of Pricing_Request_Item__c 
                                        2.  Added logic for Error message to prevent submit in case there are
                                          errors in RequestItems, If the request Items are not valid for the sales area
 *****************************************************************************************************************
<MS20140421>  
Last Modified By    : Mohit Sinha
Last Modified Date  :  21 Arpril 2014
Description         : Added logic to store approver names in field approverText__c
 *****************************************************************************************************************
<TJ20140429>
Last Modified By    :  Tarun Jain
Last Modified Date  :  29 April 2014 
Description         :  CAPITAL PROJECT -1.  Added approval routing for key_field__c = product hierarchy 
                                        2.  Added approval routing for key_field__c = profit center.
 *****************************************************************************************************************
<BB20140429>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   29 April 2014
Description         :   CAPITAL PROJECT -Added Default_Currency__c Fields in the all the  Pricing_Request__c query
 **********************************************************************************************************************
<BB20140509>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   09 April 2014
Description         :   CAPITAL PROJECT -Added Current_Routing_Parameter__c Fields in the all the  Pricing_Request__c query and Added Logic to populated.
 *****************************************************************************************************************
<PP20140923>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   23 Sep 2014
Description         :   Fix for Issue - IS ID-00046925. Adding only the product hierarchy code for the level in BU
 *****************************************************************************************************************
<PP20140929>
 Last Modified By    :   Priyanka Pillala
 Last Modified Date  :   29 Sep 2014
 Description         :   Added External ERP ID to Pricing Request Item - Fix for Issue IS ID-00047158
 *****************************************************************************************************************                        
<PP20141001>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   1 Oct 2014
Description         :   Fix for IS ID-00047244
 **********************************************************************************************************************
 <PR20140901>
Last Modified By    :   Priyanka R
Last Modified Date  :   01 Sep 2014
Description         :   1. Added condition to skip the approval process if the key field is country and approver is not required             
                        2. Added code for reassigning for mass reassigning
 **********************************************************************************************************************
<HL20140910>
Last Modified By    :   Hema Latha
Last Modified Date  :   10 Sep 2014
Description         :   Added logic to Allow multiple levels of Product Hierarchy and FRB to be used for approval workflow                                               
 **********************************************************************************************************************
<AJ20160105>
Last Modified By    :   Arpit Jain
Last Modified Date  :   05 Jan 2016
Description         :   Added logic to Allow multiple levels of Product Hierarchy and FRB to be used for approval workflow                                               
**********************************************************************************************************************
<AJ20160325>
Last Modified By    :   Arpit Jain
Last Modified Date  :   25 Mar 2016
Description         :   <IS ID-00067148> Added condition to skip "No request item added" error on Submit for "Rebate payout" and "Rebate adjustment"
**********************************************************************************************************************
<MD20160414>
Last Modified By    :   Madhurima Daggumati
Last Modified Date  :   14 Apr 2016
Description         :   <IS ID-00067728> 
                        1. Added new condition for project pricing request when new rate value is blank then should not allow to submit PR and display error message
                        2. When "Net Price Status" is blank and approval routing parameter is Below floor price then by default "Above floor" value is displayed, 
                           so modified then code to consider "Below Floor" for BI AP Surfaces business
**********************************************************************************************************************
<MG20161221>
Last Modified By    :   Mansi Gupta
Last Modified Date  :   21 Dec 2016
Description         :   <IS ID-00075712> 
                       
**********************************************************************************************************************
<MG04042017>
Last Modified By    :   Mansi Gupta
Last Modified Date  :   04 April 2017
Description         :  IS ID-00080900 - Bulk approval at level 5 - Too many SOQL 
                       
**********************************************************************************************************************
<DR07092018> 
Last Modified By    :   Deepanshi Rajput
Last Modified Date  :   07 July 2018
Description         :  IS ID-00085788 - Making 'Run Net Price' Mandatory step for Project Pricing
**********************************************************************************************************************
<PG20191211> 
Last Modified By    :   Piyush Gupta
Last Modified Date  :   11 December 2019
Description         :   Making Approval Flow Run for DPT Customer Group 4.
                        Commented Line No. 2030 & 2038 for increasing the Code Coverage.
**********************************************************************************************************************
<NS20191023> 
Last Modified By    :   Nadeem Shaik
Last Modified Date  :   23 October 2019
Description         :   Added logic to skip Approval if key field is Customer Group 4 and If PR has CG4 eligible to skip,as defined in Sales Area

**********************************************************************************************************************
<VK20210215>
Last Modified By    :   Vinay Kumar 
Last Modified Date  :   15 February 2021
Description         :   Added logic to populate approvers if the key field contains PH as part of issue IS SC-00092725.

**********************************************************************************************************************
<VK20210302>
Last Modified By    :   Vinay Kumar
Last Modified Date  :   2nd Mar 2021
Description         :   Fixed the PH logic to populate approvers only if the key field and PRI KC contains PH.

**********************************************************************************************************************
<AS20210428>
Last Modified By    :   Arrola Sireesha
Last Modified Date  :   28th April 2021
Description         :   Updated the logic to route to actual approver(instead of mixed values approver) when different product families have same approver.
**********************************************************************************************************************
<RB20210816>
Last Modified By    :   Rajesh Barda
Last Modified Date  :   16 August 2021
Description         :   Updated the logic to route to actual approver(instead of mixed values approver) when different product families have same approver even if routing criteria is not met.
                        Also updated the API version from 42 to 52.
**********************************************************************************************************************
<CRM-2021-04-0192>
Last Modified By   :   Harsh Gurvanshi
Last Modified Date :   28 Dec 2021
Description        :   Added logic to populate the BackUp approver at PR's from approver list for P80 scenario.
******************************************************************************************************************
<SH26102022>
Last Modified By   :   Sapneet Hora
Last Modified Date :   26 Oct 2022
Description        :   Commented the condition to send the Project Pricing Requests(BI AP Surfaces) to all levels for approval IS SC-00105089
**********************************************************************************************************************
<SH20221121>
Last Modified By   :   Sapneet Hora
Last Modified Date :   21 Nov 2022
Description        :   IS SC-00105725 - Added condition to make NPC Mandatory for Pricing Task - Spot Price Requests for all DPT Businesses
***********************************************************************************************************************
<SS20230501>
Last Modified By   :   Shantanu Sharma
Last Modified Date :   05 May 2023
Description        :   P80 M&M Changes 
**********************************************************************************************************************/

// Version    Modified Date    Modified By    Modification                                                          Dependencies
// -------------------------------------------------------------------------------------------------------------------------------------
//1.1        22-02-2013        Prachi      Approve and reject method (added code to map the Project status)
//1.2        26-Feb            Utkrash     Removed worksetitem updation for mail approval.                     PAUtils, PRBIBU Trigger
//1.3        19- Mar           Utkarsh     Added condition to get the Market Segment and End use and PH2 from Material.
//1.4        20-Mar            Utkarsh     Added conditon to add country from the ERP Customer for massive and import.
//1.5        25-Mar            UTkarsh     Added an extra flag condition for Project while submission                      
//1.6        26-Mar            Utkarsh     Added a condition while recalling checking the current status and level
//                                         above condition for Approve/Reject/Recall
//1.7        27 Mar            Utkarsh         Changed the Reassign Popup                                  PAUserPopulationCOmponent 
//1.8        28 Mar            Utkarsh     Removed Query method and added a new query on Submitcalculation
//1.9        29 Mar            Utkarsh     Error when trying to reassign after backup escalation. UAT Defect 153
//2.0        1 Apri            Utkarsh     changed requestor into requester
//2.1        2 April           Utkarsh     Put an error message for Reassign as Current user for getting changed after backup
//2.2        08 April          Utkarsh     Changed the condition for End use as it was first checking for Key Field Value and now with Key Field Id and 
//and added an additional condition on query to Material for populating Set of MS, EU and PH to check for Sales Org.
//2.3        25 April          Utkarsh     Added condition for considering the PRItem below floor, current or reference based on the Material count fields.
//2.4        9 May             Bala        Sequential approval
//2.5        23-05-2013        Utkrash     Added logic for Out of office functionality and Sequential approval.
//2.6              05-06-2013            Utkarsh           Commented logic for Sequential approval by bala.
//2.7       18-06-2013              Utkarsh           Added null check for current level of approver
//2.8            20-06-2013              Utkarsh           Changed the positioning of the query in Bulk approval from end to Top.
//2.9      20-06-2013          Ahmed       View link is missing
//3.0            20-06-2013              Utkarsh     Addedcondition for submition and checking for out of office and added backup for salesorg.
//3.1             26-06-2013        Utkarsh           Commented Sent to bacjkup flag update.
//3.2       27-06-2013              Utkarsh           Added condition when Submit continued to check the status of the request and added error message in false condition.
//3.3       19-07-2013              Neeharika   Changed setPh to PH1 code + Ph2 code,  changed the comparision factor from Key field value to Key field Id
//Added PH1 code and ph2code in the query
//3.4       25-03-2016         Arpit      <IS ID-00067148>  Added condiiton to skip "No request item added" error on Submit for "Rebate payout" and "Rebate adjustment" 
//3.5       23-10-2019        Nadeem      <IS SC-00089912>  Added Customer Group 4 for Auto-Approval.
//3.6       11-12-2019        Piyush      <IS SC-00089912>  Added Customer Group 4 as a routing parameter Key Field.
//3.7       25-02-2021        Vinay       <IS SC-00092725>  Updated URL for production adminlogin in the code
//3.8       02-03-2021        Vinay       <IS SC-00092725>  Updated the logic for PH key field approver
//3.9       28-04-2021        Sireesha    <IS TI-00091587>  Updated the logic to route to actual approver(instead of mixed values approver) when different product families have same approver.
//4.0       16-08-2021        Rajesh      <IS TI-00092459> Updated the logic to route to actual approver (instead of mixed values) when different product families have same approver and routing criteria is not met.
//4.1       26-10-2022        Sapneet     <IS SC-00105089> Commented the condition to send the Project Pricing Requests(BI AP Surfaces) to all levels for approval 
//4.2       21-11-2022        Sapneet     <IS SC-00105725> Added condition to make NPC Mandatory for Pricing Task - Spot Price Requests for all DPT Businesses
public without sharing class PAApprovalWF implements IPAServiceComponent{
  public PARequest request {get;set;} 
  public boolean isEndUserRebate{get; set;}
  public String appRejComments {get;set;}
  public String newAssignedUser{get;set;}
  public String reassignedUserId{get;set{
    system.debug(logginglevel.error,'***In setter user reassignedUserId'+value);
    reassignedUserId = value;
    displayReassignList = false;
  }}
  //<HL20140910>
  //<MG20161221> - Start
  public String SubmitCalculationStatus {get;set;}
  public String SubmitContinueStatus {get;set;} 
  public boolean FlagStatus {get;set;} 
  //<MG20161221> - End
  public Set<String> setPH{get;set;}
  public Map<Integer, String> mapPHcodeList{get;set;}
  public Map<Integer, String> FRBLevel{get;set;}
  public Set<String> setFRB{get;set;} 
  public String reassignedUserName{get;set;}
  public String reassignedUserAppId{get;set;}
  public String selectedApprover {get;set;}
  public String selectedEpassId {get;set;}
  public String selectedEmailId {get;set{
    if(value <> NULL){
      System.debug('Assigning value:-'+value);
      selectedEmailId = value;
      for(PAWrapper wrapObj : wrapforReassignObjList){
        if(selectedLevel == wrapObj.stringMap.get('Level')){
          wrapObj.stringMap.put('userEmail', value);
          break;
        }  
      }
    }
  }}
  public String selectedUser{get;set{
    if(value <> NULL){
      selectedUser = value;
      system.debug(logginglevel.error,'***In setter user'+selectedLevel);
      for(PAWrapper wrapObj : wrapforReassignObjList){
        if(selectedLevel == wrapObj.stringMap.get('Level')){
          wrapObj.stringMap.put('userName', value);
          break;
        } 
        system.debug(logginglevel.error,'***In setter User End'+wrapObj.stringMap.get('userName'));
      }
    }

  }}
  public String selectedUserID{get;set{
    if(value <> NULL){
      selectedUserID = value;
      system.debug(logginglevel.error,'***In setter Id'+selectedLevel);
      for(PAWrapper wrapObj : wrapforReassignObjList){
        if(selectedLevel == wrapObj.stringMap.get('Level')){
          wrapObj.stringMap.put('userID', value);
          break;
        } 
        system.debug(logginglevel.error,'***In setter Id End'+wrapObj.stringMap.get('userID'));
      }
    }

  }}
  public String selectedLevel{get;set{
    system.debug(logginglevel.error,'In setter method of SelectedLevel'+selectedUser+selectedUserId);
    selectedLevel = value;
    if(selectedUser <> NULL){
      for(PAWrapper wrapObj : wrapforReassignObjList){
        if(value == wrapObj.stringMap.get('Level')){
          wrapObj.stringMap.put('userName', selectedUser);
          wrapObj.stringMap.put('userId', selectedUserId);
          wrapObj.stringMap.put('userEmail', selectedEmailId);
          //if(selectedEpassId <> NULL)
          //  wrapObj.stringMap.put('userAccessId', selectedEpassId);
          break;
        } 
      }
    }
  }} 
  public boolean showUserLookupListFlag{get;set;}
  public boolean displayApproverList {get;set;} 
  public boolean displayReassignList {get;set;}
  public List<User> userReassignList {get;set;}
  public List<PAWrapper> wrapforReassignObjList {get;set;}
  public List<PAWrapper> wrapList {get;set;} 
  public Integer AsyncCallIndicatorCount = 0;
  public boolean itemPendingFlag = false;
  public string delegationComments{get;set;}

  public String adminPwd{get;set;}

  public PAApprovalWF(PAServiceState paServiceState){                            
    system.debug(logginglevel.error,'***In ApprovalWF Const');
    isEndUserRebate = false;
    //<MG20161221> - Start
    FlagStatus= false;
    //<MG20161221> - End
     if(paServiceState.currentRequest!=null){
     request =  paServiceState.currentRequest; 
    } 
    wrapList = new List<PAWrapper>();
    wrapforReassignObjList = new List<PAWrapper>(); 
    userReassignList = new List<User>();
    pricingRequestforReassign = new List<Pricing_Request__c>();  
    System.debug('ADM'+ IntegrationLoginCredentials__c.getInstance('spec.specpa@dupont.com.esu').EncryptedLoginDetails__c);
    adminPwd = IntegrationLoginCredentials__c.getInstance('spec.specpa@dupont.com.esu').EncryptedLoginDetails__c;
  }
  //For Async Call out
  public PAApprovalWF(String passedId, String selectedBU){                            
    PAServiceState paServiceState = new PAServiceState();
    paServiceState.ogItems = new PAOrganizationalGroupItems();
    OrgGroup__c orgGroup = [SELECT Id from OrgGroup__c Where Business__c = :selectedBU];
    paServiceState.ogItems.selectedBU = orgGroup.Id;
    request =  new PARequest(paServiceState); 
    //<PP20130722> -- <NS20130821> Added Landing_Cost__c field to query select clause
    //<PP20140116>
    //<PP20140305>
    //<BB20140321> Added Auto_Approver Fields in the query
    //<MS20140421> Added Backup_Level Name and approverText Fields in the query
    //<BB20140429> Added Default_Currency__c in the query

    /*request.pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Submitted_By__c,Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Pricing_Exception__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                  SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                  Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                  Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                  LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                  Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                  CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                  Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                      Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,Landing_Cost__c,
                      Backup_Level_1__c, Backup_Level_1__r.name, Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name, Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name,
                      approverText__c,Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,
                      Approver1__r.Email, Approver2__r.Email, Approver3__r.Email, Approver4__r.Email, approver5__r.Email, ComPartner__c, ComPartner_Code__c                             
                      FROM Pricing_Request__c WHERE Id = :passedId];*/
   request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PAApprovalWF', 'request.pricingRequest', ' Id =\''+passedId+'\''))[0];     
    wrapList = new List<PAWrapper>();
    wrapforReassignObjList = new List<PAWrapper>(); 
    userReassignList = new List<User>();
    pricingRequestforReassign = new List<Pricing_Request__c>();
  }
  private void submit(){
        //MS20151105
        querytoPricingRequest(request.pricingRequest.Id);
    Approval.ProcessResult result = null;
    List<Id> newWorkItemIds = null;
    // Create an approval request
    Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
    if(appRejComments == NULL)
      req1.setComments('Submitted request for approval.');
    else
      req1.setComments(appRejComments);
    req1.setObjectId(request.pricingRequest.id);
    req1.setNextApproverIds(new Id[] {UserInfo.getUserId()});
    // Submit the approval request
    result = Approval.process(req1);      
    // Verify the result                     
    newWorkItemIds = result.getNewWorkitemIds();
    system.debug(logginglevel.error,'@@@approve newworkitemid'+newWorkItemIds);
    querytoPricingRequest(request.pricingRequest.Id);
    //shifting anand's code here (done to set the variable) before updating the workset item id to prevent d new instance of workset item id - prachi 25th feb
    if(request.pricingRequest.Pricing_Request_Type__c=='Project Pricing')
    {
      request.pricingRequestId=request.pricingRequest.Id;
    }
    system.debug(logginglevel.error, 'MsgTxt4');
  }
  private boolean errorMessageFlagReassign = false;
  public void reassign(){
    system.debug('\n\n\n in single reassign');
    //This method will set the new ActorID for the current step of approval for the record
    newAssignedUser = selectedUserID;
    errorMessageFlagReassign = false;
    ProcessInstanceWorkItem updateProcessinstance = new ProcessInstanceWorkItem();        
    Id currentAssignedUser;
    String level = request.pricingRequest.Current_Level__c;
    currentAssignedUser = request.pricingRequest.Current_Approver__c;

    //<VR20140221> Global Rollout - Reassign implementation
    /* Commented since reassign implemented via Ajax tool kit
        partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult loginResult = sp.login('spec.specpa@dupont.com', IntegrationLoginCredentials__c.getInstance('spec.specpa@dupont.com').EncryptedLoginDetails__c);
        WebServiceReassign.PAReassign stub = new WebServiceReassign.PAReassign();
        WebServiceReassign.SessionHeader_element sessionHeader = new WebServiceReassign.SessionHeader_element();
        sessionHeader.sessionId = loginResult.sessionId;

        stub.timeout_x = 120000;
        stub.SessionHeader = sessionHeader;
        string error = stub.reAssign(request.pricingRequest.id,currentAssignedUser,newAssignedUser);
        if(!error.containsIgnoreCase('success')) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, error);  
            ApexPages.addMessage(myMsg); 
            return;
        }
     */
    /*Pricing_Request__c pr = new Pricing_Request__c();
        pr.Id = request.pricingRequest.id;
        if(level == '1'){
            pr.Approver1__c = newAssignedUser;
            pr.Backup_Level_1__c = null;
        }
        else if(level == '2'){
            pr.Approver2__c = newAssignedUser;
            pr.Backup_Level_2__c = null;
        }
        else if(level == '3'){
            pr.Approver3__c = newAssignedUser;
            pr.Backup_Level_3__c = null;
        }
        else if(level == '4'){
            pr.Approver4__c = newAssignedUser;
            pr.Backup_Level_4__c = null;
        }  
        else if(level == '5'){
            pr.Approver5__c = newAssignedUser;
            pr.Backup_Level_5__c = null;
        }             
        pr.Sent_to_Backup_Approver__c = false;
        pr.Sent_to_BUAdmin__c = false;
        update pr;
        String templateForReassign;
        if(currentAssignedUser == UserInfo.getUserId())
        {
            templateForReassign = PA_Email_Template_Custom_Settings__c.getInstance('Delegate Template').template_Id__c;
        }
        else
        {
            templateForReassign = PA_Email_Template_Custom_Settings__c.getInstance('Reassigned Template').template_Id__c;
        }

        User u = [SELECT Email FROM User WHERE Id = :newAssignedUser];
        List<String> toAddresses = new List<String>();
        toAddresses.add(u.Email);
        System.debug('*****u.Email'+u.Email);
        PAUtil.sendEmailMethod(templateForReassign, toAddresses, pr.id, newAssignedUser);*/
    //<PP20140305>
    //<BB20140321> Added Auto_Approver Fields in the query
    //<MS20140421> Added Backup_Level Name and approverText Fields in the query
    //<BB20140429> Added Default_Currency__c in the query
    //<BB20140509> Added Current_Routing_Parameter__c in the query
    //<GT20140913> Added Email in all approver levels
    /*request.pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Submitted_By__c,Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Pricing_Exception__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                  SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                  Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                  Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                  LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                  Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                  CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                  Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,Landing_Cost__c,
                              Backup_Level_1__c, Backup_Level_1__r.name, Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name, Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name,approverText__c,Default_Currency__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Delegation_Comments__c,
                              Approver1__r.Email, Approver2__r.Email, Approver3__r.Email, Approver4__r.Email, approver5__r.Email, ComPartner__c, ComPartner_Code__c           
                              FROM Pricing_Request__c WHERE Id = :request.pricingRequest.id];*/
    request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PAApprovalWF', 'request.pricingRequest', ' Id =\''+request.pricingRequest.id+'\''))[0];

  }
  //This method is used for bulk approval of the request from the pending approval page
  public void bulkApproval(List<Pricing_Request__c> pricingRequestSelectedList){  
    system.debug(logginglevel.error,'***bulkapprovalmethod'+pricingRequestSelectedList);   
    boolean errormessageFlag = false;
    Map<String,Schema.FieldSet> fieldSetMap = Schema.SObjectType.Pricing_Request__c.fieldSets.getMap();
    List<Schema.FieldSetMember> apprFields = fieldSetMap.get('Approvers').getFields();
    System.debug('fieldSetMap:'+ SObjectType.Pricing_Request__c.FieldSets.Backup_Approvers.getFields());
    List<Schema.FieldSetMember> BackApprFields = fieldSetMap.get('Backup_Approvers').getFields();
    if(pricingRequestSelectedList.size() == 0)
    {
      errormessageFlag = PAUtil.apexErrorMsg('Please select at least one pricing request.'); 
    }
    if(!errorMessageFlag)
    {
      List<Pricing_Request__c> upsertPricingRequestList = new List<Pricing_Request__c>();
      List<String> pricingRequestSelectedIDList = new List<String>();
      for(Pricing_Request__c prReq : pricingRequestSelectedList)
      {
        pricingRequestSelectedIDList.add(prReq.Id);
      }
      List<Pricing_Request__c> pricingRequestqueryList = [SELECT Id, Current_Level__c, NPC_Status__c, Request_Approval_Status__c FROM Pricing_Request__c 
                                                          WHERE Id IN :pricingRequestSelectedIDList];
      Map<String, String> pricingRequestIDLevelMap = new Map<String, String>();
      //Version : (2.5) Added condition for Status check in Bulk approval
      Map<String, String> pricingRequestIDStatusMap = new Map<String, String>();
      for(Pricing_Request__c prReq : pricingRequestQueryList)
      {
        pricingRequestIDLevelMap.put(prReq.Id, prReq.Current_Level__c);
        //Version : (2.5) Added condition for Status check in Bulk approval
        pricingRequestIDStatusMap.put(prReq.Id, prReq.Request_Approval_Status__c);
      }                                                           
      for(Integer i=0;i<pricingRequestSelectedList.size();i++)
      { 
        //Version : (2.5) Added condition for Status check in Bulk approval
        if(pricingRequestSelectedList[i].Current_Level__c <> pricingRequestIDLevelMap.get(pricingRequestSelectedList[i].Id)
            ||  pricingRequestSelectedList[i].Request_Approval_Status__c <> pricingRequestIDStatusMap.get(pricingRequestSelectedList[i].Id)
            )
        {
          errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
        } 
        if(!errorMessageFlag)
        {       
                    Integer k=0;
          for(Integer j=1;j<6;j++)
          {
            if(pricingRequestSelectedList[i].Current_Level__c == String.valueOf(j))
            {
              System.debug('Current_Level__c:'+ pricingRequestSelectedList[i].Current_Level__c);
              System.debug('String.valueOf(j):'+ String.valueOf(j));
              //Integer k=0;
              for(Schema.FieldSetMember appSet :apprFields)
              {
                if(k<6)
                {
                  k=k+1;
                  if(pricingRequestSelectedList[i].get(appSet.getFieldPath())<> NULL && k>=j+1)
                  {
                    pricingRequestSelectedList[i].Current_Level__c=String.valueOf(k);
                    k=6;
                    System.debug('Current_Level__c:'+ pricingRequestSelectedList[i].Current_Level__c);
                          System.debug('String.valueOf(k):'+ String.valueOf(k));
                  }
                }
              }
            }
          }
          //Update Current Level Field     
          /*if(pricingRequestSelectedList[i].Current_Level__c == '1')
          {
            if(pricingRequestSelectedList[i].Approver2__c <> NULL)
            {
              pricingRequestSelectedList[i].Current_Level__c = '2';
              system.debug(logginglevel.error,'CHECK Current level.. '+pricingRequestSelectedList[i].Current_Level__c);
            }
            else if(pricingRequestSelectedList[i].Approver3__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '3';
                        else if(pricingRequestSelectedList[i].Approver4__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '4';
                        else if(pricingRequestSelectedList[i].Approver5__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '5';
                    }
                    else if(pricingRequestSelectedList[i].Current_Level__c == '2')
                    {
                        if(pricingRequestSelectedList[i].Approver3__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '3';
                        else if(pricingRequestSelectedList[i].Approver4__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '4';
                        else if(pricingRequestSelectedList[i].Approver5__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '5';        
                    }
                    else if(pricingRequestSelectedList[i].Current_Level__c == '3')
                    {
                        if(pricingRequestSelectedList[i].Approver4__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '4';
                        else if(pricingRequestSelectedList[i].Approver5__c <> NULL)
                            pricingRequestSelectedList[i].Current_Level__c = '5';
                    }
                    else if(pricingRequestSelectedList[i].Approver5__c <> NULL)
                    {
                        pricingRequestSelectedList[i].Current_Level__c = '5';
          }     */           
          upsertPricingRequestList.add(pricingRequestSelectedList[i]);
        }
      }
      if(!errorMessageFlag){
        upsert upsertPricingRequestList;
        upsertPricingRequestList.clear();

        /*for(Integer i=0;i<pricingRequestSelectedList.size();i++){    
                  //To get the latest instance of request
                  //<PP20130722> -- <NS20130821> Added Landing_Cost__c field to query select clause
                  Pricing_Request__c pricingRequest = [SELECT Request_Class__c,Pricing_Exception__c,Attachments_on_Customer_Prices__c, Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/
        //      Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
        //   State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/
        //
        //                  Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
        //             SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
        //              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
        //            Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
        //          LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
        //        Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name, CreatedDate,
        //      CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
        //    Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
        //     Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
        //       Sold_To_Code__r.Terms_Of_Payment__c,*/
        //      On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
        //      Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,Landing_Cost__c
        //       FROM Pricing_Request__c
        //             WHERE  Id =:pricingRequestSelectedList[i].Id];

        //    Approval.ProcessResult result = null;
        //     List<Id> newWorkItemIds = null;

        // Approve the submitted request
        // First, get the ID of the newly created item
        // Instantiate the new ProcessWorkitemRequest object and populate it
        //      Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
        //      req2.setComments('Approving request.');
        //       req2.setAction('Approve');
        //       req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
        //       ProcessInstanceWorkitem newProcess = [Select Id, processinstance.targetobjectid From ProcessInstanceWorkitem where processinstance.targetobjectid = :pricingRequest.Id];
        // Use the ID from the newly created item to specify the item to be worked
        //     req2.setWorkitemId(newProcess.Id);

        //    result = Approval.process(req2);
        //     newWorkItemIds = result.getNewWorkitemIds(); 
        //      system.debug(logginglevel.error,'$$$4'+newWorkItemIds.size());  
        //      } */
        Set<Id> pricingReqSelectedSet= new Set<Id>();
        Set<String> pricingReqSelectedSet1= new Set<String>();
        for(Pricing_Request__c pr:pricingRequestSelectedList)
        {   
          pricingReqSelectedSet.add(pr.Id);
          pricingReqSelectedSet1.add('\''+pr.Id+'\'');
        }
        system.debug(pricingReqSelectedSet+' '+pricingReqSelectedSet1);
        String prSel;
        if(pricingReqSelectedSet.size()>0)
        {
          prSel='(';
          for(String prid:pricingReqSelectedSet)
          {
            prSel=prSel+'\''+prid+'\',';
          }
          prSel=prSel.substring(0,prSel.length()-1);
          prSel=prSel+')';
        }
        else
          prSel=null;
        //<PP20140116>
        //<PP20140305>
        //<BB20140321> Added Auto_Approver Fields in the query
        //<MS20140421> Added Backup_Level Name and approverText Fields in the query
        //<BB20140429> Added Default_Currency__c in the query
        //<BB20140509> Added Current_Routing_Parameter__c in the query
        /*List<Pricing_Request__c> pricingRequestList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Submitted_By__c,Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Pricing_Exception__c,Attachments_on_Customer_Prices__c, Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                                       State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                                               SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                                               Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                                               Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                                               LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                                               Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name, CreatedDate,
                                                               CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                                               Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                                                       Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                  Sent_To_Backup_Approver__c, NPC_Status__c, Assigned_To__r.Name, Backup_Level_1__c, Backup_Level_1__r.name, Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name, Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,Landing_Cost__c,
                  approverText__c,Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,ComPartner__c,ComPartner_Code__c                                   
                  FROM Pricing_Request__c WHERE  Id IN :pricingReqSelectedSet];*/
        List<Pricing_Request__c> pricingRequestList = (List<Pricing_Request__c>)PAQueryUtil.query('PAApprovalWF', 'request.pricingRequest', (pricingReqSelectedSet.size()>0?' id in '+prSel:''));
        pricingReqSelectedSet.clear();
        for(Pricing_Request__c prList:pricingRequestList){   
          pricingReqSelectedSet.add(prList.Id);
        }
        List<ProcessInstanceWorkitem> newProcessList = [Select Id, processinstance.targetobjectid From ProcessInstanceWorkitem where processinstance.targetobjectid = :pricingReqSelectedSet];
        System.debug('****newProcessList_ APPROVAL'+newProcessList);
        Map<Id,Id> targetObjectProcessInstanceMap =new Map<Id,Id>();
        for(ProcessInstanceWorkitem newProcess:newProcessList){   
          targetObjectProcessInstanceMap.put(newProcess.processinstance.targetobjectid,newProcess.Id);
        }
          //<MG04042017> - Bulk Approval at level 5 - Too many SOQL
          List<Approval.ProcessWorkitemRequest> requests = new List<Approval.ProcessWorkitemRequest>();
          for(Pricing_Request__c pRequest:pricingRequestList){                    
              Approval.ProcessResult result = null;
              List<Id> newWorkItemIds = null;
              // Approve the submitted request
              // First, get the ID of the newly created item
              // Instantiate the new ProcessWorkitemRequest object and populate it
              Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
              req2.setComments('Approving request.');
              req2.setAction('Approve');
              System.debug('****USER ID_ APPROVAL'+(new Id[] {UserInfo.getUserId()}) + '****'+pRequest.Id);
              req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
              // Use the ID from the newly created item to specify the item to be worked
              Id newProcess = targetObjectProcessInstanceMap.get(pRequest.Id);
              req2.setWorkitemId(newProcess);
              //<MG04042017> - Bulk Approval at level 5 - Too many SOQL
              requests.add(req2);
              System.debug('****req2_ APPROVAL'+req2+'****'+targetObjectProcessInstanceMap);
              // result = Approval.process(req2);
              //  newWorkItemIds = result.getNewWorkitemIds(); 
              //system.debug(logginglevel.error,'$$$4'+newWorkItemIds.size());  
              
              
              
              
          }
          //<MG04042017> - Bulk Approval at level 5 - Too many SOQL
          Approval.ProcessResult[] processResults = Approval.process(requests);
      }
    }
  }
  //Method to query the pricing request object
  private void querytoPricingRequest(Id requestId){
    // <BR20130424> Ver 2.4
    //<PP20130722> -- <NS20130821> Added Landing_Cost__c field to query select clause
    //<PP20140116>
    //<PP20140305>
    //<BB20140321> Added Auto_Approver Fields in the query
    //<MS20140421> Added Backup_Level Name and approverText Fields in the query
    //<BB20140429> Added Default_Currency__c in the query
    //<BB20140509> Added Current_Routing_Parameter__c in the query
    //<GT20140913> Added Email in all approver levels
    /*request.pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Submitted_By__c,Display_Standardized_Rate__c,Standardized_Currency__c,Standardized_UoM__c,Request_Class__c,Pricing_Exception__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                              State_Province__c,Spot_Type__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                  SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                  Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
                                  Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                  LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                  Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                  CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                  Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                Sent_To_Backup_Approver__c, NPC_Status__c, Backup_Level_1__c, Backup_Level_1__r.name, Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, Backup_Level_3__r.name, Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,Landing_Cost__c,
                approverText__c,Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,
                Delegation_Comments__c,Approver1__r.Email, Approver2__r.Email, Approver3__r.Email, Approver4__r.Email, approver5__r.Email, ComPartner__c, ComPartner_Code__c 
                FROM Pricing_Request__c WHERE Id = :requestId];*/
    request.pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PAApprovalWF', 'request.pricingRequest', ' Id =\''+requestId+'\''))[0];      
  }
  //This is a method that will bulk reassign the request from pending approval page.
  private string currentAssigneduser;
  public List<Pricing_Request__c> pricingRequestforReassign{get;set;}

  public String allSalesOrg{get;set;}
  public String allDistChannels{get;set;}
  public String allDivisonCodes{get;set;}
  public void bulkReassignPopup(List<Pricing_Request__c> pricingRequestSelectedList){
    boolean errormessageFlag = false;
    system.debug(logginglevel.error,'***Bulk reassign start'+pricingRequestSelectedList);
    //This set will check for the selection is valid or not. All the Request selected must be assigned  to single person.
    set<String> currentApproverSet = new set<String>();
    for(Pricing_Request__c pr : pricingRequestSelectedList){
      currentApproverSet.add(pr.Current_Approver__c);
      if(pricingRequestforReassign.size()==0){
        pricingRequestforReassign.add(pr);
        //<PR20140901> START
        //reassignedUserName = pr.current_Approver__r.name;
        //reassignedUserAppId = pr.Current_Approver__r.E_Pass_Id__c;
        reassignedUserName = '';
        reassignedUserAppId = '';
        //<PR20140901> END
      }
      else{break;}

      //get all sales org
      allSalesOrg = pr.Sales_Org_Code__c + ',';
      allDistChannels = pr.Dist_Channel_Code__c + ',';
      allDivisonCodes = pr.Division_Code__c + ',';
    }  
    if(currentApproverSet.size()==0){
      errormessageFlag = PAUtil.apexErrorMsg('Invalid Selection.');  
    }
    else{
      List<String> currentApproverList = new List<String>();          
      currentApproverList.addAll(currentApproverSet);
      //<PR20140901> START
      //currentAssignedUser = currentApproverList[0];
      currentAssignedUser = '';      
      //<PR20140901> END
    }
    if (!errormessageFlag){
      displayReassignList = true;
      allSalesOrg = allSalesOrg.substring(0,allSalesOrg.length()-1);
      allDistChannels = allDistChannels.substring(0,allDistChannels.length()-1);
      allDivisonCodes = allDivisonCodes.substring(0,allDivisonCodes.length()-1);
    }    
  }
  public void closeReassignPopup(){
    displayReassignList = false;
  }
  public void closeUserLookup(){
    showUserLookupListFlag = false;
  }
  public void reassignLookup(List<Pricing_Request__c> pricingRequestSelectedList){
    //This will display the custom lookup for the user to be selected for reassigning.
    //For Defect 265 : Utkarsh
    if(pricingRequestSelectedList.size()>0)
      request.pricingRequest = pricingRequestSelectedList[0];
    set<Id> approverUserList = new set<Id>();
    for(Organizational_Group_User__c orgUser : [SELECT Related_User__c, OrgGroup__c, OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Distribution_Channel_Code__c, OrgGroup__r.ERP_Division_Code__c FROM Organizational_Group_User__c]){
      if((orgUser.OrgGroup__r.ERP_Sales_Org_Code__c+'-'+orgUser.OrgGroup__r.ERP_Distribution_Channel_Code__c+'-'+orgUser.OrgGroup__r.ERP_Division_Code__c) == (request.pricingRequest.SalesArea__c))
        approverUserList.add(orgUser.Related_User__c);
    }
    userReassignList = [select E_Pass_Id__c, Name from User where isactive = true AND Id IN :approverUserList];
    showUserLookupListFlag = true;
  }
  //<PR20140901> START
  /*public void saveBulkReassign(List<Pricing_Request__c> pricingRequestSelectedList, String newUserId){
        system.debug(logginglevel.error,'***Save bulk'+pricingRequestSelectedList+newUserId);
        for(Pricing_Request__c p : pricingRequestSelectedList){
            newAssignedUser = p.Current_Approver__c = newUserId;
        }
        List<Pricing_Request__c> upsertPricingRequestList = new List<Pricing_Request__c>();
        List<Id> pricingReqIdList = new List<Id>(); 
        for(Integer i=0; i<pricingRequestSelectedList.size(); i++){         
            pricingReqIdList.add(pricingRequestSelectedList[i].Id);

            //<PR20140901> START
            partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap();
            partnerSoapSforceCom.LoginResult loginResult = sp.login('spec.specpa@dupont.com', IntegrationLoginCredentials__c.getInstance('spec.specpa@dupont.com').EncryptedLoginDetails__c);
            WebServiceReassign.PAReassign stub = new WebServiceReassign.PAReassign();
            WebServiceReassign.SessionHeader_element sessionHeader = new WebServiceReassign.SessionHeader_element();
            sessionHeader.sessionId = loginResult.sessionId;

            stub.timeout_x = 120000;
            stub.SessionHeader = sessionHeader;
            string error = stub.reAssign(pricingRequestSelectedList[i].id,pricingRequestSelectedList[i].Approver1__c,newAssignedUser);
            if(!error.containsIgnoreCase('success')) {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, error);  
                ApexPages.addMessage(myMsg); 
                return;
            }
            //<PR20140901> END
            if(pricingRequestSelectedList[i].Current_Level__c == '1'){
                currentAssignedUser = pricingRequestSelectedList[i].Approver1__c;
                pricingRequestSelectedList[i].Approver1__c = newAssignedUser;                   
            }
            else if(pricingRequestSelectedList[i].Current_Level__c == '2'){
                currentAssignedUser = pricingRequestSelectedList[i].Approver2__c; 
                pricingRequestSelectedList[i].Approver2__c = newAssignedUser;
            }
            else if(pricingRequestSelectedList[i].Current_Level__c == '3'){
                currentAssignedUser = pricingRequestSelectedList[i].Approver3__c; 
                pricingRequestSelectedList[i].Approver3__c = newAssignedUser;
            }
            else if(pricingRequestSelectedList[i].Current_Level__c == '4'){
                currentAssignedUser = pricingRequestSelectedList[i].Approver4__c; 
                pricingRequestSelectedList[i].Approver4__c = newAssignedUser;
            }
            else if(pricingRequestSelectedList[i].Current_Level__c == '5'){
                currentAssignedUser = pricingRequestSelectedList[i].Approver5__c; 
                pricingRequestSelectedList[i].Approver5__c = newAssignedUser;
            }
            upsertPricingRequestList.add(pricingRequestSelectedList[i]);            
        }
        //List<ProcessInstanceWorkItem> processes = [Select p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where actorid = :currentAssignedUser and processinstance.targetobjectid IN :pricingReqIdList];
        //<PR20140901> START
        List<ProcessInstanceWorkItem> processes = [Select p.ProcessInstanceId, p.OriginalActorId, p.Id, p.ActorId, processinstance.targetobjectid From ProcessInstanceWorkitem p where processinstance.targetobjectid IN :pricingReqIdList];
        /*if(processes.size()== 0){
            upsertPricingRequestList.clear();
            for(Integer i=0; i<pricingRequestSelectedList.size(); i++){         
                if(pricingRequestSelectedList[i].Current_Level__c == '1'){
                    pricingRequestSelectedList[i].Approver1__c = currentAssignedUser;                   
                }
                else if(pricingRequestSelectedList[i].Current_Level__c == '2'){
                    pricingRequestSelectedList[i].Approver2__c = currentAssignedUser;
                }
                else if(pricingRequestSelectedList[i].Current_Level__c == '3'){
                    pricingRequestSelectedList[i].Approver3__c = currentAssignedUser;
                }
                else if(pricingRequestSelectedList[i].Current_Level__c == '4'){
                    pricingRequestSelectedList[i].Approver4__c = currentAssignedUser;
                }
                else if(pricingRequestSelectedList[i].Current_Level__c == '5'){
                    pricingRequestSelectedList[i].Approver5__c = currentAssignedUser;
                }
                pricingRequestSelectedList[i].Current_Approver__c = currentAssignedUser;
                upsertPricingRequestList.add(pricingRequestSelectedList[i]);  
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'This request has been escalated to Backup approver. Reassignment cannot be done.');  
                ApexPages.addMessage(myMsg);          
            }
        }            
        system.debug(logginglevel.error,'****'+newAssignedUser+'****'+currentAssignedUser);*/
  //<PR20140901> END
  /*for(ProcessInstanceWorkItem p : processes){
            p.ActorId = newAssignedUser;
        }
        update processes;
        update upsertPricingRequestList;
        displayReassignList = false;
    }*/

  public void saveBulkReassign(List<Pricing_Request__c> pricingRequestSelectedList, String newUserId){
    /*String requestId='';
        List<Id> pricingReqIdList = new List<Id>(); 
        for(Integer i=0; i<pricingRequestSelectedList.size(); i++){
            pricingReqIdList.add(pricingRequestSelectedList[i].Id);         
            if(i != pricingRequestSelectedList.size() - 1){
                requestId = requestId + pricingRequestSelectedList[i].Id + '-';
            }else{
                requestId = requestId + pricingRequestSelectedList[i].Id;
    }
    }   */ 
    /* commenting out, reassign is handled via ajax tool kit
        partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult loginResult = sp.login('spec.specpa@dupont.com', IntegrationLoginCredentials__c.getInstance('spec.specpa@dupont.com').EncryptedLoginDetails__c);
        WebServiceReassign.PAReassign stub = new WebServiceReassign.PAReassign();
        WebServiceReassign.SessionHeader_element sessionHeader = new WebServiceReassign.SessionHeader_element();
        sessionHeader.sessionId = loginResult.sessionId;

        stub.timeout_x = 120000;
        stub.SessionHeader = sessionHeader;
        string error = stub.reAssign(requestId,'',newUserId);
        if(!error.containsIgnoreCase('success')) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, error);  
            ApexPages.addMessage(myMsg); 
            return;
        }
     */

    //PAReassign.reAssign(requestId,'',newUserId);
    system.debug('\n\n\n in savebulkreassign');
    request.relatedWrappersList = request.getListWrappers();
    //displayReassignList = false;
    //system.debug('\n\n\n displayReassignList '+displayReassignList);
  }
  //<PR20140901> END

  //<BB20140321> Added mapAutoUser and mapRoutingParameter as the Parameters
  public void popApprover(List<PA_BU_Admin_Detail__c> adminDetailList, Map<Integer, list<Id>> mapFinalUser, Set<String> setLevelNR,Map<Integer, list<String>> mapAutoUser,Map<Integer, String>mapRoutingParameter){              
    system.debug(logginglevel.error,'@@@@@@@@ i am entering here'+mapAutoUser);
    wrapList.clear();
    List<Id> s1 = new List<Id>();
    for(Integer i : mapFinalUser.keySet())
    {
      s1.addAll(mapFinalUser.get(i));
    }
      system.debug('NS@@@@@@@@ S1 '+s1);
       system.debug('NS@@@@@@@@ adminDetailList '+adminDetailList);
    List<String> s2 = new List<String>();
    for(Integer i : mapAutoUser.keySet())
    {
      s2.addAll(mapAutoUser.get(i));
    }
    list <User> listUser1 = [Select Id,Name from User where isactive = true AND (Id IN :s1 OR Id IN :s2 OR Name IN :s2)]; // for testing added user role in where  clause --  and UserRole.Name like 'CPM%'
    Set<User> listUser = new Set<User>();
    listUser.addAll(listUser1);
    system.debug('%%%%%%listUser'+listUser);   
    Set<Id> setUser = new Set<Id>();
    Set<String> setUserName = new Set<String>();
    List<Id> selectList = new List<Id>();
    List<SelectOption> selOption = new List<SelectOption>();

    //<BB20140321> Added The lists to hold AutoAprrovers and routing parameters
    List<String> selectAutoList= new List<String>();
    List<SelectOption> selAutoOption = new List<SelectOption>();
    List<String> selectRoutingParameter= new List<String>();
    //<BB20140321>END
    displayApproverList = true;
    //pop-up display approver list
    //<AJ20160105> START variable for error message string for inactive approver
    string errorstr = '';
    //<AJ20160105> END
    for(Integer i : mapFinalUser.keySet()){
      selectList.clear();
      selOption.clear();
      setUser.clear();
      selectAutoList.clear();
      PAWrapper wrap = new PAWrapper();
      wrap.stringMap = new map<String, String>();
      wrap.selectApprover = new List<SelectOption>();
      wrap.stringMap.put('intList', String.valueOf(i));
      wrap.stringMap.put('showAutoUser', 'false'); // <SP20140617>
      if(setLEvelNR.contains(String.valueOf(i))){
        wrap.stringMap.put('approvalNotReqFlag', 'true');
      }    
      else {
        wrap.stringMap.put('approvalNotReqFlag', 'false');
      }          
      for(PA_BU_Admin_Detail__c ad : adminDetailList){
        wrap.stringMap.put('selectedApproverRole', ' ');
        if(Integer.valueOf(ad.Approval_Level__c) == i){
          wrap.stringMap.put('selectedApproverRole', ad.Approver_Role__c);
            system.debug('NS %%%%%%%%%%%%%%%%%'+ wrap.stringMap);
            system.debug('NS %%%%%%%%%%%%%%%%%'+ad.Approver_Role__c);
          break;
        }
      }
      
        
      //selectList.addAll(mapFinalUser.get(i));
      //<BB20140321> Start
      selectAutoList.addAll(mapAutoUser.get(i));
      selectRoutingParameter.add(mapRoutingParameter.get(i));
      //<BB20140321> END

      system.debug(logginglevel.error,'%%%%%%%%%%%%%%%%%'+selectList+'i'+i);              
      setUser.addAll(mapFinalUser.get(i));
      selectList.clear();
      for(User u : listUser){
        for(Id userid : setUser){
          if(u.Id == userid){
            selOption.add(new SelectOption(u.Id,u.Name));
            selectList.add(u.Id);
          }
        }      
      }  
      wrap.selectApprover.addAll(selOption);      
      system.debug('*&**& wrap.selectApproverselOption - '+wrap.selectApprover);
      wrap.stringMap.put('editFlag', 'false');
      wrap.stringMap.put('selectedUserId', ' ');
      if(wrap.selectApprover.size() == 1 || wrap.selectApprover.size() == 0){
        wrap.stringMap.put('editFlag', 'true');
        if(wrap.selectApprover.size() == 1 ){
          system.debug(logginglevel.error,'***Size is 1');
          wrap.stringMap.put('selectedUserId', selectList[0]);              
        }
      }     
      if(wrap.selectApprover.size()>0){
        wrap.stringMap.put('showSelectListFlag', 'true');
      } 
      else{
        wrap.stringMap.put('showSelectListFlag', 'false');
      }    
      //<BB20140321> START Added logic to get the approvers for Auto approved level.
      if(mapFinalUser.get(i).isEmpty() && (mapRoutingParameter.get(i).containsIgnoreCase('Below Floor Price') || mapRoutingParameter.get(i).containsIgnoreCase('Below Reference Price') || mapRoutingParameter.get(i).containsIgnoreCase('Below Current Price'))){
        setUser.clear();
        setUserName.clear();
        wrap.selectApprover = new List<SelectOption>();
        selAutoOption = new list<SelectOption>(); 
        setUserName.addAll(selectAutoList);
        System.debug(logginglevel.error,'*****User Id Auto'+setUserName); 
        List<User> autoUserList = new list<User>();
        selectAutoList.clear();  
        system.debug('%%%%%%forlistUser'+listUser); 
        system.debug('%%%%%%setUserName'+setUserName);  
        for(User u : listUser){
          for(String username : setUserName){
            if(u.name == username){
              selAutoOption.add(new SelectOption(u.Name,u.Name));
              selectAutoList.add(u.Name);
              autoUserList.add(u);
              System.debug(logginglevel.error,'*****User Id Auto'+ u.Id+u.Name); 

            }
          }   
        }
        wrap.selectApprover.addAll(selAutoOption);
        wrap.stringMap.put('editFlag', 'false');

        wrap.stringMap.put('showAutoUser', 'true'); // <SP20140617>

        //if(wrap.selectApprover.size() == 1 || wrap.selectApprover.size() == 0){
        //wrap.stringMap.put('editFlag', 'true');
        /*if(wrap.selectApprover.size() == 1 ){
                        system.debug(logginglevel.error,'***Size is 1 in Auto Approver');
                        if(selectRoutingParameter[0].containsIgnoreCase('Below Floor Price'))
                        {
                            wrap.stringMap.put('selectedAutoUser', selectAutoList[0] +' (Not Required - Above Floor)');
                        } 
                        else if(selectRoutingParameter[0].containsIgnoreCase('Below Reference Price'))
                        {
                            wrap.stringMap.put('selectedAutoUser', selectAutoList[0] +' (Not Required - Above Reference)');
                        }
                        else if(selectRoutingParameter[0].containsIgnoreCase('Below Current Price'))
                        {
                            wrap.stringMap.put('selectedAutoUser', selectAutoList[0] +' (Not Required - Above Current)');
                        }              
                    }*/

        system.debug('*&**& wrap.selectApprover - '+wrap.selectApprover);        
        system.debug('*&**& wrap.selectApprover size - '+wrap.selectApprover.size()+'Routing para '+mapRoutingParameter.get(i));
        //<SP20140617> START
        wrap.stringMap.put('selectedAutoUser', ' ');
        if(wrap.selectApprover.size() > 0)
        {
          wrap.stringMap.put('selectedAutoUser', ' ');
          if(wrap.selectApprover.size() == 1)
          {
            wrap.stringMap.put('editFlag', 'true');
            if(mapRoutingParameter.get(i).containsIgnoreCase('Below Floor Price'))
            {
              wrap.stringMap.put('selectedAutoUser', selectAutoList[0]);
            } 
            else if(mapRoutingParameter.get(i).containsIgnoreCase('Below Reference Price'))
            {
              wrap.stringMap.put('selectedAutoUser', selectAutoList[0]);
            }
            else if(mapRoutingParameter.get(i).containsIgnoreCase('Below Current Price'))
            {
              wrap.stringMap.put('selectedAutoUser', selectAutoList[0]);
            }  
          }

          for(String X:selectAutoList)
          {
            if(mapRoutingParameter.get(i).containsIgnoreCase('Below Floor Price'))
            {
              wrap.stringMap.put(X , X+' (Not Required - Above Floor)');
            }
            else if(mapRoutingParameter.get(i).containsIgnoreCase('Below Reference Price'))
            {
              wrap.stringMap.put(X , X+' (Not Required - Above Reference)');
            }
            else if(mapRoutingParameter.get(i).containsIgnoreCase('Below Current Price'))
            {
              wrap.stringMap.put(X , X+' (Not Required - Above Current)');
            } 
          }

        }
        system.debug('*&**& wrap.stringMap Final - '+wrap.stringMap);        
        //<SP20140617> END
        //} 
        if(wrap.selectApprover.size()>0){
          wrap.stringMap.put('showSelectListFlag', 'true');
        } 
        else{
          wrap.stringMap.put('showSelectListFlag', 'false');
        } 

      }
      //<BB20140321> END
      System.debug('Data to wrapper list:-'+wrap);      
      //<AJ20160105> START Adding logic to show error if approver is inactive in system when submitting the request            
      system.debug('wrap.stringmap.get(selectedApproverRole)'+wrap.stringmap.get('selectedApproverRole'));
      system.debug('wrap.stringmap.get(selectedUserId)'+string.isblank(wrap.stringmap.get('selectedUserId')));
      system.debug('wrap.stringmap.get(showAutoUser)'+wrap.stringmap.get('showAutoUser'));         
      if(selOption.size()==0 && selautooption.size()==0 && wrap.stringmap.get('approvalNotReqFlag') == 'false' && wrap.stringmap.get('selectedApproverRole')!=null && string.isblank(wrap.stringmap.get('selectedUserId')) && (wrap.stringmap.get('showAutoUser') == 'false' || (wrap.stringmap.get('showAutoUser') == 'true' && string.isblank(wrap.stringmap.get('selectedAutoUser')))) && wrap.stringmap.get('intList') == string.valueof(i))
      {          
          if(string.isblank(errorstr))
          {
              errorstr = 'Level '+i;
          }
          else
          {
              errorstr = errorstr + ',Level '+i;
          }                        
      }
      else
      {
          wrapList.add(wrap);  
      }        
    }
    boolean errorMessageFlag = false;
    if(!string.isblank(errorstr))
    {
        errormessageFlag = PAUtil.apexErrorMsg(errorstr+' approver is inactive in system. Please update your approval flow and submit this request again');
        displayApproverList = false;      
    } 
    //<AJ20160105> END
    //system.debug(logginglevel.error,'%%%%%'+ mapRoutingParameter.get(3)+'%%%%%'+ mapFinalUser.get(3).isEmpty()+'%%%'+wrapList[2].stringMap.get('showAutoUser')+'%%%'+wrapList[2].stringMap.get('selectedUserId')+'&&&&'+selOption);
    //to call submitcontinue Method once NPC is received(and to enable auto-submit) 
    if(AsyncCallIndicatorCount > 0 && request.pricingRequest.NPC_Status__c == 'Net Price Received' && request.pricingRequest.Pricing_Request_Type__c <> 'Pricing Task'){
      system.debug(logginglevel.error,'%%%%%in popapprover'+ selectList.size()); 
      system.debug(logginglevel.error,'%%%%%'+ selectList.size()+AsyncCallIndicatorCount+request.pricingRequest.NPC_Status__c+request.pricingRequest.Pricing_Request_Type__c);
      action('PAPricingRequest', 'PAPricingRequest', 'submitContinue');
    }
  }    
  //async call out 
  @future
  public static void submitFuture(String passedId, String selectedBU){
    system.debug('In future method');
    PAApprovalWF approvalWF = new PAApprovalWF(passedid, selectedBU);
    approvalWF.action('PAPricingRequest', 'PAPricingRequest', 'submitCalculation');

    //approvalWF.submit();
  } 
  private Map<String, String> mapFinalBackup = new Map<String, String>();
  //added by sumita dabas 29 oct 2015 Issue 58402 
    List<String> BUList = new List<String>();
  public string action(String newPagelabel, String currentPagelabel, String desiredAction){
    //<VR20130930> DTT Rollout
    system.debug('#&^fr'+desiredAction);
    AsyncCallIndicatorCount = 0;
    boolean errorMessageFlag = false;
    Map<Integer, list<Id>> mapFinalUser = new Map<Integer, List<Id>>();
    //<BB20140321> Added mapAutoUser to hold Auto approve Users and mapRoutingParameter to hold routing parameter 
    Map<Integer, list<String>> mapAutoUser = new Map<Integer, List<String>>();
    Map<Integer, String> mapRoutingParameter = new Map<Integer, String>();
    List<Id> mapValues = new List<Id>();
    Set<String> setLevelNR = new Set<String>();
    Set<String> routingParameter = new Set<String>();
    Set<String> setCountry = new Set<String>();
    Set<String> setSalesOff = new Set<String>();
    Set<String> setSalesDis = new Set<String>();
    Set<String> setSalesOrg = new Set<String>();
    Set<String> setEndUse = new Set<String>();
    Set<String> setDivision = new Set<String>();
    Set<String> setCampaign = new Set<String>();
    Set<String> setDocumentCurrency = new Set<String>();
    Set<String> setState = new Set<String>();
    setPH = new Set<String>();
    setFRB = new Set<String>(); // Added by hema
    //<GT20140830> - Reason code for approval routing
    Set<String> setReasonCode = new Set<String>();

    Set<String> setFRBCodes = new Set<String>(); 
    Set<String> setMarketSegment = new Set<String>();
    Set<String> setSalesRed = new Set<String>();
    //<MS20140905>
    String requestType;
    String reqPriceCategory;
    Set<Id> priIdSet = new Set<Id>();
    Map<Id,boolean> priIdSyncMap = new Map<Id,boolean>();
    boolean isSync = true;
    if(request.requestServiceState.ogItems.isEndUserRebate) isEndUserRebate = true;
    //<PS20130417> Ver 2.3
    Set<String> setCustomerGroup2 = new Set<String>();
    //Piyush <PG20191211> Start
      Set<String> setCustomerGroup4 = new Set<String>();
    //Piyush <PG20191211> End
    //system.debug(logginglevel.error,'****Inside Action Approval'+desiredAction+request.pricingRequest);
    //Shiva for rebate sales org route test- start
    //Pricing_Request__c prSalesOrg = [SELECT Id, Sales_Org_Code__c FROM Pricing_Request__c WHERE Id= :request.pricingRequest.Id];
    setSalesOrg.add(request.pricingRequest.Sales_Org_Code__c);
    String RPQRouting = '';

    //Shiva for rebate sales org route test- end
    //<PP20140108>
    //<BB20140404> Added Error_Indicator__c  in the query
    //<TJ20140429> Added Profit_Center_Code__c in query
    //<HL20140910> Added PH code 1-9 in the pricingRequestItemsList query
    //<HL20140926> Added Division and division code in the pricingRequestItemsList query
    /*List<Pricing_Request_Item__c> pricingRequestItemsList = [SELECT PCKC__c,Expire__c,Calculation_Type__c,isVolumeApplicable__c,New_Volume__c,New_Volume_UoM__c,isNPCApplicable__c,isPaymentTermsApplicable__c,New_Customer_Price_Payment_Terms__c,BU__c,F_Product_Hierarchy_Code__c,id, Below_Floor_Flag__c, Below_Reference_Flag__c, Below_Current_Flag__c,Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_Below_Net_Current__c, Material_Code__c, Valid_From__c, Valid_To__c, Market_Segment_COde__C, MArket_Segment__c, Key_Combination__c,Key_Combination_Code__c,SAP_Cluster__c, Sold_To_Code__c,
                                                                 Country__c, Sales_Office__c, Quantity__c, Sales_Office_Code__c, Sales_Org__c, Sales_Org_Code__c, End_Use__c, End_Use_Code__c, PH1__c, PH2__c, PH1_Code__c, PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c, New_Rate__c, New_Per__c, New_Unit__c, New_UOM__c, New_Valid_From__c, New_Valid_To__c, Net_Price_Status__c, Pricing_Request__r.Sales_Org_Code__c,Error_Indicator__c,Profit_Center_Code__c,Division__c,Division_Code__c,Pricing_Request__r.Request_Reason__c,Pricing_Request_Type__c,Variant__c,Variant_Code__c,
                                                                 ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c                    
                                                             FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :request.pricingRequest.Id];*/
    List<Pricing_Request_Item__c> pricingRequestItemsList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PAApprovalWF', 'pricingRequestItemsList', ' Pricing_Request__c =\''+request.pricingRequest.Id+'\'');                                                         
    //<PP20130722> - Routing based on Request Class    
    system.debug('TESTING'+request.pricingRequest.Country__c);
    //system.debug('TestingBUBU'+request.pricingRequest.BU__c);    
    //system.debug('TestingSalesOrg'+request.pricingRequest.Sales_Org_Code__c);    

    Double totalSalesReduction = 0.0;
    boolean rpqbelowfloorflag = false;
    boolean rpqbelowrefflag = false;
    boolean rpqsrflag = false;
    Double totalDealValue = 0.0;
    Integer roundedtotalSR = 0;
    //IM20150121
    if(request.requestServiceState.ogitems.isEndUserRebate){

      for(Pricing_Request_Item__c pItem : pricingRequestItemsList){
        totalSalesReduction = totalSalesReduction+pItem.Sales_Reduction__c;
        totalDealValue = totalDealValue+Double.ValueOf(pItem.New_Rate__c);
        if(pItem.Stamp_Floor_Price__c!=null && pItem.New_Rate__c < pItem.Stamp_Floor_Price__c) rpqbelowfloorflag = true;
        else if(pItem.Stamp_Floor_Price__c==null) rpqbelowfloorflag = true;
        if(pItem.Stamp_Reference_Price__c!=null && pItem.New_Rate__c < pItem.Stamp_Reference_Price__c) rpqbelowrefflag = true;
        else if(pItem.Stamp_Reference_Price__c==null) rpqbelowrefflag = true;
      }
      //request.pricingRequest.Total_Deal_Value__c = totaldealval;
      roundedtotalSR = Math.round(totalSalesReduction);
      setSalesRed.add(String.valueOf(roundedtotalSR));
      request.totalSalesReduction = Double.ValueOf(totalSalesReduction);
      request.pricingRequest.Total_Deal_Value__c = totalDealValue;
      String rpqIdentifier = request.requestServiceState.currentRequest.pricingRequest.BU__c+'-'+request.requestServiceState.currentRequest.pricingRequest.Sales_Org_Code__c;
      Rebate_Price_Quote_Data__c rpqdata = Rebate_Price_Quote_Data__c.getInstance(rpqIdentifier);
      if(!rpqbelowfloorflag && !rpqbelowrefflag && roundedtotalSR<=rpqdata.Approval_Threshold__c) 
        RPQRouting = 'Above Threshold';
      else RPQRouting = 'Below Threshold';
    }


    if(request.pricingRequest.Request_Type__c=='Customer Specific')
    {
      requestType='Customer Specific';
      if(request.pricingRequest.Pricing_Request_Type__c=='Import'||request.pricingRequest.Pricing_Request_Type__c=='Massive')
        reqPriceCategory='Permanent';
      else
        reqPriceCategory=request.pricingRequest.Pricing_Request_Type__c;
    }
    else if(request.pricingRequest.Request_Type__c=='Non Customer Specific')
    {   requestType='Non Customer Specific';
    reqPriceCategory=request.pricingRequest.Pricing_Request_Type__c;
    }        
    else if(request.pricingRequest.Request_Type__c=='Massive')
    {   
      requestType='Customer Specific';
      reqPriceCategory='Permanent';
    }
    else if(request.pricingRequest.Request_Type__c=='Import')
    {
      if(pricingRequestItemsList != null && pricingRequestItemsList.size()>0)
      {
        system.debug('pricingRequestItemsList[0].Key_Combination_Code__c is '+pricingRequestItemsList[0].Key_Combination_Code__c);
        system.debug('pricingRequestItemsList[0].SAP_Cluster__c is '+pricingRequestItemsList[0].SAP_Cluster__c);
        ERP_Key_Combination__c kc = [Select Customer_Specific__c FROM ERP_Key_Combination__c where Key_Combination_Code__c=:pricingRequestItemsList[0].Key_Combination_Code__c AND SAP_Cluster__c=:pricingRequestItemsList[0].SAP_Cluster__c];
        if(kc.Customer_Specific__c==true)
        {
          requestType='Customer Specific';
          reqPriceCategory='Permanent';
          system.debug('CSP approval setup');
        }
        else
        {
          requestType='Non Customer Specific';
          reqPriceCategory=request.pricingRequest.Pricing_Request_Type__c;
        }
      }

    }
    //<TJ20150210> Approval Routing For Mass Import
    else if(request.pricingRequest.Request_Type__c=='Mass Import')
    {
      requestType='Non Customer Specific';
      reqPriceCategory='Permanent';
    }

    System.debug('reqPriceCategory:'+reqPriceCategory);
    //System.debug('request.pricingRequest.Request_Class__c:'+request.pricingRequest.Request_Class__c);
    /*List<PA_BU_Admin_Master__c> adminMasterList = [SELECT id, BU__c, Country__c, Sales_Organisation__c, Price_Category__c, Distribution_Channel__c,
                                                       Division__c, Request_Type__c, Request_Class__c from PA_BU_Admin_Master__c WHERE BU__c = :request.pricingRequest.BU__c 
                                                       AND Sales_Organisation__c = :request.pricingRequest.Sales_Org_Code__c AND Price_Category__c = :reqPriceCategory
                                                       AND Distribution_Channel__c = :request.pricingRequest.Dist_Channel_Code__c AND Division__c = :request.pricingRequest.Division_Code__c
                                                       AND Request_Type__c = :requestType AND Pricing_Task_Type__c = :request.pricingRequest.Spot_Type__c
                                                   AND Request_Class__c = :request.pricingRequest.Request_Class__c];*/
    //<TJ20141222>
    String reqClass;
    if(request.pricingRequest.Request_Class__c==null)
      reqClass=null;
    else
      reqClass=request.pricingRequest.Request_Class__c;
    //<IM20150123>
    List<PA_BU_Admin_Master__c> adminMasterList = new List<PA_BU_Admin_Master__c>();
    //List<PA_BU_Admin_Master__c> adminMasterListRPQ = new List<PA_BU_Admin_Master__c>();
    //<IM20150121>
    if(isEndUserRebate!=null && isEndUserRebate)
      adminMasterList = (List<PA_BU_Admin_Master__c>)PAQueryUtil.query('PAApprovalWF', 'adminMasterListRPQ', 'BU__c = \''+request.pricingRequest.BU__c+'\' AND Sales_Organisation__c = \''+request.pricingRequest.Sales_Org_Code__c+'\' AND Price_Category__c = \''+reqPriceCategory+'\' AND Distribution_Channel__c = \''+request.pricingRequest.Dist_Channel_Code__c+'\' AND Division__c = \''+request.pricingRequest.Division_Code__c+'\' AND Request_Type__c = \''+requestType+'\' AND Pricing_Task_Type__c = \''+(request.pricingRequest.Spot_Type__c!=null?request.pricingRequest.Spot_Type__c:'')+'\' AND Request_Class__c = \''+(reqClass!=null?reqClass:'')+'\''+' AND Is_End_User_Rebate__c=true AND End_User_Rebate_Routing__c = \''+RPQRouting+'\'');
    else
      adminMasterList = (List<PA_BU_Admin_Master__c>)PAQueryUtil.query('PAApprovalWF', 'adminMasterList', 'BU__c = \''+request.pricingRequest.BU__c+'\' AND Sales_Organisation__c = \''+request.pricingRequest.Sales_Org_Code__c+'\' AND Price_Category__c = \''+reqPriceCategory+'\' AND Distribution_Channel__c = \''+request.pricingRequest.Dist_Channel_Code__c+'\' AND Division__c = \''+request.pricingRequest.Division_Code__c+'\' AND Request_Type__c = \''+requestType+'\' AND Pricing_Task_Type__c = \''+(request.pricingRequest.Spot_Type__c!=null?request.pricingRequest.Spot_Type__c:'')+'\' AND Request_Class__c = \''+(reqClass!=null?reqClass:'')+'\'');                                                   
    PA_BU_Admin_Master__c adminMaster = new PA_BU_Admin_Master__c();
    system.debug('adminMasterList is '+adminMasterList);
    system.debug('request.pricingRequest.BU__c is '+request.pricingRequest.BU__c);
    system.debug('request.pricingRequest.Sales_Org_Code__c is '+request.pricingRequest.Sales_Org_Code__c);
    system.debug('reqPriceCategory is '+reqPriceCategory);
        System.debug('sent to BacupupWF:'+request.pricingRequest.Sent_to_Backup_Approver__c);
    system.debug('request.pricingRequest.Dist_Channel_Code__c is '+request.pricingRequest.Dist_Channel_Code__c);
    system.debug('request.pricingRequest.Division_Code__c is '+request.pricingRequest.Division_Code__c);
    system.debug('requestType is '+requestType);
    system.debug('request.pricingRequest.Spot_Type__c is '+request.pricingRequest.Spot_Type__c);
    system.debug('reqClass is '+reqClass);
    system.debug('RPQRouting is '+RPQRouting);
    for(PA_BU_Admin_Master__c am : adminMasterList){
      if(am.Country__c == request.pricingRequest.Country__c){
        adminMaster = am;
        break;
      }           
      else if(am.Country__c == NULL){
        adminMaster = am;
        continue;           
      }   
    } 
    //<PP20130722>
    /* adminMasterList = [SELECT id, Country__c from PA_BU_Admin_Master__c 
                           WHERE BU__c = :request.pricingRequest.BU__c 
                           AND Sales_Organisation__c = :request.pricingRequest.Sales_Org_Code__c AND Price_Category__c = :reqPriceCategory
                           AND Distribution_Channel__c = :request.pricingRequest.Dist_Channel_Code__c AND Division__c = :request.pricingRequest.Division_Code__c
                       AND Request_Type__c = :requestType AND Request_Class__c = :request.pricingRequest.Request_Class__c]; */
    System.debug('adminMaster.id:'+adminMaster.id);
    List<PA_BU_Admin_Detail__c> adminDetailList = [SELECT id, Key_Field__c, Approval_Level__c, Approver_Role__c, Routing_Parameter__c                       
                                                   FROM PA_BU_Admin_Detail__c WHERE PA_BU_Admin_Master__c = :adminMaster.id order by Approval_Level__c];
    /*List<Setup_Object__c> setupObjectList = [SELECT BU__c, Approver_Backup__c, All_Other_Values_Backup__c, Mixed_Values_Backup__c, Sales_Organisation__c, Distribution_Channel__c, Division__c, Approver_Role__c, 
                                                 Key_Field_Value__c,Key_Field_Id__c, Key_Field__c, Mixed_Values__c, All_Other_Values__c, Approver_Id__c,Approver_Id__r.name,Mixed_Values__r.name, All_Other_Values__r.name,
                                                 Approver_Backup__r.name,All_Other_Values_Backup__r.name, Mixed_Values_Backup__r.name, Approver_Name__c
                                                 FROM Setup_Object__c                             
                                                 WHERE BU__c = :request.pricingRequest.BU__c AND Sales_Organisation__c = :request.pricingRequest.Sales_Org_Code__c 
                                                 AND Distribution_Channel__c = :request.pricingRequest.Dist_Channel_Code__c 
                                             AND Division__c = :request.pricingRequest.Division_Code__c];*/                                                                                                                                                                                
    List<Setup_Object__c> setupObjectList = (List<Setup_Object__c>)PAQueryUtil.query('PAApprovalWF', 'setupObjectList', ' BU__c = \''+request.pricingRequest.BU__c+'\' AND Sales_Organisation__c = \''+request.pricingRequest.Sales_Org_Code__c+'\' AND Distribution_Channel__c = \''+request.pricingRequest.Dist_Channel_Code__c+'\' AND Division__c = \''+request.pricingRequest.Division_Code__c+'\'');
    //Start: <GT20140902>
    System.debug('NS setupObjectList:'+setupObjectList);
    List<Id> listApprovers = new List<Id>();
    Set<Id> setApproverIds = new Set<Id>();
    Map<id,id> mapApproverbackup = new map<Id,id>();
    // Start CRM-2021-04-0192
    boolean SAPClusterFlag = false;
    if(pricingRequestItemsList != null && pricingRequestItemsList.size()>0){ // If condition for null check
        if (pricingRequestItemsList[0].SAP_Cluster__c == System.Label.SourceClusterCheckP80 ){ // if condition for SAP Cluster Check
        SAPClusterFlag = true;
        }
    }// End CRM-2021-04-0192
    
    // Start CRM-2021-04-0192
    Map<id,id> mapApproverbackupsetbackAp = new map<Id,id>(); // Map assignment for -- CRM-2021-04-0192
    for(Setup_Object__c so : setupObjectList)
    {
        System.debug('NS so.Approver_Id__c:'+so.Approver_Id__c);
        System.debug('NS so.id:'+so.Id);
      setApproverIds.add(so.Approver_Id__c);
      setApproverIds.add(so.All_Other_Values__c);
      setApproverIds.add(so.Mixed_Values__c);
      mapApproverbackupsetbackAp.put(so.Approver_Id__c,so.Approver_Backup__c);  // value put in Map for backup approver -- CRM-2021-04-0192
      mapApproverbackupsetbackAp.put(so.Mixed_Values__c,so.Mixed_Values_Backup__c); // value put in Map for mixed backup approver -- CRM-2021-04-0192
      mapApproverbackupsetbackAp.put(so.All_Other_Values__c,so.All_Other_Values_Backup__c); // value put in Map for other backup approver -- CRM-2021-04-0192
    }
    listApprovers.addAll(setApproverIds);
    for(User u: [select id,delegatedApproverid from user where id in :listApprovers])
    {
      if ( mapApproverbackupsetbackAp !=null && mapApproverbackupsetbackAp.get(u.id) !=null && SAPClusterFlag ){ //If condition for Null check & SAP Cluster -- CRM-2021-04-0192
              mapApproverbackup.put(u.id,mapApproverbackupsetbackAp.get(u.id)); // value put to Map for backup approver -- CRM-2021-04-0192
      }else{
      mapApproverbackup.put(u.id,u.delegatedApproverid);
      }
     
    }// End CRM-2021-04-0192
    //End: <GT20140902>
    
    List<String> pItemSoldToList = new List<STring>();
    List<String> pItemMaterialCodeList = new List<STring>();
    List<String> pItemSalesOrgList = new List<String>();
    for(Pricing_Request_Item__c pItem : pricingRequestItemsList){
      pItemSoldToList.add(pItem.Sold_To_Code__c);
      pItemMaterialCodeList.add(pItem.Material_Code__c);
      pItemSalesOrgList.add(pItem.Sales_Org_Code__c);
      priIdSet.add(pItem.Id);
      priIdSyncMap.put(pItem.Id,true);
    }
    List<NPC_Request__c> npcSet = [SELECT Id,Pricing_request_Item__c FROM NPC_Request__c where Pricing_request_Item__c IN :priIdSet AND
                                   isSynchronous__c = false AND Status__c='Active'];

    if(npcSet != null)
    {
      for(NPC_Request__c np : npcSet)
      {
        priIdSyncMap.put(np.Pricing_request_Item__c,false);
      }

    }
    //<PS20130417> Ver 2.3 //3.3 -neeha added ERP_Product_Hierarchy_Level_1_Code__c ,ERP_Product_Hierarchy_Level_2_Code__c in the query -prod issue fix
    //Piyush <PG20191211> Start
      List<ERP_Customer__c> erpCustListForCountry = [SELECT Customer_Code__c,Country__c,Customer_Group_2__c,Customer_Group_2_Code__c,Customer_Group_4__c,Customer_Group_4_Code__c, RecordType.Name FROM ERP_Customer__c WHERE RecordType.Name = 'ERP Customer - Extended Data' AND Customer_Code__c IN :pItemSoldToList];
      //Piyush <PG20191211> End
      //<TJ20140429>
    // List<Material__c> MaterialListForPH = [SELECT ERP_Material_Group_3_Code__c, ERP_Material_Group_4_Code__c, ERP_Material_Code__c, ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Code__c, RecordType.Name FROM Material__c WHERE RecordType.Name = 'ERP Material - Extended Data' AND ERP_Material_Code__c IN :pItemMaterialCodeList AND ERP_Product_Hierarchy_Code__c <> NULL AND ERP_Sales_Org_Code__c IN :pItemSalesOrgList ];
    //<HL20140910> Changes done by Hema to MaterialListforPH
    List<Material__c> MaterialListForPH = [SELECT ERP_Material_Group_3_Code__c, ERP_Material_Group_4_Code__c, ERP_Material_Code__c, 
                                           ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2_Code__c,
                                           ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                           ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,
                                           ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8_Code__c,
                                           ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,
                                           ERP_Product_Hierarchy_Code__c, RecordType.Name FROM Material__c WHERE RecordType.Name = 'ERP Material - Extended Data' AND ERP_Material_Code__c IN :pItemMaterialCodeList AND ERP_Product_Hierarchy_Code__c <> NULL AND ERP_Sales_Org_Code__c IN :pItemSalesOrgList ];
    system.debug('MaterialListForPH is '+MaterialListForPH);
    system.debug('pItemMaterialCodeList is '+pItemMaterialCodeList);
    system.debug('pItemSalesOrgList is '+pItemSalesOrgList);
    List<Material__c> MaterialListForEndUse = [SELECT ERP_Material_Group_3_Code__c, ERP_Material_Group_4_Code__c, ERP_Material_Code__c, ERP_Product_Hierarchy_Level_2__c, RecordType.Name FROM Material__c WHERE RecordType.Name = 'ERP Material - Extended Data' AND ERP_Material_Code__c IN :pItemMaterialCodeList AND ERP_Material_Group_3_Code__c <> NULL AND ERP_Sales_Org_Code__c IN :pItemSalesOrgList ];
    List<Material__c> MaterialListForMarketSegment = [SELECT ERP_Material_Group_3_Code__c, ERP_Material_Group_4_Code__c, ERP_Material_Code__c, ERP_Product_Hierarchy_Level_2__c, RecordType.Name FROM Material__c WHERE RecordType.Name = 'ERP Material - Extended Data' AND ERP_Material_Code__c IN :pItemMaterialCodeList AND ERP_Material_Group_4_Code__c <> NULL AND ERP_Sales_Org_Code__c IN :pItemSalesOrgList ];
    List<Material__c> MaterialListForFRB = [SELECT ERP_Material_Code__c, ERP_Profit_Center_4_Code__c, ERP_Profit_Center_5_Code__c, ERP_Profit_Center_6_Code__c, ERP_Profit_Center_7_Code__c, ERP_Profit_Center_8_Code__c, ERP_Profit_Center_9_Code__c, ERP_Profit_Center_10_Code__c, RecordType.Name FROM Material__c WHERE RecordType.Name = 'ERP Material - Extended Data' AND ERP_Material_Code__c IN :pItemMaterialCodeList AND ERP_Profit_Center_Code__c <> NULL AND ERP_Sales_Org_Code__c IN :pItemSalesOrgList];
    List<Material__c> MaterialListForDivision = [SELECT ERP_Material_Group_3_Code__c, ERP_Material_Group_4_Code__c, ERP_Material_Code__c, ERP_Division__c,ERP_Division_Code__c, RecordType.Name FROM Material__c WHERE RecordType.Name = 'ERP Material - Extended Data' AND ERP_Material_Code__c IN :pItemMaterialCodeList AND ERP_Division_Code__c <> NULL AND ERP_Sales_Org_Code__c IN :pItemSalesOrgList ];
    //<PP>
    Map<String,String> phtoRepMatMap = new Map<String,String>();
    phtoRepMatMap = PAUtil.checkForSynchronousPH(pricingRequestItemsList);
    //<TJ20140429> 
    List<OrgGroup__c> phLevel=new list<OrgGroup__c>();
    //phLevel = queries();
    //List<String> FRBCodes=new List<String>();
    //FRBCodes=FRBCode(phLevel);
    //<PP20140705>
    Set<String> pcKCExpSet = new Set<String>();
    //<IM20150123> TO add check for sales red amount


    setSalesRed.add(String.valueOf(roundedtotalSR));
    // added by Sumita Dabas 27 Oct 2015, Issue 58402 start
    List<PR_Item__c> quantityBasedRouting = PR_Item__c.getall().values();
    List<Business_Unit__c> ListOfBUs = Business_Unit__c.getall().values();
    //List<String> BUList = Business_Unit__c.getValues('BU List1').BUList__c.split(',');
    BUList = Business_Unit__c.getValues('BU List1').BUList__c.split(',');
    // added by Sumita Dabas 27 Oct 2015, Issue 58402 end
    for(Pricing_Request_Item__c pItem : pricingRequestItemsList){
      //<PP20140929>
      if(pItem.Expire__c)
        pcKCExpSet.add(pItem.PCKC__c + '-' + pItem.BU__c + '-' + pItem.Pricing_Request_Type__c);
      boolean materialContainsFlag = false;
      //Checking the Flags in the Pricing Request Items.
      if(pItem.Below_Floor_Flag__c || pItem.Materials_Below_Net_Floor__c > 0)
        routingParameter.add('Below Floor Price');
      if(pItem.Below_Current_Flag__c || pItem.Materials_Below_Net_Current__c > 0)
        routingParameter.add('Below Current Price');
      if(pItem.Below_Reference_Flag__c || pItem.Materials_Below_Net_Reference__c > 0)
        routingParameter.add('Below Reference Price');
         // Added by Madhurima <IS ID-00067728> - Start
         // <SH26102022>Commented for IS SC-00105089 - Start
      /*if (request.pricingRequest.BU__c =='BI AP Surfaces' && string.isBlank(pItem.Net_Price_Status__c) 
            && request.pricingRequest.Pricing_Request_Type__c=='Project Pricing')
              routingParameter.add('Below Floor Price'); */
        // <SH26102022>Commented for IS SC-00105089 - End
        // Added by Madhurima <IS ID-00067728> - End
      // added by Sumita Dabas 27 Oct 2015, Issue 58402 start
        //system.debug('****pItem.Pricing_Request__r.Spot_Type__c****' + pItem.Pricing_Request__r.Spot_Type__c);
        //system.debug('****pItem.pItem.BU__c****' + pItem.BU__c);

        if(pItem.Pricing_Request__r.Spot_Type__c == 'Free of Charge' && BUList[0].contains(pItem.BU__c)) 
        {
            if(quantityBasedRouting != null && quantityBasedRouting.size() > 0)
            {
                if(Integer.valueof(pItem.Quantity__c) != null && pItem.Quantity__c != '')
                {
                    if(Integer.valueof(pItem.Quantity__c) > PR_Item__c.getInstance('Below 50').Minimum_Value__c && Integer.valueof(pItem.Quantity__c) < PR_Item__c.getInstance('Below 50').Maximum_Value__c )
                        routingParameter.add(PR_Item__c.getInstance('Below 50').Routing_Parameter__c);
                        
                    if(Integer.valueof(pItem.Quantity__c) > PR_Item__c.getInstance('Between 51 and 500').Minimum_Value__c && Integer.valueof(pItem.Quantity__c) < PR_Item__c.getInstance('Between 51 and 500').Maximum_Value__c )
                        routingParameter.add(PR_Item__c.getInstance('Between 51 and 500').Routing_Parameter__c);
                            
                    if(Integer.valueof(pItem.Quantity__c) > PR_Item__c.getInstance('Above 500').Minimum_Value__c && Integer.valueof(pItem.Quantity__c) < PR_Item__c.getInstance('Above 500').Maximum_Value__c )
                        routingParameter.add(PR_Item__c.getInstance('Above 500').Routing_Parameter__c);
                }
            }
        }
        system.debug(logginglevel.error, '++++routingParameter+++++'+routingParameter);
        // added by Sumita Dabas 27 Oct 2015, Issue 58402 end   
      system.debug(logginglevel.error, 'MsgTxt1++++routingParameter+++++'+routingParameter);
      //Retrieving all the key field values from PR Item.     
      setCountry.add(pItem.Country__c);
      //For Massive nad import when the country is not present in PR ITem, it has to be brought from ERP Customer Object for corresponding Sold to code.
      if(request.pricingRequest.Request_Type__c == 'Massive'||request.pricingRequest.Request_Type__c == 'Import'){
        setCountry.clear();
        boolean countryinERPCustFlag = false;
        if(pItem.Country__c <> NULL){
          setCountry.add(pItem.Country__c);
        }
        else {
          for(ERP_Customer__c erpCust : erpCustListForCountry){
            setCountry.add(erpCust.Country__c);
            countryinERPCustFlag = true;
          }
        }
        if(!countryinERPCustFlag){
          setCountry.add(pItem.Country__c);
        }
      }
      setSalesOff.add(pItem.Sales_Office_Code__c);
      setSalesDis.add(pItem.Sales_District_Code__c);
      setSalesOrg.add(pItem.Sales_Org_Code__c);
      setReasonCode.add(pItem.Pricing_Request__r.Request_Reason__c.substring(0,4));
      setCampaign.add(pItem.Campaign_Code__c);
      setDocumentCurrency.add(pItem.Document_Currency_Code__c);
      setState.add(pItem.State_Code__c);
      //When the PH2 is not present in PItem and th eKey combination contains Materail or ph2 then get the ph2 value from Material Master
      /*if(pItem.PH2_Code__c <> NULL){
        setPH.add(pItem.PH1_Code__c+pItem.PH2_Code__c);  //3.3 added PH1_Code__c + PH2_Code__c
      }
      else if(pItem.Key_Combination__c.contains('Material') || pItem.Key_Combination__c.contains('PH2')){
        for(Material__c mat : materialListForPH){
          if(mat.ERP_Material_Code__c == pItem.Material_Code__c && mat.ERP_Product_Hierarchy_Level_2_Code__c <> NULL){
            setPH.add(mat.ERP_Product_Hierarchy_Level_1_Code__c+mat.ERP_Product_Hierarchy_Level_2_Code__c); // 3.3 added ERP_Product_Hierarchy_Level_1__c in the set - to check for proper routing when key field is PH2
            materialContainsFlag = true;
          }
        }
      }
      else{
        setPH.add(pItem.PH1_Code__c+pItem.PH2_Code__c);  //3.3 added PH1_Code__c
      }
      if(!materialContainsFlag){
        setPH.add(pItem.PH1_Code__c+pItem.PH2_Code__c); //3.3 added PH1_Code__c*/
      /*
        //<HL20140910> Changes Start by Hema 
        Map<Integer, String> mapPHList = new Map<Integer, String>();
        mapPHcodeList = new Map<Integer, String>();
        Map<Integer, String> FRBLevel = new Map<Integer,String>();

        mapPHcodeList.put(1,pItem.PH1_Code__c);
        mapPHcodeList.put(2,pItem.PH2_Code__c);
        mapPHcodeList.put(3,pItem.PH3_Code__c);
        mapPHcodeList.put(4,pItem.PH4_Code__c);
        mapPHcodeList.put(5,pItem.PH5_Code__c);
        mapPHcodeList.put(6,pItem.PH6_Code__c);
        mapPHcodeList.put(7,pItem.PH7_Code__c);
        mapPHcodeList.put(8,pItem.PH8_Code__c);
        mapPHcodeList.put(9,pItem.PH9_Code__c);


        if (pItem.Key_Combination__c.contains('Material'))
          {
            for(Material__c mat : materialListForPH){

              if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                string str2 = '';
                for (integer k =1; k<= 9; k++)
                {
                    if (mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c') <> NULL)
                    {                         
                          str2 = str2+mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c');
                         materialContainsFlag = true;
                    }                   
                }
                 setPH.add(str2);

            }
           }
          }
         else if(pItem.Key_Combination__c.contains('PH')) 
         {
                 string str1 = '';
                 for(integer i =1; i<=9; i++)
                   {         
                      if(mapPHcodeList.get(i)<> NULL)
                       {
                        str1 = str1+mapPHcodeList.get(i);
                         materialContainsFlag = true;
                       }
                   }
                 setPH.add(str1);
               }

         else
          {
            string str1 = '';
                 for(integer i =1; i<=9; i++)
                   {         
                      if(mapPHcodeList.get(i)<> NULL)
                       {
                        str1 = str1+mapPHcodeList.get(i);

                       }
                   }
                 setPH.add(str1);
            }
       */

      /*   if (pItem.Key_Combination__c.contains('Material'))
          {
            for(Material__c mat : MaterialListForFRB){

              if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                string str2 = '';
                for (integer k =4; k<= 10; k++)
                {
                    //for(PA_BU_Admin_Detail__c adt : adminDetailList)
                    //{
                        //if(adt.Key_Field__c.substring(3,4) == k.format())
                    if (mat.get('ERP_Profit_Center_'+k+'_Code__c') <> NULL)
                    {                         
                        // setFRB.add((String)mat.get('ERP_Profit_Center_'+k+'_Code__c'));
                        // FRBLevel.put(k,setFRB);

                        FRBLevel.put(k,(String)mat.get('ERP_Profit_Center_'+k+'_Code__c'));

                         materialContainsFlag = true;
                    }
                    else
                        break; 
                    //}                     
                }


            }
           }
            }*/

      //<HL20140909> Changes End by Hema

      //<TJ20140429> START Storing product hierarchy code of the selected level for Product Hierarchy Key Field
      //Querying for PH Level from Business

      /* Integer phCode;
            system.debug('PPPPPPPPPPP'+phLevel[0].Product_Hierarchy_Level__c+'SSSSS'+phLevel.size());
            if(phLevel.size() > 0 && phLevel[0].Product_Hierarchy_Level__c != null)
            {
                phCode = Integer.valueOf(phLevel[0].Product_Hierarchy_Level__c)*2;
            }

            String ph;
            if(phCode != null)
            {
                //If KC contains PH
                if(pItem.F_Product_Hierarchy_Code__c != NULL)
                {
                    system.debug('F_Product_Hierarchy_Code__c'+pItem.F_Product_Hierarchy_Code__c+'phcodephcode'+phcode);
                    if(pItem.F_Product_Hierarchy_Code__c.length() > phcode)
                    {   
                        ph = pItem.F_Product_Hierarchy_Code__c.substring(0,phCode);
                        setPH.add(ph);
                    }
                    else if(pItem.F_Product_Hierarchy_Code__c.length() <= phcode)
                    {
                        setPH.add(pItem.F_Product_Hierarchy_Code__c);
                    }
                }
                //If KC contains Material, fetch PH from the material
                else if(pItem.Key_Combination__c.contains('Material'))
                {
                    for(Material__c mat : materialListForPH)
                    {
                        if(mat.ERP_Material_Code__c == pItem.Material_Code__c)
                        {
                            if(mat.ERP_Product_Hierarchy_Code__c.length() > phcode)
                            {
                                ph=mat.ERP_Product_Hierarchy_Code__c.substring(0,phCode);
                                setPH.add(ph);
                            }
                            else if(mat.ERP_Product_Hierarchy_Code__c.length() <= phcode)
                            {
                                setPH.add(mat.ERP_Product_Hierarchy_Code__c);       
                            }

                            materialContainsFlag = true;
                        }
                    }
                }
                else
                {
                    setPH.add(pItem.F_Product_Hierarchy_Code__c);
                }
                //<PP20140923> - Fix for IS ID-00046925
                if(!materialContainsFlag && pItem.F_Product_Hierarchy_Code__c <> NULL)
                {
                    if(pItem.F_Product_Hierarchy_Code__c.length() > phcode)
                    {   
                        ph = pItem.F_Product_Hierarchy_Code__c.substring(0,phCode);
                        setPH.add(ph);
                    }
                    else if(pItem.F_Product_Hierarchy_Code__c.length() <= phcode)
                    {
                        setPH.add(pItem.F_Product_Hierarchy_Code__c);
                    }
                }
            }

            setFRBCodes.addall(setFRB(pItem,FRBCodes,phLevel,MaterialListForFRB));

            //<TJ20140429> END*/

      //When the division code is empty for PITem, then get the code from Material object.
      //<HL20140926> Added code for division as key field.
      if(pItem.Division_Code__c <> NULL){
        setDivision.add(pItem.Division_Code__c);
      }
      else if(pItem.Key_Combination__c.contains('Material')){
        for(Material__c mat : MaterialListForDivision){
          if(mat.ERP_Material_Code__c == pItem.Material_Code__c && mat.ERP_Division_Code__c <> NULL){
            setDivision.add(mat.ERP_Division_Code__c);
            materialContainsFlag = true;
          }
        }
      }
      else{
        setDivision.add(pItem.Division_Code__c);
      }
      if(!materialContainsFlag){
        setDivision.add(pItem.Division_Code__c);
      }
      //<HL20140926> End -- Added code for division as key field.
      //When the Market segment code and End use code is empty for PITem, then get the code from Material object.
      if(pItem.End_Use_Code__c <> NULL){
        system.debug(logginglevel.error,'In If of End use');
        setEndUse.add(pItem.End_Use_Code__c);
      }
      else if(pItem.Key_Combination__c.contains('Material')){
        for(Material__c mat : MaterialListForEndUse){
          if(mat.ERP_Material_Code__c == pItem.Material_Code__c && mat.ERP_Material_Group_3_Code__c <> NULL){
            system.debug(logginglevel.error,'In elseIf of End use'+mat.Id);
            setEndUse.add(mat.ERP_Material_Group_3_Code__c);
            materialContainsFlag = true;
          }
        }
      }
      else{
        system.debug(logginglevel.error,'In else of End use');
        setEndUse.add(pItem.End_Use_Code__c);
      }
      if(!materialContainsFlag){
        system.debug(logginglevel.error,'In last if of End use');
        setEndUse.add(pItem.End_Use_Code__c);
      }
      system.debug(logginglevel.error,'SetEndUse final values'+setEndUse);
      //When the Market segment code and End use code is empty for PITem, then get the code from Material object.
      if(pItem.Market_Segment_Code__c <> NULL){
        setMarketSegment.add(pItem.Market_Segment_Code__c);
      }
      else if(pItem.Key_Combination__c.contains('Material')){
        for(Material__c mat : MaterialListForMarketSegment){
          if(mat.ERP_Material_Code__c == pItem.Material_Code__c && mat.ERP_Material_Group_4_Code__c <> NULL){
            setMarketSegment.add(mat.ERP_Material_Group_4_Code__c);
            materialContainsFlag = true;
          }
        }
      }
      else{
        setMarketSegment.add(pItem.Market_Segment_Code__c);
      }
      if(!materialContainsFlag){
        setMarketSegment.add(pItem.Market_Segment_Code__c);
      }
      //AsyncCallIndicatorCount should be incremented, if it is async and its npc status is watiting for net price
      //<VR20130930> DTT Rollout
      system.debug('***pItem.Key_Combination__c'+pItem.Key_Combination__c+'AsyncCallIndicatorCount'+AsyncCallIndicatorCount+'****'+priIdSyncMap.get(pItem.Id)+pItem.Net_Price_Status__c);
      //<PP20140108>           
      //if(((!pItem.Key_Combination__c.contains('Material') && !pItem.Key_Combination__c.contains('PH')) || pItem.Key_Combination__c.contains('Material Price Group')) ||(pItem.Key_Combination__c.contains('PH') && String.isBlank(phtoRepMatMap.get(pItem.F_Product_Hierarchy_Code__c))) || (!priIdSyncMap.get(pItem.Id)) &&  (pItem.Net_Price_Status__c=='Waiting for Net Price'||pItem.Net_Price_Status__c=='Error'||request.pricingRequest.NPC_Status__c == 'Net Price Received')) {
      //system.debug(logginglevel.error, 'AsyncCallIndicatorCount in if'+AsyncCallIndicatorCount+'kc'+pItem.Key_Combination__c+'Id'+pItem.Id+' '+((pItem.Key_Combination__c.contains('PH') && String.isBlank(phtoRepMatMap.get(pItem.F_Product_Hierarchy_Code__c))) &&  (pItem.Net_Price_Status__c=='Waiting for Net Price'||pItem.Net_Price_Status__c=='Error'||request.pricingRequest.NPC_Status__c == 'Net Price Received')));
      //AsyncCallIndicatorCount = AsyncCallIndicatorCount+1;
      //}
      if(!priIdSyncMap.get(pItem.Id) &&  (pItem.Net_Price_Status__c=='Waiting for Net Price'||pItem.Net_Price_Status__c=='Error'||request.pricingRequest.NPC_Status__c == 'Net Price Received')) {
        //system.debug(logginglevel.error, 'AsyncCallIndicatorCount in if'+AsyncCallIndicatorCount+'kc'+pItem.Key_Combination__c+'Id'+pItem.Id+' '+((pItem.Key_Combination__c.contains('PH') && String.isBlank(phtoRepMatMap.get(pItem.F_Product_Hierarchy_Code__c))) &&  (pItem.Net_Price_Status__c=='Waiting for Net Price'||pItem.Net_Price_Status__c=='Error'||request.pricingRequest.NPC_Status__c == 'Net Price Received')));
        AsyncCallIndicatorCount = AsyncCallIndicatorCount+1;
      }
      if(pItem.Net_Price_Status__c == 'Waiting for Net Price'){
        itemPendingFlag = true;
      }
      // system.debug(logginglevel.error,'***Set Market and End use'+setMarketSegment+setEndUse+'AsyncCallIndicatorCount'+AsyncCallIndicatorCount+'PAUtil.checkForSynchronousPH(pItem)'+PAUtil.checkForSynchronousPH(pItem));
    }
    //<PP20140705>
    boolean removeExpRecords = checkForExpiryReqItems(pcKCExpSet);
    //<PS20130417> Ver 2.3 PS 2013-04-17 APAC Rollout-for Pricing Task (Rebate agreement), fetch the customer group2 from erp customer of request
    for(ERP_Customer__c erpCust : erpCustListForCountry){
      setCustomerGroup2.add(erpCust.Customer_Group_2_Code__c); 
    }

    if(erpCustListForCountry.size() == 0 && request.customer.paERPCustomer.Customer_Group_2_Code__c <> NULL){
      setCustomerGroup2.add(request.customer.paERPCustomer.Customer_Group_2_Code__c);
    }
    //ending Customer_Group_2 code
    
    //Piyush <PG20191211> Start
    //fetch the customer group4 from erp customer of request
    for(ERP_Customer__c erpCust : erpCustListForCountry){
        if(erpCust.Customer_Group_4_Code__c!= null){       
        setCustomerGroup4.add(erpCust.Customer_Group_4_Code__c); 
        }
    }

    if(erpCustListForCountry.size() == 0 && request.customer.paERPCustomer.Customer_Group_4_Code__c != NULL){    
      setCustomerGroup4.add(request.customer.paERPCustomer.Customer_Group_4_Code__c);
    }
    //Piyush <PG20191211> End
    
    if(desiredAction.equalsIgnoreCase('submitCalculation')) {
      //<MG20161221> - Start
      SubmitCalculationStatus = request.pricingRequest.f_NPC_Callout_Status__c ;
      system.debug('Submit calculation mansi '+SubmitCalculationStatus);
      flagstatus=false;
      system.debug('flagstatus in submitCalculation method  '+flagstatus);
       //<MG20161221> - End
      system.debug('calling cost calculation');
      if(isEndUserRebate!=null && isEndUserRebate)
        PAUtil.calculateCost(pricingRequestItemsList);
      String oldLevel = request.pricingRequest.Current_Level__c;
      if(removeExpRecords)
      {
        errormessageFlag = PAUtil.apexErrorMsg('Please remove the expiry records, as they are already in process for pricing');  
      }
      

      //To check the current status of the request is changed or not for odifferent Browser. Query method cannot be used as for Pricing Task.
      Pricing_Request__c pr = [SELECT current_Level__c,Request_Approval_Status__c FROM Pricing_Request__c WHERE Id = :request.pricingRequest.Id];

      if(oldLevel == pr.Current_Level__c){
        //This method will calculate the users for different levels
        boolean notgenAppFlag;   
        boolean setupObjAvailableFlag=false;

        //For Async Call out by default assume all the flag true.
        if(AsyncCallIndicatorCount > 0 && request.pricingRequest.Pricing_Request_Type__c <> 'Pricing Task' && request.pricingRequest.NPC_Status__c <> 'Net Price Received'){
          routingParameter.clear();
          routingParameter.add('Below Floor Price');
          routingParameter.add('Below Reference Price');
          routingParameter.add('Below Current Price');
        }
        // added by sumita dabas 28 oct 2015 Issue 58402 start
        if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && request.pricingRequest.Spot_Type__c == 'Free of Charge' && BUList[0].contains(request.pricingRequest.BU__c)){
            routingParameter.clear();
            routingParameter.add('Below 50');
            routingParameter.add('> or = 51kg AND < or = 500kg');
            routingParameter.add('>500kg');
        }
        system.debug('%%%%routingParameter%%%% '+routingParameter);     
        String PRTotalQuantity = '';
        String maxQuantityValue = '';
        List<String> maxQuantityList = new List<String>();
        for(Pricing_Request_Item__c pItem : pricingRequestItemsList)
        {
            if(pItem.Quantity__c != null && pItem.Quantity__c != '')
            {
                PRTotalQuantity = PRTotalQuantity + pItem.Quantity__c+'/';
                maxQuantityList.add(pItem.Quantity__c);
            }
        }
        system.debug('***PRTotalQuantity***' + PRTotalQuantity);
        if(maxQuantityList != null && maxQuantityList.size() > 0)
        {
            maxQuantityList.sort(); 
            Integer maxQuantity = 0;
            for(String quantity : maxQuantityList)
            {
                maxQuantity = maxQuantity + Integer.valueof(quantity);
            }
            maxQuantityValue = String.valueof(maxQuantity);
        }
        system.debug('***maxQuantityValue ***' + maxQuantityValue );
        // added by sumita Dabas 28 Oct 2015 Issue 58402 end 
        //Validations for the Valid to and valid from date of Pricing Task record(Rebate Agreement) on Submit Calculation -- added by Prachi on 5th feb
        if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && request.pricingRequest.Spot_Type__c == 'Rebate Agreement')
        {                 
          if(request.pricingRequest.Request_Valid_From__c == NULL)
          {
            errormessageFlag = PAUtil.apexErrorMsg(System.Label.Valid_From_Mandatory_Error);  
          }
          if(request.pricingRequest.Request_Valid_To__c == NULL)
          {
            errormessageFlag = PAUtil.apexErrorMsg(System.Label.Valid_To_Mandatory_Error);  
          }
          if(request.pricingRequest.Request_Valid_To__c < request.pricingRequest.Request_Valid_From__c)
          {
            errormessageFlag = PAUtil.apexErrorMsg(System.Label.Valid_To_Less_Error);  
          }
          if(request.pricingRequest.Request_Valid_To__c < system.today())
          {
            errormessageFlag = PAUtil.apexErrorMsg(System.Label.Valid_To_Invalid_Error);  
          }
          //<VR20130829> RollOut2 Issue fix
          update request.pricingRequest;
        }
        //<!-- DW20150106 skip this for Pricing Task "Other Pricing Task"-->
         //<AJ20160325> <IS ID-00067148> Added condiiton to skip "No request item added" error on Submit for "Rebate payout" and "Rebate adjustment"
         //<SS20230501> Added condition to skip "No request item added" error on Submit for "Rebate Payout Product Shipment"
          if((request.pricingRequest.Spot_Type__c <> 'Rebate adjustment' && request.pricingRequest.Spot_Type__c <> 'Rebate payout' && request.pricingRequest.Spot_Type__c <> 'Rebate Agreement' && request.pricingRequest.Spot_Type__c <> 'Rebate Payout Product Shipment' && request.pricingRequest.Spot_Type__c <> 'Other Pricing Task') && !request.pricingRequest.Project_Header_Approval_Flag__c && pricingRequestItemsList.size() == 0){
          if(request.pricingRequest.Request_Type__c !='Mass Import')
            errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Request_Items_On_Submit_Error);  
          else
          {
            if([select count() from attachment where ParentId =: request.pricingRequest.Id]==0)
            {
              paUtil.apexErrorMsg('Please attach Import file');
            }
          }     
        }             
        if(!errorMessageFlag || request.pricingRequest.NPC_Status__c == 'Waiting for Net Price'){
          for(Integer i=0; i<pricingRequestItemsList.size(); i++){
            //For defect 302 changed the condition && 357
            //<PP20140604>
            if((request.pricingRequest.Request_Type__c<>'Import' && request.pricingRequest.Pricing_Request_Type__c <> 'Project Pricing'
            && request.pricingRequest.Pricing_Request_Type__c <> 'Pricing Task') && ((String.isBlank(pricingRequestItemsList[i].New_Rate__c)
                || String.isBlank(pricingRequestItemsList[i].New_Unit__c)
                || (pricingRequestItemsList[i].Calculation_Type__c == 'Quantity' && pricingRequestItemsList[i].New_Per__c == NULL)
                || (pricingRequestItemsList[i].Calculation_Type__c == 'Quantity' && String.isBlank(pricingRequestItemsList[i].New_UoM__c))
                || pricingRequestItemsList[i].New_Valid_From__c == NULL || pricingRequestItemsList[i].New_Valid_To__c == NULL)
                || (!pricingRequestItemsList[i].Expire__c && pricingRequestItemsList[i].isVolumeApplicable__c && pricingRequestItemsList[i].New_Volume__c == NULL
                && String.isBlank(pricingRequestItemsList[i].New_Volume_UoM__c))
                || (!pricingRequestItemsList[i].Expire__c && pricingRequestItemsList[i].isNPCApplicable__c && String.isBlank(pricingRequestItemsList[i].Net_Price_Status__c)&&request.pricingRequest.Request_Type__c<>'Massive'))){
              system.debug('@@##details:new rate:'+pricingRequestItemsList[i].New_Rate__c+',new unit:'+pricingRequestItemsList[i].New_Unit__c+',calculation type:'+pricingRequestItemsList[i].Calculation_Type__c+',new per:'+pricingRequestItemsList[i].New_Per__c+',new uom:'+pricingRequestItemsList[i].New_UoM__c+',new valid from and to:'+pricingRequestItemsList[i].New_Valid_From__c+','+pricingRequestItemsList[i].New_Valid_To__c+',volume:'+pricingRequestItemsList[i].isVolumeApplicable__c+',npc:'+pricingRequestItemsList[i].isNPCApplicable__c+',paymnttermsapp:'+pricingRequestItemsList[i].isPaymentTermsApplicable__c+',npcstatus:'+pricingRequestItemsList[i].Net_Price_Status__c);              
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
              break;
            }
             //<SH20221121> IS SC-00105725 Commented - Start
            //For defect 357 only for Pricing Task
           /* if(request.pricingRequest.Pricing_Request_Type__c=='Pricing Task' && (pricingRequestItemsList[i].Quantity__c == NULL)){
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
              break;
            }*/
             //<SH20221121> IS SC-00105725 Commented - End 
              // Start <SH20221121> IS SC-00105725 - Added condition to make NPC Mandatory for Spot Price Requests for all DPT Businesses
                        if(request.pricingRequest.Pricing_Request_Type__c=='Pricing Task'){
                            if(request.pricingRequest.BU__c.contains(System.Label.Pricing_Task_NPC_Mandate_Businesses) && request.pricingRequest.Spot_Type__c =='Spot Price' && pricingRequestItemsList[i].isNPCApplicable__c && String.isBlank(pricingRequestItemsList[i].Net_Price_Status__c)){
                            errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
                            break;
                        }
                            else if(pricingRequestItemsList[i].Quantity__c == NULL){
                               errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
                               break; 
                            }
                        }
             // End <SH20221121> IS SC-00105725
            //For defect 349 only for Project Pricing
            if(request.pricingRequest.Pricing_Request_Type__c=='Project Pricing' && (pricingRequestItemsList[i].New_Unit__c == NULL)){
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
              break;
            }
              // Added by Madhurima <IS ID-00067728> - Start
            if(request.pricingRequest.Pricing_Request_Type__c=='Project Pricing' && (pricingRequestItemsList[i].New_Rate__c == NULL)){
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
              break;
            }
              // Added by Madhurima <IS ID-00067728>  - End
              //<DR07092018> Making 'Run Net Price' Mandatory step for Project Pricing - START
      if(request.pricingRequest.Pricing_Request_Type__c=='Project Pricing' && (pricingRequestItemsList[i].isNPCApplicable__c && String.isBlank(pricingRequestItemsList[i].Net_Price_Status__c))){
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Unchanged_Request_Items_On_Submit_Error);  
              break;
            }   
        //<DR07092018> Making 'Run Net Price' Mandatory step for Project Pricing - END
            //Deleted the calculation for Overlapping records as it is handeled by priyanka and shiva in trigger          
            // <BB20140404> Added the Error msg for Error Indicator START      
            if(pricingRequestItemsList[i].Error_Indicator__c != null && (pricingRequestItemsList[i].Error_Indicator__c.containsIgnoreCase('ERROR')||pricingRequestItemsList[i].Error_Indicator__c.containsIgnoreCase('WARNING'))){
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_item_indicator_error);  
              break;
            }
          }
          if(!errorMessageFlag || request.pricingRequest.NPC_Status__c == 'Waiting for Net Price'){
            //<AV20150301>-Production issue-Manger not defined error while creating req from on behalf of
            String managerOfRequestor;
            String backupForRequestor;
            String managerNameOfRequestor;
            User managerOfRequestorr = [SELECT Name,ManagerId,DelegatedApproverId FROM User WHERE id = :request.Pricingrequest.ownerId];
            if(managerOfRequestorr.ManagerId != NULL){
              managerOfRequestor = managerOfRequestorr.ManagerId;                        
              User managerOfRequestorrName=[SELECT Name FROM User WHERE id = :managerOfRequestorr.ManagerId];
              managerNameOfRequestor = managerOfRequestorrName.Name;
            } 
         //<SS20230501> START- Restrict other users to update the material which are created by BU for the hidden PCKC   
           if(request.pricingRequest.Pricing_Request_Type__c=='Permanent' && request.pricingRequest.Request_Type__c !='Import' && ([SELECT ID From PermissionSetAssignment WHERE PermissionSet.Name ='PCKC_Viewer' AND AssigneeId = :UserInfo.getUserId()].size() == 0)) 
           {
           Set<String> PRIID = new Set<String>();
           Set<String> Setsalspp = new Set<String>();
           Set<String> setKCcode = new Set<String>();
           Set<String> PCcode = new Set<String>();
           Set<String> Keycomb = new Set<String>();
            for(Pricing_Request_Item__c pItem : pricingRequestItemsList)
            {
             PRIID.add(pItem.id);
            }
            List<Pricing_Request_Item__c> pstm = [select Id, ERP_Pricing_Procedure__c, Key_Combination_Code__c, Key_Combination__c, Pricing_Condition_Code__c  from Pricing_Request_Item__c where id =: PRIID];
            for( Pricing_Request_Item__c ps :  pstm)
            {
            Setsalspp.add(ps.ERP_Pricing_Procedure__c);
            PCcode.add(ps.Pricing_Condition_Code__c);
            setKCcode.add(ps.Key_Combination_Code__c);
            Keycomb.add(ps.Key_Combination__c);
            }
           List<ERP_Access_Sequence__c> EASlist = [ select Id, Sales_Pricing_Procedure__c, Pricing_Condition__r.Pricing_Condition_Code__c, Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c from ERP_Access_Sequence__c where Hide_for_Price_Requester__c = True ] ;
           for( ERP_Access_Sequence__c  es : EASlist)
           {
            if(Setsalspp.contains(es.Sales_Pricing_Procedure__c) && PCcode.contains(es.Pricing_Condition__r.Pricing_Condition_Code__c) && setKCcode.contains(es.Pricing_Key_Combination__r.Key_Combination_Code__c) && Keycomb.contains(es.Key_Combination__c))
            {
            errormessageFlag = PAUtil.apexErrorMsg(System.Label.Restrict_update_price);  //Your price request includes one of the prices associated with the discount or surcharge, please remove it, then submit the PR for approval
            break;   
            }
           }
         }  // <SS20230501> END 
            //if(managerOfRequestor != NULL) {
              //managerNameOfRequestor = [SELECT Name FROM User WHERE id = :managerOfRequestor].Name;
            //}
            //System.debug('managerOfRequestor'+managerOfRequestor+'******'+request.Pricingrequest.ownerId);
            // System.debug('*QUERY*****'+[SELECT ManagerId FROM User WHERE id = :request.Pricingrequest.ownerId]);
            if(managerOfRequestorr.DelegatedApproverId != NULL){
              backupForRequestor = managerOfRequestorr.DelegatedApproverId;
            }
            //if(!string.isBlank(managerOfRequestor)) {
            //    backupForRequestor = [SELECT DelegatedApproverId FROM User WHERE id = :managerOfRequestor].DelegatedApproverId;
            //}
            //Iterate through the map to fetch the levels            
            //<TJ20150105> Commenting to prevent loop from executing 5*5 times.           
            //for(Integer i=1; i<=5; i++){  
            //<HL20140910> Changes Start by Hema 
            setFRB = new Set<String>();
            setPH = new Set<String>();
            /*  for(Pricing_Request_Item__c pItem: pricingRequestItemsList){
                            Map<Integer, String> mapPHList = new Map<Integer, String>();
                            mapPHcodeList = new Map<Integer, String>();
                            Map<Integer, String> FRBLevel = new Map<Integer,String>();

                            mapPHcodeList.put(1,pItem.PH1_Code__c);
                            mapPHcodeList.put(2,pItem.PH2_Code__c);
                            mapPHcodeList.put(3,pItem.PH3_Code__c);
                            mapPHcodeList.put(4,pItem.PH4_Code__c);
                            mapPHcodeList.put(5,pItem.PH5_Code__c);
                            mapPHcodeList.put(6,pItem.PH6_Code__c);
                            mapPHcodeList.put(7,pItem.PH7_Code__c);
                            mapPHcodeList.put(8,pItem.PH8_Code__c);
                            mapPHcodeList.put(9,pItem.PH9_Code__c);

                            if (pItem.Key_Combination__c.contains('Material'))
                              {
                                for(Material__c mat : materialListForPH){

                                  if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                                    string str2 = '';
                                    for (integer k =1; k<= 9; k++)
                                    {
                                        if (mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c') <> NULL)
                                        {                         
                                              str2 = str2+mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c');
                                             //materialContainsFlag = true;
                                        }                   
                                    }
                                     setPH.add(str2);

                                }
                               }
                              }
                             else if(pItem.Key_Combination__c.contains('PH')) 
                             {
                                     string str1 = '';
                                     for(integer j =1; j<=9; j++)
                                       {         
                                          if(mapPHcodeList.get(j)<> NULL)
                                           {
                                            str1 = str1+mapPHcodeList.get(j);
                                             //materialContainsFlag = true;
                                           }
                                       }
                                     setPH.add(str1);
                                   }

                             else
                              {
                                string str1 = '';
                                     for(integer j =1; j<=9; j++)
                                       {         
                                          if(mapPHcodeList.get(j)<> NULL)
                                           {
                                            str1 = str1+mapPHcodeList.get(j);

                                           }
                                       }
                                     setPH.add(str1);
                                }

                            }*/
            System.debug('adminDetailList:'+adminDetailList);
            //<HL20140910> Changes End by Hema 
            Integer i=1;
            for(PA_BU_Admin_Detail__c ad : adminDetailList){
              
              system.debug('Current i:'+i);
              notgenAppFlag = false;
              boolean keyfieldfromPRflag = false;                  
              list<Id> listMultipleUser = new list<Id>();  
              list<id> listMultipleBackup = new list<Id>();               
              list<String> listAutoApproverUser=  new list<String>();   
              list<String> listAutoApproverBackup=  new list<String>();

              if(Integer.valueOf(ad.Approval_Level__c) == i){  
                //Skip level in case of Not Required.
                // updated by sumita dabas(1020452) Issue 58402, to show approval not required on pop up approver box 
                //if(ad.Routing_Parameter__c == 'Not Required'){
                if(ad.Routing_Parameter__c == 'Not Required' || ((BUList[0].contains(request.pricingRequest.BU__c) && request.pricingRequest.Spot_Type__c == 'Free of Charge') && ((Integer.valueOf(maxQuantityValue) <= PR_Item__c.getInstance('Below 50').Maximum_Value__c) || (Integer.valueOf(maxQuantityValue) >= PR_Item__c.getInstance('Between 51 and 500').Minimum_Value__c && Integer.valueOf(maxQuantityValue) <= PR_Item__c.getInstance('Between 51 and 500').Maximum_Value__c && i == 5)))){
                  listMultipleUser.add(NULL);
                  setLevelNR.add(String.valueOf(i));
                }                  
                  /*  //<NS20191023> START - Added logic to skip Approval if key field is Customer Group 4 and If PR has CG4 eligible to skip,as defined in Sales Area
                  //System.debug('request.pricingRequest.Customer_Group_4_Code__c:'+request.pricingRequest.Customer_Group_4_Code__c);
                  System.debug('request.pricingRequest.BU__c:'+request.pricingRequest.BU__c);            
                  Set<String> customerGroups = new Set<String>();
                  for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__r.Code__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Customer Group 4' AND Organizational_Group_Item__r.Business__r.Business__c = :request.pricingRequest.bu__c AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c])
                  {
                      customerGroups.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__r.Code__c);
                  } 
                  System.debug('NS TEST1 :'+customerGroups);
                 // System.debug('NS TEST2 :'+ customerGroups.contains(request.pricingRequest.Customer_Group_4_Code__c));            
                  if(ad.Key_Field__c == 'Customer Group 4' && customerGroups.contains(request.pricingRequest.Customer_Group_4_Code__c) && (String.isNotBlank(request.pricingRequest.Customer_Group_4_Code__c) || String.isNotEmpty(request.pricingRequest.Customer_Group_4_Code__c))){
                      listMultipleUser.add(NULL);
                      setLevelNR.add(String.valueOf(i));
                      System.debug('NS TEST3:'+request.pricingRequest.Customer_Group_4_Code__c);
                  }
                  //<NS20191023> END - Added logic to skip Approval if key field is Customer Group 4 and If PR has CG4 eligible to skip,as defined in Sales Area
                */
                // <PG20191211>Piyush Start - Added logic for Customer Group 4 Auto-Approval from OGI.           
                  Set<String> customergroupautoapproval = new Set<String>();
                  list<String> tempCG4auto =  new list<String>();
                  for(Organizational_Group_Item__c orgGrpERP : [SELECT Customer_Group_4_Auto_Approval__c, Business__r.Business__c  FROM Organizational_Group_Item__c WHERE Customer_Group_4_Auto_Approval__c != '' AND Business__r.Business__c = :request.pricingRequest.bu__c AND orgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c])
                  {
                      tempCG4auto.addall(orgGrpERP.Customer_Group_4_Auto_Approval__c.split(';'));
                      for(String temp: tempCG4auto )
                      {
                          list<String> temp1 = new list<String>();
                          temp1.addall(orgGrpERP.Customer_Group_4_Auto_Approval__c.split('-'));
                          customergroupautoapproval.add(temp1[0]);
                      }
                      tempCG4auto.clear();
                  } 
                  if(ad.Key_Field__c == 'Customer Group 4' && customergroupautoapproval.contains(request.pricingRequest.Customer_Group_4_Code__c) && (String.isNotBlank(request.pricingRequest.Customer_Group_4_Code__c) || String.isNotEmpty(request.pricingRequest.Customer_Group_4_Code__c))){
                      listMultipleUser.add(NULL);
                      setLevelNR.add(String.valueOf(i));
                  }
                // <PG20191211> Piyush End
                  //<BB20140321> Modified if statement to get auto approve Approvers 
                // else if conditions updated by Sumita Dabas 28 oct 2015 Issue 58402, added new routing parameters check in if 
                //else if(ad.Routing_Parameter__c == 'Below Floor Price'||ad.Routing_Parameter__c == 'Below Reference Price'||ad.Routing_Parameter__c == 'Below Current Price' || ad.Routing_Parameter__c == 'Required'){
                else if((ad.Routing_Parameter__c == '> or = 51kg AND < or = 500kg' && (Integer.valueOf(maxQuantityValue) >= PR_Item__c.getInstance('Between 51 and 500').Minimum_Value__c && Integer.valueOf(maxQuantityValue) <= PR_Item__c.getInstance('Between 51 and 500').Maximum_Value__c)) ||  ((ad.Routing_Parameter__c == '> or = 51kg AND < or = 500kg' || ad.Routing_Parameter__c == '>500kg') && Integer.valueOf(maxQuantityValue)>= PR_Item__c.getInstance('Above 500').Minimum_Value__c) ||ad.Routing_Parameter__c == 'Below Floor Price'||ad.Routing_Parameter__c == 'Below Reference Price'||ad.Routing_Parameter__c == 'Below Current Price' || ad.Routing_Parameter__c == 'Required'){
                    for(Setup_Object__c so : setupObjectList){
                        //<PR20140901>
                        system.debug(ad.Key_Field__c + so.Key_Field__c+ad.Approver_Role__c+so.Approver_Role__c);
                        if(ad.Key_Field__c == so.Key_Field__c && ad.Approver_Role__c == so.Approver_role__c && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
                            //system.debug('***so.Id'+so.Id); 
                            setupObjAvailableFlag = true;
                            break;
                        }
                  }

                    
                  if(!setupObjAvailableFlag && ad.Key_Field__c <> 'Requester'){
                    errormessageFlag = PAUtil.apexErrorMsg('Approver(s) not defined. ');  
                    break;
                  }

                  if(!errorMessageFlag || request.pricingRequest.NPC_Status__c == 'Waiting for Net Price'){

                    //For Key Field Requestor select the Manager of the requestor from the user object.
                    //<BB20140321> Added logic to populate Approvers for Auto approval 
                    if(ad.Key_Field__c == 'Requester' ){
                      
                      backupForRequestor = [SELECT DelegatedApproverId FROM User WHERE id = :managerOfRequestor].DelegatedApproverId;
                      
                      if(routingParameter.contains(ad.Routing_Parameter__c) || ad.Routing_Parameter__c == 'Required'){
                        if(managerOfRequestor == NULL){
                          errormessageFlag = PAUtil.apexErrorMsg('Manager for the Requester is not defined.');  
                        }
                        else {
                          listMultipleUser.add(managerOfRequestor);
                          listMultipleBackup.add(backupForRequestor);
                          mapFinalBackup.put(managerOfRequestor+String.valueOf(i), backupForRequestor);
                        }
                      }

                      else if(!routingParameter.contains(ad.Routing_Parameter__c) && (ad.Routing_Parameter__c == 'Below Floor Price'||ad.Routing_Parameter__c == 'Below Reference Price'||ad.Routing_Parameter__c == 'Below Current Price')){
                        if(managerOfRequestor == NULL){
                          errormessageFlag = PAUtil.apexErrorMsg('Manager for the Requester is not defined.');  
                        }
                        else {
                          system.debug('managerOfRequestor-else'+managerOfRequestor);
                          //listAutoApproverUser.add(managerOfRequestor);
                          listAutoApproverUser.add(managerNameOfRequestor);
                          listAutoApproverBackup.add(backupForRequestor);
                          system.debug('listAutoApproverUser-else'+listAutoApproverUser);
                          mapFinalBackup.put(managerOfRequestor+String.valueOf(i), backupForRequestor);
                        }   
                      }
                    }
                    if(!errorMessageFlag || request.pricingRequest.NPC_Status__c == 'Waiting for Net Price'){  
                      //For Key Field Country:
                      //<BB20140321> Added logic to populate Approvers for Auto approval 
                      //<PR20140901> Added logic to skip the approval process if the key field is country and approver is not required
                      map<String,list<String>> mapList = new map<String,list<String>>();
                      system.debug(ad.key_Field__c);
                      //<MS20141209> Refactored Code for key fields
                      if(ad.Key_Field__c.contains('PH'))
                      {
                        for(Pricing_Request_Item__c pItem: pricingRequestItemsList){
                          Map<Integer, String> mapPHList = new Map<Integer, String>();
                          mapPHcodeList = new Map<Integer, String>();
                          Map<Integer, String> FRBLevel = new Map<Integer,String>();

                          mapPHcodeList.put(1,pItem.PH1_Code__c);
                          mapPHcodeList.put(2,pItem.PH2_Code__c);
                          mapPHcodeList.put(3,pItem.PH3_Code__c);
                          mapPHcodeList.put(4,pItem.PH4_Code__c);
                          mapPHcodeList.put(5,pItem.PH5_Code__c);
                          mapPHcodeList.put(6,pItem.PH6_Code__c);
                          mapPHcodeList.put(7,pItem.PH7_Code__c);
                          mapPHcodeList.put(8,pItem.PH8_Code__c);
                          mapPHcodeList.put(9,pItem.PH9_Code__c);
                          
                          if (pItem.Key_Combination__c.contains('Material'))
                          {
                            Integer phnum = integer.valueOf((ad.Key_Field__c.substring(2,3)));
                            for(Material__c mat : materialListForPH){

                              if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                                string str2 = '';
                                for (integer k =1; k<= phnum; k++)
                                {                                  
                                  if (mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c') <> NULL)
                                  {                      
                                    str2 = str2+mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c');
                                    //materialContainsFlag = true;
                                  }                  
                                }
                                setPH.add(str2);

                              }
                            }
                          }
                          else if(pItem.Key_Combination__c.contains('PH')) 
                          {
                            Integer phnum = integer.valueOf((ad.Key_Field__c.substring(2,3)));
                            string str1 = '';
                            for(integer j =1; j<=phnum; j++)
                            {         
                              if(mapPHcodeList.get(j)<> NULL)
                              {
                                str1 = str1+mapPHcodeList.get(j);
                                //materialContainsFlag = true;
                              }
                            }
                            setPH.add(str1);
                          }

                          else
                          {
                            string str1 = '';
                            for(integer j =1; j<=9; j++)
                            {         
                              if(mapPHcodeList.get(j)<> NULL)
                              {
                                str1 = str1+mapPHcodeList.get(j);

                              }
                            }
                            setPH.add(str1);
                          }
                        }
                      }  
                      else if(ad.Key_Field__c.contains('FRB')){
                        /* || ad.Key_Field__c == 'FRB5' || ad.Key_Field__c == 'FRB6'||ad.Key_Field__c == 'FRB7'||ad.Key_Field__c == 'FRB8'|| ad.Key_Field__c == 'FRB9' ||ad.Key_Field__c == 'FRB10')                                                          
                                                //<HL20140910> Changes start by Hema*/ 
                        Integer frbnum = integer.valueOf((ad.Key_Field__c.substring(3,4)));

                        for(Pricing_Request_Item__c pItem: pricingRequestItemsList){
                          if (pItem.Key_Combination__c.contains('Material'))
                          {
                            for(Material__c mat : MaterialListForFRB){

                              if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                                string str2 = '';
                                for (integer k =4; k<= 10; k++)
                                {
                                  if(frbnum == k){
                                    if (mat.get('ERP_Profit_Center_'+k+'_Code__c') <> NULL)
                                    {
                                      setFRB.add((String)mat.get('ERP_Profit_Center_'+k+'_Code__c'));
                                      // FRBLevel.put(k,setFRB);
                                      //FRBLevel.put(k,(String)mat.get('ERP_Profit_Center_'+k+'_Code__c'));
                                      // materialContainsFlag = true;
                                    }
                                    else
                                      break; 
                                  } 

                                }
                              }
                            }
                          }
                        }
                        //<HL20140910> Changes End by Hema 

                        listApprovers = new List<Id>();
                        mapApproverbackup = new map<Id,id>();
                        for(Setup_Object__c so : setupObjectList)
                        {
                          listApprovers.add(so.Approver_Id__c);
                        }   
                        for(User u: [select id,delegatedApproverid from user where id in :listApprovers])
                        {
                          mapApproverbackup.put(u.id,u.delegatedApproverid);
                        }
                      }
                    //Piyush <PG20191211> Start
                      map<String,Set<String>> mapKFSet = new map<String,Set<String>>{'Sales Reduction'=>setSalesRed,'Country'=>setCountry,'Sales Office'=>setSalesOff,'Sales Org'=>setSalesOrg,'End Use'=>setEndUse,'Division Code'=>setdivision,'Market Segment'=>setMarketSegment,'Customer Group 2'=>setCustomerGroup2,'Customer Group 4'=>setCustomerGroup4,'Reason Code'=>setReasonCode,'PH'=>setPH,'FRB'=>setFRB,'Sales District'=>setSalesDis,'Campaign'=>setCampaign,'Document Currency'=>setDocumentCurrency,'State'=>setState};
                      if(ad.Key_Field__c == 'Country' || ad.Key_Field__c == 'Sales Reduction' || ad.Key_Field__c == 'Sales Office'|| ad.Key_Field__c == 'Sales Org' || ad.Key_Field__c == 'End Use' || ad.Key_Field__c == 'Division Code' || ad.Key_Field__c == 'Market Segment' || ad.Key_Field__c =='Customer Group 2' || ad.Key_Field__c =='Customer Group 4' ||ad.Key_Field__c == 'Reason Code' || ad.Key_Field__c.contains('PH') || ad.Key_Field__c.contains('FRB') || ad.Key_Field__c == 'Sales District' || ad.Key_Field__c == 'Campaign' || ad.Key_Field__c == 'Document Currency' || ad.Key_Field__c == 'State')
                      {
                        //<TJ20150105> Changed condition to accommodate PH and FRB
                        if(ad.Key_Field__c!=null && (mapKFSet.get(ad.Key_Field__c)!=null||mapKFSet.get(ad.Key_Field__c.substring(0,2))!=null||mapKFSet.get(ad.Key_Field__c.substring(0,3))!=null))
                        {
                          Set<String> populateSet = new Set<String>();
                          if(ad.Key_Field__c.contains('PH'))
                          {
                            populateSet=mapKFset.get(ad.Key_Field__c.subString(0,2));   
                          }
                          else if(ad.Key_Field__c.contains('FRB'))
                          {
                            populateSet=mapKFset.get(ad.Key_Field__c.subString(0,3));
                          }
                          else
                          {
                            populateSet=mapKFset.get(ad.Key_Field__c);    
                          }
                         //Piyush <PG20191211> End   
                          mapList = populateKeyFieldApprovers(routingParameter,ad,populateSet,setupObjectList,notgenAppFlag,
                              listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                              keyfieldfromPRflag,request.pricingRequest);
                          listMultipleUser = mapList.get('multipleUser');
                          listMultipleBackup = mapList.get('multipleBackup');
                          listAutoApproverUser = mapList.get('approverUser');
                          listAutoApproverBackup = mapList.get('approverBackup');
                          if(mapList.get('levelNR') != null)
                            setLEvelNR.addAll(mapList.get('levelNR')); 
                          system.debug('mapList is'+mapList);                                                 
                        }
                      }
                    }

                    /*  if(ad.Key_Field__c == 'Country'){
                                                    keyfieldfromPRflag = false;
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setCountry,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                }                                                                                                              

                                                //For Key Field Sales Office:
                                                //<BB20140321> Added logic to populate Approvers for Auto approval 
                                                else if(ad.Key_Field__c == 'Sales Office'){
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setSalesOff,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                }
                                                //For Key Field Sales Org:  
                                                //<BB20140321> Added logic to populate approvers for Auto_Approval   
                                                else if(ad.Key_Field__c == 'Sales Org'){
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setSalesOrg,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                }
                                                //For Key Field End Use:    
                                                //<BB20140321> Added logic to populate Approvers for Auto approval     
                                                else if(ad.Key_Field__c == 'End Use'){
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setEndUse,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                        }   */   
                    //For Key Field Product Hierarchy: 
                    //<BB20140321> Added logic to populate Approvers for Auto approval
                    //else if(ad.Key_Field__c == 'PH2')    
                    //<TJ20140429> Changed Condition From PH2 to Product Hierarchy
                    //<HL20140910> changed the Key field values to PH1 to PH9
                    //else if(ad.Key_Field__c == 'Product Hierarchy')
                    /*  else if(ad.Key_Field__c.contains('PH')){
                                                    //||ad.Key_Field__c == 'PH2'||ad.Key_Field__c == 'PH3'||ad.Key_Field__c == 'PH4'||ad.Key_Field__c == 'PH5'||ad.Key_Field__c == 'PH6'||ad.Key_Field__c == 'PH7'||ad.Key_Field__c == 'PH8'||ad.Key_Field__c == 'PH9'){
                                                    //If value on any of the Pricing Items is NULL, select the All other values Approver
                                                    //or Same Key field value in PR Item and it is NOT present in Admin Detail.

                                                    // 3.3 Changed Key Field value to key field Id
                                                    //system.debug('Setpph'+setph);

                                                    for(Pricing_Request_Item__c pItem: pricingRequestItemsList){
                                                    Map<Integer, String> mapPHList = new Map<Integer, String>();
                                                    mapPHcodeList = new Map<Integer, String>();
                                                    Map<Integer, String> FRBLevel = new Map<Integer,String>();

                                                    mapPHcodeList.put(1,pItem.PH1_Code__c);
                                                    mapPHcodeList.put(2,pItem.PH2_Code__c);
                                                    mapPHcodeList.put(3,pItem.PH3_Code__c);
                                                    mapPHcodeList.put(4,pItem.PH4_Code__c);
                                                    mapPHcodeList.put(5,pItem.PH5_Code__c);
                                                    mapPHcodeList.put(6,pItem.PH6_Code__c);
                                                    mapPHcodeList.put(7,pItem.PH7_Code__c);
                                                    mapPHcodeList.put(8,pItem.PH8_Code__c);
                                                    mapPHcodeList.put(9,pItem.PH9_Code__c);

                                                    if (pItem.Key_Combination__c.contains('Material'))
                                                      {
                                                        Integer phnum = integer.valueOf((ad.Key_Field__c.substring(2,3)));
                                                        for(Material__c mat : materialListForPH){

                                                          if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                                                            string str2 = '';
                                                            for (integer k =1; k<= phnum; k++)
                                                            {
                                                                if (mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c') <> NULL)
                                                                {                         
                                                                      str2 = str2+mat.get('ERP_Product_Hierarchy_Level_'+k+'_Code__c');
                                                                     //materialContainsFlag = true;
                                                                }                   
                                                            }
                                                             setPH.add(str2);

                                                        }
                                                       }
                                                      }
                                                     else if(pItem.Key_Combination__c.contains('PH')) 
                                                     {
                                                          Integer phnum = integer.valueOf((ad.Key_Field__c.substring(2,3)));
                                                             string str1 = '';
                                                             for(integer j =1; j<=phnum; j++)
                                                               {         
                                                                  if(mapPHcodeList.get(j)<> NULL)
                                                                   {
                                                                    str1 = str1+mapPHcodeList.get(j);
                                                                     //materialContainsFlag = true;
                                                                   }
                                                               }
                                                             setPH.add(str1);
                                                           }

                                                     else
                                                      {
                                                        string str1 = '';
                                                             for(integer j =1; j<=9; j++)
                                                               {         
                                                                  if(mapPHcodeList.get(j)<> NULL)
                                                                   {
                                                                    str1 = str1+mapPHcodeList.get(j);

                                                                   }
                                                               }
                                                             setPH.add(str1);
                                                        }

                                                    }
                                                    system.debug(setPH);
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setPH,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                //} 
                        }*/
                    //<HL20140926> Added code for key field Division code
                    /*         else if(ad.Key_Field__c == 'Division Code'){
                                                    //||ad.Key_Field__c == 'PH2'||ad.Key_Field__c == 'PH3'||ad.Key_Field__c == 'PH4'||ad.Key_Field__c == 'PH5'||ad.Key_Field__c == 'PH6'||ad.Key_Field__c == 'PH7'||ad.Key_Field__c == 'PH8'||ad.Key_Field__c == 'PH9'){
                                                    //If value on any of the Pricing Items is NULL, select the All other values Approver
                                                    //or Same Key field value in PR Item and it is NOT present in Admin Detail.

                                                    // 3.3 Changed Key Field value to key field Id
                                                    //system.debug('Setpph'+setph);
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setdivision,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                //} 
                                                }*/
                    //<TJ20140429> START Added Condition For Profit Center Key Field
                    //<HL20140910> changed the Key field values from FRB1 to FRB9
                    /*   else if(ad.Key_Field__c.contains('FRB')){
                                                    // || ad.Key_Field__c == 'FRB5' || ad.Key_Field__c == 'FRB6'||ad.Key_Field__c == 'FRB7'||ad.Key_Field__c == 'FRB8'|| ad.Key_Field__c == 'FRB9' ||ad.Key_Field__c == 'FRB10') {                                                          
                                                //<HL20140910> Changes start by Hema 
                                                Integer frbnum = integer.valueOf((ad.Key_Field__c.substring(3,4)));


                                                 for(Pricing_Request_Item__c pItem: pricingRequestItemsList){
                                                 if (pItem.Key_Combination__c.contains('Material'))
                                                        {
                                                      for(Material__c mat : MaterialListForFRB){

                                                        if(mat.ERP_Material_Code__c == pItem.Material_Code__c){
                                                        string str2 = '';
                                                        for (integer k =4; k<= 10; k++)
                                                        {
                                                            if(frbnum == k){
                                                            if (mat.get('ERP_Profit_Center_'+k+'_Code__c') <> NULL)
                                                        {
                                                           setFRB.add((String)mat.get('ERP_Profit_Center_'+k+'_Code__c'));
                                                          // FRBLevel.put(k,setFRB);
                                                          //FRBLevel.put(k,(String)mat.get('ERP_Profit_Center_'+k+'_Code__c'));
                                                             // materialContainsFlag = true;
                                                        }
                                                           else
                                                             break; 
                                                    } 

                                                        }
                                                        }
                                                        }
                                                    }
                                                }
                                                //<HL20140910> Changes End by Hema 

                                                    listApprovers = new List<Id>();
                                                    mapApproverbackup = new map<Id,id>();
                                                    for(Setup_Object__c so : setupObjectList)
                                                    {
                                                        listApprovers.add(so.Approver_Id__c);
                                                            }  
                                                    for(User u: [select id,delegatedApproverid from user where id in :listApprovers])
                                                    {
                                                        mapApproverbackup.put(u.id,u.delegatedApproverid);
                                                                }

                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setFRB,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                    //}
                                }     */                                                                 
                    //<TJ20140429> END

                    //<BB20140321> Added logic to populate Approvers for Auto approval 
                    /*          else if(ad.Key_Field__c == 'Market Segment'){
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setMarketSegment,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));  
                                                                }                                                                      
                                                //<PS20130417> Ver 2.3 PS 2013-04-17 APAC Rollout-For Key Field Customer Group 2: 
                                                //<BB20140321> Added logic to populate Approvers for Auto approval  
                                                else if(ad.Key_Field__c == 'Customer Group 2'){
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setCustomerGroup2,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));          
                                                    }
                                                    
                                                // Piyush <PG20191211> Start
                                                // Added by Piyush -logic to populate Approvers for Auto approval  
                                                else if(ad.Key_Field__c == 'Customer Group 4'){
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setCustomerGroup4,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));          
                                                    }
                                                //Piyush <PG20191211> End
                                                    
                                                //<GT20140830> Start: Reason Code routing
                                                 else if(ad.Key_Field__c == 'Reason Code'){
                                                    System.debug('setReasonCode:-'+setReasonCode);
                                                    mapList = populateKeyFieldApprovers(routingParameter,ad,setReasonCode,setupObjectList,notgenAppFlag,
                                                                listMultipleUser,listMultipleBackup,listAutoApproverUser,listAutoApproverBackup,i,ad.Key_Field__c,mapApproverbackup,
                                                                keyfieldfromPRflag,request.pricingRequest);
                                                    listMultipleUser = mapList.get('multipleUser');
                                                    listMultipleBackup = mapList.get('multipleBackup');
                                                    listAutoApproverUser = mapList.get('approverUser');
                                                    listAutoApproverBackup = mapList.get('approverBackup');
                                                    if(mapList.get('levelNR') != null)
                                                    setLEvelNR.addAll(mapList.get('levelNR'));          
                        }*/
                    //mapFinalUser.put(i, listMultipleUser); 
                    //<GT20140830> End: Reason Code routing
                  }
                }       
                system.debug(logginglevel.error,'\n\n\n listMultipleUser '+ listMultipleUser+listMultipleBackup+listAutoApproverUser+listAutoApproverBackup+setlevelNR); 
                //system.debug(logginglevel.error,'****** listMultipleUser size ' + listMultipleUser.size() + setPH + 'Salesorg'+setSalesOrg);      
              }
              //In case if async call out, if the routing parameter doesn't satisy, nullify the userlist.
              else{
                listMultipleUser.clear();
                listMultipleBackup.clear();                                        
              }
              //Take the previously selected approver by the Requestor in case of multiple approver in aync case.

              if(listMultipleUser.size()>1 && AsyncCallIndicatorCount > 0 && request.PricingRequest.Pricing_Request_Type__c <> 'Pricing Task'){
                if(i==1 && request.pricingRequest.Approver1__c <> NULL){
                  listMultipleUser.clear();
                  listMultipleBackup.clear();
                  listMultipleUser.add(request.pricingRequest.Approver1__c);
                  listMultipleBackup.add(request.pricingRequest.Backup_Level_1__c);
                }
                if(i==2 && request.pricingRequest.Approver2__c <> NULL){
                  listMultipleUser.clear();
                  listMultipleBackup.clear();
                  listMultipleUser.add(request.pricingRequest.Approver2__c);
                  listMultipleBackup.add(request.pricingRequest.Backup_Level_2__c);
                }
                if(i==3 && request.pricingRequest.Approver3__c <> NULL){
                  listMultipleUser.clear();
                  listMultipleBackup.clear();
                  listMultipleUser.add(request.pricingRequest.Approver3__c);
                  listMultipleBackup.add(request.pricingRequest.Backup_Level_3__c);
                }
                if(i==4 && request.pricingRequest.Approver4__c <> NULL){
                  listMultipleUser.clear();
                  listMultipleBackup.clear();
                  listMultipleUser.add(request.pricingRequest.Approver4__c);
                  listMultipleBackup.add(request.pricingRequest.Backup_Level_4__c);
                }
                if(i==5 && request.pricingRequest.Approver5__c <> NULL){
                  listMultipleUser.clear();
                  listMultipleBackup.clear();
                  listMultipleUser.add(request.pricingRequest.Approver5__c);
                  listMultipleBackup.add(request.pricingRequest.Backup_Level_5__c);
                }
              }

              //Populate the map with the approver and its level
              mapFinalUser.put(i, listMultipleUser);
              //system.debug(logginglevel.error,'@@@@@@@@ i'+i+'mapFinalUser'+mapFinalUser);
              //<BB20140321> Populate the map with the Auto approve approver and its level
              mapAutoUser.put(i,listAutoApproverUser);
              //system.debug(logginglevel.error,'@@@@@@@@ i'+i+'mapAutoUser'+mapAutoUser);                  


              mapValues.addAll(listMultipleUser);

              //<BB20140321> Populating routing parameter for notification and indicator.Start
              mapRoutingParameter.put(i,ad.Routing_Parameter__c);                                    
              //<BB20140321> End
              system.debug(mapFinalUser+' '+mapautouser);
              //}
              //<PP20130722>
              setupObjAvailableFlag=false;
              i=i+1;
              // system.debug(logginglevel.error,'***List multiple user'+listMultipleUser);   
            }
          }//for loop ends 
          if(!errorMessageFlag || request.pricingRequest.NPC_Status__c == 'Waiting for Net Price'){ 
            //system.debug(logginglevel.error,'***Final Map'+mapFinalUser);
            system.debug(logginglevel.error, 'MsgTxt2'+mapFinalUser);
            system.debug(logginglevel.error,'&&&&&'+mapValues); 
            if(mapFinalUser.isEmpty() || mapValues.isEmpty()){
              errormessageFlag = PAUtil.apexErrorMsg(System.Label.No_Approval_Setup_Record_Error);  
            }
            if(!errorMessageFlag || request.pricingRequest.NPC_Status__c == 'Waiting for Net Price'){
              //system.debug(logginglevel.error,'Calling Popup'+AsyncCallIndicatorCount);
              //<BB20140321> Added mapAutoUser and mapRoutingParameter as the Parameters to the method
              popApprover(adminDetailList, mapFinalUser, setLevelNR,mapAutoUser,mapRoutingParameter);
            }
          }
        }
      }
      else{
        errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
      }
      //system.debug(logginglevel.error, 'MsgTxt2'+mapFinalUser+'****'+request.pricingRequest.NPC_Status__c);
    }

    if(desiredAction.equalsIgnoreCase('submitContinue')) {
      //Version 3.2 added level check here
      String oldLevel = request.pricingRequest.Current_Level__c;
      querytoPricingRequest(request.pricingRequest.Id);
        
        //<MG20161221> - Start
        SubmitContinueStatus = request.pricingRequest.f_NPC_Callout_Status__c ;
        system.debug('Submit Continue mansi '+SubmitContinueStatus);
        system.debug('Submit Calculation2 mansi '+SubmitCalculationStatus);
        FlagStatus = false;
        if(SubmitContinueStatus != SubmitCalculationStatus )
        {   
            FlagStatus = true;
            return currentPagelabel;
        }
        //<MG20161221> - End
      
        if(oldLevel == request.pricingRequest.Current_Level__c && request.pricingRequest.Request_Approval_Status__c != 'Submitted'){
        displayApproverList = false;
        //Mapping the Approvers selected by Requestor on the popup to the field values and upserting it.
        //<PP20131111> START
        request.pricingRequest.Approver1__c = null;
        request.pricingRequest.Backup_Level_1__c = null;
        request.pricingRequest.Approver2__c = null;
        request.pricingRequest.Backup_Level_2__c = null;
        request.pricingRequest.Approver3__c = null;
        request.pricingRequest.Backup_Level_3__c = null;
        request.pricingRequest.Approver4__c = null;
        request.pricingRequest.Backup_Level_4__c = null;
        request.pricingRequest.Approver5__c = null;
        request.pricingRequest.Backup_Level_5__c = null;
        //<MS20150513>
        //if(request.pricingRequest.NPC_Status__c == 'Waiting for Net Price')
      //  {
          request.pricingRequest.Current_Approver__c=null;
          request.pricingRequest.Current_Level__c=null;  
        //}
        
        //system.debug(logginglevel.error, 'MsgTxt5*****'+wrapList[2].stringMap.get('selectedUserId'));
        //<PP20131111> END
        if(wrapList[0].stringMap.get('selectedUserId') <> ' '){
          request.pricingRequest.Approver1__c = wrapList[0].stringMap.get('selectedUserId');
          request.pricingRequest.Backup_Level_1__c = mapFinalBackup.get(wrapList[0].stringMap.get('selectedUserId')+'1');
        }
        if(wrapList[1].stringMap.get('selectedUserId') <> ' '){
          request.pricingRequest.Approver2__c = wrapList[1].stringMap.get('selectedUserId');
          request.pricingRequest.Backup_Level_2__c = mapFinalBackup.get(wrapList[1].stringMap.get('selectedUserId')+'2');
        }
        if(wrapList[2].stringMap.get('selectedUserId') <> ' '){
          request.pricingRequest.Approver3__c = wrapList[2].stringMap.get('selectedUserId');
          request.pricingRequest.Backup_Level_3__c = mapFinalBackup.get(wrapList[2].stringMap.get('selectedUserId')+'3');
        }
        if(wrapList[3].stringMap.get('selectedUserId') <> ' '){
          request.pricingRequest.Approver4__c = wrapList[3].stringMap.get('selectedUserId');
          request.pricingRequest.Backup_Level_4__c = mapFinalBackup.get(wrapList[3].stringMap.get('selectedUserId')+'4');
        }
        if(wrapList[4].stringMap.get('selectedUserId') <> ' '){
          request.pricingRequest.Approver5__c = wrapList[4].stringMap.get('selectedUserId');
          request.pricingRequest.Backup_Level_5__c = mapFinalBackup.get(wrapList[4].stringMap.get('selectedUserId')+'5');
        }       
        //system.debug(logginglevel.error,'****Submit Conti'+request.pricingRequest);
        //Version 2.5:Start


        //<BB20140321> START Mapping the Auto Approvers selected by Requestor on the popup to the field values and upserting it.
        if(wrapList[0].stringMap.get('selectedAutoUser') <> ' '){
          request.pricingRequest.Auto_Approver_Level1__c = wrapList[0].stringMap.get(wrapList[0].stringMap.get('selectedAutoUser')); //<SP20140617>  
        }
        if(wrapList[1].stringMap.get('selectedAutoUser') <> ' '){
          request.pricingRequest.Auto_Approver_Level2__c = wrapList[1].stringMap.get(wrapList[1].stringMap.get('selectedAutoUser')); //<SP20140617>
        }
        if(wrapList[2].stringMap.get('selectedAutoUser') <> ' '){
          request.pricingRequest.Auto_Approver_Level3__c = wrapList[2].stringMap.get(wrapList[2].stringMap.get('selectedAutoUser')); //<SP20140617>
        }
        if(wrapList[3].stringMap.get('selectedAutoUser') <> ' '){
          request.pricingRequest.Auto_Approver_Level4__c = wrapList[3].stringMap.get(wrapList[3].stringMap.get('selectedAutoUser')); //<SP20140617>
        }
        if(wrapList[4].stringMap.get('selectedAutoUser') <> ' '){
          request.pricingRequest.Auto_Approver_Level5__c = wrapList[4].stringMap.get(wrapList[4].stringMap.get('selectedAutoUser')); //<SP20140617>
        }         
        //system.debug(logginglevel.error,'****Inside Auto Approval'+request.pricingRequest);
        //<BB20140321> END

        //Out of office and Backup Logic:
        Id buAdminId = [SELECT id, OwnerId FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c Limit 1].ownerId;
        List<Id> approversInScope = new List<Id>();
        approversInScope.add(buAdminId);
        approversInScope.add(request.pricingRequest.Approver1__c);approversInScope.add(request.pricingRequest.Backup_Level_1__c);
        approversInScope.add(request.pricingRequest.Approver2__c);approversInScope.add(request.pricingRequest.Backup_Level_2__c);
        approversInScope.add(request.pricingRequest.Approver3__c);approversInScope.add(request.pricingRequest.Backup_Level_3__c);
        approversInScope.add(request.pricingRequest.Approver4__c);approversInScope.add(request.pricingRequest.Backup_Level_4__c);
        approversInScope.add(request.pricingRequest.Approver5__c);approversInScope.add(request.pricingRequest.Backup_Level_5__c);

        Map<Id,User> userAvailabilityMap = new Map<Id,User>([SELECT id,out_of_office__c,out_of_office_Start_Date__c,out_of_office_End_Date__c FROM User WHERE 
                                                             Id IN :approversInScope AND isActive=true
                                                             ]);

        //If the approver is out of office, the request has to be sent to the backup
        //Version 3.0 Added condition to check level also below for all five levels.
        //For Level 1 
        Map<String,String> mapBackApp = new Map<String,String>{'1'=>request.pricingRequest.Backup_Level_1__c,'2'=>request.pricingRequest.Backup_Level_2__c,'3'=>request.pricingRequest.Backup_Level_3__c,'4'=>request.pricingRequest.Backup_Level_4__c,'5'=>request.pricingRequest.Backup_Level_5__c};
        Map<String,String> mapApp = new Map<String,String>{'1'=>request.pricingRequest.Approver1__c,'2'=>request.pricingRequest.Approver2__c,'3'=>request.pricingRequest.Approver3__c,'4'=>request.pricingRequest.Approver4__c,'5'=>request.pricingRequest.Approver5__c};
        request.pricingRequest.Approver1__c=modifyApprover(userAvailabilityMap,mapBackApp,mapApp,'1',buAdminId);
        request.pricingRequest.Approver2__c=modifyApprover(userAvailabilityMap,mapBackApp,mapApp,'2',buAdminId);
        request.pricingRequest.Approver3__c=modifyApprover(userAvailabilityMap,mapBackApp,mapApp,'3',buAdminId);
        request.pricingRequest.Approver4__c=modifyApprover(userAvailabilityMap,mapBackApp,mapApp,'4',buAdminId);
        request.pricingRequest.Approver5__c=modifyApprover(userAvailabilityMap,mapBackApp,mapApp,'5',buAdminId);

        /*if(userAvailabilityMap.get(request.pricingRequest.Approver1__c)!=null && request.pricingRequest.Current_Level__c == '1'){
          if(userAvailabilityMap.get(request.pricingRequest.Approver1__c).out_of_office__c==true && 
              (userAvailabilityMap.get(request.pricingRequest.Approver1__c).out_of_Office_start_date__c<=System.today()
                                    &&userAvailabilityMap.get(request.pricingRequest.Approver1__c).out_of_Office_End_date__c>=System.today()))
                    { 
                        //move it to backup approver 
                        //Version 3.1
                        // request.pricingRequest.Sent_to_Backup_Approver__c = true;
                        if(!String.isBlank(String.valueOf(request.pricingRequest.Backup_Level_1__c)) && userAvailabilityMap.get(request.pricingRequest.Backup_Level_1__c)!=null &&
                                userAvailabilityMap.get(request.pricingRequest.Backup_Level_1__c).out_of_office__c==true && 
                                (userAvailabilityMap.get(request.pricingRequest.Backup_Level_1__c).out_of_Office_start_date__c<=System.today()
                                        &&userAvailabilityMap.get(request.pricingRequest.Backup_Level_1__c).out_of_Office_End_date__c>=System.today()))
                        {
                            //Assign to BU Admin
                            //Id buAdminId = returnBuAdminId(request.pricingRequest,orgGroupObjList);
                            if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                                request.pricingRequest.Approver1__c = buAdminId;
                        }
                        else
                            request.pricingRequest.Approver1__c = request.pricingRequest.Backup_Level_1__c;
                    }
                }
                //For Level 2
                if(userAvailabilityMap.get(request.pricingRequest.Approver2__c)!=null && request.pricingRequest.Current_Level__c == '2'){
                    if(userAvailabilityMap.get(request.pricingRequest.Approver2__c).out_of_office__c==true && 
                            (userAvailabilityMap.get(request.pricingRequest.Approver2__c).out_of_Office_start_date__c<=System.today()
                                    &&userAvailabilityMap.get(request.pricingRequest.Approver2__c).out_of_Office_End_date__c>=System.today()))
                    {
                        //move it to backup approver 
                        //Version 3.1
                        //  request.pricingRequest.Sent_to_Backup_Approver__c = true;
                        if(!String.isBlank(String.valueOf(request.pricingRequest.Backup_Level_2__c)) && userAvailabilityMap.get(request.pricingRequest.Backup_Level_2__c)!=null &&
                                userAvailabilityMap.get(request.pricingRequest.Backup_Level_2__c).out_of_office__c==true && 
                                (userAvailabilityMap.get(request.pricingRequest.Backup_Level_2__c).out_of_Office_start_date__c<=System.today()
                                        &&userAvailabilityMap.get(request.pricingRequest.Backup_Level_2__c).out_of_Office_End_date__c>=System.today()))
                        {
                            //Assign to BU Admin
                            //Id buAdminId = returnBuAdminId(request.pricingRequest,orgGroupObjList);
                            if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                                request.pricingRequest.Approver2__c = buAdminId;
                        }
                        else
                            request.pricingRequest.Approver2__c = request.pricingRequest.Backup_Level_2__c;
                    }
                }
                //For Level 3
                if(userAvailabilityMap.get(request.pricingRequest.Approver3__c)!=null && request.pricingRequest.Current_Level__c == '3'){
                    if(userAvailabilityMap.get(request.pricingRequest.Approver3__c).out_of_office__c==true && 
                            (userAvailabilityMap.get(request.pricingRequest.Approver3__c).out_of_Office_start_date__c<=System.today()
                                    &&userAvailabilityMap.get(request.pricingRequest.Approver3__c).out_of_Office_End_date__c>=System.today()))
                    {
                        //move it to backup approver 

                        //Version 3.1
                        // request.pricingRequest.Sent_to_Backup_Approver__c = true;
                        if(!String.isBlank(String.valueOf(request.pricingRequest.Backup_Level_3__c)) && userAvailabilityMap.get(request.pricingRequest.Backup_Level_3__c)!=null &&
                                userAvailabilityMap.get(request.pricingRequest.Backup_Level_3__c).out_of_office__c==true && 
                                (userAvailabilityMap.get(request.pricingRequest.Backup_Level_3__c).out_of_Office_start_date__c<=System.today()
                                        &&userAvailabilityMap.get(request.pricingRequest.Backup_Level_3__c).out_of_Office_End_date__c>=System.today()))
                        {
                            //Assign to BU Admin
                            //Id buAdminId = returnBuAdminId(request.pricingRequest,orgGroupObjList);
                            if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                                request.pricingRequest.Approver3__c = buAdminId;
                        }
                        else
                            request.pricingRequest.Approver3__c = request.pricingRequest.Backup_Level_3__c;
                    }
                }
                //For Level 4
                if(userAvailabilityMap.get(request.pricingRequest.Approver4__c)!=null && request.pricingRequest.Current_Level__c == '4'){
                    if(userAvailabilityMap.get(request.pricingRequest.Approver4__c).out_of_office__c==true && 
                            (userAvailabilityMap.get(request.pricingRequest.Approver4__c).out_of_Office_start_date__c<=System.today()
                                    &&userAvailabilityMap.get(request.pricingRequest.Approver4__c).out_of_Office_End_date__c>=System.today()))
                    {
                        //move it to backup approver 
                        //Version 3.1
                        //request.pricingRequest.Sent_to_Backup_Approver__c = true;
                        if(!String.isBlank(String.valueOf(request.pricingRequest.Backup_Level_4__c)) && userAvailabilityMap.get(request.pricingRequest.Backup_Level_4__c)!=null &&
                                userAvailabilityMap.get(request.pricingRequest.Backup_Level_4__c).out_of_office__c==true && 
                                (userAvailabilityMap.get(request.pricingRequest.Backup_Level_4__c).out_of_Office_start_date__c<=System.today()
                                        &&userAvailabilityMap.get(request.pricingRequest.Backup_Level_4__c).out_of_Office_End_date__c>=System.today()))
                        {
                            //Assign to BU Admin
                            //Id buAdminId = returnBuAdminId(request.pricingRequest,orgGroupObjList);
                            if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                                request.pricingRequest.Approver4__c = buAdminId;
                        }
                        else
                            request.pricingRequest.Approver4__c = request.pricingRequest.Backup_Level_4__c;
                    }
                }
                //For Level 5
                if(userAvailabilityMap.get(request.pricingRequest.Approver5__c)!=null && request.pricingRequest.Current_Level__c == '5'){
                    if(userAvailabilityMap.get(request.pricingRequest.Approver5__c).out_of_office__c==true && 
                            (userAvailabilityMap.get(request.pricingRequest.Approver5__c).out_of_Office_start_date__c<=System.today()
                                    &&userAvailabilityMap.get(request.pricingRequest.Approver5__c).out_of_Office_End_date__c>=System.today()))
                    {
                        //move it to backup approver 
                        //Version 3.1
                        // request.pricingRequest.Sent_to_Backup_Approver__c = true;
                        if(!String.isBlank(String.valueOf(request.pricingRequest.Backup_Level_5__c)) && userAvailabilityMap.get(request.pricingRequest.Backup_Level_5__c)!=null &&
                                userAvailabilityMap.get(request.pricingRequest.Backup_Level_5__c).out_of_office__c==true && 
                                (userAvailabilityMap.get(request.pricingRequest.Backup_Level_5__c).out_of_Office_start_date__c<=System.today()
                                        &&userAvailabilityMap.get(request.pricingRequest.Backup_Level_5__c).out_of_Office_End_date__c>=System.today()))
                        {
                            //Assign to BU Admin
                            //Id buAdminId = returnBuAdminId(request.pricingRequest,orgGroupObjList);
                            if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
                                request.pricingRequest.Approver5__c = buAdminId;
                        }
                        else
                            request.pricingRequest.Approver5__c = request.pricingRequest.Backup_Level_5__c;
                    }
        }*/

        //Version 2.5: End
        upsert request.pricingRequest;  

        //Update Current Level Field according to the Approvers selected.                           
        //<TJ20150506>-Start
        request.pricingRequest.Current_Level__c = '1';        
        //Out of Office Implementation Version 2.5: Start
        //Null check for Current Level Version 2.7
        if(request.pricingRequest.Current_Level__c <> NULL)
        {          
          sObject sobj = (sObject) request.pricingRequest;
          boolean flag=false;
          for(integer j=Integer.valueOf(request.pricingRequest.Current_Level__c);j<=5;j++)
          {
            String currApp=String.valueOf(sobj.get('Approver'+String.valueOf(j)+'__c'));
            for(integer z=j+1;z<=5;z++)
            {
              String nextApp=String.valueOf(sobj.get('Approver'+String.valueOf(z)+'__c'));
              if(j!=5 && nextApp <> NULL && currApp<> NULL && nextApp!=currApp)
              {                
                break;
              }
              else if(j!=5 && nextApp <> NULL && currApp<> NULL && nextApp==currApp)
              {
                request.pricingRequest.put('Approver'+String.valueOf(j)+'__c',NULL);
                break;                                              
              }                            
            }            
          }
          /*for(Integer i = Integer.valueOf(request.pricingRequest.Current_Level__c);i<=5;i++)
          {
            sObject sobj = (sObject) request.pricingRequest;
            //<PP20140120>
            if(i!=5 && sobj.get('Approver'+String.valueOf(i)+'__c') <> NULL && sobj.get('Approver'+String.valueOf(i+1)+'__c')<> NULL && sobj.get('Approver'+String.valueOf(i)+'__c')==sobj.get('Approver'+String.valueOf(i+1)+'__c'))
            {
              if(i+1 == 2){
                request.pricingRequest.Approver2__c = NULL;
                if(sobj.get('Approver'+String.valueOf(i+2)+'__c') == sobj.get('Approver'+String.valueOf(i)+'__c')){
                  request.pricingRequest.Approver3__c = NULL;
                  if(sobj.get('Approver'+String.valueOf(i+3)+'__c') == sobj.get('Approver'+String.valueOf(i)+'__c')){
                    request.pricingRequest.Approver4__c = NULL;
                  }
                }
              }       
              if(i+1 == 3){
                request.pricingRequest.Approver3__c = NULL;
                //<PP20140120>
                if(sobj.get('Approver'+String.valueOf(i+2)+'__c') == sobj.get('Approver'+String.valueOf(i)+'__c')){
                  request.pricingRequest.Approver4__c = NULL;
                }
              }
              if(i+1 == 4){
                request.pricingRequest.Approver4__c = NULL;
              }
            }
          }*/          
        }
        request.pricingRequest.Current_Level__c = NULL;
        if(request.pricingRequest.Approver1__c <> NULL)
          request.pricingRequest.Current_Level__c = '1';
        else if(request.pricingRequest.Approver2__c <> NULL)
          request.pricingRequest.Current_Level__c = '2';
        else if(request.pricingRequest.Approver3__c <> NULL)
          request.pricingRequest.Current_Level__c = '3';
        else if(request.pricingRequest.Approver4__c <> NULL)
          request.pricingRequest.Current_Level__c = '4';
        else if(request.pricingRequest.Approver5__c <> NULL)
          request.pricingRequest.Current_Level__c = '5';
        //<TJ20150506> Issue fix Manager not defined START  
        if(request.pricingRequest.Current_Level__c !=null)  
          request.pricingRequest.Current_Approver__c = String.valueOf(request.pricingRequest.get('Approver'+request.pricingRequest.Current_Level__c+'__c'));
        //<TJ20150506> Issue fix Manager not defined END  
        //<TJ20150506> End          
        //Version 2.5 end
        request.pricingRequest.Submitted_On__c= system.now();                       
        request.pricingRequest.Submitted_By__c= UserInfo.getUserId(); 
        //<MS20140421> Added logic to store approver names in field approverText__c            
        List<Pricing_Request__c> approverDataList=[SELECT Approver1__r.Name,Approver2__r.Name, Approver3__r.Name,Approver4__r.Name,Approver5__r.Name from Pricing_Request__c where id=:request.pricingRequest.id];
        String addString='';
        for(Pricing_Request__c appNames: approverDataList)
        {
          addstring='1'+ appNames.Approver1__r.Name +'2'+ appNames.Approver2__r.Name+'3' + appNames.Approver3__r.Name +'4'+ appNames.Approver4__r.Name +'5'+ appNames.Approver5__r.Name +'6';
        }   
        request.pricingRequest.approverText__c=addstring; 
        


        upsert request.pricingRequest;
        //system.debug(logginglevel.error,'*****request.pricingRequest.NPC_Status__c'+request.pricingRequest.NPC_Status__c+'AsyncCallIndicatorCount'+AsyncCallIndicatorCount+'itemp'+itemPendingFlag);
        //For Asynchrounous Call out, the submission will happen after the response has been received.
        //<PP20140923>
        if(itemPendingFlag && AsyncCallIndicatorCount > 0 && request.pricingRequest.NPC_Status__c <> 'Net Price Received' && (((request.pricingRequest.Pricing_Request_Type__c == 'Permanent' || request.pricingRequest.Pricing_Request_Type__c == 'Project Pricing') && request.pricingRequest.Request_Type__c == 'Customer Specific') || request.pricingRequest.isNPCApplicable__c > 0)){
          //<PP20141001> -Fix for IS ID-00047244
          List<Pricing_Request_Item__c> priWaitList = [SELECT Id FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :request.pricingRequest.Id AND Net_Price_Status__c = 'Waiting for Net Price' LIMIT 1];
          if(priWaitList != null && priWaitList.size() > 0)
          {
            request.pricingRequest.NPC_Status__c = 'Waiting for Net Price';
            upsert request.pricingRequest;
            return currentPagelabel;
          }
          else{
            system.debug(logginglevel.error, 'MsgTxt3');

            submit();
          }
        }
        else{
          system.debug(logginglevel.error, 'MsgTxt3');

          submit();
        }
        //throwing null pointer exception
        //request.requestServiceState.currentRequestItem.relatedWrappersList = request.requestServiceState.currentRequestItem.getListWrappers(); //calling getListWrappers to fix View link is missing issue- 20th June
      }
      //Version 3.2 added level check here and showing error message in false case.
      else{
        errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
        displayApproverList = false;
      } 

    }
    //2.4 Bala moving the approval code to a method .
    if(desiredAction.equalsIgnoreCase('approve')) {
      String oldLevel = request.pricingRequest.Current_Level__c;
      querytoPricingRequest(request.pricingRequest.Id);
      //Approve the submitted record for standard approval process.
      system.debug(logginglevel.error,'***In Approve');
      if(oldLevel == request.pricingRequest.Current_Level__c && request.pricingRequest.Request_Approval_Status__c == 'Submitted'){
        approveRequest(request.pricingRequest);
        /*Version 2.6: it has to be commented as sequential approval is not done like this now.
                  for(Integer i = Integer.valueOf(request.pricingRequest.Current_Level__c);i<=5;i++)
               {
                sObject sobj = (sObject) request.pricingRequest;
                if(i!=5 && sobj.get('Approver'+String.valueOf(i)+'__c')==sobj.get('Approver'+String.valueOf(i+1)+'__c'))
                {
                  system.debug(logginglevel.error,'***In here approve'+sobj.get('Approver'+String.valueOf(i)+'__c')+sobj.get('Approver'+String.valueOf(i+1)+'__c'));
                    approveRequest(request.pricingRequest);     
                }
               }*/
      } 
      else{
        errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
      }
    }

    if(desiredAction.equalsIgnoreCase('reject')) {
      String oldLevel = request.pricingRequest.Current_Level__c;
      querytoPricingRequest(request.pricingRequest.Id);
      if(oldLevel == request.pricingRequest.Current_Level__c && request.pricingRequest.Request_Approval_Status__c == 'Submitted'){
        system.debug(logginglevel.error,'***AppRej'+appRejComments);
        //Reject the submitted record for standard approval process.
        if(appRejComments == NULL || appRejComments == ''){
          errormessageFlag = PAUtil.apexErrorMsg(System.Label.Enter_Rejection_Comments_Error);  
        }
        if(!errorMessageFlag){
          Approval.ProcessResult result = null;
          List<Id> newWorkItemIds = null;

          // Approve the submitted request
          // First, get the ID of the newly created item
          // Instantiate the new ProcessWorkitemRequest object and populate it
          Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
          if(appRejComments == NULL)
            req2.setComments('Rejecting request.');
          else
            req2.setComments(appRejComments);
          req2.setAction('Reject');
          req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});

          // Use the ID from the newly created item to specify the item to be worked
          ProcessInstanceWorkitem newProcess = [Select Id, processinstance.targetobjectid From ProcessInstanceWorkitem where processinstance.targetobjectid = :request.PricingRequest.Id];
          req2.setWorkitemId(newProcess.Id);
          result = Approval.process(req2);
          newWorkItemIds = result.getNewWorkitemIds(); 
          //return currentPage;
        }
        querytoPricingRequest(request.pricingRequest.Id);


        //1.1 Start ------- added by Prachi - 22nd feb - to change the project status to 'Rejected' when pricing request status is rejected 
        //added by anand on 19 FEB
        if(request.pricingRequest.Pricing_Request_Type__c=='Project Pricing')
        {
          request.pricingRequestId=request.pricingRequest.Id;
        }
      }
      else{
        errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
      }
    }

    if(desiredAction.equalsIgnoreCase('recall')) {
      String oldLevel = request.pricingRequest.Current_Level__c;
      querytoPricingRequest(request.pricingRequest.Id);
      System.debug('******oldLevel '+oldLevel+'***request.pricingRequest.Current_Level__c '+request.pricingRequest.Current_Level__c);
      if(oldLevel == request.pricingRequest.Current_Level__c && request.pricingRequest.Request_Approval_Status__c == 'Submitted'){
        //Recall the submitted record for standard approval process.
        Approval.ProcessResult result = null;
        List<Id> newWorkItemIds = null;
        //request.pricingRequest.Submitted_On__c=null;
        // Approve the submitted request
        // First, get the ID of the newly created item
        // Instantiate the new ProcessWorkitemRequest object and populate it
        //<PP20140305> START
        system.debug('*****'+request.pricingRequest.Submitted_By__c+'****'+UserInfo.getUserId());
        //<VR20140221> DTT Global Rollout - Racall with webservice
        if(request.pricingRequest.Submitted_By__c != UserInfo.getUserId())
        {
          try {
            /*
                        partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap();
                        partnerSoapSforceCom.LoginResult loginResult = sp.login('spec.specpa@dupont.com', IntegrationLoginCredentials__c.getInstance('spec.specpa@dupont.com').EncryptedLoginDetails__c);
                        WebServiceReassign.PAReassign stub = new WebServiceReassign.PAReassign();
                        WebServiceReassign.SessionHeader_element sessionHeader = new WebServiceReassign.SessionHeader_element();
                        sessionHeader.sessionId = loginResult.sessionId;

                        stub.timeout_x = 120000;
                        stub.SessionHeader = sessionHeader;
                        stub.recallRequest(request.pricingRequest.id,appRejComments);
             */
          }
          catch(Exception e){
            System.debug('*****exception'+e);
            errormessageFlag = PAUtil.apexErrorMsg('Auto Submitted requests cannot be recalled.Please contact approver to get the request rejected' );  
            return currentpageLabel;
          }
        }
        else
        {
          Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
          if(appRejComments == NULL)
            req2.setComments('Recalling request.');
          else
            req2.setComments(appRejComments);
          req2.setAction('Removed');              
          // Use the ID from the newly created item to specify the item to be worked
          try{
            ProcessInstanceWorkitem newProcess = [Select Id, processinstance.targetobjectid From ProcessInstanceWorkitem where processinstance.targetobjectid = :request.PricingRequest.Id];
            req2.setWorkitemId(newProcess.Id);
            result = Approval.process(req2);
          }
          catch(Exception e1) {
            System.debug('*****exception'+e1);
            errormessageFlag = PAUtil.apexErrorMsg('Auto Submitted requests cannot be recalled.Please contact approver to get the request rejected' );  
            return currentpageLabel;
          }
        }
        //<PP20140305> END

        //newWorkItemIds = result.getNewWorkitemIds(); 

        //return currentPage;
        querytoPricingRequest(request.pricingRequest.Id);

        //added by anand on 19 FEB
        if(request.pricingRequest.Pricing_Request_Type__c=='Project Pricing')
        {
          request.pricingRequestId=request.pricingRequest.Id;
        }
      }
      else{
        errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
      }
    }

    if(desiredAction.equalsIgnoreCase('closeApproverpopup')) {
      //This method will just set the boolean flag false for the approver popup
      displayApproverList = false;
      AsyncCallIndicatorCount = 0;
    }                

    if(desiredAction.equalsIgnoreCase('popupreassign')) {
      String oldLevel = request.pricingRequest.Current_Level__c;
      querytoPricingRequest(request.pricingRequest.Id);
      if(oldLevel == request.pricingRequest.Current_Level__c && request.pricingRequest.Request_Approval_Status__c == 'Submitted'){
        system.debug(logginglevel.error,'*******inside PopupReassign');
        //This will display the list of the approvers for different approvers so that BU Admin may reassign
        wrapforReassignObjList.clear();
        displayReassignList = true;     
        PAWrapper wrapforReassignObj;           
        for(Integer i = 1;i<6;i++){
          wrapforReassignObj = new PAWrapper();
          //wrapforReassignObj.stringMap = new map<String, String>();
          wrapforReassignObj.stringMap.put('Level', String.valueOf(i)) ;
          wrapforReassignObj.stringMap.put('userName', ' ');
          wrapforReassignObj.stringMap.put('userEmail', ' ');
          wrapforReassignObj.stringMap.put('userApproverRole', ' ');
          //wrapforReassignObj.stringMap.put('delegationComments', ' ');
          if(i==1){
            if(request.pricingRequest.Approver1__r.Name <> NULL)
              wrapforReassignObj.stringMap.put('userName', request.pricingRequest.Approver1__r.Name);
            if(request.pricingRequest.Approver1__r.E_Pass_Id__c <>  NULL)
              wrapforReassignObj.stringMap.put('userEmail', request.pricingRequest.Approver1__r.Email);
            //wrapforReassignObj.stringMap.put('userApproverRole', 'Approver Role');
          }
          else if(i==2){
            if(request.pricingRequest.Approver2__r.Name <> NULL)
              wrapforReassignObj.stringMap.put('userName', request.pricingRequest.Approver2__r.Name);
            if(request.pricingRequest.Approver2__r.E_Pass_Id__c <>  NULL)
              wrapforReassignObj.stringMap.put('userEmail', request.pricingRequest.Approver2__r.Email);
            // wrapforReassignObj.stringMap.put('userApproverRole', 'Approver Role');
          }
          else if(i==3){
            if(request.pricingRequest.Approver3__r.Name <> NULL)
              wrapforReassignObj.stringMap.put('userName', request.pricingRequest.Approver3__r.Name);
            if(request.pricingRequest.Approver3__r.E_Pass_Id__c <>  NULL)
              wrapforReassignObj.stringMap.put('userEmail', request.pricingRequest.Approver3__r.Email);
            //wrapforReassignObj.stringMap.put('userApproverRole', 'Approver Role');
          }
          else if(i==4){
            if(request.pricingRequest.Approver4__r.Name <> NULL)
              wrapforReassignObj.stringMap.put('userName', request.pricingRequest.Approver4__r.Name);
            if(request.pricingRequest.Approver4__r.E_Pass_Id__c <>  NULL)
              wrapforReassignObj.stringMap.put('userEmail', request.pricingRequest.Approver4__r.Email);
            //wrapforReassignObj.stringMap.put('userApproverRole', 'Approver Role');
          }
          else if(i==5){
            if(request.pricingRequest.Approver5__r.Name <> NULL)
              wrapforReassignObj.stringMap.put('userName', request.pricingRequest.Approver5__r.Name);
            if(request.pricingRequest.Approver5__r.E_Pass_Id__c <>  NULL)
              wrapforReassignObj.stringMap.put('userEmail', request.pricingRequest.Approver5__r.Email);
            //wrapforReassignObj.stringMap.put('userApproverRole', 'Approver Role');
          }
          wrapforReassignObjList.add(wrapforReassignObj);
          system.debug(logginglevel.error,'wrapper List for reassign'+wrapforReassignObjList);
        }
      }
      else{
        errormessageFlag = PAUtil.apexErrorMsg(System.Label.Request_Status_Changed);  
      }
      //  system.debug(logginglevel.error,'****wrapper List for reassign'+wrapforReassignObjList+request.pricingRequest.Current_Level__c);
    }
    if(desiredAction.equalsIgnoreCase('closereassignpopup')) {
      //This method will just set the boolean flag false for the Reassign popup
      displayReassignList = false;
    }

    if(desiredAction.equalsIgnoreCase('reassignLookup')) {
      //This will display the custom lookup for the user to be selected for reassigning.
      //For Defect 262 : Utkarsh
      set<Id> approverUserList = new set<Id>();
      system.debug(logginglevel.error,'***SalesArea'+request.pricingRequest.salesArea__c);
      for(Organizational_Group_User__c orgUser : [SELECT Related_User__c, OrgGroup__c, OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Distribution_Channel_Code__c, OrgGroup__r.ERP_Division_Code__c FROM Organizational_Group_User__c]){
        if((orgUser.OrgGroup__r.ERP_Sales_Org_Code__c+'-'+orgUser.OrgGroup__r.ERP_Distribution_Channel_Code__c+'-'+orgUser.OrgGroup__r.ERP_Division_Code__c) == (request.pricingRequest.SalesArea__c))
          approverUserList.add(orgUser.Related_User__c);
      }
      userReassignList = [select E_Pass_Id__c, Name from User where isactive = true AND Id IN :approverUserList];
      system.debug(logginglevel.error,'***userList'+userReassignList+approverUserList.size());
      showUserLookupListFlag = true;
    }
    if(desiredAction.equalsIgnoreCase('closeUserLookup')) {
      //This will close the custom user lookup.
      system.debug(logginglevel.error,'**SelectedUser'+selectedUser);
      showUserLookupListFlag = false;
      if(selectedUser <> NULL){
        for(PAWrapper wrapObj : wrapforReassignObjList){
          if(selectedLevel == wrapObj.stringMap.get('Level')){
            wrapObj.stringMap.put('userName', selectedUser);
            wrapObj.stringMap.put('userEmail', selectedEmailId);
            wrapObj.stringMap.put('userId', selectedUserId);
            break;
          } 
        }
      }
    }   
    if(desiredAction.equalsIgnoreCase('saveReassignedUser')) {
      //This method will  update the Approver field in the Pricing Request with the reassigned user.
      displayReassignList = false;
      //commented to enable js reassigning
      //reassign();
      if(!errorMessageFlagReassign){
        for(PAWrapper wrapObj : wrapforReassignObjList){
          if(wrapObj.stringMap.get('Level') == '1' && request.pricingRequest.Current_Level__c == '1'){
            request.pricingRequest.Approver1__c = wrapObj.stringMap.get('userId');
          }
          else if(wrapObj.stringMap.get('Level') == '2' && request.pricingRequest.Current_Level__c == '2'){
            request.pricingRequest.Approver2__c = wrapObj.stringMap.get('userId');
          }
          else if(wrapObj.stringMap.get('Level') == '3' && request.pricingRequest.Current_Level__c == '3'){
            request.pricingRequest.Approver3__c = wrapObj.stringMap.get('userId');
          }
          else if(wrapObj.stringMap.get('Level') == '4' && request.pricingRequest.Current_Level__c == '4'){
            request.pricingRequest.Approver4__c = wrapObj.stringMap.get('userId');
          }
          else if(wrapObj.stringMap.get('Level') == '5' && request.pricingRequest.Current_Level__c == '5'){
            request.pricingRequest.Approver5__c = wrapObj.stringMap.get('userId');
          }
          if(wrapObj.stringMap.get('Level')==request.pricingRequest.Current_Level__c)
          {
            request.pricingRequest.Current_Approver__c=wrapObj.stringMap.get('userId');
          }
          //Start:<GT20140913> Added logic to populate reassign comments on request
          /*if(!string.isblank(wrapObj.stringMap.get('delegationComments')))
                    {
                        request.pricingRequest.Delegation_Comments__c=wrapObj.stringMap.get('delegationComments');
                        System.debug('Comments:-'+wrapObj.stringMap.get('delegationComments'));
                }          
                    else 
                        request.pricingRequest.Delegation_Comments__c=null;
                    //End:<GT20140913>
           */
          //Start:<GT20140913> Added logic to populate reassign comments on request
          if(!string.isblank(delegationComments))
            request.pricingRequest.Delegation_Comments__c = delegationComments;
          else
            request.pricingRequest.Delegation_Comments__c = null;
          //End:<GT20140913>
        }       
                System.debug('request.pricingRequest:'+request.pricingRequest);
        update request.pricingRequest;
      }
    }  

    return newPagelabel;      
  }

  /* //<TJ20140429> START Added Method to query the PH Level and the FRB Level from Org Grp Item.
    public List<OrgGroup__c> queries()
    {
        List<OrgGroup__c> level=[select Owning_Business__c,Product_Hierarchy_Level__c, profit_center_level__c from OrgGroup__c where business__c=:request.pricingRequest.BU__c];
        return level;
    }
    //<TJ20140429> Added method for getting FRB Codes
    public List<String> FRBCode(List<OrgGroup__c> frbLevel)
    {
        List<Profit_Center__c> frbCode = new List<Profit_Center__c>();
        List<String> frbCodeList = new List<String>();
        if(frbLevel[0].profit_center_level__c!=null)
        {
            if(frbLevel[0].profit_center_level__c=='4')
            {
                frbCode=[SELECT ERP_Profit_Center_4_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c 
                         and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_4_Code__c);
            }
            if(frbLevel[0].profit_center_level__c=='5')
            {
                frbCode=[SELECT ERP_Profit_Center_5_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c and 
                         ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_5_Code__c);
            }
            if(frbLevel[0].profit_center_level__c=='6')
            {
                frbCode=[SELECT ERP_Profit_Center_6_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c and 
                         ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_6_Code__c != null and 
                         ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_6_Code__c);
            }
            if(frbLevel[0].profit_center_level__c=='7')
            {
                frbCode=[SELECT ERP_Profit_Center_7_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c and 
                         ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_6_Code__c != null and 
                         ERP_Profit_Center_7_Code__c != null and ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_7_Code__c);
            }
            if(frbLevel[0].profit_center_level__c=='8')
            {
                frbCode=[SELECT ERP_Profit_Center_8_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c and 
                         ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_6_Code__c != null and 
                         ERP_Profit_Center_7_Code__c != null and ERP_Profit_Center_8_Code__c != null and ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_8_Code__c);
            }
            if(frbLevel[0].profit_center_level__c=='9')
            {
                frbCode=[SELECT ERP_Profit_Center_9_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c and 
                         ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_6_Code__c != null and ERP_Profit_Center_7_Code__c != null and 
                         ERP_Profit_Center_8_Code__c != null and ERP_Profit_Center_9_Code__c != null and ERP_Profit_Center_4_Code__c != null and 
                         ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_9_Code__c);
            }
            if(frbLevel[0].profit_center_level__c=='10')
            {
                frbCode=[SELECT ERP_Profit_Center_10_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbLevel[0].profit_center_level__c and 
                         ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_6_Code__c != null and ERP_Profit_Center_7_Code__c != null and 
                         ERP_Profit_Center_8_Code__c != null and ERP_Profit_Center_9_Code__c != null and ERP_Profit_Center_10_Code__c != null and ERP_Profit_Center_4_Code__c != null and 
                         ERP_Profit_Center_4__c=:frbLevel[0].Owning_Business__c];
                for(Profit_Center__c pc:frbCode)
                    frbCodeList.add(pc.ERP_Profit_Center_10_Code__c);
            }
        }
        system.debug('frbcodes:'+frbcodelist);
        return frbCodeList;
    }

    public List<String> setFRB(Pricing_Request_Item__c pItem,List<String> FRBCodes,List<OrgGroup__c> phLevel,List<Material__c> MaterialListForFRB)
    {
        List<String> pcCode=new List<String>();
        boolean flag;
        if(phLevel[0].profit_center_level__c!=null)
        {
            if(pItem.Key_Combination__c.contains('Material'))
            {
                for(Material__c mat : materialListForFRB)
                {
                    if(mat.ERP_Material_Code__c == pItem.Material_Code__c)
                    {   
                        for(String pc:FRBCodes)
                        {
                            if(phLevel[0].profit_center_level__c=='4')
                            {   
                                pcCode.add(mat.ERP_Profit_Center_4_Code__c);                            
                            }
                            if(phLevel[0].profit_center_level__c=='5')
                            {
                                pcCode.add(mat.ERP_Profit_Center_5_Code__c);
                            }
                            if(phLevel[0].profit_center_level__c=='6')
                            {
                                pcCode.add(mat.ERP_Profit_Center_6_Code__c);
                            }
                            if(phLevel[0].profit_center_level__c=='7')
                            {
                                pcCode.add(mat.ERP_Profit_Center_7_Code__c);                            
                            }
                            if(phLevel[0].profit_center_level__c=='8')
                            {
                                pcCode.add(mat.ERP_Profit_Center_8_Code__c);                            
                            }
                            if(phLevel[0].profit_center_level__c=='9')
                            {
                                pcCode.add(mat.ERP_Profit_Center_9_Code__c);
                            }
                            if(phLevel[0].profit_center_level__c=='10')
                            {
                                pcCode.add(mat.ERP_Profit_Center_10_Code__c);                           
                            }
                        }
                    }
                }
                flag=true;
            }
            else
            {
                pcCode.addall(FRBCodes);
            }
            if(flag != null && !flag)
            {
                pcCode.addall(FRBCodes);
            }
        }
        system.debug('frbcodes:'+pcCode);
        return pcCode;
    }*/
  //<TJ20140429> Added method for getting approvers for 'Profit Center' Key Field.
  public map<string,list<string>> pcApprover(List<Setup_Object__c> setupObjectList,PA_BU_Admin_Detail__c ad,set<String> setFRB,Integer i,Set<String> routingParameter)
  //public map<string,list<string>> pcApprover(List<Setup_Object__c> setupObjectList,PA_BU_Admin_Detail__c ad,String FRBlevel,Integer i,Set<String> routingParameter)
  {
    boolean flag=false;
    map<String,list<String>> approver=new map<string,list<string>>();
    list<string> aprlist=new list<string>();
    list<string> aprbacklist=new list<string>();
    list<string> othlist=new list<string>();
    list<string> othbacklist=new list<string>();
    list<string> mixlist=new list<string>();
    list<string> mixbacklist=new list<string>();
    approver.put('approverList',aprlist);
    approver.put('approverBackList',aprbacklist);
    approver.put('otherList',othlist);
    approver.put('otherBackList',othbacklist);
    approver.put('mixList',mixlist);
    approver.put('mixBackList',mixbacklist);
    //Start: <GT20140902>
    List<Id> listApprovers = new List<Id>();
    Map<id,id> mapApproverbackup = new map<Id,id>();
    for(Setup_Object__c so : setupObjectList)
    {
      listApprovers.add(so.Approver_Id__c);
      
    }
    for(User u: [select id,delegatedApproverid from user where id in :listApprovers])
    {
      mapApproverbackup.put(u.id,u.delegatedApproverid);
      System.debug('Approver :'+u.id+',Backup approver:'+u.delegatedApproverid);
    }
    //End: <GT20140902>
    if(routingParameter.contains(ad.Routing_Parameter__c) || ad.Routing_Parameter__c == 'Required')
    {
      //system.debug('inside if-5');
      if(setFRB.contains(NULL) || setFRB.size() == 1 || setFRB.isEmpty())
      {
        //system.debug('inside if0');
        for(Setup_Object__c so : setupObjectList){
          //system.debug('setFRB: '+setFRB+'Key Field ID: '+so.Key_Field_Id__c+' '+so.Key_Field__c+' '+ad.Key_Field__c+' '+so.Approver_Role__c+' '+ad.Approver_Role__c);
          if(setFRB.contains(so.Key_Field_Id__c) && setFRB.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c)
          { //system.debug('inside if-1');
            flag = true;
          }
        }  
        for(Setup_Object__c so : setupObjectList)
        {
          if(setFRB != null && setFRB.contains(so.Key_Field_Id__c) && so.Approver_Role__c == ad.Approver_Role__c && setFRB.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && so.Key_Field_Id__c <> NULL)
          {//system.debug('inside if-2');
          if(so.Approver_Id__c!=null)
          {
            aprlist.add(so.Approver_Id__c);
            aprbacklist.add(so.Approver_Backup__c);
            mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), so.Approver_Backup__c);
          }                                         
          }                                     
          else if(flag != null && ((!flag && so.Key_FIeld_Id__c == NULL && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (!flag && !setFRB.contains(so.Key_FIeld_Id__c) && setFRB.size() == 1 && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (flag && setFRB.contains(NULL) && so.Key_FIeld_Id__c == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c)))
          {//system.debug('inside if-3');
          if(so.All_Other_Values__c!=null)
          {
            othlist.add(so.All_Other_Values__c);
            othbacklist.add(so.All_Other_Values_Backup__c);
            mapFinalBackup.put(so.All_Other_Values__c+String.valueOf(i), so.All_Other_Values_Backup__c);
          }
          }                                                                      
        }
        approver.put('approverList',aprlist);
        approver.put('approverBackList',aprbacklist);
        approver.put('otherList',othlist);
        approver.put('otherBackList',othbacklist); 
      }
      else if(setFRB.size()>1)
      {
        for(Setup_Object__c so : setupObjectList)
        {
          if(so.Key_FIeld_Id__c == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c)
          {//system.debug('inside if-4');
          if(so.Mixed_Values__c!=null)
          {
            mixlist.add(so.Mixed_Values__c);
            mixbacklist.add(so.Mixed_Values_Backup__c);
            mapFinalBackup.put(so.Mixed_Values__c+String.valueOf(i), so.Mixed_Values_Backup__c);
          }
          }
        }
        approver.put('mixList',mixlist);
        approver.put('mixBackList',mixbacklist); 
      }
    }
    else if(!routingParameter.contains(ad.Routing_Parameter__c) && (ad.Routing_Parameter__c == 'Below Floor Price'||ad.Routing_Parameter__c == 'Below Reference Price'||ad.Routing_Parameter__c == 'Below Current Price'))
    {
      if(setFRB.contains(NULL) || setFRB.size() == 1 || setFRB.isEmpty())
      {
        //system.debug('inside if');
        for(Setup_Object__c so : setupObjectList){
          if(setFRB.contains(so.Key_Field_Id__c) && setFRB.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c)
          {//system.debug('inside if1'); 
            flag = true;
          }
        }  
        for(Setup_Object__c so : setupObjectList)
        {
          if(setFRB != null && setFRB.contains(so.Key_Field_Id__c) && so.Approver_Role__c == ad.Approver_Role__c && setFRB.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && so.Key_Field_Id__c <> NULL)
          {//system.debug('inside if2');
          if(so.Approver_Id__c!=null)
          {
            aprlist.add(so.Approver_Id__r.name);
            aprbacklist.add(so.Approver_Backup__r.name);
          }
          }                                     
          else if(flag != null && ((!flag && so.Key_FIeld_Id__c == NULL && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (!flag && !setFRB.contains(so.Key_FIeld_Id__c) && setFRB.size() == 1 && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (flag && setFRB.contains(NULL) && so.Key_FIeld_Id__c == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c)))
          {
            if(so.All_Other_Values__c!=null)
            {
              othlist.add(so.All_Other_Values__r.name);
              othbacklist.add(so.All_Other_Values_Backup__r.name);
            }
          }                                                                      
        }
        approver.put('approverList',aprlist);
        approver.put('approverBackList',aprbacklist);
        approver.put('otherList',othlist);
        approver.put('otherBackList',othbacklist); 
      }
      else if(setFRB.size()>1)
      {//system.debug('inside if4');
        for(Setup_Object__c so : setupObjectList)
        {
          if(so.Key_FIeld_Id__c == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c)
          {//system.debug('inside if5');
            if(so.Mixed_Values__c!=null)
            {
              mixlist.add(so.Mixed_Values__r.name);
              mixbacklist.add(so.Mixed_Values_Backup__r.name);
            }
          }
        }
        approver.put('mixList',mixlist);
        approver.put('mixBackList',mixbacklist); 
      }
    }
    //system.debug('approver: '+approver+'flag: '+flag);
    return approver;                            
  }
  //<TJ20140429> END

  public void add() 
  {


  }

  public void save() {
    // TODO Auto-generated method stub

  }


  public void deleteRecord() {
    // TODO Auto-generated method stub

  }


  public String getName()
  {
    return null;
  }


  public String getType() {
    // TODO Auto-generated method stub
    return null;
  }
  public String validate(String desiredAction)
  {
    return null;
  }
  public List<PARelatedList> getListWrappers() {
    List<PARelatedList> clsRList = new List<PARelatedList>();
    return clsRList;
  }
  public List<selectOption> getListOptions() {
    List<selectOption> selectOptionList = new List<selectOption>();
    return selectOptionList;
  }
  public List<sObject> getListBusinessComponents() {
    List<sObject> sObjList = new List<sObject>();
    return sObjList;
  }

  //2.4 This method approves the given record 
  public void approveRequest(Pricing_Request__c pr)
  {
    //system.debug(logginglevel.error,'***In here approve request');
    Approval.ProcessResult result = null;
    List<Id> newWorkItemIds = null;

    // Approve the submitted request
    // First, get the ID of the newly created item
    // Instantiate the new ProcessWorkitemRequest object and populate it
    Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
    req2.setComments(appRejComments);
    req2.setAction('Approve');
    req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
    ProcessInstanceWorkitem newProcess = [Select Id, processinstance.targetobjectid From ProcessInstanceWorkitem where processinstance.targetobjectid = :pr.Id];
    // Use the ID from the newly created item to specify the item to be worked
    req2.setWorkitemId(newProcess.Id);
    result = Approval.process(req2);
    newWorkItemIds = result.getNewWorkitemIds(); 

    querytoPricingRequest(pr.Id);

    //1.1 start ----added by Prachi - 22nd feb - to change the project status to 'Approved' when pricing request status is approved 
    //added by anand on 19 FEB
    if(pr.Pricing_Request_Type__c=='Project Pricing' && request <> NULL)//Need to be discussed UD ANAND
    {
      request.pricingRequestId=pr.Id;
    }
  }

  @TestVisible private Id returnBuAdminId(Pricing_Request__c pr,List<OrgGroup__c> OrgGroupList) // Test Class coverage CRM-2021-04-0192
  {
    Id returnId;
    for(OrgGroup__c orgGrp:OrgGroupList)
    {
      if(orgGrp.Business__c.equalsIgnoreCase(pr.BU__c))
      {
        returnId =  orgGrp.OwnerId;
      }
    }
    return returnId;
  }
  public boolean checkForExpiryReqItems(Set<String> pckcset)
  {
    if(pckcset.size() > 0)
    {
      //<PP20140929>
      List<Pricing_Request_Item__c> priExpiredPCKCNewList = [SELECT Id FROM Pricing_Request_Item__c WHERE External_ERP_Id__c IN :pckcset
                                                             AND Pricing_Request__r.Request_Approval_Status__c != 'Approved' AND
                                                             Pricing_Request__r.Request_Approval_Status__c != 'Abandoned' AND
                                                             Pricing_Request__r.Request_Approval_Status__c != 'Requested' AND
                                                             Pricing_Request__r.Request_Approval_Status__c != 'Cancelled'];
      if(priExpiredPCKCNewList != null && priExpiredPCKCNewList.size() > pckcset.size())
        return true;
      else
        return false;
    }
    else
      return false;
  }
  
  //<TJ20150105> Added null checks for keyFieldSet
  @testvisible private map<String,list<String>> populateKeyFieldApprovers(Set<String> routingParameter,PA_BU_Admin_Detail__c ad,Set<String> keyFieldSet,List<Setup_Object__c> setupObjectList,boolean notgenAppFlag,
      list<Id> listMultipleUser,list<id> listMultipleBackup,list<String> listAutoApproverUser,list<String> listAutoApproverBackup,Integer i,String keyField,
      Map<id,id> mapApproverbackup,boolean keyfieldfromPRflag,Pricing_Request__c pricingRequest){
    map<String,list<String>> approverlist = new map<String,list<String>>();
    String fieldValue = '';
    String idValue = '';
    list<String> levelNR = new list<String>();
  //  System.debug('Backup approvers:'+mapApproverbackup);
   // system.debug('inside populateKeyFieldApprovers, routingParameter is '+routingParameter);
   // system.debug('inside populateKeyFieldApprovers, ad is '+ad);
   // system.debug('inside populateKeyFieldApprovers, keyFieldSet is '+keyFieldSet);
    //system.debug('inside populateKeyFieldApprovers, setupObjectList is '+setupObjectList);
    // system.debug('inside populateKeyFieldApprovers, notgenAppFlag is '+notgenAppFlag);
   // system.debug('inside populateKeyFieldApprovers, listMultipleUser is '+listMultipleUser);
   // system.debug('inside populateKeyFieldApprovers, listMultipleBackup is '+listMultipleBackup);
   // system.debug('inside populateKeyFieldApprovers, listAutoApproverUser is '+listAutoApproverUser);
   // system.debug('inside populateKeyFieldApprovers, listAutoApproverBackup is '+listAutoApproverBackup);
   // system.debug('inside populateKeyFieldApprovers, i is '+i);
   // system.debug('inside populateKeyFieldApprovers, keyField is '+keyField);
   // system.debug('inside populateKeyFieldApprovers, mapApproverbackup is '+mapApproverbackup);
   // system.debug('inside populateKeyFieldApprovers, keyfieldfromPRflag is '+keyfieldfromPRflag);
    //system.debug('inside populateKeyFieldApprovers, pricingRequest is '+pricingRequest);
    //VK20210215 START
    //VK20210302 START
    List<Pricing_Request_Item__c> pricingRequestItemsList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PAApprovalWF', 'pricingRequestItemsList', ' Pricing_Request__c =\''+request.pricingRequest.Id+'\'');  
    setPH = new Set<String>();
          if(ad.Key_Field__c.contains('PH')) {
            for(Pricing_Request_Item__c pItem: pricingRequestItemsList){
                            Map<Integer, String> mapPHList = new Map<Integer, String>();
                            mapPHcodeList = new Map<Integer, String>();
                            

                            mapPHcodeList.put(1,pItem.PH1_Code__c);
                            mapPHcodeList.put(2,pItem.PH2_Code__c);
                            mapPHcodeList.put(3,pItem.PH3_Code__c);
                            mapPHcodeList.put(4,pItem.PH4_Code__c);
                            mapPHcodeList.put(5,pItem.PH5_Code__c);
                            mapPHcodeList.put(6,pItem.PH6_Code__c);
                            mapPHcodeList.put(7,pItem.PH7_Code__c);
                            mapPHcodeList.put(8,pItem.PH8_Code__c);
                            mapPHcodeList.put(9,pItem.PH9_Code__c);
                
                            if(pItem.Key_Combination__c.contains('PH')) 
                            {
                                    Integer phnum = integer.valueOf((ad.Key_Field__c.substring(2,3)));
                                     string str1 = '';
                                     for(integer j =1; j<=phnum; j++)
                                       {         
                                          if(mapPHcodeList.get(j)<> NULL)
                                           {
                                            str1 = str1+mapPHcodeList.get(j);
                                            
                                           }
                                       }
                                     setPH.add(str1);
                                   }
                            }
          }
    //VK20210215 END
    //VK20210302 END
    if(routingParameter.contains(ad.Routing_Parameter__c) || ad.Routing_Parameter__c == 'Required'){
      if(keyFieldSet==null || keyFieldSet.isEmpty()|| keyFieldSet.contains(NULL) || keyFieldSet.size() == 1 ){
        for(Setup_Object__c so : setupObjectList){
          if(keyField.equalsIgnoreCase('Sales Office') || keyField.equalsIgnoreCase('Country'))
            fieldValue = so.Key_Field_Value__c;
          //Piyush <PG20191211> Start
          if(keyField.equalsIgnoreCase('Sales Org') || keyField.equalsIgnoreCase('Sales Reduction') || keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment')
              || keyField.containsIgnoreCase('PH') ||  keyField.containsIgnoreCase('FRB')|| keyField.equalsIgnoreCase('Reason Code'))
           //Piyush <PG20191211> End 
            fieldValue = so.Key_Field_ID__c;
          if(((keyFieldSet!=null && keyFieldSet.contains(fieldValue) && keyFieldSet.size() == 1) || setPH!=null && setPH.contains(fieldvalue)) 
              && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c){ 
            notgenAppFlag = true;
          }
          if(keyField.equalsIgnoreCase('Country')){
            if((keyFieldSet==null || keyFieldSet.contains(NULL) || keyFieldSet.isEmpty())&&request.pricingRequest.country__c <> NULL
                && request.pricingRequest.country__c == so.Key_Field_Value__c && so.Approver_Role__c == ad.Approver_Role__c  
                && so.Key_Field__c == ad.Key_Field__c && so.Key_Field_Value__c <> NULL
                ){
              keyfieldfromPRflag = true;
            }
          }
        }    


        for(Setup_Object__c so : setupObjectList){
            system.debug('Iteration 4: '+so);
          Boolean matchedapproverlist = false;
          long currentsr;
          if(so.Key_Field__c=='Sales Reduction' && ad.Key_Field__c=='Sales Reduction'){
            String[] splitkeyfieldid = so.Key_Field_Id__c.split('-');
            Set<String> splitkeyfieldSet = new Set<String>();
            splitkeyfieldSet.addAll(splitkeyfieldid);
            
            if(request.totalSalesReduction != null){ // Null Check for test class coverage - CRM-2021-04-0192
            currentsr = Math.RoundToLong(request.totalSalesReduction);
            }

            if(splitkeyfieldid[1] != null){ // Null Check for test class coverage - CRM-2021-04-0192
                if(splitkeyfieldid[1].contains('greater')){
                long srlevel1 = long.valueOf(splitkeyfieldid[0].trim());
                if(currentsr > srlevel1 ) 
                    matchedapproverlist = true;
                }
            }   
            else{
              long srlevel1 = long.valueOf(splitkeyfieldid[0].trim());
              long srlevel2 = long.valueOf(splitkeyfieldid[1].trim());
              if( (currentsr > srlevel1) && (currentsr <= srlevel2) || (srlevel1==0 && currentsr<=0))  
                matchedapproverlist = true; 
            }
          }

          if(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')){
            levelNR.add(ad.Approval_Level__c);
          }
          if(keyField.equalsIgnoreCase('Sales Office') || keyField.equalsIgnoreCase('Country'))
            fieldValue = so.Key_Field_Value__c;
          //Piyush <PG20191211> Start
            if(keyField.equalsIgnoreCase('Sales Org') || keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment')
              || keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB')|| keyField.equalsIgnoreCase('Reason Code'))
            //Piyush <PG20191211> End
                fieldValue = so.Key_Field_ID__c;
            System.debug('PG 7777777  fieldValue '+fieldValue);
          if(keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB')){
            idValue = so.Key_Field_ID__c;
          }else{
            idValue = so.Key_Field_Value__c;
          }
          //System.debug('***if condition values '+' **keyFieldSet.size() == 1 '+keyFieldSet.size()+' **idValue  '+idValue+ so.Approver_Name__c +' ***keyFieldSet '+keyFieldSet+' **fieldValue '+fieldValue+' ***keyFieldSet.contains(fieldValue) '+keyFieldSet.contains(fieldValue));
          //System.debug('***if condition values1  **boolean '+!(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))+' **ad.Key_Field__c '+ad.Key_Field__c+  ' **bool '+keyFieldSet!=null +' **matchrole '+ so.Approver_Role__c + ad.Approver_Role__c +' **matchkeyfield '+ so.Key_Field__c + ad.Key_Field__c);
          
          if(ad.Key_Field__c!='Sales Reduction' && keyFieldSet!=null && keyFieldSet.contains(fieldValue)  && so.Approver_Role__c == ad.Approver_Role__c && keyFieldSet.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && idValue <> NULL && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
                system.debug('inside condition1 of '+fieldValue);
                listMultipleUser.add(so.Approver_Id__c);  
                if(keyField.equalsIgnoreCase('Customer Group 2'))
                  listMultipleBackup.add(so.Mixed_Values_Backup__c);
                else     
                  listMultipleBackup.add(so.Approver_Backup__c);
                //Piyush <PG20191211> Start
                  if(!(keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment') || keyField.equalsIgnoreCase('Country')
                    || keyField.containsIgnoreCase('PH')))  
                //Piyush <PG20191211> End
                  { 
                  system.debug('Approver:'+so.Approver_Id__c+String.valueOf(i)+','+mapApproverbackup.get(so.Approver_Id__c));
                  mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), mapApproverbackup.get(so.Approver_Id__c));
                }
                else 
                {
                  system.debug('Approver:'+so.Approver_Id__c+String.valueOf(i)+','+mapApproverbackup.get(so.Approver_Id__c));   
                  mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), mapApproverbackup.get(so.Approver_Id__c));                                      
                }
             }
          //VK20210215 START
          else if(keyField.containsIgnoreCase('PH') && setPH.contains(so.key_Field_Id__c) && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
          {    
            listMultipleUser.add(so.Approver_Id__c);
            listMultipleBackup.add(so.Approver_Backup__c);
            mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), mapApproverbackup.get(so.Approver_Id__c));
    
          }
          //VK20210215 END
          else if(ad.Key_Field__c!='Sales Reduction' && (keyField.equalsIgnoreCase('Country')) && ((keyFieldSet==null || keyFieldSet.contains(NULL) || keyFieldSet.isEmpty())&&request.pricingRequest.country__c <> NULL
              && request.pricingRequest.country__c == so.Key_Field_Value__c && so.Approver_Role__c == ad.Approver_Role__c  
              && so.Key_Field__c == ad.Key_Field__c && so.Key_Field_Value__c <> NULL && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')))){
            system.debug('inside condition2 of '+fieldValue);
            listMultipleUser.add(so.Approver_Id__c);
            listMultipleBackup.add(so.Approver_Backup__c);
            mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), mapApproverbackup.get(so.Approver_Id__c));
          }

          else if(ad.Key_Field__c!='Sales Reduction' && (keyField.equalsIgnoreCase('Country')) && (!keyfieldfromPRflag && (!notgenAppFlag && so.Key_Field_Value__c == NULL  && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c )
              || (!notgenAppFlag && !keyFieldSet.contains(so.Key_Field_Value__c) && keyFieldSet.size() == 1 && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (!keyfieldfromPRflag && notgenAppFlag && keyFieldSet.contains(NULL) && so.Key_Field_Value__c == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c
              && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))))){
            system.debug('inside condition3 of '+fieldValue);
            listMultipleUser.add(so.All_Other_Values__c);
            listMultipleBackup.add(so.All_Other_Values_Backup__c);
            mapFinalBackup.put(so.All_Other_Values__c+String.valueOf(i), mapApproverbackup.get(so.All_Other_Values__c));
          }
          else if(ad.Key_Field__c!='Sales Reduction' && !(keyField.equalsIgnoreCase('Country')) && ((!notgenAppFlag && idValue == NULL && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (!notgenAppFlag && keyFieldSet!=null && !keyFieldSet.contains(fieldValue) && keyFieldSet.size()== 1 && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (notgenAppFlag && (keyFieldSet==null || keyFieldSet.contains(NULL)) && idValue == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c
              && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))))){   
            System.debug(!keyField.equalsIgnoreCase('Country')+'-'+ !notgenAppFlag +'-'+(idValue == NULL) +'-'+(so.Approver_Role__c == ad.Approver_Role__c) +'-'+(so.Key_Field__c == ad.Key_Field__c));
            system.debug('inside condition4 of '+fieldValue);
                listMultipleUser.add(so.All_Other_Values__c);    
                listMultipleBackup.add(so.All_Other_Values_Backup__c);
                if(!(keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment')
                    || keyField.containsIgnoreCase('PH')) )
                  mapFinalBackup.put(so.All_Other_Values__c+String.valueOf(i), mapApproverbackup.get(so.All_Other_Values__c));
                else
                  mapFinalBackup.put(so.All_Other_Values__c+String.valueOf(i), mapApproverbackup.get(so.All_Other_Values__c));
            //}
}
          //Piyush <PG20191211> End
          else if(ad.Key_Field__c=='Sales Reduction' && matchedapproverlist && keyFieldSet!=null && so.Approver_Role__c == ad.Approver_Role__c && keyFieldSet.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && idValue <> NULL && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
            listMultipleUser.add(so.Approver_Id__c);
            listMultipleBackup.add(so.Approver_Backup__c);
            mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), mapApproverbackup.get(so.Approver_Id__c));
          } 
        }
      }
      else if(keyFieldSet.size()>1){
          //<AS20210428> started
            Set<Id> setApproverIds1 = new Set<Id>();
             Set<Id> setbackupApproverIds1 = new Set<Id>();
             list<Id> allapproverlist = new list<Id>();
             list<Id> allapproverbackuplist = new list<Id>();
             list<Id> allmixedapproverlist = new list<Id>();
             list<Id> allmixedapproverbackuplist = new list<Id>();
             
             for(Setup_Object__c so : setupObjectList){
            
          if(keyField.containsIgnoreCase('PH')|| keyField.containsIgnoreCase('material')){
                 idValue = so.Key_Field_ID__c;
              
            if(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')){
                  levelNR.add(ad.Approval_Level__c);}
              
             if(idValue <> NULL && so.Key_Field__c == ad.Key_Field__c && keyFieldSet.contains(so.Key_Field_Id__c) && so.Approver_Role__c == ad.Approver_Role__c && 
             !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
                 
               setApproverIds1.add(so.Approver_Id__c);
               setbackupApproverIds1.add(so.Approver_Backup__c);
                
               if(!allapproverlist.contains(so.Approver_Id__c))
               
              { 
                  allapproverlist.add(so.Approver_Id__c);
                allapproverbackuplist.add(so.Approver_Backup__c);
                
                }
                
                
                }
              else{
                    if(idValue == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
                allmixedapproverlist.add(so.Mixed_Values__c);
                allmixedapproverbackuplist.add(so.Mixed_Values_Backup__c);
           }
            }
            
          }//<AS20210428> end
     else
        {
          if( keyField.containsIgnoreCase('FRB')){
            idValue = so.Key_Field_ID__c;
          }else{
            idValue = so.Key_Field_Value__c;
          }
          if(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')){
            levelNR.add(ad.Approval_Level__c);
          }
            
          if(idValue == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
              listMultipleUser.add(so.Mixed_Values__c);
                listMultipleBackup.add(so.Mixed_Values_Backup__c);
              //Piyush <PG20191211> Start  
              if(!(keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment') || keyField.equalsIgnoreCase('Country')
                    || keyField.containsIgnoreCase('PH')))
                  mapFinalBackup.put(so.Mixed_Values__c+String.valueOf(i), mapApproverbackup.get(so.Mixed_Values__c));               
              else
                  mapFinalBackup.put(so.Mixed_Values__c+String.valueOf(i), mapApproverbackup.get(so.Mixed_Values__c));
             }
          }
        }
         // <AS20210428> started
if(keyField.containsIgnoreCase('PH')|| keyField.containsIgnoreCase('material')){
if(setApproverIds1.size()<=1 && allapproverlist.size()>=1){
listMultipleUser.add(allapproverlist.get(0));
listMultipleBackup.add(allapproverbackuplist.get(0));
}
else if(allmixedapproverlist.size()>=1){
listMultipleUser.add(allmixedapproverlist.get(0));
listMultipleBackup.add(allmixedapproverbackuplist.get(0));//<AS20210428>end

}
}
        }
    }//
    else if(!routingParameter.contains(ad.Routing_Parameter__c) && (ad.Routing_Parameter__c == 'Below Floor Price'||ad.Routing_Parameter__c == 'Below Reference Price'||ad.Routing_Parameter__c == 'Below Current Price')){
      if(keyFieldSet==null||keyFieldSet.contains(NULL) || keyFieldSet.size() == 1 || keyFieldSet.isEmpty()){
        for(Setup_Object__c so : setupObjectList){
          if(keyField.equalsIgnoreCase('Sales Office') || keyField.equalsIgnoreCase('Country'))
            fieldValue = so.Key_Field_Value__c;
          if(keyField.equalsIgnoreCase('Sales Org') || keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment')
              || keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB'))
            fieldValue = so.Key_Field_ID__c;
          if(((keyFieldSet!=null && keyFieldSet.contains(fieldValue) && keyFieldSet.size() == 1) || setPH!=null && setPH.contains(fieldvalue)) 
              && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c){ 
            notgenAppFlag = true;
          }
        //Piyush <PG20191211> End
          if(keyField.equalsIgnoreCase('Country')){
            if((keyFieldSet==null || keyFieldSet.contains(NULL) || keyFieldSet.isEmpty())&&request.pricingRequest.country__c <> NULL
                && request.pricingRequest.country__c == so.Key_Field_Value__c && so.Approver_Role__c == ad.Approver_Role__c  
                && so.Key_Field__c == ad.Key_Field__c && so.Key_Field_Value__c <> NULL
                ){
              keyfieldfromPRflag = true;
            }
          }
        }  
        for(Setup_Object__c so : setupObjectList){
          if(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')){
            levelNR.add(ad.Approval_Level__c);
          }
          if(keyField.equalsIgnoreCase('Sales Office') || keyField.equalsIgnoreCase('Country'))
            fieldValue = so.Key_Field_Value__c;
          if(keyField.equalsIgnoreCase('Sales Org') || keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment')
              || keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB'))
            fieldValue = so.Key_Field_ID__c;
          if(keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB')){
            idValue = so.Key_Field_ID__c;
          }else{
            idValue = so.Key_Field_Value__c;
          } 
          if(keyFieldSet!=null && (keyFieldSet.contains(fieldValue)) && so.Approver_Role__c == ad.Approver_Role__c && keyFieldSet.size() == 1 
              && so.Key_Field__c == ad.Key_Field__c && idValue <> NULL && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
            listAutoApproverUser.add(so.Approver_Id__r.name);   
            if(keyField.equalsIgnoreCase('Customer Group 2'))
              listAutoApproverBackup.add(so.Mixed_Values_Backup__r.name);
            else    
              listAutoApproverBackup.add(so.Approver_Backup__r.name);   
          }
          
          else if((keyField.equalsIgnoreCase('Country')) && ((keyFieldSet.contains(NULL) || keyFieldSet.isEmpty())&&request.pricingRequest.country__c <> NULL
              && request.pricingRequest.country__c == so.Key_Field_Value__c && so.Approver_Role__c == ad.Approver_Role__c  
              && so.Key_Field__c == ad.Key_Field__c && so.Key_Field_Value__c <> NULL 
              && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')))){
            listAutoApproverUser.add(so.Approver_Id__r.name);
            listAutoApproverBackup.add(so.Approver_Backup__r.name);
          }
          //VK20210215 START
          else if(keyField.containsIgnoreCase('PH') && notgenAppFlag && so.Approver_Role__c == ad.Approver_Role__c && setPH.contains(so.key_Field_Id__c) && so.Key_Field__c == ad.Key_Field__c)
          {   
            
            listAutoApproverUser.add(so.Approver_Id__r.name);
            listAutoApproverBackup.add(so.Approver_Backup__r.name);
            mapFinalBackup.put(so.Approver_Id__c+String.valueOf(i), mapApproverbackup.get(so.Approver_Id__c));
          }
          //VK20210215 END
          else if((keyField.equalsIgnoreCase('Country')) && (!keyfieldfromPRflag && (!notgenAppFlag && so.Key_Field_Value__c == NULL  && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c )
              || (!notgenAppFlag && !keyFieldSet.contains(so.Key_Field_Value__c) && keyFieldSet.size() == 1 && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (!keyfieldfromPRflag && notgenAppFlag && keyFieldSet.contains(NULL) && so.Key_Field_Value__c == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c
              && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))))){
            listAutoApproverUser.add(so.All_Other_Values__r.name);
            listAutoApproverBackup.add(so.All_Other_Values_Backup__r.name);
          }
          
          else if(!(keyField.equalsIgnoreCase('Country')) && ((!notgenAppFlag && idValue == NULL && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (!notgenAppFlag && keyFieldSet!=null && !keyFieldSet.contains(fieldValue) && keyFieldSet.size()== 1 && so.Approver_Role__c == ad.Approver_Role__c && so.Key_Field__c == ad.Key_Field__c)
              || (notgenAppFlag && keyFieldSet==null && keyFieldSet.contains(NULL) && idValue == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c
              && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))))){      
            listAutoApproverUser.add(so.All_Other_Values__r.name);
            listAutoApproverBackup.add(so.All_Other_Values_Backup__r.name);
          }
          
        } 
      }
      else if(keyFieldSet.size()>1){
          //<RB20210816>
          List<String> listApprover = new List<String>();
          List<String> listBackupApprover = new List<String>();
          list<String> allMixedApprover = new list<String>();
          list<String> allMixedApproverBackup = new list<String>();
          //<RB20210816>
        for(Setup_Object__c so : setupObjectList){
          if(keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB')){
            idValue = so.Key_Field_ID__c;
          }else{
            idValue = so.Key_Field_Value__c;
          }
          if(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required')){
            levelNR.add(ad.Approval_Level__c);
          }
           //<RB20210816>
          if(idValue <> NULL && so.Key_Field__c == ad.Key_Field__c && keyFieldSet.contains(so.Key_Field_Id__c) && 
             so.Approver_Role__c == ad.Approver_Role__c && 
             !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
                  
                 if(!listApprover.contains(so.Approver_Id__r.name))
               
                { 
                  listApprover.add(so.Approver_Id__r.name);
                  listBackupApprover.add(so.Approver_Backup__r.name);
                
                }
            }
          //<RB20210816>  
          if(idValue == NULL && so.Key_Field__c == ad.Key_Field__c && so.Approver_Role__c == ad.Approver_Role__c  && !(so.Approver_Name__c != null && so.Approver_Name__c.contains('Not Required'))){
            //<RB20210816>
                allMixedApprover.add(so.Mixed_Values__r.name);
                allMixedApproverBackup.add(so.Mixed_Values_Backup__r.name);
            //<RB20210816>
              //listAutoApproverUser.add(so.Mixed_Values__r.name);
              //listAutoApproverBackup.add(so.Mixed_Values_Backup__r.name);
            //Piyush <PG20191211> Start
              if(!(keyField.equalsIgnoreCase('End Use') || keyField.equalsIgnoreCase('Customer Group 2') || keyField.equalsIgnoreCase('Customer Group 4') || keyField.equalsIgnoreCase('Market Segment') || keyField.equalsIgnoreCase('Country')
                || keyField.containsIgnoreCase('PH') || keyField.containsIgnoreCase('FRB')))
              mapFinalBackup.put(so.Mixed_Values__c+String.valueOf(i), mapApproverbackup.get(so.Mixed_Values__c));
              //Piyush <PG20191211> End
            if(keyField.equalsIgnoreCase('Country'))
              mapFinalBackup.put(so.Mixed_Values__c+String.valueOf(i), mapApproverbackup.get(so.Mixed_Values__c));    
          }
        }
         //<RB20210816>
            if(listApprover.size()==1){
                listAutoApproverUser.add(listApprover.get(0));
                listAutoApproverBackup.add(listBackupApprover.get(0));
            }
            else if(allMixedApprover.size()>=1){
                listAutoApproverUser.add(allMixedApprover.get(0));
                listAutoApproverBackup.add(allMixedApproverBackup.get(0));
            }
        //<RB20210816>
      }
    }
    System.debug('mapFinalBackup:'+mapFinalBackup);
    if(listMultipleUser != null && listMultipleUser.size()>0)
   approverlist.put('multipleUser',listMultipleUser);
    else
    approverlist.put('multipleUser',new list<String>());
    if(listMultipleBackup != null && listMultipleBackup.size()>0)
    approverlist.put('multipleBackup',listMultipleBackup);
    else
    approverlist.put('multipleBackup',new list<String>());
    if(listAutoApproverUser != null && listAutoApproverUser.size()>0)   
    approverlist.put('approverUser',listAutoApproverUser);
    else
    approverlist.put('approverUser',new list<String>());
    if(listAutoApproverBackup != null && listAutoApproverBackup.size()>0)           
     approverlist.put('approverBackup',listAutoApproverBackup);
    else
      approverlist.put('approverBackup',new list<String>());
    if(levelNR != null && levelNR.size()>0)
      approverlist.put('levelNR',levelNR);
    else
      approverlist.put('levelNR',new list<String>());     
    return approverlist;                                        
  }
  //<MS20141211> Refactored code to assign to backup or buAdmin
  @TestVisible
  private String modifyApprover(Map<Id,User> userAvailabilityMap,Map<String,String> mapBackApp,Map<String,String> mapApp,String CurrLevel,String buAdminId)
  {
    if(userAvailabilityMap.get(mapApp.get(CurrLevel))!=null ){
      if(userAvailabilityMap.get(mapApp.get(CurrLevel)).out_of_office__c==true && 
          (userAvailabilityMap.get(mapApp.get(CurrLevel)).out_of_Office_start_date__c<=System.today()
          &&userAvailabilityMap.get(mapApp.get(CurrLevel)).out_of_Office_End_date__c>=System.today()))
      { 
        //move it to backup approver 
        //Version 3.1
        // request.pricingRequest.Sent_to_Backup_Approver__c = true;
        if(!String.isBlank(String.valueOf(mapBackApp.get(CurrLevel))) && userAvailabilityMap.get(mapBackApp.get(CurrLevel))!=null &&
            userAvailabilityMap.get(mapBackApp.get(CurrLevel)).out_of_office__c==true && 
            (userAvailabilityMap.get(mapBackApp.get(CurrLevel)).out_of_Office_start_date__c<=System.today()
            &&userAvailabilityMap.get(mapBackApp.get(CurrLevel)).out_of_Office_End_date__c>=System.today()))
        {
          //Assign to BU Admin
          //Id buAdminId = returnBuAdminId(request.pricingRequest,orgGroupObjList);
          if(!String.isBlank(String.valueOf(buAdminId)) && userAvailabilityMap.get(buAdminId)!=null)
            return buAdminId;
        }
        else
          return mapBackApp.get(CurrLevel);
      }
    }
    return mapApp.get(CurrLevel);
  }
}