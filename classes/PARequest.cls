/**************************************************************************************************************
 ***********************************************Modification Log************************************************
<PP20130422>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 Apr 2013
Description         :   Added logic to populate 'Display Standardized Rate' into Pricing Request from
                        Organizational Group Item - APAC ROLLOUT1(4.18)
 *****************************************************************************************************************                       
<BR20130422>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   22 Apr 2013
Description         :   Added logic to populate 'Attachment on Customer Prices' into Pricing Request from
                        Organizational Group Item - APAC ROLLOUT1(4.19) 
 *****************************************************************************************************************                                               
<PS20130425>
Last Modified By    :   Prachi Sinha
Last Modified Date  :   25 Apr 2013
Description         :   Adding Customer Group 2 in customer queries - APAC ROLLOUT1(4.20)                               
 *****************************************************************************************************************
<VR20130509>
Last Modified By    :   Vinoth
Last Modified Date  :   9 May 2013
Description         :   Adding Logic for extra Key field Customer Hierarchy - APAC ROLLOUT1(4.21)
 *****************************************************************************************************************
<PP20130612>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   12 June 2013
Description         :   SIT Issue # 75 FIX - Adding sorting logic for Request Reasons - APAC ROLLOUT1(4.22)
 *****************************************************************************************************************
<PP20130613>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   13 June 2013
Description         :   SIT Issue # 91 FIX - Adding logic to display On Behalf Of on click of 'Edit Header'
                         - APAC ROLLOUT1(4.23)                               
 *****************************************************************************************************************
<UD20130726>
Last Modified By    :   Utkarsh
Last Modified Date  :   26 July 2013
Description         :   Production Issue, request status changing to Draft from Submitted/Recalled/Rejected
                        -(4.24)                               
 *****************************************************************************************************************
<BB20130626>
Last Modified By    :   Bisnupriya Budek 
Last Modified Date  :   26 June 2013
Description         :   Added logic to populate 'Standardized Currency' and 'Standardized UoM' into Pricing Request from
                        Organizational Group Item - APAC ROLLOUT2(4.24)
 *****************************************************************************************************************
<PP20130711>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   11 July 2013
Description         :   Added 'Request_Class__c' fields to Pricing Request queries  and 'Enable_Request_Class__c',
                        'Request_Class__c' in Org Group Item - APAC ROLLOUT2(4.25)
 *****************************************************************************************************************
<PP20130715>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 July 2013
Description         :   Added mandatory validation for Request Class in New Request Page - APAC ROLLOUT2(4.26)
 *****************************************************************************************************************
<BR20130719>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   19 July 2013
Description         :   To View the customer Prices based on customercode APAC ROLL OUT 2(4.27)
 *****************************************************************************************************************
<BR20130625>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   25 June 2013
Description         :   Pricing Exception APAC ROLL OUT 2(4.28)
 *****************************************************************************************************************
<VR20130718>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   18 Jul 2013
Description         :   Adding Logic for Creation of Floor and Reference Prices - APAC ROLLOUT2(4.31)
 *****************************************************************************************************************
<UD20130827>
Last Modified By     :      Utkarsh Dixit
Last Modified Date   :      27 aug 2013
Description          :      Production Issue: Issue #IS ID-00035105. Added Display_Standardized_rate__c in Org groupitems queries Line 1010 
 *****************************************************************************************************************
<NE20130409>
Last Modified By     :      Neeharika
Last Modified Date   :      4th Sept 2013
Description          :      New requirement for Landing Cost
 *****************************************************************************************************************
<NS20130821>
Last Modified By    :   Neeharika
Last Modified Date  :   21 Aug 2013
Description         :   1)Added 'Landing_Cost__c' fields to queries
 *****************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added incotermsFilter for adding KC fields APAC ROLL OUT 2(4.32)
 *****************************************************************************************************************
<NP20131018>
Last Modified By    :   Neeharika
Last Modified Date  :   18 October 2013
Description         :   Changed query for requests shown under Approved link - ROLLOUT2
 *****************************************************************************************************************
<PP20131028>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   28 October 2013
Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
 **********************************************************************************************************************
<VR20131111>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   11 November 2013
Description         :   DTT Rollout Issue - Changing the if condition to include only spot
 **********************************************************************************************************************
<PP20131115>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 November 2013
Description         :   DTT Rollout Issue - Changing daysbetween/30 to monthsBetween because validation is not working
                                                properly
 **********************************************************************************************************************
<VR20131218>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   18 December 2013
Description         :   DTT Rollout Issue - Making the list null before fetching the record
 **********************************************************************************************************************
<PP20140218>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   18 February 2014
Description         :   CAPITAL PROJECT - Customer Prices list views for CSRs
 **********************************************************************************************************************
<BB20140321>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   21 March 2014
Description         :   Added Auto_Approver Fields in the all the  Pricing_Request__c query
 **********************************************************************************************************************
<BB20140404>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   04 April 2014
Description         :   CAPITAL PROJECT -1.Added logic for cloning a request when the desiredaction is ?Clone? 
                                         2.Added query and logic to fetch the latest values of Customer on customer 
                                         header section of clone Request.   
 **********************************************************************************************************************
<AV20140408>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   08 April 2014
Description         :   CAPITAL PROJECT -1.Added a boolean flag for clone request. 
                                         2.Added logic to validate compatibilty between on behalf of and sold to compatibilty for clone request.
                                         3.Added logic for making validity date fields in clone req as blank.
 **********************************************************************************************************************
<PP20140421>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   21 April 2014
Description         :   CAPITAL PROJECT - Retrieve default value for Current Prices load
 ***********************************************************************************************************************
<TJ20140422>
Last Modified By    :   Tarun Jain
Last Modified Date  :   22 April 2014
Description         :   Retrieve Customer Record ID to display customer details.
 *****************************************************************************************************************
<MS20140424>
Last Modified By    :   Mohit Sinha
Last Modified Date  :   24 April 2014
Description         : Populating Approval_Escalation_Pricing_Task__c and Approval_Escalation_Duration__c
 ************************************************************************************************************************
<BB20140429>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   29 April 2014
Description         :   CAPITAL PROJECT -1.Added Default_Currency__c Fields in the all the  Pricing_Request__c query 
                                         2.Added logic to populate the Default Currency in Request based on the the Default
                                          Currency selected in Org group item
 **********************************************************************************************************************
<PP20140502>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   2 May 2014
Description         :   CAPITAL PROJECT - Navigate to 'Customer Requests' page on click of 'Request Overview' 
 **********************************************************************************************************************
<TJ20140505>
Last Modified By    :   Tarun
Last Modified Date  :   05 May 2014
Description         :   Set Newpagelabel to PAHome for Landing Page Link
 ******************************************************************************************************************
<BB20140508>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   08 May 2014
Description         :   CAPITAL PROJECT -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in all the ERP_Customer queries. 
 **********************************************************************************************************************
<BB20140508>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   08 May 2014
Description         :   CAPITAL PROJECT -Added Sales_Type_Code__c,Sales_Type__c in all the Pricing_Request_item__c queries. 
 **********************************************************************************************************************
<MS20140514>
Last Modified By    :   Mohit Sinha
Last Modified Date  :   14 May 2014
Description         :   Added strings for variant and sales order type filters
 ******************************************************************************************************************
<AV20140515>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   15 May 2014
Description         :   Added Sales_Volume_Enable__c field in query of pricingRequest
 ******************************************************************************************************************
<BB20140516>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   16 May 2014
Description         :   CAPITAL PROJECT -Added logic for Request History to display all the requests created in tha past 1 year. 
 **********************************************************************************************************************
<JM20140517>
Last Modified By    :   Jawahar 
Last Modified Date  :   17 May 2014
Description         :   Added Volume Header in Column generate function for export prices. 
 **********************************************************************************************************************
<TJ20140522>
Last Modified By    :   Tarun 
Last Modified Date  :   22 May 2014
Description         :   Added count of tables on PACurrentPrices screen
 ******************************************************************************************************************
<BB20140523>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   23 May 2014
Description         :   CAPITAL PROJECT -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in all the Pricing_Request__c queries and populated it . 
 **********************************************************************************************************************
<SP20140527>
Last Modified By    :   Shiva
Last Modified Date  :   27 May 2014
Description         :   CAPITAL PROJECT -  Defaulting SalesArea in NCS/Massive/Export/Import flow if the list returns only one row
 **********************************************************************************************************************
 <HL20140904>
Last Modified By    :   Hema Latha
Last Modified Date  :   05 Sep 2014
Description         :   Added method getUpdatedPricingRequest to refresh NPC status
 **********************************************************************************************************************
 <PR20140905>
Last Modified By    :   Priyanka R
Last Modified Date  :   05 Sep 2014
Description         :   Added check if no sales rep is selected from view customer prices
 ******************************************************************************************************************
<GT20140909>
Last Modified By    :   George Thomas
Last Modified Date  :   09 Sep 2014
Description         :   Added method to show the count of pending approval requests for selected Business
 ******************************************************************************************************************
<PR201451029> 
Last Modified By    :   Priyanka R
Last Modified Date  :   29 Oct 2014
Description         :   Added fix for List index out of bounds error on click of fetch records
 ******************************************************************************************************************
 
<VL20160222>
Last Modified By    :   Vijay Laxmi
Last Modified Date  :   22 Feb 2016
Description         :   Changes the limit to show all the Pending approval requests , Draft, Submitted , Approved request for selected Business <IS ID-00063130,IS ID-00064322, IS ID-00061646>
 ******************************************************************************************************************
 <VL20160229>   
 
 Last Modified By    :   Vijay Laxmi
Last Modified Date  :   22 Feb 2016
Description         :   Added other picklist value <IS ID-00060139>
 ******************************************************************************************************************
  <MD20160304>   
 
Last Modified By    :   Madhurima Daggumati
Last Modified Date  :   04 Mar 2016
Description         :   Added Pricing task reason codes based on business <IS ID-00066245>
 ******************************************************************************************************************
  <HN14032015> 
Last Modified By    :   Haider Naseem
Last Modified Date  :   14 Mar 2016
Description         :   Added validation for quotes used in Request name (IS ID-00059166)
 ******************************************************************************************************************
<KS20160224>
Last Modified By    :   Kunal Sharma
Last Modified Date  :   12 April 2016
Description         :   Clarification of Assigned To in Spot Price Request as per the business requirement, user should see a default value in the â€œAssigned Toâ€ field in case of one CSR mapped to only one customer and in case of multiple CSRs mapped to one customer, then the â€œAssigned Toâ€ filed should be left blank. 
 *****************************************************************************************************************
 <NS20160418> 
Last Modified By    :   Nadeem Shaik
Last Modified Date  :   25 Apr 2016
Description         :   Added Condition for adding request reasons of rebate agreement to Rebate payout and Rebate adjustment
                        (IS ID-00068874)
 ******************************************************************************************************************                        
<PG20191211> 
Last Modified By    :   Piyush Gupta
Last Modified Date  :   11 Dec 2019
Description         :   Added Customer Group 4 as a Business Requirement so taht data can be fetched from ERP Customer.
 ******************************************************************************************************************
<AG20200303>
Last Modified By    :   Amandeep Gautam
Last Modified Date  :   03 March 2020
Description         :   Added a new value "Exceptions" for the field "Subtype". Issue - IS SC-00092789
 ******************************************************************************************************************
<AG20200401>
Last Modified By    :   Amandeep Gautam
Last Modified Date  :   01 April 2020
Description         :   Added "if(true){}" to remove compiler error coming when increasing API Version . Issue - IS SC-00092789
 *****************************************************************************************************************
 <PG20202707> 
Last Modified By    :   Piyush Gupta
Last Modified Date  :   27 Jul 2020
Description         :   Added Distributor Code as a requirement to fetch it from Customer Material Key.
*****************************************************************************************************************
 <AG20210219> 
Last Modified By    :   Amandeep Gautam
Last Modified Date  :   19 February 2021
Description         :   Added Validation on Due Date(For 3 AP Businesses). IS SC-00098231

 <SS20220826>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   26 August 2022
Description         :   Added logic to populate other subtype based on business name. IS EI-00095380 

**********************************************************************************************************************
 <SS20220827>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   27 Aug 2022
 Description        :   Added filter for Sales Order Item values- CRM-2022-07-0225
 
 **********************************************************************************************************************
<SS20230110>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   10 Jan 2023
 Description        :   Added logic to check null values in Customer/Non Customer Requests Reason- CRM-2022-07-0225
 **********************************************************************************************************************
<SS20230110>
 Last Modified By   :   Nandakishor Ms
 Last Modified Date :   04 Feb 2023
 Description        :   Changed logic to solve the error coming while clicking the cancel button- CRM-2022-07-022
**********************************************************************************************************************
 <SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   05 May 2023
 Description        :   P80 M&M Changes 
 ******************************************************************************************************************/
 

