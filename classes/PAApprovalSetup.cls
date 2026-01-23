/**************************************************************************************************************
 ***********************************************Modification Log***********************************************
<PS20130417>
Last Modified By    :   Prachi Sinha
Last Modified Date  :   17 Apr 2013
Description         :   adding Customer Group 2(new key field)APAC Roll Out1(1.5)                                   
 ****************************************************************************************************************
<NE20130712>
Last Modified By    :   Neeharika
Last Modified Date  :   12 Jun 2013
Description         :   adding code for resolving view state- APAC rollout 1                                 
 *************************************************************************************************************
<PP20130808>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   08 Aug 2013
Description         :   Decoding the encoded User Name on click of link in lookup  - Production Issue Fix
 ***************************************************************************************************************                              
<PP20130710>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   10 Jul 2013
Description         :   1)Adding Request_Class__c in PA_BU_Admin_Master__c query - APAC ROLLOUT2
                        2)Added attributes to hold 'Enable Request Class' and 'Request Class' of Organizational
                            Group Item from Sales Area Selection component - APAC ROLLOUT2
 ***************************************************************************************************************                              
<SS20131024>
Last Modified By    :   Shiva Sudhakar
Last Modified Date  :   24 October 2013
Description         :   SIT Issue # 24 - Deleting 'All Other Approvers' does not get saved in the system - ROLLOUT2
 ***************************************************************************************************************                              
<PP20131106>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   11 November 2013
Description         :   1) Encoding country to avoid issue in case it contains "," - DTT ROLLOUT
                        2) Sorting of country values in lookup - DTT ROLLOUT
 *****************************************************************************************************************
<TJ20140426> 
Last Modified By    :   Tarun Jain
Last Modified Date  :   26 April 2014
Description         :   1) Added code for product hierarchy as key field
                        2) Added code for profit center as key field
 ******************************************************************************************************************
<PR20140901> 
Last Modified By    :   Priyanka R
Last Modified Date  :   01 Sep 2014
Description         :   Added code for the ability to select not required when the key field is coountry
 ******************************************************************************************************************
<HL20140910>
Last Modified By    :   Hema Latha
Last Modified Date  :   10 Sep 2014
Description         :   Added logic to Allow multiple levels of Product Hierarchy and FRB to be used for approval workflow
 ******************************************************************************************************************
<HL20140918>
Last Modified By    :   Hema Latha
Last Modified Date  :   18 Sep 2014
Description         :   Added logic to display Approver details in BU Admin Home Page.
 ******************************************************************************************************************
<MG20161207>
Last Modified By    :   Mansi Gupta
Last Modified Date  :   07 Dec 2016
Description         :   IS ID-00077055 Added "Where" condition in query for Adding approval list
 ******************************************************************************************************************
 <PG20182809>
Last Modified By    :   Prasoon Gangwar
Last Modified Date  :   28 Sept 2018
Description         :   IS ID-00086478 Fix to Too many query rows 50001 while creating approval header
*******************************************************************************************************************
<PG20190901>
Last Modified By    :   Prasoon Gangwar
Last Modified Date  :   09 Jan 2019
Description         :   IS ID-00074589 and IS ID-00087135 Fix to Error: Attempt to de-reference a null object while editing approval header
*******************************************************************************************************************
<PG20191211>
Last Modified By    :   Piyush Gupta
Last Modified Date  :   11 Dec 2019
Description         :   Added Customer Group 4 as a Routing Parameter Key Field.
*******************************************************************************************************************
<PG20200616>
Last Modified By    :   Piyush Gupta
Last Modified Date  :   16 June 2020
Description         :   Changed 'Reference Price' to 'Reference' to define Approval logic under Non Customer Specific Category.
******************************************************************************************************************
<IS TI-00095305>
Last Modified By    :   Nandakishor
Last Modified Date  :   16 Dec 2022
Description         :   Added limit in PA_BU_Admin_Master__c query.
******************************************************************************************************************/
/*
 * Name      :   PAApprovalSetup
 * Description  :   
 * Author      :   Infosys Limited
 * Created Date :   
 *
 /*   Ver.                     Developer                           Changes                                      Date                    Dependancies
-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
//  1.1                        Shiva                              Modified the where clause                    25-02-13                     None
//                                                                          for "End Use" & "Market Segment"
//  1.2                           Utkarsh                           Set the query order in the setup object query   7/03/2013                   
//                                                                  UAT Defect 15   
//  1.3                           Utkarsh                           Mixed value was overridden
//  1.4                           Prachi                            added NULL check condition to avoid Exception(All other and mixed value)None
//  1.5                         Bala                                Commented code to enable below Floor and ref for Pricing Task as well 
public without sharing class PAApprovalSetup implements IPAServiceComponent
{
  public PAApprovalSetup( PAServiceState paserviceState){                          
    adminMaster = new PA_BU_Admin_Master__c();
    detailWrapObjectList = new List<PAWrapper>();
    adminMasterWrapperList = new List<PAWrapper>();
    setupObjforDisplayList = new List<Setup_Object__c>();
    setUpObjforAllMultiUser = new Setup_Object__c();
    keyFieldSetAll = new set<String>();
    //<PP20131106>
    keyFieldListAll = new List<String>();
    mapKeyField = new map<string, string>();
    relatedWrappersList = new List<PARelatedList>();
    salesAreaFilter='';
    selectedBU = [select Business__c FROM OrgGroup__c WHERE id=:paServiceState.ogitems.selectedBU].Business__c;
    bu=selectedBU;
    // system.debug('***selectedBUconst'+selectedBU);
    relatedWrappersList = getlistwrappers();
    action(' ', ' ', ' ');
  }

  public PA_BU_Admin_Master__c adminMaster {get;set;}
  public List<PARelatedList> relatedWrappersList{get;set;}
  public List<User> userList {get;set;}
  public List<Setup_Object__c> setupObjforDisplayList{get;set;}
  public Setup_Object__c setUpObjforAllMultiUser {get;set;}
  public List<PA_BU_Admin_Detail__c> adminDetailDisplayList {get;set;}
  public Setup_Object__c setupObjforDisplay{get;set;}
  public List<SelectOption> buSelectOptions {get;set;}    
  public List<PAWrapper> detailWrapObjectList {get;set;}
  //<Hema>
  //public List<PAWrapper> admindetailWrapObjectList {get;set;}
  //public List<PAWrapper> MasterdetailWrapperList {get;set;}
  //public map<string, List<string>> detaillist {get;set;}
  public integer offsets{get;set;}
  public integer fromSet{get;set;}
  public integer toSet{get;set;}
  public boolean nextPage{get;set;}
  public boolean prevPage{get;set;}
  //<hema- end>
  public List<PAWrapper> adminMasterWrapperList{get;set;} 
  public map<string, string> mapKeyField {get;set;}
  public set<String> keyFieldSetAll {get;set;}
  //<PP20131106>
  public List<String> keyFieldListAll {get;set;}
  public set<String> countryList {get;set;}
  public String salesOrg {get;set;}
  public String distChannel {get;set;}
  public String divisionSelect {get;set;}
  public String salesOrgDisplay {get;set;}
  public String distChannelDisplay {get;set;}
  public String divisionSelectDisplay {get;set;}
  public String selectedKeyFieldId {get;set;}
  public String selectedKeyFieldValue {get;set;}  
  public String selectedBU{get;set;}
  public boolean createNewFlag = false;
  public String adminMasterId {set
    { 
    system.debug('***in setter adminMasterId'+value+'-'+adminMasterId);
    if(value <> NULL){
      // system.debug('***in setter if condition');
      adminMasterId = value;
      action(' ',' ',' ');
    }
    }get;}

  //<HL20140918> added by hema   
  public String ManageApprover{set
    { 
    system.debug('***in setter'+value+'-'+ManageApprover);
    if(value <> NULL){
      // system.debug('***in setter if condition');
      ManageApprover = value;
      if(value.containsIgnoreCase('ManageApprover'))
      {
        action('PAManageApprover','PAApprovalSetup','goToManageApprover');
      }

    }
    }get;}      

  /*public String keyfield {set
            { 
            system.debug('***in setter'+value+'-'+keyfield);


            }get;}*/

  //Hema end  
  public String adminDetailId {get;set;}
  public String keyField {get;set;}
  public String approverRole {get;set;}
  public String selectedAppId {get;set;}
  public String selectedApproverId {get;set;}
  public String selectedAppValue {get;set;}      
  public String lookupOfVar{get;set;}
  public String selectedCountry {get;set;}
  public String setupObjId{get;set;}
  public String keyFieldValueSearch{get;set;}
  public String keyFieldIdSearch{get;set;}
  public String adminMasterIDtoDel {get;set;}
  public boolean manageApproverLinkDisplay {get;set;} 
  public boolean onEditClick {get;set;}
  public boolean spotDisplay {get;set;}
  public boolean countryDisplay {get;set;}
  public boolean routingParameterEditFlag {get;set;}
  public boolean popID {get;set;}
  public boolean countrySelect {get;set;}
  public boolean popApprover {get;set;}
  //<MS20141013 START>
  public boolean displayCountryPopUp {get;set;}
  public void closeCountryDisplay()
  {
    displayCountryPopUp = false;
    keyFieldSetAll.clear();
    keyFieldListAll.clear();
  }
  //<MS20141013 END>
  public String bu;
  public boolean showGreenFlag{get;set;}
  public boolean editReadOnlyDisplay{get;set;}
  public boolean readonlyDisplayonID{get;set;}
  private boolean errorMessageFlag = false;
  public String allotherMixedLookup{get;set;}
  public String selectedAllOtherApprover{get;set;}
  public String selectedMixedApprover{get;set;}
  //<PP20130710> START
  public boolean enableRequestClassFlag {get;set;}
  public String requestClass {get;set;}
  public List<SelectOption> requestClassList
  {
    set;
    get
    {
      if(requestClass != null)
      {
        requestClassList = new List<SelectOption>();
        List<String> requestClassStringList = requestClass.split(';');
        for(String rc : requestClassStringList)
        {
          requestClassList.add(new SelectOption(rc,rc));
        }
      }
      return requestClassList;    
    }
  }
  //<PP20130710> END
  //<HL20153101> added static variable to fix production issue
  static List<Setup_Object__c> setupObjectList1;
  private List<Setup_Object__c> setupObjectListQuery(){
    if(setupObjectList1==null)
      setupObjectList1 = [SELECT All_Other_Values__c, Approver_Name__c, Approver_Role__c, BU__c, All_Other_Values__r.E_Pass_ID__c, 
                          Mixed_Values__r.E_Pass_ID__c, Distribution_Channel__c , Division__c, Key_Field__c, Key_Field_Id__c,
                          Key_Field_Value__c, Mixed_Values__c, Mixed_Values__r.name, All_Other_Values__r.name, Sales_Organisation__c, Access_Id__c, Approver_Id__c FROM Setup_Object__c order by LastModifiedDate desc];
    return setupObjectList1;                                                 
  }
  private void checkGreenFlag(){
    List<Setup_Object__c> setupObjectNewList = new List<Setup_Object__c>();
    //system.debug('***setupObjectList'+setupObjectList);
    for(Setup_Object__c setup : setupObjectListQuery()) {
      if(setup.BU__c == adminMaster.BU__c && setup.Distribution_Channel__c == adminMaster.Distribution_Channel__c && setup.Division__c == adminMaster.Division__c
          && setup.Sales_Organisation__c == adminMaster.Sales_Organisation__c){
        setupObjectNewList.add(setup);
      }
    }
    for(Integer i =0; i<detailWrapObjectList.size(); i++){
      for(setup_Object__c setObj : setupObjectNewList){
        PA_BU_Admin_Detail__c buadminDetail = (PA_BU_Admin_Detail__c) detailWrapObjectList[i].sObjectList[0];
        detailWrapObjectList[i].stringMap.put('showGreenFlag', 'false');
        if((buadminDetail.Key_Field__c <> NULL 
            && buadminDetail.Key_Field__c == setObj.Key_Field__c
            && buadminDetail.Approver_Role__c == setObj.Approver_Role__c)){
          detailWrapObjectList[i].stringMap.put('showGreenFlag', 'true');
          break;
        } 
        else if((buadminDetail.Key_Field__c == NULL 
            && buadminDetail.Key_Field__c == setObj.Key_Field__c
            && buadminDetail.Approver_Role__c == setObj.Approver_Role__c)){
          detailWrapObjectList[i].stringMap.put('showGreenFlag', 'false');
        }
      }
    }     
  }

  //<MS20140905> Adding filter variables and lists for Approval Setup Page Filters - Start 
  public String salesAreaFilter {get; set;}
  //<TJ20141124>
  public String so{get;set;}
  public String dc{get;set;}
  public String div{get;set;}
  public String requestTypeFilter {get; set;}
  public String priceCategoryFilter {get; set;}
  public Boolean enablePopUp
  {get
    {
    if(salesorgDisplay!=null)
    {
      enablePopUp=false;
    }
    else
    {
      enablePopUp=true;
    }
    return enablePopUp;
    }
  set;}
  public void sortApprovalSetupByFilter()
  {
    relatedWrappersList = getListWrappers();
  }

  public List<SelectOption> SalesAreaOptionsList
  {
    get
    {

      set<SelectOption> SalesAreaOptionsSet = new set<SelectOption>();
      selectedBU = bu;
      for(PA_BU_Admin_Master__c c : [select Sales_Organisation__c,Distribution_Channel__c,Division__c,BU__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = :selectedBU ])
      {
        String sa=c.Sales_Organisation__c+'-'+c.Distribution_Channel__c+'-'+c.Division__c;
        SalesAreaOptionsSet.add(new SelectOption(sa,sa));
      }
      List<SelectOption> SalesAreaOptionList = new List<SelectOption>();
      SalesAreaOptionList.addAll(SalesAreaOptionsSet);
      SalesAreaOptionList.sort();
      if(SalesAreaOptionList.size()>1)
        SalesAreaOptionList.add(0,new SelectOption('--Select--','--Select--'));

      return SalesAreaOptionList;
    }
    set;
  }

  public List<SelectOption> RequestTypeOptionsList
  {
    get
    {
      set<SelectOption> RequestTypeOptionsList = new set<SelectOption>();

      /*for(PA_BU_Admin_Master__c c : [select Request_Type__c,Price_Category__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = :selectedBU ])
            {
                RequestTypeOptionsList.add(new SelectOption(c.Request_Type__c,c.Request_Type__c));
            }*/
      List<SelectOption> RequestTypeOptionList = new List<SelectOption>();
      /*RequestTypeOptionList.addAll(RequestTypeOptionsList);
            if(RequestTypeOptionList.size()>1)*/
      RequestTypeOptionList.add(new SelectOption('','Select')); 
      RequestTypeOptionList.add(new SelectOption('Customer Specific','Customer Specific'));
      RequestTypeOptionList.add(new SelectOption('Non Customer Specific','Non Customer Specific'));
      return RequestTypeOptionList;

    }
    set;
  }

  public List<SelectOption> PriceCategoryOptionsList
  {
    get
    {
      set<SelectOption> PriceCategoryOptionsList = new set<SelectOption>();
      /*List<PA_BU_Admin_Master__c>  filterTypeList=[select Request_Type__c,Price_Category__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.Request_Type__c = :requestTypeFilter and PA_BU_Admin_Master__c.BU__c = :selectedBU];
            if(filterTypeList.size()>0)
            {
              for(PA_BU_Admin_Master__c c : filterTypeList)
              {
                  PriceCategoryOptionsList.add(new SelectOption(c.Price_Category__c,c.Price_Category__c));
              }
            }
            else 
            {
              for(PA_BU_Admin_Master__c c : [select Request_Type__c,Price_Category__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = :selectedBU])
              {
                  PriceCategoryOptionsList.add(new SelectOption(c.Price_Category__c,c.Price_Category__c));
              }
            }*/
      List<SelectOption> PriceCategoryOptionList = new List<SelectOption>();
      /*PriceCategoryOptionList.addAll(PriceCategoryOptionsList);
            if(PriceCategoryOptionList.size()>1)
            PriceCategoryOptionList.add(0,new SelectOption('','Select')); */
      if(requestTypeFilter.equals('Customer Specific%')){
        PriceCategoryOptionList.add(new SelectOption('','Select'));
        PriceCategoryOptionList.add(new SelectOption('Permanent','Permanent'));
        PriceCategoryOptionList.add(new SelectOption('Project Pricing','Project Pricing'));
        PriceCategoryOptionList.add(new SelectOption('Pricing Task','Pricing Task'));
      }else if(requestTypeFilter.equals('Non Customer Specific%')){
        PriceCategoryOptionList.add(new SelectOption('','Select'));
        PriceCategoryOptionList.add(new SelectOption('Permanent','Permanent'));
        PriceCategoryOptionList.add(new SelectOption('Floor','Floor'));
        //<PG20200616>START
        PriceCategoryOptionList.add(new SelectOption('Reference','Reference'));
      }else{
        PriceCategoryOptionList.add(new SelectOption('','Select'));
        PriceCategoryOptionList.add(new SelectOption('Permanent','Permanent'));
        PriceCategoryOptionList.add(new SelectOption('Project Pricing','Project Pricing'));
        PriceCategoryOptionList.add(new SelectOption('Pricing Task','Pricing Task'));
        PriceCategoryOptionList.add(new SelectOption('Floor','Floor'));
        //<PG20200616>END
        PriceCategoryOptionList.add(new SelectOption('Reference','Reference'));
      }
      return PriceCategoryOptionList;

    }
    set;
  }    
  //<MS20140905>End     
  // public List<PA_BU_Admin_Master__c> RequestTypeOptionsList = [select Request_Type__c,Price_Category__c from PA_BU_Admin_Master__c where PA_BU_Admin_Master__c.BU__c = :selectedBU ];

  //<HL20140828-end>

  public string action(String newPagelabel, String currentPagelabel, String desiredAction){
    adminMasterWrapperList = new List<PAWrapper>(); //added for View state-12th june NE20130712
    errorMessageFlag = false;
    List<Setup_Object__c> setUpRecordsList = new List<Setup_Object__c>();
    system.debug('Inside Action Approval Setup'+adminMasterId+desiredAction);
    PAWrapper detailWrapObject = new PAWrapper();
    PA_BU_Admin_Detail__c adminDetail = new PA_BU_Admin_Detail__c();
    List<PA_BU_Admin_Detail__c> adminDetailList = new List<PA_BU_Admin_Detail__c>();
    //<PP20130710>
    //<MS20140905>Start
    String query= 'SELECT Name,BU__c,Sales_Organisation__c,Distribution_Channel__c,Division__c,Request_Type__c,Price_Category__c,Pricing_Task_Type__c,Country__c,Request_Class__c FROM PA_BU_Admin_Master__c ';
    String query1 = 'SELECT PA_BU_Admin_Master__r.Name,PA_BU_Admin_Master__r.BU__c,PA_BU_Admin_Master__r.Sales_Organisation__c,PA_BU_Admin_Master__r.Distribution_Channel__c,PA_BU_Admin_Master__r.Division__c,PA_BU_Admin_Master__r.Request_Type__c,PA_BU_Admin_Master__r.Price_Category__c,PA_BU_Admin_Master__r.Pricing_Task_Type__c,PA_BU_Admin_Master__r.Country__c,PA_BU_Admin_Master__r.Request_Class__c,Approval_Level__c,Routing_Parameter__c, Key_Field__c,Approver_Role__c FROM PA_BU_Admin_detail__c ';

    //<<HL20140918> -- Added List to fetch detail object records>

    /*List<PA_BU_Admin_detail__c> adminmasterdetailList = [SELECT PA_BU_Admin_Master__r.Name,PA_BU_Admin_Master__r.BU__c,PA_BU_Admin_Master__r.Sales_Organisation__c,PA_BU_Admin_Master__r.Distribution_Channel__c,PA_BU_Admin_Master__r.Division__c,PA_BU_Admin_Master__r.Request_Type__c,
                                                           PA_BU_Admin_Master__r.Price_Category__c,PA_BU_Admin_Master__r.Pricing_Task_Type__c,PA_BU_Admin_Master__r.Country__c,PA_BU_Admin_Master__r.Request_Class__c,Approval_Level__c,Routing_Parameter__c, Key_Field__c,Approver_Role__c FROM PA_BU_Admin_detail__c];


            system.debug('adminmasterdetailList:'+adminmasterdetailList);*/

    //<HL20140918 -- end>


    system.debug('selectedBU :'+selectedBU);
    string whereclause='where ';
    string whereclause1 = 'where PA_BU_Admin_Master__r.BU__c =:selectedBU and PA_BU_Admin_Master__r.Request_Type__c not in(\'Massive\',\'Import\') ';
    if(SalesAreaOptionsList.size()==1)
      salesareafilter=SalesAreaOptionsList[0].getValue();
    system.debug('salesAreaFilter:'+salesAreaFilter);
    if(salesAreaFilter=='--Select--' || salesAreaFilter=='' || salesAreaFilter==null)
    {
      so = '%';
      dc='%';
      div='%';
    }
    else
    {
      so = salesAreaFilter.split('-')[0] + '%';
      dc = salesAreaFilter.split('-')[1] + '%';
      div = salesAreaFilter.split('-')[2] + '%';
    }
    system.debug('salesAreaFilter:'+salesAreaFilter+' '+so+' '+dc+' '+div);
    whereclause+='Sales_Organisation__c like :so AND Distribution_Channel__c like :dc AND Division__c like :div ';
    whereclause1+='and PA_BU_Admin_Master__r.Sales_Organisation__c like :so AND PA_BU_Admin_Master__r.Distribution_Channel__c like :dc AND PA_BU_Admin_Master__r.Division__c like :div ';
    /*else
            whereclause+='Sales_Organisation__c like % ';*/
    if(requestTypeFilter=='Select' || requestTypeFilter=='' || requestTypeFilter==null)
      requestTypeFilter = '%';
    else
      requestTypeFilter = requestTypeFilter+'%';
    whereclause+='and Request_Type__c like :requestTypeFilter  ';
    whereclause1+='and PA_BU_Admin_Master__r.Request_Type__c like :requestTypeFilter ';
    /*else
            whereclause+='and Request_Type__c like %';*/
    if(priceCategoryFilter=='Select' || priceCategoryFilter=='' || priceCategoryFilter==null)
      priceCategoryFilter='%';
    else
      priceCategoryFilter=priceCategoryFilter+'%';
    whereclause+='and Price_Category__c like :priceCategoryFilter ';
    whereclause1+='and PA_BU_Admin_Master__r.Price_Category__c like :priceCategoryFilter ';
    /*else
            whereclause+='and Price_Category__c like %';*/

    query+= whereclause;
    query1+= whereclause1;
    // system.debug('Inside Sales Area if loop'+query);
    // system.debug('Inside Sales Area if loop'+query1);
    // system.debug('\n\n\n requestTypeFilter '+salesAreaFilter+requestTypeFilter+priceCategoryFilter);

    /*if( RequestType!='Select') 
        {
            if(whereclause!='where') whereclause='where ';
            whereclause+='Request_Type__c = :RequestType and Price_Category__c= :PriceCategory ';
        }*/

    query+= 'ORDER BY Sales_Organisation__c limit 400';  //kept limit 400 to prevent hitting governor limit
    query1+= 'ORDER BY PA_BU_Admin_Master__r.id,Approval_Level__c limit 400';

    //added by hema
    if(offsets !=null)
    {
      query1+=' offset : offsets';

    }
    //end by hema      
    system.debug('**query:'+requestTypeFilter+' query1 '+priceCategoryFilter);
    List<PA_BU_Admin_Master__c> adminMasterList = database.query(query);
    List<PA_BU_Admin_detail__c> adminmasterdetailList = database.query(query1);
    //<TJ20141015>
    for(PA_BU_Admin_detail__c ad: adminmasterdetailList)
    {
      if(ad.Routing_Parameter__c == 'Not Required')
      {
        ad.Key_Field__c = null;
        ad.Approver_Role__c = null;
      }
    }   
    //   system.debug('adminMasterList:'+adminMasterList);
    system.debug('adminmasterdetailList:'+adminmasterdetailList);

    /*List<PA_BU_Admin_Master__c> adminMasterList = [SELECT Name,BU__c,Sales_Organisation__c,Distribution_Channel__c,Division__c,Request_Type__c,
                                                           Price_Category__c,Pricing_Task_Type__c,Country__c,Request_Class__c FROM PA_BU_Admin_Master__c ORDER BY Sales_Organisation__c];  */    


    //<MS20140905> end
    List<String> paIdList = new List<String>();  
    Setup_Object__c setupObject = new Setup_Object__c();
    Set<String> keyFieldSetAlltemp = new Set<String>();
    if(adminMasterId <> NULL && adminMasterId <> ' '){
      system.debug('***Inside adminmaster id <> NULL'+adminMasterList);
      for(PA_BU_Admin_Master__c ad : adminMasterList){
        if(ad.Id == adminMasterId){
          adminMaster = ad;
          break;//added to skip scrpt
        }
      }
      manageApproverLinkDisplay = false;
      editReadOnlyDisplay = false;
      onEditClick = true;   
      //selectedBU = adminMaster.BU__c;
      selectedBU = bu;
      system.debug('***Inside adminmaster id <> NULL'+adminMasterList);
      salesOrg = adminMaster.Sales_Organisation__c;
      system.debug('***salesOrg'+salesOrg);
      distChannel = adminMaster.Distribution_Channel__c;
      divisionSelect = adminMaster.Division__c;   
      //<PP20130710> START
      if(adminMaster.Request_Class__c <> NULL)
      {
        enableRequestClassFlag = true;
      }
      else
      {
        enableRequestClassFlag = false;
      }
      //<PP20130710> END   
      for(PA_BU_Admin_Master__c am : adminMasterList){
        if(am.Id == adminMaster.Id)
        {
          adminMaster = am;
          break;//added to skip scrpt
        }
      } 
      List<PA_BU_Admin_Detail__c> adminDetailDisplayList = [SELECT Approval_Level__c, Approver_Role__c, Key_Field__c, Routing_Parameter__c, PA_BU_Admin_Master__c FROM PA_BU_Admin_Detail__c where PA_BU_Admin_Master__c =:adminMaster.id order by Approval_Level__c];
      List<Setup_Object__c> setupObjectList = new List<Setup_Object__c>();
      for(Setup_Object__c setup : setupObjectListQuery()) {
        if(setup.BU__c == adminMaster.BU__c && setup.Distribution_Channel__c == adminMaster.Distribution_Channel__c && setup.Division__c == adminMaster.Division__c
            && setup.Sales_Organisation__c == adminMaster.Sales_Organisation__c){
          setupObjectList.add(setup);
        }
      } 
      if(desiredAction <> 'saveMasterMethodafterEdit'){                                                  
        detailWrapObjectList.clear();
        for(PA_BU_Admin_Detail__c paAdminDetail : adminDetailDisplayList){
          Integer i = 0;
          if(paAdminDetail.PA_BU_Admin_Master__c == adminMaster.id){
            detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObject.sObjectList.add(paAdminDetail);
            detailWrapObjectList.add(detailWrapObject);
          }
          i++;                               
        } 
      }
      //  system.debug('***Inside detail size'+detailWrapObjectList);
      checkGreenFlag();             
    }
    else{ 
      //  system.debug('***Inside else'+detailWrapObjectList);
      onEditClick = false;                                                              
      if(detailWrapObjectList.size() == 0){
        for(Integer i = 0; i<5; i++){
          PA_BU_Admin_Detail__c ad = new PA_BU_Admin_Detail__c();
          ad.Approval_Level__c = String.valueOf(i+1);
          ad.Routing_Parameter__c = 'Required';
          //   system.debug('***Key field'+ad.Key_Field__c);
          detailWrapObject = new PAWrapper();
          detailWrapObject.stringMap = new Map<String, String>();
          detailWrapObject.sObjectList = new List<sObject>();
          detailWrapObject.sObjectList.add(ad);
          detailWrapObject.stringMap.put('showGreenFlag', 'false');
          detailWrapObjectList.add(detailWrapObject);   
          //   system.debug('***Detail List'+detailWrapObject.sObjectList);      
        }
      }
    }
    //  system.debug('***list of details'+detailWrapObjectList);
    //Retrieving BU,sales area values for the BU admin to select
    //List<OrgGroup__c> paOrgList =  [select id,Business__c,RecordType.Name, ERP_Distribution_Channel_Code__c, ERP_Distribution_Channel__c, ERP_Division__c, ERP_Division_Code__c, ERP_Sales_Org__c ,ERP_Sales_Org_Code__c FROM OrgGroup__c];
   // <PG20182809> - START
    //List<OrgGroup__c> paOrgList =  [select id,Business__c,RecordType.Name, ERP_Distribution_Channel_Code__c, ERP_Distribution_Channel__c, ERP_Division__c, ERP_Division_Code__c, ERP_Sales_Org__c ,ERP_Sales_Org_Code__c FROM OrgGroup__c LIMIT 2000];
    //<PG20182809> - END
    /*---------------------------------------------*/
    // <PG20190901> - START
    List<OrgGroup__c> paOrgList =  [select id,Business__c,RecordType.Name, ERP_Distribution_Channel_Code__c, ERP_Distribution_Channel__c, ERP_Division__c, ERP_Division_Code__c, ERP_Sales_Org__c ,ERP_Sales_Org_Code__c FROM OrgGroup__c WHERE ERP_Division_Code__c != 'EC' AND ERP_Division_Code__c != 'F1'AND ERP_Division_Code__c != 'F2' AND ERP_Division_Code__c != 'GL' AND ERP_Division_Code__c != 'SP'];
     // <PG20190901> - END
    //------------------------------------------------
    List<OrgGroup__c> paOrgDifferentiatorList = new List<OrgGroup__c>();
    List<OrgGroup__c> paOrgERPSalesAreaList = new List<OrgGroup__c>();
    List<OrgGroup__c> paOrgSet = new List<OrgGroup__c>();
    for(OrgGroup__c paOrg : paorglist){
      system.debug('***paOrg.RecordType.Name'+paOrg.RecordType.Name+paOrg.ERP_Sales_Org_Code__c +paOrg.Business__c);
      if(paOrg.RecordType.Name == 'Business'){
        paOrgDifferentiatorList.add(paOrg);
      }
      if(paOrg.RecordType.Name == 'ERP Sales Area'){
        paOrgERPSalesAreaList.add(paOrg);
        if(paOrg.ERP_Sales_Org_Code__c == salesOrg && paOrg.ERP_Distribution_Channel_Code__c == distChannel && paOrg.ERP_Division_Code__c == divisionSelect){
          salesOrgDisplay = salesOrg+'-'+paOrg.ERP_Sales_Org__c;
          distChannelDisplay = distChannel+'-'+paOrg.ERP_Distribution_Channel__c;
          divisionSelectDisplay = divisionSelect+'-'+paOrg.ERP_division__c;
        }
      }
    }
    paOrgSet.addAll(paOrgDifferentiatorList);
    //Script error
    Map<String,OrgGroup__c> concateSalesAreaOrgGroupMap= new Map<String,OrgGroup__c>();
    for(OrgGroup__c paOrg : paOrgERPSalesAreaList)
    {
      concateSalesAreaOrgGroupMap.put(paOrg.ERP_Sales_Org_Code__c+paOrg.ERP_Distribution_Channel_Code__c+paOrg.ERP_Division_Code__c,paOrg);
    }
    //<HL20140918> Added the relation PA_BU_Admin_Master__r since detail object is referred
    adminMasterWrapperList = new List<PAWrapper>();
    for(PA_BU_Admin_Detail__c am : adminMasterdetailList){
      PAWrapper adminMasterWrapperObj = new PAWrapper();
      system.debug('***selectedBU'+selectedBU);
      system.debug('***am.PA_BU_Admin_Master__r.BU__c'+am.PA_BU_Admin_Master__r.BU__c);
      if(am.PA_BU_Admin_Master__r.BU__c == selectedBU){
        system.debug('***inside if selectedBU'+selectedBU);
        adminMasterWrapperObj.sObjectRecord = am;
        OrgGroup__c paOrg=  concateSalesAreaOrgGroupMap.get(am.PA_BU_Admin_Master__r.Sales_Organisation__c+am.PA_BU_Admin_Master__r.Distribution_Channel__c+am.PA_BU_Admin_Master__r.Division__c);
        if(paOrg!=null){
          adminMasterWrapperObj.stringMap.put('salesOrginWrapper', am.PA_BU_Admin_Master__r.Sales_Organisation__c+ '-' + paOrg.ERP_Sales_Org__c);
          adminMasterWrapperObj.stringMap.put('distChannelinWrapper', am.PA_BU_Admin_Master__r.Distribution_Channel__c + '-' + paOrg.ERP_Distribution_Channel__c);
          adminMasterWrapperObj.stringMap.put('divisioninWrapper', am.PA_BU_Admin_Master__r.Division__c + '-' + paOrg.ERP_Division__c);
        } 
        //system.debug('inside for loop adminMasterWrapperObj :'+adminMasterWrapperObj);
        adminMasterWrapperList.add(adminMasterWrapperObj); 

      }       
    }

    //added by hema


    if(desiredAction.equalsIgnoreCase('FetchRecordswithOffset'))
    {
      system.debug('Size of offsets: -'+offsets);
      if(offsets== null)
        offsets = 400;
      else if(offsets+400<=2000)
        offsets += 400;
      relatedWrappersList = new List<PARelatedList>();
      relatedWrappersList = getListWrappers();
      system.debug('Size of wrapper: -'+relatedWrappersList);
      system.debug('Size of lastoffsets: -'+offsets);
    }
    else if(desiredAction.equalsIgnoreCase('FetchRecordswithOffsetback'))
    {
      if(offsets>=400)
        offsets -= 400;
      else
        offsets = null; 
      relatedWrappersList = new List<PARelatedList>();
      relatedWrappersList = getListWrappers();
      system.debug('Size of wrapper: -'+relatedWrappersList);
    }

    //end by hema


    system.debug('\n\n\n adminMasterWrapperList '+adminMasterWrapperList);
    //List<Organizational_Group_Item__c> buList = [SELECT Business__c,OrgGroup__c FROM Organizational_Group_Item__c WHERE Business__c IN :paOrgDifferentiatorList];
    //<PG20182809> - START
    List<Organizational_Group_Item__c> buList = [SELECT Business__c,OrgGroup__c FROM Organizational_Group_Item__c WHERE Business__c IN :paOrgDifferentiatorList LIMIT 200];
    //<PG20182809> - END
    system.debug('Size of wrapper:Deepanshi/Prasoon -'+ buList.size());
    for(Organizational_Group_Item__c i : buList){
      paIdList.add(i.OrgGroup__c);
    }
    List<ERP_Customer_Material_Key__c> erpCustMatKeyList = new List<ERP_Customer_Material_Key__c>();
    List<Product_Hierarchy__c> productHierarchyList = new List<Product_Hierarchy__c>();
    List<OrgGroup__c> orgGroupList = new List<OrgGroup__c>();
    userList = new List<User>();
    getApproverRoles(); 
    if(desiredAction.equalsIgnoreCase('displaySpot')) {
      if(adminMaster.Price_Category__c == 'Pricing Task'){
        spotDisplay = true;
      }
      else{
        spotDisplay = false;
      }
    }
    if(desiredAction.equalsIgnoreCase('nullifySalesArea')) {
      salesOrgDisplay = NULL;
      distChannelDisplay = NULL;
      divisionSelectDisplay = NULL;
      salesOrg = NULL;
      distChannel = NULL;
      divisionSelect = NULL;
      adminMaster.Request_Type__c = NULL;
      adminMaster.Price_Category__c = NULL;
      selectedCountry = NULL;
      adminMaster.Pricing_Task_Type__c = NULL;
      countryDisplay = false;
      spotDisplay = false;
    }
    if(desiredAction.equalsIgnoreCase('displayCountry')) {
      if(adminMaster.Request_Type__c == 'Customer Specific'){
        countryDisplay = true;
      }   
      else{
        countryDisplay = false;
      }
      if((adminMaster.Request_Type__c == 'Customer Specific' && adminMaster.Price_Category__c == 'Pricing Task')
          ||(adminMaster.Request_Type__c == 'Non-Customer Specific' && (adminMaster.Price_Category__c == 'Reference Price'
          || adminMaster.Price_Category__c == 'Floor Price'))){
        routingParameterEditFlag = true;
      }
      else{ 
        routingParameterEditFlag =false;
      }            
    }
    if(desiredAction.equalsIgnoreCase('selectCountry')) {
      displayCountryPopUp = true;
      //<PP20131106>
      erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Country' ORDER BY Code__c];
      Set<ID> orgJunctionIdSet = new Set<Id>();
      for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Country' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU]){
        orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
      }                                  
      // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
      for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
        if(orgJunctionIdSet.contains(e.Id)){
          keyFieldSetAll.add(e.Code__c);
          if(e.Name__c == NULL)
            mapKeyField.put(e.Code__c, '');  
          else
            mapKeyField.put(e.Code__c, e.Name__c);  
        }
      }
      //   system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
      //<PP20131106> START
      keyFieldListAll.addAll(keyFieldSetAll);
      keyFieldListAll.sort();
      //<PP20131106> END
    }
    /*  <MS20141013> Commenting in order to avoid page refresh 
    if(desiredAction.equalsIgnoreCase('closeCountryDisplay')) {
      displayCountryPopUp = false;
      //<TJ20140628> Clear List on closing popup
      keyFieldSetAll.clear();
      keyFieldListAll.clear();
            }*/
    if(desiredAction.equalsIgnoreCase('closeDisplay')) {
      popID = false;
      //<TJ20140628> Clear List on closing popup
      keyFieldSetAll.clear();
      keyFieldListAll.clear();
    }
    if(desiredAction.equalsIgnoreCase('closeDisplaySelected')) {   
      setupObjforDisplay = new Setup_Object__c();  
      setupObjforDisplay.Key_Field_Id__c = selectedKeyFieldId;
      //<PP20131106> - Encoding country when selected from lookup
      setupObjforDisplay.Key_Field_Value__c = EncodingUtil.urlDecode(selectedKeyFieldValue,'UTF-8');  
      if(setupObjforDisplayList.size()>0){
        setupObjforDisplayList.add(0,setupObjforDisplay);
      }
      else {
        setupObjforDisplayList.add(setupObjforDisplay);
      }
      popID = false;
      //added by neeha for View State NE20130712
      keyFieldSetAll.clear();
      //
      keyFieldListAll.clear();
    }
    if(desiredAction.equalsIgnoreCase('closeApproverDisplay')) {
      popApprover = false;
    }
    if(desiredAction.equalsIgnoreCase('closeAddApproverDisplay')) {
      //Issue 235: Utkarsh
      if(allothermixedLookup == 'allothervalues'){
        setUpObjforAllMultiUser.All_Other_Values__c = selectedApproverId;
        //<PP20130808>
        selectedAllOtherApprover = EncodingUtil.urlDecode(selectedAppValue,'UTF-8');
        //23rd april adding this condition to avoid null pointer exception when All_Other_Values__c is NULL 
        if(setUpObjforAllMultiUser.All_Other_Values__r.E_Pass_ID__c <> NULL)    
          setUpObjforAllMultiUser.All_Other_Values__r.E_Pass_ID__c = selectedAppId;
      }
      else if(allothermixedLookup == 'mixedValues'){
        setUpObjforAllMultiUser.Mixed_Values__c = selectedApproverId;
        //<PP20130808>
        selectedMixedApprover = EncodingUtil.urlDecode(selectedAppValue,'UTF-8');
        //23rd april adding this condition to avoid null pointer exception when Mixed_Values__c is NULL 
        if(setUpObjforAllMultiUser.Mixed_Values__r.E_Pass_ID__c <> NULL)
          setUpObjforAllMultiUser.Mixed_Values__r.E_Pass_ID__c = selectedAppId;
      }
      else{
        Set<String> keyfieldApproverSet = new Set<String>(); 
        //Checking for Uniqueness      
        for(Setup_Object__c setupObj : setupObjforDisplayList){
          keyfieldApproverSet.add(setupObj.Key_Field_Id__c+setupObj.Approver_Id__c);
        }
        //Changed by utkarsh for defect 15 of UAT   
        for(Integer i = setupObjforDisplayList.size()-1; i>=0; i--){
          if(keyfieldApproverSet.contains(setupObjforDisplayList[i].Key_Field_Id__c+selectedAppId) && setupObjforDisplayList[i].Access_Id__c == NULL){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Key_Field_Approver_Combination_Duplicate_Error+keyfieldApproverSet+setupObjforDisplayList[i].Key_Field_Id__c+selectedAppId);  
            ApexPages.addMessage(myMsg);
            errorMessageFlag = true;
            break;
          } 
          if(!errorMessageFlag && (allotherMixedLookup == NULL || allotherMixedLookup == ' ')){
            if(setupObjforDisplayList[i].Access_Id__c == NULL  && setupObjforDisplayList[i].Approver_Id__c == NULL && !keyfieldApproverSet.contains(setupObjforDisplayList[i].Key_Field_Id__c+selectedAppId)){
              setupObjforDisplayList[i].Approver_Id__c = selectedApproverId;
              setupObjforDisplayList[i].Access_Id__c = selectedAppId;
              //<PP20130808>
              setupObjforDisplayList[i].Approver_Name__c = EncodingUtil.urlDecode(selectedAppValue,'UTF-8');
              break;
            }    
          }  
        }


      }
      userList.clear(); //added for Viewe State NE20130712
      if(!errorMessageFlag){
        popApprover = false;
      }
    }
    if(desiredAction.equalsIgnoreCase('goToManageApprover')) {
      setupObjforDisplayList.clear();
      setUpObjforAllMultiUser.clear();
      selectedAllOtherApprover = null;
      selectedMixedApprover = null;
      setUpRecordsList.clear();
      for(Setup_Object__c setup : setupObjectListQuery()) {
        if(setup.BU__c == adminMaster.BU__c && setup.Distribution_Channel__c == adminMaster.Distribution_Channel__c && setup.Division__c == adminMaster.Division__c
            && setup.Sales_Organisation__c == adminMaster.Sales_Organisation__c){
          setUpRecordsList.add(setup);
        }
      }
      //  system.debug('....set up keyField '+ keyField);
      //  system.debug('....set up setUpRecordsList '+ setUpRecordsList);
      for(Setup_Object__c setupObj: setupRecordsList){
        if(setupObj.BU__c == selectedBU && setupObj.Sales_Organisation__c  == salesOrg && setupObj.Distribution_Channel__c == distChannel
            && setupObj.Division__c == divisionSelect && setupObj.Key_Field__c == keyField && setupObj.Approver_Role__c == approverRole){
          setupObjforDisplayList.add(setupObj);
        }
      }   
      //  system.debug('....set up records '+ setupObjforDisplayList);                               
      for(Integer i = 0 ;i<setupObjforDisplayList.size();i++){
        if(setupObjforDisplayList[i].Key_Field_Value__c == NULL && setupObjforDisplayList[i].Approver_Id__c == NULL){
          setUpObjforAllMultiUser = setupObjforDisplayList[i];
          selectedAllOtherApprover = setUpObjforAllMultiUser.All_Other_Values__r.name;
          selectedMixedApprover = setUpObjforAllMultiUser.Mixed_Values__r.name;
          setupObjforDisplayList.remove(i);
        }
      }
      //Sort setup Object Display List
      //setupObjforDisplayList.sort();
      //    system.debug('....set up records '+ setUpObjforAllMultiUser);           
      newpagelabel = 'PAManageApprover';
    }
    //Contains as save will be performed in two cases one after edit and one for fresh data.
    if(desiredAction.containsIgnoreCase('saveMasterMethod')) {
      // system.debug('List at astart of save master'+detailWrapObjectList);
      // system.debug('***AAA'+oneditClick+editReadOnlyDisplay);                     
      List<PA_BU_Admin_Detail__c> buadminDetailList = new List<PA_BU_Admin_Detail__c>();
      for(Integer i=0; i<5; i++){
        PA_BU_Admin_Detail__c buadminDetail = (PA_BU_Admin_Detail__c) detailWrapObjectList[i].sObjectList[0];
        buadminDetailList.add(buadminDetail);
      }
      if(salesOrgDisplay <> NULL)
        salesorg = (salesOrgDisplay.substringBefore('-'));
      if(distChannelDisplay <> NULL)
        distChannel = (distChannelDisplay.substringBefore('-'));
      if(divisionSelectDisplay <> NULL)
        divisionSelect = (divisionSelectDisplay.substringBefore('-'));
      if(selectedBU == '--None--')
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Business_Selected_Error);  
        ApexPages.addMessage(myMsg); 
        errorMessageFlag = true;
      }
      else if(distChannel == NULL || divisionSelect == NULL || salesorg == NULL)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Sales_Area_selected_Error);  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
      }
      //<PP20130711> START
      else if(enableRequestClassFlag != NULL && enableRequestClassFlag && (adminMaster != NULL && (adminMaster.Request_Class__c == NULL
          || adminMaster.Request_Class__c == '--None--')))
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Request_Class_Mandatory_Error);  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
      }
      //<PP20130711> END
      else if(adminMaster.Price_Category__c == NULL)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Price_Category_selected_Error);  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
      }
      else if(adminMaster.Price_Category__c == 'Pricing Task' && adminMaster.Pricing_Task_Type__c == NULL) //&& adminMaster.Spot_Type__c == NULL)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Spot_Type_selected_Error);  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
      } 
      else if((buadminDetailList[0].Routing_Parameter__c <> 'Not Required' || buadminDetailList[1].Routing_Parameter__c <> 'Not Required' || buadminDetailList[2].Routing_Parameter__c <> 'Not Required' 
      || buadminDetailList[3].Routing_Parameter__c <> 'Not Required') && buadminDetailList[4].Routing_Parameter__c == 'Not Required'){
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Routing Parameter cannot be Not Required at level 5.');  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
      }              
      else
      {
        //When editting this will throw exception
        try{
          selectedBU = [SELECT Business__c FROM OrgGroup__c Where ID = :selectedBU].Business__c;
        }
        catch(exception e){}
        salesorg = (salesOrgDisplay.split('-'))[0];
        distChannel = (distChannelDisplay.split('-'))[0];
        divisionSelect = (divisionSelectDisplay.split('-'))[0];
        adminMaster.BU__c = selectedBU;
        adminMaster.Sales_Organisation__c = (salesOrgDisplay.split('-'))[0];
        adminMaster.Distribution_Channel__c = (distChannelDisplay.split('-'))[0];
        adminMaster.Division__c = (divisionSelectDisplay.split('-'))[0];
        adminMaster.Country__c = selectedCountry;
        //Since the set redirect is false so the admindetaillist is not geting initialized again through constructor and it may throw identical elements error
        adminDetailList.clear();
        for(Integer i=0; i<detailWrapObjectList.size();i++){
          PA_BU_Admin_Detail__c buadminDetail = (PA_BU_Admin_Detail__c) detailWrapObjectList[i].sObjectList[0];
          if(buadminDetail.Approver_Role__c == '--None--'){
            buadminDetail.Approver_Role__c = NULL;
          }               
          if(buadminDetail.Routing_Parameter__c == NULL){
            manageApproverLinkDisplay = false;
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.No_Routing_Parameter_Error);  
            ApexPages.addMessage(myMsg);
            errorMessageFlag = true;
            break;
          }
          if(buadminDetail.Routing_Parameter__c <> 'Not Required'){
            if((buadminDetail.key_field__c == NULL)){
              manageApproverLinkDisplay = false;
              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.No_Key_Field_Error+buadminDetail.Approval_Level__c);  
              ApexPages.addMessage(myMsg);
              errorMessageFlag = true;
              break;
            }
            if(buadminDetail.key_field__c <> NULL){
              if(buadminDetail.Approver_Role__c == NULL){
                manageApproverLinkDisplay = false;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.No_Approver_Role_Error+buadminDetail.Approval_Level__c);  
                ApexPages.addMessage(myMsg);
                errorMessageFlag = true;
                break;
              }
            }
          }
          if(!errorMessageFlag){
            adminDetailList.add(buadminDetail);
          }
        }
        //  system.debug('***oneditclick+errormessageflag'+oneditclick+errormessageflag);
        if(!onEditClick && !errorMessageFlag){
          try{
            upsert adminMaster;
            //adminMasterId = adminMaster.Id;
          }
          catch(exception e){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.Approval_Setup_Already_exist_Error);  
            ApexPages.addMessage(myMsg);
            errorMessageFlag = true;
          }
          if(!errorMessageFlag){
            adminDetailList.clear();//TO DO
            for(Integer i=0; i<detailWrapObjectList.size();i++){
              PA_BU_Admin_Detail__c buadminDetail = (PA_BU_Admin_Detail__c) detailWrapObjectList[i].sObjectList[0];
              system.debug('***adminMasterIdindetail'+buadminDetail.PA_BU_Admin_Master__c);
              if(buadminDetail.PA_BU_Admin_Master__c == NULL){
                buadminDetail.PA_BU_Admin_Master__c = adminMaster.Id;
                system.debug('***adminMasterId'+adminMaster.id+'--'+adminMasterId);
                //adminDetailList.add(buAdminDetail);
              }
              adminDetailList.add(buAdminDetail);
            }
          }
        }
        if(!errorMessageFlag){
          //system.debug('***'+adminDetailList);
          upsert adminDetailList;
          detailWrapObjectList.clear();
          for(PA_BU_Admin_Detail__c detail : adminDetailList){
            detailWrapObject = new PAWrapper();
            detailWrapObject.stringMap = new Map<String, String>();
            detailWrapObject.sObjectList = new List<sObject>();
            detailWrapObject.sObjectList.add(detail);
            detailWrapObject.stringMap.put('showGreenFlag', 'false');
            detailWrapObjectList.add(detailWrapObject);
          }
          checkGreenFlag(); 
          editReadOnlyDisplay = true;
          manageApproverLinkDisplay = true;
        }
      }       
    }
    if(desiredAction.equalsIgnoreCase('goToapprovalSetup')) {
      adminMaster = new PA_BU_Admin_Master__c();
      selectedBU = null;
      salesOrgDisplay = null;
      distChannelDisplay = null;
      divisionSelectDisplay = null;
      salesOrg = null;
      distChannel = null;
      divisionSelect = null;
      detailWrapObjectList.clear();
      adminMasterId = NULL;
      action(' ',' ',' ');
    }
    if(desiredAction.equalsIgnoreCase('cancelManageApprovers')) {
      editReadOnlyDisplay = true;
      manageApproverLinkDisplay = true;
    }
    if(desiredAction.equalsIgnoreCase('onclickcancelButton')) {
      manageApproverLinkDisplay = true;
    }
    if(desiredAction.equalsIgnoreCase('editSetUpDetail')) {
      oneditClick = true;
      editReadOnlyDisplay = false;
      readonlyDisplayonID = false;
      manageApproverLinkDisplay = false;
    }
    if(desiredAction.containsIgnoreCase('goToBULandingPage')) {
      relatedWrappersList = getListWrappers();
      action(' ',' ',' ');
    }
    if(desiredAction.equalsIgnoreCase('deleteAdminMasterRecord')) {
      try{
        delete adminMaster;
      }   
      catch(exception e){
        for(PA_BU_Admin_Master__c am : adminMasterList){
          if(am.Id == adminMasterIDtoDel){
            adminMaster = am;
            break;
          }
        }   
        delete adminMaster;
      }   
      // system.debug(SalesAreaOptionsList);   
      relatedWrappersList = getListWrappers();            
      action(' ',' ',' ');
    }
    if(desiredAction.equalsIgnoreCase('saveSetObjectMethod')) {
      boolean duplicateRecordFlag = false;
      //<SS20131024>
      if (setUpObjforAllMultiUser.All_Other_Values__c == NULL || String.isblank(selectedAllOtherApprover)) //Shiva - Added "String.isblank(selectedAllOtherApprover)" condition - 24/10/2013
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Enter_All_Other_Values_Approver_Error);  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
        newpageLabel = 'PAManageApprover';
      }
      //<SS20131024>
      if(setUpObjforAllMultiUser.Mixed_Values__c == NULL || String.isblank(selectedMixedApprover))//Shiva - Added "String.isblank(selectedMixedApprover)" condition - 24/10/2013
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Enter_Mixed_Value_Approver_Error);  
        ApexPages.addMessage(myMsg);
        errorMessageFlag = true;
        newpageLabel = 'PAManageApprover';
      }
      if(!errorMessageFlag){
        Set<String> setUpRecordStringSet = new Set<String>();
        Set<String> setUpObjectStringSet = new Set<String>();
        Set<String> setupStringSetinserted = new Set<String>();
        List<Setup_Object__c> setupNewRecords = new List<Setup_Object__c>(); 
        List<Setup_Object__c> setUpObjList = new List<Setup_Object__c>();  
        // system.debug('....set up records '+ setupObjforDisplayList.size() + setUpRecordsList);
        for(Setup_Object__c setupObj: setupObjforDisplayList){
          setUpRecordStringSet.add(setupObj.Key_Field_Id__c+setupObj.Approver_Id__c+setupObj.Approver_Role__c);
        }
        for(Setup_Object__c setupObj: setupObjforDisplayList){
          if(setupObj.Id == NULL){
            setupObj.Approver_Role__c = approverRole;
            setupNewRecords.add(setupObj);
          }
          else {
            setupStringSetinserted.add(setupObj.Key_Field_Id__c+setupObj.Approver_Id__c+setupObj.Approver_Role__c);
          }
        }
        // system.debug('....see all the records of setUpRecordStringSet '+ setUpRecordStringSet);
        for(Integer i=0; i<setupObjforDisplayList.size();i++)
        {
          setupObject = new Setup_Object__c();
          setupObject.BU__c = selectedBU;
          setupObject.Sales_Organisation__c = salesorg;
          setupObject.Distribution_Channel__c = distChannel;
          setupObject.Division__c = divisionSelect;
          setupObject.Key_Field__c = keyField;
          setupObject.Approver_Role__c = approverRole;
          setupObject.Key_Field_Id__c = setupObjforDisplayList[i].Key_Field_Id__c;
          setupObject.Key_Field_Value__c = setupObjforDisplayList[i].Key_Field_Value__c;
          setupObject.Access_Id__c = setupObjforDisplayList[i].Access_Id__c;
          setupObject.Approver_Id__c = setupObjforDisplayList[i].Approver_Id__c;
          setupObject.Approver_Name__c = setupObjforDisplayList[i].Approver_Name__c;
          if(setupObject.Key_Field_Id__c == NULL && setupObject.Approver_Id__c <> NULL)
          {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.No_Key_Field_Id_Error);  
            ApexPages.addMessage(myMsg);
            errorMessageFlag = true;
            newpageLabel = 'PAManageApprover';
            break;
          }
          //<PR20140901>
          if(setupObject.Key_Field_Id__c <> NULL && setupObject.Approver_Id__c == NULL && !(setupObject.Approver_Name__c != null && setupObject.Approver_Name__c.contains('Not Required')))
          {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.No_Approver_Id_Error);  
            ApexPages.addMessage(myMsg);
            errorMessageFlag = true;
            newpageLabel = 'PAManageApprover';
            break;
          }
          if(!setUpRecordStringSet.contains(setupObject.Key_Field_Id__c+setupObject.Approver_Id__c+setupObject.Approver_Role__c))
          { 
            //<PR20140901> START
            if(setupObject.Approver_Name__c != null && setupObject.Approver_Name__c.contains('Not Required')){                      
              setupObject.Approver_Id__c = NULL;
            }
            //<PR20140901> END
            setUpObjList.add(setupObject);
            setUpObjectStringSet.add(setupObject.Key_Field_Id__c+setupObject.Approver_Id__c);
          }   
          //For issue no. 315   
          else
          {
            for(Setup_Object__c s : setupNewRecords)
            {
              if(setupStringSetinserted.contains(s.Key_Field_Id__c+s.Approver_Id__c+s.Approver_Role__c))
              {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.Key_Field_Approver_Combination_Duplicate_Error);  
                ApexPages.addMessage(myMsg);
                setUpRecordStringSet.clear();
                errorMessageFlag = true;
                action(newpageLabel, currentpagelabel, 'goToManageApprover');
                return newpageLabel;
              }
            }
          }         
        }
        // system.debug('****Sizecomparision'+setUpRecordStringSet.size()+setupObjforDisplayList.size());
        if(!errorMessageFlag)
        {                        
          //  system.debug('#### setUpObjList size '+setUpObjList.size());    
          setUpObjforAllMultiUser.BU__c = selectedBU;
          setUpObjforAllMultiUser.Sales_Organisation__c = salesorg;
          setUpObjforAllMultiUser.Distribution_Channel__c = distChannel;
          setUpObjforAllMultiUser.Division__c = divisionSelect;
          setUpObjforAllMultiUser.Key_Field__c = keyField;
          setUpObjforAllMultiUser.Approver_Role__c = approverRole;                                            
          setUpObjList.add(setUpObjforAllMultiUser);
          // system.debug('#### setUpObjList size before upsert'+setUpObjList.size()+setupObjforDisplayList.size());
          upsert setUpObjList;
          //  system.debug('#### setUpObjList size after upsert'+setUpObjList.size());
          editReadOnlyDisplay = true;
          manageApproverLinkDisplay = true;
          checkGreenFlag();
          newpageLabel = 'PAApprovalSetup';
        }
      }
    }
    if(desiredAction.equalsIgnoreCase('dynamicLookup'))
    { 
      //  system.debug('***Inside FRB substring'+keyField.substring(0,3));
      keyFieldSetAll.clear();
      keyFieldListAll.clear();
      mapKeyField.clear();
      //  system.debug('***In dynamic lookup'+lookupofVar);                
      if(lookupOfVar == 'KeyField')
      {
        popID = true;
        // system.debug('***In keyfield dynamic'+popid);
        if(keyField == 'Country')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Country'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Country' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU]){
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          //system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        } 
        else if(keyField == 'Sales Office')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales Office'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Sales Office' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          //system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }  
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        } 
        else if(keyField == 'Sales District')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales District'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Sales District' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }  
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'End Use')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 3']; // version 1.1 modified Type__c from 'End Use' to 'Material Group 3'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Material Group 3' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])// version 1.1 modified Type__c from 'End Use' to 'Material Group 3'
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          //  system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          //  system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Material Group 1' || keyField == 'Matl grp1' || keyField == 'Matl grp 1' || keyField == 'MatGrp1')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 1']; 
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Material Group 1' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          //  system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          //  system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Market Segment')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 4'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Material Group 4' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          //
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
          //
        } 
        //<MS20140515> Added conditions for Variant and SalesOrderType START 
        else if(keyField == 'Variant'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Variant'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Variant' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          //  system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          //
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
          //
        } 
        else if(keyField == 'Sales Order Type'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales Order Type'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Sales Order Type' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }  
        else if(keyField == 'ComPartner'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'ComPartner'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'ComPartner' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }  
        //<MS20150213> Adding Key Field MG5 Key
        else if(keyField == 'Material Group 5'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 5'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Material Group 5' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }  
        else if(keyField == 'Plant'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Plant'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Plant' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        } 
        else if(keyField == 'Shipping Condition'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Shipping Condition'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Shipping Condition' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Destination Country'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Destination Country'];// version 1.1 modified Type__c from 'Market Segment' to 'Material Group 4'
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Destination Country' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          // system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          // system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }  

        //<MS20140515> Added conditions for Variant and SalesOrderType END 
        /*else if(keyField == 'PH2'){
                    system.debug('***IN PH2');
                    productHierarchyList = [SELECT Description__c, PH_Code__c FROM Product_Hierarchy__c WHERE PH_Level__c = 2];
                    Set<ID> orgJunctionIdSet = new Set<Id>();
                    for(BU_PH__c buPh : [SELECT OrgGroup__r.Business__c, Product_Hierarchy__c FROM BU_PH__c WHERE OrgGroup__r.Business__c = :selectedBU]){
                        orgJunctionIdSet.add(buPh.Product_Hierarchy__c);
                    }                                  
                    system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU) ; 
                    for(Product_Hierarchy__c e : productHierarchyList){
                        if(orgJunctionIdSet.contains(e.Id)){
                            keyFieldSetAll.add(e.PH_Code__c);
                            if(e.description__c == NULL)
                                mapKeyField.put(e.PH_Code__c, '');  
                            else
                                mapKeyField.put(e.PH_Code__c, e.description__c);  
                        }
                    }
                    system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
                    keyFieldListAll.addAll(keyFieldSetAll);
                    keyFieldListAll.sort();
                    //
                }*/
        // <HL20140910> - Start - addded condition(substring) to allow multiple PH
        else if(keyField.substring(0,2) == 'PH'){
          //system.debug('***IN PH2');
          Integer phnum = integer.valueOf((keyField.substring(2,3)));//<HL20140910>
          //productHierarchyList = [SELECT Description__c, PH_Code__c FROM Product_Hierarchy__c WHERE PH_Level__c = :phnum limit 500];

          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(BU_PH__c buPh : [SELECT OrgGroup__r.Business__c, Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.Description__c FROM BU_PH__c WHERE OrgGroup__r.Business__c = :selectedBU and Product_Hierarchy__r.PH_Level__c = :phnum]){
            //orgJunctionIdSet.add(buPh.Product_Hierarchy__c);
            keyFieldSetAll.add(buPh.Product_Hierarchy__r.PH_Code__c);
            if(buPh.Product_Hierarchy__r.description__c == NULL)
              mapKeyField.put(buPh.Product_Hierarchy__r.PH_Code__c, '');  
            else
              mapKeyField.put(buPh.Product_Hierarchy__r.PH_Code__c, buPh.Product_Hierarchy__r.description__c);
          }                                  
          //system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU) ; 
          /*for(Product_Hierarchy__c e : productHierarchyList){
                        if(orgJunctionIdSet.contains(e.Id)){
                            keyFieldSetAll.add(e.PH_Code__c);
                            if(e.description__c == NULL)
                                mapKeyField.put(e.PH_Code__c, '');  
                            else
                                mapKeyField.put(e.PH_Code__c, e.description__c);  
                        }
                    }*/
          //system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
          //
        }

        // <HL20140910> END - addded condition(substring) to allow multiple PH
        //<TJ20140426> Added code for product hierarchy as key field.
        // <HL20140910> Commented code for Key Field Product Hierarchy
        /*else if(keyField == 'Product Hierarchy')
        {
          keyFieldListAll.clear();
          system.debug('***IN PRODUCT HIERARCHY'+salesorg+'**'+selectedBU+'**'+divisionselect+'**'+distchannel);
          List<Product_Hierarchy__c> phlist=new List<Product_Hierarchy__c>();
          List<OrgGroup__c> phLevel=new list<OrgGroup__c>();
          phLevel=[select Product_Hierarchy_Level__c from OrgGroup__c where business__c=:selectedBU];
          OrgGroup__c og = new OrgGroup__c();
          if(phLevel.size() != 0)
            og = phlevel[0];
          system.debug('***PRODUCT HIERARCHY LEVEL: '+phlevel);
          List<BU_PH__c> buPHList = new List<BU_PH__c>();
          buPHList = [SELECT Id, Product_Hierarchy__c, Product_Hierarchy__r.PH_Code__c, Business_Description__c FROM BU_PH__c WHERE
                      OrgGroup__r.Business__c = :selectedBU AND Product_Hierarchy__r.PH_Level__c = :og.Product_Hierarchy_Level__c];
          //phlist = [SELECT Description__c, PH_Code__c FROM Product_Hierarchy__c WHERE PH_Level__c =:og.ph_level__c];

          system.debug('***PRODUCT HIERARCHY List: '+phList);
          Set<ID> orgJunctionIdSet = new Set<Id>();
          //for(BU_PH__c buPh : [SELECT OrgGroup__r.Business__c, Product_Hierarchy__c FROM BU_PH__c WHERE OrgGroup__r.Business__c = :selectedBU]){
          //  orgJunctionIdSet.add(buPh.Product_Hierarchy__c);
          //}                                  
          system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU) ; 
          for(BU_PH__c e : buPHList){
            if(keyFieldSetAll.size()<1000)
            {
              keyFieldSetAll.add(e.Product_Hierarchy__r.PH_Code__c);
              if(e.Business_Description__c == NULL)
                mapKeyField.put(e.Product_Hierarchy__r.PH_Code__c, '');  
              else
                mapKeyField.put(e.Product_Hierarchy__r.PH_Code__c, e.Business_Description__c);  
            }      

          }
          system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
                        }*/
        //<TJ20140426> Added code for profit center as key field.
        // <HL20140910> addded condition(substring) to allow multiple FRB
        //else if(keyField == 'Profit Center')

        else if(keyField.substring(0,3) == 'FRB')//HL20140910
        {
          system.debug('***Inside elseif with substring FRB'+keyField.substring(0,3));
          String frbnum = (keyField.substring(3,4));//HL20140910
          system.debug('***Inside elseif with frbnum:'+frbnum);
          List<Profit_Center__c> profitCenterData=new List<Profit_Center__c>();
          List<OrgGroup__c> frbLevel=[select Owning_Business__c, profit_center_level__c from OrgGroup__c where Business__c=:selectedBU];
          OrgGroup__c pcLevel=new OrgGroup__c();
          pcLevel=frbLevel[0];
          system.debug('**PCLEVEL '+pcLevel);
          //if(pcLevel.profit_center_level__c=='4')
          if(frbnum =='4')
          {
            profitCenterData.addall([SELECT ERP_Profit_Center_4__c, ERP_Profit_Center_4_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbnum and 
                ERP_Profit_Center_4__c=:pcLevel.Owning_Business__c and ERP_Profit_Center_4_Code__c != null]);
            for(Profit_Center__c pc : profitCenterData)
            {
              mapKeyField.put(pc.ERP_Profit_Center_4_Code__c, pc.ERP_Profit_Center_4__c);
              keyFieldSetAll.add(pc.ERP_Profit_Center_4_Code__c);
            }
          }
          //if(pcLevel.profit_center_level__c=='5')
          if(frbnum=='5')
          {
            profitCenterData.addall([SELECT ERP_Profit_Center_5__c, ERP_Profit_Center_5_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbnum and 
                ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_4__c=:pcLevel.Owning_Business__c]);
            for(Profit_Center__c pc : profitCenterData)
            {
              mapKeyField.put(pc.ERP_Profit_Center_5_Code__c, pc.ERP_Profit_Center_5__c);
              keyFieldSetAll.add(pc.ERP_Profit_Center_5_Code__c);
            }   
          }
          //if(pcLevel.profit_center_level__c=='6')
          if(frbnum=='6')
          {
            profitCenterData.addall([SELECT ERP_Profit_Center_6__c, ERP_Profit_Center_6_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbnum and 
                ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_6_Code__c != null and 
                ERP_Profit_Center_4__c=:pcLevel.Owning_Business__c]);
            for(Profit_Center__c pc : profitCenterData)
            {
              mapKeyField.put(pc.ERP_Profit_Center_6_Code__c, pc.ERP_Profit_Center_6__c);
              keyFieldSetAll.add(pc.ERP_Profit_Center_6_Code__c);
            }
          }
          //if(pcLevel.profit_center_level__c=='7')
          if(frbnum=='7')
          {
            profitCenterData.addall([SELECT ERP_Profit_Center_7__c, ERP_Profit_Center_7_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbnum and 
                ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_6_Code__c != null and 
                ERP_Profit_Center_7_Code__c != null and ERP_Profit_Center_4__c=:pcLevel.Owning_Business__c]);
            system.debug('PCSIZE '+profitCenterData.size());
            for(Profit_Center__c pc : profitCenterData)
            {
              mapKeyField.put(pc.ERP_Profit_Center_7_Code__c, pc.ERP_Profit_Center_7__c);
              keyFieldSetAll.add(pc.ERP_Profit_Center_7_Code__c);
            }
          }
          //if(pcLevel.profit_center_level__c=='8')
          if(frbnum=='8')
          {
            profitCenterData.addall([SELECT ERP_Profit_Center_8__c, ERP_Profit_Center_8_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbnum and 
                ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_4_Code__c != null and ERP_Profit_Center_6_Code__c != null and 
                ERP_Profit_Center_7_Code__c != null and ERP_Profit_Center_8_Code__c != null and ERP_Profit_Center_4__c=:pcLevel.Owning_Business__c]);
            for(Profit_Center__c pc : profitCenterData)
            {
              mapKeyField.put(pc.ERP_Profit_Center_8_Code__c, pc.ERP_Profit_Center_8__c);
              keyFieldSetAll.add(pc.ERP_Profit_Center_8_Code__c);
            }
          }      
          //if(pcLevel.profit_center_level__c=='9'||pcLevel.profit_center_level__c=='10')
          if(frbnum=='9'|| frbnum=='10')
          {
            profitCenterData.addall([SELECT ERP_Profit_Center_9__c, ERP_Profit_Center_9_Code__c FROM Profit_Center__c WHERE Final_Level__c = :frbnum and 
                ERP_Profit_Center_5_Code__c != null and ERP_Profit_Center_6_Code__c != null and ERP_Profit_Center_7_Code__c != null and 
                ERP_Profit_Center_8_Code__c != null and ERP_Profit_Center_9_Code__c != null and ERP_Profit_Center_4_Code__c != null and 
                ERP_Profit_Center_4__c=:pcLevel.Owning_Business__c]);
            for(Profit_Center__c pc : profitCenterData)
            {
              mapKeyField.put(pc.ERP_Profit_Center_9_Code__c, pc.ERP_Profit_Center_9__c);
              keyFieldSetAll.add(pc.ERP_Profit_Center_9_Code__c);
            }
          }
          system.debug('***list map'+keyFieldSetAll.size()+'-'+mapKeyField+'**PCD '+profitCenterData);
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }      
        else if(keyField == 'Sales Org'){
          //For Sales Org prepolpulate the current sales org
          keyFieldSetAll.add(salesOrg);
          mapKeyField.put(salesOrg, salesOrgDisplay.split('-')[1]);  
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        //<PS20130417> Ver 1.5 PS 2013-04-17 APAC Rollout-adding Customer Group 2 fetching all the customer group 2 codes from ERP_Customer_Material_Key__c object based on that BU and sales area
        else if(keyField == 'Customer Group 2')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Customer Group 2'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Customer Group 2' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg /* AND Organizational_Group_Item__r.orgGroup__r.ERP_Distribution_Channel_Code__c = :distChannel AND Organizational_Group_Item__r.orgGroup__r.ERP_Division_Code__c = :divisionSelect*/])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size())    ; 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();  
        }
        
        //Piyush <PG20191211> Start
        //adding Customer Group 4 fetching all the customer group 4 codes from ERP_Customer_Material_Key__c object based on that BU and sales area
        else if(keyField == 'Customer Group 4')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Customer Group 4'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Customer Group 4' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg /* AND Organizational_Group_Item__r.orgGroup__r.ERP_Distribution_Channel_Code__c = :distChannel AND Organizational_Group_Item__r.orgGroup__r.ERP_Division_Code__c = :divisionSelect*/])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          //Piyush <PG20191211> end
            system.debug('***orgId'+orgJunctionIdSet.size()+selectedBU+erpCustMatKeyList.size()); 
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();  
          system.debug('***PG keyFieldListAll'+keyFieldListAll);
        }
        
        //Start:- <GT20140828>
        else if(keyField == 'Reason Code'){
          Organizational_Group_Item__c orgGrp = [SELECT Customer_Request_Reasons__c,Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Reasons__c,Project_Request_Reasons__c FROM Organizational_Group_Item__c where Business__r.Business__c = :selectedBU and orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg];
          for(String reason :(orgGrp.Customer_Request_Reasons__c+';'+orgGrp.Non_Customer_Permanent_Request_Reasons__c+';'+orgGrp.Pricing_Task_Reasons__c+';'+orgGrp.Project_Request_Reasons__c).split(';'))
          {   
            if(reason.length()>5)
            {
              keyFieldSetAll.add(reason.substring(0,4));
              mapKeyField.put(reason.substring(0,4), reason.substring(5,reason.length()));  
            }
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Payer'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Payer'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Payer' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Partner ZF'){
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Partner ZF'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Partner ZF' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU AND Organizational_Group_Item__r.orgGroup__r.ERP_Sales_Org_Code__c = :salesOrg])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList){
            if(orgJunctionIdSet.contains(e.Id)){
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Campaign')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Campaign'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Campaign' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }  
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'Document Currency')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Document Currency'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'Document Currency' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }  
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        else if(keyField == 'State')
        {
          erpCustMatKeyList = [SELECT type__c, Code__c, Name__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'State'];
          Set<ID> orgJunctionIdSet = new Set<Id>();
          for(Org_Group_ERP_Key__c orgGrpERP : [SELECT ERP_Cus_Mat_Compt_Key__c, Organizational_Group_Item__r.Business__r.Business__c  FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.type__c = 'State' AND Organizational_Group_Item__r.Business__r.Business__c = :selectedBU])
          {
            orgJunctionIdSet.add(orgGrpERP.ERP_Cus_Mat_Compt_Key__c);
          }                                  
          for(ERP_Customer_Material_Key__c e : erpCustMatKeyList)
          {
            if(orgJunctionIdSet.contains(e.Id))
            {
              keyFieldSetAll.add(e.Code__c);
              keyFieldSetAll.add(e.Code__c);
              if(e.Name__c == NULL)
                mapKeyField.put(e.Code__c, '');  
              else
                mapKeyField.put(e.Code__c, e.Name__c);  
            }  
          }
          keyFieldListAll.addAll(keyFieldSetAll);
          keyFieldListAll.sort();
        }
        //End:-<GT20140828>
      }
      if(lookupOfVar == 'Approver')
      {
        system.debug('****'+allothermixedlookup);
        popApprover = true;
        errorMessageFlag = false;
        if(allotherMixedLookup == ' ' || allotherMixedLookup == NULL)
        {
          system.debug('***First if');
          //Checking if key  field is selected or not
          for(Integer i=0; i<=setupObjforDisplayList.size();i++)
          {
            if((i == setupObjforDisplayList.size()-1   && !(setupObjforDisplayList[0].Key_Field_ID__c != NULL && setupObjforDisplayList[0].Approver_Id__c == NULL))|| setupObjforDisplayList.size() == 0)
            {
              ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.label.No_Key_Field_Id_Error);  
              ApexPages.addMessage(myMsg);
              errorMessageFlag = true;
              popApprover = false;
              break;                   
            }               
          }
        }
        system.debug('***Value of all other lookup'+allotherMixedLookup+errorMessageFlag);
        if(!errorMessageFlag || (allotherMixedLookup <> ' ' && allotherMixedLookup <> NULL))
        {         
          set<Id> approverUserList = new set<Id>();
           //<MG20161207> -- Added where condition in below query - IS ID-00077055
          for(Organizational_Group_User__c orgUser : [SELECT Related_User__c, OrgGroup__c, OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Distribution_Channel_Code__c, OrgGroup__r.ERP_Division_Code__c FROM Organizational_Group_User__c WHERE Organizational_Group_Item__r.Business__r.Business__c = :selectedBU]){
            if((orgUser.OrgGroup__r.ERP_Sales_Org_Code__c+orgUser.OrgGroup__r.ERP_Distribution_Channel_Code__c+orgUser.OrgGroup__r.ERP_Division_Code__c) == (salesOrg+distChannel+divisionSelect))
              approverUserList.add(orgUser.Related_User__c);
          }
          system.debug('**** check appr'+ approverUserList.size());
          system.debug('**** check appr size'+ approverUserList.size());
          set<Id> uniqueId = new set<Id>();
          //get permission set id 
          List<PermissionSetAssignment> psa = new List<PermissionSetAssignment>();
          psa = [SELECT Id FROM PermissionSetAssignment WHERE 
                 PermissionSetId IN (SELECT Id FROM PermissionSet WHERE Name =:PAProfilePermissions__c.getInstance('Approver').API_Name__c)];
          system.debug('**** check per list'+ psa);
          system.debug('**** check per list size'+ psa.size());
          List<PermissionSetAssignment> permAss = [Select AssigneeId From PermissionSetAssignment where Id IN :psa AND AssigneeId IN:approverUserList];
          system.debug('**** check per in list'+ permAss);
          system.debug('**** check per in list size'+ permAss.size());
          List<Id> allAssigneeIds = new List<Id>();
          for(PermissionSetAssignment per:permAss)
          {
            allAssigneeIds.add(per.assigneeId);
          }
          system.debug('**** check allassignedids'+ allAssigneeIds);
          system.debug('**** check allassignedids size'+ allAssigneeIds.size());
          uniqueId.addAll(allAssigneeIds);
          //<PR20140901> START
          userList = [select E_Pass_Id__c, Name, FirstName, LastName from User where isactive = true AND Id IN :uniqueId order by FirstName];

          //if(keyField == 'Country'){
          if(!(allotherMixedLookup == 'allothervalues' || allotherMixedLookup == 'mixedvalues')){
            User u = new User(E_Pass_ID__c = 'NA',FirstName = 'Not Required',Id = '0051300000Basdf',LastName = '');
            userList.add(u);
          }      
          //}
          //<PR20140901> END
          system.debug('**** user'+userList);
          system.debug('**** 123'+userList.size());
        }
      }
    }
    if(desiredAction.equalsIgnoreCase('deleteSetupObj'))
    {
      system.debug('&&&&&&&&&&&&&'+setupObjId);
      for(Integer i=0; i<setupObjforDisplayList.size(); i++)
      {
        if((setupObjId == NULL || setupObjId == '')&&setupObjforDisplayList[i].id == NULL){
          setupObjforDisplayList.remove(i);
          break;            
        }
        system.debug('***Check'+ setupObjId+'***'+ setupObjforDisplayList[i].id);
        if(setupObjId <> NULL && setupObjId <> '')
        {
          if(setupObjforDisplayList[i].id == setupObjId)
          {
            delete setupObjforDisplayList[i];
            setupObjforDisplayList.remove(i);
            break;            
          }
        }   
      }
    }
    //To provide the help in the Key field search.
    if(desiredAction.equalsIgnoreCase('searchKeyField'))
    {
      action('PAManageApprover', 'PAManageApprover', 'dynamicLookup');
      keyFieldSetAllTemp.clear();
      for(String key : keyFieldSetAll){
        if(key.startsWithIgnoreCase(keyFieldIdSearch) &&
            mapKeyField.get(key).startsWithIgnoreCase(keyFieldValueSearch))
        {
          keyFieldSetAllTemp.add(key);
        }
      }
      keyFieldSetAll.clear();
      //
      keyFieldListAll.clear();            
      keyFieldSetAll.addAll(keyFieldSetAlltemp);
      //
      keyFieldListAll.addAll(keyFieldSetAll);
      keyFieldListAll.sort();
      //
    }
    return newPageLabel;
  }
  public List<SelectOption> getlistOptions(){
    List<SelectOption> buSelectOptions = new List<SelectOption>();
    for(OrgGroup__c p : [select id,Business__c,RecordType.Name, ERP_Distribution_Channel_Code__c, ERP_Distribution_Channel__c, ERP_Division__c, ERP_Division_Code__c, ERP_Sales_Org__c ,ERP_Sales_Org_Code__c FROM OrgGroup__c WHERE RecordType.Name = 'Business']){
      buSelectOptions.add(new SelectOption(p.Business__c,p.Business__c));
    }   
    system.debug('****List options'+buSelectOptions);
    return buSelectOptions;      
  }
  public List<SelectOption> getApproverRoles(){
    List<SelectOption> approverRoleList = new List<SelectOption>();
    Schema.DescribeFieldResult fieldResultApprovalRole = PA_BU_Admin_Detail__c.Approver_Role__c.getDescribe();
    List<Schema.PicklistEntry> pickListValues = fieldResultApprovalRole.getPicklistValues();                        
    approverRoleList.add(new SelectOption('--None--','--None--'));
    for(Schema.PicklistEntry ple : pickListValues){
      approverRoleList.add(new SelectOption(ple.getLabel(),ple.getValue()));        
    } 
    approverRoleList.add(new SelectOption('Final Approver','Final Approver'));
    return approverRoleList;
  }
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
    adminMaster = new PA_BU_Admin_Master__c();
    detailWrapObjectList = new List<PAWrapper>();
    adminMasterWrapperList = new List<PAWrapper>();
    setupObjforDisplayList = new List<Setup_Object__c>();
    setUpObjforAllMultiUser = new Setup_Object__c();
    keyFieldSetAll = new set<String>();
    //
    keyFieldListAll = new List<String>();
    mapKeyField = new map<string, string>();
    action(' ', ' ', ' ');
    List<PARelatedList> clsRList = new List<PARelatedList>();
    PARelatedList c = new PARelatedList();
    //HL20140918 changed the key combination and Sobjecttype to detail object      
    c.keyCombinationColumns =(Schema.SObjectType.PA_BU_Admin_Detail__c.fieldsets.getMap().get('PAApprovalSetupFields').getFields());
    system.debug('****RelatedList keyCombinationColumns'+c.keyCombinationColumns);
    c.sObjectTypeName=PA_BU_Admin_Detail__c.sObjectType.getDescribe().getName().toLowerCase();
    c.wrapperList = new List<PAWrapper>(); 
    for(PAWrapper pri: adminMasterWrapperList)
    { 
      c.wrapperList.add(pri);
    }
    clsRlist.add(c);
    system.debug('****RelatedList'+clsRList+'wrapperList'+adminMasterWrapperList);
    system.debug('****c.sObjectTypeNamec.sObjectTypeName'+c.sObjectTypeName);
    system.debug('****RelatedList wrapperList'+adminMasterWrapperList);
    system.debug('****RelatedList wrapperList'+adminMasterWrapperList.size());

    if(adminMasterWrapperList.size()>0)
    {
      if(adminMasterWrapperList.size()>=400)
        nextPage = true;
      else
        nextPage = false;   


    }
    if(offsets!=null && offsets>0)
    {
      fromSet = offsets+1;
      prevPage = true;
      if(adminMasterWrapperList.size()<400)
        toSet = offsets+adminMasterWrapperList.size();
      else
        toSet = offsets+400;
    }
    else
    {
      fromSet = 1;
      toSet = adminMasterWrapperList.size();
      prevPage = false;
    }
    if(adminMasterWrapperList.size()>=400)
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,'Search returned too many records, please use filers to refine the results'));


    return clsRList;
  }
  public List<sObject> getListBusinessComponents(){
    List<sObject> sObjList = new List<sObject>();
    return sObjList;
  }
}