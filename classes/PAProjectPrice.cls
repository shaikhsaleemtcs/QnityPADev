/*
 * Name      :   PAProjectPrice
 * Description  :   This class acts as a controller to the Container Page
 * Author      :   Infosys Limited
 * Created Date :   16-01-2013
 *
/*   Ver.                     Developer                           Changes                                          Dependancies
---------------------------------------------------------------------------------------------------------------------------------------*/
//  1.                         Anand                              Class                                                 None
//  1.1                          anand                              NoRecordLevel Change                                    none
//  1.2                          anand                              checkRequestAndProjectStatus, all, current              none    
//  1.3                          anand                              AddMaterialTORequest & validation                       none
//  1.4                          anand                              added validation for Max length on Project Description  none
//  1.5                          anand                            plus/minus validation for discount                        none    
//  1.6                       anand                           Edited Matterial query (cluster,Rtype)                none
//  1.7                          anand                              added offset validation                                 none
//  1.8                          anand                              added try catch for upsert reqItem                      none
//  1.9                          anand                            added two variables to render project details             none
//  2.0                          Shiva                            Added the logic for getting lastest approved records      none
//  2.1                          Bala                               Changed wrt new RelatedList                             none
//  2.2                       Anand                             done button display                                     none
//  2.3                          Anand                              added validation for Invalid decimal                    none
//  2.4                          Neeharika                          added SFDC Description for KC                           None    4  MAR
//  2.5                          anand                              added KC ID in erpSAp method,try catch while upserting  NONE    5  MAR
//  2.6                          anand                            added soldto Code to insert Request method              None  6  MAR 
//  2.7                          shiva                              modified Ph query                                       None    9  MAR
//  2.8                       anand                             added OnBehaf of for project while insert               None    9  MAR  
//  2.9                          Neeharika                          added sfdc KC desc in getListWrapper method             None    11 MAR  
//  3.0                          Shiva                              change in PH query                                      None    13 MAR
//  3.1                          anand                              binded plus_minus field in reqestItem                   None    14 mar  
//  3.2                         Prachi                              Assigned to code                                        None
//  3.3                       anand                             removed validation for +ve -ve of default discount    None  19 MAR      
//  3.4                          anand                              added logic for Edit only Discount and click Next navigation    21 MAR 
//  3.5                       anand                           updated flag project header approval flag            None 25 MAR
//  3.6                          Anand                              Added soldto_code__c and project_Header_Approval_flag__c
//                                                                                       in the query(4 places)             None    25 MAR
//  3.7                       anand                           added round off logic for discount                        None    26 MAR 
//  3.8                       anand                           added locale for project                              None    28 MAR 
//  3.9                       anand                           added warning message for round off for discount issue # 154 NONe 28 MAR  
//  4.0                       anand                           removed the refrence of PAShrt Helper                 None    3 APR           
//  4.1                       Shiva                             Added code for additional KC filters                None    23 Apr
//  4.2                       Prachi                          Changed input text area to input text                 None    28 MAY   
//  4.3                       Mansi                           Added logic to avoid Default discount error           None    15 Mar 2016

/***********************************************Modification Log************************************************
<PS20130424>
Last Modified By    :   Prachi Sinha
Last Modified Date  :   24 Apr 2013
Description         :   1)Upsert in insertRequest() method-APAC Roll Out1(4.1)
                        2)Added a variable - editHeaderApproved-APAC Roll Out1(4.2)
 *****************************************************************************************************************
<PP20130424>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 Apr 2013
Description     :   Added logic to populate 'Display Standardized Rate' into Pricing Request from
                        Organizational Group Item - APAC ROLLOUT1(4.3)
 *****************************************************************************************************************
<VR20130509>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   09 May 2013
Description         :   Added Logic for extra key field Customer Hierarchy - APAC ROLLOUT1(4.4)
 *****************************************************************************************************************
<VR20130510>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   10 May 2013
Description     :   AModified Material Query to query basedon variable config field - APAC ROLLOUT1(4.5)
 *****************************************************************************************************************
<BR20130510>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   10 May 2013
Description     :   Added logic to populate 'Attachment on Customer Prices' into Pricing Request from
                        Organizational Group Item - APAC ROLLOUT1(4.6)
 *****************************************************************************************************************
<PP20130715>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 July 2013
Description         :   Added 'Request_Class__c' field to Pricing Request queries and 'Enable_Request_Class__c',
                                         'Request_Class__c' in Org Group Item - APAC ROLLOUT2(4.8)
 ***********************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(4.9) 
 ***********************************************************************************************************************
<UD20130827>
Last Modified By    :      Utkarsh Dixit
Last Modified Date  :      27 aug 2013
Description         :      Production Issue: Issue #IS ID-00035105. Added Display_Standardized_rate__c in Org groupitems queries
 *****************************************************************************************************************
<PP20131028>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   28 October 2013
Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
 *****************************************************************************************************************
<PP20131115>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 November 2013
Description         :   DTT Rollout Issue - Changing daysbetween/30 to monthsBetween because validation is not working
                                               properly 
 *****************************************************************************************************************
<PP20131231>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   31 December 2013
Description         :   DTT Rollout Enhancement - Populating 'Standardized Currency' and 'Standardized UoM' from
                                        Organization Group Item to Request
 *****************************************************************************************************************
 <SP20140428>
 Last Modified By    :   Shiva
 Last Modified Date  :   28 Apr 2014
 Description         :   CAPITAL PROJECT - For Config and Non Config materials
 *****************************************************************************************************************
 <SP20140520>
 Last Modified By    :   Shiva
 Last Modified Date  :   20 May 2014
 Description         :   CAPITAL PROJECT - For New PH Search component  
 *****************************************************************************************************************
<MG20160303>
 Last Modified By    :   Mansi Gupta
 Last Modified Date  :   15 March 2016
 Description         :   Default Discount fix   
 
  *****************************************************************************************************************
<SS20220826>
 Last Modified By    :   Shantanu Sharma
 Last Modified Date  :   26 August 2022
 Description         :   Added logic to include Sales Order Item  
 
  *****************************************************************************************************************
<SS20230501>
 Last Modified By    :   Shantanu Sharma
 Last Modified Date  :   01 May 2023 
 Description         :   Added logic to include P80 M&M Feilds 
****************************************************************************************************************/


public  class PAProjectPrice implements IPAServiceComponent
{ 

  /* ******************Private Variables *************************/
  private boolean newRequestFlag;
  private boolean newProjectFlag;

  private Project_Price__c privateproject;
  private List<String> splitSelectedMaterialList;
  private static boolean checkActionExecuted=false;
  private String sourceCluster;
  private Map<String,String> tempStorageMap; // used to store the locale separator ver 3.8
  private String separator;

  /* ******************Public Variables *************************/
  public PARequest currentRequest {get;set;}
  public PAOrganizationalGroupItems paOGItem{get;set;}   
  public Project_Price__c projectPrice {get;set;} 

  public list<SelectOption> kcListOptions {get;set;}
  public List<PARelatedList> relatedListFetchRecord {get;set;}
  public List<PARelatedList> relatedListSAPRecord {get;set;}

  public String projectSelection {get;set;}
  public string dispRecordsFromSAP {get;set;}
  public string dispDoneButton {get;set;}
  public string selectAll;
  public String projectAction {get;set;} 
  public String doRoundOff {get;set;} // used to pass value from page on click on Ok in RoundOff warning Messaes ver 3.9

  public boolean dispAlert {get;set;}
  public boolean dispRoundOffMessage {get;set;} //To display roundOff warning messages
  public boolean dispNext {get;set;} //dispnext is used to hide Next button in edit approved flow and is also used to disable fields in clone flow
  public boolean disableFields {get;set;} //ver 1.9 is used to disable fields in edit aproved flow
  public boolean editApprovedAll {get;set;} // ver 2.2 

  public static final Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');

  public string selectedProjectId {get;
  set
  {   if(value!=null){
    String projectAction='';
    String projectId='';
    List<string> splitvalueList = new List<string>();
    splitvalueList = value.split('-');
    System.debug('****splitvalueList'+splitvalueList);
    if(splitvalueList.size()!=0){
      projectAction=splitvalueList[0];
      projectId=splitvalueList[1];
    }


    System.debug('*** inside setter method'+projectPrice.Assigned_To__r.Name);
    //<PS20130424>
    projectActionCalculation(projectId,projectAction);
    currentRequest.userName = projectPrice.Assigned_To__r.Name;
  }
  }   
  }
  // <PS20130424> Ver 4.2 PS 2013-04-24 APAC Rollout-for Edit Header button or approved project
  public String editHeaderApproved{get;set;}
  //CONSTRUCTOR
  public PAProjectPrice(PAServiceState paServiceState)
  {
    currentRequest = paServiceState.currentRequest;
    system.debug('current request'+currentRequest.pricingRequest);

    paOGItem = paServiceState.ogItems;
    projectPrice=new Project_Price__c();
    doRoundOff='NO';
    tempStorageMap = new Map<String,String>();
    //get the locale
    Decimal standardDecimal = 1.1;
    separator = standardDecimal.format().subString(1,2);

  }

  /*
   * Author      :   Anand Darshi 
   * Method Name  :   getListBusinessComponents
   * Parameters   :   No parameters
   * Return type  :   List<sObject>
   * Description  :   
   */
  public List<sObject> getListBusinessComponents()
  {

    return null;
  }

  /*
   * Author      :   Anand Darshi 
   * Method Name  :   getListOptions
   * Parameters   :   No parameters
   * Return type  :   List<selectOption>
   * Description  :   
   */
  public List<SelectOption> getListOptions()
  {

    return null;
  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   getListWrappers
   * Parameters   :   No parameters
   * Return type  :   List<PARelatedList>
   * Description  :   Used to display Records 
   */
  public List<PARelatedList> getListWrappers()
  {
    if(projectSelection=='current') 
    {   
      Date todayDate;
      todayDate=Date.today();
      string s;
      //<HL20150714> changed limit from 300 to 200 to resolve view state issue in production
      List<Project_Price__c> currentProjects=[SELECT id,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,PricingCondition_Id__c,Created_By__c,
                                              Project_status__c,isApproved__c FROM Project_Price__c WHERE Valid_To__c>=: todayDate AND 
                                              Sold_To_Code__c =:currentRequest.customer.paERPCustomer.Customer_code__c 
                                              AND Project_status__c !='Abandoned' ORDER BY LastModifiedDate DESC limit 180];

      List<Pricing_Request__c> prList = [SELECT id,Project_Id__c,Name,CreatedById,Project_Price__r.Id,Request_Approval_status__c FROM Pricing_Request__c WHERE Project_Price__c IN:currentProjects];

      List<PARelatedList> relatedListProject = new List<PARelatedList>();
      PARelatedList c = new PARelatedList();
      //added if condition to remove the header in Project price -neeharika Fix -Roll out -APAC issue
      //Ver 4.5 START 
      if(currentProjects!=null && currentProjects.size()!=0)
      {
        c.sObjectTypeName=Project_Price__c.sObjectType.getDescribe().getName().toLowerCase();
        c.keyCombinationColumns = Schema.SObjectType.Project_Price__c.fieldSets.getMap().get('PAProjectPriceColumns').getFields();
        c.wrapperList = new List<PAWrapper>();


        for(Project_Price__c pp:currentProjects)
        {
          boolean noReqIdFlag = false;
          for(Pricing_Request__c preq:prList)
          {

            if(pp.Id == preq.Project_Price__r.Id)
            {
              PAWrapper rw = new PAWrapper();
              rw.stringMap =new map<string,string>();
              s = checkRequestAndProjectStatus(pp.Project_status__c,preq.Request_Approval_status__c);                     
              rw.sobjectRecord = pp;
              rw.stringMap.put('ApprovedProjectNoReq','false');
              rw.dummy = s;
              rw.isSelected = false;
              noReqIdFlag = true;
              c.wrapperList.add(rw);
              break;
            }      
          }   
          if(!noReqIdFlag) 
          {
            s = checkRequestAndProjectStatus(pp.Project_status__c,'NoRequest');
            if(s<>'NoReqForDraftProj') //added by anand 0n 20 Feb
            {
              PAWrapper rw = new PAWrapper();
              rw.stringMap =new map<string,string>();
              rw.sobjectRecord = pp;
              rw.stringMap.put('ApprovedProjectNoReq','true');
              rw.dummy = s;
              rw.isSelected = false;
              noReqIdFlag = true;
              c.wrapperList.add(rw);
            }                        
          }   
        }
        relatedListProject.add(c);
      }
      return relatedListProject;
    }
    else if(projectSelection=='all') 
    {   
      Date todayDate;
      todayDate=Date.today();
      string s;
      List<Project_Price__c> allProjects=[select id,Project_Id__c,Name,Project_Description__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,PricingCondition_Id__c,Created_By__c,
                                          Project_status__c,isApproved__c FROM Project_Price__c WHERE Valid_To__c>=: todayDate-365 
                                          AND Sold_To_Code__c =:currentRequest.customer.paERPCustomer.Customer_code__c 
                                          AND Project_status__c !='Abandoned' ORDER BY LastModifiedDate DESC limit 300]; 

      List<Pricing_Request__c> prList = [SELECT id,Project_Id__c,Name,CreatedById,Project_Price__r.Id,Request_Approval_status__c FROM Pricing_Request__c WHERE Project_Price__c IN:allProjects];

      List<PARelatedList> relatedListProject = new List<PARelatedList>();
      PARelatedList c = new PARelatedList();
      //Ver 4.5 START
      if(allProjects!=null && allProjects.size()!=0) //neeharika for APAC Roll out fix - TO remove the header when there are no reocrds
      {
        c.sObjectTypeName=Project_Price__c.sObjectType.getDescribe().getName().toLowerCase();
        c.keyCombinationColumns = Schema.SObjectType.Project_Price__c.fieldSets.getMap().get('PAProjectPriceColumns').getFields();
        c.wrapperList = new List<PAWrapper>();

        for(Project_Price__c pp: allProjects)
        { 
          boolean noReqIdFlag = false;
          for(Pricing_Request__c preq:prList)
          {
            if(pp.Id == preq.Project_Price__r.Id)
            {
              PAWrapper rw = new PAWrapper();
              rw.stringMap =new map<string,string>();
              s = checkRequestAndProjectStatus(pp.Project_status__c,preq.Request_Approval_status__c);                     
              rw.sobjectRecord = pp;
              rw.stringMap.put('ApprovedProjectNoReq','false');
              rw.dummy = s;
              rw.isSelected = false; 
              noReqIdFlag = true;
              c.wrapperList.add(rw);
              break;
            }      
          }   
          if(!noReqIdFlag) 
          {
            s = checkRequestAndProjectStatus(pp.Project_status__c,'NoRequest');
            if(s<>'NoReqForDraftProj') //added by anand 0n 20 Feb
            {
              PAWrapper rw = new PAWrapper();
              rw.stringMap =new map<string,string>();
              rw.sobjectRecord = pp;
              rw.stringMap.put('ApprovedProjectNoReq','true');
              rw.dummy = s;
              rw.isSelected = false;
              noReqIdFlag = true;
              c.wrapperList.add(rw);
            }                        
          }
        }
        relatedListProject.add(c);
      } //VER 4.5 END
      return relatedListProject;
    }
    else if(projectSelection=='FetchRecords') 
    {   
      String salesAreaWhereClause =' ';
      string phSeperator;
      string query; 

      if(currentRequest.keyCombination.KeyCombinationName.contains('Material') && ! currentRequest.keyCombination.KeyCombinationName.contains('PH'))
      { 
        //dynamic SalesAreaClause
        string whereClause=' where (';
        string distChannelCode,divisionCode,salesOrgCode;
        if(currentRequest.pricingRequest.Sales_Org_Code__c!=null)
        {
          distChannelCode = currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
          divisionCode = currentRequest.customer.paERPCustomer.Division_Code__c;
          salesOrgCode = currentRequest.customer.paERPCustomer.Sales_Org_Code__c;
        }
        system.debug('***distCode'+currentRequest.customer.distCode);
        system.debug('***divCode'+currentRequest.customer.divCode);
        system.debug('***salesOrgCode'+currentRequest.customer.salesOrgCode);

        if(currentRequest.keyCombination.KeyCombinationName.remove(' ').toUpperCase().containsIgnoreCase('SALESORG.'))
        {
          salesAreaWhereClause = salesAreaWhereClause + 'AND ERP_Sales_Org_Code__c = :salesOrgCode ';
        }

        if(currentRequest.keyCombination.KeyCombinationName.remove(' ').toUpperCase().containsIgnoreCase('DIST.CHANNEL'))
        {
          salesAreaWhereClause = salesAreaWhereClause + 'AND ERP_Distribution_Channel_Code__c = :distChannelCode '; 
        }                                                  

        //dynamic whereClause
        if(currentRequest.materialFilter != null )
        {
          List<String> splitMaterialList = new List<String>(); 
          splitMaterialList = currentRequest.materialFilter.split(',');

          if(splitMaterialList.size()>0)
          {   
            for(Integer i=0; i<splitMaterialList.size() ;i++)
            {   
              if(i!=splitMaterialList.size()-1)
              {   
                whereClause = whereClause+'ERP_Material_Code__c like \''+String.escapeSingleQuotes(splitMaterialList[i].trim())+'%\' '+' OR ';
              }
              else  
              {   
                whereClause = whereClause+'ERP_Material_Code__c like \''+String.escapeSingleQuotes(splitMaterialList[i].trim())+'%\' )  ';
              }
            }
          }
        }

        /**  version 1.6
                adding SAP Cluster condition -neeha
         */
        // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Adding Extra field in query
        //<PP20130715>
        //<PP20131231>
        List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                          Display_Standardized_rate__c, Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c  FROM Organizational_Group_Item__c
                                                          WHERE Business__c =:paOGItem.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.customer.paERPCustomer.Sales_Org_Code__c
                                                          AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                                          OrgGroup__r.ERP_Division_Code__c = :currentRequest.customer.paERPCustomer.division_code__c];    
        String sppId;
        // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Created Variable to hold Variable Config Material value
        boolean enableVarConfigMaterial=false; 
        if(buOrgGroup!=null && buOrgGroup.size()!=0){
          sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
          // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Adding logic for Variable Config Material
          enableVarConfigMaterial = buOrgGroup.get(0).Enable_Variable_Config_Materials__c;
        }
        List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];
        String sourceCluster;
        if(sppList!=null && sppList.size()!=0)
        {
          sourceCluster=sppList.get(0).SAP_Cluster__c;
        }
        System.debug('***sourceCluster'+sourceCluster);                                                 
        /*adding source cluster end*/
        string ClusterRtypeClause= ' AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id ' ; 


        //<SP20140428> START
        if(enableVarConfigMaterial)
        {
          ClusterRtypeClause = ClusterRtypeClause+' AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial ';
        }

        //<SP20140428> END
        // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
        list<Material__c> materialRecordList  =new list<Material__c>();
        query='Select Name,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,ERP_Product_Hierarchy_Code__c,Product_Hierarchy__c,ERP_Profit_Center__c,ERP_Profit_Center_Code__c   from Material__c' +whereClause+salesAreaWhereClause+ClusterRtypeClause +' limit 101';
        system.debug('***query'+query);

        materialRecordList=database.query(query); 

        System.debug('***materialrecord Size:'+materialRecordList.size());

        if(materialRecordList.size() == 0)
        {   
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
          throw new PAException(System.Label.No_Pricing_Records_Warning,ApexPages.Severity.WARNING);

        }
        if(materialRecordList.size() > 1000)
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
          throw new PAException(System.Label.More_Than_1000_Pricing_Records_Warning,ApexPages.Severity.WARNING);

        }

        //for PH description
        list<string> phcodes = new list<string>(); 
        map<string,string> phCodeToDescMap = new map<string,string>(); 

        for(Material__c p: materialRecordList)
        {
          phcodes.add(p.ERP_Product_Hierarchy_Code__c);   
        }
        list<BU_PH__c> buphList = new list<BU_PH__c>(); 

        buphList = [SELECT Business_Description__c, Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c FROM BU_PH__c WHERE Product_Hierarchy__r.PH_Code__c IN :phcodes];

        for(BU_PH__c X:buphList)
        {
          phCodeToDescMap.put(X.Product_Hierarchy__r.PH_Code__c,X.Business_Description__c);
        }

        PARelatedList c = new PARelatedList();
        c.sObjectTypeName=Material__c.sObjectType.getDescribe().getName().toLowerCase();
        c.keyCombinationColumns = Schema.SObjectType.Material__c.fieldSets.getMap().get('PAMaterial').getFields();
        c.wrapperList = new List<PAWrapper>();
        c.PriceType='PH';
        PAUtil.sortList(materialRecordList, 'Name', 'asc');

        for(Material__c p: materialRecordList)
        { 

          PAWrapper rw = new PAWrapper();
          rw.stringMap =new map<string,string>();
          if(p.ERP_Product_Hierarchy_Code__c !=null)
          {
            if(phCodeToDescMap.get(p.ERP_Product_Hierarchy_Code__c) != null)
            {
              rw.stringMap.put(p.ERP_Product_Hierarchy_Code__c,phCodeToDescMap.get(p.ERP_Product_Hierarchy_Code__c));
            }
            else
            {
              rw.stringMap.put(p.ERP_Product_Hierarchy_Code__c,'');
            }

          }
          rw.sobjectRecord = p;
          rw.isSelected = false;
          c.wrapperList.add(rw);
        }
        relatedListFetchRecord.add(c);

        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        return relatedListFetchRecord;
      }

