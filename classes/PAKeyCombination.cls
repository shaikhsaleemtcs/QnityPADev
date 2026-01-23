/* Version 1.1 -- changing the class to with sharing Prachi
 * 1.2          19 Feb 2013 Bala   For specific Keycombination Type
 * 1.3          28 Feb 2013 Neeharika  Changed label of Key combination drop down
 * 1.4          28 Feb 2013 Priyanka   Removed Org_Group query
 * 1.5          19 March        prachi      changed the key combination for Pricing Task
 * 1.6          24 April        Shiva       Added null condition for additional KC fields - Market Segment, Country,
                                            Price Ref. Partner, End Use, End User
 */
/**************************************************************************************************************
 ***********************************************Modification Log************************************************
<PP20130422>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 Apr 2013
Description         :   Defaulting KC in case of a single PC or KC - APAC ROLLOUT(1.6)
 *****************************************************************************************************************
<VR20130509>
Last Modified By    :   Vinoth
Last Modified Date  :   09 May 2013
Description         :   Adding Logic for extra key field Customer Hierarchy - APAC ROLLOUT1(1.7)
 *****************************************************************************************************************
<VR20130715>
Last Modified By    :   Vinoth
Last Modified Date  :   15 Jul 2013
Description         :   Adding Logic for Creation of Floor and Reference Prices - APAC ROLLOUT2(1.8)
*****************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(1.9)
 *****************************************************************************************************************
<PP20131030>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   30 October 2013
Description         :   1)Added logic for new Key Field Ship-To Country - ROLLOUT2
            2)Added logic for sorting KC according to KC code - ROLLOUT2  
**********************************************************************************************************************
<MS20140502>
Last Modified By    :   Mohit Sinha
Last Modified Date  :   02 May 2014
Description         :   Added logic to populate single select list for NCS,Floor and Refernce
**********************************************************************************************************************
<PP20140522>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 May 2014
Description         :   Added variable to store Access Sequence on Import
 **********************************************************************************************************************
<PP20141022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2014
Description         :   Hide Matching records on change of PC-KC in Non customer specific - Issue # 128
 **********************************************************************************************************************
<CRM-2021-04-0192>
Last Modified By   :   Harsh Gurvanshi
Last Modified Date :   18 Nov 2021
Description        :   Adding extra condition check with BusinessUnit for Floor & Reference in P80
Issue #            :   CRM-2021-04-0192|| EC CRM
 **********************************************************************************************************************
<SS20230501>
Last Modified By   :   Shantanu Sharma
Last Modified Date :   01 May 2023
Description        :   Adding check for hiding certain PCKC from users for P80 M&M business.
************************************************************************************************************
<KK08-11-2023 IS EI-00100286 >
Last Modified By   :   Koteswararao Kasani
Last Modified Date :   08 November 2023
Description        :   Adding the condition for visibility floor prices PCKC in the PCKC list.
 ***********************************************************************************************************************/
