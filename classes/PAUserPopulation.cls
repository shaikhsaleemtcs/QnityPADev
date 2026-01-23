/*
 * Name     :   PAUserPopulation
 * Description  :   This class is used to show available users for onBehalf Of
 * Author     :   Infosys Limited
 * Created Date :   28-01-2013
 *
 * Version    Modified Date     Modified By   Modification
 * -------------------------------------------------------------
 * 1.1      20-Feb-2013     Bala      Added condition to skip the logged in user in the pop up
 * 1.2      20-Feb-2013     Bala      Added query to populate Users based on salesArea  
 * 1.3      02-Mar-2013     Prachi      Added filters to the where clause  
 * 1.4      07-Mar-2013     Bala      Added where clause condition isActive = true
 * 1.5      12-Mar-2013     Bala      Added logic to populate user considering BU,SA(selected)
 * 1.6      15-Mar-2013     Bala      Added logic for assigned To
 * 1.7      28-Mar-2016     Nadeem    Added logic for DPT NA BU to pull BU Admins who are approvers in the reassignment users list
 */
/****************************************************************************************************************
 **********************************************Modification Log**************************************************
 Last Modified By    :   Nadeeem S
 Last Modified Date  :   28 Mar 2016
 Description         :   IS ID-00067716 - Updated SOQL query for fixing issue related to BU Admins not visible in DPT NA BU.

 *****************************************************************************************************************/
 