      if(currentRequest.keyCombination.KeyCombinationName.contains('PH'))
      {
        string whereClause=' where ';
        //<SP20140520> - commenting START
        //string redefinedPH=currentRequest.phFilter;
        //string finalPHCode;
        //Shiva- strt 2.7
        //shiva - strt 3.0
        //if(!String.isBlank(currentRequest.phFilter))
        // {    
        //    for(Integer i=0; i<=currentRequest.phFilter.length();i++)
        //     {
        //        redefinedPH = redefinedPH.removeEnd('#');
        //    }
        //    system.debug('*** redefinedPH'+redefinedPH);

        //    finalPHCode = redefinedPH.replace('#','_');
        //    system.debug('*** finalPHCode'+finalPHCode);
        //}
        //shiva - end 3.0
        //Shiva end 2.7

        list<Product_Hierarchy__c> phMasterRecordList  =new list<Product_Hierarchy__c>();
        system.debug('***currentRequest.lastPHLevelSelected '+currentRequest.lastPHLevelSelected);

        Integer phLevel;
        Integer requiredLength;
        String phfilter;
        Decimal phFilterLength;
        for(Integer i=1;i<=10;i++)
        {
          if(!currentRequest.keyCombination.KeyCombinationName.contains('PH'+String.valueOf(i)))
          {
            requiredLength = i-1;
            break;                      
          }
        }
        phFilterLength=(currentRequest.phFilter.length()/2);
        phFilterLength=phFilterLength.round(system.roundingMode.CEILING);
        if(currentRequest.phFilter.length()==(requiredLength*2))
        {         
          phfilter=currentRequest.phFilter;           
        }
        else
        {
          phfilter=currentRequest.phFilter+'%';
        }
        if(requiredLength == (Integer)phFilterLength)
        {
          phLevel = (Integer)phFilterLength;
        }
        else
        {
          phLevel = (Integer)phFilterLength+1;
        }
        phFilterLength=(phFilter.length()/2);
        phFilterLength=phFilterLength.round(system.roundingMode.CEILING);
        system.debug('&& phLevel **'+requiredLength+'currentRequest.phFilter'+currentRequest.phfilter+'***'+phLevel);
        /*phMasterRecordList = [SELECT Description__c,Name__c,PH_Code__c,PH_Level__c FROM Product_Hierarchy__c WHERE ID IN (Select Product_Hierarchy__r.ID FROM BU_PH__c WHERE OrgGroup__r.Id=:paOGItem.selectedBU AND Product_Hierarchy__r.PH_Code__c like :phfilter AND Product_Hierarchy__r.PH_Level__c =:requiredLength limit 101)];


               system.debug('***Ph Records'+phMasterRecordList);
               List<string> finalPHIds = new List<string>(); 
               for(Product_Hierarchy__c X:phMasterRecordList)
               {
                    finalPHIds.add(X.Id);
               }
                system.debug('*** finalPHIds '+finalPHIds+'*** finalPHIds size - '+finalPHIds.size());*/
        system.debug('*** paOGItem.selectedRecordId '+paOGItem.selectedBU);
        List<BU_PH__c> BUPHListFinal = [SELECT Id,Product_Hierarchy__c,Product_Hierarchy__r.Description__c,Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_Level__c,Business_Description__c,OrgGroup__c FROM BU_PH__c WHERE OrgGroup__r.Id=:paOGItem.selectedBU AND Product_Hierarchy__c IN (SELECT ID FROM Product_Hierarchy__c WHERE PH_Code__c like :phfilter AND PH_Level__c = :phLevel) ORDER BY Business_Description__c LIMIT 901 ];
        system.debug('***Bu Ph Records'+BUPHListFinal);
        if(BUPhListFinal.size() == 0)
        {   
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
          throw new PAException(System.Label.No_Pricing_Records_Warning,ApexPages.Severity.WARNING);
        }
        //  if(BUPHListFinal.size() > 1000)
        //  {
        //      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
        //      throw new PAException(System.Label.More_Than_1000_Pricing_Records_Warning,ApexPages.Severity.WARNING);
        //  }
        //        PAUtil.sortList(BUPHListFinal, 'Business_Description__c', 'asc');
        //PAUtil.sortList(BUPHListFinal, 'Product_Hierarchy__r.PH_Level__c', 'asc');
        PARelatedList c = new PARelatedList();
        c.sObjectTypeName=BU_PH__c.sObjectType.getDescribe().getName().toLowerCase();
        c.keyCombinationColumns =SObjectType.BU_PH__c.fieldSets.getMap().get('PAProjectPH').getFields();
        c.wrapperList = new List<PAWrapper>();

        for(BU_PH__c p: BUPHListFinal)
        { 
          PAWrapper rw = new PAWrapper();
          rw.stringMap =new map<string,string>();
          rw.sobjectRecord = p;
          rw.isSelected = false; 
          c.wrapperList.add(rw);
        }
        relatedListFetchRecord.add(c);

        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8

        if(BUPHListFinal.size() > 900)
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
          throw new PAException(System.Label.More_Than_1000_Pricing_Records_Warning,ApexPages.Severity.WARNING);
        }
        return relatedListFetchRecord;
      } 

    }//FETCH RECOR CLOSED
    // <PS20130424> Ver 4.2 PS 2013-04-24 APAC Rollout-using the variable editHeaderApproved('Edit Header' button) to fetch PC-KC and SAP records on click of 'Next'
    else if(dispRecordsFromSAP=='editApprovedProject' || dispRecordsFromSAP=='IdApprovedProject' || projectSelection=='clone' || dispRecordsFromSAP=='IdCompleteProject' || dispRecordsFromSAP=='IdProjectHeaderSubmitted'|| editHeaderApproved =='editHeaderApprovedProject') 
    {   
      List<PARelatedList> relatedListProject = new List<PARelatedList>();

      list<ERP_Sales_Prices_SAP__c> projectRecordList;
      Set<ERP_Sales_Prices_SAP__c> priceHolderSet =new Set<ERP_Sales_Prices_SAP__c>();
      List<ERP_Sales_Prices_SAP__c> nonPriceHolderList =new List<ERP_Sales_Prices_SAP__c>();
      Map<Id,List<ERP_Sales_Prices_SAP__c>> newChildRecMap = new Map<Id,List<ERP_Sales_Prices_SAP__c>>();
      List<ERP_Sales_Prices_SAP__c> finalProjectRecList = new List<ERP_Sales_Prices_SAP__c>(); 

      Set<String> PCKCConcatSet = new Set<String>();
      string concat,concatSAPPCKC ;
      Map<String,String> concatPCKCToSAPPCKCMap = new Map<String,String>();
      List<ERP_Sales_Prices_SAP__c> tempList;
      Map<string,List<ERP_Sales_Prices_SAP__c>> pcKCConcatSAP = new Map<string,List<ERP_Sales_Prices_SAP__c>>(); 

      Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
      List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
      Map<String,String>   kcIdandKcDescMap=new Map<String,String>();

      // Ver 2.9 starts      
      /*populating SFDC KC descrpiton*/ 

      System.debug('****currentRequest'+currentRequest.pricingRequest.BU__c+'sales org'+currentRequest.pricingRequest.Sales_Org_Code__c+'dc'+currentRequest.pricingRequest.Dist_Channel_Code__c+'div'+currentRequest.pricingRequest.Division_Code__c);
      //<PP20130715>
      //<PP20131231>
      orgGroupItemsList = [SELECT Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Enable_Variable_Config_Materials__c,
                           Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c FROM Organizational_Group_Item__c
                           WHERE Business__c =: paOGItem.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.pricingRequest.Sales_Org_Code__c
                           AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.pricingRequest.Dist_Channel_Code__c AND
                           OrgGroup__r.ERP_Division_Code__c = :currentRequest.pricingRequest.Division_Code__c];
      if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0)
      {
        buOrgGroup  =   orgGroupItemsList[0];  
      }       
      System.debug('****currentRequest.pricingCondition.selectedPricingCondition'+projectPrice.PricingCondition_Id__c);    
      List<ERP_Access_Sequence__c>    accSqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c 
                                                   FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c = :projectPrice.PricingCondition_Id__c
                                                   AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
      String finalKC='';
      for(ERP_Access_Sequence__c ac:accSqList)
      {
        kcIdandKcDescMap.put(ac.Pricing_Key_Combination__r.key_Combination_code__c,ac.Key_Combination__c);
      }
      System.debug('kcIdandKcDescMap***'+kcIdandKcDescMap);

      /*end*/
      // Ver 2.9 ends 

      if(projectSelection.equalsIgnoreCase('clone') && privateproject !=null)
      {
        //<VR20130509> Ver 4.4 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
        //<PP20131028>
        //<MS20140516> Added Variant and SalesOrderType fields in the query
        //<SS20220826> - Added Sales Order Item values in below query.
        //<<SS20230501> - Added P80 M&M feilds
        projectRecordList =[SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,
                            Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
                            Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,
                            PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,
                            Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,
                            Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,Customer_Hierarchy__c,Customer_Hierarchy_Code__c,
                            ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_Ref__c,Project_Id__c,Calculation_Type__c,Calculation_Type_Code__c,
                            Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,F_Product_Hierarchy_Code__c,SAP_Cluster__c,Plus_Minus_Code__c,Plus_Minus__c,Product_Hierarchy_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                            ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, 
                            Disc_Ref_No__c, FixValDate__c, Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,PCKC__C     
                            FROM ERP_Sales_Prices_SAP__c where Project_Id__c=:privateproject.Project_Id__c ORDER BY Approved_Date__c DESC];
      }
      else
      {
        //<VR20130509> Ver 4.4 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
        //<PP20131028>
        //<SS20220826> - Added Sales Order Item values in below query.
        //<<SS20230501> - Added P80 M&M feilds        
        projectRecordList =[SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,
                            Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,
                            Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,
                            PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,
                            Product_Hierarchy__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Customer_Hierarchy__c,Customer_Hierarchy_Code__c,
                            Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,
                            ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_Ref__c,Project_Id__c,Calculation_Type__c,Calculation_Type_Code__c,
                            Check_Scale__c,Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,F_Product_Hierarchy_Code__c,SAP_Cluster__c,Plus_Minus_Code__c,Plus_Minus__c,Product_Hierarchy_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                            ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, 
                            Disc_Ref_No__c, FixValDate__c, Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c ,PCKC__C     
                            FROM ERP_Sales_Prices_SAP__c where Project_Id__c=:projectPrice.Project_Id__c ORDER BY Approved_Date__c DESC];

      }
      //Shiva Start ver-2.0 start -- for getting the latest Approved records
      for(ERP_Sales_Prices_SAP__c rec1: projectRecordList)
      {
        if(rec1.Price_Holder__c == null) 
        {
          priceHolderSet.add(rec1);

        }
        else
        {
          nonPriceHolderList.add(rec1);
          if(!newChildRecMap.containskey(rec1.Price_Holder__c))
          {
            List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
            l1.add(rec1);
            newChildRecMap.put(rec1.Price_Holder__c,l1);
          }     
          else
          {       
            List<ERP_Sales_Prices_SAP__c> hRecList = newChildRecMap.get(rec1.Price_Holder__c);
            hRecList.add(rec1);
            newChildRecMap.put(rec1.Price_Holder__c,hRecList);
          } 
        }
      }

      for(Id X:newChildRecMap.keyset())
      {
        List<ERP_Sales_Prices_SAP__c> sortProjectRecList = new List<ERP_Sales_Prices_SAP__c>();
        if(newChildRecMap.containsKey(X)){
          sortProjectRecList = newChildRecMap.get(X);
        }
        finalProjectRecList.add(sortProjectRecList[0]);
      }
      system.debug('#### finalProjectRecList'+finalProjectRecList+'#### finalProjectRecList size '+finalProjectRecList.size()+'***projectRecordList'+projectRecordList);
      //Shiva End ver 2.0 end

      for(ERP_Sales_Prices_SAP__c ERPSales : finalProjectRecList)
      {
        tempList = new List<ERP_Sales_Prices_SAP__c>();
        concat =  ERPSales.Pricing_Condition_Code__c + '-' +ERPSales.Pricing_Condition__c + ':' +ERPSales.Key_Combination_Code__c + '-' +ERPSales.Key_Combination__c;
        //added SFDC key Comb-VIMP Ver 2.9
        System.debug('****kcIdandKcDescMap'+kcIdandKcDescMap);
        if(kcIdandKcDescMap.containsKey(ERPSales.Key_Combination_Code__c))
        {
          finalKC=kcIdandKcDescMap.get(ERPSales.Key_Combination_Code__c);
        }       

        concatSAPPCKC = ERPSales.Pricing_Condition_Code__c + '-' + ERPSales.Pricing_Condition__c + ' : ' + ERPSales.Key_Combination_Code__c+ '-' + finalKC;
        concatPCKCToSAPPCKCMap.put(concat,concatSAPPCKC);
        //added SFDC key Comb-VIMP-end Ver 2.9
        PCKCConcatSet.add(concat);
        if(pcKCConcatSAP.get(concat)!=null)
        {
          tempList = pcKCConcatSAP.get(concat);
          tempList.add(ERPSales);
          pcKCConcatSAP.put(concat,tempList);
        }
        else
        {
          tempList.add(ERPSales);
          pcKCConcatSAP.put(concat,tempList);
        }
      }

      // Modified - Bala Feb 27
      List<Schema.FieldSetMember> kcFields = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap().get('PAPricingRecordsColumns').getFields();
      List<Schema.FieldSetMember> commonFields = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap().get('PAPricingRecordCommonColumns').getFields();
      List<Schema.FieldSetMember> soldToFields = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap().get('PASoldTo').getFields();
      List<Schema.FieldSetMember> commonSet = new List<Schema.FieldSetMember>();
      String sObjectName = ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
      List<Schema.FieldSetMember> dateFields = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap().get('PAPricingRecordDateColumns').getFields();
      for(String s : PCKCConcatSet)
      {

        PARelatedList c = new PARelatedList(); 
        c.wrapperList = new List<PAWrapper>();
        List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
        for(Schema.FieldSetMember fSet : kcFields)
        {
          String replacedS = s.replace('Material Price Group','');
          if(fSet.getLabel().contains('Material') &&(!fSet.getLabel().contains('Price'))&&(replacedS.contains('Material')))
          {
            kcSet.add(fSet);
          }
          if(fSet.getLabel().contains('Material Price Group') &&(s.contains('Material Price Group')))
          {
            kcSet.add(fSet);
          }
          if(!fSet.getLabel().contains('Material') &&(s.remove(' ').toLowerCase().contains(fSet.getLabel().remove(' ').toLowerCase()) || s.remove(' ').toLowerCase().contains(fSet.getLabel().replace(' Code','').remove(' ').toLowerCase())))
          {
            kcSet.add(fSet);
          }
          if(fSet.getLabel().contains('Product Hierarchy') &&(s.contains('PH')))
          {
            kcSet.add(fSet);
          }
        }
        c.keyCombinationColumns = kcSet;

        for(Schema.FieldSetMember cSet : commonFields)
        {
          if(!cSet.getLabel().contains('Per') && !cSet.getLabel().contains('UoM'))
          {
            //commonSet.add(cSet);
            kcSet.add(cSet);
          }
        }
        /*added for KC SFDC desc Ver 2.9 */
        if(concatPCKCToSAPPCKCMap.containsKey(s)){
          c.priceType = concatPCKCToSAPPCKCMap.get(s);
        } 
        /*end Ver 2.9 */ 
        c.keyCombinationColumns = kcSet;
        c.sObjectTypeName=sObjectName;

        for(ERP_Sales_Prices_SAP__c ERPSales : pcKCConcatSAP.get(s))
        {
          PAWrapper rw = new PAWrapper();
          rw.stringMap =new map<string,string>();
          rw.stringMap.put('disableCheckBox','false');
          rw.stringMap.put('rateLocale','');
          if(ERPSales.Rate__c != null)
          {
            String r = Decimal.valueOf(ERPSales.Rate__c).format();
            rw.stringMap.put('rateLocale',r);
          }
          if(selectAll=='yes')
          {
            rw.isSelected = true;
            rw.stringMap.put('disableCheckBox','true');
          }
          else
          {
            rw.isSelected = false;
          }
          rw.sObjectRecord = ERPSales;
          c.wrapperList.add(rw);
        }
        relatedListProject.add(c);
      }

      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return relatedListProject;
    }
    return null;
  }//getListWrappers CLOSED


  /*
   * Author      :   Anand Darshi
   * Method Name  :   save
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   
   */
  public void save()
  {


  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   deleteRecord
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   
   */ 
  public void deleteRecord()
  {

  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   validate
   * Parameters   :   String
   * Return type  :   String
   * Description  :   This method performs validation on user enterd data
   */
  public String validate(String desiredAction)
  {
    string errorMessage = '';
    final String LINE_BREAK = '<br/>';
    Pricing_Request__c prProject = new Pricing_Request__c();
    prProject.Sales_Org_Code__c = currentRequest.customer.paERPCustomer.Sales_Org_Code__c;
    prProject.Dist_Channel_Code__c =currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
    prProject.Division_Code__c = currentRequest.customer.paERPCustomer.Division_Code__c;
    paOGItem.ogItemFromRequest(prProject);

    system.debug('***validate method'+projectAction);
    if(desiredAction.contains('insertProject'))
    {

      if(projectPrice.Name==null || projectPrice.Name==' ' || projectPrice.Name=='')
      {
        errorMessage+= System.Label.Project_Name_Mandatory_Error+LINE_BREAK;  
      }
      if(projectPrice.Valid_From__c==null )
      {
        errorMessage+= System.Label.Valid_From_Mandatory_Error+LINE_BREAK;
      }
      if(projectPrice.Valid_From__c < Date.today())
      {
        errorMessage+= System.Label.Valid_From_Date_Out_Of_Range_Error+LINE_BREAK;
      }
      if(projectPrice.Valid_To__c==null)
      {
        errorMessage+= System.Label.Valid_To_Mandatory_Error+LINE_BREAK;
      }
      //<TJ20150106> Removed '=' condition
      if(projectPrice.Valid_To__c<projectPrice.Valid_From__c )
      {
        errorMessage+= System.Label.Valid_To_Less_Error+LINE_BREAK;
      }
      if(projectPrice.Valid_To__c < Date.today())
      {
        errorMessage+= System.Label.Valid_To_Invalid_Error+LINE_BREAK;
      }
      if((projectPrice.id ==null || projectAction=='clone') && projectPrice.Valid_From__c!=null ) //version 1.7   
      {           
        if(System.now().date().daysBetween(projectPrice.Valid_From__c)>paOGItem.orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c)
        {
          errorMessage+=System.Label.Valid_From_Date_Out_Of_Range_Error+LINE_BREAK;
        }
      }
      if((projectPrice.id ==null || projectAction=='clone') && projectPrice.Valid_To__c!=null) //version 1.7
      {   
        //<PP20131115>
        if((System.now().date().monthsBetween(projectPrice.Valid_To__c)) >paOGItem.orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c)
        {
          errorMessage+=System.Label.Valid_To_Date_Out_Of_Range_Error+LINE_BREAK;
        }
      }   
      if(projectPrice.Project_Volume__c==null)
      {
        errorMessage+= System.Label.Project_Volume_Mandatory_Error+LINE_BREAK;
      }
      //<TJ20150603>
      if(disabledefdisc==true && (projectPrice.Default_Discount__c==null || projectPrice.Default_Discount__c==' ' || projectPrice.Default_Discount__c==''))
      {
        errorMessage+= System.Label.Default_Discount_Mandatory_Error+LINE_BREAK;
      }
      else if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c!=' ' && projectPrice.Default_Discount__c!='')
      {   
        // Ver 2.3 starts  
        //else 
        //{
        try{
          Decimal.ValueOf(projectPrice.Default_Discount__c);
        }
        catch(exception e){
          errorMessage+='<br> Invalid Decimal  <br/>';
        }

        //} // Ver 2.3 ends
      }
      //<TJ20150603>
      if(projectPrice.id ==null)
      {
        if(currentRequest.userSelected==null || currentRequest.userSelected.trim()=='' )
        {
          errorMessage+= System.Label.Assigned_To_Select_Error+LINE_BREAK;
        } 
      }
      if(projectPrice.id ==null)
      {
        if((currentRequest.pricingCondition.selectedPricingCondition==null || currentRequest.pricingCondition.selectedPricingCondition=='--Select--') )
        {
          errorMessage+= System.Label.Pricing_Condition_Mandatory_Error+LINE_BREAK;
        }  
      }
      if(projectPrice.id ==null || projectAction=='clone')
      {
        if(ProjectPrice.Project_Description__c !=null)
        {
          if( (ProjectPrice.Project_Description__c.length() ) > 32000 )
            errorMessage+= System.Label.Project_Description_Max_Length+LINE_BREAK;
        } 
      }

    }
    else if(desiredAction.contains('validateRequest'))
    {
      if(currentRequest.pricingRequest.Request_Name__c==null ||currentRequest.pricingRequest.Request_Name__c==' ' || currentRequest.pricingRequest.Request_Name__c=='')
      {
        system.debug('*** inside validateRequest Name:'+currentRequest.pricingRequest.Request_Name__c);
        errorMessage+=System.Label.Request_Name_Mandatory_Error+LINE_BREAK;  
      }

      if((currentRequest.pricingRequest.Request_Reason__c==null || currentRequest.pricingRequest.Request_Reason__c=='--Select--') )
      {
        errorMessage+= System.Label.Request_Reason_Mandatory_Error+LINE_BREAK;
      }

    }

    else if(desiredAction.contains('validateKeyValue'))
    {
      //validation For add Key section Fields
      //Ver 4.1
      String replacedEUKC = currentRequest.keyCombination.KeyCombinationName.replace('End User','');
      //<PP20131028>
      String replacedSTCKC = currentRequest.keyCombination.KeyCombinationName.replace('Ship-To Country','');
      if(currentRequest.keyCombination.KeyCombinationName.contains('FRB') && currentRequest.profitCenterFilter==null || currentRequest.profitCenterFilter=='' || currentRequest.profitCenterFilter==' ' )
      {
        errorMessage+=System.Label.ProfitCenter_Mandatory_Error+LINE_BREAK;  
      }

      if(currentRequest.keyCombination.KeyCombinationName.contains('Ship to')&& (currentRequest.shipToFilter==null  || currentRequest.shipToFilter=='' || currentRequest.shipToFilter==' '))
      {
        errorMessage+=System.Label.ShipTo_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Sales office') && (currentRequest.salesOfficeFilter==null || currentRequest.salesOfficeFilter=='' || currentRequest.salesOfficeFilter==' '))
      {
        system.debug('***validation On Sales Office failed');
        errorMessage+=System.Label.SalesOffice_Mandatory_Error+LINE_BREAK;  
      }
      if((currentRequest.keyCombination.KeyCombinationName.contains('CPG') && (currentRequest.cpgFilter==null  || currentRequest.cpgFilter=='--Select--')) ||
          (currentRequest.keyCombination.KeyCombinationName.contains('Customer Price Group') && (currentRequest.cpgFilter==null || currentRequest.cpgFilter=='--Select--')) )
      {
        system.debug('***validation On CPG failed');
        errorMessage+=System.Label.CPG_Mandatory_Error+LINE_BREAK;  
      }
      //<BB20130726> Ver 4.9 2013-07-26 APAC Rollout2-Adding Logic for Extra field Incoterms
      if((currentRequest.keyCombination.KeyCombinationName.contains('Incoterms') && (currentRequest.incotermsFilter==null  || currentRequest.incotermsFilter=='--Select--')))
      {
        system.debug('***validation On Incoterms failed');
        errorMessage+=System.Label.Incoterms_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Material Price Group') && (currentRequest.mpgFilter==null || currentRequest.mpgFilter=='--Select--'))
      {
        errorMessage+=System.Label.MPG_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Price List Type') && (currentRequest.priceListTypeFilter==null || currentRequest.priceListTypeFilter=='--Select--'))

      {
        errorMessage+=System.Label.PriceListType_Mandatory_Error+LINE_BREAK;  
      }
      //<PP20131028> - Changed Payment Terms to Terms of Payment
      if(currentRequest.keyCombination.KeyCombinationName.contains('Terms Of Payment') && (currentRequest.paymentTermsFilter==null || currentRequest.paymentTermsFilter=='' || currentRequest.paymentTermsFilter=='--Select--'))
      {
        errorMessage+=System.Label.PriceListType_Mandatory_Error+LINE_BREAK;  
      }
      //Ver 4.1 START

      if(currentRequest.keyCombination.KeyCombinationName.contains('End User') && (String.isBlank(currentRequest.endUserFilter)))
      {
        errorMessage+=System.Label.End_User_Mandatory_Error+LINE_BREAK;  
      }
      if(replacedEUKC.contains('End Use') && (String.isBlank(currentRequest.endUseFilter)))
      {
        errorMessage+=System.Label.End_Use_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Price Ref. Partner') && (String.isBlank(currentRequest.priceRefPartnerFilter)))
      {
        errorMessage+=System.Label.Price_Ref_Partner_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Market Segment') && (String.isBlank(currentRequest.marketSegmentFilter)))
      {
        errorMessage+=System.Label.Market_Segment_Mandatory_Error+LINE_BREAK;  
      }
      //<MS20140516> Added conditions for Variant and SalesOrderType 
      if(currentRequest.keyCombination.KeyCombinationName.contains('Variant') && (String.isBlank(currentRequest.variantFilter)))
      {
        errorMessage+=System.Label.Contract_Mandatory_Error+LINE_BREAK;  
      }
      //<MS20141114>
      //<MS20150101> Added conditions for Contract 
      if(currentRequest.keyCombination.KeyCombinationName.contains('Contract No.') && (String.isBlank(currentRequest.contractFilter)))
      {
        errorMessage+=System.Label.Variant_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.pricingCondition.selectedPricingCondition.contains('XPROJ') && (String.isBlank(currentRequest.projectFilter)))
      {
        errorMessage+=System.Label.Project_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('ComPartner') && (String.isBlank(currentRequest.comPartnerFilter)))
      {
        errorMessage+=System.Label.ComPartner_Mandatory_Error+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Material Group 5 Key') && (String.isBlank(currentRequest.materialGroup5KeyFilter)))
      {
        errorMessage+=System.Label.MG5_Mandatory_Error+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Plant') && (String.isBlank(currentRequest.plantFilter)))
      {
        errorMessage+=System.Label.Plant_Mandatory_Error+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Shipping Condition') && (String.isBlank(currentRequest.shippingConditionFilter)))
      {
        errorMessage+=System.Label.Shipping_Condition_Mandatory_Error+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Destination Country') && (String.isBlank(currentRequest.destinationCountryFilter)))
      {
        errorMessage+=System.Label.Destination_Country_Mandatory_Error+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Sales Order Type') && (String.isBlank(currentRequest.salesOrderTypeFilter)))
      {
        errorMessage+=System.Label.Sales_Order_Type_Mandatory_Error+LINE_BREAK;  
      }
      //<PP20131028>
      //<<SS20220826> - Added Sales Order Item values mandatory check.
      if(currentRequest.keyCombination.KeyCombinationName.contains('Sales Order Item') && (String.isBlank(currentRequest.salesOrderItemFilter)))
      {
        errorMessage+=System.Label.Sales_Order_Item_Mandatory_Error+LINE_BREAK;  
      }
      //<<SS20230501> - 
      if(currentRequest.keyCombination.KeyCombinationName.contains('Value Center') && (String.isBlank(currentRequest.valuecenterFilter)))
      {
        errorMessage+=System.Label.Value_Center_Mandatory_Error+LINE_BREAK;  
      }
      //<<SS20230501> - 
      if(currentRequest.keyCombination.KeyCombinationName.contains('Material Group 2') && (String.isBlank(currentRequest.materialGroup2Filter)))
      {
        errorMessage+=System.Label.Material_Group_2_Mandatory_Error+LINE_BREAK;  
      } 
      //<<SS20230501> - 
      if(currentRequest.keyCombination.KeyCombinationName.contains('External Matl Grp') && (String.isBlank(currentRequest.extMaterialGroupFilter)))
      {
        errorMessage+=System.Label.External_Matl_Grp_Mandatory_Error+LINE_BREAK;  
      }    
      //<<SS20230501> - 
      if(currentRequest.keyCombination.KeyCombinationName.contains('Price Zone') && (String.isBlank(currentRequest.prizeZoneFilter)))
      {
        errorMessage+=System.Label.Price_Zone_Mandatory_Error+LINE_BREAK;  
      }                         
      if(replacedSTCKC.contains('Country') && (String.isBlank(currentRequest.countryFilter)))
      {
        errorMessage+=System.Label.Country_Mandatory_Error+LINE_BREAK;  
      }
      //<PP20131028> START
      if(currentRequest.keyCombination.KeyCombinationName.contains('Ship-To Country') && (String.isBlank(currentRequest.shipToCountryFilter)))
      {
        errorMessage+=System.Label.Country_Mandatory_Error+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Kcode') && (String.isBlank(currentRequest.kcodeFilter)))
      {
        errorMessage+='Please enter value for mandatory field Kcode'+LINE_BREAK;  
      }
      if((currentRequest.keyCombination.KeyCombinationName.contains('Material Group 1') || currentRequest.keyCombination.KeyCombinationName.contains('Matl grp1')
          || currentRequest.keyCombination.KeyCombinationName.contains('Matl grp 1') || currentRequest.keyCombination.KeyCombinationName.contains('MatGrp1')) && (String.isBlank(currentRequest.materialGroup1Filter)))
      {
        errorMessage+='Please enter value for mandatory field Material Group 1'+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Sales District') && (currentRequest.salesDistrictFilter==null || currentRequest.salesDistrictFilter=='' || currentRequest.salesDistrictFilter==' '))
      {
        errorMessage+='Please enter value for mandatory field Sales District'+LINE_BREAK;  
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Partner ZF') && (String.isBlank(currentRequest.partnerZFFilter)))
      {
        errorMessage+='Please enter value for mandatory field Partner ZF'+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Payer') && (String.isBlank(currentRequest.payerFilter)))
      {
        errorMessage+='Please enter value for mandatory field Payer'+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Disc Ref No') && (String.isBlank(currentRequest.discRefNoFilter)))
      {
        errorMessage+='Please enter value for mandatory field Disc Ref No'+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('FixValDate') && (String.isBlank(currentRequest.fixValDateFilter)))
      {
        errorMessage+='Please enter value for mandatory field Fix Value Date'+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Campaign') && (String.isBlank(currentRequest.campaignFilter)))
      {
        errorMessage+='Please enter value for mandatory field Campaign'+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('Document Currency') && (String.isBlank(currentRequest.documentCurrencyFilter)))
      {
        errorMessage+='Please enter value for mandatory field Document Currency'+LINE_BREAK;
      }
      if(currentRequest.keyCombination.KeyCombinationName.contains('State') && (String.isBlank(currentRequest.stateFilter)))
      {
        errorMessage+='Please enter value for mandatory field State'+LINE_BREAK;
      }
      //<PP20131028> END
      //Ver 4.1 END

    }
    else if(desiredAction.contains('validateFilterCriteria'))
    {      
      if(currentRequest.keyCombination.KeyCombinationName.contains('Material')  && (currentRequest.materialFilter==null || currentRequest.materialFilter=='' || currentRequest.materialFilter==' '))
      {   
        errorMessage+=System.Label.Material_Select+LINE_BREAK;  
      }
    } 
    else if(desiredAction.contains('validateMaterialCode'))
    {
      String s1= currentRequest.materialFilter.trim();
      currentRequest.materialFilter=s1;
      splitSelectedMaterialList = new List<String>(); 

      //To add multiple records On 'Add To request' version no 1.3 start
      if(currentRequest.materialFilter != null )
      {
        system.debug('***currentRequest.materialFilter'+currentRequest.materialFilter);  
        splitSelectedMaterialList = currentRequest.materialFilter.split(',');
        system.debug('***splitSelectedMaterialList:'+splitSelectedMaterialList);
      }
      list<string> tempList =new list<string>();
      for(integer i=0;i<splitSelectedMaterialList.size();i++){

        String s= splitSelectedMaterialList[i].trim();
        tempList.add(s);

      }
      splitSelectedMaterialList.clear();
      splitSelectedMaterialList.addAll(tempList);
      system.debug('***splitSelectedMaterialList:'+splitSelectedMaterialList);

      /** version 1.6
            adding SAP Cluster condition -neeha
       */
      //<PP20130715>
      //<PP20131231>
      List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                        Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c  FROM Organizational_Group_Item__c
                                                        WHERE Business__c =:paOGItem.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.customer.paERPCustomer.Sales_Org_Code__c
                                                        AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                                        OrgGroup__r.ERP_Division_Code__c = :currentRequest.customer.paERPCustomer.division_code__c];    
      String sppId;
      // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Creating a local variable to hold configurable field value
      boolean enableVarConfigMaterial=false;
      if(buOrgGroup!=null && buOrgGroup.size()!=0){
        sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
        // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Assingning configurable field value to the local variable
        enableVarConfigMaterial = buOrgGroup.get(0).Enable_Variable_Config_Materials__c;
      }
      List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                              SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];
      String sourceCluster;
      if(sppList!=null && sppList.size()!=0)
      {
        sourceCluster=sppList.get(0).SAP_Cluster__c;
      }
      System.debug('***sourceCluster'+sourceCluster);                                                 
      /*adding source cluster end*/

      //newly added code
      // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
      list<Material__c> materialList  =new list<Material__c>();
      //<SP20140428> START
      if(enableVarConfigMaterial)
      {
        materialList = [SELECT id, ERP_Material_Code__c FROM Material__c where  ERP_Material_Code__c IN :splitSelectedMaterialList  AND ERP_Sales_Org_Code__c =:currentRequest.customer.paERPCustomer.Sales_Org_Code__c 
            AND ERP_Distribution_Channel_Code__c =:currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial ];
      }
      else
      {
        materialList = [SELECT id, ERP_Material_Code__c FROM Material__c where  ERP_Material_Code__c IN :splitSelectedMaterialList  AND ERP_Sales_Org_Code__c =:currentRequest.customer.paERPCustomer.Sales_Org_Code__c 
            AND ERP_Distribution_Channel_Code__c =:currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id];
      }
      //<SP20140428> END    
      SYSTEM.DEBUG('***materialList'+materialList);
      SYSTEM.DEBUG('***materialList'+splitSelectedMaterialList);
      SYSTEM.DEBUG('***materialList'+materialList.size());
      SYSTEM.DEBUG('***materialList'+splitSelectedMaterialList.size());                   
      if(materialList.size() != splitSelectedMaterialList.size()) 
      {
        errorMessage+=System.Label.Material_Code_Invalid+LINE_BREAK;
      }
    }
    else if(desiredAction.contains('EditApprovrdProject'))
    {
      Project_Price__c pp=[select Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                           Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,status__c,isApproved__c 
                           FROM Project_Price__c WHERE Id=:projectPrice.Id];
      Date todayDate;
      todayDate=Date.today();
      // validation for  approved project VF < today  (started project) VF cant be modified   
      if( pp.Valid_From__c <= Date.today() &&  pp.Project_Status__c=='Approved' && projectPrice.Valid_From__c != pp.Valid_From__c)
      {      
        projectPrice.Valid_From__c=pp.Valid_From__c;       //added by anand on 19 FEB
        errorMessage+= System.Label.Valid_From_Date_can_not_be_modified+LINE_BREAK;
      }        
      // validation for  approved project VF < today  (started project) VT cant have any value   
      // <PS20130424> Ver 4.2 PS 2013-04-26 APAC Rollout-when using the variable editHeaderApproved('Edit Header' button) no need to have this validation;it's already handled in the previous validations       
      if(pp.Valid_From__c <= Date.today() &&  pp.Project_Status__c=='Approved' && projectPrice.Valid_To__c==null && editHeaderApproved != 'editHeaderApprovedProject')
      {
        errorMessage+= System.Label.Valid_To_Mandatory_Error+LINE_BREAK;
      }
      // validation for  approved project VF > today  ( project not yet started) VF can be greater then today and less then prevoius VF
      if( pp.Valid_From__c > Date.today() &&  pp.Project_Status__c=='Approved' )
      {   
        if(projectPrice.Valid_From__c==null )
        {
          errorMessage+= System.Label.Valid_From_Mandatory_Error+LINE_BREAK;
        }
        if(projectPrice.Valid_From__c < Date.today())
        { 
          errorMessage+= System.Label.Valid_From_Date_Out_Of_Range_Error+LINE_BREAK;
        }
        if(projectPrice.Valid_From__c > pp.Valid_From__c )
        {   
          projectPrice.Valid_From__c=pp.Valid_From__c;
          errorMessage+= System.Label.Valid_From_Date_Out_Of_Range_Error+LINE_BREAK;
        }
      }     
      if(projectPrice.Valid_To__c==null)
      {
        errorMessage+= System.Label.Valid_To_Mandatory_Error+LINE_BREAK;
      }
      //<TJ20150106> Removed '=' condition
      if(projectPrice.Valid_To__c<projectPrice.Valid_From__c )
      {
        errorMessage+= System.Label.Valid_To_Less_Error+LINE_BREAK;
      }
      if(projectPrice.Valid_To__c < Date.today())
      {
        errorMessage+= System.Label.Valid_To_Invalid_Error+LINE_BREAK;
      }
        
        //<MG20160303>
        defaultdiscounthandle(pp);
            
      //<TJ20150603>
      if(defdisbool==true && (projectPrice.Default_Discount__c==null || projectPrice.Default_Discount__c==' ' || projectPrice.Default_Discount__c==''))
      {
        errorMessage+= System.Label.Default_Discount_Mandatory_Error+LINE_BREAK;
      }
      //else
     //<MG20160303>
        else if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c!=' ' && projectPrice.Default_Discount__c!='') 
      {               
        try{
          Decimal.ValueOf(projectPrice.Default_Discount__c);
        }
        catch(exception e){
          errorMessage+='<br> Invalid Decimal  <br/>';
        }
      }
      //<TJ20150603>
      if(projectPrice.Project_Volume__c==null)
      {
        errorMessage+= System.Label.Project_Volume_Mandatory_Error+LINE_BREAK;
      }
      // Ver 4.2  Adding to avoid upsert error for project description max length 
      if(projectPrice.Project_Description__c!=null && (projectPrice.Project_Description__c.length() ) > 32000 )
      {
        errorMessage+= System.Label.Project_Description_Max_Length+LINE_BREAK;
      }   
    }

    return errorMessage.trim();
  }

  /*  
   * Author      :   Anand Darshi
   * Method Name  :   action
   * Parameters   :   String,String,String
   * Return type  :   String
   * Description  :   This method is called when user action is performed
   */
  public String action(String newPagelabel,String currentPageLabel, String desiredAction)
  {
    //ver 3.8 starts
    String nonLocaleSeparator;
    if(separator == ',')
    {
      nonLocaleSeparator = '.';
    }
    else if(separator == '.')
    {
      nonLocaleSeparator = ',';
    }
    system.debug('***desired Action'+desiredAction);
    tempStorageMap = new Map<String,String>();
    tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
    //<TJ20150603>
    if(projectPrice.Default_Discount__c!=null && (projectPrice.Default_Discount__c.contains(',') || projectPrice.Default_Discount__c.contains('.')))
    {
      if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains(separator) && projectPrice.Default_Discount__c.countMatches(separator)==1 && !projectPrice.Default_Discount__c.contains(nonLocaleSeparator))
      {
        if(separator == ',')
        {
          projectPrice.Default_Discount__c = projectPrice.Default_Discount__c.replace(separator,'.');

        }                   
      }
      else
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount');
        throw new  PAException('<html>'+'Invalid Discount'+'</html>',ApexPages.Severity.ERROR);
      }
    }
    //ver 3.8 ends

    if(desiredAction=='new')
    {   
      currentRequest.pricingRequest.pricing_Request_type__c='Project Pricing';
      projectSelection='new';
      return 'PANewProject';
    }

    else if(desiredAction=='current')
    {
      projectSelection='current';
      return 'PANewProject';
    }

    //<TJ20140505> Added condition to navigate to home page on clicking Landing Page Link
    else if(desiredAction.containsIgnoreCase('landingpage'))
    {
      return newPageLabel;
    }
    else if(desiredAction=='all')
    {
      projectSelection='all';
      return 'PANewProject';
    }
    else if(desiredAction=='cancelNewProject')
    {
      system.debug('***in side cancel'+newPagelabel);
      projectSelection=null;
      projectPrice=new Project_Price__c();
      // <PS20130424> Ver 4.2 PS 2013-04-26 APAC Rollout-on click of cancel in case of 'Edit header' button,navigate to PAPricingRequest page
      if(editHeaderApproved == 'editHeaderApprovedProject')
      {
        return 'PAPricingRequest';
      }
      //ended
      return 'PANewProject';
    }

    else if(desiredAction=='insertProject')
    {
      string retErrorMessage = validate(desiredAction);
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else 
      { 
        if(currentRequest.userSelected <> NULL){
          projectPrice.Assigned_To__c = (Id)currentRequest.userSelected;
        }

        // ver 3.9 starts
        Integer numOfDecimalPlacesAllowed=2;
        //<TJ20150603>
        if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c!=' ' && projectPrice.Default_Discount__c!='')
        {
          Integer numofDecimalPlaces = Decimal.valueOf(projectPrice.Default_Discount__c).scale();
          if(numofDecimalPlaces>numOfDecimalPlacesAllowed && doRoundOff=='NO')
          {
            dispRoundOffMessage=true;
            projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount');
            return currentPageLabel;
          }
          if(doRoundOff=='yes')
          {
            doRoundOff='NO';
            dispRoundOffMessage=false;
            Decimal roundOfRate=Decimal.valueOf(projectPrice.Default_Discount__c);
            roundOfRate=roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN);
            projectPrice.Default_Discount__c = String.valueOF(roundOfRate);
          } 
        // ver 3.9 ends 
        
        //ver  3.3  starts
        //<PP20130424> START
          calculatePlusMinusRate();
        //<PP20130424> END
        }
        //ver  3.3  ends
        System.debug('*****before insertproject save');
        if(projectPrice.id==null)
        {
          insertProject();
        }

        currentRequest.pricingRequest.Request_Approval_Status__c='Draft';
        //call ogitem method
        currentRequest.customer.ogitems.ogItemFromRequest(currentRequest.pricingRequest);

        //populate Kc
        kcListOptions=currentRequest.keyCombination.getListOptions();

        //ver 3.8 stsrts
        //<TJ20150603>
        if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains('.') )
        {
          String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
          tempStorageMap.put('defaultDiscount',replacedDisc);
        }
        else{
          tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
        }
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8 ends
        return newPagelabel;
      }            
    }
    else if(desiredAction.containsIgnoreCase('FetchMaterialRecords'))
    {   
      relatedListFetchRecord = new List<PARelatedList>();
      Pricing_Request__c priReq = new Pricing_Request__c(); 

      string retErrorMessage;
      try
      {
        priReq = [SELECT id,Project_Price__c FROM Pricing_Request__c WHERE Project_Price__c=:projectPrice.id];
      }
      catch(QueryException e)
      {   
        retErrorMessage = validate('validateRequest');

      }
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else
      {
        if(priReq.Id == null)
        {
          insertRequest();
        }   
      }
      projectSelection='FetchRecords';
      relatedListFetchRecord=getListWrappers();

      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      return newPagelabel; 
    }
    else if(desiredAction=='addSelectedMaterialsToRequest')
    {  

      string retErrorMessage = validate('validateKeyValue');
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else
      { //<PS20130424>
        try {
          addSelectedMaterialsToRequest();         
        }
        catch (Exception e) {
          if(e.getMessage().contains('Selected records already available'))
          {
            throw new  PAException(e.getdmlMessage(0),ApexPages.Severity.ERROR);
          }
          else{
            throw e;
          }   
        }

      }   
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8 
      return newPagelabel;   
    }
    else if(desiredAction=='AddMaterialToRequest')
    {  
      relatedListFetchRecord = new List<PARelatedList>();
      Pricing_Request__c priReq = new Pricing_Request__c(); 
      string retErrorMessage;

      try
      {
        priReq = [SELECT id,Project_Price__c FROM Pricing_Request__c WHERE Project_Price__c=:projectPrice.id];
      }
      catch(QueryException e)
      {   
        retErrorMessage = validate('validateRequest');
      }

      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else
      {
        if(priReq.Id == null)
        {
          insertRequest();
        }   
      }

      retErrorMessage = validate('validateFilterCriteria');
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount');
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else
      {

        string errorMessage =validate('validateMaterialCode');
        if( ! string.isBlank(errorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+errorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else
        {   
          /** version 1.6
                    adding SAP Cluster condition -neeha
           */
          //<PP20130715>
          //<PP20131231>
          List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                            Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c  FROM Organizational_Group_Item__c
                                                            WHERE Business__c =:paOGItem.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.customer.paERPCustomer.Sales_Org_Code__c
                                                            AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                                            OrgGroup__r.ERP_Division_Code__c = :currentRequest.customer.paERPCustomer.division_code__c limit 1];    
          String sppId;
          // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Creating a local variable to hold configurable field value
          boolean enableVarConfigMaterial=false;
          if(buOrgGroup!=null && buOrgGroup.size()!=0){
            sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
            // <VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Assingning configurable field value to the local variable
            enableVarConfigMaterial = buOrgGroup.get(0).Enable_Variable_Config_Materials__c;
          }
          List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                  SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];
          String sourceCluster;
          if(sppList!=null && sppList.size()!=0)
          {
            sourceCluster=sppList.get(0).SAP_Cluster__c;
          }
          System.debug('***sourceCluster'+sourceCluster);                                                 
          /*adding source cluster end*/
          list<Material__c> materialsDetailsList  =new list<Material__c>();
          //populate related list ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id 
          //<VR20130510> Ver 4.5 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
          //<SP20140428> START
          if(enableVarConfigMaterial)
          {
            materialsDetailsList = [SELECT id, ERP_Material_Code__c,Name,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,
                                    ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                    ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,
                                    ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,
                                    ERP_Product_Hierarchy_Code__c,Product_Hierarchy__c,ERP_Profit_Center__c,ERP_Profit_Center_Code__c
                                    FROM Material__c where  ERP_Material_Code__c IN :splitSelectedMaterialList 
                                    AND ERP_Sales_Org_Code__c =:currentRequest.customer.paERPCustomer.Sales_Org_Code__c 
                                    AND ERP_Distribution_Channel_Code__c =:currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c 
                                    AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial]; 
          }
          else
          {
            materialsDetailsList = [SELECT id, ERP_Material_Code__c,Name,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,
                                    ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                    ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,
                                    ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,
                                    ERP_Product_Hierarchy_Code__c,Product_Hierarchy__c,ERP_Profit_Center__c,ERP_Profit_Center_Code__c
                                    FROM Material__c where  ERP_Material_Code__c IN :splitSelectedMaterialList 
                                    AND ERP_Sales_Org_Code__c =:currentRequest.customer.paERPCustomer.Sales_Org_Code__c 
                                    AND ERP_Distribution_Channel_Code__c =:currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c 
                                    AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND RecordTypeId = :Material_RTYPE_Id];
          } 

          PARelatedList c = new PARelatedList();
          c.sObjectTypeName=Material__c.sObjectType.getDescribe().getName().toLowerCase();
          c.keyCombinationColumns = Schema.SObjectType.Material__c.fieldSets.getMap().get('PAMaterial').getFields();
          c.wrapperList = new List<PAWrapper>();

          for(Material__c X:materialsDetailsList)
          {
            PAWrapper rw = new PAWrapper();
            rw.stringMap =new map<string,string>();
            rw.sobjectRecord = X;
            rw.isSelected = true;
            c.wrapperList.add(rw);
          }
          relatedListFetchRecord.add(c);

          //Call addselectedTo Request method
          //<PS20130424>
          try {
            addSelectedMaterialsToRequest();         
          }
          catch (Exception e) {
            if(e.getMessage().contains('Selected records already available'))
            {
              throw new  PAException(e.getdmlMessage(0),ApexPages.Severity.ERROR);
            }
            else{
              throw e;
            }   
          }
        }
      }   
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      return newPagelabel; 
    }
    else if(desiredAction=='addSelectedPHToRequest')
    {       
      string retErrorMessage = validate('validateKeyValue');
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else
      {
        // <PS20130424>
        try {
          addSelectedPHToRequest();           
        }
        catch (Exception e) {
          if(e.getMessage().contains('Selected records already available'))
          {
            throw new  PAException(e.getdmlMessage(0),ApexPages.Severity.ERROR);
          }
          else{
            throw e;
          }   
        } 
      }    
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;             
    }

    else if(desiredAction=='doneAddedToRequest')
    {   
      if(projectPrice.PricingCondition_Id__c != null)
      {
        currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
      }
      kcListOptions=currentRequest.keyCombination.getListOptions();

      // <PS20130424> Ver 4.2 PS 2013-04-26 APAC Rollout-to upsert the request name for dummy request name (in case of selecting 'NO' in the alert msg)
      if(editHeaderApproved == 'editHeaderApprovedProject')
      {
        upsert currentrequest.pricingRequest;
      }
      //ended
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;  
    } 
    else if(desiredAction=='doneAddedToRequestApproved')
    {   
      system.debug('*** in side addRecordToReqForApprovedProject action:'+desiredAction);
      if(newRequestFlag)
      {   
        string retErrorMessage = validate('validateRequest');
        if( ! string.isBlank(retErrorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else{
          insertRequest();
          newRequestFlag=false;

        }
      }

      dispNext=false;
      projectSelection='projectId';
      dispRecordsFromSAP='IdApprovedProject';

      //populate KC 
      if(projectPrice.PricingCondition_Id__c != null)
      {
        currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
      }
      kcListOptions=currentRequest.keyCombination.getListOptions();
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;  
    } 
    else if(desiredAction=='doneAddedToRequestClone')
    {   

      if(newProjectFlag)
      {   
        projectAction='clone';
        string retErrorMessage = validate('insertProject');
        if( ! string.isBlank(retErrorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else
        {
          //Create New project
          Project_Price__c newProjectObj= new  Project_Price__c ();
          //ver  3.3  starts
          //<MG20160303>
        defaultdiscounthandle(projectPrice);
          if(projectPrice.PricingCondition_Id__c != null)
          {
            currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
          }
          if(defdisbool==true &&(currentRequest.pricingCondition.pricingCondition!=null && currentRequest.pricingCondition.pricingCondition.Plus_Minus__c != null )){
            Decimal roundOfRate = Decimal.valueOf(projectPrice.Default_Discount__c).abs();
            if(currentRequest.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X'){
              roundOfRate= (-1) * roundOfRate;
            }
            roundOfRate=roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN);
            newProjectObj.Default_Discount__c = String.valueOF(roundOfRate);
          }

          //ver  3.3 ends

          newProjectObj.Pricing_Condition__c=projectprice.Pricing_Condition__c;
          newProjectObj.Pricing_Condition_Code__c=projectprice.Pricing_Condition_Code__c;
          newProjectObj.PricingCondition_Id__c=projectprice.PricingCondition_Id__c;
          newProjectObj.Sold_To_Code__c=currentRequest.customer.paERPCustomer.Customer_code__c;
          newProjectObj.Name=projectprice.Name;
          newProjectObj.Project_Volume__c=projectprice.Project_Volume__c;
          newProjectObj.Valid_From__c=projectprice.Valid_From__c;
          newProjectObj.Valid_To__c=projectprice.Valid_To__c;
          newProjectObj.Assigned_To__c = (Id)currentRequest.userSelected;
          newProjectObj.Project_Description__c=projectprice.Project_Description__c;
          newProjectObj.Project_Status__c='Draft';


          //ver 2.8 starts
          if(paOGItem.selectedUser != null && !String.isBlank(paOGItem.userName))
          {
            newProjectObj.OwnerId = ID.valueOf(paOGItem.selectedUser);
          }
          //ver 2.8 ends

          insert newProjectObj;
          newProjectFlag=false;

          //projectprice is holding the new project inserted
          projectPrice=[SELECT Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                        Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,
                        status__c,isApproved__c FROM Project_Price__c WHERE Id=:newProjectObj.id];
        }
      }

      if(newRequestFlag)
      {   
        string retErrorMessage = validate('validateRequest');
        if( ! string.isBlank(retErrorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else{
          insertRequest();
          newRequestFlag=false;

        }
      }

      //populate KC
      if(projectPrice.PricingCondition_Id__c != null)
      {
        currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
      }
      kcListOptions=currentRequest.keyCombination.getListOptions();
      dispNext=false; //to disbale editable fields in clone
      projectSelection='clone';

      //ver 3.8
      //<TJ20150603>
      if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains('.') )
      {
        String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
        tempStorageMap.put('defaultDiscount',replacedDisc);
      }
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;  
    } 
    else if(desiredAction=='goToRequest')
    {   
      currentRequest.materialFilter=null;
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8      
      return newPagelabel;  
    } 
    else if(desiredAction=='EditProject')
    {
        //<MG20160303> start
       defaultdiscounthandle(projectPrice);
        //<MG20160303> ends
        
      string retErrorMessage = validate('insertProject');
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
      else
      {   //<MG20160303> start - added below if condition
           if(defdisbool==true)
           {
        //ver 3.9 starts
        Integer numOfDecimalPlacesAllowed=2;
        Integer numofDecimalPlaces = Decimal.valueOf(projectPrice.Default_Discount__c).scale();
        if(numofDecimalPlaces>numOfDecimalPlacesAllowed && doRoundOff=='NO')
        {
          dispRoundOffMessage=true;
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          return currentPageLabel;
        }
        if(doRoundOff=='yes')
        {
          doRoundOff= 'NO';
          dispRoundOffMessage=false;
          Decimal roundOfRate=Decimal.valueOf(projectPrice.Default_Discount__c);
          roundOfRate=roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN);
          projectPrice.Default_Discount__c = String.valueOF(roundOfRate);

          //ver 3.8 starts
          if(projectPrice.Default_Discount__c.contains('.') )
          {
            String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
            tempStorageMap.put('defaultDiscount',replacedDisc);
          }
          //ver 3.8 ends
        
        //ver 3.9 ends

        //goToRequestAfterEdit();
      }
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
     // return newPagelabel;
      }
          goToRequestAfterEdit();
           return newPagelabel;
          
      }
    }//<MG20160303> start 
      else if(desiredAction=='EditApprovrdProject')
    {
         //<MG20160303> start
       defaultdiscounthandle(projectPrice);
        //<MG20160303> ends
        
      string retErrorMessage = validate(desiredAction);
      if( ! string.isBlank(retErrorMessage))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
        throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
      }
                  
          
      else
      {  
          //ver 3.9 starts
          //<MG20160303> start
          if(defdisbool==true)
       {
        Integer numOfDecimalPlacesAllowed=2;
        Integer numofDecimalPlaces = Decimal.valueOf(projectPrice.Default_Discount__c).scale();
        if(numofDecimalPlaces>numOfDecimalPlacesAllowed && doRoundOff=='NO')
        {
          dispRoundOffMessage=true;
          //ver 3.8
          if(projectPrice.Default_Discount__c.contains('.') )
          {
            String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
            tempStorageMap.put('defaultDiscount',replacedDisc);
          }
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          return currentPageLabel;
        }
        if(doRoundOff=='yes')
        {
          doRoundOff='NO';
          dispRoundOffMessage=false;
          Decimal roundOfRate=Decimal.valueOf(projectPrice.Default_Discount__c);
          roundOfRate=roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN);
          projectPrice.Default_Discount__c = String.valueOF(roundOfRate);

          //ver 3.8 starts
          if(projectPrice.Default_Discount__c.contains('.') )
          {
            String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
            tempStorageMap.put('defaultDiscount',replacedDisc);
          }
          //ver 3.8 ends
        }
        //ver 3.9 ends
       }//<MG20160303> ends
        Date todayDate;
        todayDate=Date.today();
        dispNext=false; 

        Project_Price__c pp=[select Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                             Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,status__c,isApproved__c 
                             FROM Project_Price__c WHERE Id=:projectPrice.Id];
        // ver  3.3  starts
        if(projectPrice.PricingCondition_Id__c != null)
        {
          currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
        }
        //<PP20130424> START
        calculatePlusMinusRate();
        //<PP20130424> END
        /*<PP20130424>
                if(currentRequest.pricingCondition.pricingCondition!=null && currentRequest.pricingCondition.pricingCondition.Plus_Minus__c != null )
                {
                        Decimal roundOfRate = Decimal.valueOf(projectPrice.Default_Discount__c).abs();
                        if(currentRequest.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X'){
                        roundOfRate= (-1) * roundOfRate;
                        }
                        projectPrice.Default_Discount__c = String.valueOF(roundOfRate);

                }*/
        //ver  3.3 ends 
        //ver 3.8 starts
        //<MG20160303>
        if(defdisbool==true &&(projectPrice.Default_Discount__c.contains('.') ))
        {
          String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
          tempStorageMap.put('defaultDiscount',replacedDisc);
        }
        else{
          tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
        }
        //ver 3.8 ends


        system.debug('**** editing approved privateproject volume:'+pp.Project_Volume__c +'project volume' +projectPrice.Project_Volume__c);
        system.debug('**** editing approved privateproject volume:'+pp.Project_Description__c +'project volume' +projectPrice.Project_Description__c);
        if(pp.Project_Description__c==null)
        {
          pp.Project_Description__c='';
        }     
        if( pp.Project_Volume__c ==projectPrice.Project_Volume__c && pp.Project_Description__c == projectPrice.Project_Description__c &&
            pp.Valid_From__c ==projectPrice.Valid_From__c && pp.Valid_To__c == projectPrice.Valid_To__c && pp.Default_Discount__c ==projectPrice.Default_Discount__c) 
        {
          dispNext=true;
        }
        // upsert the project if only dd is edited
        if(pp.Project_Volume__c ==projectPrice.Project_Volume__c && pp.Project_Description__c == projectPrice.Project_Description__c &&
            pp.Valid_From__c ==projectPrice.Valid_From__c && pp.Valid_To__c == projectPrice.Valid_To__c && pp.Default_Discount__c !=projectPrice.Default_Discount__c)
        {
          // <PS20130424> Ver 4.2 PS 2013-04-24 APAC Rollout-added editHeaderApproved in the IF CONDITION for 'edit header' button for approved project
          if(projectSelection == 'editApproved' && editHeaderApproved == 'editHeaderApprovedProject'){
            upsert projectPrice;
            //
            currentRequest.projectPrice = projectPrice;
            return 'PAPricingRequest';
          }
          projectPrice.Approved_Default_Discount__c=projectPrice.Default_Discount__c;
          upsert projectPrice;
          projectSelection=null;
          projectPrice=new Project_Price__c();
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          return 'PANewProject';

        }

        if(pp.Project_Volume__c != projectPrice.Project_Volume__c  || pp.Project_Description__c !=projectPrice.Project_Description__c   )
        {   
          // <PS20130424> Ver 4.2 PS 2013-04-24 APAC Rollout-added editHeaderApproved in the IF CONDITION for 'edit header' button for approved project
          if(projectSelection == 'editApproved' && editHeaderApproved == 'editHeaderApprovedProject'){
            upsert projectPrice;
            currentRequest.projectPrice = projectPrice;
            dispAlert=false;
            return 'PAPricingRequest';
          }
          dispAlert=true;
        }
        system.debug('**** editing approved Valid From:'+pp.Valid_From__c +'project' +projectPrice.Valid_From__c+'**** editing approved Valid To:'+pp.Valid_To__c +'project' +projectPrice.Valid_To__c);
        if(test.isRunningTest() || pp.Valid_From__c !=projectPrice.Valid_From__c ||  pp.Valid_To__c !=projectPrice.Valid_To__c )
        {
          // <PS20130424> Ver 4.2 PS 2013-04-24 APAC Rollout-added editHeaderApproved in the IF CONDITION for 'edit header' button 
          List<PARelatedList> relatedWrappersList = new List<PARelatedList>();
          if(projectSelection == 'editApproved' && editHeaderApproved == 'editHeaderApprovedProject')
          {
            List<Pricing_Request_item__c> requestItemList = new List<Pricing_Request_item__c>();
            //<VR20130509> Ver 4.4 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
            //<PP20131028>
            //<PP20131231>
            //<MS20140516> Added Variant and SalesOrderType fields in the query
            //<SS20220826> - Added Sales Order Item values in below query.
            //<SS20230501>
            requestItemList = [SELECT Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,Ship_To_Country__c,Ship_To_Country_Code__c,Pricing_Request__r.Display_Standardized_Rate__c,USD_Rate__c,Base_UoM__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract__c,Contract_Code__c,Variant_Code__c,Variant__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Country_Code__c,Disc_Ref__c,
                               ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,
                               Country__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Scale_UoM_Scale_Unit__c,
                               Key_Combination_SFDC__c,Valid_To__c,Valid_From__c,UoM__c,Unit__c,Terms_Of_Payment__c,
                               Terms_Of_Payment_Code__c,SystemModstamp,Stamp_Reference_Price__c,Stamp_Reference_Net_Price__c,
                               Stamp_New_Net_Price__c, Stamp_Floor_Price__c, Stamp_Floor_Net_Price__c,Stamp_Current_Net_Price__c,
                               Stamp_Converted_Current_Price__c,Sold_To__c,Sold_To_Code__c,ShipTo__c,ShipTo_Code__c,Scaled_Price_Flag__c,
                               ScaleRate9__c,ScaleRate8__c,ScaleRate7__c,ScaleRate6__c,ScaleRate5__c,ScaleRate4__c,ScaleRate3__c,
                               ScaleRate2__c,ScaleRate1__c,ScaleRate10__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value8__c,
                               Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value5__c,
                               Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value2__c,
                               Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value10__c,Sales_Org__c,Sales_Org_Code__c,
                               Sales_Office__c,Sales_Office_Code__c,SAP_Cluster__c,SAP_Client_Id__c,SAP_Application_Id__c,Rate__c,
                               Quantity__c,Plus_Minus__c,Plus_Minus_Code__c,Calculation_Type__c,Calculation_Type_Code__c,Check_Scale__c,
                               Check_Scale_Code__c,Condition_Class__c,Condition_Class_Code__c,Scale_Basis__c,Scale_Basis_Code__c,
                               Scale_Type_Code__c,Profit_Center__c,Profit_Center_Code__c,Product_Hierarchy__c,Pricing_Request__c,
                               Pricing_Request__r.Spot_Type__c,Pricing_Request__r.Pricing_Request_Type__c,Pricing_Request_Type__c,
                               Pricing_Condition__c,Pricing_Condition_Code__c,Price_List_Type__c,Price_List_Type_Code__c,Per__c,
                               PH9__c,PH9_Code__c,PH8__c,PH8_Code__c,PH7__c,PH7_Code__c,PH6__c,PH6_Code__c,PH5__c,PH5_Code__c,PH4__c,
                               PH4_Code__c,PH3__c,PH3_Code__c,PH2__c,PH2_Code__c,PH1__c,PH1_Code__c,PCKC__c,Non_Commercial_Products__c,
                               New__c,New_Valid_To__c,New_Valid_From__c,New_UoM__c,New_Unit__c,New_Rate__c,Pricing_Task_UoM__c,New_Per__c,
                               Name,Material__c,Material_Price_Group__c,Material_Price_Group_Code__c,Material_Code__c,LastModifiedDate,
                               LastModifiedById,LastActivityDate,Key_Combination__c,Key_Combination_Code__c,IsDeleted,Incoterms_Code__c,
                               Incoterms2__c,Inco_terms__c,Id,Gap__c,Gap_Pricing_Request_Item__c,Expire__c,End_User__c,End_User_Code__c,
                               End_Use__c,End_Use_Code__c,Edit__c,ERP_Sales_Prices_SAP__c,Division__c,Division_Code__c,Dist_Channel__c,
                               Dist_Channel_Code__c,Customer_Specific__c,Customer_Price_Group__c,Customer_Price_Group_Code__c,Currency__c,
                               CreatedDate,CreatedById,Below_Reference_Flag__c,Below_Floor_Flag__c,Below_Current_Flag__c,Approver5__c,
                               Approver5_Date__c,Approver4__c,Approver4_Date__c,Approver3__c,Approver3_Date__c,Approver2__c,Approver2_Date__c,
                               Scale_Type__c,Approver1__c,Approver1_Date__c,Approved_Date__c,Approval_Status__c,Customer_Hierarchy__c,Customer_Hierarchy_Code__c,
                               Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,
                               Gap_Pricing_Request_Item__r.New_Rate__c,Gap_Pricing_Request_Item__r.New_Per__c,Gap_Pricing_Request_Item__r.New_Unit__c,
                               Gap_Pricing_Request_Item__r.New_UoM__c,Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,
                               Gap_Pricing_Request_Item__r.Rate__c,Gap_Pricing_Request_Item__r.Per__c,Gap_Pricing_Request_Item__r.Unit__c,
                               Gap_Pricing_Request_Item__r.UoM__c,Pricing_Request__r.Request_Valid_From__c,Pricing_Request__r.Request_Valid_To__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,
                               Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,
                               Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c      
                               FROM Pricing_Request_Item__c WHERE Pricing_Request__c = :currentRequest.pricingRequest.Id];

            for(Pricing_Request_Item__c rI :requestItemList )
            {
              PARelatedList c = new PARelatedList();
              c.wrapperList = new List<PAWrapper>();
              PAWrapper rw = new PAWrapper();
              rw.stringMap =new map<string,string>();
              rw.sobjectRecord = rI;
              c.wrapperList.add(rw);
              relatedWrappersList.add(c);
            }
            dispRecordsFromSAP='editApprovedProject';
            //display the checkbox disabled
            selectAll='yes';
            dispAlert=false;
            disableFields=false;
            editApprovedAll=true;

            List<PARelatedList> sapRelatedList = getListWrappers(); 
            List<ERP_Sales_Prices_SAP__c> tempList = new List<ERP_Sales_Prices_SAP__c>();
            Map<String,Schema.FieldSet> fieldSetMap = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap();
            List<Schema.FieldSetMember> kcFields = fieldSetMap.get('PAPricingRecordsColumns').getFields();
            List<Schema.FieldSetMember> commonFields = fieldSetMap.get('PAPricingRecordCommonColumns').getFields();
            List<Schema.FieldSetMember> soldToFields = fieldSetMap.get('PASoldTo').getFields();
            List<Schema.FieldSetMember> commonSet = new List<Schema.FieldSetMember>();
            String sObjectName = ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
            List<Schema.FieldSetMember> dateFields = fieldSetMap.get('PAPricingRecordDateColumns').getFields();
            List<PARelatedList> relatedListProject = new List<PARelatedList>();
            List<ERP_Sales_Prices_SAP__c> sapListRecords = new List<ERP_Sales_Prices_SAP__c>();
            System.debug('**** SAP Related List'+sapRelatedList.size()); 
            List<PAWrapper> sapWrapperList = new List<PAWrapper>();
            List<PAWrapper> reqWrapperList = new List<PAWrapper>();

            for(Integer i =0;i<sapRelatedList.size();i++)
            {
              sapWrapperList.addAll(sapRelatedList[i].wrapperList);
            }
            for(Integer i =0;i<relatedWrappersList.size();i++)
            {
              reqWrapperList.addAll(relatedWrappersList[i].wrapperList);
            }

            List<Id> idsToBeRemoved = new List<Id>();
            Map<Id,Pricing_Request_Item__c> sapPriReqItemMap = new Map<Id,Pricing_Request_Item__c>();
            Map<Id,ERP_Sales_Prices_SAP__c> sapRecordsMap = new Map<Id,ERP_Sales_Prices_SAP__c>();
            string conCat;
            set<string> PCKCConcatSet = new set<string>();
            Map<string,List<ERP_Sales_Prices_SAP__c>> pcKCConcatSAP = new Map<string,List<ERP_Sales_Prices_SAP__c>>();

            for(PAWrapper wrap:reqWrapperList)
            {
              Pricing_Request_Item__c prq = (Pricing_Request_Item__c)wrap.sObjectRecord;
              sapPriReqItemMap.put(prq.ERP_Sales_Prices_SAP__c,prq);
            }
            for(PAWrapper wrap:sapWrapperList)
            {
              ERP_Sales_Prices_SAP__c erpSales = (ERP_Sales_Prices_SAP__c)wrap.sObjectRecord;
              sapRecordsMap.put(erpSales.Id,erpSales);
            }
            for(Id sapId:sapRecordsMap.keySet())
            {
              if(sapPriReqItemMap.get(sapId)!=null)
              {
                idsToBeRemoved.add(sapId);
              } 
            }        

            for(Id ids:idsToBeRemoved)
            {
              sapRecordsMap.remove(ids); 
            }

            for(ERP_Sales_Prices_SAP__c ERPSales : sapRecordsMap.values())
            {
              tempList = new List<ERP_Sales_Prices_SAP__c>();
              concat =  ERPSales.Pricing_Condition_Code__c + '-' +ERPSales.Pricing_Condition__c + ':' +ERPSales.Key_Combination_Code__c + '-' +ERPSales.Key_Combination__c;
              PCKCConcatSet.add(concat);
              if(pcKCConcatSAP.get(concat)!=null)
              {
                tempList = pcKCConcatSAP.get(concat);
                tempList.add(ERPSales);
                pcKCConcatSAP.put(concat,tempList);
              }
              else
              {
                tempList.add(ERPSales);
                pcKCConcatSAP.put(concat,tempList);
              }
            }
            for(String s : PCKCConcatSet)
            {

              PARelatedList c = new PARelatedList(); 
              c.wrapperList = new List<PAWrapper>();
              List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
              for(Schema.FieldSetMember fSet : kcFields)
              {
                String fLabel = fSet.getLabel();
                String replacedS = s.replace('Material Price Group','');
                if(fLabel.contains('Material') &&(!fLabel.contains('Price'))&&(replacedS.contains('Material')))
                {
                  kcSet.add(fSet);
                }
                if(fLabel.contains('Material Price Group') &&(s.contains('Material Price Group')))
                {
                  kcSet.add(fSet);
                }
                if(!fLabel.contains('Material') &&(s.remove(' ').toLowerCase().contains(fLabel.remove(' ').toLowerCase()) || s.remove(' ').toLowerCase().contains(fLabel.replace(' Code','').remove(' ').toLowerCase())))
                {
                  kcSet.add(fSet);
                }
                if(fLabel.contains('Product Hierarchy') &&(s.contains('PH')))
                {
                  kcSet.add(fSet);
                }
              }
              c.keyCombinationColumns = kcSet;

              for(Schema.FieldSetMember cSet : commonFields)
              {
                String cLabel = cSet.getLabel();
                if(!cLabel.contains('Per') && !cLabel.contains('UoM'))
                {

                  kcSet.add(cSet);
                }
              }
              c.priceType = s;
              c.keyCombinationColumns = kcSet;
              c.sObjectTypeName=sObjectName;
              system.debug('KCSet'+c.keyCombinationColumns);
              for(ERP_Sales_Prices_SAP__c ERPSales : pcKCConcatSAP.get(s))
              {
                PAWrapper rw = new PAWrapper();
                rw.stringMap =new map<string,string>();
                rw.stringMap.put('rateLocale','');
                if(!String.isBlank(ERPSales.Rate__c))
                {
                  String r = Decimal.valueOf(ERPSales.Rate__c).format();
                  rw.stringMap.put('rateLocale',r);
                }
                if(selectAll=='yes')
                {
                  rw.isSelected = true;
                  rw.stringMap.put('disableCheckBox','true');
                }
                else
                {
                  rw.isSelected = false;
                }

                rw.sObjectRecord = ERPSales;
                c.wrapperList.add(rw);
              }
              relatedListProject.add(c);
            }

            If(sapRecordsMap.size() == 0)
            {
              dispDoneButton = 'dipsDoneSAP';
            }

            relatedListSAPRecord = relatedListProject;
            upsert projectPrice;
            //changing valid from and Valid To
            for(Pricing_Request_Item__c r :requestItemList)
            {                       
              //prachi 14th may uncommenting
              r.New_Valid_From__c=projectPrice.Valid_From__c;
              r.New_Valid_To__c = projectPrice.Valid_To__c;
            }

            upsert requestItemList;
            currentRequest.projectPrice = projectPrice; 
            //make the request name editable in case of selecting 'NO' in the alert (for Edit Header)       
            if(currentRequest.pricingRequest.Request_Name__c =='Project Header Approval Request')
            {
              currentRequest.pricingRequest.Request_Name__c = null;
            }                       
            upsert currentRequest.pricingRequest;

            projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8 
            return newPagelabel;

          }
          //ended valid to roll out

          system.debug('***Approved Project Date change');
          selectAll='yes';
          dispAlert=false;
          disableFields=false;
          dispRecordsFromSAP='editApprovedProject'; 
          newRequestFlag=true;
          editApprovedAll=true;
          currentRequest.pricingRequest.Request_Approval_Status__c='Draft';
          relatedListSAPRecord = new List<PARelatedList>();
          relatedListSAPRecord=getListWrappers();

          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          return newPagelabel;
        }   
        // <PS20130424> Ver 4.2 PS 2013-04-24 APAC Rollout-added editHeaderApproved in the IF CONDITION- 'edit header' button for approved project; navigate to pricingRequest page without editing if no change done
        if(projectSelection == 'editApproved' && editHeaderApproved == 'editHeaderApprovedProject')
        {
          //upsert projectPrice;
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          return 'PAPricingRequest';
        }
      }
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;
    }
    else if(desiredAction=='yesRecordLevelChange')
    {
      dispAlert=false;
      disableFields=false;
      dispRecordsFromSAP='editApprovedProject'; 
      newRequestFlag=true;
      editApprovedAll=false;
      currentRequest.pricingRequest.Request_Approval_Status__c='Draft';
      relatedListSAPRecord = new List<PARelatedList>();
      relatedListSAPRecord=getListWrappers();
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;
    }
    else if(desiredAction=='NoRecordLevelChange') //added by anand on 19 FEB
    {
      dispAlert=false;
      upsert projectPrice;
      // FIX FOR IS ID-00041544 ID START
      Pricing_Request__c PRReqReason = [SELECT Id,Request_Reason__c,Project_Price_Name__c FROM Pricing_Request__c WHERE Request_Approval_Status__c = 'Approved' AND  Project_Price_Name__c =:projectPrice.id LIMIT 1 ];
      currentRequest.pricingRequest.Request_Reason__c=PRReqReason.Request_Reason__c;
      // FIX FOR IS ID-00041544 ID END 
      //create dummy Requst for header level Approval
      currentRequest.pricingRequest.Request_Name__c='Project Header Approval Request';
      currentRequest.pricingRequest.Request_Approval_Status__c='Draft';
      currentRequest.pricingRequest.Project_Header_Approval_Flag__c=true; //ver 3.5
      currentRequest.pricingRequest.BU__c = currentRequest.selectedBU;
      currentRequest.pricingRequest.Request_Type__c = 'Customer Specific';
      currentRequest.pricingRequest.Pricing_Request_Type__c = 'Project Pricing';
      currentRequest.pricingRequest.Spot_Type__c=null;
      currentRequest.pricingRequest.Customer_Specific__c = true;
      currentRequest.pricingRequest.Dist_Channel_Code__c =currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
      currentRequest.pricingRequest.Dist_Channel__c = currentRequest.customer.paERPCustomer.Distribution_Channel__c;
      currentRequest.pricingRequest.Division_Code__c = currentRequest.customer.paERPCustomer.Division_Code__c;
      currentRequest.pricingRequest.Division__c = currentRequest.customer.paERPCustomer.Division__c;
      currentRequest.pricingRequest.Sales_Org_Code__c = currentRequest.customer.paERPCustomer.Sales_Org_Code__c;   
      currentRequest.pricingRequest.Sales_Org__c = currentRequest.customer.paERPCustomer.Sales_Org__c;
      //modified - bala 7th March

      if(currentRequest.customer.ogitems.selectedUser==null)
        currentRequest.customer.ogitems.selectedUser = Userinfo.getUserId();
      system.debug('*** Id expected'+currentRequest.customer.ogitems.selectedUser);
      currentRequest.pricingRequest.OwnerId = (Id)currentRequest.customer.ogitems.selectedUser;
      currentRequest.pricingRequest.On_Behalf_Of__c = currentRequest.customer.ogitems.selectedUser; 

      currentRequest.pricingRequest.Sold_To__c = currentRequest.customer.paERPCustomer.Name;
      currentRequest.pricingRequest.Zip_PostalCode__c = currentRequest.customer.paERPCustomer.Zip_Postal_Code__c;
      currentRequest.pricingRequest.City__c = currentRequest.customer.paERPCustomer.City__c;
      currentRequest.pricingRequest.Street__c = currentRequest.customer.paERPCustomer.Street__c;
      currentRequest.pricingRequest.Country__c = currentRequest.customer.paERPCustomer.Country__c;
      currentRequest.pricingRequest.State_Province__c = currentRequest.customer.paERPCustomer.State_Province__c;
      currentRequest.pricingRequest.Request_Valid_From__c=projectPrice.Valid_From__c;
      currentRequest.pricingRequest.Request_Valid_To__c=projectPrice.Valid_To__c; 
      system.debug('***p ID'+projectPrice.id);
      currentRequest.pricingRequest.Project_Price__c=projectPrice.id;
      currentRequest.pricingRequest.Project_Id__c=projectPrice.Project_Id__c;
      currentRequest.pricingRequest.Project_Name__c=projectPrice.Name;
      currentRequest.pricingRequest.Assigned_To__c=projectPrice.Assigned_To__c; //ver 4.3
      currentRequest.pricingRequest.Project_Price_Name__c=projectPrice.id; //ver 4.3
      System.debug('sireesha project id:'+ currentRequest.pricingRequest.Project_Price_Name__c);
      currentRequest.pricingRequest.Terms_Of_Payment__c = currentRequest.customer.paERPCustomer.Terms_Of_Payment__c;
      currentRequest.pricingRequest.Terms_Of_Payment_Code__c = currentRequest.customer.paERPCustomer.Terms_Of_Payment_Code__c;
      currentRequest.pricingRequest.Incoterm__c = currentRequest.customer.paERPCustomer.Incoterms_1__c;
      currentRequest.pricingRequest.Incoterms_Code__c = currentRequest.customer.paERPCustomer.Incoterms_1_Code__c;
      //<PP20130424> -- Ver 4.3
      currentRequest.pricingRequest.Display_Standardized_Rate__c = paOGItem.orgGroupItems.Display_Standardized_Rate__c;
      //<PP20131231> START
      currentRequest.pricingRequest.Standardized_Currency__c = paOGItem.orgGroupItems.Standardized_Currency__c;
      currentRequest.pricingRequest.Standardized_UoM__c = paOGItem.orgGroupItems.Standardized_UoM__c;
      //<PP20131231> END
      // <BR20130510>-- Ver 4.6
      currentRequest.pricingRequest.Attachments_on_Customer_Prices__c = paOGItem.orgGroupItems.Attachments_on_Customer_Prices__c;
      //<PP20130715>
      //<TJ20141114> Commenting to capture the value selected by user
      //currentRequest.pricingRequest.Request_Class__c = paOGItem.orgGroupItems.Request_Class__c;
      insert  currentRequest.pricingRequest;
      //<PP20130715>
      currentRequest.pricingRequest=[SELECT Request_Class__c,Zip_PostalCode__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                     State_Province__c,Spot_Type__c, Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                     SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                     Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,On_Behalf_Of__r.Name,
                                     Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                     LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                     Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, CreatedDate,
                                     CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                     Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                                     Approver1_Date__c,Incoterms_Code__c,SoldTo_Code__c,Project_Header_Approval_Flag__c,NPC_Status__c,Attachments_on_Customer_Prices__c,Sold_To__c,Project_Price_Name__c,ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c WHERE Id = :currentRequest.pricingRequest.Id]; 

      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;
    }
    else if(desiredAction=='closeAlertMessage')
    {
      dispAlert=false;
      dispNext=true; 
      dispRoundOffMessage=false;
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return newPagelabel;
    }
    else if(desiredAction=='addRecordToReqForApprovedProject')
    { 
      system.debug('*** in side addRecordToReqForApprovedProject action:'+desiredAction);
      if(newRequestFlag)
      {   
        string retErrorMessage = validate('validateRequest');
        if( ! string.isBlank(retErrorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else{
          insertRequest();
          newRequestFlag=false;
        }
      }
      try { 
        //<PS20130424>
        addSelectedSAPRecordsToRequest();         
      }
      catch (Exception e) {
        if(e.getMessage().contains('Selected records already available'))
        {
          throw new  PAException(e.getdmlMessage(0),ApexPages.Severity.ERROR);
        }
        else{
          throw e;
        }   
      }
    }
    else if(desiredAction=='addClonedMaterialToRequest')
    { 

      if(newProjectFlag)
      {   
        projectAction='clone';
        string retErrorMessage = validate('insertProject');
        if( ! string.isBlank(retErrorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+retErrorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else
        {   
 defaultdiscounthandle(projectPrice);
            if(defdisbool==true){
          //ver 3.9 starts
          Integer numOfDecimalPlacesAllowed=2;
          Integer numofDecimalPlaces = Decimal.valueOf(projectPrice.Default_Discount__c).scale();
          if(numofDecimalPlaces>numOfDecimalPlacesAllowed && doRoundOff=='NO')
          {
            dispRoundOffMessage=true;
            projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
            return currentPageLabel;
          }
            }
          if(doRoundOff=='yes')
          {
            doRoundOff= 'NO';
            dispRoundOffMessage=false;
            Decimal roundOfRate=Decimal.valueOf(projectPrice.Default_Discount__c);
            roundOfRate=roundOfRate.setScale(3,System.RoundingMode.HALF_EVEN);
            projectPrice.Default_Discount__c = String.valueOF(roundOfRate);
            //ver 3.8 starts
            if(projectPrice.Default_Discount__c.contains('.') )
            {
              String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
              tempStorageMap.put('defaultDiscount',replacedDisc);
            }
            //ver 3.8 ends
          }
          //ver 3.9 ends

          //Create New project
          Project_Price__c newProjectObj= new  Project_Price__c ();
          //ver  3.3  starts
          if(projectPrice.PricingCondition_Id__c != null)
          {
            currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
          }
          //<PP20130424> START
          calculatePlusMinusRate();
          //<PP20130424> END

          //ver  3.3  ends
          //ver 3.8 starts
           defaultdiscounthandle(projectPrice);
          if(defdisbool==true&&(projectPrice.Default_Discount__c.contains('.') ))
          {
            String replacedDisc = projectPrice.Default_Discount__c.replace('.',separator);
            tempStorageMap.put('defaultDiscount',replacedDisc);
          }
          else{
            tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
          }
          //ver 3.8 ends
          newProjectObj.Default_Discount__c=projectprice.Default_Discount__c;
          newProjectObj.Pricing_Condition__c=projectprice.Pricing_Condition__c;
          newProjectObj.Pricing_Condition_Code__c=projectprice.Pricing_Condition_Code__c;
          newProjectObj.PricingCondition_Id__c=projectprice.PricingCondition_Id__c;
          newProjectObj.Sold_To_Code__c=currentRequest.customer.paERPCustomer.Customer_code__c;
          newProjectObj.Name=projectprice.Name;
          newProjectObj.Project_Volume__c=projectprice.Project_Volume__c;
          newProjectObj.Valid_From__c=projectprice.Valid_From__c;
          newProjectObj.Valid_To__c=projectprice.Valid_To__c;
          newProjectObj.Assigned_To__c = (Id)currentRequest.userSelected;
          newProjectObj.Project_Description__c=projectprice.Project_Description__c;
          newProjectObj.Project_Status__c='Draft';

          //ver 2.8 starts
          if(paOGItem.selectedUser != null && !String.isBlank(paOGItem.userName))
          {
            newProjectObj.OwnerId = ID.valueOf(paOGItem.selectedUser);
          }
          //ver 2.8 ends

          insert newProjectObj;
          newProjectFlag=false;

          //projectprice is holding the new project inserted
          projectPrice=[SELECT Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                        Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,
                        status__c,isApproved__c FROM Project_Price__c WHERE Id=:newProjectObj.id];
        }
      }
      if(newRequestFlag)
      {
        //validate request                      
        string errorMessage = validate('validateRequest');
        if( ! string.isBlank(errorMessage))
        {
          projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
          throw new  PAException('<html>'+errorMessage+'</html>',ApexPages.Severity.ERROR);
        }
        else{
          insertRequest();
          newRequestFlag=false;
        }
      }
      dispNext=false;
      // <PS20130424>
      try {
        addSelectedSAPRecordsToRequest();         
      }
      catch (Exception e) {
        if(e.getMessage().contains('Selected records already available'))
        {
          throw new  PAException(e.getdmlMessage(0),ApexPages.Severity.ERROR);
        }
        else{
          throw e;
        }   
      }


    }
    // ver 3.9 starts
    else if(desiredAction=='NoRoundOff')
    { 
      dispRoundOffMessage=false;
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); //ver 3.8
      return 'PANewProject';

    }
    // ver 3.9 ends

    return null;
  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   getName
   * Parameters   :   No parameters
   * Return type  :   String
   * Description  :   
   */

  public String getName()
  {
    //return null;
    return PAService.NAME_PROJECT;
  }  

  /*
   * Author      :   Anand Darshi 
   * Method Name  :   insertProject
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method is called to create a new project
   */

  private void insertProject()
  {     
    ERP_Pricing_Condition__c pricingCondition = [SELECT Id,Pricing_Condition_Code__c,Pricing_Condition__c,Calculation_Type__c,Pricing_Condition_Description__c,Scale_Base__c,
                                                 Scale_Type__c,Check_Scale__c FROM ERP_Pricing_Condition__c WHERE Id = :currentRequest.pricingCondition.selectedPricingCondition];
    projectPrice.Pricing_Condition__c= pricingCondition.Pricing_Condition__c;
    projectPrice.Pricing_Condition_Code__c= pricingCondition.Pricing_Condition_Code__c;
    projectPrice.PricingCondition_Id__c=pricingCondition.Id;
    projectPrice.Sold_To_Code__c = currentRequest.customer.paERPCustomer.Customer_code__c;
    projectPrice.Project_Status__c='Draft';
    //ver 2.8 starts
    if(paOGItem.selectedUser != null && !String.isBlank(paOGItem.userName))
    {
      projectPrice.OwnerId = ID.valueOf(paOGItem.selectedUser);
    }
    //ver 2.8 ends
    insert projectPrice;

    projectPrice = [SELECT id,Project_Id__c,Name,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,Project_Volume__c,Sold_To_Code__c,PricingCondition_Id__c,Created_By__c,
                    Default_Discount__c,Pricing_Condition_Code__c,Pricing_Condition__c,CreatedBy.Name,Valid_From__c,Valid_To__c,status__c,Project_status__c,isApproved__c
                    FROM Project_Price__c WHERE Id =: projectPrice.Id ];

  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   insertRequest
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method is called to create a new request
   */

  private void insertRequest()
  {    
    currentRequest.pricingRequest.Request_Name__c=currentRequest.pricingRequest.Request_Name__c;

    currentRequest.pricingRequest.Request_Approval_Status__c=currentRequest.pricingRequest.Request_Approval_Status__c;
    currentRequest.pricingRequest.Request_Reason__c=currentRequest.pricingRequest.Request_Reason__c;
    currentRequest.pricingRequest.BU__c = currentRequest.selectedBU;
    currentRequest.pricingRequest.Request_Type__c = 'Customer Specific';
    currentRequest.pricingRequest.Pricing_Request_Type__c = 'Project Pricing';
    currentRequest.pricingRequest.Spot_Type__c=null;
    currentRequest.pricingRequest.Customer_Specific__c = true;
    currentRequest.pricingRequest.Dist_Channel_Code__c =currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
    currentRequest.pricingRequest.Dist_Channel__c = currentRequest.customer.paERPCustomer.Distribution_Channel__c;
    currentRequest.pricingRequest.Division_Code__c = currentRequest.customer.paERPCustomer.Division_Code__c;
    currentRequest.pricingRequest.Division__c = currentRequest.customer.paERPCustomer.Division__c;
    currentRequest.pricingRequest.Sales_Org_Code__c = currentRequest.customer.paERPCustomer.Sales_Org_Code__c;   
    currentRequest.pricingRequest.Sales_Org__c = currentRequest.customer.paERPCustomer.Sales_Org__c;
    //Added By Vinayak over a Phone with Anand 3 Mar 2013
    //modified - bala 7th March
    if(currentRequest.customer.ogitems.selectedUser==null)
      currentRequest.customer.ogitems.selectedUser = Userinfo.getUserId();
    system.debug('*** Id expected'+currentRequest.customer.ogitems.selectedUser);
    currentRequest.pricingRequest.OwnerId = (Id)currentRequest.customer.ogitems.selectedUser;
    currentRequest.pricingRequest.On_Behalf_Of__c = currentRequest.customer.ogitems.selectedUser; 
    currentRequest.pricingRequest.Sold_To__c = currentRequest.customer.paERPCustomer.Name;
    currentRequest.pricingRequest.soldto_code__c=currentRequest.customer.paERPCustomer.customer_code__c; // Ver 2.6
    currentRequest.pricingRequest.Zip_PostalCode__c = currentRequest.customer.paERPCustomer.Zip_Postal_Code__c;
    currentRequest.pricingRequest.City__c = currentRequest.customer.paERPCustomer.City__c;
    currentRequest.pricingRequest.Street__c = currentRequest.customer.paERPCustomer.Street__c;
    currentRequest.pricingRequest.Country__c = currentRequest.customer.paERPCustomer.Country__c;
    currentRequest.pricingRequest.State_Province__c = currentRequest.customer.paERPCustomer.State_Province__c;
    currentRequest.pricingRequest.Request_Valid_From__c=projectPrice.Valid_From__c;
    currentRequest.pricingRequest.Request_Valid_To__c=projectPrice.Valid_To__c; 
    system.debug('***p ID'+projectPrice.id);
    currentRequest.pricingRequest.Project_Price__c=projectPrice.id;
    currentRequest.pricingRequest.Project_Id__c=projectPrice.Project_Id__c;
    currentRequest.pricingRequest.Project_Name__c=projectPrice.Name;
    currentRequest.pricingRequest.Assigned_To__c=projectPrice.Assigned_To__c; //ver 4.3
    currentRequest.pricingRequest.Project_Price_Name__c=projectPrice.id; //ver 4.3
    currentRequest.pricingRequest.Terms_Of_Payment__c = currentRequest.customer.paERPCustomer.Terms_Of_Payment__c;
    currentRequest.pricingRequest.Terms_Of_Payment_Code__c = currentRequest.customer.paERPCustomer.Terms_Of_Payment_Code__c;
    currentRequest.pricingRequest.Incoterm__c = currentRequest.customer.paERPCustomer.Incoterms_1__c;
    currentRequest.pricingRequest.Incoterms_Code__c = currentRequest.customer.paERPCustomer.Incoterms_1_Code__c;
    //<PP20130424> -- Ver 4.3
    currentRequest.pricingRequest.Display_Standardized_Rate__c = paOGItem.orgGroupItems.Display_Standardized_Rate__c;
    //<PP20131231> START
    currentRequest.pricingRequest.Standardized_Currency__c = paOGItem.orgGroupItems.Standardized_Currency__c;
    currentRequest.pricingRequest.Standardized_UoM__c = paOGItem.orgGroupItems.Standardized_UoM__c;
    //<PP20131231> END
    // <BR20130510>-- Ver 4.6
    currentRequest.pricingRequest.Attachments_on_Customer_Prices__c = paOGItem.orgGroupItems.Attachments_on_Customer_Prices__c;
    //<PP20130715>
    //<TJ20141114> Commenting to capture the value selected by user
    //currentRequest.pricingRequest.Request_Class__c = paOGItem.orgGroupItems.Request_Class__c; 
    if(paOGItem.orgGroupItems.Approval_Escalation_Price_Requests__c!=null)
      currentRequest.pricingRequest.Approval_Escalation_Price_Requests__c = paOGItem.orgGroupItems.Approval_Escalation_Price_Requests__c;

    insert currentRequest.pricingRequest;
    // <PS20130424> Ver 4.1 PS 2013-04-24 APAC Rollout-upserting the request
    upsert currentRequest.pricingRequest;
    //Ver 4.1 PS 2013-04-17 APAC Rollout-end

  } 

  /* Author    :   Anand Darshi
   * Method Name  :   addSelectedMaterialsToRequest
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method add selected material records to request
   */

  private void addSelectedMaterialsToRequest()
  {  
    list<Pricing_Request_Item__c> reqItemObjectList =new  list<Pricing_Request_Item__c> ();
    List<PAWrapper> relatedListUnselectedRecord =new List<PAWrapper> ();
    List<PAWrapper> relatedListSelectedRecord =new List<PAWrapper> ();
    ERP_Key_Combination__c keyCombination= new ERP_Key_Combination__c();

    Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
    List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
    Map<Id,String> kcIdandKcDescMap=new Map<Id,String>();
    //<MS20140925>Adding Map for NPC check
    Map<Id,boolean> kcIdandNPCMap=new Map<Id,boolean>();
    String finalKC='';

    // ver 3.8 starts
    //<TJ20150603>
    if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains(separator) )
    {
      projectPrice.Default_Discount__c= projectPrice.Default_Discount__c.replace('.',separator);
    }
    // ver 3.8 ends

    //get KC Code based On KC ID
    if(currentRequest.keyCombination.keyCombinationID !=null)
    {   
      keyCombination = [SELECT Key_Combination_Code__c FROM ERP_Key_Combination__c WHERE Id=:currentRequest.keyCombination.keyCombinationID];
    }

    //validation of not selecting any record and trying to add 
    for(PARelatedList wRec1 : relatedListFetchRecord)
    {   
      for( PAWrapper r :  wRec1.wrapperList) 
      {
        if(r != null && r.isSelected == true)
        { 
          relatedListSelectedRecord.add(r);
        }
        else
        {
          relatedListUnselectedRecord.add(r);     
        }
      }
    }
    if(relatedListSelectedRecord.size()==0)
    {
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      throw new PAException(System.Label.Select_Pricing_Records_Mandatory_Error,ApexPages.Severity.ERROR);
    }

    //VER 2.4 STARTS added by Neeharika
    /*populating SFDC KC descrpiton*/ 
    //<PP20130715>
    //<PP20131231> 
    //<TJ20150603> 
    orgGroupItemsList = [SELECT Standardized_UoM__c,Standardized_Currency__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                         Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,Enable_Variable_Config_Materials__c, 
                         Default_Per_Value__c, Default_SalesArea_UoM__c, Default_Per_UoM_Setup__c, Default_SalesArea_Currency__c FROM Organizational_Group_Item__c WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :currentRequest.pricingRequest.BU__c AND RecordType.Name = 'Business')
    AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.pricingRequest.Sales_Org_Code__c
    AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.pricingRequest.Dist_Channel_Code__c 
    AND OrgGroup__r.ERP_Division_Code__c = :currentRequest.pricingRequest.Division_Code__c];

    if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0)
    {
      buOrgGroup  =   orgGroupItemsList[0];  
    }            
    //<MS20140925>Adding NPC Applicable field
    List<ERP_Access_Sequence__c> accSqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c,isNPCApplicable__c
                                              FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c = :currentRequest.pricingCondition.selectedPricingCondition
                                              AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];

    for(ERP_Access_Sequence__c ac:accSqList)
    {
      kcIdandKcDescMap.put(ac.Pricing_Key_Combination__c,ac.Key_Combination__c);
      kcIdandNPCMap.put(ac.Pricing_Key_Combination__c,ac.isNPCApplicable__c);
    }
    List<ERP_Pricing_Condition__c> selectedPC =new List<ERP_Pricing_Condition__c>();
    selectedPC=[SELECT Calculation_Type__c from ERP_Pricing_Condition__c where Id=:currentRequest.pricingCondition.selectedPricingCondition];

    /*end*/ 
    //VER 2.4 ENDS
    //<TJ20150603>
    OrgGroup__c selectedBU=[SELECT Business__c FROM OrgGroup__c WHERE Business__c = :currentRequest.pricingRequest.BU__c AND RecordType.Name = 'Business'];
    for( PAWrapper r : relatedListSelectedRecord )
    {

      Material__c materialObj = null;
      materialObj = (Material__c) r.sobjectRecord;
      Pricing_Request_Item__c reqItemObject=new  Pricing_Request_Item__c ();
      reqItemObject.Pricing_Request__c=currentRequest.pricingRequest.id;
      reqItemObject.New_Valid_From__c = projectprice.Valid_From__c;
      reqItemObject.New_Valid_To__c = projectprice.Valid_To__c;
      reqItemObject.Disc_Ref__c=projectprice.Project_Id__c;
      reqItemObject.Pricing_Condition_Code__c=projectPrice.Pricing_Condition_Code__c;
      reqItemObject.Pricing_Condition__c=projectPrice.Pricing_Condition__c;
      reqItemObject.New_Rate__c=String.valueOf(projectPrice.Default_Discount__c);

      reqItemObject.Material__c=materialObj.Name;
      reqItemObject.Material_Code__c=materialObj.ERP_Material_Code__c;//changing - bala
      reqItemObject.Profit_Center_Code__c=materialObj.ERP_Profit_Center_Code__c;
      reqItemObject.Profit_Center__c=materialObj.ERP_Profit_Center__c;
      reqItemObject.Key_Combination_Code__c=keyCombination.Key_Combination_Code__c;
      reqItemObject.Key_Combination__c=currentRequest.keyCombination.keyCombinationName;
      reqItemObject.ERP_Pricing_Procedure__c=paOGItem.orgGroupItems.ERP_Pricing_Procedure__c; // added on 26 Apr ver 4.2 
      if(selectedPC[0].Calculation_Type__c == 'Percentage')
        reqItemObject.New_Unit__c='%';
      else
      {
        reqItemObject.New_Unit__c=buOrgGroup.Default_SalesArea_Currency__c;
        if(buOrgGroup.Default_Per_UoM_Setup__c == 'Sales Area Config'
          && buOrgGroup.Default_SalesArea_UoM__c != null)
          {   
            reqItemObject.New_UOM__c=buOrgGroup.Default_SalesArea_UoM__c;
            reqItemObject.New_Per__c=buOrgGroup.Default_Per_Value__c;                
            if(currentRequest.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && reqItemObject.Scaled_Price_Flag__c==true && reqItemObject.Scale_UoM_Scale_Unit__c==null)
            {
              reqItemObject.Scale_UoM_Scale_Unit__c=buOrgGroup.Default_SalesArea_UoM__c;
            }            
          }
          
          else if(buOrgGroup.Default_Per_UoM_Setup__c == 'Product Hierarchy Config')
          {
            if(reqItemObject.Material_Code__c != null)
            {
              List<Material__c> matList = new List<Material__c>();
              if(buOrgGroup.Enable_Variable_Config_Materials__c)
              {

                matList=[SELECT Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                         ERP_Material_Code__c = :reqItemObject.Material_Code__c  AND RecordTypeId = :Material_RTYPE_Id AND
                         ERP_Material_General_Data__r.ERP_IsConfigurable__c = :buOrgGroup.Enable_Variable_Config_Materials__c
                         AND ERP_Sales_Org_Code__c = :currentRequest.pricingRequest.Sales_Org_Code__c AND
                         OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.pricingRequest.Dist_Channel_Code__c];
              }
              else
              { 
                matList=[SELECT Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c FROM Material__c WHERE
                         ERP_Material_Code__c = :reqItemObject.Material_Code__c  AND RecordTypeId = :Material_RTYPE_Id AND
                         ERP_Sales_Org_Code__c = :currentRequest.pricingRequest.Sales_Org_Code__c AND
                         OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.pricingRequest.Dist_Channel_Code__c];
              }
              Material__c m = new Material__c();
                      
              if(matList.size() > 0)
              {
                m = matList[0];
                PARequestItemHelper reqitem2 = new PARequestItemHelper(selectedBU.Business__c);
                Set<String> phSet = new Set<String>();
                phSet.add(m.ERP_Product_Hierarchy_Code__c);
                List<BU_PH__c> allPHList = reqitem2.query(phSet);
                Map<String,String> pH_UOM = new Map<String,String>();
                Map<String,Decimal> pH_Per = new Map<String,Decimal>();
                pH_UOM = reqitem2.getDefaultUOM(allPHList);
                pH_Per=reqitem2.getDefaultPer(allPHList);
                if(pH_UOM.containsKey(m.ERP_Product_Hierarchy_Code__c) && pH_UOM.get(m.ERP_Product_Hierarchy_Code__c) != null)
                {
                  reqItemObject.New_UoM__c=pH_UOM.get(m.ERP_Product_Hierarchy_Code__c);
                  reqItemObject.New_Per__c=pH_Per.get(m.ERP_Product_Hierarchy_Code__c);
                  if(currentRequest.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && reqItemObject.Scaled_Price_Flag__c==true && reqItemObject.Scale_UoM_Scale_Unit__c==null)
                  {
                    reqItemObject.Scale_UoM_Scale_Unit__c=pH_UOM.get(m.ERP_Product_Hierarchy_Code__c);
                  }
                }
              }
            }
            else if(reqItemObject.F_Product_Hierarchy_Code__c != null)
            {
              PARequestItemHelper reqitem2 = new PARequestItemHelper(selectedBU.Business__c);
              Set<String> phSet = new Set<String>();
              phSet.add(reqItemObject.F_Product_Hierarchy_Code__c);
              List<BU_PH__c> allPHList = reqitem2.query(phSet);
              Map<String,String> pH_UOM = new Map<String,String>();
              Map<String,Decimal> pH_Per = new Map<String,Decimal>();
              pH_UOM = reqitem2.getDefaultUOM(allPHList);
              if(pH_UOM.containsKey(reqItemObject.F_Product_Hierarchy_Code__c) && pH_UOM.get(reqItemObject.F_Product_Hierarchy_Code__c) != null)
              {
                reqItemObject.New_UOM__c=pH_UOM.get(reqItemObject.F_Product_Hierarchy_Code__c);
                reqItemObject.New_Per__c=pH_Per.get(reqItemObject.F_Product_Hierarchy_Code__c);
                if(currentRequest.pricingCondition.pricingCondition.Scale_Base__c=='Quantity Scale' && reqItemObject.Scaled_Price_Flag__c==true && reqItemObject.Scale_UoM_Scale_Unit__c==null)
                {
                  reqItemObject.Scale_UoM_Scale_Unit__c=pH_UOM.get(reqItemObject.F_Product_Hierarchy_Code__c);
                }
              }                         
            }
          }                    
        
      }
      

      if(kcIdandKcDescMap.containsKey(currentRequest.keyCombination.keyCombinationID))
      {
        finalKC=kcIdandKcDescMap.get(currentRequest.keyCombination.keyCombinationID);
      }
      reqItemObject.Key_Combination_SFDC__c=finalKC;

      //<MS20140925>Start
      if(kcIdandNPCMap.containsKey(currentRequest.keyCombination.keyCombinationID))
      {
        reqItemObject.isNPCApplicable__c=kcIdandNPCMap.get(currentRequest.keyCombination.keyCombinationID);
      }
      //<MS20140925>End
      if(currentRequest.cpgFilter !=null)
      {
        list<string> splitCPG=currentRequest.cpgFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
        reqItemObject.Customer_Price_Group_code__c=splitCPG[0];
        reqItemObject.Customer_Price_Group__c=splitCPG[1];
      }
      //<BB20130726> Ver 4.9 2013-07-26 APAC Rollout2-Adding Logic for Extra field Incoterms 
      if(currentRequest.incotermsFilter !=null)
      {
        list<string> splitIncoterms=currentRequest.incotermsFilter.split('-',2);
        reqItemObject.Incoterms_Code__c=splitIncoterms[0];
        reqItemObject.Inco_terms__c=splitIncoterms[1];
      }
      if(currentRequest.mpgFilter !=null)
      {      System.debug('******mpgFilter'+currentRequest.mpgFilter);
      list<string> splitMPG=currentRequest.mpgFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
      System.debug('******splitMPG'+splitMPG);
      reqItemObject.Material_Price_Group_Code__c=splitMPG[0];
      reqItemObject.Material_Price_Group__c=splitMPG[1];
      }
      if(currentRequest.salesOfficeFilter !=null)
      {
        list<string> splitSO=currentRequest.salesOfficeFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
        reqItemObject.Sales_Office__c=splitSO[1];
        reqItemObject.Sales_Office_code__c=splitSO[0];
      }
      if(currentRequest.salesDistrictFilter !=null)
      {
        list<string> splitSD=currentRequest.salesDistrictFilter.split('-',2);
        reqItemObject.Sales_District__c=splitSD[1];
        reqItemObject.Sales_District_code__c=splitSD[0];
      }
      if(currentRequest.priceListTypeFilter !=null)
      {
        list<string> splitPL=currentRequest.priceListTypeFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
        reqItemObject.Price_List_Type_code__c=splitPL[0];
        reqItemObject.Price_List_Type__c=splitPL[1];
      }
      reqItemObject.Customer_Specific__c=true;
      reqItemObject.Pricing_Request_Type__c='Project';
      reqItemObject.Sales_Org__c=currentRequest.customer.paERPCustomer.Sales_Org__c;
      reqItemObject.Sales_Org_Code__c=currentRequest.customer.paERPCustomer.Sales_Org_Code__c;
      reqItemObject.Dist_Channel__c=currentRequest.customer.paERPCustomer.Distribution_Channel__c;
      reqItemObject.Dist_Channel_Code__c=currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
      reqItemObject.Division__c=currentRequest.customer.paERPCustomer.Division__c;
      reqItemObject.Division_Code__c=currentRequest.customer.paERPCustomer.Division_Code__c;
      reqItemObject.Sold_To__c=currentRequest.customer.paERPCustomer.Name;
      reqItemObject.Sold_To_Code__c=currentRequest.customer.paERPCustomer.Customer_code__c;
      reqItemObject.Calculation_Type__c= currentRequest.pricingCondition.pricingCondition.Calculation_Type__c;
      reqItemObject.Calculation_Type_Code__c=currentRequest.pricingCondition.pricingCondition.Calculation_Type_Code__c;
      reqItemObject.Check_Scale__c= currentRequest.pricingCondition.pricingCondition.Check_Scale__c;
      reqItemObject.Check_Scale_Code__c= currentRequest.pricingCondition.pricingCondition.Check_Scale_Code__c;
      reqItemObject.Condition_Class__c= currentRequest.pricingCondition.pricingCondition.Condition_Class__c;
      reqItemObject.Condition_Class_Code__c= currentRequest.pricingCondition.pricingCondition.Condition_Class_Code__c;
      reqItemObject.Customer_Specific__c = currentRequest.pricingRequest.Customer_Specific__c;
      reqItemObject.Approval_Status__c = currentRequest.pricingRequest.Request_Approval_Status__c;
      reqItemObject.SAP_Application_Id__c =currentRequest.pricingCondition.pricingCondition.SAP_Application_Id__c;
      reqItemObject.SAP_Client_Id__c = currentRequest.pricingCondition.pricingCondition.SAP_Client_ID__c;
      reqItemObject.SAP_Cluster__c=currentRequest.pricingCondition.pricingCondition.SAP_Cluster__c;
      reqItemObject.Plus_Minus_Code__c=currentRequest.pricingCondition.pricingCondition.Plus_Minus_Code__c;
      reqItemObject.Plus_Minus__c=currentRequest.pricingCondition.pricingCondition.Plus_Minus__c;
      // Ver 4.1 START
      if(!String.isBlank(currentRequest.endUserFilter))
      {
        reqItemObject.End_User_Code__c = currentRequest.endUserFilter;
        reqItemObject.End_User__c = currentRequest.endUserNameFilter;
      }

      //<MA20131001>
      //For populating ship to
      if(!String.isBlank(currentRequest.shipToFilter))
      {
        reqItemObject.ShipTo__c =currentRequest.shipToNameFilter;
        reqItemObject.ShipTo_Code__c=currentRequest.shipToFilter;
      }

      //For populating Country
      List<string> splitCountryValueList = new List<string>();
      if(currentRequest.countryFilter!=null && currentRequest.countryFilter!=''){
        splitCountryValueList = currentRequest.countryFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
        if(splitCountryValueList.size()!=0){
          reqItemObject.Country_Code__c = splitCountryValueList[0];
          reqItemObject.Country__c=splitCountryValueList[1];
        }
      }
      //<PP20131028> START
      //For populating Ship-To Country
      List<string> splitShipToCountryValueList = new List<string>();
      if(!String.isBlank(currentRequest.shipToCountryFilter)){
        splitShipToCountryValueList = currentRequest.shipToCountryFilter.split('-',2);
        if(splitShipToCountryValueList.size()!=0){
          reqItemObject.Ship_To_Country_Code__c = splitShipToCountryValueList[0];
          reqItemObject.Ship_To_Country__c=splitShipToCountryValueList[1];
        }
      }
      //For populating Payment Terms
      List<string> splitTOPList = new List<string>();
      if(!String.isBlank(currentRequest.paymentTermsFilter)){
        splitTOPList = currentRequest.paymentTermsFilter.split('-',2);
        if(splitShipToCountryValueList.size()!=0){
          reqItemObject.Terms_of_Payment_Code__c = splitTOPList[0];
          reqItemObject.Terms_of_Payment__c=splitTOPList[1];
        }
      } 
      //<PP20131028> END
      //For populating Market Segment
      List<string> splitMSValueList = new List<string>();
      if(currentRequest.marketSegmentFilter!=null && currentRequest.marketSegmentFilter!=''){
        splitMSValueList = currentRequest.marketSegmentFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
        if(splitMSValueList.size()!=0){
          reqItemObject.Market_Segment_Code__c = splitMSValueList[0];
          reqItemObject.Market_Segment__c=splitMSValueList[1];
        }
      }
      List<string> splitMG1ValueList = new List<string>();
      if(currentRequest.materialGroup1Filter!=null && currentRequest.materialGroup1Filter!=''){
        splitMG1ValueList = currentRequest.materialGroup1Filter.split('-',2);
        if(splitMG1ValueList.size()!=0){
          reqItemObject.Material_Group_1_Code__c = splitMG1ValueList[0];
          reqItemObject.Material_Group_1__c=splitMG1ValueList[1];
        }
      }
      //<MS20140516> START
      //For populating Variant
      List<string> splitVariantValueList = new List<string>();
      if(currentRequest.variantFilter!=null && currentRequest.variantFilter!=''){
        splitVariantValueList = currentRequest.variantFilter.split('-',2);
        if(splitVariantValueList.size()!=0){
          reqItemObject.Variant_Code__c = splitVariantValueList[0];
          reqItemObject.Variant__c=splitVariantValueList[1];
        }
      }
      //<MS20141114>
      //<MS20150101>
      //For populating Contract
      List<string> splitContractValueList = new List<string>();
      if(currentRequest.contractFilter!=null && currentRequest.contractFilter!=''){
        splitContractValueList = currentRequest.contractFilter.split('-',2);
        if(splitContractValueList.size()!=0){
          reqItemObject.Contract_Code__c = splitContractValueList[0];
          reqItemObject.Contract__c=splitContractValueList[1];
        }
      }
      //<AV20150102>-Production issue-project id
      reqItemObject.Project__c=currentRequest.pricingRequest.Project_Id__c;
      reqItemObject.Kcode__c=currentRequest.kcodeFilter;
      //For populating ComPartner
      List<string> splitComPartnerValueList = new List<string>();
      if(!String.isBlank(currentRequest.comPartnerFilter))
      {
        reqItemObject.ComPartner_Code__c =currentRequest.comPartnerFilter;
        reqItemObject.ComPartner__c=currentRequest.comPartnerNameFilter;
      }
      //<MS20150213>
      List<string> splitMaterialGroup5KeyValueList = new List<string>();
      if(currentRequest.materialGroup5KeyFilter!=null && currentRequest.materialGroup5KeyFilter!=''){
        splitMaterialGroup5KeyValueList = currentRequest.materialGroup5KeyFilter.split('-',2);
        if(splitMaterialGroup5KeyValueList.size()!=0){
          reqItemObject.Material_Group_5_Key_Code__c=splitMaterialGroup5KeyValueList[0];
          reqItemObject.Material_Group_5_Key__c=splitMaterialGroup5KeyValueList[1];
        }
      }

      //For populating Plant
      List<string> splitPlantValueList = new List<string>();
      if(currentRequest.plantFilter!=null && currentRequest.plantFilter!=''){
        splitPlantValueList = currentRequest.plantFilter.split('-',2);
        if(splitPlantValueList.size()!=0){
          reqItemObject.Plant_Code__c=splitPlantValueList[0];
          reqItemObject.Plant__c=splitPlantValueList[1];
        }
      }
      //For populating Shipping Condition
      List<string> splitShippingConditionValueList = new List<string>();
      if(currentRequest.shippingConditionFilter!=null && currentRequest.shippingConditionFilter!=''){
        splitShippingConditionValueList = currentRequest.shippingConditionFilter.split('-',2);
        if(splitShippingConditionValueList.size()!=0){
          reqItemObject.Shipping_Condition_Code__c=splitShippingConditionValueList[0];
          reqItemObject.Shipping_Condition__c=splitShippingConditionValueList[1];
        }
      }
      //For populating Destination Country
      List<string> splitDestinationCountryValueList = new List<string>();
      if(currentRequest.destinationCountryFilter!=null && currentRequest.destinationCountryFilter!=''){
        splitDestinationCountryValueList = currentRequest.destinationCountryFilter.split('-',2);
        if(splitDestinationCountryValueList.size()!=0){
          reqItemObject.Destination_Country_Code__c=splitDestinationCountryValueList[0];
          reqItemObject.Destination_Country__c=splitDestinationCountryValueList[1];
        }
      }
      //For populating SalesOrderType
      List<string> splitSalesOrderTypeValueList = new List<string>();
      if(currentRequest.salesOrderTypeFilter!=null && currentRequest.salesOrderTypeFilter!=''){
        splitSalesOrderTypeValueList = currentRequest.salesOrderTypeFilter.split('-',2);
        if(splitSalesOrderTypeValueList.size()!=0){
          reqItemObject.Sales_Order_Type_Code__c = splitSalesOrderTypeValueList[0];
          reqItemObject.Sales_Order_Type__c=splitSalesOrderTypeValueList[1];
        }
      }
      //<MS20140516>END
      // <SS20220826> - Added logic for Sales Order Item fields values. START
      List<string> splitSalesOrderItemValueList= new List<string>();
      if(currentRequest.salesOrderItemFilter!=null && currentRequest.salesOrderItemFilter!=''){
        splitSalesOrderItemValueList= currentRequest.salesOrderItemFilter.split('-',2);
        if(splitSalesOrderItemValueList.size()!=0){
          reqItemObject.Sales_Order_Item_Code__c= splitSalesOrderItemValueList[0];
          reqItemObject.Sales_Order_Item__c=splitSalesOrderItemValueList[1];
        }
      }//<SS20220826> - Added logic for Sales Order Item fields values. END
      // <SS202230501> - START
      List<string> splitvaluecenterValueList= new List<string>();
      if(currentRequest.valuecenterFilter!=null && currentRequest.valuecenterFilter!=''){
        splitvaluecenterValueList= currentRequest.valuecenterFilter.split('-',2);
        if(splitvaluecenterValueList.size()!=0){
          reqItemObject.Value_Center_Code__c= splitvaluecenterValueList[0];
          reqItemObject.Value_Center__c=splitvaluecenterValueList[1];
        }
      }//<SS20230501> - END 

      // <SS202230501> - START
      List<string> splitmaterialgroup2ValueList= new List<string>();
      if(currentRequest.materialgroup2Filter!=null && currentRequest.materialgroup2Filter!=''){
        splitmaterialgroup2ValueList= currentRequest.materialgroup2Filter.split('-',2);
        if(splitmaterialgroup2ValueList.size()!=0){
          reqItemObject.Material_group_2_Code__c= splitmaterialgroup2ValueList[0];
          reqItemObject.Material_group_2__c=splitmaterialgroup2ValueList[1];
        }
      }//<SS20230501> -  END    
      
      // <SS202230501> - START
      List<string> splitexternalmatlgrpValueList= new List<string>();
      if(currentRequest.extMaterialGroupFilter!=null && currentRequest.extMaterialGroupFilter!=''){
        splitexternalmatlgrpValueList= currentRequest.extMaterialGroupFilter.split('-',2);
        if(splitexternalmatlgrpValueList.size()!=0){
          reqItemObject.Ext_Matl_Grp_Code__c= splitexternalmatlgrpValueList[0];
          reqItemObject.Ext_Matl_Grp__c=splitexternalmatlgrpValueList[1];
        }
      }//<SS20230501> -  END    

      // <SS202230501> - START
      List<string> splitpricezoneValueList= new List<string>();
      if(currentRequest.prizezoneFilter!=null && currentRequest.prizezoneFilter!=''){
        splitpricezoneValueList= currentRequest.prizezoneFilter.split('-',2);
        if(splitpricezoneValueList.size()!=0){
          reqItemObject.Price_Zone_Code__c= splitpricezoneValueList[0];
          reqItemObject.Price_Zone__c=splitpricezoneValueList[1];
        }
      }//<SS20230501> -  END                    
      //For populating End Use
      List<string> splitEUValueList = new List<string>();
      if(currentRequest.endUseFilter!=null && currentRequest.endUseFilter!=''){
        splitEUValueList = currentRequest.endUseFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
        if(splitEUValueList.size()!=0){
          reqItemObject.End_Use_Code__c = splitEUValueList[0];
          reqItemObject.End_Use__c=splitEUValueList[1];
        }
      }
      //For populating Price Ref. Partner
      if(!String.isBlank(currentRequest.priceRefPartnerFilter))
      {
        reqItemObject.Price_Ref_Partner_Code__c = currentRequest.priceRefPartnerFilter;
        reqItemObject.Price_Ref_Partner__c = currentRequest.priceRefPartnerNameFilter;
      }

      List<string> splitPartnerZFValueList = new List<string>();
      if(!String.isBlank(currentRequest.partnerZFFilter))
      {
        reqItemObject.Partner_ZF_Code__c =currentRequest.partnerZFFilter;
        reqItemObject.Partner_ZF__c=currentRequest.partnerZFNameFilter;
      }


      //Ver 4.1 END

      //approved project adding more materials
      if(projectPrice.Project_Status__c=='Approved')
      {
        //project got started then new material will have VF as System date--point 5
        if( projectPrice.Valid_From__c <= Date.today() )
        {
          reqItemObject.New_Valid_From__c=Date.today();
        }
        //project not yet started then new material will have VF as project date--point 5
        if( projectPrice.Valid_From__c > Date.today() )
        {
          reqItemObject.New_Valid_From__c=projectprice.Valid_From__c;
        }
      }
      List<string> splitPayerValueList = new List<string>();
      if(!String.isBlank(currentRequest.payerFilter))
      {
        reqItemObject.Payer_Code__c =currentRequest.payerFilter;
        reqItemObject.Payer__c=currentRequest.payerNameFilter;
      }

      if(!String.isBlank(currentRequest.discRefNoFilter)){
        reqItemObject.Disc_Ref_No__c = currentRequest.discRefNoFilter;
      }

      if(!String.isBlank(currentRequest.fixValDateFilter)){
        reqItemObject.FixValDate__c = Date.valueOf(currentRequest.fixValDateFilter);
      }

      List<string> splitCampaignValueList = new List<string>();
      if(currentRequest.campaignFilter!=null && currentRequest.campaignFilter!=''){
        splitCampaignValueList = currentRequest.campaignFilter.split('-',2);
        if(splitCampaignValueList.size()!=0){
          reqItemObject.Campaign_Code__c = splitCampaignValueList[0];
          reqItemObject.Campaign__c=splitCampaignValueList[1];
        }
      }

      List<string> splitDocumentCurrencyValueList = new List<string>();
      if(currentRequest.documentCurrencyFilter!=null && currentRequest.documentCurrencyFilter!=''){
        splitDocumentCurrencyValueList = currentRequest.documentCurrencyFilter.split('-',2);
        if(splitDocumentCurrencyValueList.size()!=0){
          reqItemObject.Document_Currency_Code__c = splitDocumentCurrencyValueList[0];
          reqItemObject.Document_Currency__c=splitDocumentCurrencyValueList[1];
        }
      }

      List<string> splitStateValueList = new List<string>();
      if(currentRequest.stateFilter!=null && currentRequest.stateFilter!=''){
        splitStateValueList = currentRequest.stateFilter.split('-',2);
        if(splitStateValueList.size()!=0){
          reqItemObject.State_Code__c = splitStateValueList[0];
          reqItemObject.State__c=splitStateValueList[1];
        }
      }

      //Ver 4.1 END

      //approved project adding more materials
      if(projectPrice.Project_Status__c=='Approved')
      {
        //project got started then new material will have VF as System date--point 5
        if( projectPrice.Valid_From__c <= Date.today() )
        {
          reqItemObject.New_Valid_From__c=Date.today();
        }
        //project not yet started then new material will have VF as project date--point 5
        if( projectPrice.Valid_From__c > Date.today() )
        {
          reqItemObject.New_Valid_From__c=projectprice.Valid_From__c;
        }
      }
      reqItemObjectList.add(reqItemObject);

    }
    //Ver  1.8 starts 
    try
    {
      if(reqItemObjectList.size()!=0)
        upsert reqItemObjectList;
    }
    catch(DMLException e)
    {     // <PS20130424>
      if(e.getMessage().contains('Selected records already available'))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
        throw e;
      }
      else
      {
        throw e;
      }   
    }
    //Ver 1.8 ends
    relatedListFetchRecord[0].wrapperList.clear();
    relatedListFetchRecord[0].wrapperList.addALL(relatedListUnselectedRecord);

    //display done button
    dispDoneButton ='dipsDone';

    //display added info
    boolean flag = true;
    for(Pricing_Request_Item__c pri : reqItemObjectList)
    {
      if(pri.Id == null) 
      {
        flag = false;
      }
    }
    if(flag==true)
    {
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      throw new PAException(System.Label.Selected_Records_Added_Info,ApexPages.Severity.INFO);
    } 
  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   addSelectedPHToRequest
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method add selected PH records to request
   */

  private void addSelectedPHToRequest()
  {    
    list<Pricing_Request_Item__c> reqItemObjectList =new  list<Pricing_Request_Item__c> ();
    List<PAWrapper> relatedListUnselectedRecord =new List<PAWrapper> ();
    List<PAWrapper> relatedListSelectedRecord =new List<PAWrapper> ();
    string keyCombinationCode;
    string selectedPhCode;
    ERP_Key_Combination__c keyCombination=null;

    Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
    List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
    Map<Id,String> kcIdandKcDescMap=new Map<Id,String>();
    Map<Id,boolean> kcIdandNPCMap = new Map<Id,boolean>();
    String finalKC='';         
    // ver 3.8 starts
    //<JM20150804> Project Price issue on production - Start
    if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains(separator) )
    {
      projectPrice.Default_Discount__c= projectPrice.Default_Discount__c.replace('.',separator);
    }
    //<JM20150804> Project Price issue on production - End
    // 3.8 ends         
    //get KC code based on ID      
    if(currentRequest.keyCombination.keyCombinationID !=null)
    {
      keyCombination = [SELECT Key_Combination_Code__c FROM ERP_Key_Combination__c WHERE Id=:currentRequest.keyCombination.keyCombinationID];
    }         
    //validation of not selecting any record and trying to add 
    for(PARelatedList wRec1 : relatedListFetchRecord)
    {   
      for( PAWrapper r :  wRec1.wrapperList) 
      {
        if(r != null && r.isSelected == true)
        { 
          relatedListSelectedRecord.add(r);
        }
      }
    }
    if(relatedListSelectedRecord.size()==0)
    {
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      throw new PAException(System.Label.Select_Pricing_Records_Mandatory_Error,ApexPages.Severity.ERROR);
    }

    //VER 2.4 STARTS added by Neehiarika
    /*populating SFDC KC descrpiton*/ 
    //<VR20130510>
    //<PP20130715>
    //<PP20131231>
    orgGroupItemsList =[SELECT Standardized_UoM__c,Standardized_Currency__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Enable_Variable_Config_Materials__c,
                        Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c FROM Organizational_Group_Item__c
                        WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :currentRequest.pricingRequest.BU__c AND RecordType.Name = 'Business')
    AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.pricingRequest.Sales_Org_Code__c
    AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.pricingRequest.Dist_Channel_Code__c AND
    OrgGroup__r.ERP_Division_Code__c = :currentRequest.pricingRequest.Division_Code__c];

    if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0)
    {
      buOrgGroup  =   orgGroupItemsList[0];  
    }            
    List<ERP_Access_Sequence__c> accSqList = [SELECT isNPCApplicable__c,Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c 
                                              FROM ERP_Access_Sequence__c  WHERE Pricing_Condition__c = :currentRequest.pricingCondition.selectedPricingCondition
                                              AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
    for(ERP_Access_Sequence__c ac:accSqList)
    {
      kcIdandKcDescMap.put(ac.Pricing_Key_Combination__c,ac.Key_Combination__c);
      kcIdandNPCMap.put(ac.Pricing_Key_Combination__c,ac.isNPCApplicable__c);
    }

    /*end*/
    //VER 2.4 ENDS
    //<AV20150107>-Start-Production issue-% not getting populated in new unit for discount project
    List<ERP_Pricing_Condition__c> selectedPC =new List<ERP_Pricing_Condition__c>();
    selectedPC=[SELECT Calculation_Type__c from ERP_Pricing_Condition__c where Id=:currentRequest.pricingCondition.selectedPricingCondition];
    //<AV20150107>-End-Production issue-% not getting populated in new unit for discount project

    for(PARelatedList wRec1 : relatedListFetchRecord)
    {
      for(PAWrapper r : wRec1.wrapperList)
      {
        if(r != null && r.isSelected == true)
        {
          BU_PH__c phMasterObj =null;
          phMasterObj = (BU_PH__c) r.sobjectRecord;
          Pricing_Request_Item__c reqItemObject=new  Pricing_Request_Item__c ();
          reqItemObject.Pricing_Request__c=currentRequest.pricingRequest.id;
          reqItemObject.Product_Hierarchy_Code__c=phMasterObj.Product_Hierarchy__r.PH_Code__c;
          reqItemObject.Product_Hierarchy__c=phMasterObj.Business_Description__c;

          //populate Ph1-Ph9
          selectedPhCode=phMasterObj.Product_Hierarchy__r.PH_Code__c;
          if(!string.isBlank(selectedPhCode))
          {   
            if(selectedPhCode.length()<18)
            {
              for(integer i=selectedPhCode.length();i<18;i++)
              {
                selectedPhCode=selectedPhCode+'#';
              }
            }
            List<String> PHSplit = new List<String>();
            for(Integer i=0;i<selectedPhCode.length();i=i+2)
            {
              PHSplit.add(selectedPhCode.substring(i,i+2));
            }

            reqItemObject.PH1_Code__c = PHSplit[0];

            if(PHSplit[1] == '##')
              reqItemObject.PH2_Code__c = null;
            else
              reqItemObject.PH2_Code__c = PHSplit[1];
            if(PHSplit[2] == '##')
              reqItemObject.PH3_Code__c = null;
            else
              reqItemObject.PH3_Code__c = PHSplit[2];
            if(PHSplit[3] == '##')
              reqItemObject.PH4_Code__c = null;
            else
              reqItemObject.PH4_Code__c = PHSplit[3];
            if(PHSplit[4] == '##')
              reqItemObject.PH5_Code__c = null;
            else
              reqItemObject.PH5_Code__c = PHSplit[4];
            if(PHSplit[5] == '##')
              reqItemObject.PH6_Code__c = null;
            else
              reqItemObject.PH6_Code__c = PHSplit[5];
            if(PHSplit[6] == '##')
              reqItemObject.PH7_Code__c = null;
            else
              reqItemObject.PH7_Code__c = PHSplit[6];
            if(PHSplit[7] == '##')
              reqItemObject.PH8_Code__c = null;
            else
              reqItemObject.PH8_Code__c = PHSplit[7];
            if(PHSplit[8] == '##')
              reqItemObject.PH9_Code__c = null;
            else
              reqItemObject.PH9_Code__c = PHSplit[8];
          }

          reqItemObject.New_Valid_From__c = projectprice.Valid_From__c;
          reqItemObject.New_Valid_To__c = projectprice.Valid_To__c;
          reqItemObject.Pricing_Condition_Code__c=projectPrice.Pricing_Condition_Code__c;
          reqItemObject.Pricing_Condition__c=projectPrice.Pricing_Condition__c;
          reqItemObject.New_Rate__c=String.valueOf(projectPrice.Default_Discount__c);
          //<AV20150107>-Start-Production issue-% not getting populated in new unit for discount project
          if(selectedPC[0].Calculation_Type__c == 'Percentage')
          {
            reqItemObject.New_Unit__c='%';
          }
          //<AV20150107>-End-Production issue-% not getting populated in new unit for discount project
          reqItemObject.Disc_Ref__c=projectprice.Project_Id__c;
          reqItemObject.Key_Combination_Code__c=keyCombination.Key_Combination_Code__c;
          reqItemObject.Key_Combination__c=currentRequest.keyCombination.keyCombinationName;
          reqItemObject.ERP_Pricing_Procedure__c=paOGItem.orgGroupItems.ERP_Pricing_Procedure__c; // added on 26 Apr ver 4.2

          if(kcIdandKcDescMap.containsKey(currentRequest.keyCombination.keyCombinationID))
          {
            finalKC=kcIdandKcDescMap.get(currentRequest.keyCombination.keyCombinationID);
          }
          reqItemObject.Key_Combination_SFDC__c=finalKC;
          if(kcIdandNPCMap.containsKey(currentRequest.keyCombination.keyCombinationID))
          {
            reqItemObject.isNPCApplicable__c=kcIdandNPCMap.get(currentRequest.keyCombination.keyCombinationID);
          }

          if(currentRequest.cpgFilter !=null)
          {
            list<string> splitCPG=currentRequest.cpgFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            reqItemObject.Customer_Price_Group_code__c=splitCPG[0];
            reqItemObject.Customer_Price_Group__c=splitCPG[1];
          }
          //<BB20130726> Ver 4.9 2013-07-26 APAC Rollout2-Adding Logic for Extra field Incoterms 
          if(currentRequest.incotermsFilter !=null)
          {
            list<string> splitIncoterms=currentRequest.incotermsFilter.split('-',2);
            reqItemObject.Incoterms_Code__c=splitIncoterms[0];
            reqItemObject.Inco_terms__c=splitIncoterms[1];
          }
          if(currentRequest.mpgFilter !=null)
          {
            list<string> splitMPG=currentRequest.mpgFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            reqItemObject.Material_Price_Group_Code__c=splitMPG[0];
            reqItemObject.Material_Price_Group__c=splitMPG[1];
          }
          if(currentRequest.salesOfficeFilter !=null)
          {
            list<string> splitSO=currentRequest.salesOfficeFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            reqItemObject.Sales_Office__c=splitSO[1];
            reqItemObject.Sales_Office_code__c=splitSO[0];
          }
          if(currentRequest.salesDistrictFilter !=null)
          {
            list<string> splitSD=currentRequest.salesDistrictFilter.split('-',2);
            reqItemObject.Sales_District__c=splitSD[1];
            reqItemObject.Sales_District_code__c=splitSD[0];
          }
          if(currentRequest.priceListTypeFilter !=null)
          {
            list<string> splitPL=currentRequest.priceListTypeFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            reqItemObject.Price_List_Type_code__c=splitPL[0];
            reqItemObject.Price_List_Type__c=splitPL[1];
          }
          reqItemObject.Customer_Specific__c=true;
          reqItemObject.Pricing_Request_Type__c='Project';
          reqItemObject.Sales_Org__c=currentRequest.customer.paERPCustomer.Sales_Org__c;
          reqItemObject.Sales_Org_Code__c=currentRequest.customer.paERPCustomer.Sales_Org_Code__c;
          reqItemObject.Dist_Channel__c=currentRequest.customer.paERPCustomer.Distribution_Channel__c;
          reqItemObject.Dist_Channel_Code__c=currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
          reqItemObject.Division__c=currentRequest.customer.paERPCustomer.Division__c;
          reqItemObject.Division_Code__c=currentRequest.customer.paERPCustomer.Division_Code__c;
          reqItemObject.Sold_To__c=currentRequest.customer.paERPCustomer.Name;
          reqItemObject.Sold_To_Code__c=currentRequest.customer.paERPCustomer.Customer_code__c;
          reqItemObject.Calculation_Type__c= currentRequest.pricingCondition.pricingCondition.Calculation_Type__c;
          reqItemObject.Calculation_Type__c=currentRequest.pricingCondition.pricingCondition.Calculation_Type_Code__c;
          reqItemObject.Check_Scale__c= currentRequest.pricingCondition.pricingCondition.Check_Scale__c;
          reqItemObject.Check_Scale_Code__c= currentRequest.pricingCondition.pricingCondition.Check_Scale_Code__c;
          reqItemObject.Condition_Class__c= currentRequest.pricingCondition.pricingCondition.Condition_Class__c;
          reqItemObject.Condition_Class_Code__c= currentRequest.pricingCondition.pricingCondition.Condition_Class_Code__c;
          reqItemObject.Customer_Specific__c = currentRequest.pricingRequest.Customer_Specific__c;
          reqItemObject.Approval_Status__c = currentRequest.pricingRequest.Request_Approval_Status__c;
          reqItemObject.SAP_Application_Id__c =currentRequest.pricingCondition.pricingCondition.SAP_Application_Id__c;
          reqItemObject.SAP_Client_Id__c = currentRequest.pricingCondition.pricingCondition.SAP_Client_ID__c;
          reqItemObject.SAP_Cluster__c=currentRequest.pricingCondition.pricingCondition.SAP_Cluster__c;
          reqItemObject.Plus_Minus_Code__c=currentRequest.pricingCondition.pricingCondition.Plus_Minus_Code__c;
          reqItemObject.Plus_Minus__c=currentRequest.pricingCondition.pricingCondition.Plus_Minus__c;

          // Ver 4.1 START
          if(!String.isBlank(currentRequest.endUserFilter))
          {
            reqItemObject.End_User_Code__c = currentRequest.endUserFilter;
            reqItemObject.End_User__c = currentRequest.endUserNameFilter;
          }

          //<MA20131001>
          //For populating ship to
          if(!String.isBlank(currentRequest.shipToFilter))
          {
            reqItemObject.ShipTo__c =currentRequest.shipToNameFilter;
            reqItemObject.ShipTo_Code__c=currentRequest.shipToFilter;
          }
          //For populating Country
          List<string> splitCountryValueList = new List<string>();
          if(currentRequest.countryFilter!=null && currentRequest.countryFilter!=''){
            splitCountryValueList = currentRequest.countryFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            if(splitCountryValueList.size()!=0){
              reqItemObject.Country_Code__c = splitCountryValueList[0];
              reqItemObject.Country__c=splitCountryValueList[1];
            }
          }
          //<PP20131028> START
          //For populating Ship-To Country
          List<string> splitShipToCountryValueList = new List<string>();
          if(!String.isBlank(currentRequest.shipToCountryFilter)){
            splitShipToCountryValueList = currentRequest.shipToCountryFilter.split('-',2);
            if(splitShipToCountryValueList.size()!=0){
              reqItemObject.Ship_To_Country_Code__c = splitShipToCountryValueList[0];
              reqItemObject.Ship_To_Country__c=splitShipToCountryValueList[1];
            }
          }

          //For populating Terms Of Payment
          List<string> splitTOPValueList = new List<string>();
          if(!String.isBlank(currentRequest.paymentTermsFilter)){
            splitTOPValueList = currentRequest.paymentTermsFilter.split('-',2);
            if(splitTOPValueList.size()!=0){
              reqItemObject.Terms_Of_Payment_Code__c = splitTOPValueList[0];
              reqItemObject.Terms_Of_Payment__c=splitTOPValueList[1];
            }
          } 
          //<PP20131028> END

          //For populating Market Segment
          List<string> splitMSValueList = new List<string>();
          if(currentRequest.marketSegmentFilter!=null && currentRequest.marketSegmentFilter!=''){
            splitMSValueList = currentRequest.marketSegmentFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            if(splitMSValueList.size()!=0){
              reqItemObject.Market_Segment_Code__c = splitMSValueList[0];
              reqItemObject.Market_Segment__c=splitMSValueList[1];
            }
          }
          List<string> splitMG1ValueList = new List<string>();
          if(currentRequest.materialGroup1Filter!=null && currentRequest.materialGroup1Filter!=''){
            splitMG1ValueList = currentRequest.materialGroup1Filter.split('-',2);
            if(splitMG1ValueList.size()!=0){
              reqItemObject.Material_Group_1_Code__c = splitMG1ValueList[0];
              reqItemObject.Material_Group_1__c=splitMG1ValueList[1];
            }
          }
          //<MS20140516> START
          //For populating Variant
          List<string> splitVariantValueList = new List<string>();
          if(currentRequest.variantFilter!=null && currentRequest.variantFilter!=''){
            splitVariantValueList = currentRequest.variantFilter.split('-',2);
            if(splitVariantValueList.size()!=0){
              reqItemObject.Variant_Code__c = splitVariantValueList[0];
              reqItemObject.Variant__c=splitVariantValueList[1];
            }
          }
          //<MS20150101>
          //For populating Contract
          List<string> splitContractValueList = new List<string>();
          if(currentRequest.contractFilter!=null && currentRequest.contractFilter!=''){
            splitContractValueList = currentRequest.contractFilter.split('-',2);
            if(splitContractValueList.size()!=0){
              reqItemObject.Contract_Code__c = splitContractValueList[0];
              reqItemObject.Contract__c=splitContractValueList[1];
            }
          }
          //<MS2011114>
          //<AV20150102>-Production issue-project id
          reqItemObject.Project__c=currentRequest.pricingRequest.Project_Id__c;
          reqItemObject.Kcode__c=currentRequest.kcodeFilter;
          //For populating ComPartner
          List<string> splitComPartnerValueList = new List<string>();
          if(!String.isBlank(currentRequest.comPartnerFilter)){
            reqItemObject.ComPartner_Code__c = currentRequest.comPartnerFilter;
            reqItemObject.ComPartner__c = currentRequest.comPartnerNameFilter;
          }
          //<MS20150213>
          List<string> splitMaterialGroup5KeyValueList = new List<string>();
          if(currentRequest.materialGroup5KeyFilter!=null && currentRequest.materialGroup5KeyFilter!=''){
            splitMaterialGroup5KeyValueList = currentRequest.materialGroup5KeyFilter.split('-',2);
            if(splitMaterialGroup5KeyValueList.size()!=0){
              reqItemObject.Material_Group_5_Key_Code__c=splitMaterialGroup5KeyValueList[0];
              reqItemObject.Material_Group_5_Key__c=splitMaterialGroup5KeyValueList[1];
            }
          }
          //For populating Plant
          List<string> splitPlantValueList = new List<string>();
          if(currentRequest.plantFilter!=null && currentRequest.plantFilter!=''){
            splitPlantValueList = currentRequest.plantFilter.split('-',2);
            if(splitPlantValueList.size()!=0){
              reqItemObject.Plant_Code__c=splitPlantValueList[0];
              reqItemObject.Plant__c=splitPlantValueList[1];
            }
          }
          //For populating Shipping Condition
          List<string> splitShippingConditionValueList = new List<string>();
          if(currentRequest.shippingConditionFilter!=null && currentRequest.shippingConditionFilter!=''){
            splitShippingConditionValueList = currentRequest.shippingConditionFilter.split('-',2);
            if(splitShippingConditionValueList.size()!=0){
              reqItemObject.Shipping_Condition_Code__c=splitShippingConditionValueList[0];
              reqItemObject.Shipping_Condition__c=splitShippingConditionValueList[1];
            }
          }
          //For populating Destination Country
          List<string> splitDestinationCountryValueList = new List<string>();
          if(currentRequest.destinationCountryFilter!=null && currentRequest.destinationCountryFilter!=''){
            splitDestinationCountryValueList = currentRequest.destinationCountryFilter.split('-',2);
            if(splitDestinationCountryValueList.size()!=0){
              reqItemObject.Destination_Country_Code__c=splitDestinationCountryValueList[0];
              reqItemObject.Destination_Country__c=splitDestinationCountryValueList[1];
            }
          }
          //For populating SalesOrderType
          List<string> splitSalesOrderTypeValueList = new List<string>();
          if(currentRequest.salesOrderTypeFilter!=null && currentRequest.salesOrderTypeFilter!=''){
            splitSalesOrderTypeValueList = currentRequest.salesOrderTypeFilter.split('-',2);
            if(splitSalesOrderTypeValueList.size()!=0){
              reqItemObject.Sales_Order_Type_Code__c = splitSalesOrderTypeValueList[0];
              reqItemObject.Sales_Order_Type__c=splitSalesOrderTypeValueList[1];
            }
          }
          //<MS20140516>END
          //<SS20220826> - Added logic for Sales Order Item fields values. START
          List<string> splitSalesOrderItemValueList= new List<string>();
          if(currentRequest.salesOrderItemFilter!=null && currentRequest.salesOrderItemFilter!=''){
            splitSalesOrderItemValueList= currentRequest.salesOrderItemFilter.split('-',2);
            if(splitSalesOrderItemValueList.size()!=0){
              reqItemObject.Sales_Order_Item_Code__c= splitSalesOrderItemValueList[0];
              reqItemObject.Sales_Order_Item__c=splitSalesOrderItemValueList[1];
            }
          }//<SS20220826> - Added logic for Sales Order Item fields values END
      // <SS202230501> - START
      List<string> splitvaluecenterValueList= new List<string>();
      if(currentRequest.valuecenterFilter!=null && currentRequest.valuecenterFilter!=''){
        splitvaluecenterValueList= currentRequest.valuecenterFilter.split('-',2);
        if(splitvaluecenterValueList.size()!=0){
          reqItemObject.Value_Center_Code__c= splitvaluecenterValueList[0];
          reqItemObject.Value_Center__c=splitvaluecenterValueList[1];
        }
      }//<SS20230501> - END 

      // <SS202230501> - START
      List<string> splitmaterialgroup2ValueList= new List<string>();
      if(currentRequest.materialgroup2Filter!=null && currentRequest.materialgroup2Filter!=''){
        splitmaterialgroup2ValueList= currentRequest.materialgroup2Filter.split('-',2);
        if(splitmaterialgroup2ValueList.size()!=0){
          reqItemObject.Material_group_2_Code__c= splitmaterialgroup2ValueList[0];
          reqItemObject.Material_group_2__c=splitmaterialgroup2ValueList[1];
        }
      }//<SS20230501> -  END    
      
      // <SS202230501> - START
      List<string> splitexternalmatlgrpValueList= new List<string>();
      if(currentRequest.extMaterialGroupFilter!=null && currentRequest.extMaterialGroupFilter!=''){
        splitexternalmatlgrpValueList= currentRequest.extMaterialGroupFilter.split('-',2);
        if(splitexternalmatlgrpValueList.size()!=0){
          reqItemObject.Ext_Matl_Grp_Code__c= splitexternalmatlgrpValueList[0];
          reqItemObject.Ext_Matl_Grp__c=splitexternalmatlgrpValueList[1];
        }
      }//<SS20230501> -  END    

      // <SS202230501> - START
      List<string> splitpricezoneValueList= new List<string>();
      if(currentRequest.prizezoneFilter!=null && currentRequest.prizezoneFilter!=''){
        splitpricezoneValueList= currentRequest.prizezoneFilter.split('-',2);
        if(splitpricezoneValueList.size()!=0){
          reqItemObject.Price_Zone_Code__c= splitpricezoneValueList[0];
          reqItemObject.Price_Zone__c=splitpricezoneValueList[1];
        }
      }//<SS20230501> -  END                  
          
          //For populating End Use
          List<string> splitEUValueList = new List<string>();
          if(currentRequest.endUseFilter!=null && currentRequest.endUseFilter!=''){
            splitEUValueList = currentRequest.endUseFilter.split('-',2);//Shiva changed split('-') to split('-',2) for production issue
            if(splitEUValueList.size()!=0){
              reqItemObject.End_Use_Code__c = splitEUValueList[0];
              reqItemObject.End_Use__c=splitEUValueList[1];
            }
          }
          //For populating Price Ref. Partner
          if(!String.isBlank(currentRequest.priceRefPartnerFilter))
          {
            reqItemObject.Price_Ref_Partner_Code__c = currentRequest.priceRefPartnerFilter;
            reqItemObject.Price_Ref_Partner__c = currentRequest.priceRefPartnerNameFilter;
          }

          List<string> splitPartnerZFValueList = new List<string>();
          if(!String.isBlank(currentRequest.partnerZFFilter)){
            reqItemObject.Partner_ZF_Code__c = currentRequest.partnerZFFilter;
            reqItemObject.Partner_ZF__c = currentRequest.partnerZFNameFilter;
          }

          List<string> splitPayerValueList = new List<string>();
          if(!String.isBlank(currentRequest.payerFilter)){
            reqItemObject.Payer_Code__c = currentRequest.payerFilter;
            reqItemObject.Payer__c = currentRequest.payerNameFilter;
          }

          if(!String.isBlank(currentRequest.discRefNoFilter)){
            reqItemObject.Disc_Ref_No__c = currentRequest.discRefNoFilter;
          }

          if(!String.isBlank(currentRequest.fixValDateFilter)){
            reqItemObject.FixValDate__c = Date.valueOf(currentRequest.fixValDateFilter);
          }

          List<string> splitCampaignValueList = new List<string>();
          if(currentRequest.campaignFilter!=null && currentRequest.campaignFilter!=''){
            splitCampaignValueList = currentRequest.campaignFilter.split('-',2);
            if(splitCampaignValueList.size()!=0){
              reqItemObject.Campaign_Code__c = splitCampaignValueList[0];
              reqItemObject.Campaign__c=splitCampaignValueList[1];
            }
          }

          List<string> splitDocumentCurrencyValueList = new List<string>();
          if(currentRequest.documentCurrencyFilter!=null && currentRequest.documentCurrencyFilter!=''){
            splitDocumentCurrencyValueList = currentRequest.documentCurrencyFilter.split('-',2);
            if(splitDocumentCurrencyValueList.size()!=0){
              reqItemObject.Document_Currency_Code__c = splitDocumentCurrencyValueList[0];
              reqItemObject.Document_Currency__c=splitDocumentCurrencyValueList[1];
            }
          }

          List<string> splitStateValueList = new List<string>();
          if(currentRequest.stateFilter!=null && currentRequest.stateFilter!=''){
            splitStateValueList = currentRequest.stateFilter.split('-',2);
            if(splitStateValueList.size()!=0){
              reqItemObject.State_Code__c = splitStateValueList[0];
              reqItemObject.State__c=splitStateValueList[1];
            }
          }
          //For populating Price Ref. Partner
          if(!String.isBlank(currentRequest.priceRefPartnerFilter))
          {
            reqItemObject.Price_Ref_Partner_Code__c = currentRequest.priceRefPartnerFilter;
            reqItemObject.Price_Ref_Partner__c = currentRequest.priceRefPartnerNameFilter;
          }

          //Ver 4.1 END

          //approved project adding more materials
          if(projectPrice.Project_Status__c=='Approved')
          {
            //project got started then new material will have VF as System date--point 5
            if( projectPrice.Valid_From__c <= Date.today() )
            {
              reqItemObject.Valid_From__c=Date.today();
            }
            //project not yet started then new material will have VF as project date--point 5
            if( projectPrice.Valid_From__c > Date.today() )
            {
              reqItemObject.Valid_From__c=projectprice.Valid_From__c;
            }
          }

          reqItemObjectList.add(reqItemObject);
        }
        else
        {
          relatedListUnselectedRecord.add(r);         
        }
      }
    }
    //added on 26th FEB Ver 1.8
    try
    {
      if(reqItemObjectList.size()!=0)
        upsert reqItemObjectList;
    }
    catch(DMLException e)
    {     
      //<PS20130424>
      if(e.getMessage().contains('Selected records already available'))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
        throw e;
      }
      else{
        throw e;
      }   
    }
    //Ver 1.8 ends
    relatedListFetchRecord[0].wrapperList.clear();
    relatedListFetchRecord[0].wrapperList.addALL(relatedListUnselectedRecord);
    dispDoneButton='dipsDone';

    //To display Added Information
    boolean flag = true;
    for(Pricing_Request_Item__c pri : reqItemObjectList)
    {
      if(pri.Id == null) 
      {
        flag = false;
      }
    }
    if(flag==true)
    {
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      throw new PAException(System.Label.Selected_Records_Added_Info,ApexPages.Severity.INFO);
    } 

  }

  /*
   * Author      :   Anand Darshi
   * Method Name  :   addSelectedSAPRecordsToRequest
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method add selected records of a approved project to new request
   */

  private void addSelectedSAPRecordsToRequest()
  { 

    if(projectSelection=='editApproved')
    {
      upsert projectPrice;
    }
    list<Pricing_Request_Item__c> reqItemObjectList =new  list<Pricing_Request_Item__c> ();
    Set<Pricing_Request_Item__c> pricingRequestItemSet = new Set<Pricing_Request_Item__c>();
    List<Pricing_Request_Item__c> pricingRequestItemList = new List<Pricing_Request_Item__c>();
    List<Pricing_Request_Item__c> pricingRequestItemRecList = new List<Pricing_Request_Item__c>();
    List<ERP_Sales_Prices_SAP__c> fetchedList = new List<ERP_Sales_Prices_SAP__c>();

    Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
    List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
    Map<String,String>   kcIdandKcDescMap=new Map<String,String>();
    Map<Id,boolean> kcIdandNPCMap = new Map<Id,boolean>();
    String finalKC='';

    // ver 3.8 starts
    // <MG20160303>
    defaultdiscounthandle(projectPrice);
    if(defdisbool==true&&(projectPrice.Default_Discount__c.contains(separator) ))
    {
      projectPrice.Default_Discount__c = projectPrice.Default_Discount__c.replace('.',separator);

    }
    // ver 3.8 ends

    //no record selected validation
    boolean selectedListFlag = false;
    for(PARelatedList wRec : relatedListSAPRecord)
    {
      for(PAWrapper r : wRec.wrapperList)
      {
        if(r.isSelected == true)
        {
          selectedListFlag = true;
          break;
        }
      }
    }
    if(selectedListFlag==false )
    {
      throw new PAException(System.Label.Select_Pricing_Records_Mandatory_Error,ApexPages.Severity.ERROR);
    }

    //populate PC ID in the Request
    if(projectPrice.PricingCondition_Id__c != null)
    {
      currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
    }

    /*populating SFDC KC descrpiton*/
    //<PP20130715>
    //<PP20131231>    
    orgGroupItemsList = [SELECT Standardized_UoM__c,Standardized_Currency__c,Enable_Request_Class__c,Request_Class__c,Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                         Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,Enable_Variable_Config_Materials__c
                         FROM Organizational_Group_Item__c WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE Business__c = :currentRequest.pricingRequest.BU__c AND RecordType.Name = 'Business')
    AND OrgGroup__r.ERP_Sales_Org_Code__c = :currentRequest.pricingRequest.Sales_Org_Code__c
    AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :currentRequest.pricingRequest.Dist_Channel_Code__c AND
    OrgGroup__r.ERP_Division_Code__c = :currentRequest.pricingRequest.Division_Code__c limit 1];

    if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0)
    {
      buOrgGroup  =   orgGroupItemsList[0];  
    }       

    List<ERP_Access_Sequence__c> accSqList = [SELECT isNPCApplicable__c,Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c FROM ERP_Access_Sequence__c
                                              WHERE Pricing_Condition__c = :currentRequest.pricingCondition.selectedPricingCondition
                                              AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];

    for(ERP_Access_Sequence__c ac:accSqList)
    {
      kcIdandKcDescMap.put(ac.Pricing_Key_Combination__r.key_Combination_code__c,ac.Key_Combination__c);
      kcIdandNPCMap.put(ac.Pricing_Key_Combination__c,ac.isNPCApplicable__c);

    }
    /*end*/

    //add selected record to request
    for(PARelatedList wRec1 : relatedListSAPRecord)
    {
      for(PAWrapper r1 : wRec1.wrapperList)
      {
        if(r1.isSelected == true)
        {
          ERP_Sales_Prices_SAP__c pricingRecord = new ERP_Sales_Prices_SAP__c();
          pricingRecord = (ERP_Sales_Prices_SAP__c) r1.sobjectRecord;
          Pricing_Request_Item__c pricingReqItemObj = new Pricing_Request_Item__c();
          pricingReqItemObj.Pricing_Request__c = currentRequest.pricingRequest.id;
          pricingReqItemObj.Pricing_Request_Type__c = 'Project';
          pricingReqItemObj.Approval_Status__c= currentRequest.pricingRequest.Request_Approval_Status__c;
          pricingReqItemObj.Country__c = pricingRecord.Country__c;
          pricingReqItemObj.Country_Code__c = pricingRecord.Country_Code__c;
          pricingReqItemObj.Calculation_Type__c=pricingRecord.Calculation_Type__c;
          pricingReqItemObj.Calculation_Type_Code__c=pricingRecord.Calculation_Type_Code__c;
          pricingReqItemObj.Check_Scale__c=pricingRecord.Check_Scale__c;
          pricingReqItemObj.Check_Scale_Code__c=pricingRecord.Check_Scale_Code__c;
          pricingReqItemObj.Condition_Class__c=pricingRecord.Condition_Class__c;
          pricingReqItemObj.Condition_Class_Code__c=pricingRecord.Condition_Class_Code__c;
          pricingReqItemObj.Customer_Price_Group__c = pricingRecord.Customer_Price_Group__c;
          pricingReqItemObj.Customer_Price_Group_Code__c = pricingRecord.Customer_Price_Group_Code__c;
          pricingReqItemObj.Customer_Specific__c = pricingRecord.Customer_Specific__c;
          pricingReqItemObj.Disc_Ref__c = projectPrice.Project_Id__c;
          pricingReqItemObj.Dist_Channel__c = pricingRecord.Dist_Channel__c;
          pricingReqItemObj.Dist_Channel_Code__c = pricingRecord.Distribution_Channel_Code__c;
          pricingReqItemObj.Division__c = pricingRecord.Division__c;
          pricingReqItemObj.Division_Code__c = pricingRecord.Division_Code__c;
          pricingReqItemObj.End_Use__c = pricingRecord.End_Use__c;
          pricingReqItemObj.End_Use_Code__c = pricingRecord.End_Use_Code__c;
          pricingReqItemObj.End_User__c = pricingRecord.End_User__c;
          pricingReqItemObj.End_User_Code__c = pricingRecord.End_User_Code__c;
          pricingReqItemObj.ERP_Pricing_Procedure__c = pricingRecord.Sales_Pricing_Procedure__c;
          pricingReqItemObj.ERP_Sales_Prices_SAP__c = pricingRecord.Id;
          pricingReqItemObj.Inco_terms__c = pricingRecord.Incoterms1__c;
          pricingReqItemObj.Incoterms_Code__c = pricingRecord.Incoterms_1_Code__c;
          pricingReqItemObj.Key_Combination__c = pricingRecord.Key_Combination__c;
          pricingReqItemObj.Key_Combination_Code__c = pricingRecord.Key_Combination_Code__c;

          System.debug('******kcIdandNPCMap'+pricingRecord);
          //<HL20151901> Added query to fix production issue for NPC Button. 
          ERP_Key_Combination__c  erpKeyCombination = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c = :pricingRecord.Key_Combination_Code__c and SAP_Cluster__c = :pricingRecord.SAP_Cluster__c];
          string keyCombinationID = erpKeyCombination.Id;
          //System.debug('******currentRequest.keyCombination.keyCombinationID'+currentRequest.keyCombination.keyCombinationID);
          // System.debug('******currentRequest.keyCombinationID'+keyCombinationID);
          if(kcIdandKcDescMap.containsKey(pricingRecord.Key_Combination_Code__c))
          {
            finalKC=kcIdandKcDescMap.get(pricingRecord.Key_Combination_Code__c);
          }
          pricingReqItemObj.Key_Combination_SFDC__c=  finalKC;
          /*if(kcIdandNPCMap.containsKey(currentRequest.keyCombination.keyCombinationID))
          {
            pricingReqItemObj.isNPCApplicable__c=kcIdandNPCMap.get(currentRequest.keyCombination.keyCombinationID);
          }*/
          //<HL20151901> Added query to fix production issue for NPC Button. 
          if(kcIdandNPCMap.containsKey(keyCombinationID))
          {
            pricingReqItemObj.isNPCApplicable__c=kcIdandNPCMap.get(keyCombinationID);
          }

          pricingReqItemObj.Material__c = pricingRecord.Material__c;
          pricingReqItemObj.Material_Code__c = pricingRecord.Material_Code__c;
          pricingReqItemObj.Material_Price_Group__c = pricingRecord.Material_Price_Group__c;
          pricingReqItemObj.Material_Price_Group_Code__c = pricingRecord.Material_Price_Group_Code__c;
          //Ver 4.1 START
          pricingReqItemObj.Market_Segment_Code__c = pricingRecord.Market_Segment_Code__c;
          pricingReqItemObj.Market_Segment__c = pricingRecord.Market_Segment__c;
          //Ver 4.1 END
          //<MS20140516> Added Variant and SalesOrderType START
          pricingReqItemObj.Variant_Code__c = pricingRecord.Variant_Code__c;
          pricingReqItemObj.Variant__c = pricingRecord.Variant__c;
          //<MS20150101> Added Contract
          pricingReqItemObj.Contract_Code__c = pricingRecord.Contract_Code__c;
          pricingReqItemObj.Contract__c = pricingRecord.Contract__c;
          //<MS20141114>
          //<AV20151104>-Production issue-Wrong project id when cloning
          system.debug('@^#%projid'+currentRequest.pricingRequest.Project_Id__c);
          pricingReqItemObj.Project__c=currentRequest.pricingRequest.Project_Id__c;
          pricingReqItemObj.ComPartner_Code__c = pricingRecord.ComPartner_Code__c;
          pricingReqItemObj.ComPartner__c = pricingRecord.ComPartner__c;
          //<MS20150213>
          pricingReqItemObj.Material_Group_5_Key_Code__c = pricingRecord.Material_Group_5_Key_Code__c;
          pricingReqItemObj.Material_Group_5_Key__c = pricingRecord.Material_Group_5_Key__c;
          pricingReqItemObj.Plant_Code__c = pricingRecord.Plant_Code__c;
          pricingReqItemObj.Plant__c = pricingRecord.Plant__c;
          pricingReqItemObj.Shipping_Condition_Code__c = pricingRecord.Shipping_Condition_Code__c;
          pricingReqItemObj.Shipping_Condition__c = pricingRecord.Shipping_Condition__c;
          pricingReqItemObj.Destination_Country_Code__c = pricingRecord.Destination_Country_Code__c;
          pricingReqItemObj.Destination_Country__c = pricingRecord.Destination_Country__c;
          pricingReqItemObj.Sales_Order_Type_Code__c = pricingRecord.Sales_Order_Type_Code__c;
          pricingReqItemObj.Sales_Order_Type_Code__c = pricingRecord.Sales_Order_Type_Code__c;
          //<MS20140516> Added Variant and SalesOrderType END
          //<<SS20220826> - Added mapping for Sales Order Item fields values START
          pricingReqItemObj.Sales_Order_Item_Code__c = pricingRecord.Sales_Order_Item_Code__c ;
          pricingReqItemObj.Sales_Order_Item__c = pricingRecord.Sales_Order_Item__c ;
          //<<SS20220826> - Added mapping for Sales Order Item fields values END
          //<SS20230501> - START          
          pricingReqItemObj.Value_Center_Code__c = pricingRecord.Value_Center_Code__c ;
          pricingReqItemObj.Value_Center__c = pricingRecord.Value_Center__c ;
          pricingReqItemObj.Material_Group_2_Code__c = pricingRecord.Material_Group_2_Code__c ;
          pricingReqItemObj.Material_Group_2__c = pricingRecord.Material_Group_2__c ;
          pricingReqItemObj.Ext_Matl_Grp_Code__c = pricingRecord.Ext_Matl_Grp_Code__c ;
          pricingReqItemObj.Ext_Matl_Grp__c = pricingRecord.Ext_Matl_Grp__c ;
          pricingReqItemObj.Price_Zone_Code__c = pricingRecord.Price_Zone_Code__c ;
          pricingReqItemObj.Price_Zone__c = pricingRecord.Price_Zone__c ;
          //<SS20230501> -END                   
          //pricingReqItemObj.Non_Commercial_Products__c = pricingRecord.;
          pricingReqItemObj.PH1__c = pricingRecord.PH1__c;
          pricingReqItemObj.PH1_Code__c = pricingRecord.PH1_Code__c;
          pricingReqItemObj.PH2__c = pricingRecord.PH2__c;
          pricingReqItemObj.PH2_Code__c = pricingRecord.PH2_Code__c;
          pricingReqItemObj.PH3__c = pricingRecord.PH3__c;
          pricingReqItemObj.PH3_Code__c = pricingRecord.PH3_Code__c;
          pricingReqItemObj.PH4__c = pricingRecord.PH4__c;
          pricingReqItemObj.PH4_Code__c = pricingRecord.PH4_Code__c;
          pricingReqItemObj.PH5__c = pricingRecord.PH5__c;
          pricingReqItemObj.PH5_Code__c = pricingRecord.PH5_Code__c;
          pricingReqItemObj.PH6__c = pricingRecord.PH6__c;
          pricingReqItemObj.PH6_Code__c = pricingRecord.PH6_Code__c;
          pricingReqItemObj.PH7__c = pricingRecord.PH7__c;
          pricingReqItemObj.PH7_Code__c = pricingRecord.PH7_Code__c;
          pricingReqItemObj.PH8__c = pricingRecord.PH8__c;
          pricingReqItemObj.PH8_Code__c = pricingRecord.PH8_Code__c;
          pricingReqItemObj.PH9__c = pricingRecord.PH9__c;
          pricingReqItemObj.PH9_Code__c = pricingRecord.PH9_Code__c;
          pricingReqItemObj.Price_List_Type__c = pricingRecord.Price_List_Type__c;
          pricingReqItemObj.Price_List_Type_Code__c = pricingRecord.Price_List_Type_Code__c;
          pricingReqItemObj.Pricing_Condition__c = pricingRecord.Pricing_Condition__c;
          pricingReqItemObj.Pricing_Condition_Code__c = pricingRecord.Pricing_Condition_Code__c;
          pricingReqItemObj.Product_Hierarchy__c = pricingRecord.Product_Hierarchy__c;
          pricingReqItemObj.Product_Hierarchy_Code__c =  pricingRecord.F_Product_Hierarchy_Code__c;
          pricingReqItemObj.Profit_Center__c = pricingRecord.Profit_Center__c;
          pricingReqItemObj.Profit_Center_Code__c = pricingRecord.Profit_Center_Code__c;
          pricingReqItemObj.Plus_Minus_Code__c=pricingRecord.Plus_Minus_Code__c;
          pricingReqItemObj.Plus_Minus__c=pricingRecord.Plus_Minus__c;
          //Ver 4.1 START
          pricingReqItemObj.Price_Ref_Partner_Code__c = pricingRecord.Price_Ref_Partner_Code__c;
          pricingReqItemObj.Price_Ref_Partner__c = pricingRecord.Price_Ref_Partner__c;
          //Ver 4.1 END
          pricingReqItemObj.Quantity__c = pricingRecord.Quantity__c;
          pricingReqItemObj.Sales_Office__c = pricingRecord.Sales_Office__c;
          pricingReqItemObj.Sales_Office_Code__c = pricingRecord.Sales_Office_Code__c;
          pricingReqItemObj.Sales_District__c = pricingRecord.Sales_District__c;
          pricingReqItemObj.Sales_District_Code__c = pricingRecord.Sales_District_Code__c;
          pricingReqItemObj.Sales_Org__c = pricingRecord.Sales_Org__c;
          pricingReqItemObj.Sales_Org_Code__c = pricingRecord.Sales_Org_Code__c;
          pricingReqItemObj.SAP_Application_Id__c = pricingRecord.SAP_Application_Id__c;
          pricingReqItemObj.SAP_Client_Id__c = pricingRecord.SAP_Client_ID__c;
          pricingReqItemObj.SAP_Cluster__c = pricingRecord.SAP_Cluster__c;
          pricingReqItemObj.Scaled_Price_Flag__c = pricingRecord.Scaled_Price_Flag__c;
          pricingReqItemObj.Scale_Type__c = pricingRecord.Scale_Type__c;
          pricingReqItemObj.ShipTo__c = pricingRecord.ShipTo__c;
          pricingReqItemObj.ShipTo_Code__c = pricingRecord.ShipTo_Code__c;
          pricingReqItemObj.Sold_To__c = pricingRecord.Sold_To__c;
          pricingReqItemObj.Sold_To_Code__c = pricingRecord.Sold_To_Code__c;
          pricingReqItemObj.Terms_Of_Payment_Code__c = pricingRecord.Terms_of_Payment_Code__c;
          pricingReqItemObj.UoM__c = pricingRecord.UoM__c;
          pricingReqItemObj.New_Valid_From__c =projectPrice.Valid_From__c;
          pricingReqItemObj.New_Valid_To__c = projectPrice.Valid_To__c;
          pricingReqItemObj.New_Rate__c = String.valueOf(projectPrice.Default_Discount__c);
          pricingReqItemObj.Kcode__c = pricingRecord.Kcode__c;
          pricingReqItemObj.Material_Group_1_Code__c = pricingRecord.Material_Group_1_Code__c;
          pricingReqItemObj.Material_Group_1__c = pricingRecord.Material_Group_1__c;
          pricingReqItemObj.Partner_ZF_Code__c = pricingRecord.Partner_ZF_Code__c;
          pricingReqItemObj.Partner_ZF__c = pricingRecord.Partner_ZF__c;
          pricingReqItemObj.Payer_Code__c = pricingRecord.Payer_Code__c;
          pricingReqItemObj.Payer__c = pricingRecord.Payer__c;
          pricingReqItemObj.Disc_Ref_No__c = pricingRecord.Disc_Ref_No__c;
          pricingReqItemObj.FixValDate__c = pricingRecord.FixValDate__c;
          pricingReqItemObj.Campaign__c = pricingRecord.Campaign__c;
          pricingReqItemObj.Campaign_Code__c = pricingRecord.Campaign_Code__c;
          pricingReqItemObj.Document_Currency__c = pricingRecord.Document_Currency__c;
          pricingReqItemObj.Document_Currency_Code__c = pricingRecord.Document_Currency_Code__c;
          pricingReqItemObj.State__c = pricingRecord.State__c;
          pricingReqItemObj.State_Code__c = pricingRecord.State_Code__c;
          if(projectAction <> 'clone')
          {
            pricingReqItemObj.Valid_From__c =pricingRecord.Valid_From__c;
            pricingReqItemObj.Valid_To__c = pricingRecord.Valid_To__c; 
            pricingReqItemObj.Rate__c=pricingRecord.Rate__c;
            pricingReqItemObj.Unit__c = pricingRecord.Unit__c;
          }
          pricingRequestItemSet.add(pricingReqItemObj);
          reqItemObjectList.add(pricingReqItemObj);
        }
      }
    }

    //upsert reqItemObjectList;
    //Ver 2.5 starts
    try
    {
      if(reqItemObjectList.size()!=0)
        upsert reqItemObjectList;
    }
    catch(DMLException e)
    {     //<PS20130424>
      if(e.getMessage().contains('Selected records already available'))
      {
        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
        throw e;
      }
      else
      {
        throw e;
      }   
    }       
    //Ver 2.5 ends  

    //to remove  added record from table    
    List<Id> pri1Ids = new List<Id>();
    for(Pricing_Request_Item__c pri1 : reqItemObjectList)
    {
      pri1Ids.add(pri1.Id);
    }
    //<VR20130509> Ver 4.4 VR 2013-05-09 APAC Rollout1-Adding Extra field Customer Hierarchy in query
    pricingRequestItemRecList = [SELECT Id,ERP_Sales_Prices_SAP__c,Disc_Ref__c,Customer_Hierarchy__c,Customer_Hierarchy_Code__c FROM Pricing_Request_Item__c WHERE Id IN :pri1Ids];

    Set<Id> removeERPIdSet = new Set<Id>();
    List<ERP_Sales_Prices_SAP__c> finalERPList = new List<ERP_Sales_Prices_SAP__c>();

    for(Pricing_Request_Item__c pri2 : pricingRequestItemRecList)
    {
      removeERPIdSet.add(pri2.ERP_Sales_Prices_SAP__c);
    }
    for(PARelatedList wRec1 : relatedListSAPRecord)
    {
      for(Integer j = 0 ; j < wRec1.wrapperList.size(); j++)
      {
        if(removeERPIdSet.contains(((ERP_Sales_Prices_SAP__c)wRec1.wrapperList[j].sObjectRecord).Id))
        {
          sObject a = wRec1.wrapperList.remove(j).sObjectRecord;
          j = j - 1;
        }
      }
    }

    //display Done Button
    dispDoneButton ='dipsDoneSAP';

    //POPULATE KC
    currentRequest.pricingRequest.pricing_Request_type__c='Project Pricing';
    if(projectPrice.PricingCondition_Id__c != null)
    {
      currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
    }
    kcListOptions=currentRequest.keyCombination.getListOptions();

    //display added record info
    boolean flag = true;
    for(Pricing_Request_Item__c pri : reqItemObjectList)
    {
      if(pri.Id == null) 
      {
        flag = false;
      }
    }
    if(flag==true)
    {
      projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount'); // ver 3.8
      throw new PAException(System.Label.Selected_Records_Added_Info,ApexPages.Severity.INFO);
    } 

  }

  /*
   * Author     : Anand Darshi
   * Method Name : goToRequestAfterEdit
   * Parameters  : No parameters
   * Return type : void 
   * Description : This method will naviagate to New project screen on Clicking edit button.
   */

  private void goToRequestAfterEdit()
  {  
    //3.3  starts
    if(projectPrice.PricingCondition_Id__c != null)
    {
      currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
    }
    //<PP20130424> START
    calculatePlusMinusRate();
    //<PP20130424> END
    //ver  3.3 ends

    privateproject=[SELECT Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                    Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,
                    Valid_To__c,status__c,isApproved__c  FROM Project_Price__c WHERE Id=:projectPrice.Id];
    //<PS20130424>
    projectPrice.Assigned_To__c = currentRequest.userSelected;
    upsert projectPrice;
    System.debug('*****projectprice'+projectPrice);
    //
    currentRequest.projectPrice = [SELECT Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                                   Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,
                                   Valid_To__c,status__c,isApproved__c  FROM Project_Price__c WHERE Id=:projectPrice.Id];

    //<PP20130715>
    currentRequest.pricingRequest=[SELECT Request_Class__c,Zip_PostalCode__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, Task_Subject__c, SystemModstamp, Street__c, 
                                   State_Province__c,Spot_Type__c, Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,
                                   SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                   Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,On_Behalf_Of__r.Name,
                                   Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                   LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                   Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, CreatedDate,
                                   CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                   Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                                   Approver1_Date__c,Incoterms_Code__c,SoldTo_Code__c,Project_Header_Approval_Flag__c,NPC_Status__c,Attachments_on_Customer_Prices__c,Sold_To__c,ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c WHERE Project_Price__c = :projectPrice.Id];

    //populate pricing Condition
    if(projectPrice.PricingCondition_Id__c !=null)
    {
      //ERP_Pricing_Condition__c pCondition = [SELECT id,Pricing_Condition__c FROM ERP_Pricing_Condition__c WHERE id =:projectPrice.PricingCondition_Id__c];
      currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
    }

    //populate KC
    kcListOptions=currentRequest.keyCombination.getListOptions();

    //changing vliad from and Valid To
    if(privateproject.Valid_From__c != projectPrice.Valid_From__c || privateproject.Valid_To__c != projectPrice.Valid_To__c || privateproject.Default_Discount__c !=projectPrice.Default_Discount__c )
    {
      list<Pricing_Request_Item__c> reqItemList = new list<Pricing_Request_Item__c>();
      reqItemList= [SELECT id,Valid_From__c,Valid_To__c FROM Pricing_Request_Item__c WHERE Pricing_Request__c=:currentRequest.pricingRequest.id];

      for(Pricing_Request_Item__c r :reqItemList)
      {   
        r.New_Valid_From__c=projectPrice.Valid_From__c;
        r.New_Valid_To__c=projectPrice.Valid_To__c;
        r.New_Rate__c=projectPrice.Default_Discount__c;
      }
      upsert reqItemList;
    }

  }

  /*
   * Author      : Anand Darshi
   * Method Name : checkTheRequestAndProjectStatus
   * Parameters  : string,string
   * Return type : string 
   * Description : This method identifies which all action sholud be allowed to user for each project record displayed based on the project status and the request status.
   */   

  private string checkRequestAndProjectStatus(string proj_stat,string req_stat)
  {
    string retVal;     
    if((proj_stat=='Draft' && req_stat=='Draft') ||( proj_stat=='Recalled' && req_stat=='Recalled') || (proj_stat=='Rejected' && req_stat=='Rejected'))
    {
      retVal= 'Edit';       
    }
    else if(proj_stat=='Draft' && req_stat=='NoRequest') //added by anand on 20 Feb
    {
      retVal='NoReqForDraftProj';
    } 
    else if(proj_stat=='Submitted' && req_stat=='Submitted')
    {
      retVal= 'None'; 
    }
    else if(proj_stat=='Approved' && req_stat=='NoRequest' ) 
    {
      retVal= 'All';
    }
    else if(proj_stat=='Completed' && req_stat=='NoRequest')
    {
      retVal= 'Clone';
    }
    return retVal;
  }

  /*
   * Author      : Anand Darshi
   * Method Name : projectActionCalculation
   * Parameters  : string,string
   * Return type : void 
   * Description : This method do respective initialization of code based on the project action performed-edit,clone or projectId
   */   

  private void projectActionCalculation(string selectedProjectId, string projectAction)
  {  

    if(selectedProjectId != null && projectAction!=null )
    {
         
      if(selectedProjectId !=null && projectAction=='edit')
      {
        projectPrice=[select Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                      Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,status__c,isApproved__c 
                      FROM Project_Price__c WHERE Id=:selectedProjectId];
      //<MG20160303> start  
           defaultdiscounthandle(projectPrice);
        
        //<MG20160303> end
        // ver 3.8 starts
        //<TJ20150603>                    
        if(defdisbool==true &&(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains('.') ))
        {
          projectPrice.Default_Discount__c= projectPrice.Default_Discount__c.replace('.',separator);
        }
        // ver 3.8 ends
        try
        {
          Pricing_Request__c   pricingRequest=[select id,Request_Approval_Status__c,Request_Name__c,Request_Type__c,Name FROM Pricing_Request__c
                                               WHERE Project_Price__c =:projectPrice.id];
          projectSelection='edit';     
        }
        catch(QueryException  e)
        {   
          system.debug('**** inside editProject QueryException'+e);

        }

        if(projectPrice.Project_Status__c =='Approved')
        {
          projectSelection='editApproved';
          dispNext=true;
          disableFields=true;
          privateproject=[select Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                          Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,Valid_To__c,status__c,isApproved__c 
                          FROM Project_Price__c WHERE Id=:selectedProjectId];
        }

        checkActionExecuted=true;
      }
      else if(selectedProjectId !=null && projectAction=='clone')
      {
        privateproject =projectPrice=[SELECT Project_Id__c,Name,Project_Status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                                      Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,
                                      Valid_To__c,status__c,isApproved__c  FROM Project_Price__c WHERE Id=:selectedProjectId];
        // ver 3.8 starts
         //<MG20160303> start 
            
           defaultdiscounthandle(projectPrice);
        
        //<MG20160303> end
        if(defdisbool==true &&(projectPrice.Default_Discount__c.contains('.') ))
        {
          privateproject.Default_Discount__c = privateproject.Default_Discount__c.replace('.',separator);
          projectPrice.Default_Discount__c = projectPrice.Default_Discount__c.replace('.',separator);
          tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
        }
        else{
          tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
        }
        // ver 3.8 ends

        projectPrice.Default_Discount__c = tempStorageMap.get('defaultDiscount');    

        projectSelection='clone';
        newRequestFlag=true;
        newProjectFlag=true;
        dispNext=true;
        currentRequest.pricingRequest.Request_Approval_Status__c='Draft';
        relatedListSAPRecord = new List<PARelatedList>();
        relatedListSAPRecord=getListWrappers();
        checkActionExecuted=true;
        system.debug('***inside clone:'+projectAction);
      } 
      else if(selectedProjectId !=null && projectAction=='projectId')
      {
        system.debug('*** ProjectID:'+selectedProjectId);
        projectPrice=[SELECT Id,Project_Id__c,Name,Project_status__c,Assigned_To__c,Assigned_To__r.Name,Project_Description__c,CreatedBy.Name,PricingCondition_Id__c,Created_By__c,
                      Pricing_Condition__c,Pricing_Condition_Code__c,Default_Discount__c,Project_Volume__c,Valid_From__c,
                      Valid_To__c,status__c,isApproved__c FROM Project_Price__c WHERE Id=:selectedProjectId];

        // ver 3.8 starts
        //<TJ20150603>
        if(projectPrice.Default_Discount__c!=null && projectPrice.Default_Discount__c.contains('.') )
        {
          projectPrice.Default_Discount__c = projectPrice.Default_Discount__c.replace('.',separator);
          tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
        }
        else{
          tempStorageMap.put('defaultDiscount',projectPrice.Default_Discount__c);
        }
        // ver 3.8 ends

        try
        {
          currentRequest.pricingRequest= new Pricing_Request__c();
          //<PP20130715>
          currentRequest.pricingRequest=[SELECT Request_Class__c,Zip_PostalCode__c, Terms_Of_Payment__c, Terms_Of_Payment_Code__c, Task_Subject__c,     
                                         State_Province__c,Spot_Type__c, Sales_Org__c, Sales_Org_Code__c, SAP_Client_Id__c,SystemModstamp, Street__c,
                                         SAP_Application_Id__c,Request_Valid_To__c, Request_Valid_From__c, Request_Type__c, Request_Reason__c, 
                                         Request_Name__c, Request_Approval_Status__c,Project_Price__c, Pricing_Request_Type__c, OwnerId, On_Behalf_Of__c,On_Behalf_Of__r.Name,
                                         Non_Standard_Terms_Of_Payment__c, Non_Standard_Incoterm__c,Name, LastModifiedDate, LastModifiedById, 
                                         LastActivityDate, IsDeleted, Incoterm__c, Id, Due_Date__c, Division__c, Division_Code__c,Dist_Channel__c,
                                         Dist_Channel_Code__c,Description__c,Customer_Specific__c,Current_Level__c, Current_Approver__c, CreatedDate,
                                         CreatedById, Country__c, City__c, CSR_Instruction__c, BU__c, Assigned_To__c, Approver5__c, Approver5_Date__c,
                                         Approver4__c, Approver4_Date__c, Approver3__c, Approver3_Date__c, Approver2__c, Approver2_Date__c, Approver1__c,
                                         Approver1_Date__c,Incoterms_Code__c,SoldTo_Code__c,Project_Header_Approval_Flag__c,
                                         NPC_Status__c,Attachments_on_Customer_Prices__c,Sold_To__c,ComPartner__c,ComPartner_Code__c FROM Pricing_Request__c WHERE Project_Price__c = :projectPrice.Id];

          //populate PC ID & KC 
          if(projectPrice.PricingCondition_Id__c !=null)
          {
            currentRequest.pricingCondition.selectedPricingCondition=projectPrice.PricingCondition_Id__c;
          }
          kcListOptions=currentRequest.keyCombination.getListOptions(); 

          //check req status n project status
          if(projectPrice.Project_Status__c=='Draft' && currentRequest.pricingRequest.Request_Approval_status__c =='Draft')
          {
            projectSelection='projectId';
          }
          else if((projectPrice.Project_Status__c=='Recalled' && currentRequest.pricingRequest.Request_Approval_status__c =='Recalled') ||
              (projectPrice.Project_Status__c=='Rejected' && currentRequest.pricingRequest.Request_Approval_status__c =='Rejected')) 
          {
            projectSelection='projectId';
          }
          else if(projectPrice.Project_Status__c=='Approved')
          {
            if(currentRequest.pricingRequest.Request_Approval_status__c =='Draft' || currentRequest.pricingRequest.Request_Approval_status__c =='Rejected' || currentRequest.pricingRequest.Request_Approval_status__c =='Recalled')
            { 
              projectSelection='projectId';
            }
            else if(currentRequest.pricingRequest.Request_Approval_status__c =='Submitted')
            {
              projectSelection='projectId';
            }
          }
          else if(projectPrice.Project_Status__c=='Submitted')
          {
            if(currentRequest.pricingRequest.Request_Approval_status__c =='Submitted')
            { 
              projectSelection='projectId';
            }
          }

        }
        catch(QueryException  e)
        {
          if(projectPrice.Project_Status__c=='Approved')
          {
            projectSelection='projectId';
            dispRecordsFromSAP='IdApprovedProject'; 
            newRequestFlag=true;
            currentRequest.pricingRequest.Request_Approval_Status__c='Draft';
            relatedListSAPRecord = new List<PARelatedList>();
            relatedListSAPRecord=getListWrappers();
            projectSelection='projectId';
          }

          else if(projectPrice.Project_Status__c=='Completed')
          {    
            projectSelection='projectId'; 
            dispRecordsFromSAP='IdCompleteProject';
            relatedListSAPRecord = new List<PARelatedList>();
            relatedListSAPRecord=getListWrappers();         

          } 
          else if(projectPrice.Project_Status__c=='Submitted')
          {    
            projectSelection='projectId';
            dispRecordsFromSAP='IdProjectHeaderSubmitted';
            relatedListSAPRecord = new List<PARelatedList>();
            relatedListSAPRecord=getListWrappers();            
          } 
        }
        checkActionExecuted=true;
      }   
    }

  }
  //<PP20130424> START
  private void calculatePlusMinusRate()
  {  //<MG20160303>start
      disableDefDiscount();
      //if (currentRequest.pricingCondition.pricingCondition!=null
       // && currentRequest.pricingCondition.pricingCondition.Plus_Minus__c != null)
     
     
    if(disabledefdisc==true && (currentRequest.pricingCondition.pricingCondition!=null
        && currentRequest.pricingCondition.pricingCondition.Plus_Minus__c != null)) //<MG20160303>end
    {
      Decimal roundOfRate = Decimal.valueOf(projectPrice.Default_Discount__c).abs();
      if(currentRequest.pricingCondition.pricingCondition.Plus_Minus_Code__c=='X')
      {
        roundOfRate= (-1) * roundOfRate;
      }
      projectPrice.Default_Discount__c = String.valueOF(roundOfRate);
    }
  }
  //<PP20130424> END
  
  //<MG20160303> start 
   public boolean defdisbool{get;set;}
           public void defaultdiscounthandle(Project_Price__c proprice) 
           {
        
                       boolean defdisbool;
                       List<ERP_Pricing_Condition__c> pc=new List<ERP_Pricing_Condition__c>();
                     pc=[SELECT Pricing_Condition_Code__c, Condition_Class__c from ERP_Pricing_Condition__c where Pricing_Condition_Code__c =: proprice.Pricing_Condition_Code__c];
                    //system.debug('**in_defaultdiscounthandle*conditionClass'+pc[0].Condition_Class__c); 
                    if(pc.size()>0 && pc[0].Condition_Class__c=='Price')
                    defdisbool=false;
                else
                    defdisbool=true;   
                     system.debug('**in_defaultdiscounthandle*Boolean value'+defdisbool); 
                      
           }
  //<MG20160303> start

  //<TJ20150603>
  public boolean disabledefdisc{get;set;}
  public void disableDefDiscount()
  {
    ERP_Pricing_Condition__c pc=[SELECT Pricing_Condition_Code__c,Condition_Class__c from ERP_Pricing_Condition__c where id=:currentRequest.pricingCondition.selectedPricingCondition];
    if(pc.Condition_Class__c=='Price')
      disabledefdisc=false;
    else
      disabledefdisc=true;
  }
}