public with sharing class PAKeyCombination implements IPAServiceComponent {
  public list<String> PCLselectedKeyCombination{get;set;}
  public ERP_Key_Combination__c erpKeyCombination {get;set;}
  public PAPricingCondition pc {get;set;}
  public string keyCombinationName;
  public boolean showShipTo{get;set;}
  public static boolean canRunFromTestClass = true;   //CRM-2021-04-0192- TestClass Coverage 
  public String keyComb{get
    {
      if(keyComb == null && KeyCombinationName!=null)
      {
            keyComb = KeyCombinationName; 
      }
      return keyComb;
    }
    set
    {
      keyComb = value;
      if(keyComb.contains('Ship to')||keyComb.contains('Price Ref. Partner')
      ||keyComb.contains('End User') ||keyComb.contains('Customer Hierarchy')
      ||keyComb.contains('ComPartner')||keyComb.contains('Partner ZF') ||keyComb.contains('Payer'))
      {
        showShipTo = true;
      }
      else
      {
        showShipTo = false;
      }  
    }
  }
    //<PP20140522>
    public ERP_Access_Sequence__c accSequence {get;set;}
    public String pckcconcat{get;set
      //<PP20141022> START
      {
        if(keyCombinationServiceState.currentRequest.salesPriceSAP != null)
        keyCombinationServiceState.currentRequest.salesPriceSAP.relatedWrappersList = new List<PARelatedList>();
      if(value!=null)
      pckcconcat = value;
      
      }
      //<PP20141022> END
    }
    public List<SelectOption> pcKCOptionsList{get;set;}
    public boolean defncs=false;
   
  public string getKeyCombinationName()
  {
    //<PP20130422> -- Ver 1.6

    keyCombinationServiceState.currentRequest.pricingCondition.getListOptions();
    if(KeyCombinationID!=null && keyCombinationID!='--Select--' && keyCombinationID!='callKCSetter' && !String.isBlank(keyCombinationID))
    {
      system.debug('**** KeyComId '+keyCombinationID);
      keyCombinationName = [SELECT Key_Combination__c FROM ERP_Key_Combination__c WHERE Id=:keyCombinationID].Key_Combination__c;
    }
    if(PCLselectedKeyCombination!=null && PCLselectedKeyCombination.size()!=0)
    {
      list<String> PCLselectedKeyCombinationName=new list<String>();
      list<ERP_Key_Combination__c> PCLKeycombination=new list<ERP_Key_Combination__c>();
      PCLKeycombination = [SELECT Key_Combination__c FROM ERP_Key_Combination__c  WHERE id in:PCLselectedKeyCombination];

      for(ERP_Key_Combination__c s:PCLKeycombination){
        PCLselectedKeyCombinationName.add(s.Key_Combination__c);
      }
      for(integer j=0;j<PCLselectedKeyCombinationName.size();j++){
        if(j==0){
          KeyCombinationName=PCLselectedKeyCombinationName[j];
        }
        else
        {
          KeyCombinationName+=','+PCLselectedKeyCombinationName[j];
        }
      }
    } 
    //added for view state issue
    if(keyCombinationName!=null)
    keyComb = KeyCombinationName;
    return KeyCombinationName;
  }
  public void pckcList()
  {
    pckcOptionsList=getListPCKC();
  }
  public void setKeyCombinationName(string KeyCombinationName)
  {
    this.KeyCombinationName = KeyCombinationName;
  }
  public String keyCombinationID;//SFID

  public String getkeyCombinationID(){    
    return keyCombinationID;
  }
  public void setkeyCombinationID(String keyCombinationID){
    //<PP20130422> -- Ver 1.6 START
    if(keyCombinationID == 'callKCSetter')
    {
      List<SelectOption> selOptList = getListOptions();
      if(selOptList != null && selOptList.size() >0)
      {
        this.keyCombinationID = selOptList[0].getValue();
      }
      else
      {
        this.keyCombinationID=null;
      }
    }
    else
    {
      this.keyCombinationID=keyCombinationID;
    }
    //<PP20130422> -- Ver 1.6 END
    keyCombinationServiceState.currentRequest.soldToFilter = null;
    keyCombinationServiceState.currentRequest.materialFilter = null; 
    keyCombinationServiceState.currentRequest.phFilter = null;
    keyCombinationServiceState.currentRequest.profitCenterFilter = null;
    keyCombinationServiceState.currentRequest.cpgFilter = null;
    keyCombinationServiceState.currentRequest.priceListTypeFilter = null;
    keyCombinationServiceState.currentRequest.discRefFilter = null;
    keyCombinationServiceState.currentRequest.mpgFilter = null;
    keyCombinationServiceState.currentRequest.paymentTermsFilter = null;
    keyCombinationServiceState.currentRequest.salesOfficeFilter = null;
    keyCombinationServiceState.currentRequest.salesDistrictFilter = null;
    keyCombinationServiceState.currentRequest.shipToFilter = null;
    //keyCombinationServiceState.currentRequest.pricingRequest.Due_Date__c = null;
    //Ver 1.6 START
    keyCombinationServiceState.currentRequest.priceRefPartnerFilter = null;
    keyCombinationServiceState.currentRequest.endUseFilter = null;
    keyCombinationServiceState.currentRequest.marketSegmentFilter = null;
        //<MS20140515> Added Variant and SalesOrderType fields 
        keyCombinationServiceState.currentRequest.variantFilter = null;
        keyCombinationServiceState.currentRequest.contractFilter = null;
        keyCombinationServiceState.currentRequest.salesOrderTypeFilter = null;
        keyCombinationServiceState.currentRequest.ComPartnerFilter = null;
        //<MS20150213> Adding 
        keyCombinationServiceState.currentRequest.materialGroup5KeyFilter = null;
        keyCombinationServiceState.currentRequest.materialGroup1Filter = null; 
    keyCombinationServiceState.currentRequest.endUserFilter = null;
    keyCombinationServiceState.currentRequest.countryFilter = null;
    //<VR20130509> Ver 1.7 VR 2013-05-09 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
    keyCombinationServiceState.currentRequest.customerHierarchyFilter = null;
    //<BB20130726> Ver 1.9 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Incoterms
    keyCombinationServiceState.currentRequest.incotermsFilter = null;
    //<PP20131030>
    keyCombinationServiceState.currentRequest.shipToCountryFilter = null;
    //Ver 1.6 END
    //<MS20141114>
    keyCombinationServiceState.currentRequest.projectFilter = null;
    keyCombinationServiceState.currentRequest.kcodeFilter = null;
    keyCombinationServiceState.currentRequest.payerFilter = null;
    keyCombinationServiceState.currentRequest.partnerZFFilter = null;
    keyCombinationServiceState.currentRequest.discRefNoFilter = null;
    keyCombinationServiceState.currentRequest.fixValDateFilter = null;
    keyCombinationServiceState.currentRequest.campaignFilter = null;
    keyCombinationServiceState.currentRequest.documentCurrencyFilter = null;
    keyCombinationServiceState.currentRequest.stateFilter = null;
    keyCombinationServiceState.currentRequest.salesPriceSAP.relatedWrappersList=new List<PARelatedList>(); 
  }

  public PAServiceState keyCombinationServiceState{get;set;}
  public PAKeyCombination(PAServiceState paServiceState) {
    this.keyCombinationServiceState = paServiceState;

    if(paServiceState.currentRequest!=null){
      pc =  paServiceState.currentRequest.pricingCondition;
      // this.request=paServiceState.currentRequest;
    }  
  }

  /*Priyanka-- added on 31stjan*/
  public void getKCFromName(String kcCode)
  {
    erpKeyCombination = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c = :kcCode];
    keyCombinationID = erpKeyCombination.Id;
  }

  /*Priyanka-- added on 31stjan*/
  public void getKCFromCodeAndCluster(String kcCode,String clusterId)
  {
    List<ERP_Key_Combination__c> erpKeyCombList = new List<ERP_Key_Combination__c>();
    erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c,SAP_Cluster__c,SAP_Client_Id__c,SAP_Application_Id__c 
              FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c = :kcCode
              AND SAP_Cluster__c = :clusterId];
    if(erpKeyCombList != null && erpKeyCombList.size() != 0)
    {
      erpKeyCombination = erpKeyCombList[0];
      keyCombinationID = erpKeyCombination.Id;
    }
  }

  /*Priyanka-- added on 31stjan*/
  public void getKCFromCodeAndSAPCluster(String kcCode,String clusterId,String appId, String clientId)
  {
    List<ERP_Key_Combination__c> erpKeyCombList = new List<ERP_Key_Combination__c>();
    boolean custspec;
    if(keyCombinationServiceState.currentRequest!=null && keyCombinationServiceState.currentRequest.pricingRequest!=null && keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c=='Non Customer Specific')
      custspec=false;
    else
      custspec=true;
    erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c,SAP_Cluster__c,SAP_Client_Id__c,SAP_Application_Id__c 
              FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c = :kcCode
              AND SAP_Cluster__c = :clusterId AND SAP_Application_Id__c = :appId AND SAP_Client_Id__c = :clientId AND Customer_Specific__c=:custspec];
    if(erpKeyCombList != null && erpKeyCombList.size() != 0)
    {
      erpKeyCombination = erpKeyCombList[0];
      keyCombinationID = erpKeyCombination.Id;
    }
  }
  
  public void getPCKCFromCodeAndSAPCluster(String pcCode,String kcCode,String clusterId,String appId, String clientId)
  {
    List<ERP_Key_Combination__c> erpKeyCombList = new List<ERP_Key_Combination__c>();
    erpKeyCombList = [SELECT Id 
              FROM ERP_Key_Combination__c WHERE Key_Combination_Code__c = :kcCode
              AND SAP_Cluster__c = :clusterId AND SAP_Application_Id__c = :appId AND SAP_Client_Id__c = :clientId];
    List<ERP_Pricing_Condition__c> erpPriCondList = new List<ERP_Pricing_Condition__c>();
    erpPriCondList = [SELECT Id 
              FROM ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c = :pcCode
              AND SAP_Cluster__c = :clusterId AND SAP_Application_Id__c = :appId AND SAP_Client_Id__c = :clientId];
    if(erpKeyCombList != null && erpKeyCombList.size() != 0 && erpPriCondList != null && erpPriCondList.size() != 0)
    {
      List<ERP_Access_Sequence__c> asq = new List<ERP_Access_Sequence__c>();
      asq=[SELECT Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Condition__r.Pricing_Condition__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Pricing_Key_Combination__r.Key_Combination__c from ERP_Access_Sequence__c where Pricing_Condition__r.id=:erpPriCondList[0].id AND Pricing_Key_Combination__r.id=:erpKeyCombList[0].id];
      if(asq.size()>0)
        pckcconcat=asq[0].Pricing_Condition__r.Pricing_Condition_Code__c+'-'+asq[0].Pricing_Condition__r.Pricing_Condition__c+' : '+asq[0].Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+asq[0].Pricing_Key_Combination__r.Key_Combination__c;
      system.debug(pckcconcat);
    }
    defncs=true;
  }

  public List<SObject> getListBusinessComponents() {
    // TODO Auto-generated method stub
    return null;
  }

  //selectoptions
  public List<SelectOption> getListOptions() {
    //on 30th try clean up logic
    
    if(keyCombinationServiceState.currentRequest!=null){
      this.keyCombinationServiceState = keyCombinationServiceState.currentRequest.requestServiceState;
      if(keyCombinationServiceState.currentRequest.PricingCondition!=null && keyCombinationServiceState.currentRequest.PricingCondition.pricingCondition!=null) {
        pc =  keyCombinationServiceState.currentRequest.PricingCondition;
      }
    }  
    //try end
    List<selectOption> kcOptions= new List<SelectOption>();
    //<PP20140121>
    if(((keyCombinationServiceState.currentRequest!=null && keyCombinationServiceState.currentRequest.pricingRequest !=null && 
        keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c!=null) || 
        (keyCombinationServiceState.erpCustomer!=null && keyCombinationServiceState.erpCustomer.paERPCustomer!=null &&
        keyCombinationServiceState.erpCustomer.paERPCustomer.sales_Org_code__c!=null))&& keyCombinationServiceState.ogItems.value !='Import')
    {
      string distCode,divCode,salesOrgCode;
      if(  canRunFromTestClass == true){    //CRM-2021-04-0192- TestClass Coverage
        if(keyCombinationServiceState.currentRequest!=null && keyCombinationServiceState.currentRequest.pricingRequest !=null && 
            keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c!=null)
        {   
            distCode = keyCombinationServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c;
            divCode = keyCombinationServiceState.currentRequest.pricingRequest.Division_Code__c;
            salesOrgCode = keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c;
            if(distCode.contains('-')||divCode.contains('-')||salesOrgCode.contains('-'))
            {
            distCode = distCode.split('-')[0];
            divCode = divCode.split('-')[0];
            salesOrgCode = salesOrgCode.split('-')[0];
            }
        }
        else
        {
            distCode = keyCombinationServiceState.currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
            divCode = keyCombinationServiceState.currentRequest.customer.paERPCustomer.Division_Code__c;
            salesOrgCode = keyCombinationServiceState.currentRequest.customer.paERPCustomer.Sales_Org_Code__c;
    
        }
      }
      string selectedBU = keyCombinationServiceState.ogItems.selectedBU;
      system.debug('***'+selectedBU);
      //get the Pricing Procedure for the Bu and salesarea
      //Ver1.4 STARTS
      List<Organizational_Group_Item__c> orgGrpItemList1 = new List<Organizational_Group_Item__c>(); 
      Organizational_Group_Item__c buOrgGroup = new Organizational_Group_Item__c(); 
      orgGrpItemList1 = [select Retroactive_Limit__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,OrgGroup__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division__c,Business__r.Business__c,ERP_Pricing_Procedure__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division_Code__c
                from Organizational_Group_Item__c
                WHERE Business__c=:selectedBU AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:distCode AND OrgGroup__r.ERP_Division_Code__c=:divCode AND OrgGroup__r.ERP_Sales_Org_Code__c=:salesOrgCode];
      if(orgGrpItemList1 != null && orgGrpItemList1.size() != 0)
      {
        buOrgGroup=orgGrpItemList1[0];
      }
      //Ver 1.4 ENDS
      List<ERP_Key_Combination__c> erpKeyCombList = new List<ERP_Key_Combination__c>();
      /*Added - bala Feb 18 sorting KC based on sequence Number*/
      List<ERP_Access_Sequence__c> accSqList = new List<ERP_Access_Sequence__c>();
      List<Id> keyListIds = new List<Id>();
      /*completed*/
      string selectedKC='--Select--';
      boolean customerSpecific = false;
      Boolean dispFetchedRecBoolean = false;
      /*neeha-Map with Pricing_Key_Combination__c as key and Key_Combination__c as value  */
      Map<Id,String> kcIdandKcDescMap =new Map<Id,String>();
      if(keyCombinationServiceState.currentRequest!=null) {
        //<PP20140121>
        if(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c!='Import')
        {
          if((keyCombinationServiceState.currentRequest.pricingRequest.Customer_Specific__c || (keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c == 'Customer Specific' || keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c == 'Massive'))||(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c == 'Customer Specific'))
          {
            system.debug('in side parmanent');
            customerSpecific = true;

          } //added by anand on 18 th Feb
          else if(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Project Pricing'){
            customerSpecific = true;
          }
          else if(keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c == 'Non Customer Specific'){
            customerSpecific = false;
          }
          else if(pc.PCLselectedPricingCondition!= null){
            customerSpecific = true;
          }

          if(pc.PCLselectedPricingCondition!= null)
          {
            set<string> tempPcSet = new set<string>();
            tempPcSet.addAll(pc.PCLselectedPricingCondition);
            if(!tempPcSet.contains('--Select--'))
            {
              /*Added - bala Feb-18*/
              accSqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c FROM ERP_Access_Sequence__c
                    WHERE Pricing_Condition__c IN :Pc.PCLselectedPricingCondition
                    AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
              for(ERP_Access_Sequence__c ac:accSqList)
              {
                keyListIds.add(ac.Pricing_Key_Combination__c);
                kcIdandKcDescMap.put(ac.Pricing_Key_Combination__c,ac.Key_Combination__c);
              }

              erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                        AND Customer_Specific__c = :customerSpecific];
              /*Completed*/                                      
              system.debug('key combinatopns'+erpKeyCombList);
              String finalKcDesc='';
              for(ERP_Key_Combination__c erpKeyComb : erpKeyCombList)
              {    /*added -neeha */
                if(kcIdandKcDescMap.containsKey(erpKeyComb.Id)){
                  finalKcDesc=kcIdandKcDescMap.get(erpKeyComb.Id);
                }
                /*end*/
                String concatKC = erpKeyComb.Key_Combination_Code__c + '-' + finalKcDesc;
                kcOptions.add(new SelectOption(erpKeyComb.Id, concatKC));
              }                                        
            }
          }
          if(pc.selectedPricingCondition != '--Select--' && pc.selectedPricingCondition != null)
          {   
            /*Added - bala Feb-18*/
            accSqList = [SELECT Pricing_Key_Combination__c,sequence_Number__c,Key_Combination__c FROM ERP_Access_Sequence__c
                  WHERE Pricing_Condition__c =:Pc.selectedPricingCondition
                  AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
            for(ERP_Access_Sequence__c ac:accSqList)
            {
              keyListIds.add(ac.Pricing_Key_Combination__c);
              //populating map
              kcIdandKcDescMap.put(ac.Pricing_Key_Combination__c,ac.Key_Combination__c);
              //end
            }
            /*Completed*/    
            if(keyCombinationServiceState.ogItems.value !='Export' && Pc.selectedPricingCondition!='--Select--') {

              /*Added - Bala*/
              if(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c=='Project Pricing')
              {
                //<PP20131030>
                erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                          AND Customer_Specific__c = :customerSpecific AND Key_Combination_type__c includes('Project') ORDER BY Key_Combination_Code__c];
              }

              //Ver 1.5 starts - adding condition of key combination type as 'Spot' for pricing task- 19th march
              else if(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
              {
                //<PP20131030>
                erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                                          AND Customer_Specific__c = :customerSpecific AND Key_Combination_type__c includes('Spot')];
                        }
                        //<VR20130715> Ver 1.8 VR 2013-07-15 APAC Rollout2-Adding Condition for Floor and Reference to display Floor Key Combination
                        
                        else if(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Floor' || keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Reference')
                        {
                            erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                                           AND Key_Combination_type__c includes('Floor','Reference')];
              }
              //Ver 1.5 ends - adding condition of key combination type as 'Spot' for pricing task- 19th march
                      //<MS20140429> - adding floor and reference conditions to Key_Combination_type__c inclusions in query
                      //START    
                      else if(keyCombinationServiceState.ogItems!= null && keyCombinationServiceState.ogItems.value != null && keyCombinationServiceState.ogItems.value =='NonCustReasons')  
                      {
                        erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                                            AND Customer_Specific__c = :customerSpecific AND Key_Combination_type__c includes('Standard','Floor','Reference') ORDER BY Key_Combination_Code__c];  
                      }
                      //END
              else
              {
                //<PP20131030>
                erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                                            AND Customer_Specific__c = :customerSpecific AND Key_Combination_type__c includes('Standard','Floor','Reference') ORDER BY Key_Combination_Code__c];
              }
            }
            else if(Pc.selectedPricingCondition!='--Select--'){
              //<PP20131030>
                          //<VR20130715> Ver 1.8 VR 2013-07-15 APAC Rollout2-Including Floor and Reference in the Where Condition
              erpKeyCombList = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN:keyListIds
                                            AND Key_Combination_type__c includes('Standard','Project','Floor','Reference') ORDER BY Key_Combination_Code__c];
            }
            //commenting this condition written for pricing Task previously ------------------ 19th march
            String finalKcDesc;
            for(ERP_Key_Combination__c erpKeyComb : erpKeyCombList)
            {       /*added -neeha */
              if(kcIdandKcDescMap.containsKey(erpKeyComb.Id)){
                finalKcDesc=kcIdandKcDescMap.get(erpKeyComb.Id);
              }
              /*end*/
              String concatKC = erpKeyComb.Key_Combination_Code__c + '-' + finalKcDesc;
              kcOptions.add(new SelectOption(erpKeyComb.Id, concatKC));
            }
          }
        }
      }
      else {

        List<ERP_Access_Sequence__c> accSeqList;
        if(pc.PCLselectedPricingCondition!=null)
        {
          if(pc.PCLselectedPricingCondition.size()>0)
          {
            //<PP20131030>
            accSeqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.Key_Combination_Code__c,Pricing_Key_Combination__r.Key_Combination__c from ERP_Access_Sequence__c WHERE Pricing_Condition__c IN:pc.PCLselectedPricingCondition AND Pricing_Key_Combination__r.Status__c='Active'
                    ORDER BY Pricing_Key_Combination__r.Key_Combination_Code__c];  
          }
        }
        else
          //<PP20131030>
          accSeqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.Key_Combination_Code__c,Pricing_Key_Combination__r.Key_Combination__c from ERP_Access_Sequence__c WHERE Pricing_Condition__c=:pc.selectedPricingCondition AND Pricing_Key_Combination__r.Status__c='Active'
                  ORDER BY Pricing_Key_Combination__r.Key_Combination_Code__c];
        Map<id,ERP_Access_Sequence__c> accSeqMap= new Map<id,ERP_Access_Sequence__c>();
        for(ERP_Access_Sequence__c accSeqObj : accSeqList) {
          accSeqMap.put(accSeqObj.Pricing_Key_Combination__c,accSeqObj);
        }
        //Generating the Key Combination drop down and Map to store the id and its values
        String finalKcDesc='';
        for(ERP_Access_Sequence__c accSeqObj : accSeqMap.values()) {
          /*added -neeha */
          if(kcIdandKcDescMap.containsKey(accSeqObj.Pricing_Key_Combination__c)){
            finalKcDesc=kcIdandKcDescMap.get(accSeqObj.Pricing_Key_Combination__c);
          }
          /*end*/
          kcOptions.add(new Selectoption(accSeqObj.Pricing_Key_Combination__c,accSeqObj.Pricing_Key_Combination__r.Key_Combination_Code__c+ ' - '+ finalKcDesc));
        }
      }
    }
    /*end*/
    //<PP20130422> -- Ver 1.6 START
    if(kcOptions != null && kcOptions.size()>1 && keyCombinationServiceState.ogItems.value!= 'PCLDisableSelect')
    {
      kcOptions.add(0,new SelectOption('--Select--','--Select--'));
      if(keyCombinationID == null)
        keyCombinationID = kcOptions[0].getValue();                 
    }
    else if(kcOptions != null && kcOptions.size() == 1)
    {
      keyCombinationID = kcOptions[0].getValue();
    }
    //<PP20140121> START
    else if(keyCombinationServiceState.currentRequest!=null &&keyCombinationServiceState.currentRequest.pricingRequest!=null &&keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c=='Import')
    {
    }
    else if((kcOptions == null || (kcOptions != null && kcOptions.size() == 0))&& keyCombinationServiceState.ogItems.value !='Import')
      //<PP20140121> END
    {
      keyCombinationID = null;
      keyCombinationName = null;
    }
    //<PP20130422> -- Ver 1.6 END
    return kcOptions;
  }
  public List<PARelatedList> getListWrappers() {
    // TODO Auto-generated method stub
    return null;
  }
  public void add() {
    // TODO Auto-generated method stub
  }
  public void save() {
    // TODO Auto-generated method stub
  }
  public void deleteRecord() {
    // TODO Auto-generated method stub
  }
  public String validate(String desiredAction) {
    // TODO Auto-generated method stub
    return null; 
  }
  public string action(String newPagelabel,String currentPageLabel, String desiredAction) {
    // TODO Auto-generated method stub 
    return null;
  }
  public String getName() {
    // TODO Auto-generated method stub
    return null;
  }
  public String getType() {
    // TODO Auto-generated method stub
    return null;
  }
  //<TJ20140901>
  public List<String> pcKCList1{get;set;} 
  public Organizational_Group_Item__c buOrgGroup;
  Public boolean PCKCviewerpermission;
  Public boolean Floorpricepermission;
  public List<SelectOption> getListPcKc()
  { 
     //<SS20230501> START - permissionset access check
     PermissionSetAssignment[] psn = [SELECT ID From PermissionSetAssignment WHERE PermissionSet.Name ='PCKC_Viewer' AND AssigneeId = :UserInfo.getUserId()];
     PermissionSetAssignment[] FPPS = [SELECT ID From PermissionSetAssignment WHERE PermissionSet.Name ='Floor_section_enabler' AND AssigneeId = :UserInfo.getUserId()];
     List<HideFloorSection__mdt> hfs = HideFloorSection__mdt.getAll().values();
     for(integer i=0; i<hfs.size(); i++){
     OrgGroup__c ogc = [select id, Business__c from OrgGroup__c where id =: keyCombinationServiceState.ogItems.selectedBU];
     if((hfs[i].Label == ogc.Business__c) && FPPS.size() > 0)
     {
     Floorpricepermission = true;
     break;
     } 
         //<KK08-11-2023 IS EI-00100286 > Start
     else
     {
      if((hfs[i].Label != ogc.Business__c))
      {
      Floorpricepermission = true;
          
           //<KK08-11-2023 IS EI-00100286 >End
      }
      else
      {
      Floorpricepermission = false;
      break;
      }
     }
     }
     PCKCviewerpermission = (psn.size() > 0) ? true : false;
     // <SS20230501> - End
    List<SelectOption> optionsPCKC=new List<SelectOption>();
    List<Organizational_Group_User__c> ogUser = new List<Organizational_Group_User__c>(); 
    ogUser = [SELECT Business__c, Organizational_Group_Item__r.Business__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,
    OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c  FROM Organizational_Group_User__c WHERE Related_User__c = :UserInfo.getUserId() AND Organizational_Group_Item__r.Business__r.RecordType.Name='Business' AND Organizational_Group_Item__r.Business__c = :keyCombinationServiceState.ogItems.selectedBU];
    //Profile p = [select id,Name from Profile where id=:Userinfo.getProfileid()];
    List<String> solist = new List<String>();
    Map<Id,String> BUNameMap = new Map<Id,String>(); // Map Declaration
    for(Organizational_Group_User__c ogu:ogUser)
    {
      solist.add(ogu.orgGroup__r.ERP_Sales_Org_Code__c);
      BUNameMap.put(ogu.Organizational_Group_Item__r.Business__c,ogu.Business__c); //assigning value to Map
    }    
    
    boolean custspec;
    List<ERP_Procedure_Conditions__c> erpProcList = new List<ERP_Procedure_Conditions__c>();
    List<ERP_Access_Sequence__c> acs=new List<ERP_Access_Sequence__c>();
    Map<Id,ERP_Access_Sequence__c> erpAccSeqIdToRecMap = new Map<Id,ERP_Access_Sequence__c>();
    Map<Id,boolean>  erpPriCondIdToScaleMap = new Map<Id,boolean>();
    system.debug('**&&'+keyCombinationServiceState.ogItems.orgGroupItems.ERP_Pricing_Procedure__c);
    string distCode,divCode,salesOrgCode;
    if(keyCombinationServiceState.currentRequest!=null && keyCombinationServiceState.currentRequest.pricingRequest !=null && 
      keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c!=null)
    {   
      distCode = keyCombinationServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c;
      divCode = keyCombinationServiceState.currentRequest.pricingRequest.Division_Code__c;
      salesOrgCode = keyCombinationServiceState.currentRequest.pricingRequest.Sales_Org_Code__c;
      if(distCode.contains('-')||divCode.contains('-')||salesOrgCode.contains('-'))
      {
        distCode = distCode.split('-')[0];
        divCode = divCode.split('-')[0];
        salesOrgCode = salesOrgCode.split('-')[0];
      }
    }
    else
    {
      distCode = keyCombinationServiceState.currentRequest.customer.paERPCustomer.Distribution_Channel_Code__c;
      divCode = keyCombinationServiceState.currentRequest.customer.paERPCustomer.Division_Code__c;
      salesOrgCode = keyCombinationServiceState.currentRequest.customer.paERPCustomer.Sales_Org_Code__c;
    }
    string selectedBU = keyCombinationServiceState.ogItems.selectedBU;
    system.debug('***'+selectedBU+' '+distCode+' '+divCode+' '+salesOrgCode);
    List<Organizational_Group_Item__c> orgGrpItemList1 = new List<Organizational_Group_Item__c>(); 
    buOrgGroup = new Organizational_Group_Item__c(); 
    orgGrpItemList1 = [select ERP_Pricing_Procedure__c
              from Organizational_Group_Item__c WHERE Business__c=:selectedBU AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:distCode AND OrgGroup__r.ERP_Division_Code__c=:divCode AND OrgGroup__r.ERP_Sales_Org_Code__c=:salesOrgCode];
    if(orgGrpItemList1 != null && orgGrpItemList1.size() != 0)
    {   
      buOrgGroup=orgGrpItemList1[0];
    }
    erpProcList = [SELECT Id,Pricing_Condition__c,Sales_Pricing_Procedure_Condition_Config__c FROM ERP_Procedure_Conditions__c WHERE
                     Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c
                     ORDER BY Step__c ASC NULLS LAST];
    if(keyCombinationServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
      {
        String priceType;
        if(keyCombinationServiceState.currentRequest.pricingRequest.Spot_Type__c == 'Spot Price')
        {
          priceType='Pricing Task-Spot';
        }
        else if(keyCombinationServiceState.currentRequest.pricingRequest.Spot_Type__c == 'Free of Charge')
        {
          priceType='Pricing Task-FOC';
        }
        else if(keyCombinationServiceState.currentRequest.pricingRequest.Spot_Type__c == 'Display')
        {
          priceType='Pricing Task-Display';
        }
        acs = [SELECT Id,Hide_for_Price_Requester__c, isNPCApplicable__c, Pricing_Condition__r.SAP_Cluster__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                         Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                         Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                         Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c,
                         Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
                         Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND is_End_User_Rebate__c=false AND
                         Pricing_Key_Combination__r.Customer_Specific__c = :true AND Pricing_Key_Combination__r.Key_Combination_type__c
                         includes('Spot') AND Pricing_Condition__r.Price_Types__c includes (:priceType) ORDER BY Sequence_Number__c];
      }
      else if(keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c == 'Non Customer Specific' || keyCombinationServiceState.ogitems.value=='NonCustomerSpecific')
      {
        List<Pricing_Request_Item__c> priList = [SELECT Id, Pricing_Condition_Code__c, Key_Combination_Code__c FROM Pricing_Request_Item__c
                                                 WHERE Pricing_Request__c =:keyCombinationServiceState.currentRequest.pricingRequest.Id limit 1];
        
        System.debug('checkpricelist$$'+priList);
        if(priList != null && priList.size() > 0)
        {
          acs = [SELECT Id, Hide_for_Price_Requester__c,Pricing_Condition__r.SAP_Cluster__c, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                           Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                           Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c, isVolumeApplicable__c,
                           Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
                           Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
                           Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND is_End_User_Rebate__c=false AND
                           Pricing_Key_Combination__r.Customer_Specific__c = :false AND
                           Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard','Floor','Reference') AND
                           Pricing_Condition__r.Pricing_Condition_Code__c = :priList[0].Pricing_Condition_Code__c AND
                           Pricing_Key_Combination__r.Key_Combination_Code__c = :priList[0].Key_Combination_Code__c];
        }
        else
        {   
           if(Floorpricepermission == true)  //SS20230501 - Enable floor price type PCKC
           {
              
            acs = [SELECT Id,Hide_for_Price_Requester__c, Pricing_Condition__r.SAP_Cluster__c, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                           Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                           Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                           Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c,
                           Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
                           Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND is_End_User_Rebate__c=false AND
                           Pricing_Key_Combination__r.Customer_Specific__c = :false AND
                           Pricing_Key_Combination__r.Key_Combination_type__c includes('Floor','Reference','Net Floor','Net Reference','Standard') AND
                           Pricing_Condition__r.Price_Types__c includes ('Floor','Reference','Net Floor','Net Reference','Standard') ORDER BY Sequence_Number__c];
              
           }
           else{
           acs = [SELECT Id,Hide_for_Price_Requester__c, Pricing_Condition__r.SAP_Cluster__c, isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                           Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                           Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                           Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c, isVolumeApplicable__c,
                           Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c FROM ERP_Access_Sequence__c WHERE
                           Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND is_End_User_Rebate__c=false AND
                           Pricing_Key_Combination__r.Customer_Specific__c = :false AND
                           Pricing_Key_Combination__r.Key_Combination_type__c includes('Floor','Reference','Net Floor','Net Reference','Standard') AND
                           Pricing_Condition__r.Price_Types__c includes ('Reference','Net Floor','Net Reference','Standard') ORDER BY Sequence_Number__c];
          } 
        }
      }
      //<TJ20150107> For Export.
      else if(keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c =='Import' || keyCombinationServiceState.ogItems.value =='Export' || keyCombinationServiceState.ogItems.value =='Import')
      {
        system.debug(buOrgGroup.ERP_Pricing_Procedure__c);
        acs = [SELECT Id,Hide_for_Price_Requester__c, isNPCApplicable__c, Pricing_Condition__r.SAP_Cluster__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                         Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                         Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                         Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
                         Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE
                         Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND is_End_User_Rebate__c=false AND 
                         Pricing_Key_Combination__r.Key_Combination_type__c includes('Floor','Reference','Net Floor','Net Reference','Standard') AND
                       Pricing_Condition__r.Price_Types__c includes ('Floor','Reference','Net Floor','Net Reference','Standard') ORDER BY Sequence_Number__c];
      }
      else
      {
        //<AV20140515>-Added isVolumeApplicable__c field
        //<IM20150127> Added condition to fetch only RPQ access sequences if request is RPQ
        if(keyCombinationServiceState.ogItems.isEndUserRebate)
        acs = [SELECT Id, Hide_for_Price_Requester__c,isNPCApplicable__c, Pricing_Condition__r.SAP_Cluster__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                         Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                         Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                         Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
                         Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE
                         Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND
                         Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard') AND
                         Pricing_Condition__r.SAP_Condition_Type__c = true AND Pricing_Condition__r.Price_Types__c includes
                         ('Standard') AND Pricing_Condition__r.Condition_class__c like '%' AND is_End_User_Rebate__c=true ORDER BY Sequence_Number__c];
        else
        acs = [SELECT Id,Hide_for_Price_Requester__c, isNPCApplicable__c, Pricing_Condition__r.SAP_Cluster__c, Pricing_Condition__r.Pricing_Condition_Code__c, Pricing_Key_Combination__c,
                         Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                         Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                         Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,
                         Pricing_Condition__r.Pricing_Condition__c,Pricing_Key_Combination__r.Key_Combination__c,isVolumeApplicable__c FROM ERP_Access_Sequence__c WHERE
                         Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND
                         Pricing_Key_Combination__r.Customer_Specific__c = :true AND
                         Pricing_Key_Combination__r.Key_Combination_type__c includes('Standard') AND
                         Pricing_Condition__r.SAP_Condition_Type__c = true AND Pricing_Condition__r.Price_Types__c includes
                         ('Standard') AND Pricing_Condition__r.Condition_class__c like '%' AND is_End_User_Rebate__c=false ORDER BY Sequence_Number__c];
      }
      Map<Id,List<ERP_Access_Sequence__c>> pcIdToAccSeqListMap = new Map<Id,List<ERP_Access_Sequence__c>>();
      for(ERP_Access_Sequence__c ac : acs)
      {
        if(pcIdToAccSeqListMap.containsKey(ac.Pricing_Condition__c))
        {
          List<ERP_Access_Sequence__c> l1 = pcIdToAccSeqListMap.get(ac.Pricing_Condition__c);
          l1.add(ac);
          pcIdToAccSeqListMap.put(ac.Pricing_Condition__c,l1);
        }
        else
        {
          List<ERP_Access_Sequence__c> l2 = new List<ERP_Access_Sequence__c>();
          l2.add(ac);
          pcIdToAccSeqListMap.put(ac.Pricing_Condition__c,l2);
        }
      }
    pckclist1 = new list<String>();
    
    for(integer i=0;i<acs.size();i++)
    {
        //Start <CRM-2021-04-0192> 
        String conSetting = BUNameMap.get(keyCombinationServiceState.ogItems.selectedBU)+'_'+acs[i].Pricing_Condition__r.Pricing_Condition_Code__c; 
        // If condition to give access to P23, Approver, BUAdmin for floor & reference PCKC. 
        if( BusinessUnitForFloorinP80__c.getAll().containsKey(conSetting) 
            && !( keyCombinationServiceState.ogItems.salesAdminPermissionSetFlag || keyCombinationServiceState.ogItems.isBUAdmin)){}
            else{ 
               // if(acs[i].Hide_for_Price_Requester__c == True && !(keyCombinationServiceState.ogItems.isBUAdmin) )
                  if(acs[i].Hide_for_Price_Requester__c == True && PCKCviewerpermission==false){}  //<SS20230501> - Enable PCKC condition
                  else 
                   {
                    optionsPCKC.add(new SelectOption(acs[i].Pricing_Condition__r.Pricing_Condition_Code__c+'-'+acs[i].Pricing_Condition__r.Pricing_Condition__c+' : '+acs[i].Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+acs[i].Pricing_Key_Combination__r.Key_Combination__c,acs[i].Pricing_Condition__r.Pricing_Condition_Code__c+'-'+acs[i].Pricing_Condition__r.Pricing_Condition__c+' : '+acs[i].Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+acs[i].Key_Combination__c));
                    pckclist1.add(acs[i].Pricing_Condition__r.Pricing_Condition_Code__c+'-'+acs[i].Pricing_Condition__r.Pricing_Condition__c+' : '+acs[i].Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+acs[i].Key_Combination__c);
            }}//End <CRM-2021-04-0192>
    }
    if(optionsPCKC.size()>1 && defncs==false && keyCombinationServiceState.currentRequest.pricingRequest.Request_Type__c != 'Non Customer Specific')
    {
      optionsPCKC.add(0,new SelectOption('--Select--','--Select--'));
    }
    optionsPCKC.sort();    
    //<PP20140317> START
    if(optionsPCKC.size() >0 && defncs==false)
    {
      pckcconcat = optionsPCKC[0].getValue();      
    }
    //<TJ20140923>
    if(keyCombinationServiceState.currentRequest.ncsPCKC)
    {
      pckcconcat = keyCombinationServiceState.currentRequest.salesPriceSAP.pcKCSelected;
    }    
    if(pckcConcat!=null && pckcConcat!='--Select--')
    {
      setKCFromPCKCConcat();
    }    
    //if(!String.isBlank(selectedBU) && selectedBU != '--Select')
    //{
    //getCountofRequestsToStatusMap();
    //}
    //<PP20140317> END
    return optionsPCKC;
  }
  //<TJ20150112>
  public void setKCFromPCKCConcat()
  {
    if(pckcconcat!=null && pckcconcat!='--Select--')
    {      
      List<ERP_Pricing_Procedure__c> pproced=new List<ERP_Pricing_Procedure__c>();
      List<ERP_Procedure_Conditions__c> pcondList = new List<ERP_Procedure_Conditions__c>();
      ERP_Procedure_Conditions__c pcond=new ERP_Procedure_Conditions__c();
      List<ERP_Key_Combination__c> keyComList = new List<ERP_Key_Combination__c>();
      ERP_Key_Combination__c keyCom=new ERP_Key_Combination__c();
      //Added to remove the selected partner records from view state
      if(keyCombinationServiceState.currentRequest.filtercode!=null)
      keyCombinationServiceState.currentRequest.filtercode = '';
      if(keyCombinationServiceState.currentRequest.filterName!=null)
      keyCombinationServiceState.currentRequest.filterName = '';
      
      
      if(buOrgGroup!=null)
      {
        pproced=[SELECT SAP_Cluster__c, SAP_Application_Id__c, SAP_Client_Id__c FROM ERP_Pricing_Procedure__c where id=:buOrgGroup.ERP_Pricing_Procedure__c LIMIT 1];
        if(pproced != null && pproced.size()>0)
        keyComList=[Select id,Key_Combination__c From ERP_Key_Combination__c Where Key_Combination_Code__c=:pckcconcat.split(':')[1].split('-')[0].trim() AND SAP_Cluster__c=:pproced[0].SAP_Cluster__c AND SAP_Application_Id__c=:pproced[0].SAP_Application_Id__c AND SAP_Client_Id__c=:pproced[0].SAP_Client_Id__c];
        if(keyComList != null && keyComList.size()>0)
        keyCom = keyComList[0];
        keyComb=keyCom.Key_Combination__c;
        if(pproced != null && pproced.size()>0)
        keyCombinationServiceState.currentRequest.pricingCondition.selectedPricingCondition=[Select id from ERP_Pricing_Condition__c where Pricing_Condition_Code__c=:pckcconcat.split(':')[0].split('-')[0] and SAP_Cluster__c=:pproced[0].SAP_Cluster__c AND SAP_Application_Id__c=:pproced[0].SAP_Application_Id__c AND SAP_Client_Id__c=:pproced[0].SAP_Client_Id__c].Id;
        pcondList=[Select Sales_Pricing_Procedure_Condition_Config__c from ERP_Procedure_Conditions__c where Sales_Pricing_Procedure__c=:pproced and Pricing_Condition__c=:keyCombinationServiceState.currentRequest.pricingCondition.selectedPricingCondition];
        if(pcondList!=null && pcondList.size()>0)
        pcond=pcondList[0];
        keyCombinationServiceState.currentRequest.keyCombination.keyCombinationID=keyCom.id;
        if(pcond.Sales_Pricing_Procedure_Condition_Config__c!=null && pcond.Sales_Pricing_Procedure_Condition_Config__c=='Enable Scale')
        {
          keyCombinationServiceState.currentRequest.scaleEnable='true';
        }
        else
        {
          keyCombinationServiceState.currentRequest.scaleEnable='false';
        }
      }
    }
  }
}