public with sharing class PARequest implements IPAServiceComponent
{ 

  /*   Ver.                      Developer                           Changes                              Dependancies
--------------------------------------------------------------------------------------------------------------------------*/
  //  1.1                      Vinoth                       Edited the columnGenerate Method          None
  //  1.2                      Utkarsh                         For Bulk reassignment                     none
  //  1.3                      Prachi                       changed desired action for Next
  //  1.4                      Neeharika                     added clean up logic on click of new pirce  None
  //  1.5                      Brundha                         added conditions based on group members and BU Admin    None
  //
  //  1.6                      sanjib                       added validation for pcl
  //  1.7                      sanjib                       added local variable to populate customer contact
  //  1.8                      brundha                         for pending link
  //  1.9                      sanjib                       deleting the record inserted for querying multiple records  
  //  2.1                      sanjib                       added custom validation to get error message
  //  2.2                      sanjib                       chnged  error message to apex warning
  //  2.3                      Prachi                       Modified the query for AssignedTo        None
  //  2.4                      Neeharika                     Included markertSegmentFilter field       None
  //  2.5                      anand                         added else if for project in stter method   None
  //  2.6                      Priyanka                       sorted list of requests by lastmodifieddate   None
  //  2.7                      Bala                           Changed Request Reason population for Project Pricing None
  //  2.8                      Vinoth                       Changed Dynamic column generation         None       
  //  2.9                      Bala                           Added OnBehalf Field population for Massive  None
  //  3.0                      Priyanka                       Added null check on OnBehalf Field population 
  //                                                            for Massive                                    None
  //  3.1                      Priyanka                       Initialize sObjectList in getListWrappers   None
  //  3.2                      Prachi                       Added conditions for Free of Charge spot type   None
  //  3.3                      Priyanka                       Replace sObjectList with sObjectRecord       None
  //  3.4                      Priyanka                       Added logic for cancel on CustRequests page         None
  //  3.5                      Bala                           Added logic to add onBehalf in PricingTask    None
  //  3.6                      Prachi                       Added logic for custom view of Task and Request records    None
  //  3.7                      Shiva                         Commenting filters null clean up logic-UAT #47             None
  //  3.8                      Prachi                       Changing overriding of pricing requests                    None
  //  3.9                      Bala                           Clean up of onBehalf Of for Massive                      None
  //  4.0                     Prachi                        Added source cluster logic for Assigned to                  None
  //  4.1                     Brundha                     added one variable for dispNCS                              None
  //  4.2                     Bala                            Removed Created By and On Behalf Of in query                None
  //  4.3                     Bala                            Added condition to disable Project section based on pbGrp   None
  //  4.4                     Prachi                        UI Issue                                                  None
  //  4.5                     Bala                            validation added for import 
  //  4.6                        Prachi/Utkarsh                   Removed the logic for Routing from detail page                      RoutetoPriceRequest, RouteToProjectRequest
  //and shifted to Request Item.
  //  4.7                     Vinoth                        Import File Type Change                                       None
  //  4.8                         Priyanka                        Adding code for additional KC filters                       None
  //  4.9                         Prachi                              Assigned to code                                        None
  //  4.10                        Bala                            Removed Created By and On Behalf Of in query for links as well None 
  //  4.11                        Bala                            Removing Project section display(reverted)                          None
  //  4.12                        Prachi                          populating customer for all scenarios                       None
  //  4.13                        Vinoth                          Modified export as per Sreedhar's Code review comment       None

  // 4.14                      sanjib                       added logic for custom setting from code revw commnts    None
  // 4.15                         Utkarsh                         Added condition to check the latest status of the request   PAApprovalWF
  // 4.16                         Prachi                          Changed the spliting condition - Code review comment        None
  //4.17                         sanjib                        commented the ine line number 1967                       none
  // 4.18       19 April          Utkarsh                 Removed reference of Workset Item Id field
  // 4.19       14 MAY            anand                   added two validation for PCL                                    None           
  // 4.20       14 MAY            Prachi                  populating customer on click of edit                                    None      
  // 4.21       25 APR            Nadeem Shaik            Added Condition for adding request reasons of rebate agreement to Rebate payout and Rebate adjustment         None      
  // 4.22       11 DEC            Piyush Gupta           Added Customer Group 4 in the queries so taht data can be fetched from the Customer.
  public boolean isNetFloorVisible{get; set;} 
  public list<PAWrapper> templateWrapper{get;set;}
  public Double totalSalesReduction{get; set;}
  public boolean showLandingCost{get;set;}// NE20130409
  public map<String,String> email{get;set;}
  public boolean floorPricingCheck=false;

  public PAERPCustomer customer{get;set;}
  public String customerContact{get;set;}
  //public string checkIfError{get;set;}
  //bala- apr 26
  public List<selectOption>nonStandardSelectList{get
    {
    string nonStdString = requestServiceState.ogItems.orgGroupItems.Non_Standard_Payment_terms__c;
    List<string> nonStdPaymentList = new List<string>();
    if(nonStdString!=null)
    {
      nonStdPaymentList =  nonStdString.split(';');
    }
    nonStandardSelectList = new List<selectOption>();
    nonStandardSelectList.add(new selectOption('','--Select--'));
    if(nonStdPaymentList.size() == 0)
    {
      nonStdPaymentList.add('Others');
    }
    for(string s:nonStdPaymentList)
    {
      nonStandardSelectList.add(new selectOption(s,s));
    }
    return  nonStandardSelectList;      
    }set;}
  public Pricing_Request__c pricingRequest {get;set
  {
    System.debug('Setting value:'+value);
    pricingRequest = value;
  }
  } 
  public List<selectOption> erpUoMList{
    get{
      if(erpUoMList==null)
      {
        this.erpUoMList = new list<selectOption>();
        Set<SelectOption> erpUoMSet = new Set<SelectOption>();
        List<String> UoM = new List<String>();
        UoM = requestServiceState.ogItems.orgGroupItems.ERP_UoM__c.split(';');
        system.debug('UoM is '+UoM);
        system.debug('UoM size is '+UoM.size());
        for(String X:UoM){
          system.debug('X is '+X);
          erpUoMSet.add(new SelectOption(X,X));
        }
        this.erpUoMList.addAll(erpUoMSet);
      }
      pricingRequest.Default_UoM__c = 'BX';
      system.debug('erpUoMList is '+erpUoMList);
      return erpUoMList;
    }
    set{
      erpUoMList = value;
    }
  }
  //<GT20140122 Added for massive import
  public id requestId{get;set;}
  //<GT20140122 Added for massive import
  public boolean massiveImport{get
    {  if(massiveImport== null)
      massiveImport = false;
    return massiveImport;
    }
  set
  {
    pricingRequest.Request_Type__c = 'Mass Import';
    massiveImport = value;
  }
  }

  public string sessionId{get;set;}

  //<GT20150114> Added to capture all approver names
  public string allApprovers
  {
    get{
      if(allApprovers ==null)
      {
        Pricing_Request__c req = [select Approver1__r.email,Approver2__r.email, Approver3__r.email,Approver4__r.email,Approver5__r.email from Pricing_Request__c where id=: pricingRequest.id];
        allApprovers= ((pricingRequest.Approver1__c!=null)?req.Approver1__r.email+';':'')+((pricingRequest.Approver2__c!=null)?req.Approver2__r.email+';':'')+((pricingRequest.Approver3__c!=null)?req.Approver3__r.email+';':'')+((pricingRequest.Approver4__c!=null)?req.Approver4__r.email+';':'')+((pricingRequest.Approver5__c!=null)?req.Approver5__r.email+';':'');

      }
      return allApprovers;
    }

    set;    
  }
  public List<PARelatedList> relatedWrappersList{get;set{
    //System.debug('relatedWrappersList value:'+value);
    relatedWrappersList = value;
  }}
  //for export records from page
  public List<PARelatedList> exportWrapList;

  public Project_Price__c projectprice{get;set;}
  //For Export
  public String listSeparator {get;set;}

  public List<PAWrapper> attachPAWrapperList{get;set;}
  public String headerTitle{get;set;}
  public List<PARelatedList> relatedListRequestItemsList{get;set;}
  public List<PARelatedList> relatedListERPSalesList{get;set;}
  //Used for populating KC SFDC description
  public String SFDCKCDesc{get;set;}

  //for Assigned To functionality
  public String userSelected{get;set;}
  public String userName{get;set;}
  public String userSelectedEpassId{get;set;}
  //public User assignedToUser{get;set;}

  //added to get the last PH Level Selected - Shiva 13-03-13 
  public Integer lastPHLevelSelected {get;set;}
  //Brundha Roll out 2 <BR20130625>
  public List<string> pricingExceptionList{get;set;}

  //<AV20140408>-added boolean flag for cloning
  public boolean cloneFlag{get;set;}
  public boolean selallFlag{get;set;}

  //<PP20140421>
  public String currentPricesSelection
  {
    get;
    set;        
  }
  //<MS20130612>

  //Start: <GT20140902>

  public void changeBU()
  {
    relatedWrappersList = getListWrappers();
  }
  public string requesttype{get
    {
    if(requesttype == null)
      requesttype='select';
    return  requesttype;
    }

  set
  {
    //system.debug('Setter requesttype:-'+requesttype+',value:'+value);
    if(requesttype!=value )
    {
      requesttype = value;
      relatedWrappersList = getListWrappers();

    }//relatedWrappersList = getListWrappers();     

    /*
        if(value!='select')
        {
            requesttype = value;
            System.debug('Setter requesttype:-'+requesttype);
            relatedWrappersList = getListWrappers();
        }
        else
            requesttype = value;
     */
  }}
  //Start:<GT20140909>
  public map<string,integer> buRequestCount{get;set;}
  public List<String> getBURequests()
  {
    List<string> business = new List<String>();
    map<string,List<Pricing_Request__c>> mapBuRequests = new map<string,List<Pricing_Request__c>>();
    //map<string,integer> buRequestCount = new map<string,integer> ();
    buRequestCount = new map<string,integer> ();
    String currentApprover ;
    String query ='select id,BU__c FROM Pricing_Request__c WHERE Request_Approval_Status__c=\'Submitted\'';
    if(!requestServiceState.ogItems.isBUAdmin)
      query+=' AND Current_Approver__c=\''+ Userinfo.getUserId()+'\'';

    for(SelectOption optn : requestServiceState.ogItems.getListOptions())
    {
      if(optn.getLabel()!='--Select--')
      {
        business.add(optn.getLabel());
        buRequestCount.put(optn.getLabel(),0);
      }
    }
    query+=' And BU__c in:business';

    //System.debug('Current Query:-'+query+'Business:-'+business+'requestServiceState.ogItems.getListOptions():-'+requestServiceState.ogItems.getListOptions());
    for(Pricing_Request__c req: database.query(query))
    {
      list<Pricing_Request__c> reqsts = new list<Pricing_Request__c>();
      if(mapBuRequests.containsKey(req.BU__c))
      {
        reqsts = mapBuRequests.get(req.BU__c);
        reqsts.add(req);
        mapBuRequests.put(req.BU__c,reqsts);
      }
      else
      {
        reqsts.add(req);
        mapBuRequests.put(req.BU__c,reqsts);
      }
    }
    for(String Bu: mapBuRequests.keySet())
    {
      buRequestCount.put(bu,mapBuRequests.get(bu).size());
    }
    //System.debug('Map Vlaues:-'+buRequestCount);
    return business;
  }
  //End:<GT20140909>
  //End: <GT20140902>
  //<MS20140930>

  /*public boolean confirmMassReassign{get;
        set
        {
            system.debug('In confirm set' + confirmMassReassign);
        }

    }*/
  public boolean massReassignAttribute{get;
  set{
    //system.debug('In mass reassign set');
    //if(confirmMassReassign!=null && confirmMassReassign==true)
    action('PAStatus','PAStatus','saveBulkReassign');
    relatedWrappersList=getListWrappers();
    PageReference refreshPending=new PageReference('/apex/'+'PAStatus');
    refreshPending.setRedirect(false);

  }
  }
  //<TJ20150107>
  public String pckcFromKeyComb{set
    {
    keyCombination.pcKCOptionsList = keyCombination.getListPcKc();
    }
  get;
  }

  public String selectedDefaultCurrency {get;set;}
  public List<SelectOption> salesAreaCurrencyList
  {
    get
    {
      if(salesAreaCurrencyList==null)
      {
        list<selectOption> salesAreaCurrencyList = new list<selectOption>();
        Set<SelectOption> salesAreaCurrencySet = new Set<SelectOption>();
        if(pricingCondition.pricingCondition.Calculation_Type__c!=null && pricingCondition.pricingCondition.Calculation_Type__c.containsIgnoreCase('Percentage'))
        {
          salesAreaCurrencyList.add(new SelectOption('%','%'));
        }
        else
        {
          List<String> curr = new List<String>();

          if(requestServiceState.ogItems!=null && requestServiceState.ogItems.orgGroupItems!=null && requestServiceState.ogItems.orgGroupItems.ERP_Currency__c!=null)
          {
            curr = requestServiceState.ogItems.orgGroupItems.ERP_Currency__c.split(';');
          }

          for(String X:curr)
          {
            //erpCurrencyList.add(new SelectOption(X,X));
            salesAreaCurrencySet.add(new SelectOption(X,X));
          }
          if(requestServiceState.ogItems!=null && requestServiceState.ogItems.orgGroupItems!=null && requestServiceState.ogItems.orgGroupItems.Include_Customer_Currency__c && (pricingRequest.Request_Type__c == 'Customer Specific' || pricingRequest.Request_Type__c == 'Massive')&&requestServiceState.erpCustomer!=null&&requestServiceState.erpCustomer.paERPCustomer!=null && requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c!=null)
          {
            salesAreaCurrencySet.add(new SelectOption(requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c,requestServiceState.erpCustomer.paERPCustomer.Currency_Code__c));
          }
          /*List<ERP_Customer__c> cusList= [SELECT Id,currency_code__c,customer_code__c,Distribution_Channel_Code__c,Distribution_channel__c,
                                                    Division__c,Division_code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c FROM ERP_Customer__c WHERE Customer_code__c=:pricingRequest.SoldTo_Code__c
                                                    AND sales_org_code__c=:pricingRequest.Sales_Org_Code__c
                                                    AND Distribution_Channel_Code__c=:pricingRequest.Dist_channel_code__c
                                          AND Division_code__c=:pricingRequest.Division_code__c limit 1];*/
          List<ERP_Customer__c> cusList=(List<ERP_Customer__c>)PAQueryUtil.query('PARequest', 'cusList', ' Customer_code__c=\''+pricingRequest.SoldTo_Code__c+'\' AND sales_org_code__c=\''+pricingRequest.Sales_Org_Code__c+'\' AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+pricingRequest.Division_code__c+'\' limit 1');                                

          if(requestServiceState.ogItems!=null && requestServiceState.ogItems.orgGroupItems!=null && requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c!= null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c != null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency')
          {
            selectedDefaultCurrency = requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
          }
          else if(requestServiceState.ogItems.orgGroupItems.ERP_Currency__c !=null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c != null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency' && cusList != null && cusList.size()>0 /*&& pricingRequest.Request_Type__c == 'Customer Specific' && pricingRequest.Pricing_Request_Type__c == 'Permanent'*/)
          {
            selectedDefaultCurrency=cusList[0].Currency_Code__c;
          }
          if(selectedDefaultCurrency != null)
          {
            if(String.isBlank(pricingRequest.Default_Currency__c))
              pricingRequest.Default_Currency__c = selectedDefaultCurrency;
            salesAreaCurrencySet.add(new SelectOption(selectedDefaultCurrency,selectedDefaultCurrency));
          }

          salesAreaCurrencyList.addAll(salesAreaCurrencySet);

          if(salesAreaCurrencyList.size()>1 )
          {
            salesAreaCurrencyList.add(0,new SelectOption('--Select--','--Select--'));
          }

        }return salesAreaCurrencyList;
      }
      return salesAreaCurrencyList;
    }
    set;
  }
  //<TJ20140522>
  public Integer countOfPriceTables {get;set;}
  public List<String>  dummylist1 {get; set;}
 // public List<String>  dummylist2 {get; set;}
  //<TJ20140923>

  //Added to capture the selected values from shipto lookup
  public string filtercode{get;set{
    System.debug('Filter code value:'+value);
    System.debug('KC COde:'+keyCombination.keyComb);
    string kc = keyCombination.keyComb;
    if(kc.contains('Price Ref. Partner'))
      priceRefPartnerFilter = value;
    if(kc.contains('Ship to'))
      shipToFilter = value;
    if(kc.contains('End User'))
      endUserFilter = value;
    if(kc.contains('Customer Hierarchy'))
      customerHierarchyFilter = value;
    if(kc.contains('ComPartner'))
      comPartnerFilter = value;
    if(kc.contains('Partner ZF'))
      partnerZFFilter = value;
    if(kc.contains('Payer'))
      payerFilter = value; 

      filtercode = value;
    dummylist1 = new List<String>();
    List<String> splitlist =new List<String>();
    splitlist = filtercode.split('/');
    For(String sc : splitlist)
    {
           dummylist1.add(sc);
    } 
  }}
  public string filterName{get;set
  {
    string kc = keyCombination.keyComb;
    if(kc.contains('Price Ref. Partner'))
      priceRefPartnerNameFilter = value;
    if(kc.contains('Ship to'))
      shipToNameFilter = value;
    if(kc.contains('End User'))
      endUserNameFilter = value;
    if(kc.contains('Customer Hierarchy'))
      customerHierarchyNameFilter = value;
    if(kc.contains('ComPartner'))
      comPartnerNameFilter = value;
    if(kc.contains('Partner ZF'))
      partnerZFNameFilter = value;
     if(kc.contains('Payer'))
      payerNameFilter = value; 
      filterName = value;
      /*dummylist2 = new List<String>();
      List<String> splitlist =new List<String>();
      splitlist = filterName.split('/');
      For(String sc : splitlist)
      {
           dummylist2.add(sc);
      } */
  }
  }  

  public boolean ncsPCKC{get;set;}
  public boolean reqOvw{get;set;}
  //<PP20140502>
  public List<Pricing_Request_Item__c> pricingReqItemList {get;set;}
  //<BB20140516> Added boolean variable to check if Request History was clicked.
  public boolean displayPermanentRequestHistory {get;set;}
  //<MS20140901> Added boolean variable to check if Task Request History was clicked.
  public boolean displayTaskRequestHistory {get;set;}

  public String baseURL{get;set;}
  //Added for Fix value date filter
  public string fixValDate{get;set;}
  public Pricing_Request__C DFixValDate{get
    {
    if(DFixValDate==null)
      DFixValDate = new  Pricing_Request__C ();
    return DFixValDate;
    }
  set;}
  public String pricingRequestId{set
    { 
    //system.debug('***Value:'+value);
    boolean cloneCheck=false;
    if(value!=null)
    {   
      //<PP20130422> -- Ver 4.18
      //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
      //<PP20130711>
      //Brundha Roll out 2 <BR20130625> -- <NS20130821> Added Landing_Cost__c field to query select clause
      //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
      //<BB20140321> Added Auto_Approver Fields in the query
      //<MS20140421> Added Backup_Level Name and approverText Fields in the query

      //<AV20140408>-Added logic for making validity date fields in clone req as blank-starts
      //<BB20140429> --Added Default_Currency__c Fields in the query 
      if(value.containsIgnoreCase('Clone')){
        cloneCheck=true;
        value=value.split('-',2)[1];
        //system.debug('***value after split:'+value);
        value=(Id)value;
      }
      //<AV20140408>-ends
      //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
      //<AV20140515>-Added Sales_Volume_Enable__c field
      // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
      value=value.substring(0,15);
      /*pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,
                              Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c,
                              Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c,
                              Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c,
                              Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c,
                              Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name,
                              On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate,
                              LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, 
                              Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c,
                              Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,
                              CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, 
                              Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c, 
                              Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c,
                              On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, 
                              Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c, 
                              Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name, 
                              NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name, 
                              Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c,
                              Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,
                        Delegation_Comments__c FROM Pricing_Request__c WHERE Id = :value];*/

      pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+value+'\''))[0];
     /* List<Pricing_Request__c> PR = PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+value+'\'');
      if(PR.size() > 0)
      {
      pricingRequest = PR[0];
      } added for testing*/ 
      system.debug('Request:-'+pricingRequest);
      if(pricingRequest.Is_End_User_Rebate__c) requestServiceState.ogitems.isEndUserRebate = true;
      //<TJ20150703>
      String BU=pricingRequest.BU__c;
      if(pricingRequest.BU__c=='DPP LA Resins And Elastomers')
        BU='DPP LA E And R';
      //<AV20152907>-Production Issue-Custom setting name too long error
      else if(pricingRequest.BU__c=='DPP Global Kalrez & Vespel')
      {
        BU='DPP Global KV';
      }  
      Price_Visibility__c pv = Price_Visibility__c.getInstance(pricingRequest.SalesArea__c+'#'+BU);
      if(pv!=null){
        Set<String> rtypes = new Set<String>();
        rtypes.addAll(pv.Request_Type__c.split('\\;'));
        Set<String> prtypes = new Set<String>();
        prtypes.addAll(pv.Pricing_Request_Type__c.split('\\;'));
        Set<String> approvers = new Set<String>{pricingRequest.Approver1__c,pricingRequest.Approver2__c,pricingRequest.Approver3__c,pricingRequest.Approver4__c,pricingRequest.Approver5__c};

        //if(pv!=null && (requestServiceState.ogitems.approverPermissionSetFlag || requestServiceState.ogitems.isBUAdmin) && rtypes.contains(pricingRequest.Request_Type__c) && prtypes.contains(pricingRequest.Pricing_Request_Type__c) )
        if(pv!=null && rtypes.contains(pricingRequest.Request_Type__c) && prtypes.contains(pricingRequest.Pricing_Request_Type__c) ){
          If((approvers.contains(UserInfo.getUserId()) || requestServiceState.ogitems.isBUAdmin))
          isNetFloorVisible = true;
          else
            isNetFloorVisible = false;
        }
        else
          isNetFloorVisible = true;

        system.debug('rtypes is '+rtypes);
        system.debug('prtypes is '+prtypes);
        system.debug('approvers is '+approvers);
        system.debug('UserInfo.getUserId() is '+UserInfo.getUserId());
        system.debug('requestServiceState.ogitems.approverPermissionSetFlag is '+requestServiceState.ogitems.approverPermissionSetFlag);
        system.debug('requestServiceState.ogitems.isBUAdmin is '+requestServiceState.ogitems.isBUAdmin);
        system.debug('pricingRequest.Request_Type__c is '+pricingRequest.Request_Type__c);
        system.debug('pricingRequest.Pricing_Request_Type__c is '+pricingRequest.Pricing_Request_Type__c);

      }
      else
        isNetFloorVisible = true;

      system.debug('isNetFloorVisible is '+isNetFloorVisible);
      if(cloneCheck)
      {
        //<AV20140408>-start
        pricingRequest.Request_Valid_From__c=null;
        pricingRequest.Request_Valid_To__c=null;
        //system.debug('***Default Valid from after:'+pricingRequest.Request_Valid_From__c);
        //<AV20140408>-ends

        //<BB20140404> --Added Query to fetch the latest value of Customer header on clone Request. START
        list<ERP_Customer__c> listOfCustomer= new list<ERP_Customer__c>();
        Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
        //<BB20140508> -- Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query.
        //<PG20191211> -- Added Customer Group 4 and Customer group 4 Code by Piyush
        /*listOfCustomer=[SELECT  Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c,
                                Account_Group__c,Distribution_Channel__c,Distribution_Channel_Code__c,Division__c,
                                Division_Code__c ,PO_Box__c,Sales_Org__c,Sales_Org_Code__c ,State_Province__c,
                                State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
                                Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                                Customer_Price_Group__c  ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,
                                Deletion_Flag__c,Customer_General_Data__r.Deletion_Flag__c,Customer_Group_1__c,
                                Customer_Group_1_Code__c,Customer_Group_2__c,Customer_Group_2_Code__c,Customer_Group_3__c,
                                Customer_Group_3_Code__c,Customer_Group_4__c,Customer_Group_4_Code__c,Customer_Group_5__c,
                                Customer_Group_5_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c 
                                WHERE Customer_Code__c =:pricingRequest.SoldTo_Code__c
                                AND Sales_Org_Code__c =:pricingRequest.Sales_Org_Code__c  AND Distribution_Channel_Code__c=
                                    :pricingRequest.Dist_Channel_Code__c AND Division_Code__c =: pricingRequest.Division_Code__c 
                          AND RecordTypeId = :Customer_RTYPE_Id ];*/

        listOfCustomer = (List<ERP_Customer__c>)PAQueryUtil.query('PARequest', 'listOfCustomer', ' Customer_Code__c = \''+pricingRequest.SoldTo_Code__c+'\' AND Sales_Org_Code__c =\''+pricingRequest.Sales_Org_Code__c+'\'  AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_Channel_Code__c+'\' AND Division_Code__c =\''+pricingRequest.Division_Code__c+'\' AND RecordTypeId = \''+Customer_RTYPE_Id+'\'');  

        //system.debug('******* listOfCustomer'+ listOfCustomer.size()+listOfCustomer);


        if (listOfCustomer.size()==0)
        {
          //system.debug('******* Error : Customer Code is invalid or deleted.');
        }
        else
        {
          pricingRequest.SoldTo_Code__c = listOfCustomer.get(0).Customer_Code__c;
          //<PG20191211> -- Added Customer Group 4 and Customer group 4 Code by Piyush
          pricingRequest.Customer_Group_4__c=listOfCustomer.get(0).Customer_Group_4__c;
          pricingRequest.Customer_Group_4_Code__c=listOfCustomer.get(0).Customer_Group_4_Code__c;
          pricingRequest.Terms_of_Payment_Code__c = listOfCustomer.get(0).Terms_of_Payment_Code__c;
          pricingRequest.Terms_of_Payment__c = listOfCustomer.get(0).Terms_of_Payment__c;
          pricingRequest.Country__c = listOfCustomer.get(0).Country__c;
          pricingRequest.Street__c = listOfCustomer.get(0).Street__c;
          pricingRequest.City__c =listOfCustomer.get(0).City__c;
          pricingRequest.Dist_Channel__c = listOfCustomer.get(0).Distribution_Channel__c;
          pricingRequest.Dist_Channel_Code__c = listOfCustomer.get(0).Distribution_Channel_Code__c;
          pricingRequest.Division_Code__c = listOfCustomer.get(0).Division_Code__c;
          pricingRequest.Division__c = listOfCustomer.get(0).Division__c;
          pricingRequest.Sales_Org__c =listOfCustomer.get(0).Sales_Org__c;
          pricingRequest.Sales_Org_Code__c = listOfCustomer.get(0).Sales_Org_Code__c;
          pricingRequest.Incoterm__c = listOfCustomer.get(0).Incoterms_1__c;
          pricingRequest.Incoterms_Code__c = listOfCustomer.get(0).Incoterms_1_Code__c;
          if(listOfCustomer.get(0).Deletion_Flag__c == true || listOfCustomer.get(0).Customer_General_Data__r.Deletion_Flag__c == true)
          {
            //system.debug('******* Error : Customer Code is marked for deletion');
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Sold_To_Code_is_marked_for_deletion_Error); 
            ApexPages.addMessage(myMsg);
          }

        }

      }
      //<BB20140404> END


      //<PP20130715> START
      if(pricingRequest != null)
      {
        requestServiceState.ogItems.ogItemFromRequest(pricingRequest);
        relatedWrappersList = new List<PARelatedList>();
        //<PP20140421>
        if(String.isBlank(currentPricesSelection))
          currentPricesSelection = requestServiceState.ogItems.orgGroupItems.Default_Prices_Selection__c;
        if(requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Price_Requests__c != null)
          pricingRequest.Approval_Escalation_Price_Requests__c=requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Price_Requests__c;
        if(requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Pricing_Task__c != null)
          pricingRequest.Approval_Escalation_Pricing_Task__c = requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Pricing_Task__c;

      }
      //<PP20130715> END

      //system.debug('###'+pricingRequest.Id);                

      //adding this condition to retain the customer payment and incoterm details on click of my request links
      if(pricingRequest.Pricing_Request_Type__c.equalsIgnoreCase('Pricing Task')
          || (pricingRequest.Request_Type__c.equalsIgnoreCase('Customer Specific')
              && pricingRequest.Pricing_Request_Type__c.equalsIgnoreCase('Permanent')))
      {
        // <PS20130425> Ver 4.20 added (25thApril Roll Out) Customer_Group_2_Code__c and Customer_Group_2__c in the query
        //<BB20140508> -- Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query.
        //<PP20140611>

        /*customer.paErpCustomer = [SELECT Id,Name,Customer_Group_2_Code__c, Customer_Group_2__c,city__c,country__c,country_code__c,currency_code__c,customer_code__c,
                                          Distribution_Channel_Code__c,Distribution_channel__c,
                                          Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                                          Customer_Price_Group__c,Price_List_type__c,State__c,
                                          price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c,
                                          sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,
                                          Zip_Postal_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c 
                                          WHERE Customer_code__c=:pricingRequest.soldto_code__c AND sales_org_code__c=:pricingRequest.sales_org_code__c
                                          AND Distribution_Channel_Code__c=:pricingRequest.Dist_channel_code__c
                                  AND Division_code__c=:pricingRequest.Division_code__c limit 1];*/
        customer.paErpCustomer = ((List<ERP_Customer__c>)PAQueryUtil.query('PARequest', 'customer.paErpCustomer', ' Customer_code__c = \''+pricingRequest.soldto_code__c+'\' AND sales_org_code__c=\''+pricingRequest.sales_org_code__c+'\' AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+pricingRequest.Division_code__c+'\' limit 1'))[0];                         
        customer.customerCode = pricingRequest.Soldto_Code__c;
        customer.salesOrgCode = pricingRequest.sales_org_code__c;
        customer.distCode = pricingRequest.Dist_channel_code__c;
        customer.divCode = pricingRequest.Division_code__c;
        customer.customerName = customer.paErpCustomer.Name;
        customer.salesArea = customer.paErpCustomer.Sales_Org_Code__c + '-' + customer.paErpCustomer.Sales_Org__c + '<br>' + customer.paErpCustomer.Distribution_Channel_Code__c
            + '-' + customer.paErpCustomer.Distribution_Channel__c + '<br>' + customer.paErpCustomer.Division_Code__c + '-' 
            + customer.paErpCustomer.Division__c;
        customer.salesOrgCode = customer.paErpCustomer.Sales_Org_Code__c;
        customer.salesOrg = customer.paErpCustomer.Sales_Org__c;
        customer.distCode = customer.paErpCustomer.Distribution_Channel_Code__c;
        customer.dist = customer.paErpCustomer.Distribution_Channel__c;
        customer.divCode = customer.paErpCustomer.Division_Code__c;
        customer.div = customer.paErpCustomer.Division__c;
        customer.street = customer.paErpCustomer.Street__c;
        customer.stateProvince = customer.paErpCustomer.State__c;
        customer.city = customer.paErpCustomer.City__c;
        customer.country = customer.paErpCustomer.Country__c;
        customer.zipPostalCode = customer.paErpCustomer.ZIP_Postal_Code__c;

        //Ver 4.20 populating customer in the service state(request)- on click of edit(7th June)
        requestServiceState.erpCustomer = customer;                
      } 


      //System.debug('***in setter of request status'+pricingRequest.Request_Approval_Status__c);
      //System.debug('***in setter of request text id:'+pricingRequest.Project_Id__c);
      //System.debug('***pricingRequest.Project_Price__c'+pricingRequest.Project_Price__c);
      if(projectprice!=null && pricingRequest.Project_Price__c!=null)
      {
        //System.debug('***in setter of proj');
        /*List<Project_Price__c> projList=[select Id,Project_Id__c,Name,Project_status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                                                 Pricing_Condition__c,Pricing_Condition_Code__c,Project_Volume__c, Default_Discount__c,Valid_From__c,
                                         Valid_To__c,status__c From Project_Price__c where Id=:pricingRequest.Project_Price__c];*/
        List<Project_Price__c> projList=(List<Project_Price__c>)PAQueryUtil.query('PARequest', 'projList', ' Id = \''+pricingRequest.Project_Price__c+'\'');                                 
        if(projList!=null && projList.size()!=0)
        {
          projectprice=projList.get(0);
        }
        //added by anand on 27 March for Locale
        Decimal standardDecimal = 1.1;
        string separator = standardDecimal.format().subString(1,2);
        //<TJ20150603>
        if(projectPrice != null && projectPrice.Default_Discount__c !=null && projectPrice.Default_Discount__c.contains('.') )
        {
          projectPrice.Default_Discount__c = projectPrice.Default_Discount__c.replace('.',separator);
          //tempStorageMap.put('defaultDiscount',replacedDisc);
        }

      }
      // 2.5 added on 22 Feb
      else if(pricingRequest.Project_Id__c !=null )
      {
        //System.debug('***in side els if');
        /*List<Project_Price__c> projList1=[select Id,Project_Id__c,Name,Project_status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                                                  Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,
                                          Valid_To__c,status__c From Project_Price__c where Project_Id__c=:pricingRequest.Project_Id__c];*/
        List<Project_Price__c> projList1=(List<Project_Price__c>)PAQueryUtil.query('PARequest', 'projList', ' Project_Id__c = \''+pricingRequest.Project_Id__c+'\'');
        if(projList1!=null && projList1.size()!=0)
        {
          projectprice=projList1.get(0);

        }
        //System.debug('***in setter of request'+projectprice.Id);
      }
      //added for landing cost-start NE20130409
      requestServiceState.ogItems.ogItemFromRequest(pricingRequest); 
      Integer countPRI= [SELECT Count() FROM Pricing_Request_Item__c where PRicing_Request__c= :pricingRequest.Id ];
      //System.debug('*****countPRI'+countPRI);
      if(countPRI==0){
        showLandingCost=true;
      }
      else{
        showLandingCost=false;
      }
      //added for landing cost-end NE20130409
    }
    //system.debug('***check'+value);

    //setting the value of userSelected id  - prachi 8th feb
    userName = pricingRequest.Assigned_To__r.name;
    userSelected = (Id)pricingRequest.Assigned_To__c;
    userSelectedEpassId = pricingRequest.Assigned_To__r.E_Pass_Id__c;
    //<PP20130613> -- Ver 4.23
    if(pricingRequest.Request_Type__c == 'Massive' || pricingRequest.Request_Type__c == 'Customer Specific')
    {
      requestServiceState.ogItems.userName = pricingRequest.On_Behalf_Of__r.Name; 
    }       
    }
  get;
  }

  // Reassigning requests
  public string ReassignReq
  {
    get
    {  if(ReassignReq==null)
      ReassignReq='';

    for(PARelatedList relatedListObj : relatedWrappersList){
      for(PAWrapper wrapper : relatedListObj.wrapperList){
        if(wrapper.isSelected == true){
          ReassignReq +=(string)wrapper.sObjectRecord.id+'-';
        }
      }
    }

    return   ReassignReq;
    }  
    set;
  }

  // public PAPricingCondition pricingCondition{get;set;} 
  public PAServiceState requestServiceState {get;set;}
  public PAPricingCondition pricingCondition {get;set;}//to be removed
  public PAKeyCombination keyCombination {get;set;}//to be removed
  //forpcl by sanjib
  public String mailBody{get;set;}
  public String pclDisplayPopUp{get;set;}
  //<MS20140929> Adding variable to display all templates  for BU without search
  public boolean pclShowSelectionTable{get;set;}
  public list<String> emailTemplate{
    get{
      set<String> uniqueLanguage=new Set<string>();
      set<String> lang=new set<string>();
      list<String> names=new List<string>();
      list<String> uniqueLanguageToDisplay=new List<string>();
      //added after code revw comments
      list<EmailTemplate> getEmailTemplate=[Select Id, Name,body,description, IsActive, Folder.Name 
                                            From EmailTemplate where Folder.Name=:PA_Email_Template_Custom_Settings__c.getInstance('priceApprovalFolder').folder_Id__c];
      //system.debug(' *** getEmailTemplate **'+getEmailTemplate);
      //system.debug(' *** getEmailTemplate size **'+getEmailTemplate.size());
      for(EmailTemplate et:getEmailTemplate)
      {
        names = et.Name.split('_');
        Integer len = names.size();
        lang.add(names[len-1]);
      }
      //system.debug(' *** lang **'+lang);
      //system.debug(' *** lang size**'+lang.size());
      //for(String X:lang)
      //{
      //  uniqueLanguage.add(X);
      //}
      uniqueLanguageToDisplay.addall(lang);
      //uniqueLanguageToDisplay.addall(uniqueLanguage);
      return uniqueLanguageToDisplay;
    }
    set;}
  //<TJ20140422> Added new variable to capture ID of selected customer
  public String soldToId{get;set;}

  //<TJ20140523> Added new boolean to save datatable state
  public boolean checkSubmitted{get;set;}

  public String selectedBU {get;set;}

  public string csvString {get;set;
  }
  //adding a string to display Generate PCL button
  public String pclDisplayString{get;set;}

  public string dispNCS {get;set;}

  public string onBehalfOf {get;set;}

  public List<User> userReassignList {get;set;}
  public PAApprovalWF approvalWF{get;set;}          
  /**
   * TODO: Filter Fields to be cached here
   */
  public String soldToFilter {get;set;}
  //String to hold the filtered Material 
  public String materialFilter {get;set;}  
  //String to hold the filtered Product Hierarchy
  public String phFilter {get;set;}
  //String to hold the filtered Profit Center
  public String profitCenterFilter {get;set;}
  //String to hold the Profit Center code level
  public String profitCenterLevel {get;set;}
  //String to hold the filtered Customer Price Group
  public String cpgFilter {get;set;} 
  
  //Piyush <PG20202707> String to hold the filtered Distributor Code
  public String distFilter {get;set;} 
  
  //String to hold the filtered Material Price Group
  public String mpgFilter {get;set;}
  //String to hold the filtered Payment Terms 
  public String paymentTermsFilter {get;set;}
  //String to hold the filtered Sales Office
  public String salesOfficeFilter {get;set;}
  public String salesDistrictFilter {get;set;}
  //String to hold the filtered Ship to Code
  public String shipToFilter {get;set;}
  //String to hold the filtered Ship to Name
  public String shipToNameFilter {get;set;}
  //String to hold the filtered Price List Type 
  public String priceListTypeFilter {get;set;}
  //String to hold the filtered Disc Ref
  public String discRefFilter {get;set;}

  //String to hold the filtered End User Code
  public String endUserFilter {get;set;}
  //String to hold the filtered End user Name
  public String endUserNameFilter {get;set;}
  public String selectedendUserCode{get; set;}
  public String selectedendUser{get; set;}
  public String selectedendUserCountry{get; set;}
  //Ver 4.8 START
  //String to hold the filtered Price Ref. Partner
  public String priceRefPartnerFilter {get;set;}
  //String to hold the filtered Price Ref. Partner Name
  public String priceRefPartnerNameFilter {get;set;}
  //<VR20130509> Ver 4.21 VR 2013-05-09 : APAC ROLLOUT1 created variable to hold Customer Hierarchy value
  public String customerHierarchyFilter {get;set;}
  //<VR20130509> Ver 4.21 VR 2013-05-09 : APAC ROLLOUT1 created variable to hold Customer Hierarchy description
  public String customerHierarchyNameFilter {get;set;}
  //String to hold the filtered Market Segment
  public String marketSegmentFilter {get;set;}
  //String to hold the filtered End Use
  public String endUseFilter {get;set;}
  //String to hold the filtered Country
  public String countryFilter {get;set;}

  //<PP20131028> - String to hold the filtered Ship to Country
  public String shipToCountryFilter {get;set;}
  //<MS20141114> - Adding key field Project
  public String projectFilter {get;set;}

  public String kcodeFilter{get;set;}

  public String materialGroup1Filter{get;set;}

  //Ver 4.8 END
  //<MS20140514> - String to hold the filtered Variant
  public String variantFilter {get;set;}
  //<MS20150101>-String to hold contract
  public String contractFilter {get;set;}
  //<MS20140514> - String to hold the filtered ComPartner
  public String comPartnerFilter {get;set;}
  public String comPartnerNameFilter {get;set;}

  //<MS20150213> - String to hold the filtered Material Group 5 Key
  public String materialGroup5KeyFilter {get;set;}

  public String payerFilter {get;set;}
  public String payerNameFilter {get;set;}

  public String partnerZFFilter {get;set;}
  public String partnerZFNameFilter {get;set;}

  public String discRefNoFilter{get;set;}
  public String fixValDateFilter{get;set;}

  public String campaignFilter{get;set;}
  public String documentCurrencyFilter{get;set;}
  public String stateFilter{get;set;}

  //<MS20140514> - String to hold the filtered Plant
  public String plantFilter {get;set;}
  //<MS20140514> - String to hold the filtered Shipping Condition
  public String shippingConditionFilter {get;set;}
  //<MS20140514> - String to hold the filtered Destination Country
  public String destinationCountryFilter {get;set;}
  //<MS20140514> - String to hold the filtered Variant
  public String salesOrderTypeFilter {get;set;}
  public String salesOrderItemFilter {get;set;}//<SS20220827>
  
  //<SS20230501>
  public String valueCenterFilter {get;set;}
  public String extMaterialGroupFilter {get;set;}
  public String materialGroup2Filter {get;set;}
  public String prizeZoneFilter {get;set;}

  //<PP20130724>
  public String soldToNameFilter {get;set;}


  //brundha <BR20130719>
  public string viewCustomerPrices{get;set;}
  //brundha <BR20130719>
  public date ValidOnDateViewCustomerprices{get;set;}


  public String materialDescription {get;set;}

  public String scaleEnable {get;set;}

  public String phDescription{get;set;}
  // For fetch Records we should show this

  //<BB20130726> --Ver 4.32 Added salesTypeFilter,incotermsFilter
  public String incotermsFilter {get;set;}


  public  PASalesPriceSAP salesPriceSAP{get;set;}


  //for pricing Task 

  public string modeOfTerm{get;set;}

  //private RelatedObjectWrapper row;




  //added by sanjib for pcl need to check with this
  public transient  String listofids{get;set;}

  public list<PAwrapper> listofwrappertables{
    get{

      List<ERP_Sales_Prices_SAP__c> sapRecords=[select Record_Id__c
                                                from ERP_Sales_Prices_SAP__c where id=:listofids];
      list<string> recordsWithContact=new list<string>();
      list<string> recordsWithContact1=new list<string>();
      list<String> combinedid=new list<String>();
      list<String> reocrdswithfinalList=new list<String>();
      if(sapRecords.size()>0)
        combinedid=sapRecords[0].Record_Id__c.split('#'); 
      for(String d:combinedid){
        reocrdswithfinalList=d.split('/');
      }
      for(String g:reocrdswithfinalList){
        recordsWithContact.add(g.trim());
        recordsWithContact1.add('\''+g.trim()+'\'');
      } 
      if(recordsWithContact1.size()>0){

      }else{
        recordsWithContact1.add('\'\'');
      } 
      list<ERP_Sales_Prices_SAP__c> listofDynamicTables=new list<ERP_Sales_Prices_SAP__c>();
      /*listofDynamicTables=[select Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,
                                 Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,
                                 Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,
                                 Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,
                                 PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,
                                 Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,
                                 Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c,
                                 Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
                                 SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,Project_Id__c,
                                 ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,PCKC__c,
                                 ComPartner__c,ComPartner_Code__c,
                           Price_Holder__c from ERP_Sales_Prices_SAP__c where id in:recordsWithContact];*/
      listofDynamicTables =  (List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PARequest', 'listofDynamicTables', ' id in '+recordsWithContact1);                    
      Decimal separatorCheckPCL = 1.1;
      string separatorPCL = separatorCheckPCL.format().subString(1,2);
      if(separatorPCL==',') {
        for(ERP_Sales_Prices_SAP__c sapObj : listofDynamicTables) {
          if(sapObj.Rate__c!=null && sapObj.Rate__c.contains('.')) {
            sapObj.Rate__c = sapObj.Rate__c.replace('.',',');
          }
        }
      }

      list<String> codetobeused=new list<String>();
      list<String> texttobeused=new list<String>();
      String Sapcluster,SalesOrgCode;
      if(listofDynamicTables.size()>0)
      {
        Sapcluster=listofDynamicTables[0].SAP_Cluster__c;
        SalesOrgCode = listofDynamicTables[0].Sales_Org_Code__c;
      }
      listofwrappertables=new list<PAwrapper> ();
      for(ERP_Sales_Prices_SAP__c sapObj1 : listofDynamicTables) {
        String material=sapObj1.Material_Code__c;
        codetobeused.add(material);
      }

      list<Material_Localization__c> salestext=new list<Material_Localization__c>();
      salestext=[Select Sales_Text__c,Material__r.ERP_Material_code__c from Material_Localization__C Where Material__r.ERP_Material_code__c in:codetobeused 
                 and Material__r.RecordType.name ='ERP Material - Extended Data' and Language__c ='EN' 
                 and Material__r.ERP_Source_Cluster__C=:Sapcluster and Material__r.ERP_Sales_Org_Code__c=:SalesOrgCode];

      Map<string,string> matSalesMap = new Map<string,string>();

      for(string ss:codetobeused)
      {
        for(Material_Localization__c matLocal:salesText)
        {
          if(!String.isBlank(ss) && ss.equalsIgnoreCase(matLocal.Material__r.ERP_Material_code__c))
          {
            matSalesMap.put(ss,matLocal.sales_Text__c);
            break;
          }

        } 
      }

      //for(Integer i=0; i<codetobeused.size(); i++){
      Integer i = 0;
      for(string s1:codetobeused){
        //salestext=[Select Sales_Text__c from Material_Localization__c Where Material__r.ERP_Material_Code__c in:codetobeused and Material__r.RecordType ='ERP Extended Data' and Language ='EN'];
        PAwrapper s=new PAwrapper();

        if(listofDynamicTables != null && listofDynamicTables.size() >0) {
          s.sobjectRecord = listofDynamicTables[i];
        }
        //system.debug('inside this'+listofDynamicTables.size());
        // if(salestext[i].Sales_Text__c <> NULL)

        s.stringMap.put('salestext',' ');   
        if(!String.isBlank(matSalesMap.get(s1)))
          s.stringMap.put('salestext',(String)matSalesMap.get(s1));
        listofwrappertables.add(s);
        i++;
      }


      return listofwrappertables;

    }set;

  }
  //1.1 starts
  public list<String> listofCustomerContacts{
    get{
      list<string> customer=new list<string>();
      if(!String.isBlank(listofids)){
        ERP_Sales_Prices_SAP__c sapRecords=[select Record_Id__c
                                            from ERP_Sales_Prices_SAP__c where id=:listofids];

        customer=sapRecords.Record_Id__c.split('#');
      }
      return customer;

    }set;
  }

  //created for project teplate

  public list<Project_Price__c> listofProjectPrices{
    get
    {
      List<ERP_Sales_Prices_SAP__c> sapRecords=[select Record_Id__c
                                                from ERP_Sales_Prices_SAP__c where id=:listofids];
      list<string> recordsWithContact=new list<string>();
      list<String> combinedid=new list<String>();
      list<String> reocrdswithfinalList=new list<String>();
      if(sapRecords.size()>0)
        combinedid=sapRecords[0].Record_Id__c.split('#'); 
      for(String d:combinedid){
        reocrdswithfinalList=d.split('/');
        //system.debug('used by infy'+reocrdswithfinalList);
      }
      for(String g:reocrdswithfinalList){
        recordsWithContact.add(g.trim());
      }
      String idOfProject;
      list<String> s=new list<String>();
      list<ERP_Sales_Prices_SAP__c> projectd=[select Project_Id__c from ERP_Sales_Prices_SAP__c where id in:recordsWithContact];
      for(ERP_Sales_Prices_SAP__c d:projectd){
        idOfProject=d.Project_Id__c;
        s.add(idOfProject);
      }
      listofProjectPrices= new list<Project_Price__c>();
      listofProjectPrices=[select Project_Id__c,name,Valid_From__c,Valid_To__c,Project_Description__c,Project_Volume__c,Sold_To_Code__c from Project_Price__c where Project_Id__c = :idOfProject ];

      //system.debug('sanjib checking'+listofProjectPrices);
      return listofProjectPrices; }set;
  }
  public Pricing_Request__c listrequestdetils{
    get
    {
      List<ERP_Sales_Prices_SAP__c> sapRecords=[select Record_Id__c
                                                from ERP_Sales_Prices_SAP__c where id=:listofids];
      list<string> recordsWithContact=new list<string>();
      list<String> combinedid=new list<String>();
      list<String> reocrdswithfinalList=new list<String>();
      if(sapRecords.size()>0)
        combinedid=sapRecords[0].Record_Id__c.split('#'); 
      for(String d:combinedid){
        reocrdswithfinalList=d.split('/');
        //system.debug('used by infy'+reocrdswithfinalList);
      }
      for(String g:reocrdswithfinalList){
        recordsWithContact.add(g.trim());
      }
      String idOfProject;
      list<String> s=new list<String>();
      list<ERP_Sales_Prices_SAP__c> projectd=[select Project_Id__c from ERP_Sales_Prices_SAP__c where id in:recordsWithContact];
      for(ERP_Sales_Prices_SAP__c d:projectd){
        idOfProject=d.Project_Id__c;
        s.add(idOfProject);
      }
      list<Project_Price__c>listofProjectPrices= new list<Project_Price__c>();
      string reprojectid;
      listofProjectPrices=[select Project_Id__c,name,Valid_From__c,Valid_To__c,Project_Volume__c,Sold_To_Code__c from Project_Price__c where Project_Id__c  = :idOfProject];
      for(Project_Price__c b:listofProjectPrices){
        reprojectid=b.Project_Id__c;
      }
      list<Pricing_Request__c> listrequestdetils1=new list<Pricing_Request__c>();
      // <NS20130821> Added Landing_Cost__c field to query select clause
      //added condition to avoid null value search in project id field
      if(reprojectid!=null)
        listrequestdetils1=[select City__c,Country__c,Incoterm__c,Street__c,Sold_To__c,Terms_Of_Payment__c,Approver5__c,Approver5__r.name,createdby.name,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c  from Pricing_Request__c where Project_Id__c=:reprojectid];
      //system.debug('sanjib checking'+listofProjectPrices);
      if(listrequestdetils1.size()>0)
        return listrequestdetils1[0];
      else
        return null; }set;
  }

  //added by sanjib for pcl

  public PARequest( PAServiceState paServiceState) 
  {  
    isNetFloorVisible = true;
    baseURL = URL.getSalesforceBaseUrl().toExternalForm();
    pricingReqItemList = new List<Pricing_Request_Item__c>();
    //system.debug('check here for csvstring');
    //system.debug('***** const call');
    //sanjib
    email = new Map<string,string>();

    email.put('Type','');
    email.put('Language','');
    email.put('Description','');

    //<TJ20140523> Added new boolean to save datatable state
    checkSubmitted=false;
    selallFlag=false;
    ncsPCKC=false;
    this.requestServiceState = paServiceState;
    //<BB20140516> making displayRequestHistory false;
    displayPermanentRequestHistory= false;
    //<MS20140901> making displayTaskRequestHistory false
    displayTaskRequestHistory= false;
    /*initialise project price*/
    projectprice=new Project_Price__c();
    // if(paServiceState.ogitems <> NULL)
    //{
    // approvalWF = new PAApprovalWF(paServiceState); commented -bala for stack depth err..
    //system.debug('@@@@@ selectedBU req'+paServiceState.ogitems.selectedBU);
    List<OrgGroup__c> buList = new List<OrgGroup__c>();
    system.debug('........'+selectedBU);
    if(string.isBlank(selectedBU)){
      //For Async this will throw exception so to handle it is put in try-catch
      try{
        system.debug('........'+paServiceState.ogitems.selectedBU);
        selectedBU = [select Business__c FROM OrgGroup__c WHERE id=:paServiceState.ogitems.selectedBU].Business__c;
      }
      catch(exception e){
      }
    }

    pricingRequest = new Pricing_Request__c();
    boolean singleSalesarea = false;

    //system.debug('***pacurent'+paServiceState.currentRequest);
    customer = (PAERPCustomer) paServiceState.erpCustomer;
    //System.debug('paServiceState.erpCustomer :-'+customer.currentPrices);
    //customer.currentPrices= 'ExpOnly';
    if(customer==null) {
      customer = new PAERPCustomer(paServiceState);

      //System.debug('***customer details'+customer);
    }
    //added by brundha for links
    else if(customer!=null){
      //system.debug('***customer details'+customer);
      pricingRequest.Sold_To__c=customer.customerName;
      pricingRequest.SoldTo_Code__c=customer.customerCode;
      //<PG20191211> -- Added Customer Group 4 and Customer group 4 Code by Piyush
      pricingRequest.Customer_Group_4__c=customer.custGroupFour;
      pricingRequest.Customer_Group_4_Code__c=customer.custGroupFourcode ;
      pricingRequest.Dist_Channel__c=customer.dist;       
      pricingRequest.Division__c=customer.div;        
      pricingRequest.Sales_Org__c=customer.salesOrg;
      pricingRequest.Sales_Org_Code__c=customer.salesOrgCode;
      pricingRequest.Street__c=customer.street;
      pricingRequest.City__c=customer.City ;    
      pricingRequest.Country__c= customer.Country;
      pricingRequest.Dist_Channel_Code__c = customer.distCode; 
      pricingRequest.Division_Code__c = customer.divCode;
      pricingRequest.State_Province__c=customer.StateProvince;
      pricingRequest.Zip_PostalCode__c=customer.ZipPostalCode;  
      if(paServiceState.ogitems.isEndUserRebate){
        string bu = [select Business__c FROM OrgGroup__c WHERE id=:customer.ogitems.selectedBU].Business__c;
        String rpqIdentifier = bu+'-'+customer.salesOrgCode;
        Rebate_Price_Quote_Data__c rpqdata = Rebate_Price_Quote_Data__c.getInstance(rpqIdentifier);
        pricingRequest.Default_Per__c= rpqdata.Default_Per__c;
      }

      list<string> topList = new list<string>(); 
      list<string> incotermList = new list<string>();
    }

    //<TJ20140423> Retrieve ID for displaying customer details on page.
    Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
    List<ERP_Customer__c> cusObj = [SELECT id from ERP_Customer__c WHERE Customer_Code__c=:pricingRequest.SoldTo_Code__c AND
        Sales_Org_Code__c=:pricingRequest.Sales_Org_Code__c
        AND Distribution_Channel_Code__c = :pricingRequest.Dist_Channel_Code__c AND
        Division_Code__c = :pricingRequest.Division_Code__c AND RecordTypeId = :Customer_RTYPE_Id];
    if(cusObj!=null && cusObj.size()>0) {
      soldToId = cusObj[0].id;
    }

    //<SP20140527> START - Defaulting SalesArea in NCS/Massive/Export/Import flow if the list returns only one row
    if(paServiceState.ogItems.value!=null && (paServiceState.ogItems.value=='Massive' || paServiceState.ogItems.value=='NonCustomerSpecific' || paServiceState.ogItems.value=='Import'|| paServiceState.ogItems.value=='Export')) 
    {
      /*List<Organizational_Group_User__c> ogUsersSA = [SELECT OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel__c,
                                                            OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division__c,OrgGroup__r.ERP_Division_Code__c FROM Organizational_Group_User__c
                                                      WHERE Related_User__c =:UserInfo.getUserId() AND Organizational_Group_Item__r.Business__c=:paServiceState.ogitems.selectedBU];*/      
      List<Organizational_Group_User__c> ogUsersSA = (List<Organizational_Group_User__c>)PAQueryUtil.query('PARequest', 'ogUsersSA', ' Related_User__c =\''+UserInfo.getUserId()+'\' AND Organizational_Group_Item__r.Business__c=\''+paServiceState.ogitems.selectedBU+'\'');                                                
      if(ogUsersSA.size() == 1)
      {
        pricingRequest = new Pricing_Request__c();
        pricingRequest.Sales_Org_Code__c = ogUsersSA[0].OrgGroup__r.ERP_Sales_Org_Code__c;
        pricingRequest.Sales_Org__c = ogUsersSA[0].OrgGroup__r.ERP_Sales_Org__c;
        pricingRequest.Dist_Channel_Code__c = ogUsersSA[0].OrgGroup__r.ERP_Distribution_Channel_Code__c;
        pricingRequest.Dist_Channel__c= ogUsersSA[0].OrgGroup__r.ERP_Distribution_Channel__c;
        pricingRequest.Division_Code__c= ogUsersSA[0].OrgGroup__r.ERP_Division_Code__c;
        pricingRequest.Division__c = ogUsersSA[0].OrgGroup__r.ERP_Division__c;
        singleSalesarea = true;
        system.debug('pricingRequest.Sales_Org_Code__c is '+pricingRequest.Sales_Org_Code__c);

        //keyCombination=new PAKeyCombination(requestServiceState);
        //keycombination.pckcOptionsList = keycombination.getlistpckc();
      }   

      if(paServiceState.ogItems.value=='Import')
      {
        pricingRequest.Pricing_Request_Type__c = 'Import';
      }          

    }
    //<SP20140527> END - Defaulting SalesArea in NCS/Massive/Export/Import flow if the list returns only one row
    if(paServiceState.currentRequest==null)
    {

      //adding code for cluster
      //<PP20130711>
      //<PP20140418>
      /*List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                              Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c  FROM Organizational_Group_Item__c
                                                              WHERE Business__c =:paServiceState.ogitems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :customer.salesOrgCode
                                                              AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :customer.distCode AND
                                                        OrgGroup__r.ERP_Division_Code__c = :customer.divCode];*/

      List<Organizational_Group_Item__c>  buOrgGroup = (List<Organizational_Group_Item__c>)PAQueryUtil.query('PARequest', 'buOrgGroup', ' Business__c =\''+paServiceState.ogitems.selectedBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c = \''+customer.salesOrgCode+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c = \''+customer.distCode+'\' AND OrgGroup__r.ERP_Division_Code__c = \''+customer.divCode+'\'');
      //neeha 21st aug
      //System.debug('******Organizational_Group_Item__c.landing cost'+buOrgGroup[0].Landing_Cost__c);


      String sppId;
      if(buOrgGroup!=null && buOrgGroup.size()!=0){
        sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
        //<PP20140421>
        currentPricesSelection = buOrgGroup.get(0).Default_Prices_Selection__c;
      }
      //system.debug('***sppId'+sppId); 
      List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                              SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];

      String sourceCluster;
      if(sppList!=null && sppList.size()!=0){
        sourceCluster=sppList.get(0).SAP_Cluster__c;
      }
      //system.debug('***sourceCluster'+sourceCluster);   
      List<ERP_Relationship__c> paRelationList = [SELECT Id,User__c,User__r.Id,User__r.name,User__r.E_Pass_ID__c,User__r.email,User__r.External_ERP_ID__c,User__r.User_Country__c FROM ERP_Relationship__c WHERE Partner_Function__c ='Customer Service Rep' 
          AND ERP_Customer__r.Customer_code__c =: customer.paERPCustomer.Customer_code__c AND /* RecordType.Name ='ERP Relationship - Person' AND */
          ERP_Customer__r.Sales_Org_Code__c =:customer.salesOrgCode AND ERP_Customer__r.Distribution_Channel_Code__c = :customer.distCode AND 
          ERP_Customer__r.Division_Code__c =:customer.divCode  AND ERP_Customer__r.Source_Cluster__c=:sourceCluster AND User__c <> NULL]; //Shiva- Added sales org, dist channel and division code in the where clause For issue IS ID-00034990
      //system.debug('***paRelationList'+paRelationList);
      //system.debug('***paRelationList size '+paRelationList.size());
      List<Id> RelatedUserIds = new List<Id>();
      for(ERP_Relationship__c X:paRelationList)
      {
        RelatedUserIds.add(X.User__r.Id);
      }

      List<Organizational_Group_User__c> OrgGrpUser = [SELECT Id,Related_User__r.Id,Related_User__r.Name,Related_User__r.E_Pass_ID__c,Related_User__r.email,Related_User__r.External_ERP_ID__c,Related_User__r.User_Country__c FROM 
                                                       Organizational_Group_User__c WHERE Related_User__c IN :RelatedUserIds AND Organizational_Group_Item__r.Business__c =:paServiceState.ogitems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c =:customer.salesOrgCode  
                                                       AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:customer.distCode AND OrgGroup__r.ERP_Division_Code__c=:customer.divCode];
      //Shiva-- For issue IS ID-00034990
      //<Start> Changes has been made regarding issue IS ID-00063940 by Kunal Sharma(752081)
      if (SelectedBU == 'DPP AP')
      {
        if(OrgGrpUser != null && OrgGrpUser.size()==1)
        {
                userName = OrgGrpUser[0].Related_User__r.name;
                userSelected = (Id)OrgGrpUser[0].Related_User__c;
                userSelectedEpassId = OrgGrpUser[0].Related_User__r.E_Pass_ID__c;
        }
        else if(OrgGrpUser!=null && OrgGrpUser.size()>1)
                {
                        userName = '';
                        userSelected = '';
                        userSelectedEpassId = '';       
                }
            }
        else  if(SelectedBU != 'DPP AP')
            {
         if(OrgGrpUser.size() <> 0)
        {
                userName = OrgGrpUser[0].Related_User__r.name;
                userSelected = (Id)OrgGrpUser[0].Related_User__c;
                userSelectedEpassId = OrgGrpUser[0].Related_User__r.E_Pass_ID__c;
        }
            }
        //<End> Changes has been made regarding issue IS ID-00063940 by Kunal Sharma(752081)
      /*    
                        if(paRelationList.size() <> 0)
                        {
                            userName = paRelationList[0].User__r.name;
                            userSelected = (Id)paRelationList[0].User__c;
                            userSelectedEpassId = paRelationList[0].User__r.E_Pass_ID__c;
                        }*/
    }
    if(singleSalesarea){
      //customer.paErpCustomer = ((List<ERP_Customer__c>)PAQueryUtil.query('PARequest', 'customer.paErpCustomer', ' Customer_code__c=\''+pricingRequest.soldto_code__c+'\' AND sales_org_code__c=\''+pricingRequest.sales_org_code__c+'\' AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+pricingRequest.Division_code__c+'\' limit 1'))[0];                                    
      //          paServiceState.erpCustomer = customer;         
      //requestServiceState.currentRequest.pricingRequest = pricingRequest;
      //       keyCombination=new PAKeyCombination(requestServiceState);
      //       keycombination.pckcOptionsList = keycombination.getlistpckc();
    }
    //neeha jan 7th
    if(paServiceState.currentRequest!=null){
      if(paServiceState.currentRequest.pricingRequest!=null)
      {
        //Version 4.24:Production Issue, request status changing to Draft from Submitted/Recalled/Rejected
        if(paServiceState.currentRequest.pricingRequest.Request_Approval_Status__c == NULL)
          paServiceState.currentRequest.pricingRequest.Request_Approval_Status__c = 'Draft';
        if(paServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c != null && paServiceState.currentRequest.pricingRequest.Division_Code__c != null
            && paServiceState.currentRequest.pricingRequest.Sales_Org_Code__c != null && paServiceState.ogItems.selectedBU != null)
        {
          List<Organizational_Group_Item__c> tempOgList=new List<Organizational_Group_Item__c>();
          //<PP20130711>
          //<PP20140418>
          /*tempOgList= [SELECT Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                       Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c,Non_Customer_Permanent_Request_Reasons__c,
                                 OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Distribution_Channel_Code__c, 
                                 OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c FROM Organizational_Group_Item__c
                       WHERE Business__c =:paServiceState.ogItems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :paServiceState.currentRequest.pricingRequest.Sales_Org_Code__c
                                          AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :paServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c AND
                                          OrgGroup__r.ERP_Division_Code__c = :paServiceState.currentRequest.pricingRequest.Division_Code__c];*/
          tempOgList = (List<Organizational_Group_Item__c>)PAQueryUtil.query('PARequest', 'tempOgList', ' Business__c =\''+paServiceState.ogItems.selectedBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c =\''+paServiceState.currentRequest.pricingRequest.Sales_Org_Code__c+'\' AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = \''+paServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c+'\' AND OrgGroup__r.ERP_Division_Code__c = \''+paServiceState.currentRequest.pricingRequest.Division_Code__c+'\'');
          if(tempOgList!=null && tempOgList.size()!=0){

            paServiceState.ogItems.orgGroupItems=tempOgList[0];
          }
          //system.debug('***** Org Group Item'+paServiceState.ogItems.orgGroupItems);
        }
        if(paServiceState.currentRequest.pricingRequest.Id!=null)
        {   
          //<PP20130422> -- Ver 4.18
          //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
          //<PP20130711>
          //system.debug('***not null'); 
          pricingRequest =  paServiceState.currentRequest.pricingRequest;
          //<PP20130711>
          //Brundha Roll out 2 <BR20130625>
          //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<BB20140429> --Added Default_Currency__c Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                            State_Province__c,Spot_Type__c, Pricing_exception__c, Sold_To__c,SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                      SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                      Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                      Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                      LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,Landing_Cost__c,
                                      Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                      CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c,Assigned_To__r.name,Assigned_To__r.E_Pass_Id__c, Approver5__c, Approver5_Date__c,
                                      Approver4__c, Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                            Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,NPC_Status__c,Approver1_Date__c, Request_Id__c,Last_Modified_by__c,Incoterms_Code__c,created_by__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c, Project_Header_Approval_Flag__c,Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,
                                              Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                              ComPartner__c, ComPartner_Code__c 
                                              FROM Pricing_Request__c
                                              WHERE  Id = :pricingRequest.Id];*/
          pricingRequest =  ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+pricingRequest.Id+'\''))[0];                       

          //<BB20140508> -- Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query.
          if(!String.isBlank(pricingRequest.SoldTo_Code__c))
            /*customer.paErpCustomer = [SELECT Id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c,
                                                  Distribution_Channel_Code__c,Distribution_channel__c,
                                                  Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                                                  Customer_Price_Group__c,Price_List_type__c,
                                                  price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c,
                                                  sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,
                                                  Zip_Postal_Code__c,Customer_Group_2_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Account_Group_Code__c FROM ERP_Customer__c 
                                                  WHERE Customer_code__c=:pricingRequest.soldto_code__c AND sales_org_code__c=:pricingRequest.sales_org_code__c
                                                  AND Distribution_Channel_Code__c=:pricingRequest.Dist_channel_code__c
                                      AND Division_code__c=:pricingRequest.Division_code__c limit 1];*/
            customer.paErpCustomer = ((List<ERP_Customer__c>)PAQueryUtil.query('PARequest', 'customer.paErpCustomer', ' Customer_code__c=\''+pricingRequest.soldto_code__c+'\' AND sales_org_code__c=\''+pricingRequest.sales_org_code__c+'\' AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+pricingRequest.Division_code__c+'\' limit 1'))[0];                                    
          paServiceState.erpCustomer = customer;         


        }

      }

    } 

    /*initialise project price*/
    projectprice=new Project_Price__c();
    //<PP20140421> START
    if(paServiceState.erpCustomer != null && !String.isBlank(paServiceState.erpCustomer.customerCode)
        && paServiceState.erpCustomer.currentPrices != null
        && paServiceState.erpCustomer.currentPrices.equalsIgnoreCase('viewPricesOnLoad'))
    {
      //pricingRequest.Due_Date__c = System.today();
      //action('','','ViewCustomerPrices');

    }
    else
    {
      relatedWrappersList = getListWrappers();
    }
    //<PP20140421> END
    if(paServiceState.ogItems.value=='Massive')
    {
      if(PAServicestate.ogItems.salesAdminPermissionSetFlag || paServiceState.ogItems.isBUAdmin)
        pricingRequest.On_Behalf_Of__c = paServiceState.ogItems.selectedUser;
      else
      {
        User u;
        u=[Select name from user where name like :paServiceState.ogItems.loggedInUserName limit 1];
        pricingRequest.On_Behalf_Of__c = u.id;
        //pricingRequest.On_Behalf_Of__c = Userinfo.getUserId();//IS TI-00094572 updated code to fix wrong notification contact
        //system.debug(u+' '+pricingRequest.On_Behalf_Of__r.name);
      }
    }


    //system.debug('***Related list'+relatedWrappersList.size());
    //PAApprovalWF approvalWF = new PAApprovalWF();
    // approvalWF.generateApproverList(paServiceState);

  }

  public PARequest(string term,string id)
  {
    modeOfTerm = term;
  }


  public List<sObject> getListBusinessComponents() {

    // get all the request that are part of the customer 
    //<PP20130422> -- Ver 4.18
    //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
    OrgGroup__c paOGSel = [SELECT Id,Name,Business__c FROM OrgGroup__c WHERE Id = :customer.ogitems.SelectedBU AND RecordType.Name = 'Business'];
    //<PP20130711>
    //Brundha Roll out 2 <BR20130625>
    //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
    //<BB20140321> Added Auto_Approver Fields in the query
    //<MS20140421> Added Backup_Level Name and approverText Fields in the query
    //<BB20140429> --Added Default_Currency__c Fields in the query
    //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
    // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
    /*List<Pricing_Request__c> pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                                    State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                                        SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                                        Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId,Owner.Name, On_Behalf_Of__c,
                                                        Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                                        LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                                        Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                                        CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                                        Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                                                    Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,NPC_Status__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c,created_by__c, Request_Id__c, Project_Header_Approval_Flag__c,Sent_to_Backup_Approver__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                              Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                              ComPartner__c, ComPartner_Code__c 
                              FROM Pricing_Request__c WHERE Customer_Specific__c = true
                              AND BU__c = :paOGSel.Business__c limit 1000];*/
    List<Pricing_Request__c> pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Customer_Specific__c = true AND BU__c = \''+paOGSel.Business__c+'\' limit 1000');
    //this.requestsList = pricingRequestList;
    return pricingRequestsList;
  } 



  /*Shiva-- for displaying pricing task type in BU-SA level for pricing task scenario */
  public List<SelectOption> getPricingTaskType()
  {
    string stringRequestReasons;
    if(customer.ogitems.value != null)
    {
      customer.ogitems.ogItemFromRequest(pricingRequest);
      if(customer.ogitems.value.equalsIgnoreCase('PricingTaskReasons'))
      {
        stringRequestReasons = customer.ogitems.orgGroupItems.Pricing_Task_Type__c;
      } 
    }
    else if((pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && pricingRequest.Request_Type__c == 'Customer Specific'))
    {
      //customer.ogitems.value = 'PricingTaskReasons';
      //system.debug('In PricingTask Reasons Else');
      customer.ogitems.ogItemFromRequest(pricingRequest);
      stringRequestReasons = customer.ogitems.orgGroupItems.Pricing_Task_Type__c;
    }

    List<String> requestReasonList = new List<String>();
    if(stringRequestReasons != null)
    {
      requestReasonList = stringRequestReasons.split(';');
      //<PP20130612>
      requestReasonList.sort();
      //system.debug('+++ requestReasonList --'+requestReasonList);
    }

    List<selectOption> requestReasons = new List<selectOption>();
    for(string s:requestReasonList)
    {
      requestReasons.add(new selectOption(s,s));
    }
    if(requestReasons.size()>1)
    {
      requestReasons.add(0,new SelectOption('','--Select--'));
    }
    //Shiva-- added else part for issue IS ID-00034991
    else
    {
      if(requestReasonList.size()>0)
        PricingRequest.Spot_Type__c = requestReasonList[0];
      getListOptions();
    }
    //system.debug('+++ requestReasons --'+requestReasons);
    return requestReasons; 

  }
  //<TJ20150219>
  public List<SelectOption> getSubtype()
  {
    List<selectOption> subTypeList = new List<selectOption>();

         System.debug('==========selectedBU==='+selectedBU);
    //<SS20220826> - Adding Other Subtype value based on business START    
    List<PA_Pricing_Task_Subtype__mdt> lstPTS = PA_Pricing_Task_Subtype__mdt.getAll().values();
    Map<String, List<String>> mapBUToSubType = new Map<String, List<String>>();
    for(PA_Pricing_Task_Subtype__mdt objPTS : lstPTS){
    List<String> lstSubType = objPTS.Other_Subtype_Values__c.split(',');
    mapBUToSubType.put(objPTS.Label, lstSubType);
    }
    if(mapBUToSubType.containskey(selectedBU)){
    for(String strST : mapBUToSubType.get(selectedBU)){
    subtypelist.add(new selectoption(strST, strST));
    }
    }
    else if(mapBUToSubType.containskey('Other')){
    for(String strST : mapBUToSubType.get('Other')){
    subtypelist.add(new selectoption(strST, strST));
    }
    }
    //<SS20220826> - Adding Other Subtype value based on business END
 /*
//updated by Madhurima Daggumati to add subtype values specific to the business - IS ID-00066245 - Start
   if ( selectedBU =='CPM EMEA')
   {
    subTypeList.add(new SelectOption('Surcharges','Surcharges'));
    subTypeList.add(new SelectOption('Credit Note','Credit Note')); 
    subTypeList.add(new SelectOption('Other Subtype','Other Subtype'));     
   } 
   else if ( selectedBU =='DPT NA')
   {
    subTypeList.add(new SelectOption('End User Special Quotation Pricing','End User Special Quotation Pricing'));
    subTypeList.add(new SelectOption('Other Subtype','Other Subtype'));     
   } 
   //<AG20200303>start
   else if ( selectedBU =='BI North America')
   {
       subTypeList.add(new SelectOption('Surcharges','Surcharges'));
       subTypeList.add(new SelectOption('Exception','Exception'));
   }
   //end
   else
   {
   subTypeList.add(new SelectOption('Surcharges','Surcharges'));
   }*/
//updated by Madhurima Daggumati to add subtype values specific to the business - IS ID-00066245 - End   
        
    return subTypeList; 
  }

  /*public List<SelectOption> getPricingException()
    {
        string stringRequestException;
        if(customer.ogitems.value != null)
        {
            customer.ogitems.ogItemFromRequest(pricingRequest);
           if(customer.ogitems.value.equalsIgnoreCase('PricingTaskReasons')||customer.ogitems.value.equalsIgnoreCase('ProjectReasons') || customer.ogitems.value.equalsIgnoreCase('CustRequestReasons'))
            {
                stringRequestException = customer.ogitems.orgGroupItems.Pricing_exception__c;
            } 
        }

        List<String> requestExceptionList = new List<String>();
        if(stringRequestException != null)
        {
            requestExceptionList = stringRequestException.split(';');
            //<PP20130612>
            requestExceptionList.sort();
            System.debug('+++ requestExceptionList --'+stringRequestException);
        }

        List<selectOption> requestException = new List<selectOption>();
        for(string s:requestExceptionList)
        {
            requestException.add(new selectOption(s,s));
        }
        if(requestException.size()>1)
        {
            requestException.add(0,new SelectOption('','--Select--'));
        }
        system.debug('+++ requestException --'+requestException);
        return requestException; 

    }*/
  //Brundha Roll out 2 <BR20130625>
  public List<SelectOption> getPricingException()
  {
    List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

    List<String> selectedPEList = new List<String>();

    OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'pricing Exception' AND Organizational_Group_Item__c=:requestServiceState.ogItems.orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

    for(Org_Group_ERP_Key__c X:OGKey)
    {
      string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
      selectedPEList.add(concat);

    }

    List<SelectOption> requestPricingException;
    if(selectedPEList.size() > 0)
    {
      requestPricingException = new List<SelectOption>();
    }

    for(string s:selectedPEList)
    {
      requestPricingException.add(new selectOption(s,s));
    }
    if(requestPricingException != null && requestPricingException.size()>1)
    {
      requestPricingException.add(0,new SelectOption('','--Select--'));
    }
    //system.debug('!!!!requestPricingException'+requestPricingException);
    //system.debug('!!!!requestServiceState.ogItems.orgGroupItems.Id'+requestServiceState.ogItems.orgGroupItems.Id);
    return requestPricingException;
  }

  public List<SelectOption> getListOptions() 
  {
    string stringRequestReasons;
    //system.debug('+++ value --'+customer.ogitems.value);
    //system.debug('check pclDisplayPopUp'+pclDisplayPopUp);
    /*Bala - For Request Reasons*/
    //checking the reasons that has been set 
    system.debug('inside PARequest Class,getListOptions method, customer.ogitems is '+customer.ogitems);
    system.debug('inside PARequest Class,getListOptions method, pricingRequest is '+pricingRequest);
    if(customer.ogitems.value != null)
    {

      customer.ogitems.ogItemFromRequest(pricingRequest); 

      if(customer.ogitems.value.equalsIgnoreCase('CustRequestReasons'))
      {
        if(customer.ogitems.orgGroupItems.Customer_Request_Reasons__c!=null)
          stringRequestReasons = customer.ogitems.orgGroupItems.Customer_Request_Reasons__c;
      }

      else if(customer.ogitems.value.equalsIgnoreCase('PricingTaskReasons') && pricingRequest.Spot_Type__c != null && !pricingRequest.Spot_Type__c.equalsIgnoreCase('Rebate Agreement'))
      {
        //stringRequestReasons = customer.ogitems.orgGroupItems.Pricing_Task_Reasons__c;
        //Updated by Nadeem Shaik to add request reason to Rebate request types - IS ID-00068874 - Start 
        // <SS20230501> Added Condition for adding request reasons of rebate agreement "Rebate Payout Product Shipment" 
        if(pricingRequest.Spot_Type__c=='Rebate adjustment' || pricingRequest.Spot_Type__c=='Rebate payout' || pricingRequest.Spot_Type__c=='Rebate Payout Product Shipment' )   
          {
              stringRequestReasons = customer.ogitems.orgGroupItems.Rebate_Agreement__c;
          }
          else
          {
              stringRequestReasons = customer.ogitems.orgGroupItems.Pricing_Task_Reasons__c;
          }
        //Updated by Nadeem Shaik to add request reason to Rebate request types - IS ID-00068874 - End
      }
      else if(customer.ogitems.value.equalsIgnoreCase('PricingTaskReasons') && pricingRequest.Spot_Type__c != null && pricingRequest.Spot_Type__c.equalsIgnoreCase('Rebate Agreement'))
      {
        stringRequestReasons = customer.ogitems.orgGroupItems.Rebate_Agreement__c;
      }

      else if(customer.ogitems.value.equalsIgnoreCase('NonCustReasons'))
      {
        //customer.ogitems.ogItemFromRequest(pricingRequest);
        stringRequestReasons = customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c;
      }
      else if(customer.ogitems.value.equalsIgnoreCase('ProjectReasons'))
      {
        //Added - bala 25 Feb 2013
        List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
        //<PP20130711>
        //<PP20140418>
        //<MS20140424> Added Approval_Escalation_Pricing_Task__c field to the query
        /*orgGroupItemsList = [SELECT Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,Id,ERP_Pricing_Procedure__c,Business__r.Name, Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Customer_Request_Reasons__c,
                             Latest_Valid_From_Offset_Non_Cust_Spec__c,Rebate_Agreement__c ,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c,
                             landing_cost__c,Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Type__c,Pricing_Task_Reasons__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,Approval_Escalation_Price_Requests__c,Approval_Escalation_Pricing_Task__c
                                     FROM Organizational_Group_Item__c 
                                     WHERE Business__c =:customer.ogitems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :customer.paERPCustomer.sales_org_code__c
                                     AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :customer.paERPCustomer.Distribution_channel_code__c AND
                             OrgGroup__r.ERP_Division_Code__c = :customer.paERPCustomer.Division_code__c];*/

        orgGroupItemsList = (List<Organizational_Group_Item__c>)PAQueryUtil.query('PARequest', 'orgGroupItemsList', ' Business__c =\''+customer.ogitems.selectedBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c = \''+customer.paERPCustomer.sales_org_code__c+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c = \''+customer.paERPCustomer.Distribution_channel_code__c+'\' AND OrgGroup__r.ERP_Division_Code__c = \''+customer.paERPCustomer.Division_code__c+'\'');
        if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0){
          customer.ogitems.orgGroupItems  =   orgGroupItemsList[0];  
          //completed
        } 
        //customer.ogitems.ogItemFromRequest(pricingRequest);
        stringRequestReasons = customer.ogitems.orgGroupItems.Project_Request_Reasons__c;
      }
    }

    /*will work during editing of the request*/  
    if(csvString=='status')
    {
      requestServiceState.ogitems.value = null;
      csvString=null;
    }   
    else if((pricingRequest.Pricing_Request_Type__c == 'Permanent' &&  pricingRequest.Request_Type__c == 'Customer Specific')||
        (pricingRequest.Pricing_Request_Type__c == 'Permanent' && pricingRequest.Request_Type__c == 'Massive'))
    {
      //customer.ogitems.value = 'CustRequestReasons';
      customer.ogitems.ogItemFromRequest(pricingRequest);
      if(customer.ogitems.orgGroupItems.Customer_Request_Reasons__c!=null)
        stringRequestReasons = customer.ogitems.orgGroupItems.Customer_Request_Reasons__c;
    }
    else if(pricingRequest.Pricing_Request_Type__c == 'Permanent' && pricingRequest.Request_Type__c == 'Non Customer Specific')
    {
      //customer.ogitems.value = 'NonCustReasons';
      customer.ogitems.ogItemFromRequest(pricingRequest);
      stringRequestReasons = customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c;
    }
    //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the reasons
    else if((pricingRequest.Pricing_Request_Type__c == 'Floor' && pricingRequest.Request_Type__c == 'Non Customer Specific') || (pricingRequest.Pricing_Request_Type__c == 'Reference' && pricingRequest.Request_Type__c == 'Non Customer Specific'))
    {
      //customer.ogitems.value = 'NonCustReasons';
      customer.ogitems.ogItemFromRequest(pricingRequest);
      stringRequestReasons = customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c;
    }
    else if((pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && pricingRequest.Spot_Type__c != null && !pricingRequest.Spot_Type__c.equalsIgnoreCase('Rebate Agreement')&& pricingRequest.Request_Type__c == 'Customer Specific'))
    {
      //customer.ogitems.value = 'PricingTaskReasons';
      customer.ogitems.ogItemFromRequest(pricingRequest);
      // stringRequestReasons = customer.ogitems.orgGroupItems.Pricing_Task_Reasons__c;
      //Updated by Nadeem Shaik to add request reason to Rebate request types - IS ID-00068874 - Start
      //<SS20230501> - Added Condition for adding request reasons of rebate agreement to "Rebate Payout Product Shipment"
         if(pricingRequest.Spot_Type__c=='Rebate adjustment' || pricingRequest.Spot_Type__c=='Rebate payout' || pricingRequest.Spot_Type__c=='Rebate Payout Product Shipment') 
          {
              stringRequestReasons = customer.ogitems.orgGroupItems.Rebate_Agreement__c;
          }
          else
          {
              stringRequestReasons = customer.ogitems.orgGroupItems.Pricing_Task_Reasons__c;
          }
         //Updated by Nadeem Shaik to add request reason to Rebate request types - IS ID-00068874 - End
    }
    else if((pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && pricingRequest.Spot_Type__c != null && pricingRequest.Spot_Type__c.equalsIgnoreCase('Rebate Agreement')&& pricingRequest.Request_Type__c == 'Customer Specific'))
    {
      //customer.ogitems.value = 'PricingTaskReasons';
      //system.debug('In PricingTask Reasons Else');
      customer.ogitems.ogItemFromRequest(pricingRequest);
      stringRequestReasons = customer.ogitems.orgGroupItems.Rebate_Agreement__c;
    }
    else if(pricingRequest.Pricing_Request_Type__c == 'Project Pricing' && pricingRequest.Request_Type__c == 'Customer Specific')
    {
      // customer.ogitems.value = 'ProjectReasons';
      customer.ogitems.ogItemFromRequest(pricingRequest);
      stringRequestReasons = customer.ogitems.orgGroupItems.Project_Request_Reasons__c;
      //system.debug('### Reasons'+stringRequestReasons);
    }
    else if(pricingRequest.Request_Type__c == 'Import' || pricingRequest.Pricing_Request_Type__c=='Import')
    {

      requestServiceState.ogItems.ogItemFromRequest(pricingRequest);
      //SS20230110 <START>
      if(customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c!=null && customer.ogitems.orgGroupItems.Customer_Request_Reasons__c!=null){
          stringRequestReasons = customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c+';'+customer.ogitems.orgGroupItems.Customer_Request_Reasons__c;
          }
      else if(customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c == null && customer.ogitems.orgGroupItems.Customer_Request_Reasons__c!=null ){
              stringRequestReasons = customer.ogitems.orgGroupItems.Customer_Request_Reasons__c;
              }
      else{
              stringRequestReasons = customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c;
          }        
      //SS20230110 <END> 
      
      //stringRequestReasons = customer.ogitems.orgGroupItems.Non_Customer_Permanent_Request_Reasons__c+';'+customer.ogitems.orgGroupItems.Customer_Request_Reasons__c;
    }

    if(pclShowSelectionTable==true)
    {
      List<selectOption> selectLanguage = new List<selectOption>();
      for(String s:emailTemplate)
      {
        selectLanguage.add(new SelectOption(s,s));
      }
      return selectLanguage;
    }

    List<String> requestReasonList = new List<String>();
    Set<String> requestReasonSet = new Set<String>();
    if(stringRequestReasons != null)
    {
      requestReasonList = stringRequestReasons.split(';');
      requestReasonSet.addall(requestReasonList);
      requestReasonList.clear();
      requestReasonList.addall(requestReasonSet);
    }

    List<selectOption> requestReasons = new List<selectOption>();
    if(requestReasonList.size() > 0)
    {
      //<PP20130612>
      requestReasonList.sort();
      for(string s:requestReasonList)
      {
        requestReasons.add(new selectOption(s,s));
      }
    }

    if(requestReasons.size()>1 )
    {
      requestReasons.add(0,new SelectOption('','--Select--'));
    }
    if(requestReasons.size() == 0)
    {
      requestReasons.add(new SelectOption('','--Select--'));
    }
    return requestReasons; 
  }
  public List<PARelatedList> getListWrappers() {
    system.debug(logginglevel.error,'****** in List wrappers of PARequest');
    Map<string,List<Pricing_Request__c>> pars = new Map<string,List<Pricing_Request__c>>();
    List<Pricing_Request__c> permanentPricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> interimPricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> projectPricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> importPricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> spotPricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> nonCustPricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> massivePricingRequestsList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> pricingRequestsList=new List<Pricing_Request__c>();
    List<Pricing_Request__c> floorPricingRequestsList=new List<Pricing_Request__c>();   //<VR20130718>
    List<Pricing_Request__c> ReferencePricingRequestsList=new List<Pricing_Request__c>();   //<VR20130718>
    //<BB20140516> Added list to hold request for request History
    //<MS20140901> Added list to hold task request History
    List<Pricing_Request__c> permanentPricingRequestsHistoryList = new List<Pricing_Request__c>();
    List<Pricing_Request__c> taskPricingRequestsHistoryList = new List<Pricing_Request__c>();
    OrgGroup__c paOGSel = new OrgGroup__c();
    //4.11(in orgGroupItem)
    if(!String.isBlank(requestServiceState.ogItems.selectedBU))
    {
      //4.11
      //requestServiceState.ogItems.toggleSection();
      toggleSection();
    }
    system.debug(' requestServiceState.ogItems.value is '+requestServiceState.ogItems.value);
    //4.11 -> End   
    //system.debug('SelectedBU:'+customer.ogitems.SelectedBU);  
    //Start: <GT20141027>Modofied the selected BU condition, added error message incase of select  
    if(customer.ogitems.SelectedBU!='--Select--' && customer.ogitems.SelectedBU!=null)
    {
      paOGSel = [SELECT Id,Name,Business__c FROM OrgGroup__c WHERE Id = :customer.ogitems.SelectedBU AND RecordType.Name = 'Business'];

    }
    else if (customer.ogitems.SelectedBU=='--Select--')
    {
      ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please select a Business');
      ApexPages.addMessage(errorMsg);
    }
    //End: <GT20141027>Modofied the selected BU condition, added error message incase of select  
    //system.debug('****** paOGSel '+paOGSel.Business__c);
    //for status links
    //system.debug('check here for csvstring');
    //system.debug('abcbsfubsv'+requestServiceState.ogItems.value);
    if(requestServiceState.ogItems.value=='Draft'){
      csvString='Draft';
    }
    if(requestServiceState.ogItems.value=='Submitted'){
      csvString='Submitted';
    }
    if(requestServiceState.ogItems.value=='Approved'){
      csvString='Approved';
    }
    if(requestServiceState.ogItems.value=='Rejected'){
      csvString='Rejected';
    }
    if(requestServiceState.ogItems.value=='Recalled'){
      csvString='Recalled';
    }
    if(requestServiceState.ogItems.value=='Pending'){
      csvString='Pending';

    }
    if(requestServiceState.ogItems.value!=null && (requestServiceState.ogItems.value.equalsIgnoreCase('Pending'))){
      // string proName=Util_SortHelper.getBuAdmin(Userinfo.getProfileId());
      string proName = PAUtil.getBuAdmin(Userinfo.getProfileId());
      /*Feb-21--Brundha V1.5 changed from PA BU Admin to isBUAdmin*/
      //Ver 2.6 START
      //Start :<GT20140902>
      string bu = '\''+paOGSel.Business__c+'\'';
      system.debug(' requesttype is'+requesttype);
      String query = 'SELECT F_NPC_Callout_Status__c,is_End_User_Rebate__c,End_User__c,End_User_code__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId,Owner.Name, On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c,Current_Approver__r.Name, CreatedDate,CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Project_Id__c,Project_Name__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Last_Modified_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,ComPartner__c,ComPartner_Code__c,Submitted_By__c';
      query+=' FROM Pricing_Request__c WHERE BU__c ='+bu+' AND Request_Approval_Status__c=\'Submitted\'';
      if(requesttype=='Customer Specific')
      {
        query+=' And Customer_Specific__c=true And Pricing_Request_Type__c!=\'Project Pricing\' And Pricing_Request_Type__c!=\'Pricing Task\'';
      }
      if(requesttype=='Project Request')
        query+=' And Pricing_Request_Type__c=\'Project Pricing\'';
      if(requesttype=='Pricing Task Request')
        query+=' And Pricing_Request_Type__c=\'Pricing Task\'';
      if(requesttype=='Non Customer Specific')
        query+=' And Customer_Specific__c=false';
      //End: <GT20140902>
      // ORDER BY LastModifiedDate DESC Limit 1000';

      if(requestServiceState.ogItems.isBUAdmin){
        //<PP20130422> -- Ver 4.18
        //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
        //<PP20130711>
        //Brundha Roll out 2 <BR20130625>
        //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
        //<BB20140321> Added Auto_Approver Fields in the query
        //<MS20140421> Added Backup_Level Name and approverText Fields in the query
        //<BB20140429> --Added Default_Currency__c Fields in the query
        //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
        // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
        /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Sold_To_Code__r.Sales_Area__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,
                                       State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,ales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                       SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                       Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId,Owner.Name, On_Behalf_Of__c,
                                       Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                       LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                       Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c,Current_Approver__r.Name, CreatedDate,
                                       CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                       Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                                       Key_Combination__c,Pricing_Condition__c,Project_Id__c,Project_Name__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                       Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
                              Sold_To_Code__r.Terms_Of_Payment__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Last_Modified_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                              /* Auto_Approver_Level_1__c,Auto_Approver_Level_1__r.name,Auto_Approver_Level_2__c,Auto_Approver_Level_2__r.name,Auto_Approver_Level_3__c,Auto_Approver_Level_3__r.name,Auto_Approver_Level_4__c,Auto_Approver_Level_4__r.name,Auto_Approver_Level_5__c,Auto_Approver_Level_5__r.name,
                              Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c 
                              FROM Pricing_Request__c WHERE BU__c = :paOGSel.Business__c AND Request_Approval_Status__c='Submitted' ORDER BY LastModifiedDate DESC Limit 1000];
         */
        //Start :<GT20140902>
        query+= ' ORDER BY LastModifiedDate DESC Limit 1000';
        //system.debug('Query:-'+query);
        pricingRequestsList = database.query(query);
        //End: <GT20140902>
        //system.debug('check here');
        //system.debug('pending list size: '+pricingRequestsList.size()+'***'+paOGSel.Business__c);
      }

      else{
        //system.debug('elseuser&&&&&'+Userinfo.getUserId());
        //system.debug('elseBU&&&&'+paOGSel.Business__c);
        //<PP20130422> -- Ver 4.18
        //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
        //<PP20130711>
        //Brundha Roll out 2 <BR20130625>
        //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
        //<BB20140321> Added Auto_Approver Fields in the query
        //<MS20140421> Added Backup_Level Name and approverText Fields in the query
        //<BB20140429> --Added Default_Currency__c Fields in the query
        //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
        // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
        /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c,
                                       State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                       SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                       Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                       Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                       LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                       Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                       CreatedById, Country__c, Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                       Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,
                                       Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                       Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Last_Modified_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                                       /* Auto_Approver_Level_1__c,Auto_Approver_Level_1__r.name,Auto_Approver_Level_2__c,Auto_Approver_Level_2__r.name,Auto_Approver_Level_3__c,Auto_Approver_Level_3__r.name,Auto_Approver_Level_4__c,Auto_Approver_Level_4__r.name,Auto_Approver_Level_5__c,Auto_Approver_Level_5__r.name,
                                       Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c  
                                       FROM Pricing_Request__c WHERE BU__c =:paOGSel.Business__c AND Current_Approver__c=:Userinfo.getUserId()  AND Request_Approval_Status__c='Submitted' ORDER BY LastModifiedDate DESC Limit 1000];
         */
        //Start :<GT20140902>
        query+= ' AND Current_Approver__c=\''+Userinfo.getUserId()+'\' ORDER BY LastModifiedDate DESC Limit 1000';
        //system.debug('Query:-'+query);
        pricingRequestsList = database.query(query);
        //End :<GT20140902>
        //system.debug('****** inside pending'+pricingRequestsList);
        //system.debug('elseuser&&&&&'+Userinfo.getUserId());
        //system.debug('elseBU&&&&'+paOGSel.Business__c);
      }
    }
    else if(requestServiceState.ogItems.value!=null && (requestServiceState.ogItems.value.equalsIgnoreCase('Draft') || requestServiceState.ogItems.value.equalsIgnoreCase('Submitted')|| requestServiceState.ogItems.value.equalsIgnoreCase('Approved')|| requestServiceState.ogItems.value.equalsIgnoreCase('Rejected')|| requestServiceState.ogItems.value.equalsIgnoreCase('Recalled') )) {
      //system.debug('****** inside status'+csvString);
      //system.debug('****** inside ststus'+requestServiceState.ogItems.value);

      //system.debug('****** inside Userinfo.getUserId()'+Userinfo.getUserId());
      //system.debug('****** inside customer.paERPCustomer.Id'+customer.paERPCustomer.Id);
      //Added - Bala 4.10 #30 UAT
      //<PP20130422> -- Ver 4.18
      //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
      if(requestServiceState.ogItems.value=='Draft') {
        //<PP20130711>
        //<NE20130611> START //Enhancement as per prod issue- BU Admin / Sales Admin should be able to view all requests
        //other only created by them and created on behalf of them 
        if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet())
        {
          //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<BB20140429> --Added Default_Currency__c Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId,Owner.Name, On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                              Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                              ComPartner__c,ComPartner_Code__c   
                              FROM Pricing_Request__c WHERE
                              //(CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND
                              BU__c = :paOGSel.Business__c AND ((Request_Approval_Status__c= :requestServiceState.ogItems.value AND NPC_Status__c != 'Waiting for Net Price'  AND  NPC_Status__c!='Net Price Received') OR Request_Approval_Status__c='Validated')
          ORDER BY LastModifiedDate DESC Limit 1000];*/

          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' BU__c = \''+paOGSel.Business__c+'\' AND ((Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' AND NPC_Status__c != \'Waiting for Net Price\' ) OR Request_Approval_Status__c=\'Validated\') ORDER BY LastModifiedDate DESC Limit 1000');  
        }
        else
        {   //<NE20130611> START END
          //Brundha Roll out 2 <BR20130625>
          //Enhancement as per prod issue- BU Admin should be able to view all requests
          //other only created by them and created on behalf of them 
          //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<BB20140429> --Added Default_Currency__c Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name, On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                              ComPartner__c, ComPartner_Code__c 
                              FROM Pricing_Request__c WHERE
                              (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND
                              BU__c = :paOGSel.Business__c AND ((Request_Approval_Status__c= :requestServiceState.ogItems.value AND NPC_Status__c != 'Waiting for Net Price'  AND  NPC_Status__c!='Net Price Received') OR Request_Approval_Status__c='Validated')
          ORDER BY LastModifiedDate DESC Limit 1000];*/

          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\') AND BU__c = \''+paOGSel.Business__c+'\' AND ((Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' AND NPC_Status__c != \'Waiting for Net Price\') OR Request_Approval_Status__c=\'Validated\') ORDER BY LastModifiedDate DESC Limit 1000');
        }
        system.debug(LoggingLevel.Error,'inside draft section, pricingRequestsList size is '+pricingRequestsList.size());
      }

      else if(requestServiceState.ogItems.value=='Submitted'){
        //<PP20130422> -- Ver 4.18
        //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
        //<PP20130711>
        if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet())
        {
          //Brundha Roll out 2 <BR20130625>
          //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<BB20140429> --Added Default_Currency__c Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              NPC_Status__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c,Sent_to_Backup_Approver__c ,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                              Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                              ComPartner__c,ComPartner_Code__c,Submitted_By__c   
                              FROM Pricing_Request__c WHERE
                              //(CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) 
                              BU__c = :paOGSel.Business__c AND (Request_Approval_Status__c= :requestServiceState.ogItems.value OR ((Request_Approval_Status__c= 'Draft'  OR Request_Approval_Status__c= 'Rejected' OR Request_Approval_Status__c = 'Recalled') AND NPC_Status__c = 'Waiting for Net Price'))
          ORDER BY LastModifiedDate DESC Limit 1000];*/

          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' OR ((Request_Approval_Status__c= \'Draft\'  OR Request_Approval_Status__c= \'Rejected\' OR Request_Approval_Status__c = \'Recalled\') AND NPC_Status__c = \'Waiting for Net Price\')) ORDER BY LastModifiedDate DESC Limit 1000');
        }
        else
        {
          //Brundha Roll out 2 <BR20130625>
          //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<BB20140429> --Added Default_Currency__c Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c, Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  NPC_Status__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c,Sent_to_Backup_Approver__c ,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,
                                  Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                  ComPartner__c,ComPartner_Code__c,Submitted_By__c   
                                  FROM Pricing_Request__c WHERE
                                  (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId())  AND
                                  BU__c = :paOGSel.Business__c AND (Request_Approval_Status__c= :requestServiceState.ogItems.value OR ((Request_Approval_Status__c= 'Draft'  OR Request_Approval_Status__c= 'Rejected' OR Request_Approval_Status__c = 'Recalled') AND NPC_Status__c = 'Waiting for Net Price'))
          ORDER BY LastModifiedDate DESC Limit 1000];*/

          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\')  AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' OR ((Request_Approval_Status__c= \'Draft\'  OR Request_Approval_Status__c= \'Rejected\' OR Request_Approval_Status__c = \'Recalled\') AND NPC_Status__c = \'Waiting for Net Price\')) ORDER BY LastModifiedDate DESC Limit 1000');
        }
      }
      //<NP20131018> START - Rollout fix
      else if (requestServiceState.ogItems.value=='Approved'){  


        if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet())
        {
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c, Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c ,NPC_Status__c,Sent_to_Backup_Approver__c ,Landing_Cost__c,
                                  Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                  ComPartner_Code__c, ComPartner__c  
                                  FROM Pricing_Request__c WHERE
                                  //(CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) 
                                  BU__c = :paOGSel.Business__c AND Request_Approval_Status__c= :requestServiceState.ogItems.value AND NPC_Status__c != 'Waiting for Net Price' 
                                    ORDER BY LastModifiedDate DESC Limit 200];*/
          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' BU__c = \''+paOGSel.Business__c+'\' AND Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' AND NPC_Status__c != \'Waiting for Net Price\' ORDER BY LastModifiedDate DESC Limit 200');  
        }
        else
        {    
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query 
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query       
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c, Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c ,NPC_Status__c,Sent_to_Backup_Approver__c ,Landing_Cost__c,
                                  Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                  ComPartner__c, ComPartner_Code__c 
                                  FROM Pricing_Request__c WHERE
                                  (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND
                                  BU__c = :paOGSel.Business__c AND Request_Approval_Status__c= :requestServiceState.ogItems.value AND NPC_Status__c != 'Waiting for Net Price' 
                                    ORDER BY LastModifiedDate DESC Limit 200];*/
          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\') AND BU__c = \''+paOGSel.Business__c+'\' AND Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' AND NPC_Status__c != \'Waiting for Net Price\' ORDER BY LastModifiedDate DESC Limit 200');
        }
      }
      //<NP20131018> END

      else {//Added - Bala 4.10 #30 UAT
        //<PP20130422> -- Ver 4.18
        //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
        //<PP20130711>
        //Brundha Roll out 2 <BR20130625>
        if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet())
        {
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c, Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c ,NPC_Status__c,Sent_to_Backup_Approver__c ,Landing_Cost__c,
                                  Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                  ComPartner_Code__c, ComPartner__c  
                                  FROM Pricing_Request__c WHERE
                                  BU__c = :paOGSel.Business__c AND Request_Approval_Status__c= :requestServiceState.ogItems.value AND NPC_Status__c != 'Waiting for Net Price'  AND  NPC_Status__c!='Net Price Received'
                                    ORDER BY LastModifiedDate DESC Limit 1000];*/
          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' BU__c = \''+paOGSel.Business__c+'\' AND Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' AND NPC_Status__c != \'Waiting for Net Price\'  AND  NPC_Status__c!=\'Net Price Received\' ORDER BY LastModifiedDate DESC Limit 1000');              
        }
        else
        {
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c, Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Key_Combination__c,Pricing_Condition__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Project_Id__c,Project_Name__c,Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                  Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name,created_by__c, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, Request_Id__c, Project_Header_Approval_Flag__c ,NPC_Status__c,Sent_to_Backup_Approver__c ,Landing_Cost__c,
                                  Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                  ComPartner__c, ComPartner_Code__c 
                                  FROM Pricing_Request__c WHERE
                                  (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId())  AND
                                  BU__c = :paOGSel.Business__c AND Request_Approval_Status__c= :requestServiceState.ogItems.value AND NPC_Status__c != 'Waiting for Net Price'  AND  NPC_Status__c!='Net Price Received'
                                    ORDER BY LastModifiedDate DESC Limit 1000];*/

          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\')  AND BU__c = \''+paOGSel.Business__c+'\' AND Request_Approval_Status__c= \''+requestServiceState.ogItems.value+'\' AND NPC_Status__c != \'Waiting for Net Price\'  AND  NPC_Status__c!=\'Net Price Received\' ORDER BY LastModifiedDate DESC Limit 1000');                  
        }
        //system.debug('****** inside Draft pricingRequestsList '+pricingRequestsList.size());
      } 
    }
    //Added By Bala - 11 Mar commented CreatedBY and on behalf Of 3.12
    //<PP20130422> -- Ver 4.18
    //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
    else{ //At this point we query the pricing request records to display in relatedlistwrapper  
      //<PP20130711>
      //Brundha Roll out 2 <BR20130625>
      //<BB20140516> Added if statement to query for requests for Request History separately and added historyDate to determine all the requests created in last 1 year
      Datetime historyDate1 = system.today().addDays(-365);
      String historyDate = historyDate1.format('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');
      system.debug(' displayPermanentRequestHistory inside ogitems.value null is'+displayPermanentRequestHistory);
      //<IM20150127> Added check for RPQ
      //system.debug(logginglevel.error,'*****historyDate'+historyDate);
      if(displayPermanentRequestHistory==false && displayTaskRequestHistory==false){
        if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet())
        {
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name, On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, created_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,
                              ComPartner__c, ComPartner_Code__c  
                              FROM Pricing_Request__c WHERE
                              //(CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND
                              //   CreatedDate >= : historyDate AND
                              ((Customer_Specific__c = true AND
                                      SoldTo_Code__c = :customer.paERPCustomer.Customer_Code__c) OR
                                      (SoldTo_Code__c = null AND Customer_Specific__c = false AND
                                              Request_Type__c = 'Non Customer Specific') OR (SoldTo_Code__c = null AND
                                                      (Request_Type__c = 'Massive' OR Request_Type__c = 'Import'))) AND BU__c = :paOGSel.Business__c AND
                                                      (Request_Approval_Status__c != 'Abandoned')
          ORDER BY LastModifiedDate DESC Limit 1000];*/
          if(requestServiceState.ogitems.isEndUserRebate)
            pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\')) AND End_User_Code__c = \''+requestServiceState.currentRequest.selectedEndUserCode+'\' AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c != \'Abandoned\') AND is_End_User_Rebate__c=true ORDER BY Approver5_Date__c DESC Nulls Last Limit 1');
          else
            pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\' OR Request_Type__c = \'Mass Import\'))) AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c != \'Abandoned\') ORDER BY LastModifiedDate DESC Limit 1000');

          /* if(requestServiceState.ogitems.isEndUserRebate){
            List<Pricing_Request__c> tempApprovedList = new  List<Pricing_Request__c>();
            tempApprovedList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\'))) AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c = \'Approved\') AND is_End_User_Rebate__c=true ORDER BY Approver5_Date__c DESC Limit 1');
            if(!tempApprovedList.isEmpty())
            pricingRequestsList.add(tempApprovedList.get(0));
          } */

        }                           
        else
        {
          //<BB20140321> Added Auto_Approver Fields in the query
          //<MS20140421> Added Backup_Level Name and approverText Fields in the query
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, created_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,
                              ComPartner_Code__c,ComPartner__c   
                              FROM Pricing_Request__c WHERE
                              (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND             
                              ((Customer_Specific__c = true AND
                                      SoldTo_Code__c = :customer.paERPCustomer.Customer_Code__c) OR
                                      (SoldTo_Code__c = null AND Customer_Specific__c = false AND
                                              Request_Type__c = 'Non Customer Specific') OR (SoldTo_Code__c = null AND
                                                      (Request_Type__c = 'Massive' OR Request_Type__c = 'Import'))) AND BU__c = :paOGSel.Business__c AND
                                                      (Request_Approval_Status__c != 'Abandoned')
          ORDER BY LastModifiedDate DESC Limit 1000];*/
          if(requestServiceState.ogitems.isEndUserRebate)
            pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\') AND ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\'))) AND End_User_Code__c = \''+requestServiceState.currentRequest.selectedEndUserCode+'\' AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c != \'Abandoned\') AND is_End_User_Rebate__c=true ORDER BY Approver5_Date__c DESC Nulls Last Limit 1');
          else
            pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\') AND ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\'))) AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c != \'Abandoned\') ORDER BY LastModifiedDate DESC Limit 1000');
          /*if(requestServiceState.ogitems.isEndUserRebate){
            List<Pricing_Request__c> tempApprovedList = new  List<Pricing_Request__c>();
            tempApprovedList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\') AND ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\'))) AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c = \'Approved\') AND is_End_User_Rebate__c=true ORDER BY Approver5_Date__c DESC Limit 1');
            if(!tempApprovedList.isEmpty())
            pricingRequestsList.add(tempApprovedList.get(0));
          }*/
        }

        //Ver 2.6 END
        //system.debug(logginglevel.error,'****** inside Draft pricingRequestsList '+pricingRequestsList.size() );
      }
      //<BB20140516> Added Query for Request History
      else if (displayPermanentRequestHistory==true || displayTaskRequestHistory==true || reqOvw==true){
        if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet())
        {
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, created_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,
                              ComPartner__c,ComPartner_Code__c    
                              FROM Pricing_Request__c WHERE
                              CreatedDate >= : historyDate AND
                              ((Customer_Specific__c = true AND
                                      SoldTo_Code__c = :customer.paERPCustomer.Customer_Code__c) OR
                                      (SoldTo_Code__c = null AND Customer_Specific__c = false AND
                                              Request_Type__c = 'Non Customer Specific') OR (SoldTo_Code__c = null AND
                                                      (Request_Type__c = 'Massive' OR Request_Type__c = 'Import'))) AND BU__c = :paOGSel.Business__c AND
                                                      (Request_Approval_Status__c != 'Abandoned')
                              ORDER BY LastModifiedDate DESC Limit 1000];*/
          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' CreatedDate >= '+historyDate+' AND ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\'))) AND BU__c = \''+paOGSel.Business__c+'\' AND (Request_Approval_Status__c != \'Abandoned\') ORDER BY LastModifiedDate DESC Limit 1000');        

          //system.debug(logginglevel.error,'****** inside Request History pricingRequestsList Admin '+pricingRequestsList.size() );
        } 
        else{
          // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
          /*pricingRequestsList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Project_Id__c,Project_Name__c,Zip_PostalCode__c,  Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                 State_Province__c,Spot_Type__c,Pricing_exception__c, Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                           SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                           Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                           Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                           LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                           Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, CreatedDate,Current_Approver__r.Name,
                                           CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                           Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.name, Approver2__r.name, Approver3__r.name, Approver4__r.name, approver5__r.name,
                                 Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,Last_Modified_by__c, created_by__c,Request_Id__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Landing_Cost__c,
                              Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,
                              ComPartner__c, ComPartner_Code__c   
                              FROM Pricing_Request__c WHERE
                              (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND
                              CreatedDate >= : historyDate AND
                              ((Customer_Specific__c = true AND
                                      SoldTo_Code__c = :customer.paERPCustomer.Customer_Code__c) OR
                                      (SoldTo_Code__c = null AND Customer_Specific__c = false AND
                                              Request_Type__c = 'Non Customer Specific') OR (SoldTo_Code__c = null AND
                                                      (Request_Type__c = 'Massive' OR Request_Type__c = 'Import'))) AND BU__c = :paOGSel.Business__c AND
                                                      (Request_Approval_Status__c != 'Abandoned')
                              ORDER BY LastModifiedDate DESC Limit 1000];*/
          pricingRequestsList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' (CreatedById = \''+Userinfo.getUserId()+'\' OR On_Behalf_Of__c = \''+Userinfo.getUserId()+'\') AND CreatedDate >= '+historyDate+' AND ((Customer_Specific__c = true AND SoldTo_Code__c = \''+customer.paERPCustomer.Customer_Code__c+'\') OR (SoldTo_Code__c = null AND Customer_Specific__c = false AND Request_Type__c = \'Non Customer Specific\') OR (SoldTo_Code__c = null AND (Request_Type__c = \'Massive\' OR Request_Type__c = \'Import\'))) AND BU__c = :paOGSel.Business__c AND (Request_Approval_Status__c != \'Abandoned\') ORDER BY LastModifiedDate DESC Limit 1000');         

          //system.debug(logginglevel.error,'****** inside Request History pricingRequestsList Requester '+pricingRequestsList.size() );
        }
      }   

    }
    system.debug(LoggingLevel.Error,'outside pricereq query section, pricingRequestsList size is '+pricingRequestsList.size());
     for(Pricing_Request__c pr1 : pricingRequestsList){
      boolean isLimitExceeded = true;
      //if(pr1.is_End_User_Rebate__c) requestServiceState.ogitems.isEndUserRebate = true;
     /* system.debug('@@@@requestServiceState'+requestServiceState);
      system.debug(LoggingLevel.Error,'isLimitExceeded is '+isLimitExceeded+ 'pr1.id is '+pr1.id);
      system.debug('Og item value:-'+requestServiceState.ogItems.value); */
      if(requestServiceState.ogItems.value!=null && requestServiceState.ogItems.value.equalsIgnoreCase('Massive'))
      {
      //<VL20160222>
        if(pr1.Request_Type__c == 'Massive' && ((permanentPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && permanentPricingRequestsList.size()<25)))
        {
          //system.debug('***** Massive List');
          permanentPricingRequestsList.add(pr1);
          isLimitExceeded = false;

        }
      }
      else if(requestServiceState.ogItems.value!=null && requestServiceState.ogItems.value.equalsIgnoreCase('NonCustomerSpecific'))
      {   //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
        //<MS20140527> Addeing Floor and Refernce to single NCS list
        
        //<VL20160222>
        if(pr1.Request_Type__c == 'Non Customer Specific' /*&& pr1.Pricing_Request_Type__c!='Floor' && pr1.Pricing_Request_Type__c!='Reference'*/ && ((permanentPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && permanentPricingRequestsList.size()<25)))
        {

          //system.debug('***** NonCustomerSpecific List');
          permanentPricingRequestsList.add(pr1);
          isLimitExceeded = false;
        }
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
        //system.debug('floorPricingRequestsListabc'+pr1.Request_Type__c);
        //system.debug('floorPricingRequestsListpr1.Pricing_Request_Type__c'+pr1.Pricing_Request_Type__c);
        
        //<VL20160222>
        if(pr1.Request_Type__c == 'Non Customer Specific' && pr1.Pricing_Request_Type__c!=null && pr1.Pricing_Request_Type__c.contains('Floor') && ((floorPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && floorPricingRequestsList.size()<25))){
          floorPricingRequestsList.add(pr1);
          isLimitExceeded = false;
          //system.debug('floorPricingRequestsList'+floorPricingRequestsList);
        }
        //<VL20160222>
        
        if(pr1.Request_Type__c == 'Non Customer Specific' && pr1.Pricing_Request_Type__c!=null && pr1.Pricing_Request_Type__c.contains('Reference') && ((referencePricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && referencePricingRequestsList.size()<25))){
          referencePricingRequestsList.add(pr1);
          isLimitExceeded = false;
        }
      }
      else{
        //<BB20140516>Modified logic to add requests for request overview and Request History START
        if(pr1.Pricing_Request_Type__c == 'Permanent' && pr1.Request_Type__c == 'Customer Specific')
        { 
          //<BB20140516>Adding requests for request history.
          permanentPricingRequestsHistoryList.add(pr1);
          isLimitExceeded = false;
          //<BB20140516>Adding requests for request overview.
          
          //<VL20160222>
          
          if((permanentPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && permanentPricingRequestsList.size()<25))
          {
            permanentPricingRequestsList.add(pr1);
            isLimitExceeded = false;
          }
          //  //system.debug(logginglevel.error,'*****permanentPricingRequestsList.size'+permanentPricingRequestsList.size()+'permanentPricingRequestsHistoryList'+permanentPricingRequestsHistoryList.size());                   
        }
        //3.13 - bala   4.11 -bala
        //<AV20150108>-Start-Production issue-Request history issue
        if(pr1.Pricing_Request_Type__c == 'Project Pricing' && pr1.Request_Type__c == 'Customer Specific' && 
            requestServiceState.ogitems.isProjectGroupMember!=null &&   requestServiceState.ogitems.isProjectGroupMember){
         
            //<VL20160222>
         if((projectPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && projectPricingRequestsList.size()<25))
          {
            projectPricingRequestsList.add(pr1);
          }
          isLimitExceeded = false;
        }
        if(pr1.Pricing_Request_Type__c == 'Pricing Task' && pr1.Request_Type__c == 'Customer Specific' && !requestServiceState.ogitems.isEndUserRebate){
          //<MS20140901> Adding condition for Pricing Task
          taskPricingRequestsHistoryList.add(pr1);
          
          //<VL20160222>
          if((spotPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && spotPricingRequestsList.size()<25))
          {
            spotPricingRequestsList.add(pr1);
            isLimitExceeded = false;
          }
        }
        //<AV20142612>-Production view state issue fix
        if(pr1.Pricing_Request_Type__c == 'Import' || pr1.Request_Type__c == 'Import' || pr1.Request_Type__c == 'Mass Import'){
        
        //<VL20160222>
          if((importPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && importPricingRequestsList.size()<25))
          {
            importPricingRequestsList.add(pr1);
          }
          isLimitExceeded = false;
          system.debug('PricingList:'+importPricingRequestsList.size());
        }
        if(pr1.Pricing_Request_Type__c == 'Permanent' && pr1.Request_Type__c == 'Massive'){
        
        //<VL20160222>
          if((massivePricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && massivePricingRequestsList.size()<25))
          {
            massivePricingRequestsList.add(pr1);
          }
          isLimitExceeded = false;
        }
        if(pr1.Pricing_Request_Type__c == 'Permanent' && pr1.Request_Type__c == 'Non Customer Specific'){
        
        //<VL20160222>
        
          if((nonCustPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && nonCustPricingRequestsList.size()<25))
          {
            nonCustPricingRequestsList.add(pr1);
          }
          isLimitExceeded = false;
          system.debug('#^$%&#^Noncustsp');
        }
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get Pricing Requests
        if(pr1.Request_Type__c == 'Non Customer Specific' && pr1.Pricing_Request_Type__c!=null && pr1.Pricing_Request_Type__c.contains('Floor')){
          /*<MS20140527> Removing separate lists for floor and reference
                    floorPricingRequestsList.add(pr1);*/
                    
                //<VL20160222>  
          if((floorPricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && floorPricingRequestsList.size()<25))
          {
            nonCustPricingRequestsList.add(pr1);
          }
          isLimitExceeded = false;
          //system.debug('floorPricingRequestsList'+floorPricingRequestsList);
        }
        if(pr1.Request_Type__c == 'Non Customer Specific' && pr1.Pricing_Request_Type__c!=null && pr1.Pricing_Request_Type__c.contains('Reference')){
          /*<MS20140527> Removing separate condiitions for floor and reference
                    referencePricingRequestsList.add(pr1);*/
                    
                    //<VL20160222>
          if((referencePricingRequestsList.size()<50 && requestServiceState.ogItems.value!='Approved') || (requestServiceState.ogItems.value == 'Approved' && referencePricingRequestsList.size()<25))
          {
            nonCustPricingRequestsList.add(pr1);
          }
          isLimitExceeded = false;
        }
        //<AV20150108>-End-Production issue-Request history issue



      }
      system.debug(LoggingLevel.Error,'isLimitExceeded is '+isLimitExceeded+ 'pr1.id is '+pr1.id);
      if(isLimitExceeded)
        break;
    }
    system.debug('permanentPricingRequestsList is '+permanentPricingRequestsList);
    //system.debug(logginglevel.error,'***** Massive List'+permanentPricingRequestsList);
    List<PARelatedList> relatedListRequestsList = new List<PARelatedList>();
    List<string> relKeyList   = new List<string>();
    if(requestServiceState.ogItems.value!=null && requestServiceState.ogItems.value.equalsIgnoreCase('Massive')) {
      pars.put('Massive Change',permanentPricingRequestsList);
      for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {
        if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Massive Change') {
          relKeyList.add(pricingRequestOrder);
        }
      }
    }
    else if(requestServiceState.ogItems.value!=null && requestServiceState.ogItems.value.equalsIgnoreCase('NonCustomerSpecific')) {
      pars.put('Non Customer Specific',permanentPricingRequestsList);
      //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
      /*<MS20140527> Removing separate conditions for floor and reference
            pars.put('Floor Pricing',floorPricingRequestsList);
            pars.put('Reference Pricing',referencePricingRequestsList);*/

      for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {
        if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Non Customer Specific') {
          relKeyList.add(pricingRequestOrder);
        }
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
        /*<MS20140527> Removing separate conditions for floor and reference
                if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Floor Pricing') {
                    relKeyList.add(pricingRequestOrder);
                }
                if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Reference Pricing') {
                    relKeyList.add(pricingRequestOrder);
                }*/
      }
    }
    // for pending link changed--Brundha 21 Feb
    else if(requestServiceState.ogItems.value!=null && requestServiceState.ogItems.value.equalsIgnoreCase('Pending')){
      //Start :<GT20140902>
      if(requesttype=='Customer Specific' || requesttype=='Non Customer Specific'||requesttype==null ||requesttype=='select')
      {
        for(Pricing_Request__c req: massivePricingRequestsList)
        {
          if(req.Customer_Specific__c)
            permanentPricingRequestsList.add(req);
          else
            nonCustPricingRequestsList.add(req);
        }
        for(Pricing_Request__c req: importPricingRequestsList)
        {
          if(req.Customer_Specific__c)
            permanentPricingRequestsList.add(req);
          else
            nonCustPricingRequestsList.add(req);
        }

      }
      //Start :<GT20140902>
      pars.put('Customer Price',permanentPricingRequestsList);
      // //system.debug(logginglevel.error,'Customer Price Pending'+permanentPricingRequestsList.size());
      if(requestServiceState.ogitems.isProjectGroupMember!=null && requestServiceState.ogitems.isProjectGroupMember){//4.11
        pars.put('Project',projectPricingRequestsList);
      }
      pars.put('Pricing Task',spotPricingRequestsList);
      //system.debug('requesttype:-'+requesttype);
      //Commenting out to fix issue: On arrival of the page Import , Massive are shown in seperate section
      /*if(requesttype==null)
            {
            pars.put('Massive Change',massivePricingRequestsList);
            pars.put('Import',importPricingRequestsList);
            }*/
      pars.put('Non Customer Specific',nonCustPricingRequestsList);
      //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
      /*<MS20140527> Removing separate conditions for floor and reference
            pars.put('Floor Pricing',floorPricingRequestsList);
            pars.put('Reference Pricing',referencePricingRequestsList);*/

      //system.debug('@@@check here'+massivePricingRequestsList);
      for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {

        relKeyList.add(pricingRequestOrder);               

      }       
      relKeyList.sort();

    } 

    else if(requestServiceState.ogItems.value!=null &&(requestServiceState.ogItems.value.equalsIgnoreCase('Draft') || requestServiceState.ogItems.value.equalsIgnoreCase('Submitted') || requestServiceState.ogItems.value.equalsIgnoreCase('Approved') || requestServiceState.ogItems.value.equalsIgnoreCase('Rejected')|| requestServiceState.ogItems.value.equalsIgnoreCase('Recalled')) ){
      /*added if condition based on group members and BU Admin fot links V1.5*/
      if(requestServiceState.ogItems.isVisibleMap.get('ManageCustomerPrices')){
        //system.debug('####'+requestServiceState.ogitems);

        pars.put('Customer Price',permanentPricingRequestsList);
        // system.debug(logginglevel.error,'*****Customer Price'+permanentPricingRequestsList.size());
        if(requestServiceState.ogitems.isProjectGroupMember!=null && requestServiceState.ogitems.isProjectGroupMember){//4.11
          pars.put('Project',projectPricingRequestsList);
        }
        pars.put('Pricing Task',spotPricingRequestsList);
        pars.put('Massive Change',massivePricingRequestsList);
      }
      //NE20130131- Start -added sales admin permsion set in OR condition
      if(requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet()){
        pars.put('Import',importPricingRequestsList);
      }
      //NE20130131- End
      if(requestServiceState.ogItems.isVisibleMap.get('ManagePriceLists')){
        pars.put('Non Customer Specific',nonCustPricingRequestsList);
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
        /*<MS20140527> Removing separate conditions for floor and reference
            pars.put('Floor Pricing',floorPricingRequestsList);
            pars.put('Reference Pricing',referencePricingRequestsList);*/
      }
      for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {
        if((requestServiceState.ogItems.isBUAdmin || PAUtil.hasSalesAdminPermissionSet() )&& PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Import') {
          relKeyList.add(pricingRequestOrder);
        }
        //4.11
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
        if(requestServiceState.ogItems.isVisibleMap.get('ManageCustomerPrices') && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Import' && 
            PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Massive Change' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Non Customer Specific'
            && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Project' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Floor Pricing' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Reference Pricing')
        {
          relKeyList.add(pricingRequestOrder);
        }
        if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Project' &&
            requestServiceState.ogitems.isProjectGroupMember!=null && requestServiceState.ogitems.isProjectGroupMember)
        {
          relKeyList.add(pricingRequestOrder);
        }
        if(requestServiceState.ogItems.isVisibleMap.get('ManagePriceLists') && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Non Customer Specific') {
          relKeyList.add(pricingRequestOrder);
        }
        if(requestServiceState.ogItems.isVisibleMap.get('ManageCustomerPrices') && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Massive Change') {
          relKeyList.add(pricingRequestOrder);
        }

        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests
        /*<MS20140527> Removing separate conditions for floor and reference
                if(requestServiceState.ogItems.isVisibleMap.get('ManagePriceLists') && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Floor Pricing') {
                    relKeyList.add(pricingRequestOrder);
                }       
                if(requestServiceState.ogItems.isVisibleMap.get('ManagePriceLists') && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Reference Pricing') {
                    relKeyList.add(pricingRequestOrder);
                }*/



      }
      relKeyList.sort();
    }
    else if(requestServiceState.ogItems.value == 'Import') {
      pars.put('Import',importPricingRequestsList);
      for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {
        if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Import') {
          relKeyList.add(pricingRequestOrder);
        }
      }
    }
    else {//4.11
      //<BB20140516>
      //system.debug(logginglevel.error,'*****Customer Price before'+permanentPricingRequestsList.size()+displayPermanentRequestHistory);
      //<MS20140901> Adding condition for pricing task
      if(displayPermanentRequestHistory == false && displayTaskRequestHistory == false){
        pars.put('Customer Price',permanentPricingRequestsList);
        //system.debug(logginglevel.error,'*****Customer Price'+permanentPricingRequestsList.size()+'relKeyList'+relKeyList.size()+relKeyList);

        if(requestServiceState.ogitems.isProjectGroupMember!=null && requestServicestate.ogitems.isProjectGroupMember){
          pars.put('Project',projectPricingRequestsList);
        } 
        pars.put('Pricing Task',spotPricingRequestsList);


        for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {
          //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests

          if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Import' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Project' &&
              PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Massive Change' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Non Customer Specific'
              && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Floor Pricing'
              && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Reference Pricing') {
            relKeyList.add(pricingRequestOrder);
          }
          if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c == 'Project' &&
              requestServiceState.ogitems.isProjectGroupMember!=null && requestServicestate.ogitems.isProjectGroupMember)
          {
            relKeyList.add(pricingRequestOrder);
          }
        }
      }
      else{
        //<BB20140516> populating the requests for request history
        //system.debug(logginglevel.error,'*****Customer Price History'+permanentPricingRequestsHistoryList.size());
        if(displayPermanentRequestHistory)
          pars.put('Customer Price History',permanentPricingRequestsHistoryList);
        //<MS20140901> Added condition for pricing tasks
        else if(displayTaskRequestHistory)
          pars.put('Pricing Task History',taskPricingRequestsHistoryList);
        //system.debug(logginglevel.error,'*****pars.'+pars.size());
        for(string pricingRequestOrder : PricingRequestTypeOrder__c.getAll().keySet()) {
          //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference to get the Pricing Requests


          if(PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Import' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Project' &&
              PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Massive Change' && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Non Customer Specific'
              && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Floor Pricing'
              && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Reference Pricing'
              && PricingRequestTypeOrder__c.getInstance(pricingRequestOrder).Request_Type__c != 'Pricing Task')
          {
            relKeyList.add(pricingRequestOrder);
          }
        }
      }
      //relKeyList.addAll(PricingRequestTypeOrder__c.getAll().keySet());
      relKeyList.sort();//


    }
    system.debug('relKeyList is '+relKeyList);
    system.debug('pars is '+pars);
    //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition to sort the Requests
    if(requestServiceState.ogItems.value!=null && requestServiceState.ogItems.value.equalsIgnoreCase('NonCustomerSpecific')) {
      relKeyList.sort();
    }
    List<Schema.FieldSetMember> massiveFields;
    List<Schema.FieldSetMember> importFields;
    List<Schema.FieldSetMember> ncsFields;
    List<Schema.FieldSetMember> pricingTaskFields;
    List<Schema.FieldSetMember> projectFields;
    List<Schema.FieldSetMember> statusFields;
    List<Schema.FieldSetMember> requestRPQFields;

    String sObjectName = Pricing_Request__c.sObjectType.getDescribe().getName().toLowerCase();
    Map<String,Schema.FieldSet> fieldSetMap = Schema.SObjectType.Pricing_Request__c.fieldSets.getMap();

    if(requestServiceState.ogItems.value=='Draft'|| requestServiceState.ogItems.value=='Approved' || requestServiceState.ogItems.value=='Rejected' || requestServiceState.ogItems.value=='Recalled')
    {
      massiveFields = fieldSetMap.get('StatusFieldsMassive').getFields();
      importFields = fieldSetMap.get('StatusFieldsImport').getFields();
      ncsFields = fieldSetMap.get('StatusFieldsNonCustomer').getFields();
      pricingTaskFields = fieldSetMap.get('StatusFieldsPricingTask').getFields();
      projectFields = fieldSetMap.get('StatusFieldsProject').getFields();
      statusFields = fieldSetMap.get('StatusFields').getFields();
      if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled){
        requestRPQFields = fieldSetMap.get('RPQFields').getFields();  
      }
    }
    else if(requestServiceState.ogItems.value=='Submitted'|| requestServiceState.ogItems.value=='Pending')
    {
      massiveFields = fieldSetMap.get('StatusFieldsMassiveSubmitted').getFields();
      importFields = fieldSetMap.get('StatusFieldsImportSubmitted').getFields();
      ncsFields = fieldSetMap.get('StatusFieldsNonCustomerSubmitted').getFields();
      pricingTaskFields = fieldSetMap.get('StatusFieldsPricingTaskSubmitted').getFields();
      projectFields = fieldSetMap.get('StatusFieldsProjectSubmitted').getFields();
      statusFields = fieldSetMap.get('StatusFieldsSubmitted').getFields();
      if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled){
        requestRPQFields = fieldSetMap.get('RPQMyReqFields').getFields();  
      }
    }
    else
    {
      statusFields = fieldSetMap.get('CustomerBasketFields').getFields();
      if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled){
        requestRPQFields = fieldSetMap.get('RPQFields').getFields();  
      }
    }



    //relatedListKeySet = ;//pars.keySet();
    for(String s : relKeyList){
      PARelatedList c = new PARelatedList(); 
      //<MS20140901> Added condition for Pricing Task
      if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
        c.RPQColumns  = requestRPQFields;
      if(displayPermanentRequestHistory==true)
      {
        c.priceType = 'Customer Price';
      }
      else if(displayTaskRequestHistory==true)
      {
        c.priceType = 'Pricing Task';
      }
      else{
        c.priceType = PricingRequestTypeOrder__c.getInstance(s).Request_Type__c;
      }
      system.debug('inside relkeylist loop, c.pricetype is '+c.priceType );
      //system.debug(logginglevel.error,'******requestServiceState.ogItems.value'+requestServiceState.ogItems.value);
      if(requestServiceState.ogItems.value=='Draft'|| requestServiceState.ogItems.value=='Approved' || requestServiceState.ogItems.value=='Rejected' || requestServiceState.ogItems.value=='Recalled'){
        if(c.priceType=='Massive Change' ){
          c.keyCombinationColumns = massiveFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = massiveFields;
        }
        else if(c.priceType=='Import'){
          c.keyCombinationColumns = importFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = importFields;

        }
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Key Combination fields for Floor and Reference
        else if(c.priceType=='Non Customer Specific' || c.priceType=='Floor Pricing' || c.priceType=='Reference Pricing'){
          c.keyCombinationColumns = ncsFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = ncsFields;

        }
        else if(c.priceType=='Pricing Task'){
          c.keyCombinationColumns = pricingTaskFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = pricingTaskFields;

        }
        else if(c.priceType=='Project'){
          c.keyCombinationColumns = projectFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = projectFields;

        }
        else{
          c.keyCombinationColumns = statusFields;
        }

      }
      else if(requestServiceState.ogItems.value=='Submitted'|| requestServiceState.ogItems.value=='Pending'){
        if(c.priceType=='Massive Change' ){
          c.keyCombinationColumns = massiveFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = massiveFields;

        }
        else if(c.priceType=='Import'){
          c.keyCombinationColumns = importFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = importFields;

        }
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Key Combination columns for Floor and Reference
        else if(c.priceType=='Non Customer Specific' || c.priceType=='Floor Pricing' || c.priceType=='Reference Pricing'){
          c.keyCombinationColumns = ncsFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = ncsFields;

        }
        else if(c.priceType=='Pricing Task'){
          c.keyCombinationColumns = pricingTaskFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = pricingTaskFields;

        }
        else if(c.priceType=='Project'){
          c.keyCombinationColumns = projectFields;
          if(requestServiceState.ogItems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled)
            c.RPQColumns  = projectFields;

        }
        else{
          c.keyCombinationColumns = statusFields;
        }

      }

      else{         

        c.keyCombinationColumns = statusFields;
      }
      c.sObjectTypeName=sObjectName;
      List<Pricing_Request__c> pareq = new List<Pricing_Request__c>(); 
      List<Pricing_Request__c> pareqhis = new List<Pricing_Request__c>();
      //system.debug(logginglevel.error,'**** pars-c.priceType'+c.priceType+pars.containsKey('Customer Price History'));
      if(displayPermanentRequestHistory==false && displayTaskRequestHistory==false && pars.containsKey(c.priceType)){
        pareq = pars.get(c.priceType);
      }
      //<BB20140516> Added logic
      if(displayPermanentRequestHistory==true && c.priceType.containsIgnoreCase('Customer Price') && pars.containsKey('Customer Price History'))
      {                         
        //system.debug(logginglevel.error,'**** pars-c.priceType123'+c.priceType+pars.size());
        pareq = pars.get('Customer Price History');
        //system.debug(logginglevel.error,'**** pareq'+pareq.size());                                     
      }  
      //<MS20140901> Added historylogic for Pricing Tasks
      if(displayTaskRequestHistory==true && c.priceType.containsIgnoreCase('Pricing Task') && pars.containsKey('Pricing Task History'))
      {
        //system.debug(logginglevel.error,'**** pars-c.priceType123'+c.priceType+pars.size());
        pareq = pars.get('Pricing Task History');
        //system.debug(logginglevel.error,'**** pareq'+pareq.size());
      }
      //List<Pricing_Request__c> pareq = pars.get(c.priceType);
      // c.sObjectList=new List<RelatedObjectWrapper>();
      //system.debug('**** pars'+pareq+' '+pars);
      c.wrapperList = new List<PAWrapper>();
      system.debug('pareq is '+pareq);
      for(Pricing_Request__c p: paReq){
        PAWrapper rw = new PAWrapper();
        rw.isSelected = false;
        //Ver3.1
        //rw.sObjectList = new List<sObject>();
        //rw.sObjectList.add(p);
        //Ver 3.3
        rw.sObjectRecord = p;
        rw.stringMap.put('showEditLink','false');
        rw.stringMap.put('showDelLink','false');

        if(p.Request_Approval_Status__c=='Draft' || p.Request_Approval_Status__c=='Rejected' || p.Request_Approval_Status__c=='Recalled' ||  p.Request_Approval_Status__c=='Validated')
        {
          rw.stringMap.put('showEditLink','true');
          rw.stringMap.put('showDelLink','true');

        }


        if((requestServiceState.ogitems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled) && p.Request_Approval_Status__c=='Draft'){
          rw.cloneFlag = false;
        }
        if((requestServiceState.ogitems.isEndUserRebate || requestServiceState.ogItems.isEndUserRebateEnabled) && p.Request_Approval_Status__c!='Draft'){
          rw.cloneFlag = true;
        }
        c.wrapperList.add(rw);
      } 
      system.debug('****** PARelatedList'+c);           

      relatedListRequestsList.add(c);
    }
    return relatedListRequestsList;


  }






  public void add() 
  {
  }

  public void save()
  {
    //insert Pricing Request when save is clicked for new New Request
    upsert pricingRequest;
    pautil.deleteViewState(requestServiceState.currentRequest);
    relatedWrappersList = new List<PARelatedList>();
    System.debug('Data after deleting view state:');
  }

  public void deleteRecord()
  {
    // TODO Auto-generated method stub
  }

  //This method is used to determine the name of the business component
  public String getName()
  {     
    return PAService.NAME_REQUESTS;
  }

  public String getType()
  {
    // TODO Auto-generated method stub
    return null;
  }

  //This method is used to validate the action performed
  public String validate(String desiredAction)
  {
    string errorMessage = '';

    //Page Level Validations
    if(desiredAction.containsIgnoreCase('Massive'))
    {
      if(String.isBlank(pricingRequest.Sales_Org_Code__c))
      {
        errorMessage+= System.Label.No_Sales_Area_selected_Error+'<br/>';
      }
    } 

    //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference for validation
    else if(desiredAction.containsIgnoreCase('Non Customer Specific') || desiredAction.containsIgnoreCase('Floor Pricing') || desiredAction.containsIgnoreCase('Reference Pricing'))
    {
      if(String.isBlank(pricingRequest.Sales_Org_Code__c))
      {
        errorMessage+= System.Label.No_Sales_Area_selected_Error+'<br/>';
      }
    }


    //<BB20140404> Added Clone in the condition
    if(desiredAction.contains('save'))
    {   Organizational_Group_Item__c buOrgGroup =new Organizational_Group_Item__c();
    system.debug('****pricingRequest'+pricingRequest.BU__c);
    requestServiceState.ogItems.ogItemFromRequest(pricingRequest);
    if(pricingRequest.is_End_User_Rebate__c){
      system.debug('****in error check');
      string bu = [select Business__c FROM OrgGroup__c WHERE id=:customer.ogitems.selectedBU].Business__c;
      String rpqIdentifier = pricingRequest.BU__c+'-'+pricingRequest.Sales_Org_Code__c;
      system.debug('rpqIdentifier is '+rpqIdentifier);
      rpqIdentifier = bu+'-'+pricingRequest.Sales_Org_Code__c;
      system.debug('rpqIdentifier is '+rpqIdentifier);
      Rebate_Price_Quote_Data__c rpqdata = Rebate_Price_Quote_Data__c.getInstance(rpqIdentifier);

      Integer retroalloweddays = Integer.ValueOf(rpqdata.Retroactive_Days__c);
      if(pricingRequest.Request_Valid_From__c!=null && pricingRequest.Request_Valid_To__c!=null && (pricingRequest.Request_Valid_From__c.daysBetween(System.now().date()) > retroalloweddays ) )
      {
        system.debug('inside error set for Save Validate ');
        errorMessage+=System.label.RPQ_Valid_From_Error + '<br/>';
        //return errorMessage.trim();
      }
      if(pricingRequest.Default_Discount__c==null)
      {
        system.debug('inside error set for Save Validate discount ');
        errorMessage+='Please enter the Default Discount' + '<br/>';
        //return errorMessage.trim();
      }    
    }
    if(pricingRequest.Request_Name__c==null || pricingRequest.Request_Name__c=='')
    {
      errorMessage+= System.Label.Request_Name_Mandatory_Error+'<br/>';
    }
    //<AJ20150804> Added validation when quotes used in Request name.
    if(pricingRequest.Request_Name__c.contains('\"'))
    {
      errorMessage+= 'Please enter a valid Request Name. Request name should not contain quotes'+'<br/>';
    }
    //<PP20130715> START
    if(requestServiceState != null && requestServiceState.ogItems != null && !pricingRequest.is_End_User_Rebate__c && requestServiceState.ogItems.orgGroupItems != null && requestServiceState.ogItems.orgGroupItems.Enable_Request_Class__c && (pricingRequest.Request_Class__c==null || pricingRequest.Request_Class__c=='--Select--'))
    {
      errorMessage+= System.Label.Request_Class_Mandatory_Error+'<br/>';
    }
    //<PP20130715> END
    if(pricingRequest.Request_Reason__c==null || pricingRequest.Request_Reason__c=='--Select--')
    {
      errorMessage+= System.Label.Request_Reason_Mandatory_Error+'<br/>';
    }
    //<TJ20150106> Removed '=' condition
    if(pricingRequest.Request_Valid_To__c<pricingRequest.Request_Valid_From__c)
    {
      errorMessage+= System.Label.Default_Valid_To_Less_Than_Default_Valid_From_Error+'<br/>';
    }
    if(pricingRequest.Request_Valid_From__c!=null && pricingRequest.Request_Valid_To__c==null && pricingRequest.Pricing_Request_Type__c!='Import'&& pricingRequest.Request_Type__c!='Non Customer Specific'&&!desiredAction.containsIgnoreCase('Non Customer Specific'))
    {
      errorMessage+='Please enter Default Valid To'+'<br/>';  //no system Label defined
    }
    if(pricingRequest.Request_Valid_To__c!=null && pricingRequest.Request_Valid_From__c==null && pricingRequest.Pricing_Request_Type__c!='Import'&& pricingRequest.Request_Type__c!='Non Customer Specific'&&!desiredAction.containsIgnoreCase('Non Customer Specific'))
    {
      errorMessage+='Please enter Default Valid From'+'<br/>';  //no system label defined
    }
    //<BB20140404> --Added validation when default to and default from is null
    if((pricingRequest.Request_Valid_To__c==null && pricingRequest.Request_Valid_From__c==null) && pricingRequest.Pricing_Request_Type__c!='Import'&& pricingRequest.Request_Type__c!='Non Customer Specific'&&!desiredAction.containsIgnoreCase('Non Customer Specific'))
    {
      errorMessage+='Please enter the Default Valid From and Default To'+'<br/>';  //no system label defined
    }
    if(pricingRequest.Default_Currency__c=='--Select--')
    {
      pricingRequest.Default_Currency__c=null;
    }
    /* Retroactive dates*/
    //please check below line throwing null pointer
    //system.debug('!@#$%^'+(pricingRequest.Request_Valid_From__c.daysBetween(pricingRequest.Request_Valid_To__c))/30);
    //system.debug('**** desired ACTION'+desiredAction+'&&&&&pricingRequest'+pricingRequest+'WWWWWWWWW'+requestServiceState);
    //System.debug('***daysBetween'+(pricingRequest.Request_Valid_From__c.daysBetween(pricingRequest.Request_Valid_To__c)/30)+'***'+pricingRequest.Request_Valid_To__c+'***'+pricingRequest.Request_Valid_From__c+'***'+requestServiceState.ogItems.orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c);
    //if(!desiredAction.containsIgnoreCase('Non Customer Specific'))
    //{
    /*if(pricingRequest.is_End_User_Rebate__c){
      requestServiceState.ogItems.orgGroupItems.Retroactive_Limit__c = 0;
        if(pricingRequest.Pricing_Request_Type__c!='Import'&& pricingRequest.Pricing_Request_Type__c!='Non Customer Specific' && pricingRequest.Request_Valid_From__c!=null && pricingRequest.Request_Valid_To__c!=null&&(pricingRequest.Request_Valid_From__c.daysBetween(System.now().date())>requestServiceState.ogItems.orgGroupItems.Retroactive_Limit__c || System.now().date().daysBetween(pricingRequest.Request_Valid_From__c)>requestServiceState.ogItems.orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c) )
        {
        errorMessage+=System.Label.Valid_From_Date_Out_Of_Range_Error + '<br/>';
        return errorMessage.trim();
      }    
    } */
    if(!pricingRequest.is_End_User_Rebate__c && pricingRequest.Pricing_Request_Type__c!='Import'&& pricingRequest.Pricing_Request_Type__c!='Non Customer Specific' && pricingRequest.Request_Valid_From__c!=null && pricingRequest.Request_Valid_To__c!=null&&(pricingRequest.Request_Valid_From__c.daysBetween(System.now().date())>requestServiceState.ogItems.orgGroupItems.Retroactive_Limit__c || System.now().date().daysBetween(pricingRequest.Request_Valid_From__c)>requestServiceState.ogItems.orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c) )
    {
      //system.debug('****in error check');
      //<PP20131115> - Changed error message to custom label
      //errorMessage+='Please check Valid from <br>';  //custom settings
      errorMessage+=System.Label.Valid_From_Date_Out_Of_Range_Error + '<br/>';
      return errorMessage.trim();
    } 
    //<PP20131115> - Checking for monthsBetween
    if(pricingRequest.Pricing_Request_Type__c!='Import'&& pricingRequest.Pricing_Request_Type__c!='Non Customer Specific' && pricingRequest.Request_Valid_From__c!=null && pricingRequest.Request_Valid_To__c!=null &&(pricingRequest.Request_Valid_From__c.monthsBetween(pricingRequest.Request_Valid_To__c)) >requestServiceState.ogItems.orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c)
    {
      //<PP20131115> - Changed error message to custom label
      //errorMessage+='Please check Valid To date. <br>';  
      errorMessage+= System.Label.Valid_To_Date_Out_Of_Range_Error +'<br/>';
      return errorMessage.trim();
    }
    //}
    }
    //<PP20140218> - Added condition not to throw validations on click of 'View Customer Prices'
    else if(desiredAction.containsIgnoreCase('Next') && !desiredAction.containsIgnoreCase('ViewCustomerPrices'))
    {

      if(String.isBlank(pricingRequest.Request_Name__c))
      {
        errorMessage+=System.Label.Request_Name_Mandatory_Error+'<br/>';

      }      
      //<HN14032015> Added validation when quotes used in Request name.
        if(pricingRequest.Request_Name__c.contains('\"'))
        {
      errorMessage+= 'Please enter a valid Request Name. Request name should not contain quotes'+'<br/>';
        }
        //<HN14032015> END
      //<PP20130715> START
      if(requestServiceState != null && requestServiceState.ogItems != null && requestServiceState.ogItems.orgGroupItems != null && requestServiceState.ogItems.orgGroupItems.Enable_Request_Class__c && (pricingRequest.Request_Class__c==null || pricingRequest.Request_Class__c=='--Select--'))
      {
        errorMessage+= System.Label.Request_Class_Mandatory_Error+'<br/>';
      }
      //<PP20130715> END

      //if spot type is Free of Charge,no need to check these
      //<VR20131111> DTT Rollout Issue - Changing the if condition to include only spot
      if(pricingRequest.Spot_Type__c == 'Spot Price')
      {
        if(String.isBlank(pricingRequest.Spot_Type__c) || pricingRequest.Spot_Type__c == '--Select--')
        {
          errorMessage+=System.Label.Pricing_Task_Type_Error+'<br/>';
        }
        if((pricingRequest.Terms_Of_Payment__c <> 'Other') && (String.isBlank(pricingRequest.Terms_Of_Payment__c) || pricingRequest.Terms_Of_Payment__c == '--Select--'))
        {
          errorMessage+=System.Label.Payment_Term_Error+'<br/>';
        }

        if(pricingRequest.Terms_Of_Payment__c == 'Other' && String.isBlank(pricingRequest.Non_Standard_Terms_Of_Payment__c))
        {
          errorMessage+=System.Label.Non_Standard_Payment_Term_Error+'<br/>';
        }
        if((pricingRequest.Incoterm__c <> 'Other') && (String.isBlank(pricingRequest.Incoterm__c) || pricingRequest.Incoterm__c == '--Select--'))
        {
          errorMessage+=System.Label.Incoterm_Error+'<br/>';
        }
        if(pricingRequest.Incoterm__c == 'Other' && String.isBlank(pricingRequest.Non_Standard_Incoterm__c))
        {
          errorMessage+=System.Label.Non_Standard_Incoterm_Error+'<br/>';

        }
      }

      if(String.isBlank(pricingRequest.Request_Reason__c) || pricingRequest.Request_Reason__c == '--Select--')
      {
        errorMessage+=System.Label.Request_Reason_Mandatory_Error+'<br/>';

      }

      if(String.isBlank(pricingRequest.Task_Subject__c))
      {
        errorMessage+=System.Label.Task_Subject_Error+'<br/>';

      }
      if(String.isBlank(userSelected))
      {
        errorMessage+=System.Label.Assigned_To_Select_Error+'<br/>';

      }
      if(pricingRequest.Due_Date__c == NULL)
      {
        errorMessage+=System.Label.Due_Date_Enter_Error+'<br/>';

      }
      if(pricingRequest.Due_Date__c < system.today())
      {
        errorMessage+=System.Label.Due_Date_Invalid_error+'<br/>';

      }//<AG20210219> START
      if(((SelectedBU=='BI AP Envelopes')||(SelectedBU=='BI AP Surfaces')||(SelectedBU=='DPT AP')) && (pricingRequest.Spot_Type__c=='Spot Price' || pricingRequest.Spot_Type__c=='Free of Charge') && (pricingRequest.Due_Date__c < system.today().addMonths(1)))
      { 
      
       errorMessage+=System.Label.Advance_Due_Date+'<br/>';
      
      }//<AG20210219> END 
    }
    return errorMessage.trim();
  }

  //This method is called when action on the corresponding page is called
  public String action(String newPagelabel, String currentPageLabel,String desiredAction)
  {  
    system.debug('*#&**hello'+desiredAction);
    String retErrorMessage ;
    //<PR20140905> START
    /*if(requestServiceState!= null && requestServiceState.ogitems != null &&
            requestServiceState.ogitems.userName != null){
            if(requestServiceState.ogitems.userName.containsIgnoreCase('--Select--')){
                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select sales rep');
                 ApexPages.addMessage(myMsg);
                 requestServiceState.erpCustomer.currentprices = 'viewPricesOnLoadExpOnly';
            }else if(!requestServiceState.ogitems.salesAdminPermissionSetFlag && requestServiceState.ogitems.userName != UserInfo.getName()){
                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Cannot create request on behalf of other sales rep');
                 ApexPages.addMessage(myMsg);
                 requestServiceState.erpCustomer.currentprices = 'viewPricesOnLoadExpOnly';
            }
        }*/
    Boolean fromendusersel = false;
    if(desiredAction.equalsIgnoreCase('RPQEndUserSelected')){
      fromendusersel = true;
      if(requestServiceState.ogItems.rebatesExists){
        desiredAction = 'RequestOverview';
        //action('PACustomerRequests',currentPageLabel,'RequestOverview');
      }
      else{
        desiredAction='currentPricesCustomer PriceNewPricingRequest';
        //action('PANewRequest',currentPageLabel,'currentPricesCustomer PriceNewPricingRequest');

      }
    }
    if(currentPageLabel.containsIgnoreCase('PACurrentPrices') && desiredAction.equalsIgnoreCase('customerPricesonBehalfOf')){
      if(requestServiceState.ogitems.salesAdminPermissionSetFlag && requestServiceState.ogitems!=null && requestServiceState.ogitems.userName == null){
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select sales rep');
        ApexPages.addMessage(myMsg);
        requestServiceState.erpCustomer.currentprices = 'viewPricesOnLoadExpOnly';
      }
    }
    //<PR20140905> END
    //system.debug('^^^^ On change'+desiredAction);
    //system.debug('pricingRequest.Id'+pricingRequest.Id);
    //NE20130409-landing cost-start
    Integer countPRI;
    if(pricingRequest!=null && pricingRequest.Id!=null){
      countPRI= [SELECT Count() FROM Pricing_Request_Item__c where PRicing_Request__c= :pricingRequest.Id ];
    }
    //system.debug('*****countPRI'+countPRI);
    if(countPRI==0){
      showLandingCost=true;
    }
    else{
      showLandingCost=false;
    }
    //NE20130409-landing cost-end
    // For Request reason -- Shiva Starts 31-01-13
    //For Bulk Approval of Pricing Requests
    if(desiredAction.containsIgnoreCase('bulkApproval'))
    {
      boolean errorMessageFlag = false;
      List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
      boolean errorFlag=false;
      for(PARelatedList relatedListObj : relatedWrappersList){

        try{
          for(PAWrapper wrapper : relatedListObj.wrapperList){
            //<PA20150107> added validation rule for approve button and displaying the warning message 
            if(wrapper.isSelected == true && ((Pricing_Request__c) wrapper.sObjectRecord).Current_Approver__c == userinfo.getuserid()){
              //system.debug('in if wrapper loop');
              //Ver 3.3
              pricingRequestSelectedList.add((Pricing_Request__c) wrapper.sObjectRecord);
            }
            else if(wrapper.isSelected == true){
              errorFlag=true;
              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Approve_Button_Permission_Warning_Message); 
              ApexPages.addMessage(myMsg);
              //string errorMsg='You do not have permission to approve the selected request';
              //PAUtil.apexWarningMsg(errorMsg);

            }
          }
        }
        catch(exception e){
          //system.debug('***In catch');                    
          break;   }

      }

      //<> START
      if(pricingRequestSelectedList != null && pricingRequestSelectedList.size() > 0 &&pricingRequestSelectedList.size() <= 5)
      {
        List<Id> pricingReqIdList = new List<Id>();
        List<String> pricingReqIdList1 = new List<String>();
        for(Pricing_Request__c pr : pricingRequestSelectedList)
        {
          pricingReqIdList.add(pr.Id);
          pricingReqIdList1.add('\''+pr.Id+'\'');
        }
        pricingRequestSelectedList.clear();
        //<BB20140321> Added Auto_Approver Fields in the query
        //<MS20140421> Added Backup_Level Name and approverText Fields in the query
        //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
        // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
        system.debug('\n\n\n pricingReqIdList1'+pricingReqIdList1);
        /*pricingRequestSelectedList = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                      State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                              SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                              Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                                              Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                              LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                              Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                                              CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                              Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
                                      Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                                     Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
                                     ,NPC_Status__c,Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,
                                     Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                                     ComPartner_Code__c, ComPartner__c  
                                     FROM Pricing_Request__c WHERE Id IN :pricingReqIdList];*/
        pricingRequestSelectedList = (List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', pricingReqIdList1.size()>0?' id in '+pricingReqIdList1:'');
        //<> END
        for(Pricing_Request__c pr : pricingRequestSelectedList){
          String oldLevel = pr.Current_Level__c;
          //<PP20130422> -- Ver 4.18
          //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
          //<PP20130711>
          //Brundha Roll out 2 <BR20130625>
          //<>
          //pr = [SELECT Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,/*Sold_To_Code__r.Sales_Area__c,*/Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
          //State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,/*Sold_To_Code__r.Customer_code__c,Sold_To_Code__r.Name,*/Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
          //SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
          //Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,
          //Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
          //LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
          //Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
          //CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
          //Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
          //Approver1_Date__c,Incoterms_Code__c,/*Sold_To_Code__r.Terms_Of_Payment_Code__c,Sold_To_Code__r.Incoterms_Code__c,Sold_To_Code__r.Incotems__c,
          // Sold_To_Code__r.Terms_Of_Payment__c,*/On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
          //Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c
          // ,NPC_Status__c,Sent_to_Backup_Approver__c  FROM Pricing_Request__c WHERE Id = :pr.Id];

          if(oldLevel <> pr.Current_Level__c && pr.Request_APproval_Status__c <> 'Submitted'){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Request_Status_Changed);  
            ApexPages.addMessage(myMsg);    
            errorMessageFlag = true;  
            break; 
          }
        }
        if(!errorMessageFlag){
          //system.debug('**in request bulk'+pricingRequestSelectedList);
          PAApprovalWF approvalWF = new PAApprovalWF(requestServiceState);
          approvalWF.bulkApproval(pricingRequestSelectedList);
          //added to get the requests after the first approver approves and the record is assigned to the  level approver(issue - 382)
          relatedWrappersList = getListWrappers();
        }
      }
      else if(errorFlag==true)
      {

      }
      else
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please approve 5 requests at a time');  
        ApexPages.addMessage(myMsg);    
        errorMessageFlag = true;
      }
    }
    //<IM20150123>
    if(desiredAction.containsIgnoreCase('NewPricingRequest') || desiredAction.containsIgnoreCase('RequestOverview') && requestServiceState.ogitems.isEndUserRebate){
      system.debug('requestServiceState.currentRequest.endUserFilter is '+requestServiceState.currentRequest.endUserFilter);
      ERP_Customer__c selectedEndUs = new ERP_Customer__c();
      // Add Setting of End User here
      if(enduserfilter!=null){
        selectedEndUs = PAERPCustomer.getSelectedEndUser(requestServiceState.currentRequest.endUserFilter);
        requestServiceState.currentRequest.selectedEndUser = selectedEndUs.Name;
        requestServiceState.currentRequest.selectedEndUserCode = selectedEndUs.Customer_Code__c;
        requestServiceState.currentRequest.selectedEndUserCountry = selectedEndUs.Country__c;
      }

      system.debug('selected end user is '+requestServiceState.currentRequest.selectedEndUser);
    }
    //<PP20140502> START
    if(desiredAction.equalsIgnoreCase('RequestOverview'))
    {
      //<BB20140516> making displayRequestHistory false
      displayPermanentRequestHistory= false;
      displayTaskRequestHistory= false;
      if(requestServiceState.erpCustomer!=null)
      {
        requestServiceState.erpCustomer.allCustomersWrapList = new List<PAWrapper>();
        System.debug('Customers:'+requestServiceState.erpCustomer.allCustomersWrapList);
      }
      relatedWrappersList = getListWrappers();
    }
    //<PP20140502> END
    //<PP20140502> START
    if(desiredAction.equalsIgnoreCase('cpSelChange'))
    {
      salesPriceSAP.pcKCConcatList = new List<SelectOption>();
      salesPriceSAP.pcKCSelected = '';
      action('PACurrentPrices','PACurrentPrices',desiredAction+'ViewCustomerPrices');
    }
    //<TJ20140923>
    if(desiredAction.equalsIgnoreCase('NonCustomerSpecificcpSelChange'))
    {
      action('PACurrentPrices','PACurrentPrices',desiredAction+'ViewCustomerPrices');
    }

    if(salesPriceSAP!=null)
      //system.debug('@@pranky'+salesPriceSAP.pcKCSelected);
      if(desiredAction.equalsIgnoreCase('pcKCSelChange'))
      {
        if(salesPriceSAP.pcKcSelected == '--Select--')
        {
          salesPriceSAP.pcKCConcatList = new List<SelectOption>();
        }
        action('PACurrentPrices','PACurrentPrices',desiredAction+'ViewCustomerPrices');
      }
    //<PP20140502> END

    //<MS20140901> Adding condition for task history START
    //<BB20140516> START
    if(desiredAction.equalsIgnoreCase('viewPermanentRequestHistory'))
    {
      //system.debug(logginglevel.error,'in Request History');
      displayPermanentRequestHistory= true;
      relatedWrappersList = getListWrappers();
    }
    //<BB20140516> END
    //<HL20140904> START
    if(desiredAction.equalsIgnoreCase('getUpdatedPricingRequest'))
    {
      //system.debug('inside desiredaction condition of getupdatedpricingrequest');
      getUpdatedPricingRequest();
    }
    //<HL20140904> END
    if(desiredAction.equalsIgnoreCase('viewTaskRequestHistory'))
    {
      //system.debug(logginglevel.error,'in Request History');
      displayTaskRequestHistory= true;
      relatedWrappersList = getListWrappers();
    }
    //<MS20140901>END
    //For Bulk Reassignment of Pricing Requests

    if(desiredAction.containsIgnoreCase('bulkReassignPopup')){
      boolean errorMessageFlag = false;
      //system.debug('**in request bulk1'+relatedWrappersList[0].wrapperList[0]+relatedWrappersList.size());
      List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
      //system.debug('**in request bulk1'+relatedWrappersList);
      for(PARelatedList relatedListObj : relatedWrappersList){

        try{
          for(PAWrapper wrapper : relatedListObj.wrapperList){
            if(wrapper.isSelected == true){
              //system.debug('in if wrapper loop');
              //Ver 3.3
              pricingRequestSelectedList.add((Pricing_Request__c) wrapper.sObjectRecord);
            }
          }
        }
        catch(exception e){
          //system.debug('***In catch');                    
          break;   }

      }
      for(Pricing_Request__c pr : pricingRequestSelectedList){
        String oldLevel = pr.Current_Level__c;
        //<PP20130422> -- Ver 4.18
        //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
        //<PP20130711>
        //Brundha Roll out 2 <BR20130625>
        //<BB20130626> -- Ver 4.24     -- added Standardized_Currency__c,Standardized_UoM__c in the query
        //<BB20140321> Added Auto_Approver Fields in the query
        //<MS20140421> Added Backup_Level Name and approverText Fields in the query
        //<BB20140429> --Added Default_Currency__c Fields in the query
        //<MS20140421> Added Current_Routing_Parameter__c Fields in the query
        // <BB20140523> -Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
        /*pr = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,Zip_PostalCode__c, Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
              State_Province__c,Spot_Type__c,Pricing_exception__c,Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                      SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                      Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, Owner.Name,On_Behalf_Of__c,
                      Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                      LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                      Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,CreatedDate,
                      CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                      Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,Approver1__r.Name, Approver2__r.Name, Approver3__r.Name, Approver4__r.Name, approver5__r.Name,
              Approver1_Date__c,Incoterms_Code__c,On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c, Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c, Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                              Backup_Level_1__c, Backup_Level_2__c, Backup_Level_3__c, Backup_Level_4__c, Backup_Level_5__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c, Project_Header_Approval_Flag__c,NPC_Status__c,Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,
                              Default_Currency__c,Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                              ComPartner__c, ComPartner_Code__c 
                              FROM Pricing_Request__c WHERE Id = :pr.Id];*/

        pr = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+pr.Id+'\''))[0];
        if(oldLevel <> pr.Current_Level__c && pr.Request_APproval_Status__c <> 'Submitted'){
          ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Request_Status_Changed);  
          ApexPages.addMessage(myMsg);    
          errorMessageFlag = true;  
          break; 
        }
      }
      if(!errorMessageFlag){
        //system.debug('**in request bulk'+pricingRequestSelectedList);
        approvalWF = new PAApprovalWF(requestServiceState);
        approvalWF.bulkReassignPopup(pricingRequestSelectedList);
      }
    }
    if(desiredAction.containsIgnoreCase('closeReassignPopup')){
      approvalWF = new PAApprovalWF(requestServiceState);
      approvalWF.action(newpageLabel, currentPageLabel, 'closeReassignPopup');
    }
    if(desiredAction.containsIgnoreCase('closeuserLookup')){
      if(approvalWF == NULL)
        approvalWF = new PAApprovalWF(requestServiceState);
      approvalWF.closeuserLookup();
    }
    if(desiredAction.containsIgnoreCase('reassignLookup')){
      // system.debug('**in request bulkreassignpopup'+relatedWrappersList[0].wrapperList[0]+relatedWrappersList.size());
      List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
      for(PARelatedList relatedListObj : relatedWrappersList){

        try{
          for(PAWrapper wrapper : relatedListObj.wrapperList){
            if(wrapper.isSelected == true){
              //system.debug('in if wrapper loop');
              //Ver 3.3
              pricingRequestSelectedList.add((Pricing_Request__c) wrapper.sObjectRecord);
            }
          }
        }
        catch(exception e){
          //system.debug('***In catch');                    
          break;   }

      }
      //system.debug('**in request bulk'+pricingRequestSelectedList);
      if(approvalWF == NULL)
        approvalWF = new PAApprovalWF(requestServiceState);
      approvalWF.reassignLookup(pricingRequestSelectedList);
    }
    if(desiredAction.containsIgnoreCase('saveBulkReassign')){
      //system.debug('**in request bulk1'+relatedWrappersList[0].wrapperList[0]+relatedWrappersList.size());
      List<Pricing_Request__c> pricingRequestSelectedList = new List<Pricing_Request__c>();
      for(PARelatedList relatedListObj : relatedWrappersList){

        try{
          for(PAWrapper wrapper : relatedListObj.wrapperList){
            if(wrapper.isSelected == true){
              //system.debug('in if wrapper loop');
              //Ver 3.3
              Pricing_Request__c reqtype = (Pricing_Request__c) wrapper.sObjectRecord;
              //  if(reqtype.Spot_Type__c!=null && reqtype.Spot_Type__c!='Rebate Agreement')
              //  {
              System.debug('Current request Spot_Type__c:'+reqtype.Spot_Type__c);
              pricingRequestSelectedList.add((Pricing_Request__c) wrapper.sObjectRecord);
              // }
              /*else
                            {
                              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING,'Currently Pricing Task Rebate Agreement cannot be reassigned'); 
                            ApexPages.addMessage(myMsg);
                            }*/
            }
          }
        }
        catch(exception e){
          //system.debug('***In catch');                    
          break;   }

      }
      //system.debug('**in request bulk'+pricingRequestSelectedList);
      if(approvalWF == NULL)
        approvalWF = new PAApprovalWF(requestServiceState);
      approvalWF.savebulkReassign(pricingRequestSelectedList, approvalWF.reassignedUserId);
    }


    //for making Non Commercial Null
    if(desiredAction.containsIgnoreCase('PaymentTermOnChange'))
    {
      pricingRequest.Non_Standard_Terms_Of_Payment__c = null;
      //system.debug('***new '+newPagelabel);
      return newPagelabel;

    }
    if(desiredAction.containsIgnoreCase('incoTermOnChange'))
    {
      pricingRequest.Non_Standard_Incoterm__c = null;
      return newPagelabel;
    }
    //<MS20140929> Adding logic to close popup
    else if(desiredAction=='Closewindow'){
      //system.debug('@@@@@@@@@@@');
      pclDisplayPopUp='';
      pclShowSelectionTable= false;
      return 'PAPclTemplateSelectionPCO';
    }

    //<PP20130715> START
    if(desiredAction.containsIgnoreCase('NewPricingRequest') && !(desiredAction.contains('save')) && !(desiredAction.containsIgnoreCase('cancel')) && !(desiredAction.contains('Next')))
    {
      system.debug('requestServiceState.currentRequest.selectedEndUser is '+requestServiceState.currentRequest.selectedEndUser);
      pricingRequest.End_User__c = requestServiceState.currentRequest.selectedEndUser;
      pricingRequest.End_User_Code__c = requestServiceState.currentRequest.selectedEndUserCode;
      pricingRequest.End_User_Country__c = requestServiceState.currentRequest.selectedEndUserCountry;
      requestServiceState.ogItems.ogItemFromRequest(pricingRequest);

    }
    //<PP20130715> END
    //added for massive and non customer specific 'Create New' button 
    if(desiredAction.containsIgnoreCase('Massive Change') && !(desiredAction.contains('NewPricingRequestsave'))&& !(desiredAction.containsIgnoreCase('cancel')))
    {
      //System.debug('^^^^ In Massive'+desiredAction);
      retErrorMessage = validate(desiredAction);
      if(!string.isBlank(retErrorMessage))
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {
        pricingRequest.Request_Type__c='Massive';
        pricingRequest.Pricing_Request_Type__c = 'Permanent';
        //Version 4.24:Production Issue, request status changing to Draft from Submitted/Recalled/Rejected
        if(pricingRequest.Request_Approval_Status__c == NULL)
          pricingRequest.Request_Approval_Status__c = 'Draft';
        pricingRequest.spot_type__c = null;
        //Ver 2.9:  Added - bala Feb 26
        //Ver 3.0 : NULL CHECK-- added by Priyanka
        if(requestServiceState.ogitems.selectedUser != null && !String.isBlank(requestServiceState.ogitems.userName))
        {
          pricingRequest.On_Behalf_Of__c = ID.valueOf(requestServiceState.ogitems.selectedUser);
          pricingRequest.OwnerId = ID.valueOf(requestServiceState.ogitems.selectedUser);
        }
        //3.9 Bala 9 march
        else if(requestServiceState.ogitems.selectedUser != null && String.isBlank(requestServiceState.ogitems.userName))
        {
          requestServiceState.ogitems.selectedUser = null;
        }
        return newPagelabel;
      } 
    }
    if(desiredAction.containsIgnoreCase('Non Customer Specific') && !(desiredAction.contains('NewPricingRequestsave'))&& !(desiredAction.containsIgnoreCase('cancel')))
    {
      retErrorMessage = validate(desiredAction);
      if(!string.isBlank(retErrorMessage))
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {
        pricingRequest.Request_Type__c='Non Customer Specific';
        pricingRequest.Pricing_Request_Type__c = 'Permanent';
        //Version 4.24:Production Issue, request status changing to Draft from Submitted/Recalled/Rejected
        if(pricingRequest.Request_Approval_Status__c ==  NULL)
          pricingRequest.Request_Approval_Status__c = 'Draft';
        pricingRequest.spot_type__c = null;
        return newPagelabel;
      }
    }
    //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference for validation
    else if(desiredAction.containsIgnoreCase('Floor Pricing') && !(desiredAction.contains('NewPricingRequestsave'))&& !(desiredAction.containsIgnoreCase('cancel')))
    {
      retErrorMessage = validate(desiredAction);
      if(!string.isBlank(retErrorMessage))
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {
        pricingRequest.Request_Type__c='Non Customer Specific';
        pricingRequest.Pricing_Request_Type__c = 'Floor';
        pricingRequest.Request_Approval_Status__c = 'Draft';
        pricingRequest.spot_type__c = null;
        return newPagelabel;
      }
    }
    //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference for validation
    else if(desiredAction.containsIgnoreCase('Reference Pricing') && !(desiredAction.contains('NewPricingRequestsave'))&& !(desiredAction.containsIgnoreCase('cancel')))
    {
      retErrorMessage = validate(desiredAction);
      if(!string.isBlank(retErrorMessage))
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {
        pricingRequest.Request_Type__c='Non Customer Specific';
        pricingRequest.Pricing_Request_Type__c = 'Reference';
        pricingRequest.Request_Approval_Status__c = 'Draft';
        pricingRequest.spot_type__c = null;
        return newPagelabel;
      }
    }

    //sanjib for selecting template
    else if(desiredAction=='selectTemplate') {
      //<MS20140929> Adding condition to display templates without search
      if(String.isBlank(pclDisplayPopUp))
      {

        pclShowSelectionTable= true;
      }
      //system.debug('templateeeeeee'+pclDisplayPopUp);
      csvString='';
      action('PAPclTemplateSelectionPCO','PAPclTemplateSelectionPCO','PCLSEARCH');
    }
    else if(desiredAction=='cancelGeneration'){
      return newPagelabel;
    }
    else if(desiredAction=='PCLcancelTemplateselection'){
      csvString='';
      return newPagelabel;
    }

    //PCL logic
    else if(desiredAction.containsIgnoreCase('PCLGeneration'))
    {
      //system.debug('*&*&*^ pricingRequest'+pricingRequest.id);

      //system.debug('*&*&*^ requestServiceState.ogItems.userName '+requestServiceState.ogItems.userName);

      list<PAWrapper> records=new list<PAWrapper>();
      String contacId='';
      list<id> id=new list<id>();
      //relatedWrappersList=salesPriceSAP.getListWrappers();
      //system.debug('insideifforpcl'+relatedWrappersList.size());
      //system.debug('insideifforpcl'+salesPriceSAP.relatedWrappersList.size());

      set<String> projectIds= new  set<String>();
      set<String> priceTypeNotProject= new  set<String>();
      //<TJ20150619> Fetching Customer Info for PCL Generation
      List<PAPCLCustomerData__c> allcustdata=new List<PAPCLCustomerData__c>();
      allcustdata=[Select name from PAPCLCustomerData__c];
      system.debug('custCode '+customer.customerCode);
      PAPCLCustomerData__c custdata=new PAPCLCustomerData__c();
      custdata.name=customer.customerCode;
      custdata.Sold_To_Code__c=customer.customerCode;
      custdata.Dist_Channel_Code__c=customer.distCode;
      custdata.Sales_Org_Code__c=customer.salesOrgCode;
      custdata.Division_Code__c = customer.divCode;
      boolean pclflag=false;
      if(allcustdata.size()>0)
        for(PAPCLCustomerData__c pcl:allcustdata)
        {
          if(pcl.name==custdata.name)
            pclflag=true;
        }
      if(pclflag==false)
        insert custdata;

      Id templateId;
      templateId=[select id from EmailTemplate where Name=: pclDisplayPopUp].Id;
      //system.debug('%%&& templateId'+templateId);
      ERP_Sales_Prices_SAP__c recordId=new ERP_Sales_Prices_SAP__c();


      //selected records for PCL genertaion
      if(desiredAction.equalsIgnoreCase('PCLGenerationPriReq'))
      {

        contacId=customerContact+'#'+pricingRequest.id+'#'+'FromPricingrequest';

        if(!string.isBlank(requestServiceState.ogItems.userName))
          contacId = contacId+'###'+requestServiceState.ogItems.userName;

        if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(!String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Cust Specific PCL - CS').folder_Id__c))
        {
          throw new PAException('Please Select Project template',ApexPages.severity.Error);
        }
        ///Added on 16th May 2014
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Cust Specific PCL - F46A').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        ///end///

        //Added 19th May
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva CH Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva DE Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva ES Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva FR Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva UK Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux DE Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux ES Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux FR Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux LU Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux UK Header PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        //end

        //Added 20th May
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Cust Specific PCL - F450').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('P&IP EMEA PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        else if(String.isBlank(pricingRequest.Project_Id__c) && pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('P&IP NA PCL').folder_Id__c))
        {
          throw new PAException('Please Select Customer Specific template',ApexPages.severity.Error);
        }
        //end

        //Erp Sap record 
        recordId.Record_Id__c=contacId;
        insert   recordId;
        system.debug('*** contact Id'+contacId);
        listofids=recordId.id;
      }
      else
      {
        for(PARelatedList wRec1 : salesPriceSAP.relatedWrappersList)
        {
          for(PAWrapper r1 : wRec1.wrapperList)
          {
            if(r1.isSelected == true)
            {
              records.add(r1);

              //ver 4.19 starts anand
              //ERP_Sales_Prices_SAP__c erpSapObj = null;
              ERP_Sales_Prices_SAP__c erpSapObj = new ERP_Sales_Prices_SAP__c();
              erpSapObj = (ERP_Sales_Prices_SAP__c) r1.sobjectRecord;

              if(erpSapObj.Sales_Price_Type__c=='Project')
              {
                projectIds.add(erpSapObj.Project_Id__c);
              }
              else
              {
                priceTypeNotProject.add(erpSapObj.Sales_Price_Type__c);
              }
              //ver 4.19 ends
            }
          }
        }

        //ver 4.19 starts 
        if(projectIds.size()>1)
        {
          throw new PAException('Records selected are of different Project, Please select records of Only  One Project',ApexPages.severity.Error);

        }

        if(records==null || records.size()==0)
        {
          //version 2.2 starts
          throw new PAException(Label.Select_Record,ApexPages.severity.Error);
          //2.2 ends
        }

        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Cust Specific PCL - CS').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }

        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Project - P7780').folder_Id__c) && priceTypeNotProject.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }

        ///Added on 16th May 2014
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Cust Specific PCL - F46A').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        ///end///


        //Added 19th May
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva CH Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva DE Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva ES Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva FR Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Geneva UK Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux DE Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux ES Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux FR Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux LU Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Lux UK Header PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        //end

        //Added 20th May
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('Cust Specific PCL - F450').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('P&IP EMEA PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        if(pclDisplayPopUp.equalsIgnoreCase(PA_Email_Template_Custom_Settings__c.getInstance('P&IP NA PCL').folder_Id__c) && projectIds.size()>0)
        {
          throw new PAException('Please select records for selected template',ApexPages.severity.Error);
        }
        //end

        for(PAWrapper c:records)
        {
          //Ver 3.3
          id.add((String)c.sobjectRecord.get('id'));
        }

        /*
                '#' is used to seperate customer contact and its corresponding id
                this is used in the VF page for segration to avoid additional field creation on the object
         */
        for(integer j=0;j<id.size();j++)
        {
          if(j==0)
          {
            contacId=customerContact+'#'+id[j];
          }
          else
          {
            contacId+='/'+id[j];
          }
        }
        if(!string.isBlank(requestServiceState.ogItems.userName))
          contacId = contacId+'###'+requestServiceState.ogItems.userName;
        //Erp Sap record 
        
        system.debug('*** contacId '+contacId);
        recordId.Record_Id__c=contacId;
        insert   recordId;

        listofids=recordId.id;
      }



      //sending pcl as attachment thru email to requestor
      Messaging.SingleEmailMessage singleEmail = new Messaging.SingleEmailmessage();
      singleEmail.setTemplateId(templateId);
      //singleEmail.setToAddresses(toAddresses);
      singleEMail.setTargetObjectId(userinfo.getuserid());
      singleEMail.setSaveAsActivity(false);
      System.debug('recordId.id:'+recordId.id);
      singleEmail.setWhatId(recordId.id);
            system.debug(singleEmail.getWhatId());
      //singleEmail.setSubject('Price Confermation Letter');
      //singleEmail.setHtmlBody('Dear Requestor ,<br><br> The attached file contains a list of approved prices.<br><br>Thank you,<br>Salesforce.com Price Approval<br><br>Confidential ');
      //system.debug('*****MAIL IS SENT*****');
      Messaging.sendEmail(new Messaging.SingleEmailMessage[] {singleEmail});
      delete recordId;
      //<AG20200401>start
      if(true) { throw new PAException(System.Label.PCL_Success_Message,ApexPages.Severity.INFO); }
      //end
     // return null;
      return 'PaPCLGenerationPage';
    } 
    //<GT20150122> added code for massive import
    else if(desiredAction=='createImport' || desiredAction=='createMassiveImport') {
      customer.paERPCustomer = new ERP_Customer__c(); 
      if(pricingRequest.Sales_Org_Code__c==null) {
        throw new PAException(Label.Select_a_value_in_Sales_Org_Error,ApexPages.severity.Error);
      }

      //added - bala 3.15
      //onbehalf of not selected
      //system.debug('*** UserName'+requestServiceState.ogitems.userName);
      if(String.isBlank(requestServiceState.ogitems.selectedUser) && String.isBlank(requestServiceState.ogitems.userName))
      {
        // getting sales area from OrgGroup Users 
        /*List<Organizational_Group_User__c> orgGroupUser = [SELECT OrgGroup__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c,
                                                           OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c=:userInfo.getUserId()];*/
        List<Organizational_Group_User__c> orgGroupUser = (List<Organizational_Group_User__c>)PAQueryUtil.query('PARequest', 'ogUsersSA', ' Related_User__c = \''+userInfo.getUserId()+'\'');
        set<string> salesOrgs = new set<string>();
        for(Organizational_Group_User__c orgUser:orgGroupUser)
        {
          salesOrgs.add(orgUser.OrgGroup__r.ERP_Sales_Org_Code__c);  
        }

        if(!salesOrgs.contains(pricingRequest.Sales_Org_Code__c))
        {
          throw new PAException('Selected Sales Org doesnot match for the user ',ApexPages.severity.Error);                   
        }

      }
      //on behalfOf selected
      else
      {
        /*List<Organizational_Group_User__c> orgGroupUser = [SELECT OrgGroup__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c,
                                                           OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c=:requestServiceState.ogitems.selectedUser];*/
        List<Organizational_Group_User__c> orgGroupUser = (List<Organizational_Group_User__c>)PAQueryUtil.query('PARequest', 'ogUsersSA', ' Related_User__c = \''+requestServiceState.ogitems.selectedUser+'\'');

        set<string> salesOrgs = new set<string>();
        System.debug('orgGroupUser:'+orgGroupUser);

        for(Organizational_Group_User__c orgUser:orgGroupUser)
        {
          salesOrgs.add(orgUser.OrgGroup__r.ERP_Sales_Org_Code__c);  
        }
        System.debug('salesOrgs:'+salesOrgs);
        System.debug('pricingRequest.Sales_Org_Code__c:'+pricingRequest.Sales_Org_Code__c);
        if(!salesOrgs.contains(pricingRequest.Sales_Org_Code__c))
        {
          throw new PAException('Selected Sales Org doesnot match for the user ',ApexPages.severity.Error);                   
        }

      }


      //else {
      //customer.paERPCustomer.Sales_Area__c = pricingRequest.Sales_Org_Code__c+'-'+pricingRequest.Sales_Org__c+'<br>'+pricingRequest.Dist_Channel_Code__c+'-'+pricingRequest.Dist_Channel__c+'<br>'+pricingRequest.Division_Code__c+'-'+pricingRequest.Division__c;        
      customer.salesArea = pricingRequest.Sales_Org_Code__c+'-'+pricingRequest.Sales_Org__c+'<br>'+pricingRequest.Dist_Channel_Code__c+'-'+pricingRequest.Dist_Channel__c+'<br>'+pricingRequest.Division_Code__c+'-'+pricingRequest.Division__c;
      if(pricingRequest.On_Behalf_Of__c!=null) {
        onBehalfOf = [SELECT Name FROM User WHERE id=:pricingRequest.On_Behalf_Of__c].Name;
      }           
      if(desiredAction=='createMassiveImport')
        massiveImport = true;
      pricingRequest.Request_Type__c = 'Import';
      pricingRequest.Pricing_Request_Type__c = 'Import';
      return newPagelabel;
      // }
    }

    else if(desiredAction=='Fetch100Records') { 
      if(pricingRequest.Due_Date__c == NULL){
        throw new  PAException(Label.Valid_On_Must_Error,ApexPages.Severity.ERROR);
      }
      else
      {
        pclDisplayPopUp='fetch';
        //pricingRequest.Request_Type__c = 'Import';
        //pricingRequest.Pricing_Request_Type__c = 'Permanent';
        //<VR20131218> DTT Rollout Issue - Making the list null before fetching the record
        relatedWrappersList = null;

        salesPriceSAP.action(newPageLabel,currentPageLabel,'Fetch100Records');
        relatedWrappersList = salesPriceSAP.relatedWrappersList;
        return newPagelabel;
      }
    }
    else if(desiredAction=='PCLfetch'){
      if(pricingRequest.Due_Date__c == NULL){
        throw new  PAException(Label.Valid_On_Must_Error,ApexPages.Severity.ERROR);
      }
      else if(String.isBlank(pclDisplayPopUp)){
        throw new  PAException(Label.Select_template,ApexPages.Severity.ERROR);
      }
      else if(!pclDisplayPopUp.contains('_')){
        throw new  PAException(Label.Select_template,ApexPages.Severity.ERROR);
      }

      else if(String.isBlank(customerContact)){
        throw new  PAException(Label.Customer_contact,ApexPages.Severity.ERROR);
      }
      else
      {
        //system.debug('giiiii');
        /// ver 4.17 start
        // pricingRequest.Pricing_Request_Type__c = 'Permanent';        
        this.salesPriceSAP.action(newPageLabel,currentPageLabel,desiredAction);
        //system.debug('giiiii'+newPagelabel);
        return newPagelabel;
        //4.17 ends
      }
    }

    else if(desiredAction=='keyCombOnChange') {
      pclDisplayPopUp='none';
      //system.debug('***keyonchan');
      //requestServiceState.ogItems.ogItemFromRequest(pricingRequest);
      return newPagelabel;
    }

    else if(desiredAction=='exportCSV') {
      action('PAExportPrices','PAExportPrices','priCondOnchange');
      System.debug('scaleEnable:'+scaleEnable);
      csvString = columnGenerate();
      system.debug('csvString : '+csvString);
      /*
            List<PARelatedList> relatedWrapList = relatedWrappersList;

            salesPriceSAP.action(newPageLabel,currentPageLabel,'Fetch100Records');
            exportWrapList = salesPriceSAP.exportWrapList;
            relatedWrappersList = salesPriceSAP.relatedWrappersList;
            System.debug('final price records :'+relatedWrappersList.size());
            List <Sobject> exportList = new List<Sobject>();
            if(relatedWrapList!=null && relatedWrapList.size()>0) {
                List<PAWrapper> relatedWrapper = relatedWrapList[0].wrapperList;               
                for(PAWrapper relatedWrapperObj : relatedWrapper) {
                    //Ver 3.3
                    exportList.add(relatedWrapperObj.sobjectRecord);
                }               
            }
       */
      List <Sobject> exportList = new List<Sobject>();
      salesPriceSAP.action(newPageLabel,currentPageLabel,'exportCSV');
      system.debug('@^#%&@%#helloafter export');
      exportWrapList = salesPriceSAP.exportWrapList;
      if(exportWrapList!=null && exportWrapList.size()>0) {
        List<PAWrapper> relatedWrapper = exportWrapList[0].wrapperList;               
        for(PAWrapper relatedWrapperObj : relatedWrapper) {
          //Ver 3.3
          // if(exportList.size()<= 500)
          //{
          exportList.add(relatedWrapperObj.sobjectRecord);
          // }
          //else
          //break;
        }               
      }
      System.debug('csvString:-'+csvString);
      if(exportList.size()>0 && (!string.isBlank((string)exportList[0].get('Sales_Price_Type__c'))) && (((string)exportList[0].get('Sales_Price_Type__c')).contains('Floor') || ((string)exportList[0].get('Sales_Price_Type__c')).contains('Reference') ||((string)exportList[0].get('Sales_Price_Type__c')).contains('Net Floor') ||((string)exportList[0].get('Sales_Price_Type__c')).contains('Net Reference'))) {
        csvString = expDataGen(csvString, 'Sales_Prices__c',exportList,'');
      }
      else {
        csvString = expDataGen(csvString, 'ERP_Sales_Prices_SAP__c',exportList,'');
      }
      return newPageLabel;
    }

    else if(desiredAction=='PCLSEARCH')
    {
      //system.debug('***check'+email);
      if(email==null || email.size()==0) 
      {
        email = new Map<string,string>();
        email.put('Type','');
        email.put('Language','');
        email.put('Description','');
      }

      //system.debug('***check'+email);
      csvString='renderTable';
      //pclDisplayPopUp = 'PCLRender';
      list<String> SplitedtemplateName=new list<String>();
      list<emailtemplate> searchtable=new list<emailtemplate>();
      templateWrapper=new list<PAWrapper>();
      list<PAWrapper> t=new list<PAWrapper>();
      string templatename;
      //<MS20140918> Adding BU filter for PCL
      string sBU=selectedBU+'%';
      //system.debug('sBU'+ sbU);

      if(email.get('Language')=='--Select--')
      {
        templatename='%'+email.get('Type')+'_'+''+'%';
        //system.debug('####'+templatename);

      }
      else  
      { 
        templatename='%'+email.get('Type')+'_'+email.get('Language')+'%';
        //system.debug('@@@@@'+templatename);
      }
      //<MS20140922>Adding BU filter in queries
      //system.debug('@@@@@ email b4 '+email);
      if(String.isBlank(email.get('Type')) && (email.get('Language')=='--Select--'|| String.isBlank(email.get('Language'))) && String.IsBlank(email.get('Description')))
      {
        system.debug(sBU);
        searchtable=[Select Id, Name,body,description, IsActive, Folder.Name 
                     From EmailTemplate where Folder.Name=:PA_Email_Template_Custom_Settings__c.getInstance('priceApprovalFolder').folder_Id__c and Name like:sBU] ;
        //system.debug('!!!!!! In If '+searchtable);
      }
      else
      {
        //system.debug('\n\n\n templatename '+templatename+' '+email.get('Description')+' '+sBU);
        searchtable=[select id,name,body,HtmlValue,Markup,Description from  EmailTemplate where  Folder.Name=:PA_Email_Template_Custom_Settings__c.getInstance('priceApprovalFolder').folder_Id__c 
            and (name like :templatename and description like :email.get('Description')+'%') and Name like:sBU];
        //system.debug('!!!!!! In Else '+searchtable);
      }
      //system.debug('!!!!!!searchtable '+searchtable);
      //system.debug('!!!!!! searchtable size '+searchtable.size());

      for(EmailTemplate s:searchtable)
      {
        PAWrapper templateWrapperObj = new PAWrapper();
        SplitedtemplateName=s.Name.Split('_');
        //system.debug('$$$$'+SplitedtemplateName);
        templateWrapperObj.stringMap.put('Template',s.Name);
        templateWrapperObj.stringMap.put('Type',SplitedtemplateName[0]);
        templateWrapperObj.stringMap.put('Language',SplitedtemplateName[1]);
        templateWrapperObj.stringMap.put('Description',s.Description);
        templateWrapper.add(templateWrapperObj);
        //system.debug('++++++++++++'+templateWrapper);
        // TemplateWrapper q1=new TemplateWrapper(s.name,SplitedtemplateName[0],SplitedtemplateName[1],s.Description );
        //TemplateSe]lection .add(q1);

      }

      return 'PAPclTemplateSelectionPCO';
    }



    else if(desiredAction == 'priCondOnchange') {
      //system.debug('**prichange'+desiredAction);
      keyCombination.pc = pricingCondition;
      keyCombination.pc.selectedPricingCondition = pricingCondition.selectedPricingCondition;
      //keyCombination.keyCombinationID='--Select--';
      requestServiceState.ogItems.ogItemFromRequest(pricingRequest);
      //system.debug('***pricondcheck'+pricingCondition.selectedPricingCondition);
      if(string.isBlank(pricingCondition.selectedPricingCondition) || pricingCondition.selectedPricingCondition=='--Select--') {
        scaleEnable = 'false';

        return newPageLabel;
      }
      //<PP20130711>
      //<PP20140418>
      /*Organizational_Group_Item__c orgGroupItemObj = [select Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,
                                                            ERP_Pricing_Procedure__r.SAP_Client_Id__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c 
                                                            from Organizational_Group_Item__c where Business__c=:requestServiceState.ogItems.selectedBU 
                                                            AND OrgGroup__r.ERP_Sales_Org_Code__c = :pricingRequest.Sales_Org_Code__c
                                                      AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :pricingRequest.Dist_Channel_Code__c 
                                                      AND OrgGroup__r.ERP_Division_Code__c = :pricingRequest.Division_Code__c limit 1];*/
      Organizational_Group_Item__c orgGroupItemObj = ((List<Organizational_Group_Item__c>)PAQueryUtil.query('PARequest', 'orgGroupItemObj', ' Business__c=\''+requestServiceState.ogItems.selectedBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c = \''+pricingRequest.Sales_Org_Code__c+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c = \''+pricingRequest.Dist_Channel_Code__c+'\' AND OrgGroup__r.ERP_Division_Code__c = \''+pricingRequest.Division_Code__c+'\' limit 1'))[0];

      /*ERP_Procedure_Conditions__c proCondObj = [select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__r.Calculation_Type__c from ERP_Procedure_Conditions__c 
                                                      WHERE Sales_Pricing_Procedure__c=:orgGroupItemObj.ERP_Pricing_Procedure__c AND 
                                                Pricing_Condition__c=:pricingCondition.selectedPricingCondition];*/
      ERP_Procedure_Conditions__c proCondObj = ((List<ERP_Procedure_Conditions__c>)PAQueryUtil.query('PARequest', 'proCondObj', ' Sales_Pricing_Procedure__c = \''+orgGroupItemObj.ERP_Pricing_Procedure__c+'\' AND Pricing_Condition__c=\''+pricingCondition.selectedPricingCondition+'\''))[0];                                          

      /*ERP_Pricing_Condition__c priCondObj = [SELECT  SystemModstamp, Status__c,   Scale_Type__c,
                                                   Scale_Type_Code__c, Scale_Basis_Code__c, Scale_Base__c, SAP_Condition_Type__c, SAP_Cluster__c, SAP_Client_Id__c,
                                                   SAP_Application_Id__c, Pricing_Condition__c, Pricing_Condition_Description__c, Pricing_Condition_Code__c, Price_Types__c,
                                                   Plus_Minus__c, Plus_Minus_Code__c, OwnerId, Name, LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted,
                                                   Id, CurrencyIsoCode, CreatedDate, CreatedById, Condition_Class__c, Condition_Class_Code__c, Check_Scale__c,
                                             Check_Scale_Code__c, Calculation_Type__c, Calculation_Type_Code__c FROM ERP_Pricing_Condition__c WHERE id=:pricingCondition.selectedPricingCondition];*/
      ERP_Pricing_Condition__c priCondObj = ((List<ERP_Pricing_Condition__c>)PAQueryUtil.query('PARequest', 'priCondObj', ' id = \''+pricingCondition.selectedPricingCondition+'\''))[0];                                       

      pricingCondition.pricingCondition = priCondObj;

      if(proCondObj.Sales_Pricing_Procedure_Condition_Config__c!=null && (proCondObj.Sales_Pricing_Procedure_Condition_Config__c).contains('Enable Scale')) {
        scaleEnable = 'true';
      }
      else {
        scaleEnable = 'false';
      }
      return newPageLabel;
    }

    //This method upserts a Pricing Request on click of 'Save' in NewRequestPA Page and re-directs to AddPricingReqItemPA Page
    //<DW20150520> Added Condition
    else if(desiredAction.containsIgnoreCase('Editsave') || desiredAction.containsIgnoreCase('EditHeadersave') || desiredAction.containsIgnoreCase('goToRequest'))
    {
      //system.debug('@@@123 check here edit header');
      if(!desiredAction.containsIgnoreCase('goToRequest'))
        retErrorMessage = validate(desiredAction);      
      //newPagelabel = 'PricingRequestPANewPOC';
      if(!string.isBlank(retErrorMessage))
        //throw exception 
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {
        //updating on edit 
        requestServiceState.ogItems.ogItemFromRequest(pricingRequest);

        //Brundha Roll out 2  <BR20130625>
        if(pricingExceptionList != null && pricingExceptionList.size()>0){
          string PE='';
          for(integer i=0;i<pricingExceptionList.size();i++){  
            PE+=pricingExceptionList[i];                        
            if(i<pricingExceptionList.size()-1){
              PE+='<BR>';
            }

          }
          pricingRequest.Pricing_Exception__c=PE;
        }
        save();
        if(pricingRequest.Pricing_Request_Type__c=='Import') {
          relatedWrappersList = getListWrappers();
          pricingRequest = new Pricing_Request__c();
          newPagelabel='PAExistingRequest';
        }
        return newPagelabel;
      }            
    }

    //<BB20140404> -- Adding clone action
    else if(desiredAction.containsIgnoreCase('Clone'))
    { 

      system.debug('@*@&hi'+desiredAction);
      List<Pricing_Request_Item__c> requestItemCloneList =new List<Pricing_Request_Item__c>();
      Pricing_Request__c priceReqClone = new Pricing_Request__c();

      priceReqClone = pricingRequest.clone(false,true);
      priceReqClone.Request_Approval_Status__c = 'Draft';
      priceReqClone.Cloned_Request__c=true;
      priceReqClone.approverText__c=null;
      priceReqClone.Current_Level__c = null;
      priceReqClone.Current_Approver__c = null;
      //priceReqClone.Total_NPC_Received_Req_Items__c=pricingRequest.Total_NPC_Received_Req_Items__c;
      //priceReqClone.Total_NPC_Req_Items__c=null;
      priceReqClone.NPC_Status__c=null;
      priceReqClone.Submitted_On__c=null;
      //priceReqClone.F_NPC_Callout_Status__c='';
      //priceReqClone.NPC_Applicable__c=null;
      //priceReqClone.Approval1_Cycle_Time__c=null;
      //priceReqClone.Approval2_Cycle_Time__c=null;
      //priceReqClone.Approval3_Cycle_Time__c=null;
      //priceReqClone.Approval4_Cycle_Time__c=null;
      //priceReqClone.final_approval_cycle_time__c=null;
      priceReqClone.Approver1__c=null;
      priceReqClone.Approver2__c=null;
      priceReqClone.Approver3__c=null;
      priceReqClone.Approver4__c=null;
      priceReqClone.Approver5__c=null;
      priceReqClone.Approver1_Date__c=null;
      priceReqClone.Approver2_Date__c=null;
      priceReqClone.Approver3_Date__c=null;
      priceReqClone.Approver4_Date__c=null;
      priceReqClone.Approver5_Date__c=null;
      priceReqClone.Auto_Approver_Level1__c=null;
      priceReqClone.Auto_Approver_Level2__c=null;
      priceReqClone.Auto_Approver_Level3__c=null;
      priceReqClone.Auto_Approver_Level4__c=null;
      priceReqClone.Auto_Approver_Level5__c=null;
      priceReqClone.Backup_Level_1__c=null;
      priceReqClone.Backup_Level_2__c=null;
      priceReqClone.Backup_Level_3__c=null;
      priceReqClone.Backup_Level_4__c=null;
      priceReqClone.Backup_Level_5__c=null;
      //priceReqClone.Below_Current_Indicator__c=null;
      //priceReqClone.Below_Floor_Indicator__c=null;
      //priceReqClone.Below_Reference_Indicator__c=null;
      /*//<AV20140408>--Adding validation for on behalf of and sold to compatibility
            list<ERP_Relationship__c> erpRelationList = new list<ERP_Relationship__c>();
            system.debug('selected user is:'+requestServiceState.ogItems.selectedUser);

            erpRelationList = [SELECT Name,ERP_Customer__c,User__c,Partner_Function_Code__c FROM ERP_Relationship__c 
                               WHERE ERP_Customer__r.Customer_Code__c =: priceReqClone.SoldTo_Code__c And 
                               Partner_Function_code__c = 'ZU' AND User__c = :requestServiceState.ogItems.selectedUser 
                               AND Related_ERP_Customer__c=NULL];
            if(erpRelationList.size()==0)
            {
                system.debug('******* Error : Customer Code is not mapped for the On behalf of selected');
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.SoldTo_code_is_not_mapped_for_on_behalf_of_error); 
                ApexPages.addMessage(myMsg);
            }
            //<AV20140408>-validation ends*/  

      retErrorMessage= validate(desiredAction);
      if(!string.isBlank(retErrorMessage))
      {
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      //<MS20140828> Added condition for cloning Pricing task
      else if(desiredAction.containsIgnoreCase('save')|| desiredAction.containsIgnoreCase('next'))
      {
        requestServiceState.ogItems.ogItemFromRequest(pricingRequest);
        //system.debug('****inside CloneRequest*** new req'+ priceReqClone);
        insert priceReqClone;
      }



      //if spot type is not Rebate Agreement, then clone the items
      if(pricingRequest.Spot_Type__c <> 'Rebate Agreement')
      {
        //<BB20140508> Added Sales_Type__c,Sales_Type_Code__c in the query.
        /*List<Pricing_Request_Item__c>   requestItemList = [SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Disc_Ref__c,
                                                                   Market_Segment_Code__c,Market_Segment__c,Country_Code__c,Country__c,F_Product_Hierarchy_Code__c,
                                                                   Product_Hierarchy_Code__c,Key_Combination_SFDC__c,Scale_UoM_Scale_Unit__c, Valid_To__c, Valid_From__c, 
                                                                   UoM__c, Unit__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, SystemModstamp,Stamp_Reference_Price__c, 
                                                                   Stamp_Reference_Net_Price__c, Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,
                                                                   Stamp_Current_Net_Price__c, Stamp_Converted_Current_Price__c, Sold_To__c, Sold_To_Code__c, ShipTo__c, 
                                                                   ShipTo_Code__c, Scaled_Price_Flag__c,ScaleRate9__c, ScaleRate8__c, ScaleRate7__c, ScaleRate6__c, 
                                                                   ScaleRate5__c, ScaleRate4__c, ScaleRate3__c, ScaleRate2__c, ScaleRate1__c,ScaleRate10__c, 
                                                                   Scale_Quantity_Scale_Value9__c, Scale_Quantity_Scale_Value8__c, Scale_Quantity_Scale_Value7__c, 
                                                                   Scale_Quantity_Scale_Value6__c, Scale_Quantity_Scale_Value5__c, Scale_Quantity_Scale_Value4__c,
                                                                   Scale_Quantity_Scale_Value3__c, Scale_Quantity_Scale_Value2__c, Scale_Quantity_Scale_Value1__c, 
                                                                   Scale_Quantity_Scale_Value10__c, Sales_Org__c, Sales_Org_Code__c, Sales_Office__c,Sales_Office_Code__c, 
                                                                   SAP_Cluster__c,SAP_Client_Id__c, SAP_Application_Id__c, Rate__c, Quantity__c,Plus_Minus__c,
                                                                   Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,Check_Scale_Code__c,
                                                                   Condition_Class__c,Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type_Code__c, 
                                                                   Profit_Center__c, Profit_Center_Code__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
                                                                   Product_Hierarchy__c, Pricing_Request__c, Pricing_Request__r.Spot_Type__c, Pricing_Request__r.Pricing_Request_Type__c, 
                                                                   Pricing_Request_Type__c, Pricing_Condition__c,Pricing_Condition_Code__c, Price_List_Type__c, 
                                                                   Price_List_Type_Code__c, Per__c, PH9__c, PH9_Code__c, PH8__c, PH8_Code__c, PH7__c,PH7_Code__c, 
                                                                   PH6__c, PH6_Code__c, PH5__c, PH5_Code__c, PH4__c, PH4_Code__c, PH3__c, PH3_Code__c, PH2__c, 
                                                                   PH2_Code__c, PH1__c, PH1_Code__c,PCKC__c, Non_Commercial_Products__c, New__c, New_Valid_To__c, 
                                                                   New_Valid_From__c, New_UoM__c, New_Unit__c, New_Rate__c,Pricing_Task_UoM__c, New_Per__c, Name,
                                                                   Material__c, Material_Price_Group__c, Material_Price_Group_Code__c, Material_Code__c, LastModifiedDate, 
                                                                   LastModifiedById, LastActivityDate,Key_Combination__c, Key_Combination_Code__c, IsDeleted, Incoterms_Code__c, 
                                                                   Incoterms2__c, Inco_terms__c, Id, Gap__c,Gap_Pricing_Request_Item__c, Expire__c, End_User__c, 
                                                                   End_User_Code__c, End_Use__c, End_Use_Code__c, Edit__c, ERP_Sales_Prices_SAP__c,Division__c, Division_Code__c, 
                                                                   Dist_Channel__c, Dist_Channel_Code__c,Customer_Specific__c, Customer_Price_Group__c,Customer_Price_Group_Code__c, 
                                                                   Currency__c, CreatedDate, CreatedById,Below_Reference_Flag__c, Below_Floor_Flag__c,Below_Current_Flag__c, 
                                                                   Approver5__c, Approver5_Date__c, Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c,
                                                                   Approver2_Date__c,Scale_Type__c, Approver1__c, Approver1_Date__c, Approved_Date__c, Approval_Status__c,
                                                                   Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,
                                                                   Gap_Pricing_Request_Item__r.New_Rate__c,Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,
                                                                   Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,
                                                                   Gap_Pricing_Request_Item__r.Rate__c,Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,
                                                                   Gap_Pricing_Request_Item__r.UoM__c,USD_Rate__c,Base_UoM__c,Pricing_Request__r.Sales_Org_Code__c, 
                                                                   Pricing_Request__r.Dist_Channel_Code__c, Pricing_Request__r.Division_Code__c,Materials_Below_Net_Current__c,
                                                                   Materials_Below_Net_Floor__c,Materials_Below_Net_Reference__c,Materials_with_Error_Response__c,
                                                                   Net_Price_Calculated_Materials__c,
                                                                   Total_Materials__c ,Integration_Error_Message__c,Net_Price_Status__c,Number_of_Material_with_Gross_Price__c,
                                                                   Pricing_Request__r.Request_Type__c,Pricing_Request__r.Current_Approver__c,Pricing_Request__r.Display_Standardized_Rate__c,
                                                                   Pricing_Request__r.Pricing_exception__c,Pricing_Request__r.Landing_Cost__c,Pricing_Request__r.Standardized_Currency__c,
                                                                   Pricing_Request__r.Standardized_UoM__c,New_Volume__c, New_Volume_UoM__c,
                                                                   Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c
                                                                   FROM Pricing_Request_Item__c 
                                                           WHERE Pricing_Request__c =:pricingRequest.Id];*/


        List<Pricing_Request_Item__c>   requestItemList = (List<Pricing_Request_Item__c>)PAQueryUtil.query('PARequest', 'requestItemList', ' Pricing_Request__c = \''+pricingRequest.Id+'\'');

        //system.debug('****THe price request*** '+ requestItemList.size()+requestItemList);
        for(Pricing_Request_Item__c pItem : requestItemList)
        {
          Pricing_Request_Item__c priceItem = new Pricing_Request_Item__c();
          priceItem = pItem.clone(false,true);
          priceItem.Pricing_Request__c = priceReqClone.id;
          requestItemCloneList.add(priceItem);
        }
        //<BB20140404>
        //<MS20140903>Added conditions for pricing tasks
        //system.debug('****inside CloneRequest*** new reqItems'+ requestItemCloneList.size()+requestItemCloneList);
        if(requestItemCloneList.size()>0 && (desiredAction.containsIgnoreCase('save')||desiredAction.containsIgnoreCase('next')))
        {
          //system.debug('****inside CloneRequest new reqItems'+ requestItemCloneList.size()+requestItemCloneList);
          this.salesPriceSAP=new PASalesPriceSAP(requestServiceState);
          requestItemCloneList=salesPriceSAP.cloneValidation(requestItemCloneList,priceReqClone); 
          insert requestItemCloneList;
        }

      }           
      if(desiredAction.containsIgnoreCase('save') || desiredAction.containsIgnoreCase('next') )
        pricingRequest.Id=priceReqClone.id; //to display the new request details on the page.
      //calling getListWrappers -neeha VER 5.34 -start
      // relatedWrappersList=getListWrappers();
      //end-ver .5.34
      return newPageLabel;

    }
    //<TJ20140505> Set Newpagelabel to PAHome for Landing Page Link

    else if(desiredAction.containsIgnoreCase('landingpage'))
    {
      return newpagelabel;

    }

    else if(desiredAction.containsIgnoreCase('NewPricingRequestsave'))
    {  

      if(requestservicestate.ogitems.isEndUserRebate){
        pricingRequest.is_End_User_Rebate__c = true;
      }
      retErrorMessage = validate(desiredAction);
      if(!string.isBlank(retErrorMessage))
        //throw exception 
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {   
        pricingRequest.Pricing_Request_Type__c = 'Permanent';
        if(requestservicestate.ogitems.isEndUserRebate)
          pricingRequest.is_End_User_Rebate__c = true;
        //Version 4.24:Production Issue, request status changing to Draft from Submitted/Recalled/Rejected
        if(pricingRequest.Request_Approval_Status__c ==  NULL)
          pricingRequest.Request_Approval_Status__c = 'Draft';
        pricingRequest.Spot_Type__c = null;
        //system.debug('%%%%% NewPricingRequestsave in Massive '+requestServiceState.ogItems.selectedUser);
        //system.debug('***@@@@ default currency:'+requestServiceState.ogItems.orgGroupItems.Default_Currency__c);
        //For Massive
        if(desiredAction.contains('Massive Change')||desiredAction.contains('MassiveChange'))
        {
          pricingRequest.Request_Type__c='Massive';
          if(!String.isBlank(requestServiceState.ogItems.selectedUser)){
            pricingRequest.On_Behalf_Of__c = ID.valueOf(requestServiceState.ogItems.selectedUser);
            pricingRequest.OwnerId = ID.valueOf(requestServiceState.ogItems.selectedUser);
          }
          commonPricingRequestInsert(desiredAction);
          save();
          //<TJ20140923>
          keycombination.pckcOptionsList = keycombination.getlistpckc();
          if(pricingReqItemList != null && pricingReqItemList.size() > 0)
          {
            for(Pricing_Request_Item__c pri : pricingReqItemList)
            {
              //system.debug('PRItem Sales org code:'+ pri.Sales_Org_Code__c);
              pri.Pricing_Request__c = pricingRequest.Id;
              pri.Pricing_Request_Type__c = pricingRequest.Pricing_Request_Type__c;
              pri.Approval_Status__c = pricingRequest.Request_Approval_Status__c;
            }
            insert pricingReqItemList;
          }
          pricingReqItemList = new List<Pricing_Request_Item__c>();
          //<PP20140502> END
          return newPagelabel;
        }
        else if(desiredAction.contains('NonCustomerSpecific') || desiredAction.contains('Non Customer Specific'))
        {
            System.debug('=======requestservicestate.currentRequest.pricingCondition.pricingCondition'+requestservicestate.currentRequest.pricingCondition.pricingCondition);
          //MS20150408
          if(requestservicestate.currentRequest.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
              && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Floor')
              && !requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Floor'))
            pricingRequest.Pricing_Request_Type__c = 'Floor';

          else if(requestservicestate.currentRequest.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
              && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Reference')
              && !requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Reference'))
            pricingRequest.Pricing_Request_Type__c = 'Reference';

          else if(requestservicestate.currentRequest.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
              && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Reference'))
            pricingRequest.Pricing_Request_Type__c = 'Net Reference';

          else if(requestservicestate.currentRequest.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition != null && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
              && requestservicestate.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Floor'))
            pricingRequest.Pricing_Request_Type__c = 'Net Floor';  

          pricingRequest.Request_Type__c='Non Customer Specific';
          commonPricingRequestInsert(desiredAction);
          save();
          System.debug('pricingReqItemList:'+pricingReqItemList);
          //<TJ20140923>
          //keycombination.pckcOptionsList = keycombination.getlistpckc();
          if(pricingReqItemList != null && pricingReqItemList.size() > 0)
          {
            for(Pricing_Request_Item__c pri : pricingReqItemList)
            {
              //system.debug('PRItem Sales org code:'+ pri.Sales_Org_Code__c);
              pri.Pricing_Request__c = pricingRequest.Id;
              pri.Pricing_Request_Type__c = pricingRequest.Pricing_Request_Type__c;
              pri.Approval_Status__c = pricingRequest.Request_Approval_Status__c;
            }
            insert pricingReqItemList;
          }
          pricingReqItemList = new List<Pricing_Request_Item__c>();
          //<PP20140502> END
          return newPagelabel;
        }
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Calling Save method for Floor and Reference
        else if(desiredAction.contains('Floor Pricing'))
        {
          pricingRequest.Request_Type__c='Non Customer Specific';
          pricingRequest.Pricing_Request_Type__c = 'Floor';
          commonPricingRequestInsert(desiredAction);
          save();
          return newPagelabel;
        }
        else if(desiredAction.contains('Reference Pricing'))
        {
          pricingRequest.Request_Type__c='Non Customer Specific';
          pricingRequest.Pricing_Request_Type__c = 'Reference';
          commonPricingRequestInsert(desiredAction);
          save();
          return newPagelabel;
        }

        else 
        {
          pricingRequest.Request_Type__c='Customer Specific';
          if(customer.ogitems.selectedUser==null)
            customer.ogitems.selectedUser = Userinfo.getUserId();
          //system.debug('*** Id expected'+customer.ogitems.selectedUser);
          //pricingRequest.OwnerId = (Id)customer.ogitems.selectedUser;
          //<TJ20141029> Added Fix for issue #70
          //-modified bala 14 Feb
          if(string.isblank(customer.ogitems.username))
            pricingRequest.On_Behalf_Of__c = customer.ogitems.selectedUser;
          else
          {
            User u;
            //u=[Select name from user where name like :customer.ogItems.username limit 1];
            u=[Select id,name from user where Id =: customer.ogitems.selectedUser limit 1];//IS TI-00094572 updated code to fix wrong notification contact
            pricingRequest.On_Behalf_Of__c = u.id;
            //system.debug(u+' '+pricingRequest.On_Behalf_Of__r.name); 
          }
          pricingRequest.OwnerId = pricingRequest.On_Behalf_Of__c;
          //<TJ20141029> End
          commonPricingRequestInsert(desiredAction);
          string PE='';
          //Brundha Roll out 2 <BR20130625>
          if(pricingExceptionList != null && pricingExceptionList.size()>0){

            for(integer i=0;i<pricingExceptionList.size();i++){     
              //system.debug('pricingExceptionList[i]!!!'+pricingExceptionList[i]);                     
              if(i<pricingExceptionList.size()-1){
                PE+=pricingExceptionList[i]+'<BR>';
              }
              else
              {PE+=pricingExceptionList[i];}
            }
            //system.debug('pricingExceptionList[i]!!!'+PE);
          }
          pricingRequest.Pricing_Exception__c=PE;
          save();
          //<PP20140502> START
          if(pricingReqItemList != null && pricingReqItemList.size() > 0)
          {
            for(Pricing_Request_Item__c pri : pricingReqItemList)
            {
              //system.debug('PRItem Sales org code:'+ pri.Sales_Org_Code__c);
              pri.Pricing_Request__c = pricingRequest.Id;
              pri.Pricing_Request_Type__c = pricingRequest.Pricing_Request_Type__c;
              pri.Approval_Status__c = pricingRequest.Request_Approval_Status__c;
            }
            insert pricingReqItemList;
            //deleting customer list from view state once PR# is inserted
            pautil.deleteViewState(requestServiceState.currentRequest);
          }
          pricingReqItemList = new List<Pricing_Request_Item__c>();
          //<PP20140502> END
          return newPagelabel;
        }   

      }
    }
    //<PP20140502> START
    else if(desiredAction.containsIgnoreCase('ReqCreated') && !desiredAction.containsIgnoreCase('ViewCustomerPrices'))
    {
      //system.debug('******priId'+pricingRequest.Id);
      if(pricingReqItemList != null && pricingReqItemList.size() > 0)
      {
        for(Pricing_Request_Item__c pri : pricingReqItemList)
        {
          pri.Pricing_Request__c = pricingRequest.Id;
          pri.Pricing_Request_Type__c = pricingRequest.Pricing_Request_Type__c;
          pri.Approval_Status__c = pricingRequest.Request_Approval_Status__c;
        }
        insert pricingReqItemList;
      }
      pricingReqItemList = new List<Pricing_Request_Item__c>();
      return newPagelabel;
    }
    //<PP20140502> END



    /*This method is used to insert/update Pricing Task and navigate respectively*/
    //<PP20140218> - Added condition not to throw validations on click of 'View Customer Prices'
    else if(desiredAction.containsIgnoreCase('Next') && !desiredAction.containsIgnoreCase('ViewCustomerPrices'))
    {

      //system.debug('$$$$$ current'+currentPageLabel+' NewPage'+newPagelabel);
      retErrorMessage = validate(desiredAction); 
      if(!string.isBlank(retErrorMessage))
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      else
      {
        //if spot type is Free of Charge,no need to do these
        //<VR20131111> DTT Rollout Issue - Changing the if condition to include only spot
        if(pricingRequest.Spot_Type__c == 'Spot Price')
        {
            System.debug('=============Incoterm__c'+pricingRequest.Incoterm__c);
            System.debug('============Terms_Of_Payment__c='+pricingRequest.Terms_Of_Payment__c);
            
          if(pricingRequest.Incoterm__c=='Other' || pricingRequest.Terms_Of_Payment__c=='Other')
          {
            pricingRequest.Description__c = 'Non-standard Payment Term : '+pricingRequest.Non_Standard_Terms_Of_Payment__c+'<br>'+
                'Non-standard Incoterm : '+pricingRequest.Non_Standard_Incoterm__c+'<br>'+  'Credit Review Required'+'<br>'+ 'Pricing Task Type : '+pricingRequest.Spot_Type__c+'<br>'+
                'CSR Instruction : '+pricingRequest.CSR_Instruction__c;
          }
          else
          {
            pricingRequest.Description__c = 'Payment Term : '+pricingRequest.Terms_Of_Payment__c+'<br>'+
                'Incoterm : '+pricingRequest.Incoterm__c+'<br>'+ 'Pricing Task Type : '+pricingRequest.Spot_Type__c+'<br>'+'CSR Instruction : '+pricingRequest.CSR_Instruction__c;
          }

          //Ver 4.16  Starts
          if(pricingRequest.Terms_Of_Payment__c.contains('-')){
            string [] splitStrings = pricingRequest.Terms_Of_Payment__c.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            pricingRequest.Terms_Of_Payment_Code__c = splitStrings[0];
            pricingRequest.Terms_Of_Payment__c = splitStrings[1];
            pricingRequest.Non_Standard_Terms_Of_Payment__c = NULL;  
          }

          if(pricingRequest.Incoterm__c.contains('-')){
            string [] splitStrings = pricingRequest.Incoterm__c.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            pricingRequest.Incoterms_Code__c = splitStrings[0];
            pricingRequest.Incoterm__c = splitStrings[1];
            pricingRequest.Non_Standard_Incoterm__c = NULL;
          } 
          //Ver 4.16  Ends              
        }
        //<VR20131111> DTT Rollout Issue - Changing the if condition to include both free of change and rebate agreement
        else //if(pricingRequest.Spot_Type__c == 'Free of Charge')
        {
          pricingRequest.Description__c = 'Pricing Task Type : '+pricingRequest.Spot_Type__c+'<br>'+'CSR Instruction : '+pricingRequest.CSR_Instruction__c;
        }

        pricingRequest.Request_Type__c='Customer Specific';
        pricingRequest.Pricing_Request_Type__c = 'Pricing Task';
        //system.debug('request satus'+pricingRequest.Request_Approval_Status__c+pricingRequest.On_Behalf_Of__c);
        //Version 4.24:Production Issue, request status changing to Draft from Submitted/Recalled/Rejected
        if(pricingRequest.Request_Approval_Status__c ==  NULL)
          pricingRequest.Request_Approval_Status__c = 'Draft';

        if(userSelected <> NULL){
          pricingRequest.Assigned_To__c = (Id)userSelected;
        }
        //Added by Ibtesam
        if(customer.ogitems.isEndUserRebate)
          pricingRequest.Is_End_User_Rebate__c = true;
        //system.debug('*** Assigned_To'+pricingRequest.Assigned_To__c);

        //pricingRequest.Assigned_To__c = assignedToUser.Id;

        //system.debug('$$$$$ on behalf of'+customer.ogitems.selectedUser);
        if(pricingRequest.On_Behalf_Of__c == null){
          if(customer.ogitems.selectedUser==null)
            customer.ogitems.selectedUser = Userinfo.getUserId();
          //system.debug('*** Id expected'+customer.ogitems.selectedUser);
          pricingRequest.OwnerId = (Id)customer.ogitems.selectedUser;
          //-added March 2


          pricingRequest.On_Behalf_Of__c = customer.ogitems.selectedUser; 
        }
        commonPricingRequestInsert(desiredAction);
        save();
        //Deleting view state once request is inserted
        pautil.deleteViewState(requestServiceState.currentRequest);
        //<TJ20140903>
        if(pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
        {
          keyCombination.pcKCOptionsList = keycombination.getListPcKc();
        }

      }

      return newPagelabel;
    }


    /*This method is used to fetch ERP Sales Prices - SAP records based on the matching criteria
        The logic for fetching records would be present in SalesPriceSAP component's method
     */
    else if(desiredAction.equalsIgnoreCase('FetchRecords') || desiredAction.equalsIgnoreCase('FetchRecordswithOffset')|| desiredAction.equalsIgnoreCase('FetchRecordswithOffsetback')) 
    {
      system.debug('@#$@#$'+desiredAction);
      viewCustomerPrices=null;
      //<GT20141028> Modified the or condition to AND to avoid the null pointer exception
      if(keycombination.pckcconcat!=null && keycombination.pckcconcat!='--Select--')
      {
        //<MS20141028> Adding code to account for XFLR1, XREF1
        //<TJ20141117> Updated Code to handle PC KC Splitting
        List<String> pckc=keycombination.pckcconcat.split(':');
        String pc;
        system.debug('keycombination.pckcconcat:'+keycombination.pckcconcat);
        pc=keycombination.pckcconcat.split('-')[0].trim();
        //<AV20150103>-Start-Production issue-Massive change section error
        String kc=pckc[1].split('-')[0].trim();
        system.debug(pc+' '+kc);
        List<Organizational_Group_Item__c> ogi=[select id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,
                                                ERP_Pricing_Procedure__r.SAP_Client_Id__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c
                                                from Organizational_Group_Item__c where Business__c=:requestServiceState.ogItems.selectedBU
                                                AND OrgGroup__r.ERP_Sales_Org_Code__c = :pricingRequest.Sales_Org_Code__c
                                                AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :pricingRequest.Dist_Channel_Code__c
                                                AND OrgGroup__r.ERP_Division_Code__c = :pricingRequest.Division_Code__c limit 1];
        system.debug(pc+' '+ogi[0].ERP_Pricing_Procedure__c+' '+ogi[0].ERP_Pricing_Procedure__r.SAP_Cluster__c+' '+ogi[0].ERP_Pricing_Procedure__r.SAP_Application_Id__c+' '+ogi[0].ERP_Pricing_Procedure__r.SAP_Client_Id__c);
        List<ERP_Pricing_Condition__c> priCon=[SELECT id FROM ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c=:pc AND SAP_Cluster__c=:ogi[0].ERP_Pricing_Procedure__r.SAP_Cluster__c
            AND SAP_Application_Id__c=:ogi[0].ERP_Pricing_Procedure__r.SAP_Application_Id__c AND SAP_Client_Id__c=:ogi[0].ERP_Pricing_Procedure__r.SAP_Client_Id__c limit 1];
        //<PR201451029> START
        if(priCon != null && priCon.size()>0){
          pricingcondition.selectedPricingCondition=pricon[0].id;
          system.debug(' pricingcondition.selectedPricingCondition'+ pricingcondition.selectedPricingCondition);                    
          System.debug('kc:'+kc+'->PP:'+ogi[0].ERP_Pricing_Procedure__c);
          List<ERP_Access_Sequence__c> acsq=[Select Pricing_Key_Combination__r.ID from ERP_Access_Sequence__c where Pricing_Condition__r.ID=:pricingcondition.selectedPricingCondition AND Sales_Pricing_Procedure__c=:ogi[0].ERP_Pricing_Procedure__c AND Pricing_Key_Combination__r.Key_Combination_Code__c=:kc];                    
          Keycombination.keyCombinationID=acsq[0].Pricing_Key_Combination__r.ID;
        } //<PR201451029> END
      }
      system.debug('***In fetch rocerds request');
      retErrorMessage = salesPriceSAP.action(newPagelabel, currentPageLabel, desiredAction);
      if(retErrorMessage.contains('<html>'))
      {

      } 
      else
      {
        return newPagelabel;
      }
    }
    //brundha Roll Out2 starts <BR20130719>
    //<PP20140218> - Changed equalsIgnoreCase to containsIgnoreCase
    else if(desiredAction.containsIgnoreCase('ViewCustomerPrices')) 
    {   viewCustomerPrices='ViewCustomerPrices';
    //<MS20141009>
    if(!String.isBlank(requestServiceState.ogItems.selectedBU))
    {
      toggleSection();
    }
    //<PP20140424> START
    if(pricingRequest != null && salesPriceSAP != null)
    {
      ValidOnDateViewCustomerprices=pricingRequest.Due_Date__c;

      //system.debug('***In fetch rocerds request');
      retErrorMessage = salesPriceSAP.action(newPagelabel, currentPageLabel, desiredAction);
    }
    //<PP20140424> END
    //salesPriceSAP.relatedWrappersList=new List<PARelatedList>();
    //relatedWrappersList = salesPriceSAP.relatedWrappersList;
    //system.debug('***relatedWrappersList'+relatedWrappersList);
    //system.debug('***retErrorMessage'+retErrorMessage);       
    return newPagelabel;            
    }
    //brundha Roll Out2 ends <BR20130719>
    //This method navigates to PricingRequestPANewPoc page on click of "Done" Button
    else if(desiredAction.containsIgnoreCase('done')){

      return newPagelabel;        
    }
    //This method navigates to PAEditReqItem page on click of "New Price" Button
    else if(desiredAction.containsIgnoreCase('NewPricingReqItem')){
      //system.debug('***new price button');
      return newPagelabel;

    }

    //This method re-directs to Customer Requests Page on click of 'Cancel' in New Request Page, aborting creation/updation of Pricing Request
    if(desiredAction.containsIgnoreCase('cancel'))
    { 
      //system.debug('***in cancel pricingRequest.Request_Type__c'+pricingRequest.Request_Type__c);

      //system.debug('!!!!csvString'+csvString);
      if(desiredAction.equalsIgnoreCase('statusCancel')||desiredAction.equalsIgnoreCase('DraftCancel')||desiredAction.equalsIgnoreCase('PendingCancel')||desiredAction.equalsIgnoreCase('ApprovedCancel')||desiredAction.equalsIgnoreCase('SubmittedCancel')||desiredAction.equalsIgnoreCase('RecalledCancel')||desiredAction.equalsIgnoreCase('RejectedCancel')){
        // newPagelabel='priceApproval';

        //system.debug('***DraftCancel'+newPagelabel);
        requestServiceState.ogItems.value=null;   
        //to delete view state data
        pautil.deleteViewState(requestServiceState.currentRequest);
        requestServiceState.currentRequest = null; 
        csvString='status'; 
        //system.debug('***DraftCancelvalue'+requestServiceState.ogItems.value);
        //system.debug('***DraftCancelcsvstring'+csvstring);
        //newPageLabel='PAHome';
        return newPagelabel;      
      }

      else if(csvstring=='Draft' ||csvstring=='Pending'|| csvString=='Submitted' || csvString=='Approved' || csvString=='Rejected' || csvString=='Recalled'){

        //   if(requestServiceState.ogItems.value=='CustRequestReasons'){
        //system.debug('***Cancel'+requestServiceState.ogItems.value);
        //system.debug('***Cancel'+csvstring);                  
        //newPageLabel='PAStatus';
        return newPageLabel;
        //   }

      }
      //<TJ20140923>
      else if(!desiredAction.containsIgnoreCase('EditHeader') && (pricingRequest.Request_Type__c =='Massive' || desiredAction.containsIgnoreCase('Massive')))
      {
        requestServiceState.ogItems.value='Massive';  
        salesPriceSAP.pcKCSelected = '';
        action('PACurrentPrices','PACurrentPrices','Massive');
        return newPageLabel;
      }
      else if(!desiredAction.containsIgnoreCase('EditHeader') && (pricingRequest.Request_Type__c =='Non Customer Specific' || desiredAction.containsIgnoreCase('Non Customer Specific')))
      {
        requestServiceState.ogItems.value='NonCustomerSpecific';
        salesPriceSAP.pcKCSelected = '';
        action('PACurrentPrices','PACurrentPrices','NonCustomerSpecific');
        return newPageLabel;
      }
      //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for Floor and Reference for Edit Header Action
      else if(!desiredAction.containsIgnoreCase('EditHeader') && (pricingRequest.Pricing_Request_Type__c!=null && (pricingRequest.Pricing_Request_Type__c.contains('Floor') || desiredAction.containsIgnoreCase('Floor Pricing') || pricingRequest.Pricing_Request_Type__c.contains('Reference') || desiredAction.containsIgnoreCase('Reference Pricing'))))
      {
        requestServiceState.ogItems.value='NonCustomerSpecific';
        //to delete view state data
        pautil.deleteViewState(requestServiceState.currentRequest);
        requestServiceState.currentRequest = null;
        return newPageLabel;
      }
      else if(desiredAction.containsIgnoreCase('EditHeader'))
      {
        return newPageLabel;
      }

      //<AV20140408> START
      if(desiredAction.containsIgnoreCase('EditCancel') || desiredAction.containsIgnoreCase('CloneCancel'))
      {
        //system.debug('@@@### inside cancel');
        relatedWrappersList = getListWrappers();
        //system.debug('***@@@@ wrapper size'+relatedWrappersList.size());
        return newPageLabel;
      }
      //<AV20140408> END  

      //added on jan 7th
      // pricingRequest = new Pricing_Request__c();//commented by bala
      //Added by George
      //<MS20141017>
      if(desiredAction.containsIgnoreCase('PriceNewPricingRequestCancel')||desiredAction.containsIgnoreCase('ProjectNewPricingRequestCancel'))
      {
        salesPriceSAP.pcKCConcatList = new List<SelectOption>();
        salesPriceSAP.pcKCSelected = '';
        action('PACurrentPrices','PACurrentPrices',desiredAction+'ViewCustomerPrices');
        return newPageLabel;
      }
      if(desiredAction.containsIgnoreCase('RPQEndUserSelectedCancel')){
        newPageLabel = 'PASelectEndUser';
        return newPageLabel;
      }
      //to delete view state data
      pautil.deleteViewState(requestServiceState.currentRequest);
      requestServiceState.currentRequest = null;
      //newPagelabel =  'CustomerRequestPANewPOC';
      return newPageLabel;
    }
    //<MS20150205>
    //<SS20230110> start
    else if (desiredAction.equals('retCusList'))
    {
      requestServiceState.erpCustomer.action('PAPricingRequest','PACurrentPrices','ReqCreatedcurrentPricesCustomer PriceNewPricingRequest');
    }
    //<SS20230110> end
    else if (desiredAction.equalsIgnoreCase('ExportPrices'))
    {
      //added on jan 7th
      if(pricingRequest==null) {
        pricingRequest = new Pricing_Request__c();
      }
      pricingRequest.Request_Type__c='Import';
      return newPagelabel;
    }

    else if(desiredAction.containsIgnoreCase('done')){
      //system.debug('***in done action');
      return newPagelabel;        
    }




    else if(desiredAction.equalsIgnoreCase('AddRequestItems'))
    {
      //system.debug('*** csvString in AddRequestItems');
      newPagelabel = salesPriceSAP.action(newPagelabel,currentPageLabel,desiredAction);
      if(pricingRequest!=null && pricingRequest.Id != null && pricingRequest.Request_Type__c=='Non Customer Specific')
      {
        List<Pricing_Request_Item__c> priList = [SELECT Id,Pricing_Condition_Code__c,Key_Combination_Code__c,SAP_Cluster__c,SAP_Application_Id__c,SAP_Client_Id__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c =:pricingRequest.Id limit 1];
        if(priList != null && priList.size() != 0)
        {
          dispNCS= 'dispNCS';
          keyCombination.getKCFromCodeAndSAPCluster(priList[0].Key_Combination_Code__c,priList[0].SAP_Cluster__c,priList[0].SAP_Application_Id__c,priList[0].SAP_Client_Id__c);
          keyCombination.getPCKCFromCodeAndSAPCluster(priList[0].Pricing_Condition_Code__c,priList[0].Key_Combination_Code__c,priList[0].SAP_Cluster__c,priList[0].SAP_Application_Id__c,priList[0].SAP_Client_Id__c);
        }

      }             
      //system.debug('*** csvString in AddRequestItems'+csvString);
      return newPagelabel;    
    }    

    else if(desiredAction.containsIgnoreCase('KCChange'))
    {
      //removing reference of the fetched list try -neeha
      salesPriceSAP.relatedWrappersList=new List<PARelatedList>();

    }
    //Ver3.4
    //<PP20140218>
    if(desiredAction.equalsIgnoreCase('customerPrices') || desiredAction.equalsIgnoreCase('NCSMassiveHome')
        || desiredAction.containsIgnoreCase('ViewAllCustomerPrices'))
    {

      if(desiredAction.equalsIgnoreCase('NCSMassiveHome'))
      {
        requestServiceState.ogItems.value = null;
      }
      //Added the code to remove the salesprice records from view state
      if(requestServiceState.currentRequest.salesPriceSAP!=null)
        requestServiceState.currentRequest.salesPriceSAP.relatedWrappersList.clear();
      //to delete view state data
      pautil.deleteViewState(requestServiceState.currentRequest);
      requestServiceState.currentRequest = null;

    }
    //<PP20130715> START -neeha landing cost NE20130409

    if(desiredAction.containsIgnoreCase('NewPricingRequest') && !(desiredAction.contains('save')) && !(desiredAction.containsIgnoreCase('cancel')) && !(desiredAction.contains('Next')))
    {
      requestServiceState.ogItems.ogItemFromRequest(pricingRequest); 
      //<TJ20150304> Issue with '%' being defaulted in currency
      if(pricingReqItemList.size()==0 && (desiredAction.containsIgnoreCase('Massive') || desiredAction.containsIgnoreCase('NonCustomerSpecific')))
      {
        pricingCondition=new PAPricingCondition(requestServiceState);
      }
      //system.debug('***after landing cost check');
    }
    //<PP20130715> END  end -neeha landing cost NE20130409
    //<PP20140502> START
    if(desiredAction.equalsIgnoreCase('AddSelectedPrices'))
    {
      newPagelabel = salesPriceSAP.action(newPagelabel,currentPageLabel,desiredAction);
      //<TJ20140523> Added new boolean to save datatable state
      checkSubmitted=true;
    }
    //<PP20140502> END
    //system.debug('desiredAction:-'+desiredAction+'->'+desiredAction.equalsIgnoreCase('FetchRecords'));
    system.debug(' at the end of action method in PARequest ');
    if(requestServiceState.ogitems.isEndUserRebate && requestServiceState.ogItems.rebatesExists && fromendusersel)
      newPagelabel = 'PACustomerRequests';
    else if(requestServiceState.ogitems.isEndUserRebate && !requestServiceState.ogItems.rebatesExists && fromendusersel)
      newPageLabel = 'PANewRequest';
    return newPagelabel;
  } //Page Level Actions changing the return type

  private void commonPricingRequestInsert(string desiredAction)
  {
    System.debug('customer.ogitems.selectedBU:'+customer.ogitems.selectedBU);
    string bu = [select Business__c FROM OrgGroup__c WHERE id=:customer.ogitems.selectedBU].Business__c;
    pricingRequest.BU__c = bu;

    //if customer specific related 
    if(desiredAction.contains('Massive') || desiredAction.contains('Non'))
    {
      pricingRequest.Sales_Org_Code__c = pricingRequest.Sales_Org_Code__c;
      pricingRequest.Sales_Org__c = pricingRequest.Sales_Org__c;
      pricingRequest.Dist_Channel__c = pricingRequest.Dist_Channel__c;
      pricingRequest.Dist_Channel_Code__c = pricingRequest.Dist_Channel_Code__c;
      pricingRequest.Division__c = pricingRequest.Division__c;
      pricingRequest.Division_Code__c = pricingRequest.Division_Code__c;
      //pricingRequest.Customer_Specific__c = false;
      if(desiredAction.contains('Massive'))
      {
        pricingRequest.Customer_Specific__c = true;
      }
      else
        pricingRequest.Customer_Specific__c = false;
    }
    else 
    {
      //system.debug('$$$$ paERPCustomer..'+customer.paERPCustomer);
      //system.debug('$$$$ Dist..'+customer.paERPCustomer.Distribution_Channel__c);
      pricingRequest.Customer_Specific__c = true;
      if(pricingRequest.Pricing_Request_Type__c <> 'Pricing Task'){
      }
    }
    requestServiceState.ogItems.ogItemFromRequest(pricingRequest); 
    //<PP20130422> -- Ver 4.18
    pricingRequest.Display_Standardized_Rate__c = requestServiceState.ogItems.orgGroupItems.Display_Standardized_Rate__c;
    //<MS20140424> Populating Approval_Escalation_Pricing_Task__c and Approval_Escalation_Duration__c
    //system.debug('*****requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Pricing_Task__c'+requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Pricing_Task__c);
    if(requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Pricing_Task__c != null )
      pricingRequest.Approval_Escalation_Pricing_Task__c = requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Pricing_Task__c;
    if(requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Price_Requests__c != null )
      pricingRequest.Approval_Escalation_Price_Requests__c = requestServiceState.ogItems.orgGroupItems.Approval_Escalation_Price_Requests__c;
    //<BB20130626> -- Ver 4.24  -- Populating Standardized_Currency__c,Standardized_UoM__c in pricing request from org group item.
    pricingRequest.Standardized_Currency__c = requestServiceState.ogItems.orgGroupItems.Standardized_Currency__c;
    pricingRequest.Standardized_UoM__c = requestServiceState.ogItems.orgGroupItems.Standardized_UoM__c;
    //<BR20130422> -- Ver 4.19 -- added Attachments_on_Customer_Prices__c
    pricingRequest.Attachments_on_Customer_Prices__c = requestServiceState.ogItems.orgGroupItems.Attachments_on_Customer_Prices__c;

    //<BB20140429>  Populating Currency__c in pricing request from org group item or ERP Customer.
    List<String> currencyList;
    //<BB20140523> Added Customer query to fetch the sold to customer and populating Customer_Order_Block_Code__c,Customer_Order_Block__c 
    /*List<ERP_Customer__c> cusList= [SELECT Id,currency_code__c,customer_code__c,Distribution_Channel_Code__c,Distribution_channel__c,
                                        Division__c,Division_code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c FROM ERP_Customer__c WHERE Customer_code__c=:pricingRequest.SoldTo_Code__c
                                        AND sales_org_code__c=:pricingRequest.Sales_Org_Code__c
                                        AND Distribution_Channel_Code__c=:pricingRequest.Dist_channel_code__c
                                    AND Division_code__c=:pricingRequest.Division_code__c limit 1];*/
    List<ERP_Customer__c> cusList= (List<ERP_Customer__c>)PAQueryUtil.query('PARequest', 'cusList', ' Customer_code__c=\''+pricingRequest.SoldTo_Code__c+'\' AND sales_org_code__c=\''+pricingRequest.Sales_Org_Code__c+'\' AND Distribution_Channel_Code__c=\''+pricingRequest.Dist_channel_code__c+'\' AND Division_code__c=\''+pricingRequest.Division_code__c+'\' limit 1');                                

    if(cusList != null && cusList.size() > 0)
    {
      pricingRequest.Customer_Order_Block_Code__c=cusList[0].Customer_Order_Block_Code__c;
      pricingRequest.Customer_Order_Block__c=cusList[0].Customer_Order_Block__c; 
    }



    if(requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c!= null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c != null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Sales Area Config Currency')
    {
      selectedDefaultCurrency = requestServiceState.ogItems.orgGroupItems.Default_SalesArea_Currency__c;
      //system.debug('*****Default_Currency__c'+selectedDefaultCurrency);
    }
    else if(requestServiceState.ogItems.orgGroupItems.ERP_Currency__c !=null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c != null && requestServiceState.ogItems.orgGroupItems.Default_Currency__c == 'Customer Currency' && pricingRequest.Request_Type__c == 'Customer Specific' && pricingRequest.Pricing_Request_Type__c == 'Permanent')
    {
      system.debug('*****pricingRequest.SoldTo_Code__c'+pricingRequest.SoldTo_Code__c+'pricingRequest.Sales_Org_Code__c '+pricingRequest.Sales_Org_Code__c+'pricingRequest.Dist_channel_code__c'+pricingRequest.Dist_channel_code__c);


      //system.debug('*****paServiceState.erpCustomer'+cusList.size()+cusList);
      selectedDefaultCurrency=cusList[0].Currency_Code__c;
      //system.debug('*****Default_Currency__c'+selectedDefaultCurrency);
    }
  }

  /*
   * Author     : Vinoth
   * Method Name : expDataGen
   * Parameters  : None
   * Return type : pageReference
   * Description : Used to convert the list into comma separated string to export into csv file
   */    
  public string expDataGen(string recordString,string objectAPIName,List<Sobject> expList,string rejectLog) {

    Map<string,string> objAPIMap = new Map<string,string>();    
    Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(objectAPIName).getDescribe().fields.getMap();

    for(Schema.SObjectField f : objectFields.Values()) {
      string Label = f.getDescribe().getLabel();
      string value = f.getDescribe().getName();
      objAPIMap.put(Label.toLowerCase(),value);
    }
    string separator='\t';
    string characterAttach = '\'';
    string numberseparator;
    Decimal decimalDigitCheck = 1.1;
    string separatorcheck = decimalDigitCheck.format();
    numberseparator = separatorcheck.subString(1,2);

    string recordStringLower = recordString.toLowerCase();
    string[] headerArray=recordStringLower.split(',');
    //system.debug('***exportcheck'+numberseparator);
    recordString = recordString.replace(',',separator);
    //<VR20140228>
    if(expList.size()==0 && (objectAPIName=='ERP_Sales_Prices_SAP__c' || objectAPIName=='Sales_Prices__c')) {
      string pricingConditionCode = [SELECT Pricing_Condition_Code__c FROM ERP_Pricing_Condition__c WHERE id=:pricingCondition.selectedPricingCondition ].Pricing_Condition_Code__c;
      ERP_Key_Combination__c keyCombinationObject = [SELECT Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE id=:keyCombination.keyCombinationID ];
      recordString+='\n'+characterAttach+pricingConditionCode+separator+characterAttach+keyCombinationObject.Key_Combination_Code__c+separator+(keyCombinationObject.Key_Combination__c.containsIgnoreCase('Sales Org.') ? characterAttach+pricingRequest.Sales_Org_Code__c : '')+separator+(keyCombinationObject.Key_Combination__c.containsIgnoreCase('Dist. Channel') ? characterAttach+pricingRequest.Dist_Channel_Code__c : '')+separator+(keyCombinationObject.Key_Combination__c.containsIgnoreCase('Division') ? characterAttach+pricingRequest.Division_Code__c : '');
    }
    system.debug('recordString is '+recordString);
    system.debug('headerArray is '+headerArray);
    system.debug('objAPIMap is '+objAPIMap.keyset());
    System.debug('&^&&*'+pricingRequest.Dist_Channel_Code__c);
    System.debug('&^&&*'+pricingRequest.Division_Code__c);

    //Generating the data for the csv file from the fetched list based on the header sequence generated
    List<string> columnList = new List<string>();
    List<string> rowList = new List<string>();
    for(Sobject sObj : expList) {
      columnList.clear();
      for(Integer i=0;i<headerArray.size();i++) {
        try {
          system.debug('headerArray[i].trim() is '+headerArray[i].trim());
          if(headerArray[i].trim().equalsIgnoreCase('sid')) {
            //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for fields of Non SAP object similar to rate in SAP object
            if(objectAPIName=='ERP_Sales_Prices_SAP__c' || objectAPIName=='Sales_Prices__c') {
              columnList.add(string.valueOf(sObj.get('id')));                       
            }
            else  {
              columnList.add(sObj.get('ERP_Sales_Prices_SAP__c')==null ? ' ' : string.valueOf(sObj.get('ERP_Sales_Prices_SAP__c')));
            }
          }
          //Distributor Changes START
          else if(headerArray[i].trim().equalsIgnoreCase('Distributor'))             
          {
                if(objectAPIName=='ERP_Sales_Prices_SAP__c' || objectAPIName=='Sales_Prices__c') {
                  columnList.add(characterAttach+string.valueOf(sObj.get('Distributor_Name__c')).escapeCsv());                       
                }
                else {
                  columnList.add(sObj.get('ERP_Sales_Prices_SAP__c')==null ? ' ' : string.valueOf(sObj.get('ERP_Sales_Prices_SAP__c')));
                }
           }
           //Distributor Changes END
          //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding Condition for fields of Non SAP object similar to rate in SAP object
          else if(headerArray[i].trim().equalsIgnoreCase('per') || headerArray[i].trim().containsIgnoreCase('rate') || headerArray[i].trim().containsIgnoreCase('quantity')) {
            if(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null && (string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim()))).escapeCsv()).contains('.')) {                                
              columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim()))).replace('.',numberseparator)).escapeCsv() : ' ');                      
            }
            else {                              
              columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim())))).escapeCsv() : ' ');
            }
          }
          //<VR20130509>
          else if(headerArray[i].trim().equalsIgnoreCase('Scale Type') && objectAPIName=='ERP_Sales_Prices_SAP__c'){
            columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (characterAttach+string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim())))).escapeCsv() : 'Base-Scale');
          }
          /*
                    else if(headerArray[i].trim().equalsIgnoreCase('Ship to') ){
                        columnList.add(sObj.get(objAPIMap.get('shipto'))!=null ? (string.valueOf(sObj.get(objAPIMap.get('shipto')))).escapeCsv() : ' ');
                    }
                    else if(headerArray[i].trim().equalsIgnoreCase('Ship to code') ){
                        columnList.add(sObj.get(objAPIMap.get('shipto code'))!=null ? (string.valueOf(sObj.get(objAPIMap.get('shipto code')))).escapeCsv() : ' ');
                    }*/
          //<JM20140517>

          else if(!(headerArray[i].equalsIgnoreCase('Valid From') || headerArray[i].equalsIgnoreCase('Valid To') || headerArray[i].equalsIgnoreCase('Payment Terms Fixed Date'))) {                                                                                            
            columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (characterAttach+string.valueOf(sObj.get(objAPIMap.get(headerArray[i].trim())))).escapeCsv() : ' ');
          }                   
          else
          {                        
            Date importDate = (Date)sObj.get(objAPIMap.get(headerArray[i].trim()));
            columnList.add(sObj.get(objAPIMap.get(headerArray[i].trim()))!=null ? (characterAttach+(importDate.year()+(string.valueOf(importDate.month()).length()==1 ? '0'+importDate.month() : ''+importDate.month())+(string.valueOf(importDate.day()).length()==1 ? '0'+importDate.day() : ''+importDate.day()))).escapeCsv() : ' ');
          }
        }
        catch(Exception e) {
          columnList.add(' ');
        }
      }
      rowList.add(string.join(columnList,separator));
    }
    system.debug('before exporting '+recordString+'\n'+string.join(rowList,'\n'));
    return recordString+'\n'+string.join(rowList,'\n');   //returning the string which holds the header and data which is to be exported
  }



  /*
   * Author     : Vinoth
   * Method Name : columnGenerate
   * Parameters  : None
   * Return type : string
   * Description : Used to Generate the columns based on the Key Combination
   */ 
  private string columnGenerate() {
    string mustColumns;
    //<PP20130711>
    //<PP20140418>
    /*Organizational_Group_Item__c orgGroupItemObj = [select Default_Prices_Selection__c,Request_Class__c, Enable_Request_Class__c,id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,
                                                        ERP_Pricing_Procedure__r.SAP_Client_Id__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c,isPaymentTermsApplicable__c,isVolumeApplicable__c 
                                                        from Organizational_Group_Item__c where Business__c=:requestServiceState.ogItems.selectedBU 
                                                        AND OrgGroup__r.ERP_Sales_Org_Code__c = :pricingRequest.Sales_Org_Code__c
                                                        AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :pricingRequest.Dist_Channel_Code__c 
                                                    AND OrgGroup__r.ERP_Division_Code__c = :pricingRequest.Division_Code__c limit 1];*/
    Organizational_Group_Item__c orgGroupItemObj = ((List<Organizational_Group_Item__c>)PAQueryUtil.query('PARequest', 'orgGroupItemObj', ' Business__c=\''+requestServiceState.ogItems.selectedBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c = \''+pricingRequest.Sales_Org_Code__c+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c =\''+pricingRequest.Dist_Channel_Code__c+'\' AND OrgGroup__r.ERP_Division_Code__c = \''+pricingRequest.Division_Code__c+'\' limit 1'))[0];                                               
    //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Adding extra fields in query for Floor and Reference Price Creation
    /*ERP_Procedure_Conditions__c proCondObj = [select Sales_Pricing_Procedure_Condition_Config__c,Pricing_Condition__c,Pricing_Condition__r.Calculation_Type__c ,Pricing_Condition__r.Scale_Type__c,Pricing_Condition__r.Price_Types__c
                                                  from ERP_Procedure_Conditions__c 
                                                  WHERE Sales_Pricing_Procedure__c=:orgGroupItemObj.ERP_Pricing_Procedure__c AND 
                                              Pricing_Condition__c=:pricingCondition.selectedPricingCondition];*/

    ERP_Procedure_Conditions__c proCondObj = ((List<ERP_Procedure_Conditions__c>)PAQueryUtil.query('PARequest', 'proCondObj', ' Sales_Pricing_Procedure__c=\''+orgGroupItemObj.ERP_Pricing_Procedure__c+'\' AND Pricing_Condition__c=\''+pricingCondition.selectedPricingCondition+'\''))[0];


    ERP_Key_Combination__c keyCombinationObject = [SELECT Id,Key_Combination_Code__c,Key_Combination_Tech__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE id=:keyCombination.keyCombinationID ];
    /*List<ERP_Access_Sequence__c> accSqList = [SELECT isNPCApplicable__c,isPaymentTermsApplicable__c,Pricing_Condition__r.Pricing_Condition_Code__c,
                                                          Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c,
                                                          Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                                                          Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                                                          Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,isVolumeApplicable__c
                                                          FROM ERP_Access_Sequence__c   WHERE
                                                          Sales_Pricing_Procedure__c = :orgGroupItemObj.ERP_Pricing_Procedure__c AND Pricing_Condition__c = :proCondObj.Pricing_Condition__c AND Pricing_Key_Combination__r.Key_Combination_Code__c =:keyCombinationObject.Key_Combination_Code__c? ORDER BY
                                                          Sequence_Number__c]; 
        system.debug('acc seq list size'+accSqList.size()); */
    List<ERP_Access_Sequence__c> accSqList = new List<ERP_Access_Sequence__c>();
    accSqList = [SELECT isPaymentTermsApplicable__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE Sales_Pricing_Procedure__c = :orgGroupItemObj.ERP_Pricing_Procedure__c
        AND Pricing_Condition__c = :proCondObj.Pricing_Condition__c AND Pricing_Key_Combination__c =:keyCombinationObject.Id
        ORDER BY Sequence_Number__c];

    //ERP_Access_Sequence__c erpAccessSequenceObj = [SELECT isVolumeApplicable__c from ERP_Access_Sequence__c where Sales_Pricing_Procedure__c =:orgGroupItemObj.ERP_Pricing_Procedure__c AND Pricing_Condition__c =: pricingCondition.selectedPricingCondition AND Key_Combination__c =:keyCombinationObject.Key_Combination__c];
    //ERP_Access_Sequence__c erpAccessSequenceObj = [SELECT isVolumeApplicable__c from ERP_Access_Sequence__c where Sales_Pricing_Procedure__c =:orgGroupItemObj.ERP_Pricing_Procedure__c AND Pricing_Condition__c =:pricingCondition.selectedPricingCondition AND Key_Combination__c =:keyCombinationObject.Key_Combination__c];
    String replacedKCTech;
    boolean hasShipToCountry = false;
    
    if(keyCombinationObject.Key_Combination_Tech__c.contains('Ship-To'))
    {
      replacedKCTech = keyCombinationObject.Key_Combination_Tech__c.replace('Ship-To','Ship To');
      hasShipToCountry = true;
    }
    else
      replacedKCTech = keyCombinationObject.Key_Combination_Tech__c;
    String keyCombTech = replacedKCTech.split('-')[0].replace('/',','); 
    //system.debug('KCTech: '+keyCombTech);    
    //<VR20130509>
    //<JM20140517> Added Volume,Volume UoM header,Customer Price Payment Terms,Fixed Date Payment Terms Header.
    if(accSqList.size() > 0 && (accSqList[0].isVolumeApplicable__c && orgGroupItemObj.isVolumeApplicable__c))
    {
      if(scaleEnable == 'true') {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Valid From,Valid To,Volume,Volume_UoM';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Per,UoM,Valid From,Valid To,Volume,Volume_UoM';
        }
      }
      else {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Valid From,Valid To,Volume,Volume_UoM';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Per,UoM,Valid From,Valid To,Volume,Volume_UoM';
        }
      }
    }
    else if(accSqList.size() > 0 && (accSqList[0].isPaymentTermsApplicable__c && orgGroupItemObj.isPaymentTermsApplicable__c))
    {
      if(scaleEnable == 'true') {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Valid From,Valid To,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Per,UoM,Valid From,Valid To,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
      }
      else {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Valid From,Valid To,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Per,UoM,Valid From,Valid To,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
      }
    }
    else if(accSqList.size() > 0 && (accSqList[0].isPaymentTermsApplicable__c && orgGroupItemObj.isPaymentTermsApplicable__c) && (accSqList[0].isPaymentTermsApplicable__c && orgGroupItemObj.isPaymentTermsApplicable__c))
    {
      if(scaleEnable == 'true') {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Valid From,Valid To,Volume,Volume_UoM,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Per,UoM,Valid From,Valid To,Volume,Volume_UoM,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
      }
      else {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Valid From,Valid To,Volume,Volume_UoM,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Per,UoM,Valid From,Valid To,Volume,Volume_UoM,Customer Price Payment Terms,Payment Terms Fixed Date';
        }
      }
    }

    else{
      if(scaleEnable == 'true') {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Valid From,Valid To';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Scaled Price Flag,'+(string.isBlank(proCondObj.Pricing_Condition__r.Scale_Type__c) ? 'Scale Type,': '')+'Scale UoM/Scale Unit,Scale Quantity/ Scale Value1,ScaleRate1,Scale Quantity/ Scale Value2,ScaleRate2,Scale Quantity/ Scale Value3,ScaleRate3,Scale Quantity/ Scale Value4,ScaleRate4,Scale Quantity/ Scale Value5,ScaleRate5,Scale Quantity/ Scale Value6,ScaleRate6,Scale Quantity/ Scale Value7,ScaleRate7,Scale Quantity/ Scale Value8,ScaleRate8,Scale Quantity/ Scale Value9,ScaleRate9,Scale Quantity/ Scale Value10,ScaleRate10,Rate,Unit,Per,UoM,Valid From,Valid To';
        }
      }
      else {
        //<VR20130718> Ver 4.31 VR 2013-07-18 APAC Rollout2-Modified the columns based on Floor and Reference Price
        if(proCondObj.Pricing_Condition__r.Calculation_Type__c!=null && (proCondObj.Pricing_Condition__r.Calculation_Type__c).contains('Percentage')) {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Valid From,Valid To';
        }
        else if(keyCombTech.contains('State'))
        {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Country Code,Rate,Unit,Per,UoM,Valid From,Valid To';
        }
        else {
          mustColumns = 'Pricing Condition Code,Key Combination Code,'+keyCombTech+',Rate,Unit,Per,UoM,Valid From,Valid To';
        }
      }     
    } 

    string descriptions = replacedKCTech.split('-')[1];
    descriptions = descriptions.replace('Sales Org./','');
    descriptions = descriptions.replace('Dist. Channel/','');
    descriptions = descriptions.replace('Division/','');
    descriptions = descriptions.replace('Landing Cost/','');
    descriptions = descriptions.replace('/Landing Cost','');
    if(hasShipToCountry)
    {
      mustColumns = mustColumns.replace('Ship To Country','Ship-To Country');
      descriptions = descriptions.replace('Ship To Country','Ship-To Country');
    }

    System.debug('descriptions:'+descriptions);
    System.debug('mustColumns:'+mustColumns);
    system.debug(mustColumns.trim()+','+descriptions.replace('/',',').trim()+',sid');
    //Distributor Changes START
    return mustColumns.trim()+','+descriptions.replace('/',',').trim()+',sid';
    //Distributor Changes END
  }
  //4.11 
  private void toggleSection()
  {
    string reasons;
    List<String> ogItemsId = new List<String>();
    List<Organizational_Group_User__c> orgUserList = [select id,Organizational_Group_Item__c from Organizational_Group_User__c where Related_User__c=:userinfo.getUserId() 
                                                          AND Organizational_Group_Item__r.Business__c=:requestServiceState.ogItems.selectedBU];


    //for(Organizational_Group_User__c X:[select id,Organizational_Group_Item__c from Organizational_Group_User__c where Related_User__c=:userinfo.getUserId() AND Organizational_Group_Item__r.Business__c=:requestServiceState.ogItems.selectedBU])
    for(Organizational_Group_User__c X:orgUserList)
    {
      //system.debug('#### Id'+X.Organizational_Group_Item__c);
      ogItemsId.add(X.Organizational_Group_Item__c);
    }
    //<NS20130821> Added Landing_Cost__c field to query select clause
    List<Organizational_Group_Item__c> temp = [select id,project_request_reasons__c,Landing_Cost__c from Organizational_Group_Item__c where Id IN :ogItemsId];
    //for(Organizational_Group_Item__c Z:[select id,project_request_reasons__c,Landing_Cost__c from Organizational_Group_Item__c where Id IN :ogItemsId])
    for(Organizational_Group_Item__c Z:temp)
    {
      if(!String.isBlank(Z.project_request_reasons__c))
      {
        requestServiceState.ogItems.isProjectGroupMember = true;
        break;
      }
      else
        requestServiceState.ogItems.isProjectGroupMember = false;
    }

  } 
  //<HL20140904> START
  public void getUpdatedPricingRequest(){
    /*pricingRequest = [SELECT F_NPC_Callout_Status__c,isVolumeApplicable__c,isFloorApplicable__c,isNPCApplicable__c,isPaymentTermsApplicable__c,Request_Class__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,
                          Project_Name__c,Zip_PostalCode__c,Terms_Of_Payment__c, SalesArea__c,Terms_Of_Payment_Code__c,
                          Task_Subject__c, SystemModstamp, Street__c,State_Province__c,Spot_Type__c,Pricing_exception__c,
                          Sold_To__c, SoldTo_Code__c,Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SAP_Application_Id__c,
                          Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c,Request_Name__c,
                          Request_Approval_Status__c,Project_Price__c,Project_Id__c, Pricing_Request_Type__c, OwnerId, Owner.Name,
                          On_Behalf_Of__c,Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate,
                          LastModifiedById,LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c,
                          Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Description__c,Customer_Specific__c,
                          Current_Level__c, Current_Approver__c,Current_Approver__r.E_Pass_ID__c, Current_Approver__r.Name,
                          CreatedDate,CreatedById, Country__c,City__c, CSR_Instruction__c, BU__c, Assigned_To__c,
                          Approver5__c, Approver5_Date__c,Approver4__c,Approver4_Date__c, Approver3__c, Approver3_Date__c,
                          Approver2__c, Approver2_Date__c, Approver1__c,Landing_Cost__c,Approver1_Date__c,Incoterms_Code__c,
                          On_Behalf_Of__r.Name, Last_Modified_by__c,Asynchronous_Call_Out_Indicator__c, Approver1__r.E_Pass_Id__c,
                          Approver2__r.E_Pass_Id__c, Approver3__r.E_Pass_Id__c,Approver4__r.E_Pass_Id__c, approver5__r.E_Pass_Id__c,
                          Backup_Level_1__c,Backup_Level_1__r.name,Backup_Level_2__c, Backup_Level_2__r.name, Backup_Level_3__c,
                          Backup_Level_3__r.name,Backup_Level_4__c, Backup_Level_4__r.name, Backup_Level_5__c,Backup_Level_5__r.name,
                          NPC_Status__c,Assigned_To__r.Name, Assigned_To__r.E_Pass_Id__c,created_by__c,Approver1__r.name,
                          Approver2__r.name,Approver3__r.name, Approver4__r.name, approver5__r.name,Project_Header_Approval_Flag__c,
                          Sent_to_Backup_Approver__c,Standardized_Currency__c,Standardized_UoM__c,approverText__c,Default_Currency__c,
                          Auto_Approver_Level1__c,Auto_Approver_Level2__c,Auto_Approver_Level3__c,Auto_Approver_Level4__c,Auto_Approver_Level5__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,Pricing_Condition__c,Key_Combination__c,Delegation_Comments__c,
                          ComPartner__c,ComPartner_Code__c 
                      FROM Pricing_Request__c WHERE Id = :pricingRequest.Id];*/
    pricingRequest = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+pricingRequest.Id+'\''))[0];                  

    relatedWrappersList=requestServiceState.currentRequestItem.getListWrappers();
    requestServiceState.currentRequestItem.relatedWrappersList=relatedWrappersList;
    //system.debug('inside Method of getupdatedpricingrequest relatedWrappersList:'+relatedWrappersList);
    //system.debug('inside Method of getupdatedpricingrequest:'+pricingRequest);
  }
  //<HL20140904> End

}