public without sharing class PAUserPopulation implements IPAComponent
{
 
 public List<User> allSalesReps{get;set;}//transient
//<PP20140603> START
 private boolean isPopUpDisp = true;


 public boolean isDispOnLoad
 {
  get;
  /*{
    if(isDispOnLoad == null) 
      {  
        isDispOnLoad = false;
      }
      
      return isDispOnLoad;
  }*/
  set;
}
//<PP20140603> END
  public boolean display{get;set;}
  public boolean displayTableOnSearch{get;set{
  System.debug('displayTableOnSearch Setting value:-'+value);
  displayTableOnSearch = value;
  }}
  public string buSelectedFromPage{get;set;}
  //adding filter variables
  public string filter_name {get;set;}
  public String filter_email {get;set;}
  public String filter_country{get;set;}
  public String filter_sapId {get;set;}
  public String filter_epassId{get;set;}
  public list<string> listOfFilters {get;set;}
  public map<string,string> mapOfFilters {get;set;}
  public string whereClause {get;set;}
  public string query {get;set;}
  public string salesOrgCodeFromPage{get;set;}
  public string distCodeFromPage{get;set;}
  public string divisionCodeFromPage{get;set;}
  public boolean displaySearchFilters{get;set;}
  
  public boolean displayLookUp{get;set;}
 public string assignedToFromPage
 {
   get;
   set
   { 
     //<SP20140604> START
     assignedToFromPage = value;
     system.debug('*** SETTER assignedToFromPage -- '+assignedToFromPage);
     if(!string.isBlank(value) && (value == 'reassign' || value == 'delegate') && isPopUpDisp == true && !string.isBlank(salesOrgCodeFromPage) && !string.isBlank(distCodeFromPage) && !string.isBlank(divisionCodeFromPage))
     {
       display = true;
       dosearch();
       isPopUpDisp = false;
     }
     if(!string.isBlank(value) && value == 'massreassign' && !string.isBlank(salesOrgCodeFromPage) && !string.isBlank(distCodeFromPage) && !string.isBlank(divisionCodeFromPage)){
       display = true;
       dosearch();
       isPopUpDisp = false;
     }
     //<SP20140604> END
   }
 }
  public PAUserPopulation()
  {
  }
  /*
   * Author     : 
   * Method Name  :   action
   * Parameters   :   
   * Return type  :   PageReference
   * Description  :   
   */
  public PageReference action()
  {
    return null;
  } 

  /*
   * Author     : 
   * Method Name  :   displayPopUpWindowMethod
   * Parameters   :  
   * Return type  :   PageReference
   * Description  :   
   */
  public PageReference displayPopUpWindow()
  {
    display = true;
    if(!String.isBlank(assignedToFromPage) && (assignedToFromPage.equalsIgnoreCase('reassign') || assignedToFromPage.equalsIgnoreCase('delegate')))
    {
      displayTableOnSearch = true;
    }
    //<MS20140926> Adding condition for display list on lookup
    if(displaySearchFilters==false)
    {
      dosearch();
    }
    return null;
  }

  /*
   * Author     : 
   * Method Name  :   searchCustomer
   * Parameters   :  
   * Return type  :   PageReference
   * Description  :   
   */
  public PageReference dosearch()
  {
    return salesRepList();
  }
  /*
   * Author     : 
   * Method Name  :   returnData
   * Parameters   :  
   * Return type  :   PageReference
   * Description  :   
   */
  public  PageReference returnData()
  {
    displayTableOnSearch=false;
    return closeAction();
  }

  /*
   * Author     : 
   * Method Name  :   closeWindow
   * Parameters   :  
   * Return type  :   PageReference
   * Description  :   
   */
  public PageReference closeWindow()
  {
    displayTableOnSearch=false;
    return closeAction();
  }
  //close window
  private PageReference closeAction()
  {
    display = false;
    displayLookUp = false;
    return null;
  }
  //public method for onBehalfOf User generation
  private PageReference salesRepList()
  {
    listOfFilters= new list<string>();
    mapOfFilters= new map<string,string>();
    if(filter_name==null || filter_name=='')
    {
      filter_name='';
    }
    else
    {
      listOfFilters.add('filter_name');
      mapOfFilters.put('filter_name','Name like \'%'+ String.escapeSingleQuotes(filter_name.trim()) + '%\'  ');
    }
    //filter email
    if(filter_email==null || filter_email=='')
    {
      filter_email='';
    }
    else
    {
      listOfFilters.add('filter_email');
      mapOfFilters.put('filter_email','email like \''+ String.escapeSingleQuotes(filter_email.trim())+   '%\'  ');
    }
    //filter country
    if(filter_country==null || filter_country=='' || filter_country=='--Select--')
    {
      filter_country='';
    }
    else
    {
      listOfFilters.add('filter_country');
      mapOfFilters.put('filter_country','User_Country__c like \''+ String.escapeSingleQuotes(filter_country.trim()) + '%\'  ');
    }
    //filter SAP Id
    if(filter_sapId==null || filter_sapId=='' || filter_sapId=='--Select--')
    {
      filter_sapId='';
    }
    else
    {
      listOfFilters.add('filter_sapId');
      mapOfFilters.put('filter_sapId','External_ERP_ID__c like \''+ String.escapeSingleQuotes(filter_sapId.trim()) + '%\'  ');
    }
    //filter E-Pass id
    if(filter_epassId==null || filter_epassId=='' || filter_epassId=='--Select--')
    {
      filter_epassId='';
    }
    else
    {
      listOfFilters.add('filter_epassId');
      mapOfFilters.put('filter_epassId','E_Pass_ID__c like \''+ String.escapeSingleQuotes(filter_epassId.trim()) + '%\'  ');
    }
    Id loggedInUserId = Userinfo.getUserId();
    List<String> salesAreaSelected = new List<String>();
    system.debug('\n\n\n test salesOrgCodeFromPage '+salesOrgCodeFromPage +''+divisionCodeFromPage +''+distCodeFromPage);
    if(!String.isBlank(salesOrgCodeFromPage) && !String.isBlank(divisionCodeFromPage) && !String.isBlank(distCodeFromPage))
    {
      if(assignedToFromPage != 'massreassign'){
        OrgGroup__c salesAreaSel = [SELECT id FROM OrgGroup__c WHERE ERP_Sales_Org_Code__c=:salesOrgCodeFromPage
                           AND ERP_Distribution_Channel_Code__c=:distCodeFromPage AND
                           ERP_Division_Code__c=:divisionCodeFromPage limit 1];
        if(salesAreaSel != null)
          salesAreaSelected.add(salesAreaSel.id);                     
      }else if(assignedToFromPage.equalsIgnoreCase('massreassign')){
        List<String> salesOrgs = salesOrgCodeFromPage.split(',');
        List<String> distCodes = distCodeFromPage.split(',');
        List<String> divCodes = divisionCodeFromPage.split(',');
        
        List<OrgGroup__c> salesAreaList = [SELECT id FROM OrgGroup__c WHERE ERP_Sales_Org_Code__c IN :salesOrgs
                                       AND ERP_Distribution_Channel_Code__c IN :distCodes AND
                                       ERP_Division_Code__c IN :divCodes];
        for(OrgGroup__c sa:salesAreaList){
          salesAreaSelected.add(sa.id);
        }                     
      }
                           
    }
    system.debug('@@@ sales area selected'+salesAreaSelected);
    List<Organizational_Group_User__c> orgGroupUser;
    //adding description field //we need have this condition query - bala
    if(salesAreaSelected!=null && salesAreaSelected.size()>0)
      orgGroupUser = [SELECT OrgGroup__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c,Description__c,
                      OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c=:loggedInUserId
                      AND OrgGroup__c IN :salesAreaSelected AND Organizational_Group_Item__r.Business__c=:buSelectedFromPage]; //Shiva - added "AND Organizational_Group_Item__r.Business__c=:buSelectedFromPage" condition                  
    else
      // getting sales area from OrgGroup Users 
      orgGroupUser = [SELECT OrgGroup__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c,Description__c,
                      OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c=:loggedInUserId AND Organizational_Group_Item__r.Business__c=:buSelectedFromPage]; //Shiva - added "AND Organizational_Group_Item__r.Business__c=:buSelectedFromPage" condition

    system.debug('@@@ orgGroup User'+orgGroupUser);
    List<Id> allOrgGroups = new List<Id>();
    for(Organizational_Group_User__c orgUser:orgGroupUser)
    {
      allOrgGroups.add(orgUser.OrgGroup__c);
    }

    system.debug('@@@ allOrgGroups'+allOrgGroups);
    //12-mar-2013 - bala
    Map<Id,Organizational_Group_Item__c> buSaList = new Map<Id,Organizational_Group_Item__c>([select id from Organizational_Group_Item__c where Business__c=:buSelectedFromPage
                                                                                              AND OrgGroup__c IN:allOrgGroups]);

    List<string> salesRepCodes = new List<string>();
    salesRepCodes.add('ZU');
    List<Organizational_Group_User__c> orgGroupUserList;
    system.debug('@@@ assignedtopage'+assignedToFromPage);
    if(String.isBlank(assignedToFromPage))
    {
      //get all the users for tht sales Areas/sales Area where description is ZU
      orgGroupUserList = [SELECT Related_User__c FROM Organizational_Group_User__c WHERE 
                          organizational_Group_item__c IN :busaList.keySet()
                          AND Description__c IN :salesRepCodes];
            system.debug('@@@ orgGroupUserList234'+orgGroupUserList);
    }
    else
    {
      orgGroupUserList = [SELECT Related_User__c FROM Organizational_Group_User__c WHERE 
                          organizational_Group_item__c IN :busaList.keySet()];
            system.debug('@@@ orgGroupUserList###'+orgGroupUserList);
    }
    system.debug('@@@ orgGroupUserList'+orgGroupUserList);
    //users available 
    List<Id> userIdList = new List<Id>();
    for(Organizational_Group_User__c org:orgGroupUserList)
    {
      userIdList.add(org.Related_User__c);
    }
    system.debug('@@@ userIdList'+userIdList);
    //commmenting prachi
    //UAT #153
    set<Id> uniqueId = new set<Id>();
    if(!String.isBlank(assignedToFromPage) && (assignedToFromPage.equalsIgnoreCase('reassign') || assignedToFromPage.equalsIgnoreCase('delegate') || assignedToFromPage.equalsIgnoreCase('massreassign')))
    {
      //get permission set id 
      List<PermissionSetAssignment> psa = new List<PermissionSetAssignment>();
      psa = [SELECT Id FROM PermissionSetAssignment WHERE 
             PermissionSetId IN (SELECT Id FROM PermissionSet WHERE Name =:PAProfilePermissions__c.getInstance('Approver').API_Name__c)];
      Set<Id> buAdminIdSet = new Set<Id>();
      String buAdminProfile = PAProfilePermissions__c.getInstance('BU Admin').Name__c;
      List<User> buAdminList = new List<User>();
      buAdminList = [SELECT Id FROM User WHERE Profile.Name = :buAdminProfile];
      for(User bu : buAdminList)
      {
        buAdminIdSet.add(bu.Id);
      }
             
         List<PermissionSetAssignment> permAss1=[Select AssigneeId From PermissionSetAssignment where Id IN :psa AND AssigneeId IN:userIdList];
         system.debug('@@@ permAss1'+permAss1);
         // Updated by <<Nadeem S>> for <<Issue number:IS ID-00067716>> on <<28-03-2016>> START
         system.debug('@@@ buAdminIdSet'+buAdminIdSet);
         system.debug('@@@ buSelectedFromPage'+buSelectedFromPage);
         boolean PrBusiness = false;
         List<PermissionSetAssignment> permAss;     
         List<OrgGroup__c> PrBu = [SELECT Business__c FROM OrgGroup__c WHERE OrgGroup__c.id=:buSelectedFromPage];
         system.debug('@@@ PrBu'+PrBu);
       
        for(OrgGroup__c OgBu : PrBu)
      {
       if(OgBu.Business__c=='DPT NA'){
       PrBusiness = true;}
      }
         if(PrBusiness){
           permAss = [Select AssigneeId From PermissionSetAssignment where Id IN :psa AND AssigneeId IN:userIdList];
        }
        else{
           permAss = [Select AssigneeId From PermissionSetAssignment where Id IN :psa AND AssigneeId IN:userIdList
                          AND AssigneeId NOT IN :buAdminIdSet]; }
        
        // Updated by <<Nadeem S>> for <<Issue number:IS ID-00067716>> on <<28-03-2016>> END 
      List<Id> allAssigneeIds = new List<Id>();
      for(PermissionSetAssignment per:permAss)
        allAssigneeIds.add(per.assigneeId);

      if(assignedToFromPage.equalsIgnoreCase('delegate'))
        allAssigneeIds.add(UserInfo.getUserID());

      uniqueId.addAll(allAssigneeIds);
    } 
        system.debug('@@@ userListReassign##'+uniqueId);
    //if no filters,then display all the values
    if(listOfFilters.size()==0)
    {  
      //UAT #153
      if(!String.isBlank(assignedToFromPage) && (assignedToFromPage.equalsIgnoreCase('reassign') || assignedToFromPage.equalsIgnoreCase('delegate') || assignedToFromPage.equalsIgnoreCase('massreassign')))

        allSalesReps = [Select id,Name,FirstName,LastName,E_Pass_ID__c,External_ERP_ID__c,User_Country__c,email,isActive From User u 
                        where IsActive=true AND Id IN:uniqueId  order by FirstName];
      else
        //1.4 Bala
        allSalesReps = [SELECT Id,Name,FirstName,LastName,E_Pass_ID__c,External_ERP_ID__c,User_Country__c,email,isActive FROM User WHERE id IN:userIdList
                        AND IsActive=true order by FirstName];

      if(allSalesReps.size()>100)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Search returns more then 100 records,Please use Filters'); 
        ApexPages.addMessage(myMsg); 
        displayTableOnSearch=true;
      }
      else if(allSalesReps.size()==0)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No records Found'); 
        ApexPages.addMessage(myMsg); 
        displayTableOnSearch=false;
      }  
      else
      {   
        displayTableOnSearch=true;
      }
    }

    else
    {
      whereClause=' where ';
      for(integer i=0;i<listOfFilters.size();i++)
      {   
        if(i!=listOfFilters.size()-1)
          whereClause=whereClause+' '+mapOfFilters.get(listOfFilters[i])+' '+' AND ';
        else
          whereClause=whereClause+' '+mapOfFilters.get(listOfFilters[i]);
      }
      if(!String.isBlank(assignedToFromPage) && (assignedToFromPage.equalsIgnoreCase('reassign') || assignedToFromPage.equalsIgnoreCase('delegate')))
        //UAT issue # 153
        query='SELECT Id,Name,FirstName,LastName,E_Pass_ID__c,External_ERP_ID__c,User_Country__c,email,isActive FROM User' +whereClause + 'AND id IN:uniqueId AND isActive=true order by FirstName limit 101';
      else
        //1.4 Bala
        query='SELECT Id,Name,FirstName,LastName,E_Pass_ID__c,External_ERP_ID__c,User_Country__c,email,isActive FROM User' +whereClause + 'AND id IN:userIdList AND isActive=true order by FirstName limit 101';
      system.debug('@@@123 query:'+query);
      allSalesReps =database.query(query);        
      if(allSalesReps.size()>100 ) 
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more then 100 records,Please use Filters.'); 
        ApexPages.addMessage(myMsg);
        displayTableOnSearch=false; 
      }
      else if(allSalesReps.size()==0)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
        ApexPages.addMessage(myMsg);
        displayTableOnSearch=false;
      } 
      else
      {  
        displayTableOnSearch=true; 
      }
    }
    return null;
  }
}