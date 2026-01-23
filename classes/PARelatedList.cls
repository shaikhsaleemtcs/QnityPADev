/*
 *  Name            :   PARelatedList
 *  Description     :   This class acts as the Business Component for the Related List Component
 *  Author          :   Infosys Limited
 *  Created Date    :   24-01-2013
 *

 *  Version     Modified Date   Modified By     Modification
 *  1.2         14-02-2013      Shiva           Added a query
 *  1.3         19-02-2013      Priyanka        Changed the try block
 *  1.4         20-02-2013      Priyanka        Modified applyChanges method
 *  1.5         20-02-2013      Shiva           Modified applyChanges method - New Rate thing
 *  1.6         21-02-2013      Priyanka        Modified select unedited records criteria
 *  1.7         26-02-2013      Sanjib          Added one field in query
 *  1.8         26-02-2013      Priyanka        Modified Percentage Rate Change and added Scale validation
 *  1.9         26-02-2013      Bala            Modified the selectUnEdited Method for Project
 *  2.0         26-02-2013      Shiva           Added a validation for scaled records in applychanges method
 *  2.1         26-02-2013      Priyanka        Added deleteSelectedRecord method for deleting Pricing Request Item via link
 *  2.2         26-02-2013      Priyanka        Added 3 variables - dateColumns,newDateColumns,deleteId
 *  2.3         27-02-2013      Sanjib          Changed priceType in pricingRequestId variable
 *  2.4         27-02-2013      Priyanka        Added containsKey condition in applyChanges
 *  2.5         27-02-2013      Sanjib          Added field set for current,floor,reference
 *  2.6         27-02-2013      Priyanka        Added flag for error check
 *  2.7         28-02-2013      Sanjib          Added logic to populate ph and mpg in related list
 *  2.8         28-02-2013      Sanjib          Added currentPageLabel and loadPage method
 *  2.9         01-03-2013      Sanjib          Added one logic to separate - from rate
 *  3.0         01-03-2013      Shiva           For Discounts and Surcharges, ?New Rate? will be the only option applicable in apply changes
 *  3.1         01-03-2013      Sreedhar        To assign selected component for redirection
 *  3.2         01-03-2013      Priyanka        Added validation for Plus/Minus and attribute to store it
 *  3.3         07-03-2013      Priyanka        Added attribute to store Columns string
 *  3.4         07-03-2013      Priyanka        Added try block in applyChanges method to show error message of exceptions and added plus/minus
                                                logic for rate change
 *  3.5         20-03-2013      Sanjib          Added logic for massiv and sold to in dynamic vertical table
 *  3.6         23-03-2013      Sanjib          Added logic for scale quantity and scale rate
 *  3.7         26-03-2013      Sanjib          Added logic for getting approval comments
 *  3.8         26-03-2013      Shiva           Created a boolean variable  'hasScaledRecordFlag'
 *  3.9         26-03-2013      Priyanka        Added logic for rate change according to locale
 *  4.0         26-03-2013      Sanjib          Added logic to get the project details
 *  4.1         28-03-2013      Bala            Renamed the Flr and Ref Method
 *  4.2         28-03-2013      Sanjib          Created to get project sold to name and task comments
 *  4.3        24-05-2013       Brundha         added field set for  approval pending request template
 *  4.4         18-09-2014      hema            Changed the Sobjecttype to detail for display of details in BU Admin Home page
 *  4.5         30-11-2015      Kunal           fix for End Use Code & End Use Duplicated on Email Notifications. The End Use Code & End Use fields were being repeated in the Approval email notification
 *  4.6         03-12-2015      Nadeem          Changed the flag as not to change the approved prices' valid to date line no :1520
 *  4.7         14-06-2016      VijayLaxmi      Added logic for VarientCode present in KeyCombination Issue # IS ID-00070301  
 *  4.8         11-12-2019      Piyush          Added Customer Group 4 as a Business Requirement. #IS SC-00089912.
 *  4.9         19-08-2020      Vinay           Added three New Columns for BI AP SURFACES as a Business Requirement. IS SC-00094817
-------------------------------------------------------------------------------------------------------------------------------------------------
 **************************************************************************************************************
 ***********************************************Modification Log************************************************
<PP20130422>
Last Modified By   :   Priyanka Pillala
Last Modified Date :   22 Apr 2013
Description        :   Created variable to know if the logged in user has Appover Permissions - APAC ROLLOUT1(4.3)
 ***********************************************Modification Log************************************************
<PP20130423>
Last Modified By   :   Priyanka Pillala
Last Modified Date :   23 Apr 2013
Description        :   1)Added logic for USD Rate and Base UoM conversion - APAC ROLLOUT1(4.4)
                        2)Added Pricing_Request__r.Display_Standardized_Rate__c,USD_Rate__c,Base_UoM__c in query
                        - APAC ROLLOUT1(4.5)
                        3)Added template code for End User and FRB
 ****************************************************************************************************************
<PP20130524>
Last Modified By   :   Priyanka Pillala
Last Modified Date :   24 May 2013
Description        :   Added logic for Plus/Minus -- If Plus/Minus code is null, sign of the rate remains the 
                        same as user enters, else sign is in accordance with the Plus/Minus code(4.6)    
 ***********************************************************************************************************************
<BB20130715>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   15 July 2013
Description         :   1)Replaced populateBaseUoM with populateBaseUoMAndAlternateUoM to populate the BaseUoM and
                        AlternateUoM- APAC ROLLOUT2(4.7)
                        2)Added a logic to check if the currency Conversion rate is defined for requested currency 
                       and standardardized currency- APAC ROLLOUT2(4.7)  
 *****************************************************************************************************************
<BR20130702>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   02 July 2013
Description         :   1)added New_Markup_Percentage__c,New_Base_Floor__c,Base_Floor__c,Markup_Percentage__c,Scale_UoM_Scale_Unit__c,Stamp_Floor_Price__c,Stamp_New_Net_Price__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c in the query for email template  (4.8)
                        2)added key_combination_code__c in the wrapperlist string map for template component(4.9) 
 ******************************************************************************************************************
<VR20130717>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   17 July 2013
Description         :   Adding Logic for Creation of Floor and Reference Prices - APAC ROLLOUT2(5.0)
 ******************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(5.1) 
 ***********************************************************************************************************************
<NS20130821>
Last Modified By    :   Neeharika
Last Modified Date  :   21 Aug 2013
Description         :   1)Added 'Landing_Cost__c' fields to queries
 ***********************************************************************************************************************
<PP20131022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2013
Description         :   Removed Pricing_Condition__c from query
 ***********************************************************************************************************************
<PP20131028>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   28 October 2013
Description         :   Made the class 'without sharing' in order to enable BU Admins to delete approval setup records
                                         created by other BU Admins of same role
 *****************************************************************************************************************
<PP20131028>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   28 October 2013
Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
 *****************************************************************************************************************
<PP20131031>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   31 October 2013
Description         :   Commented code to reduce too many SOQL exception - ROLLOUT2
 *****************************************************************************************************************
 **********************************************************************************************************************
<PP20140224>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 February 2014
Description         :   CAPITAL PROJECT - Apply changes section visible in case of Customer Prices
 *****************************************************************************************************************
<PP20140314>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   14 March 2014
Description         :   CAPITAL PROJECT - Net Price information is required on Approver?s email notification 
 ***********************************************************************************************************************
<JM20140509>
Last Modified By    :   Jawahar
Last Modified Date  :   09 April 2014
Description         :   CAPITAL PROJECT -Added NPC_Applicable__c Fields in the all the  Pricing_Request__c query                                         
 **********************************************************************************************************************
<SP20140509>
Last Modified By    :   Shiva
Last Modified Date  :   09 May 2014
Description         :   CAPITAL PROJECT - Payment Terms and Fixed Date 
 **********************************************************************************************************************
<AV20140515>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   15 May 2014
Description         :   CAPITAL PROJECT - Added action methods for save and cancel buttons at time of inline editing of new vol & uom fields and doing UoM validation                                        
 ***********************************************************************************************************************
<TJ20140901>
Last Modified By    :   Tarun Jain
Last Modified Date  :   01 September 2014
Description         :   Default Per, UOM and Currency for Massive change request     
 **********************************************************************************************************************
<TJ20140903>
Last Modified By    :   Tarun Jain
Last Modified Date  :   03 September 2014
Description         :   Massive Volume Change For Massive Requests     
 ***********************************************************************************************************************
<GT20140904> 
Last Modified By    :   George Thomas
Last Modified Date  :   04 September 2014
Description         :   Added logic for mass expire in request item related list
 ***********************************************************************************************************************
<TJ20140908>
Last Modified By    :   Tarun Jain
Last Modified Date  :   08 September 2014
Description         :   Layout of Scale Pricing
 ***********************************************************************************************************************
<HL20140918> 
Last Modified By    :   Hema Latha
Last Modified Date  :   18 September 2014
Description         :   Changed the Sobjecttype to detail for display of details in BU Admin Home page
 ***********************************************************************************************************************
<PR20140925>
Last Modified By    :   Priyanka R
Last Modified Date  :   25 September 2014
Description         :   Added boolean variable for display of Pricing Request Column
 *****************************************************************************************************************
<PP20141024>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 October 2014
Description         :   Fix for Issue #25 from SIT
 ************************************************************************************************************************
 <AA20151110>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 October 2014
Description         :   added to fix issue IS ID-00060646
 ***********************************************************************************************************************
 ************************************************************************************************************************
 <VL20160614>
Last Modified By    :   Vijay Laxmi
Last Modified Date  :   14 June 2016
Description         :   added to fix issue IS ID-00070301
 *********************************************************************************************************************** 
 <PG20160913>
 Last Modified By   :   Priyanci Gupta
 Last Modified Date :   13 September 2016
 Description        :   added to fix issue IS-ID-00072696 Scaling Issue
***********************************************************************************************************************
<NT20190712>
 Last Modified By   :   Neha Talyan
 Last Modified Date :   12 July 2019
 Description        :   change the logic upto 10 material in email template to fix apex CPU time out error for issues 
                        IS ID-00087044(MS), IS ID-00089222(PS), IS ID-00088981(PS)
**********************************************************************************************************************
<PG20191211>
 Last Modified By   :   Piyush Gupta
 Last Modified Date :   11 Dec 2019
 Description        :   Added Customer group 4 as a Business Requirement. IS SC-00089912

**********************************************************************************************************************
<VK20200819>
 Last Modified By   :   Vinay Kumar
 Last Modified Date :   19 Aug 2020
 Description        :   Added three New Columns for BI AP SURFACES as a Business Requirement. IS SC-00094817
**********************************************************************************************************************
<VK20200902>
 Last Modified By   :   Vamsi Krishna
 Last Modified Date :   02 Sep 2020
 Description        :   Added null check to fix error "List has no rows for assignment to SObject" IS EI-00088714
 
**********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added Sales Order Item and Sales Order Item Code in price request item list query - CRM-2022-07-0225
 
 **********************************************************************************************************************
<SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   1 May 2023
 Description        :   Added M&M P80 in price request item list query
 
********************************************************************************************************************** */


//<PP20131028>
public without sharing class PARelatedList
{
  public boolean isNetFloorVisible{get; set;}
  public boolean NewRateColumnDisplay{get; set;}
  private boolean massiveDateFlag;
  public boolean showApproverColumns{get; set;}
  public boolean rateTypeChange {get;set;}
  //
  public boolean selectAllFlag{get;set;}
  //Ver 3.8 START
  //To indicate if a request has scaled Request Item
  public boolean hasScaledRecordFlag {get; set;}
  //Ver 3.8 END
  //<PP20130422> -- Ver 4.3 START
  //To indicate if the logged in user has Approver Permissions
  public boolean hasApproverPermissionFlag {get;set;}
  //<PP20130422> -- Ver 4.3 END
  //<PP20140314>
  public boolean displayActualNPC {get;set;} 
  //Ver 3.2 START
  private String plusMinus;
  //Ver 3.2 END
  //<PP20130423> -- Ver 4.4 START
  private String salesOrg;
  private String distChannel;
  //<PP20130423> -- Ver 4.4 END
  //Type of the incoming sObjectList
  public String sObjectTypeName {get;set;}
  //String to store the Pricing Request Type in case of Pricing Request object and PC-KC in case of Pricing Request Item object
  public String priceType{get;set;}
  //<SP20140508> START
  public boolean isPayTermsApplicableBoolean{get;set;}
  //<SP20140508> END
  //
  public String requestBUSalesArea {get;set;}
  //Ver 2.8 START
  public String currentPageLabel {get;set;}
  //Ver 2.8 END
  public String displayText{get;set;}
  //Ver 3.7 START-Added by sanjib for rejection comments UAT issue 148
  public String rejectionComments{get;set;}
  //Ver 4.2 STARTS
  //String to get the task and project sold to name
  public String PricingRequestIdfortask{get;set;}
  //Ver 4.2 ENDS
  public String ProjectPriceId{get;set;}
  public String rateChange {get;set;}
  public String rateChangeType {get;set;}
  public String qtyChange {get;set;}
  public String rateType {get;set;}
  public List<String> linkList {get;set;} 
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> commonColumns {get;set;}
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> keyCombinationColumns {get;set;}
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> soldToColumns {get;set;}
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> newValueColumns {get;set;}
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> scaleColumns {get;set;}
  //Ver 2.2 START
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> dateColumns {get;set;}
  // Ver 4.3  
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> materialColumns{get;set;}
  //List of FieldSetMembers of the incoming sObjectList
  public List<Schema.FieldSetMember> newDateColumns {get;set;}
  public List<Schema.FieldSetMember> RPQColumns {get;set;}
  public List<Schema.FieldSetMember> RPQApproverColumns {get;set;}
  public Boolean isEndUserRebate{get; set;}
  //Ver 2.2 END
  //List of wrappers to hold the sObjectList along with checkbox
  public List<PAWrapper> wrapperList{get;set;}
  //List of wrappers to hold the sObjectList along with checkbox
  public List<PAWrapper> wrapperList1{get;set;}
  public Pricing_Request_Item__c wrapperPricingReqItem {get;set;}
  //<PP20130423> -- Ver 4.4
  private ERP_Pricing_Condition__c erpPricingCondition;
  private String sourceCluster;
  private String sapClientId;
  private String sapAppId;
  public String Rname{get;set;}
  //<AV20140515>-added boolean to check volume enable at PCKC level
  public boolean isVolumeApplicable{get;set;}
  //<AV20140515>-list of fieldsetmember added to hold volume fields
  public List<Schema.FieldSetMember> volumeColumns {get;set;}

  public boolean errorFlag2{get;set;}
  public boolean selAllFalse{get;set;}
  
    
  //<TJ20140901>
  public static final Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
  //<TJ20140903>
  public Decimal newVol{get;set;}
  public String newVolUom{get;set;}
  public String requestType{get;set;}
  public boolean selectAllVolumeFlag{get;set;}  
  public boolean applyVolChange{get;set;}
  //<TJ20140908>
  public boolean isScalePrice{get;set;}
  public boolean projectPC{get;set;}
  public boolean selectAllScaleFlag{get;set;}
  public List<String> val{get;set;}
  public String val1{get;set;}
  public String val2{get;set;}
  public String val3{get;set;}
  public String val4{get;set;}
  public String val5{get;set;}
  public String val6{get;set;}
  public String val7{get;set;}
  public String val8{get;set;}
  public String val9{get;set;}
  public String val10{get;set;}
  public String scUoM{get;set;}
  public String rate1{get;set;}
  public String rate2{get;set;}
  public String rate3{get;set;}
  public String rate4{get;set;}
  public String rate5{get;set;}
  public String rate6{get;set;}
  public String rate7{get;set;}
  public String rate8{get;set;}
  public String rate9{get;set;}
  public String rate10{get;set;}
  public String scaleCheck{get;set;}  
  public String newUnit{get;set;}
  public String newUoM{get;set;}
  public decimal newPer{get;set;}
  public boolean scaleView{get;set;}
  public String scaleBase1{get;set;}
  public map<ID,List<String>> idQuant{get;set;}
  public map<ID,List<String>> idRate{get;set;}  
  //<TJ20141111>
  public String plusMinus1{get;set;}  
  public String nQTY{get;set;}
  //<HL20140903>
  //public Date systemdate{get;set;}
  //<TJ20141122>
  public String defReqCur{get;set;}
  public boolean displayTmLn{
    get
    { 

      if(ApexPages.currentPage().getUrl().startsWith('/apex/PAExportPrices')){
        displayTmLn=false;
      }  
      else{
        displayTmLn=true;   
      }
      return displayTmLn;
    }        
    set;
  }
  //Added variable for template component to avoid script error
  public String templatePricingRequestId
  {
    get;
    set
    {
      if(value <> NULL)
      { 
        templatePricingRequestId = value;  

        templatePricingRequestId = value;
        boolean isBUAdmin = false;   
        string requestedProfileName = PAUtil.getProfileOfLoggedInUser();
        if(requestedProfileName.equalsIgnoreCase(PAProfilePermissions__c.getInstance('BU Admin').Name__c) || requestedProfileName.equalsIgnoreCase(PAProfilePermissions__c.getInstance('IT Admin').Name__c))
        {
          isBUAdmin = true;
        }
        else
          isBUAdmin = false;
        Pricing_Request__c pricingRequest11 = ((List<Pricing_Request__c>)PAQueryUtil.query('PARequest', 'pricingRequest', ' Id = \''+value+'\''))[0];         
        //<VK20200819> START
        MAP<String,SalesOrgSettings__mdt> NewRateMap = getSalesOrgSettingswithNewrateInUSD(pricingRequest11.Sales_Org_Code__c);
        if(NewRateMap.containsKey(pricingRequest11.Sales_Org_Code__c)){
              NewRateColumnDisplay = (NewRateMap.get(pricingRequest11.Sales_Org_Code__c).NewRateUSDDisplay__c == TRUE) ? True : False;
        }
        //<VK20200819> END
          //<TJ20150703>
        String BU=pricingRequest11.BU__c;
      if(pricingRequest11.BU__c=='DPP LA Resins And Elastomers')
        BU='DPP LA E And R';
      //<AV20152907>-Production Issue-Custom setting name too long error
      else if(pricingRequest11.BU__c=='DPP Global Kalrez & Vespel')
      {
        BU='DPP Global KV';
      }  
      Price_Visibility__c pv = Price_Visibility__c.getInstance(pricingRequest11.SalesArea__c+'#'+BU);
        system.debug('check code 1'+pricingRequest11.SalesArea__c);
        if(pv!=null){

          Set<String> rtypes = new Set<String>();
          rtypes.addAll(pv.Request_Type__c.split('\\;'));
          Set<String> prtypes = new Set<String>();
          prtypes.addAll(pv.Pricing_Request_Type__c.split('\\;'));
          Set<String> approvers = new Set<String>{pricingRequest11.Approver1__c,pricingRequest11.Approver2__c,pricingRequest11.Approver3__c,pricingRequest11.Approver4__c,pricingRequest11.Approver5__c};

          //if(pv!=null && (requestServiceState.ogitems.approverPermissionSetFlag || requestServiceState.ogitems.isBUAdmin) && rtypes.contains(pricingRequest11.Request_Type__c) && prtypes.contains(pricingRequest11.Pricing_Request_Type__c) )
          system.debug('check 2 '+pricingRequest11.Request_Type__c);
          system.debug('check 3 '+pricingRequest11.Pricing_Request_Type__c);
          
          if(pv!=null && rtypes.contains(pricingRequest11.Request_Type__c) && prtypes.contains(pricingRequest11.Pricing_Request_Type__c) ){
            if(approvers.contains(UserInfo.getUserId()) || isBUAdmin)
              isNetFloorVisible = true;
            else
              isNetFloorVisible = false;
          }
          else
            isNetFloorVisible = true;

        }
        else
          isNetFloorVisible = true;              
        //Removed ScaleQuantity1__c to ScaleQuantity10__c from the query-- Shiva ver- 3.8
        // Ver 4.3 added Materials_Below_Net_Reference__c,Materials_Below_Net_Current__c,Total_Materials__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c
        //<PP20130423> -- Ver 4.5
        //Brundha Roll out 2  <BR20130702>
        //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added fields related to Floor and Reference
        //<BB20130726> --Ver 5.1 Added Sales_Type__c in the query
        //<JM20140509> Added NPC_Applicable__c,isVolumeApplicable__c,Volume__c,Volume_UoM__c,isPaymentTermsApplicable__c,Customer_Price_Payment_Terms__c,Fixed_Date_Payment_Terms__c,New_Volume__c,New_Volume_UoM__c,New_Customer_Price_Payment_Terms__c,New_Fixed_Date_Payment_Terms__c,isFloorApplicable__c in the query
        //<MS20140923> Added MG5 fields
        //<HL20150811> added Ship_To_Country_Code__c field to solve production issue for email generation during submition of request
        //<VL20160614> added Variant_Code__c, Variant__c field to solve the issue #IS ID-00070301
        //<PG20191211> added Customer Group 4 field.
        //<SS20220826> Added Sales Order Item and Sales Order Item Code field.
        //<SS20230501> Added M&M P80 fields
        List<Pricing_Request_Item__c> prItems = [SELECT Pricing_Request__r.Customer_Group_4__c,Pricing_Request__r.Customer_Group_4_Code__c,Pricing_Request__r.Display_Standardized_Rate__c,Pricing_Request__r.Standardized_Currency__c,Pricing_Request__r.Standardized_UoM__c,USD_Rate__c,Base_UoM__c,Materials_Below_Net_Reference__c,Materials_Below_Net_Current__c,Total_Materials__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c, Market_Segment_Code__c,Market_Segment__c,
                                                 Ship_To_Country__c,Ship_To_Country_Code__c,F_Product_Hierarchy_Code__c, BU__c,Country_Code__c,Valid_To__c,Valid_From__c,UoM__c,Unit__c,Terms_Of_Payment__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
                                                 Terms_Of_Payment_Code__c,SystemModstamp,Stamp_Reference_Price__c,Stamp_Reference_Net_Price__c,
                                                 Stamp_New_Net_Price__c,Stamp_Floor_Price__c,Stamp_Floor_Net_Price__c,Stamp_Current_Net_Price__c,
                                                 Stamp_Converted_Current_Price__c,Sold_To__c,Sold_To_Code__c,ShipTo__c,ShipTo_Code__c,
                                                 Scaled_Price_Flag__c,ScaleRate9__c,ScaleRate8__c,ScaleRate7__c,ScaleRate6__c,ScaleRate5__c,
                                                 ScaleRate4__c,ScaleRate3__c,ScaleRate2__c,ScaleRate1__c,ScaleRate10__c,Sales_Org__c,
                                                 Sales_Org_Code__c,Sales_Office__c,Sales_Office_Code__c,SAP_Cluster__c,SAP_Client_Id__c,
                                                 SAP_Application_Id__c,Rate__c,Quantity__c,Profit_Center__c,Profit_Center_Code__c,
                                                 Product_Hierarchy__c,Pricing_Request__c,Pricing_Request__r.Request_Type__c,Disc_Ref__c,
                                                 Pricing_Request__r.Spot_Type__c,Pricing_Request__r.Pricing_Request_Type__c,Pricing_Request_Type__c,
                                                 Pricing_Condition__c,Pricing_Condition_Code__c,Price_List_Type__c,Price_List_Type_Code__c,Per__c,
                                                 PH9__c,PH9_Code__c,PH8__c,PH8_Code__c,PH7__c,PH7_Code__c,PH6__c,PH6_Code__c,PH5__c,PH5_Code__c,
                                                 PH4__c, PH4_Code__c,PH3__c,PH3_Code__c,PH2__c,PH2_Code__c,PH1__c,PH1_Code__c,PCKC__c,
                                                 Non_Commercial_Products__c,New__c,New_Valid_To__c,New_Valid_From__c,New_UoM__c,New_Unit__c,
                                                 New_Rate__c,Pricing_Task_UoM__c,New_Per__c,Name,Material__c,Material_Price_Group__c,
                                                 Material_Price_Group_Code__c,Material_Code__c,LastModifiedDate,LastModifiedById,LastActivityDate,
                                                 Key_Combination__c,Key_Combination_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,IsDeleted,Incoterms_Code__c,Incoterms2__c,Inco_terms__c,
                                                 Id,Gap__c,Product_Hierarchy_Code__c,Gap_Pricing_Request_Item__c,Expire__c,End_User__c,
                                                 End_User_Code__c,End_Use__c,End_Use_Code__c,Edit__c,ERP_Sales_Prices_SAP__c,Division__c,
                                                 Division_Code__c,Dist_Channel__c,Dist_Channel_Code__c,Customer_Specific__c,Customer_Price_Group__c,
                                                 Customer_Price_Group_Code__c,Currency__c,CreatedDate,CreatedById,Country__c,Below_Reference_Flag__c,
                                                 Below_Floor_Flag__c,Below_Current_Flag__c,Approver5__c,Approver5_Date__c,Approver4__c,
                                                 Approver4_Date__c,Approver3__c,Approver3_Date__c,Approver2__c,Approver2_Date__c,Check_Scale__c,
                                                 Scale_Type__c,Approver1__c,Approver1_Date__c,Approved_Date__c,Approval_Status__c,
                                                 Gap_Pricing_Request_Item__r.New_Valid_From__c,Gap_Pricing_Request_Item__r.New_Valid_To__c,
                                                 Gap_Pricing_Request_Item__r.New_Rate__c,Gap_Pricing_Request_Item__r.New_Per__c,
                                                 Gap_Pricing_Request_Item__r.New_Unit__c,Gap_Pricing_Request_Item__r.New_UoM__c,
                                                 Gap_Pricing_Request_Item__r.Valid_From__c,Gap_Pricing_Request_Item__r.Valid_To__c,
                                                 Gap_Pricing_Request_Item__r.Rate__c,Gap_Pricing_Request_Item__r.Per__c,
                                                 Gap_Pricing_Request_Item__r.Unit__c,Gap_Pricing_Request_Item__r.UoM__c,Key_Combination_SFDC__c,
                                                 Pricing_Request__r.Request_Valid_From__c,Pricing_Request__r.Request_Valid_To__c,
                                                 Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,
                                                 Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,
                                                 Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,
                                                 ComPartner__c, ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,
                                                 Scale_Quantity_Scale_Value10__c, Materials_Below_Net_Floor__c,Scale_UoM_Scale_Unit__c,isNPCApplicable__c,isVolumeApplicable__c,Volume__c,Volume_UoM__c,
                                                 isPaymentTermsApplicable__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,New_Volume__c,New_Volume_UoM__c,New_Customer_Price_Payment_Terms__c,New_Payment_Terms_Fixed_Date__c,isFloorApplicable__c,Material_Group_5__c,Material_Group_5_Code__c,Project__c,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,
                                                 Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Variant_Code__c, Variant__c,Distributor_Code__c,Distributor_Name__c FROM Pricing_Request_Item__c WHERE
                                                 Pricing_Request__c = :templatePricingRequestId];

        displayActualNPC = false;
        wrapperList1 = new List<PAWrapper>();
        //<MS20140923> Adding query for MG5 check
        if(prItems != null && prItems.size() > 0)
        {

          List<Organizational_Group_Item__c> checkOgItem = [SELECT id,Enable_Material_Group_5__c from Organizational_Group_Item__c where Business__r.Business__c=:prItems[0].BU__c and OrgGroup__r.ERP_Sales_Org_Code__c=:prItems[0].Sales_Org_Code__c];
          //NPC request query -1 row
          List<NPC_Request__c> npcReqList= [Select isSynchronous__c, UoM__c, Unit__c, SystemModstamp, Status__c, Stamp_Reference_Net_Price__c,
                                            Stamp_New_Net_Price__c, Stamp_Floor_Net_Price__c, Stamp_Current_Net_Price__c, Sales_Organization__c,
                                            Sales_Document_Type__c, SAP_Cluster_Id__c, Response_Error_Message__c, Response_Error_Code__c,
                                            Request__c, Quantity__c, Pricing_Request_Item__c, Pricing_Date__c, Per__c, Partner_Code_2__c, 
                                            Partner_Code_1__c, Partner_2__c, Partner1__c, Name, Material__c, Material_Number__c,
                                            LastModifiedDate, LastModifiedById, LastActivityDate, IsDeleted, Id, F_Approval_Status__c,
                                            External_ID__c, Division__c, Distribution_Channel__c, CurrencyIsoCode, CreatedDate, CreatedById,
                                            Count_of_NPC_Responses__c, Count_of_Error_Responses__c, Below_Reference_Flag__c, Below_Floor_Flag__c,
                                            Below_Current_Flag__c From NPC_Request__c WHERE Pricing_Request_Item__c=:prItems AND isSynchronous__c=true and Status__c='Active' ];
          //<PP20140314> START
          //displayActualNPC = false;
          if(npcReqList.size() == 1)
          {
            displayActualNPC = true;
          }
          else
          {
            displayActualNPC = false;
          }
          //<PP20140314> END
          //expecting one row from the above query
          Map<String,NPC_Request__c> npcReDetailsMap= new Map<String,NPC_Request__c>();
          //Populating map<String,NPC_Request__c>
          for(NPC_Request__c npcReq:npcReqList)
          {
            npcReDetailsMap.put(npcReq.Pricing_Request_Item__c,npcReq);
          }

          //wrapperList1 = new List<PAWrapper>();
          Set<String> concatPCKCSet = new Set<String>();
          Map<String,Schema.FieldSet> fieldSetMapPRI = Schema.SObjectType.Pricing_Request_Item__c.fieldSets.getMap();
          List<Schema.FieldSetMember> soldToFields = fieldSetMapPRI.get('PAPricingReqItemSoldToFields').getFields();
          List<Schema.FieldSetMember> columnFields = fieldSetMapPRI.get('PricingRequestItemKCFields').getFields();
          List<Schema.FieldSetMember> CFRcolumnFields = fieldSetMapPRI.get('CurrentFloorReference').getFields();
          // Ver 4.3 added materialcolumnFields
          List<Schema.FieldSetMember> materialcolumnFields = fieldSetMapPRI.get('MaterialComponentFieldSet').getFields();
          //<PP20131024> START
          List<Schema.FieldSetMember> commonFields = fieldSetMapPRI.get('PAPricingReqItemCommonNewFields').getFields();
          List<Schema.FieldSetMember> dateFields = fieldSetMapPRI.get('PAPricingReqItemNewDateFields').getFields();
          //<PP20131024> END
          List<Schema.FieldSetMember> ScaleQuantityRate = fieldSetMapPRI.get('SclaeQuantityScaleRate').getFields();
          sObjectTypeName = SOBJECTTYPE_PRICINGREQUESTITEM;
          Map<String,List<Schema.FieldSetMember>> concatPCKCToFieldSetMap = new Map<String,List<Schema.FieldSetMember>>();
          Map<String,List<PAWrapper>> concatPCKCToWrapperListMap = new Map<String,List<PAWrapper>>();    
          //Updated by Neha Talyan on 12-07-19 for issues IS ID-00087044(MS), IS ID-00089222(PS), IS ID-00088981(PS)              
          for(Integer i = 0 ; i<prItems.size() && i<10 ; i++)
          {
            PAWrapper wrapper = new PAWrapper();
            wrapper.sobjectList.add(prItems[i]);
            wrapper.fieldSetList = new List<Schema.FieldSetMember>();
            wrapper.stringMap= new Map<String,String>();
            //Ver 2.3
            wrapper.stringMap.put('priceType',prItems[i].Pricing_Condition_Code__c+'-'+prItems[i].Pricing_Condition__c+'-'+prItems[i].Key_Combination_SFDC__c);
            //added for enhancement
            //adding into the wrapper
            wrapper.stringMap.put('Unit',' ');
            wrapper.stringMap.put('Per',' ');
            wrapper.stringMap.put('UoM',' ');
            //<AA20151110> added to fix issue IS ID-00060646
            wrapper.stringMap.put('showMG5','false'); 
            //<MS20140923> Start
            //<Monika20141203>Added If Condition to check the list size
            if(checkOgItem.size() > 0)
            {
              if(checkOgItem[0].Enable_Material_Group_5__c == true)
              {
                wrapper.stringMap.put('showMG5','true');
              }
              else
              {
                wrapper.stringMap.put('showMG5','false');
              }
            }
            //<MS20140923> END
            //<Monika20141203> END
            System.debug('*** wrapper.stringMap'+wrapper.stringMap);
            NPC_Request__c npcRequest;
            if(npcReDetailsMap!=null){
              npcRequest=npcReDetailsMap.get(prItems[i].Id);
            }
            if(npcRequest!=null){
              if(npcRequest.Unit__c != null)
                wrapper.stringMap.put('Unit',npcRequest.Unit__c);
              if(npcRequest.Per__c != null)
                wrapper.stringMap.put('Per',npcRequest.Per__c);
              if(npcRequest.UoM__c != null)
                wrapper.stringMap.put('UoM',npcRequest.UoM__c);
            }
            //enhancement end
            wrapperList1.add(wrapper);
            String pckc = prItems[i].Pricing_Condition_Code__c+'-'+prItems[i].Pricing_Condition__c+'-'+prItems[i].Key_Combination__c;
            concatPCKCSet.add(pckc);
            if(concatPCKCToWrapperListMap.containsKey(pckc))
            {
              List<PAWrapper> l1 = concatPCKCToWrapperListMap.get(pckc);
              l1.add(wrapper);
              concatPCKCToWrapperListMap.put(pckc,l1);
            }
            else
            {
              List<PAWrapper> l2 = new List<PAWrapper>();
              l2.add(wrapper);
              concatPCKCToWrapperListMap.put(pckc,l2);
            }                   
            //2.5 ends
          }               
          if(prItems.size()>10)
          {
            displayText='a';
          }
          List<Schema.FieldSetMember> soldto=new List<Schema.FieldSetMember>();
          String pricingrequest;
          if(prItems!=null && prItems.size()!=0)
            pricingrequest=prItems[0].Pricing_Request__r.Request_Type__c;
          for(String s : concatPCKCSet)
          {
            List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
            //Ver 3.5 START
            //added for massive and import for UAT issue 124 ver 3.5
            for(Schema.FieldSetMember sTSet : soldToFields)
            {
              String sTLabel = sTSet.getLabel();
              if((pricingrequest.contains('Massive') || pricingrequest.contains('Import'))
                  && (s.remove(' ').toLowerCase().contains(sTLabel.remove(' ').toLowerCase()) ||s.remove(' ').toLowerCase().contains(sTLabel.replace(' Code','').remove(' ').toLowerCase())))
              {
                kcSet.add(sTSet);

              }
            }
            //Ver 3.5 END      
            for(Schema.FieldSetMember fSet : columnFields)
            {
              System.debug('Columns fields***'+fSet);
              String fLabel = fSet.getLabel();
              String replacedS = s.replace('Material Price Group','');
              //<TJ20150609> START
              String replacedM = s.replace('Material Group 5','');
              String replacedT = s.replace('Material Group 1','');
              //<PP20130423>
              String replacedEU = s.replace('End User','');
              //<PP20131028>
              String replacedSTC = s.replace('Ship-To Country','');
              if(fLabel.contains('Material') && (!fLabel.contains('Price'))  && (replacedS.contains('Material')) && (!fLabel.contains('Group'))  && (replacedM.contains('Material')) && (replacedT.contains('Material')))
              {
                kcSet.add(fSet);
              }
              if(fLabel.contains('Material Price Group') &&(s.contains('Material Price Group')))
              {
                kcSet.add(fSet);
              }
              if(fLabel.contains('Material Group 5 Key') &&(s.contains('Material Group 5 Key')))
              {
                kcSet.add(fSet);
              }
              if(fLabel.contains('Material Group 1') &&(s.contains('Material Group 1')))
              {
                kcSet.add(fSet);
              }
              //<TJ20150609> END
              //<PP20130423> START
              if(fLabel.contains('End User') &&(s.contains('End User')))
              {
                kcSet.add(fSet);                    
              }
              if(fLabel.contains('End Use') && (!fLabel.contains('End User')) && (replacedEU.contains('End Use')))
              {
                kcSet.add(fSet);

              }

//Updated by Kunal Sharma(752081) on 11/24/2015 for IS ID-00060980 Start
              //<MS20140923>START
             /* if(fLabel.contains('End Use') && (!fLabel.contains('End User')) && (replacedEU.contains('End Use')))
              {
                kcSet.add(fSet);

              }*/
              //<MS20140923>END
//Updated by Kunal Sharma(752081) on 11/24/2015 for IS ID-00060980 End

              //<PP20131028> START
              if(fLabel.contains('Ship-To Country') &&(s.contains('Ship-To Country')))
              {
                kcSet.add(fSet);                    
              }
              if(fLabel.contains('Country') && (!fLabel.contains('Ship-To Country')) && (replacedSTC.contains('Country')))
              {
                kcSet.add(fSet);

              }
              if(!fLabel.contains('Material')&& !fLabel.contains('End Use')&& !fLabel.contains('Country') &&(s.remove(' ').toLowerCase().contains(fLabel.remove(' ').toLowerCase()) || s.remove(' ').toLowerCase().contains(fLabel.replace(' Code','').remove(' ').toLowerCase())))
              {
                //<PP20130423> END
                //<PP20131028> END
                kcSet.add(fSet);
              }

             //<KK20200817>
                if(flabel.contains('Distributor Name') && (s.contains('Distributor')))
                {
                kcSet.add(fSet);
                }  
                
              if(fLabel.contains('Product Hierarchy') &&(s.contains('PH')))
              {
                kcSet.add(fSet);
              }
              //<PP20130423> START
              if(fLabel.contains('Profit Center') &&(s.contains('FRB')))
              {
                kcSet.add(fSet);                                
              }
              //<PP20130423> END                    
            }
            //Ver 2.9 ENDS
            //Ver 2.7 ENDS
            //Ver 2.5 STARTS
            for(PAWrapper w : concatPCKCToWrapperListMap.get(s))
            {
              w.fieldSetList.addAll(kcSet);
            }   
          }
          List<Schema.FieldSetMember> CFRkcSet = new List<Schema.FieldSetMember>();
          for(Schema.FieldSetMember fSet1 : CFRcolumnFields)
          {
            CFRkcSet.add(fSet1);
          }
          newDateColumns=CFRkcSet;
          List<Schema.FieldSetMember> commonFieldsSet = new List<Schema.FieldSetMember>();
          for(Schema.FieldSetMember fSet2 : commonFields)
          {
            commonFieldsSet.add(fSet2);
          }
          commonColumns=commonFieldsSet;
          List<Schema.FieldSetMember> DateFieldsSet = new List<Schema.FieldSetMember>();
          for(Schema.FieldSetMember fSet3 : dateFields)
          {
            DateFieldsSet.add(fSet3);
          }
          dateColumns=DateFieldsSet;
          //Ver 3.6 START
          //added for UAT isse 138
          List<Schema.FieldSetMember> scaleRecordsQuantityRate = new List<Schema.FieldSetMember>();
          for(Schema.FieldSetMember fSet3 : ScaleQuantityRate)
          {
            scaleRecordsQuantityRate.add(fSet3);
          }
          scaleColumns=scaleRecordsQuantityRate;
          //Ver 3.6 END
          // Ver 4.3 starts
          List<Schema.FieldSetMember> materialSet= new List<Schema.FieldSetMember>();
          for(Schema.FieldSetMember fSet4 : materialcolumnFields)
          {
            materialSet.add(fSet4);
          }
          materialColumns=materialSet;
          // Ver 4.3ends

        }
      }
    }
  }

  //Ver 1.7 START
  //For Email template
  public String pricingRequestId
  {
    get;
    set
    {
      if(value <> NULL)
      {
        isEndUserRebate = false;
        pricingRequestId = value;
        //Ver 1.2 START
        //<PP20130423>
        Pricing_Request__c massivePR = [SELECT Id,is_End_User_Rebate__c,NPC_Status__c,Pricing_Request_Type__c,Request_Type__c,Request_Valid_From__c,Request_Valid_To__c,Sales_Org_Code__c,Dist_Channel_Code__c,Division_Code__c,BU__c FROM Pricing_Request__c WHERE Id=:value];
        //<PP20130423> -- Ver 4.4 START
        if(massivePR.is_End_User_Rebate__c){
          system.debug('inside setting of pricing req id');
          isEndUserRebate = true;
          if(rateChange==null)
            rateChange= String.valueof(defaultRateChange);
          if(qtyChange==null)
            qtyChange = String.valueof(defaultQty);
        }
        salesOrg =  massivePR.Sales_Org_Code__c;
        distChannel = massivePR.Dist_Channel_Code__c;
        //<VK20200819> START
        MAP<String,SalesOrgSettings__mdt> NewRateMap = getSalesOrgSettingswithNewrateInUSD(salesOrg);
        if(NewRateMap.containsKey(salesOrg)){
              NewRateColumnDisplay = (NewRateMap.get(salesOrg).NewRateUSDDisplay__c == TRUE) ? True : False;
        }
        //<VK20200819> END
        //<PP20130423> -- Ver 4.4 END
        //Ver 1.2 END
        // Ver 4.3 added Materials_Below_Net_Reference__c,Materials_Below_Net_Current__c,Total_Materials__c,Materials_with_Error_Response__c,Net_Price_Calculated_Materials__c
        //<NS20130821> Added Landing_Cost__c field to query select clause
        //<PP20131031> START
        //<PP20131031> END
        //Ver 3.0 START
        //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added Floor and Reference in the OR Condition
        //<PP20140224>
        if(wrapperList != null && wrapperList.size() != 0 && wrapperList[0] != null && wrapperList[0].sobjectRecord != null && wrapperList[0].sobjectRecord.getSObjectType().getDescribe().getName().toLowerCase() == SOBJECTTYPE_PRICINGREQUESTITEM)
        {
          System.debug('****in set massivePR');
          Pricing_Request_Item__c priReqItem = new Pricing_Request_Item__c();
          priReqItem =  (Pricing_Request_Item__c)wrapperList[0].sobjectRecord;


          //<PP20131031>
          if(priReqItem!=null && priReqItem.Condition_Class__c != null && priReqItem.Condition_Class__c == 'Discount or Surcharge')
          {
            rateTypeChange = true;
          }
          else
          {
            rateTypeChange = false;
          }
          //Ver 3.2 START
          if(priReqItem!=null) 
          {
            plusMinus = priReqItem.Plus_Minus_Code__c;
          }
          System.debug('****in set massivePR rateTypeChange'+rateTypeChange);
          //Ver 3.2 END                   
          //Ver 3.0 END
          
          
          
        }   
        //Ver 1.2 START
        if(massivePR!= null && (massivePR.Request_Type__c.equalsIgnoreCase('Massive') || massivePR.Request_Type__c.equalsIgnoreCase('Customer Specific')) &&wrapperPricingReqItem.New_Valid_From__c == null && wrapperPricingReqItem.New_Valid_To__c == null && massiveDateFlag== true)
        {
          wrapperPricingReqItem.New_Valid_From__c = massivePR.Request_Valid_From__c;
          wrapperPricingReqItem.New_Valid_To__c = massivePR.Request_Valid_To__c;
          massiveDateFlag = false;
          System.debug('****in set massivePR massiveDateFlag'+massiveDateFlag);
        }  
        //Ver 1.2 END
      }
    }
  }

  public static String SOBJECTTYPE_PRICINGREQUEST
  {
    get
    {
      return Pricing_Request__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_PRICINGREQUESTITEM
  {
    get
    {
      return Pricing_Request_Item__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_ERPSALESPRICESSAP
  {
    get
    {
      return ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_ORGGROUPITEM
  {
    get
    {
      return Organizational_Group_Item__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_PAORGGROUP
  {
    get
    {
      return OrgGroup__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_PROJECTPRICE
  {
    get
    {
      return Project_Price__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_BUPH
  {
    get
    {
      return BU_PH__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_MATERIAL
  {
    get
    {
      return Material__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static String SOBJECTTYPE_PH
  {
    get
    {
      return Product_Hierarchy__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }
  //<HL20140918> Changed the Sobjecttype to detail for display of details in BU Admin Home page
  public static String SOBJECTTYPE_ADMINMASTER
  {
    get
    {
      return PA_BU_Admin_Detail__c.sObjectType.getDescribe().getName().toLowerCase();
    }
    set;
  }

  public static boolean BOOLEAN_TRUE
  {
    get
    {
      return true;
    }
    set;
  }
  //IM20150206 Added variables for default qty and rate
  public boolean showPRColumn{get;set;}
  public Double defaultRateChange{get; set;}
  public Integer defaultQty{get; set;}
  public PARequest PARequestRecord{get;set;}  
    
  //Constructor
  public PARelatedList()
  {
    wrapperPricingReqItem = new Pricing_Request_Item__c();
    massiveDateFlag = true;
    showApproverColumns = false;
    isNetFloorVisible = true;
    linkList = new List<String>();
    linkList.add('New');
    linkList.add('Edit');
    linkList.add('Del');
    linkList.add('Expire');

    //systemdate = System.now().date();// <HL20140903> Added systemdate to include expire price in Approval Email  
  }
  //Constructor
  public PARelatedList(ctrlPAMain controller)
  {
    
  }

  /*
   * Author      : 
   * Method Name  :   selectUnedited
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method is used to select all the unedited Pricing Request Items on click of 'Select Unedited' button
   */
  public void selectUnedited()
  {
    boolean flag = false;      
    for(PAWrapper wrap : wrapperList)
    {
      if(wrap.sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase() == SOBJECTTYPE_PRICINGREQUESTITEM)
      {

        Pricing_Request_Item__c pri = (Pricing_Request_Item__c)wrap.sObjectRecord;
        if(pri.Pricing_Request_Type__c == 'Project' && pri.New_Unit__c==null)
        {
          wrap.isSelected = true;
          flag = true;
        } 
        //Ver 1.6 START 
        if(pri.Pricing_Request_Type__c != 'Pricing Task' && pri.New_Rate__c==null && pri.New_Valid_From__c==null && pri.New_Valid_To__c==null)
        {
          wrap.isSelected = true;
          flag = true;
        }
        if(pri.Pricing_Request_Type__c == 'Pricing Task' && pri.Quantity__c==null)
        {
          wrap.isSelected = true;
          flag = true;
        }
        //Ver 1.6 END
      }

    }

    if(flag == false)
    {
      ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR,System.Label.No_Unedited_Records_Error);  
      ApexPages.addMessage(errorMsg);

    }
  }

  /*
   * Author      : 
   * Method Name  :   deleteSelected
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   This method is used to delete the selected records
   */
  public Id deleteSelectedId {get;set;}
  public void deleteSelected()
  {
    List<sObject> deleteList = new List<sObject>();
    List<Id> nonGapReqItemIdList = new List<Id>();
    String objListType = wrapperList[0].sObjectRecord.getSObjectType().getDescribe().getName().toLowerCase();
    List<Pricing_Request_Item__c> gapRecordsList = new List<Pricing_Request_Item__c>();

    PAWrapper wrap = null;
    if(deleteSelectedId != null)
    {
      for(Integer i = 0 ; i < wrapperList.size(); i++)
      {
        wrap = wrapperList[i];
        if(wrap.sObjectRecord.Id == deleteSelectedId)
        {
          nonGapReqItemIdList.add(wrap.sObjectRecord.Id);
          deleteList.add(wrapperList.remove(i).sObjectRecord);
          break;
        }
      }
    }
    else
    {
      for(Integer i = 0 ; i < wrapperList.size(); i++)
      {
        wrap = wrapperList[i];
        if(wrap.isSelected == true)
        {
          nonGapReqItemIdList.add(wrap.sObjectRecord.Id);
          deleteList.add(wrapperList.remove(i).sObjectRecord);
          i = i -1;
        }
      }
    }

    if(objListType == SOBJECTTYPE_PRICINGREQUESTITEM)
    {
      gapRecordsList = [SELECT Id FROM Pricing_Request_Item__c WHERE Gap_Pricing_Request_Item__c IN :nonGapReqItemIdList];
    }
    for(Integer m = 0 ; m < gapRecordsList.size(); m++)
    {
      for(Integer k = 0 ; k < wrapperList.size(); k++)
      {
        if(wrapperList[k].sObjectRecord.Id == gapRecordsList[m].Id)
        {
          deleteList.add(wrapperList.remove(k).sObjectRecord);
          k = k-1;
        }
      }
    }
    deleteSelectedId = null;
    if(deleteList.size() == 0)
    {
      ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.Severity.ERROR,System.Label.No_Record_Selected_Error);  
      ApexPages.addMessage(errorMsg);
    }
    if(deleteList.size() != 0 && deleteList != null)
    {
      delete deleteList;
    }   
  }

  /*
   * Author      : 
   * Method Name  :   selectAll
   * Parameters   :   No parameters
   * Return type  :   void
   * Description  :   
   */
   public PageReference selectAll()
   {
     if(selectAllFlag == true)
     {
       system.debug('**###wrapper list size:'+wrapperList.size());
       for(PAWrapper wrap : wrapperList)
       {
         system.debug('wrap.stringMap disablecheckbox is '+wrap.stringMap.containsKey('disableCheckBox'));
         if(wrap.stringMap.containsKey('disableCheckBox') && wrap.stringMap.get('disableCheckBox')=='true')
         {
           wrap.isSelected = false;

         }
         else
         {
           wrap.isSelected = true;
         }       
         system.debug('wrap.isSelected is '+wrap.isSelected);        
       }

     }
     else if(selectAllFlag == false)
     {
       for(PAWrapper wrap : wrapperList)
       {
         wrap.isSelected = false;
         system.debug('wrap.isSelected is '+wrap.isSelected);
       }

     }

     return null;
   }


   //<TJ20140903>
   public PageReference selectAllVolume()
   {
     if(selectAllVolumeFlag == true)
     {
       for(PAWrapper wrap : wrapperList)
       {
         wrap.changeVolume = true;

       }
     }
     else if(selectAllVolumeFlag == false)
     {
       for(PAWrapper wrap : wrapperList)
       {
         wrap.changeVolume = false;
       }
     }
     return null;
   }

   //<TJ20140903>
   public PageReference selectAllScale()
   {
     if(selectAllScaleFlag == true)
     {
       for(PAWrapper wrap : wrapperList)
       {
         wrap.changeScale = true;

       }
     }
     else if(selectAllScaleFlag == false)
     {
       for(PAWrapper wrap : wrapperList)
       {
         wrap.changeScale = false;
       }
     }
     return null;
   }
   //Ver 2.8 START
   /*
    * Author      : 
    * Method Name  :   loadPage
    * Parameters   :   No parameters
    * Return type  :   PageReference
    * Description  :   
    */
   public PageReference loadPage()
   {
     return new PageReference('/apex/'+currentPageLabel );
   }
   //Ver 2.8 END

   /*
    * Author      : 
    * Method Name  :   applyChanges
    * Parameters   :   No parameters
    * Return type  :   void
    * Description  :   This method is used to delete the selected records
    */
   public void applyChanges()
   {
     ApexPages.Message errorMsg2=null;
     try
     {   system.debug('**@@ in apply changes'+wrapperList.size());   
     Decimal newRate; 
     Decimal oldRate; 
     Date newValidFrom;
     Date newValidTo;
     Set<String> pricingRecIdSet = new Set<String>();
     Set<String> pcKCSet = new Set<String>();
     List<Pricing_Request_Item__c> priList = new List<Pricing_Request_Item__c>();
     Set<Pricing_Request_Item__c> selectedPRISet = new Set<Pricing_Request_Item__c>();
     Map<String,Pricing_Request_Item__c> erpToPRIMap = new Map<String,Pricing_Request_Item__c>();
     Map<Id,Sobject> erpIdToERPMap = new Map<Id,Sobject>();
     Map<String,Sobject> erpHolIdToERPMap = new Map<String,Sobject>();
     Set<String> nonUpdatedPRISet = new Set<String>();
     Set<String> nonUpdatedPRIRemoveSet = new Set<String>();
     List<Pricing_Request_Item__c> updatePRIList = new List<Pricing_Request_Item__c>();
     List<Id> updatePRIIdList = new List<Id>();
     List<String> splitBUSalesArea = new List<String>();
     Map<Id,PAWrapper> pricingReqItemToWrapperMap = new Map<Id,PAWrapper>();
     Map<Id,PAWrapper> priToWrapperMap = new Map<Id,PAWrapper>();
     Map<Id,PAWrapper> pricingReqItemSAPToWrapperMap = new Map<Id,PAWrapper>();
     Map<Id,Pricing_Request_Item__c> pricingReqItemIdToInstMap = new Map<Id,Pricing_Request_Item__c>();
     Decimal standardDecimal = 1.1;
     String separator = PAUtil.determineLocaleSeparator();
     String nonLocaleSeparator;
     if(separator == ',')
     {
       nonLocaleSeparator = '.';
     }
     else if(separator == '.')
     {
       nonLocaleSeparator = ',';
     }
     if(requestBUSalesArea != null)
     {
       splitBUSalesArea = requestBUSalesArea.split('-');
     }
     boolean flag = false;
     boolean duplicateCheck = false;
     Map<String,List<Pricing_Request_Item__c>> pckcToReqItemListMap = new Map<String,List<Pricing_Request_Item__c>>(); 
     boolean isScale = false;
         
         system.debug('buorg** '+ splitBUSalesArea);
     Organizational_Group_Item__c buOrgGroup = new Organizational_Group_Item__c();   
     //<MS20150106> Added Base_UoM__c to query
     buOrgGroup = [SELECT Retroactive_Limit__c,OrgGroup__c,Non_Customer_Permanent_Request_Reasons__c,
                   Name,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                   Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Id, ERP_UoM__c,
                   ERP_Pricing_Procedure__c, ERP_Currency__c, Enable_Variable_Config_Materials__c,Default_Per_UoM_Setup__c,
                   Default_SalesArea_Currency__c, Default_SalesArea_UOM__c, Default_Per_Value__c,
                   /*Customer_Permanent_Request_Reasons__c, Customer_Interim_Request_Reasons__c,*/Business__c,Base_UoM__c,
                   Approval_Escalation_Price_Requests__c FROM Organizational_Group_Item__c WHERE Business__c IN 
                   (SELECT Id FROM OrgGroup__c WHERE Business__c = :splitBUSalesArea[0] AND 
                   RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :splitBUSalesArea[1]
                       AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :splitBUSalesArea[2] AND
                       OrgGroup__r.ERP_Division_Code__c = :splitBUSalesArea[3]];

     system.debug('@@##hello ' +buOrgGroup);
     for(PAWrapper wrap1:wrapperList)
     {
       if(wrap1.isSelected == true && (!wrap1.stringMap.containsKey('disableCheckBox') ||(wrap1.stringMap.containsKey('disableCheckBox') && wrap1.stringMap.get('disableCheckBox')=='false')))
       {
         system.debug('**&&##@@checkbox checked');
         flag = true;
         Pricing_Request_Item__c pricReqItem = (Pricing_Request_Item__c)wrap1.sObjectRecord;
         if(pckcToReqItemListMap.containsKey(pricReqItem.PCKC__c))
         {
           List<Pricing_Request_Item__c> l1 = pckcToReqItemListMap.get(pricReqItem.PCKC__c);
           l1.add(pricReqItem);
           pckcToReqItemListMap.put(pricReqItem.PCKC__c,l1);
           duplicateCheck = true;
           break;      
         }
         else
         {
           List<Pricing_Request_Item__c> l1 = new List<Pricing_Request_Item__c>();
           l1.add(pricReqItem);
           pckcToReqItemListMap.put(pricReqItem.PCKC__c,l1);
         }

       }
     }


     for(PAWrapper wrap1:wrapperList)
     {
       if(wrap1.isSelected == true && (!wrap1.stringMap.containsKey('disableCheckBox') ||(wrap1.stringMap.containsKey('disableCheckBox') && wrap1.stringMap.get('disableCheckBox')=='false')))
       {
         system.debug('**##@@checkbox checked');
         flag = true;
         Pricing_Request_Item__c pri = (Pricing_Request_Item__c)wrap1.sObjectRecord;

         if(pri.Scaled_Price_Flag__c)
         {
           isScale = pri.Scaled_Price_Flag__c;
           break;
         }

       }

     }
     system.debug('******* Scale Chk*** '+isScale);
     system.debug('******* rateChange Chk*** '+rateChange);
     system.debug('******* rateType Chk*** '+rateType);

     //Start:-<GT20140904>
     //moved the logic below
     if(rateType == 'Expire')
     {
       //wrapperPricingReqItem.New_Valid_to__c =  wrapperPricingReqItem.New_Valid_from__c.adddays(5);
       if(wrapperPricingReqItem.New_Valid_to__c<system.today())
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please adjust Expire On Date');  
         ApexPages.addMessage(errorMsg2);   
       }
     }
     System.debug('wrapperPricingReqItem.New_Valid_to__c:'+wrapperPricingReqItem.New_Valid_to__c);
     System.debug('wrapperPricingReqItem.New_Valid_from__c:'+wrapperPricingReqItem.New_Valid_from__c);

     //End:-<GT20140904>
     if(flag == false)
     {
       errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
       ApexPages.addMessage(errorMsg2);
     }
     else if(duplicateCheck)
     {
       errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please uncheck duplicate records');  
       ApexPages.addMessage(errorMsg2);                
     }
     //Ver 1.2 START
     else if(wrapperPricingReqItem.New_Valid_from__c == null && wrapperPricingReqItem.New_Valid_to__c == null && rateType!= 'Expire')
     {
       errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_From_Valid_To_Mandatory_Error);  
       ApexPages.addMessage(errorMsg2); 
     }
     //Ver 1.2 END   
     //<TJ20150106> Removed '=' condition
     else if( rateType != 'Expire' && (wrapperPricingReqItem.New_Valid_to__c<wrapperPricingReqItem.New_Valid_from__c
         ||(wrapperPricingReqItem.New_Valid_from__c != null && wrapperPricingReqItem.New_Valid_to__c == null) || (wrapperPricingReqItem.New_Valid_to__c != null && wrapperPricingReqItem.New_Valid_from__c == null)))
     {
       //<TJ20150106> Removed '=' condition
       if(wrapperPricingReqItem.New_Valid_to__c<wrapperPricingReqItem.New_Valid_from__c  && rateType != 'Expire')
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_To_Date_Out_Of_Range_Error);  
         ApexPages.addMessage(errorMsg2);    
       }
       //Start:-<GT20140904>
       //<TJ20150106> Removed '=' condition
       else if(wrapperPricingReqItem.New_Valid_to__c<wrapperPricingReqItem.New_Valid_from__c  && rateType == 'Expire')
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, 'Please adjust Expire On Date');  
         ApexPages.addMessage(errorMsg2);   
       }
       //End:-<GT20140904>
       if(wrapperPricingReqItem.New_Valid_from__c != null && wrapperPricingReqItem.New_Valid_to__c == null && rateType != 'Expire')
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_To_Mandatory_Error);  
         ApexPages.addMessage(errorMsg2);    
       }
       if(wrapperPricingReqItem.New_Valid_to__c != null && wrapperPricingReqItem.New_Valid_from__c == null && rateType != 'Expire')
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_From_Mandatory_Error);  
         ApexPages.addMessage(errorMsg2);    
       }
     }   
     //<PP20140224>   
     else if((splitBUSalesArea[4] == 'Massive' || splitBUSalesArea[4] == 'Customer Specific') && rateType != 'Expire' && wrapperPricingReqItem.New_Valid_from__c != null && wrapperPricingReqItem.New_Valid_To__c != null&&((wrapperPricingReqItem.New_Valid_from__c.daysBetween(System.now().date())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(wrapperPricingReqItem.New_Valid_from__c)>buOrgGroup.Max_Valid_From_Offset_Cust_Spec__c) || ((wrapperPricingReqItem.New_Valid_to__c<System.now().date()) || (wrapperPricingReqItem.New_Valid_from__c.monthsBetween(wrapperPricingReqItem.New_Valid_to__c)>buOrgGroup.Latest_Valid_To_Offset_Cust_Spec__c))))
     {
       if(wrapperPricingReqItem.New_Valid_from__c.daysBetween(System.now().date())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(wrapperPricingReqItem.New_Valid_from__c)>buOrgGroup.Max_Valid_From_Offset_Cust_Spec__c)
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_From_Date_Out_Of_Range_Error);  
         ApexPages.addMessage(errorMsg2);    
       }
       if((wrapperPricingReqItem.New_Valid_to__c<System.now().date()) || (wrapperPricingReqItem.New_Valid_from__c.monthsBetween(wrapperPricingReqItem.New_Valid_to__c)>buOrgGroup.Latest_Valid_To_Offset_Cust_Spec__c))
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_To_Date_Out_Of_Range_Error);  
         ApexPages.addMessage(errorMsg2);    
       }

     }
     //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added Condition for Floor and Reference for Validation
     else if((splitBUSalesArea[4] == 'Non Customer Specific' || splitBUSalesArea[4] == 'Floor' || splitBUSalesArea[4] == 'Reference') && wrapperPricingReqItem.New_Valid_From__c != null && wrapperPricingReqItem.New_Valid_To__c != null&&((wrapperPricingReqItem.New_Valid_from__c.daysBetween(System.now().date())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(wrapperPricingReqItem.New_Valid_from__c)>buOrgGroup.Latest_Valid_From_Offset_Non_Cust_Spec__c) || ((wrapperPricingReqItem.New_Valid_to__c<System.now().date()) || (wrapperPricingReqItem.New_Valid_From__c.monthsBetween(wrapperPricingReqItem.New_Valid_To__c)>buOrgGroup.Latest_Valid_To_Offset_Non_Cust_Spec__c))))
     {
       if(wrapperPricingReqItem.New_Valid_from__c.daysBetween(System.now().date())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(wrapperPricingReqItem.New_Valid_from__c)>buOrgGroup.Latest_Valid_From_Offset_Non_Cust_Spec__c)
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_From_Date_Out_Of_Range_Error);  
         ApexPages.addMessage(errorMsg2);
       }
       if((wrapperPricingReqItem.New_Valid_to__c<System.now().date()) || (wrapperPricingReqItem.New_Valid_From__c.monthsBetween(wrapperPricingReqItem.New_Valid_To__c)>buOrgGroup.Latest_Valid_To_Offset_Non_Cust_Spec__c))
       {
         errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Valid_To_Date_Out_Of_Range_Error);  
         ApexPages.addMessage(errorMsg2);
       }   
     }   
     else if(rateType == '--Select--' && !String.isBlank(rateChange) && isScale == false)
     {
       errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Rate_Change_Mandatory_Error);  
       ApexPages.addMessage(errorMsg2);
     }
     else if((rateType != '--Select--'&&rateType != 'Expire') && (rateChange == null || rateChange == '') && isScale == false)
     {
       errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Rate_Change_Mandatory_Error);  
       ApexPages.addMessage(errorMsg2);
     }
     else
     {
       Map<String,String> tempStorageMap = new Map<String,String>();
       tempStorageMap.put('rateChange',rateChange);
       boolean rateLocaleError = true;

       if(!String.isBlank(rateChange) && (rateChange.contains(',') || rateChange.contains('.')))
       {
         if(!String.isBlank(rateChange) && rateChange.contains(separator) && rateChange.countMatches(separator)==1 && !rateChange.contains(nonLocaleSeparator))
         {
           if(separator == ',')
           {
             rateChange = rateChange.replace(separator,'.');
           }
         }
         else
         {
           errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Invalid_Rate_Change_Error);  
           ApexPages.addMessage(errorMsg2);
           rateLocaleError = false;
         }
       }
       if(rateLocaleError)
       {
         Pricing_Request_Item__c reqItem = (Pricing_Request_Item__c)wrapperList[0].sObjectRecord;
         Decimal rateChangeNum;
         if(!String.isBlank(rateChange))
         {
           //<PP20130524> -- Ver 4.6 START
           rateChangeNum = Decimal.valueOf(rateChange);
           if(!String.isBlank(plusMinus))
           {
             rateChangeNum = rateChangeNum.abs();
           }
           //<PP20130524> -- Ver 4.6 END
         }
         if(rateChangeNum!=null && rateType != 'New Rate' && rateChangeType != null && rateChangeType == '(-)')
         {
           rateChangeNum = (-1) * rateChangeNum;
         }
         //<PP20130524> -- Ver 4.6 -- Changed null to isBlank
         if(rateChangeNum!=null && !String.isBlank(plusMinus) && plusMinus == 'X')
         {
           rateChangeNum = (-1) * rateChangeNum;
         }
         ApexPages.Message myMsg = null;
         //<PP20130423> -- Ver 4.4 START
         Set<String> matCodeSet = new Set<String>();
         Set<String> phSet = new Set<String>();

         if(wrapperList != null && wrapperList.size() > 0 && wrapperList[0].sobjectRecord != null)
         {
           List<ERP_Pricing_Condition__c> erpPCList = new List<ERP_Pricing_Condition__c>();
           erpPCList = [SELECT Id,Pricing_Condition_Code__c,Pricing_Condition__c,Calculation_Type_Code__c,Calculation_Type__c,
                        Condition_Class_Code__c,Condition_Class__c,Plus_Minus__c,Plus_Minus_Code__c,SAP_Cluster__c FROM
                        ERP_Pricing_Condition__c WHERE Pricing_Condition_Code__c = :reqItem.Pricing_Condition_Code__c  AND
                        SAP_Cluster__c = :reqItem.SAP_Cluster__c AND SAP_Client_Id__c = :reqItem.SAP_Client_Id__c AND
                        SAP_Application_Id__c = :reqItem.SAP_Application_Id__c];

           if(erpPCList!=null && erpPCList.size()!=0)
           {
             erpPricingCondition = erpPCList[0];
           }
           if(reqItem.Key_Combination__c != null)
           {
             String replacedKC = reqItem.Key_Combination__c.replace('Material Price Group','');
             if(replacedKC.containsIgnoreCase('Material'))
             {
               for(PAWrapper wrapperVar : wrapperList)
               {
                 if(wrapperVar.isSelected == true && (!wrapperVar.stringMap.containsKey('disableCheckBox') ||(wrapperVar.stringMap.containsKey('disableCheckBox') && wrapperVar.stringMap.get('disableCheckBox')=='false')))
                 {
                   Pricing_Request_Item__c reqItem1 = (Pricing_Request_Item__c)wrapperVar.sObjectRecord;
                   matCodeSet.add(reqItem1.Material_Code__c);
                 }
               }
               //<BB20130715>  --Ver 5.41 Replaced populateBaseUoM with populateBaseUoMAndAlternateUoM
               PAUtil.populateBaseUoMAndAlternateUoM(matCodeSet, salesOrg + ':' +distChannel + ':' +erpPricingCondition.SAP_Cluster__c);
               PAUtil.populateSourceUoMNumDeno(matCodeSet, erpPricingCondition.SAP_Cluster__c);
             }
             else if(replacedKC.containsIgnoreCase('PH'))
             {
               for(PAWrapper wrapperVar : wrapperList)
               {
                 if(wrapperVar.isSelected == true && (!wrapperVar.stringMap.containsKey('disableCheckBox') ||(wrapperVar.stringMap.containsKey('disableCheckBox') && wrapperVar.stringMap.get('disableCheckBox')=='false')))
                 {
                   Pricing_Request_Item__c reqItem1 = (Pricing_Request_Item__c)wrapperVar.sObjectRecord;
                   phSet.add(reqItem1.Product_Hierarchy_Code__c);
                 }
               }
             }
           }
         }
         map<map<String,String>,map<String,Decimal>> defVals=new map<map<String,String>,map<String,Decimal>>();
         defvals=defUoMPer(buorggroup,matcodeset,phset,reqItem);
         set<map<String,String>> key=defvals.keySet();
         map<String,String> phUoM = new map<String,String>();
         for(map<String,String> k: key)
         {
           phUoM=k;
           break;
         }
         system.debug('&&** DEF UOM PER: '+defVals+' '+key+' '+phUoM+' '+defVals.get(phUoM)+' '+matCodeSet+' '+phSet);
         map<String,decimal> phPer=new map<String,decimal>();
         phPer=defVals.get(phUoM);
         //<PP20130423> -- Ver 4.4 END
         for(PAWrapper wrap1:wrapperList)
         {
           if(wrap1.isSelected == true && (!wrap1.stringMap.containsKey('disableCheckBox') ||(wrap1.stringMap.containsKey('disableCheckBox') && wrap1.stringMap.get('disableCheckBox')=='false')))
           {
             //Ver 2.6
             boolean errFlag;             
             if(errorMsg2!=null)
             {
               errFlag = true;
             }
             else
             {
               errFlag = false;
             }
             Pricing_Request_Item__c pri = (Pricing_Request_Item__c)wrap1.sObjectRecord;
             //<VK20200819> START
             Decimal ExchangeRate;
             //<VK20200902> Added null check to fix error "List has no rows for assignment to SObject"
             if(pri.New_Unit__c!=null && pri.New_Unit__c!='%'){
             ExchangeRate = getCurrencyExchangeRate(pri.New_Unit__c);
             }
             MAP<String,SalesOrgSettings__mdt> NewRateMap = getSalesOrgSettingswithNewrateInUSD(pri.Sales_Org_Code__c);
             Decimal VatValue=1.00;
             Decimal ratenew;
            
             if(NewRateMap.containsKey(pri.Sales_Org_Code__c)){
                NewRateColumnDisplay = (NewRateMap.get(pri.Sales_Org_Code__c).NewRateUSDDisplay__c == TRUE) ? True : False;
                VatValue = NewRateMap.get(pri.Sales_Org_Code__c).VAT_Value__c;
             } 
             
             if(pri.Stamp_Floor_Price__c!=null){
                 Decimal x = Decimal.valueOf(pri.Stamp_Floor_Price__c) / (VatValue*ExchangeRate);
                 pri.Floor_Price_in_USD__c = String.Valueof(x.setScale(2, RoundingMode.HALF_UP));
             }
             
             if(pri.Stamp_Reference_Price__c!=null){
                 Decimal y = Decimal.valueOf(pri.Stamp_Reference_Price__c) / (VatValue*ExchangeRate);
                 pri.Ref_Price_in_USD__c = String.Valueof(y.setScale(2, RoundingMode.HALF_UP));
             }
             //<VK20200819> END
             if(isEndUserRebate) pri.Quantity__c = String.valueOf(qtyChange);
             Pricing_Request_Item__c demo1 = pri.clone(false,true);
             pricingReqItemIdToInstMap.put(pri.Id,demo1);
             pri.New__c=true;
             if(pri.Rate__c != null && !String.isblank(pri.Rate__c))
             {
               oldRate = Decimal.ValueOf(pri.Rate__c);
             }
             //<TJ20141120> UAT Issue.
             else
             {
               oldRate = null;
             }             
             //Ver 2.0 START
             if(pri.Scaled_Price_Flag__c == true && !String.isBlank(rateChange))
             {
               errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Rate_Change_Not_Applicable_For_Scale_Records_Error);  
               ApexPages.addMessage(errorMsg2);
               errFlag = false;
             }
             // Ver 2.0 END
             //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added Logic to calculate rate in case of Floor
             else if(rateType == 'New Rate' && !pri.Scaled_Price_Flag__c)
             {
               newRate = rateChangeNum;
               //<VK20200819> START
               if(VatValue!=null && ExchangeRate!=null){
                   Decimal z = newRate/(VatValue*ExchangeRate);
                   pri.Rate_One__c = String.ValueOf(z.setScale(2, RoundingMode.HALF_UP));
               }
               //<VK20200819> END
               pri.New_Rate__c = String.ValueOf(newRate);
                 
               System.debug('String.ValueOf(newRate);'+String.ValueOf(newRate));
               if(rateChange!=null)
                 system.debug('rateChange:'+rateChange+','+pri.New_Rate__c);
               if(rateTypeChange && String.isBlank(rateChange)) 
                 //if(String.isBlank(rateChange))
               {
                 pri.New_Rate__c = pri.Rate__c;
                 
                  
               }
             }
             //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added Logic to calculate rate in case of Floor
             else if(rateType == 'Absolute' && !pri.Scaled_Price_Flag__c)
             {
               if(oldRate != null)
               {
                 newRate =oldRate + rateChangeNum;
                 pri.New_Rate__c = String.ValueOf(newRate);                 
               }                              
             }
             //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added Logic to calculate rate in case of Floor
             else if(rateType == 'Percentage' && !pri.Scaled_Price_Flag__c)
             {
               pri.price_reduction__c = Double.valueof(rateChange);
               if(oldRate != null)
               {
                 newRate =oldRate + (oldRate * (rateChangeNum * 0.01));
                 pri.New_Rate__c = String.valueOf(newRate);
               }
               //Ver 3.2               
             }

             else if(rateType == '--Select--' && pri.New_Rate__c == null)
             {
               pri.New_Rate__c = pri.Rate__c;
             }
             //Start:-<GT20140904>
             else if(rateType == 'Expire' && errorMsg2==null )
             {
               System.debug('errorMsg2:'+errorMsg2);
               if(wrap1.stringMap.get('showExpLink')=='true' )
               {
                 pri.Expire__c=true;
                 pri.New_Rate__c=pri.Rate__c;
                 pri.New_Uom__c=pri.Uom__c;
                 pri.New_Per__c=pri.Per__c;
                 pri.New_Unit__c=pri.Unit__c;
                 System.debug('wrap1.stringMap-'+wrap1.stringMap);
                 wrap1.stringMap.put('showNewLink','false');
                 wrap1.stringMap.put('disableCheckBox','true');
                 pri.New_Valid_From__c = wrapperPricingReqItem.New_Valid_From__c = pri.Valid_From__c;
                 pri.New_Valid_To__c= wrapperPricingReqItem.New_Valid_To__c;
               }
               else
               {
                 errorMsg2 = new ApexPages.Message(ApexPages.Severity.WARNING,'Expiry can be applied only for approved prices');  
                 ApexPages.addMessage(errorMsg2);
                 errFlag = true;
               }
             }
             //End:-<GT20140904>

             if(errFlag == false)
             {
               //<PP20140224>
               //<TJ20141107>
               System.debug('***pri.Unit__c'+pri.Unit__c+'**'+pri.UOM__c+'**'+pri.Per__c+'***'+defReqCur);
               if((pri.UoM__c == null && pri.Per__c == null && pri.Unit__c == null))
               {//<TJ20140901> Added Values for Default Per, UOM and Currency
                 if(buOrgGroup.Default_Per_UoM_Setup__c=='Sales Area Config')
                 {
                   if(pri.New_Unit__c!='%')
                   {
                     if(pri.New_Unit__c==null && defReqCur==null)
                       pri.New_Unit__c = buOrgGroup.Default_SalesArea_Currency__c;
                     else if(pri.New_Unit__c==null)
                       pri.New_Unit__c = defReqCur;
                     if(pri.New_UOM__c==null || pri.New_UOM__c==buOrgGroup.Default_SalesArea_UoM__c)
                       pri.New_UOM__c = buOrgGroup.Default_SalesArea_UoM__c;
                     if(pri.New_Per__c==null || pri.New_Per__c==buOrgGroup.Default_Per_Value__c)
                       pri.New_Per__c = buOrgGroup.Default_Per_Value__c;
                   }
                   else
                   {
                     pri.New_Unit__c = '%';
                   }                   
                 }
                 else if(buOrgGroup.Default_Per_UoM_Setup__c=='Product Hierarchy Config')
                 {
                   if(pri.New_Unit__c!='%'){
                     if(pri.New_Unit__c==null && defReqCur==null)
                       pri.New_Unit__c = buOrgGroup.Default_SalesArea_Currency__c;
                     else if(pri.New_Unit__c==null)
                       pri.New_Unit__c = defReqCur;
                     if(reqItem.Key_Combination__c.containsIgnoreCase('Material'))
                     {
                       if(pri.New_UOM__c==null || pri.New_UOM__c==pHUOM.get(pri.Material_Code__c.toUpperCase()))
                         pri.New_UOM__c = pHUOM.get(pri.Material_Code__c.toUpperCase());
                       if(pri.New_Per__c==null || pri.New_Per__c==pHPer.get(pri.Material_Code__c.toUpperCase()))
                         pri.New_Per__c = pHPer.get(pri.Material_Code__c.toUpperCase());
                     }
                     else if(reqItem.Key_Combination__c.containsIgnoreCase('PH'))
                     {
                       if(pri.New_UOM__c==null || pri.New_UOM__c==pHUOM.get(pri.Product_Hierarchy_Code__c))
                         pri.New_UOM__c = pHUOM.get(pri.Product_Hierarchy_Code__c);
                       if(pri.New_Per__c==null || pri.New_Per__c==pHPer.get(pri.Product_Hierarchy_Code__c))
                         pri.New_Per__c = pHPer.get(pri.Product_Hierarchy_Code__c);
                     }
                   }
                   else
                   {
                     pri.New_Unit__c = '%';
                   }
                 }                
                 //<TJ20140901> END 
               }
               else
               {
                 pri.New_Unit__c = pri.Unit__c;
                 pri.New_UOM__c = pri.Uom__c;
                 pri.New_Per__c = pri.Per__c;
               }
               //<TJ20141107>
               System.debug('***pri.Unit__c'+pri.New_Unit__c+'**'+pri.New_UOM__c+'**'+pri.New_Per__c);

               if(wrapperPricingReqItem.New_Valid_From__c == null && pri.New_Valid_From__c == null)
               {
                 pri.New_Valid_From__c = pri.Valid_From__c;
               }
               else if(wrapperPricingReqItem.New_Valid_From__c != null)
               {
                 pri.New_Valid_From__c = wrapperPricingReqItem.New_Valid_From__c;
               }

               if(wrapperPricingReqItem.New_Valid_To__c == null && pri.New_Valid_To__c == null)
               {
                 pri.New_Valid_To__c = pri.Valid_To__c;
               }
               else if(wrapperPricingReqItem.New_Valid_To__c != null)
               {
                 pri.New_Valid_To__c = wrapperPricingReqItem.New_Valid_To__c;
               }
               pri.New__c = true;
               //Ver 1.5 START
               if(pri.New_Rate__c != null )
               {
                 Decimal roundOfRate;
                 string errorMessage = '';
                 final String LINE_BREAK = '<br/>';
                 //<PP20130423> -- Ver 4.4
                 System.debug('***pri.New_Unit__c'+pri.New_Unit__c+erpPricingCondition);
                 if(erpPricingCondition != null && erpPricingCondition.Calculation_Type__c != null
                     && !String.isBlank(pri.Pricing_Request__r.Standardized_Currency__c)
                     &&(erpPricingCondition.Calculation_Type__c.containsIgnoreCase('Fixed Amount')
                         || erpPricingCondition.Calculation_Type__c.containsIgnoreCase('Quantity')))
                 {
                   //<BB20130715> --Ver 4.7 checking if currency conversion rate is defined
                   if(PAUtil.conversionRateMap.containsKey(pri.New_Unit__c) && PAUtil.conversionRateMap.get(pri.New_Unit__c) != null && PAUtil.conversionRateMap.get(pri.Pricing_Request__r.Standardized_Currency__c) != null)
                   {
                     pri = PAUtil.standardizeRate(pri, erpPricingCondition, salesOrg, distChannel,pri.Pricing_Request__r.Standardized_Currency__c,pri.Pricing_Request__r.Standardized_UoM__c,buOrgGroup.Base_UoM__c);
                   }
                   else
                   {
                     errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Invalid_Currency_Error);  
                     ApexPages.addMessage(errorMsg2);
                     errFlag = false;
                   }
                 }

                 String newRedefinedRate;
                 System.debug('pri.New_Rate__c:-'+pri.New_Rate__c);
                 if(pri.New_Rate__c!='')
                 {
                   if(pri.New_Unit__c != null && pri.New_Unit__c!= '%')
                   {
                     roundOfRate = Decimal.valueOf(pri.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pri.New_Unit__c),System.RoundingMode.HALF_EVEN);
                   }
                   else
                   {
                     roundOfRate = Decimal.valueOf(pri.New_Rate__c).setScale(3,System.RoundingMode.HALF_EVEN);
                   }                                   
                 }
                 if(roundOfRate != null)
                 {
                   newRedefinedRate = String.valueOf(roundOfRate);
                 }                                   
                 pri.New_Rate__c = newRedefinedRate;                                   
               }
               //Ver 1.5 END
               pcKCSet.add(pri.PCKC__c);
               priList.add(pri);
               priToWrapperMap.put(pri.Id,wrap1);
               /*if(pri.ERP_Sales_Prices_SAP__c != null)
                            {
                                pricingRecIdSet.add(pri.ERP_Sales_Prices_SAP__c);
                                pricingReqItemSAPToWrapperMap.put(pri.Id,wrap1);
                            }
                            else
                            {
                                if(pri.NPC_Applicable__c)
                                    pri = clearNPCFields(pri);

                                updatePRIList.add(pri);
                                updatePRIIdList.add(pri.Id);
                                pricingReqItemToWrapperMap.put(pri.Id,wrap1);
                            }*/                           
               erpToPRIMap.put(pri.ERP_Sales_Prices_SAP__c,pri);
             }
             wrap1.isSelected = false;
           }
         }

         // List<ERP_Sales_Prices_SAP__c> parentPriceHolderList = new List<ERP_Sales_Prices_SAP__c>();

         //         Pricing_Request_Item__c reqItem = (Pricing_Request_Item__c)wrapperList[0].sObjectRecord;

         List<Sobject> parentPriceHolList = new List<Sobject>();
        // parentPriceHolList.clear();komathi- added for view state issue check 

         //<VR20130717> Ver 5.0 VR 2013-07-17 APAC Rollout2-Added Condition for Floor and Reference to query from Sales_Prices__c otherwise ERP_Sales_Prices_SAP__c
         if(reqItem!=null && reqItem.Pricing_Request_Type__c!=null && (reqItem.Pricing_Request_Type__c.containsIgnoreCase('Floor') || reqItem.Pricing_Request_Type__c.containsIgnoreCase('Reference')))
         {
           parentPriceHolList = [SELECT Id,Valid_From__c,Valid_To__c,PCKC__c FROM Sales_Prices__c WHERE PCKC__c IN :pcKCSet AND
                                 isPriceHolder__c = true ORDER BY Valid_To__c];
         }
         else
         {
           parentPriceHolList = [SELECT Id,Valid_From__c,Valid_To__c,PCKC__c FROM ERP_Sales_Prices_SAP__c WHERE PCKC__c IN :pcKCSet AND
                                 isPriceHolder__c = true ORDER BY Valid_To__c];
         }
         for(SObject X1 : parentPriceHolList)
         {
           if(!erpHolIdToERPMap.containsKey((String)X1.get('PCKC__c')))
             erpHolIdToERPMap.put((String)X1.get('PCKC__c'), X1);
         }

         for(Pricing_Request_Item__c p : priList)
         {
           if(erpHolIdToERPMap.containsKey(p.PCKC__c))
           {
             SObject e = erpHolIdToERPMap.get(p.PCKC__c);
             //Related to date issue in production-Added +1 in price holder validity check to ensure that rates can be exetended in consecutive dates
             if((p.New_Valid_From__c > (Date)e.get('Valid_To__c')+1 || p.New_Valid_To__c < (Date)e.get('Valid_From__c'))
                 && System.now() <= (Date)e.get('Valid_To__c'))
             {
               nonUpdatedPRISet.add(p.PCKC__c);
               if(!String.isBlank(p.ERP_Sales_Prices_SAP__c))
                 nonUpdatedPRIRemoveSet.add(p.ERP_Sales_Prices_SAP__c);
             }
             else
             {
               if(p.isNPCApplicable__c)
                 p = clearNPCFields(p);
               updatePRIList.add(p);
               updatePRIIdList.add(p.Id);
               pricingReqItemToWrapperMap.put(p.Id,priToWrapperMap.get(p.Id));
             }
           }
           else
           {
             if(p.isNPCApplicable__c)
               p = clearNPCFields(p);
             updatePRIList.add(p);
             updatePRIIdList.add(p.Id);
             pricingReqItemToWrapperMap.put(p.Id,priToWrapperMap.get(p.Id));
           }              
         }

         //Ver 1.3 START

         try
         {
           Map<Id,String> priIdErrorIndMap = new Map<Id,String>();
           if(updatePRIList.size()!=0)
           {
             update updatePRIList;
             makeNPCRequestsInactive(updatePRIIdList);                       

             try
             {
               PAUtil.calculateFloorAndReference(updatePRIList);
             }

             catch(Exception e)
             {

             }
             system.debug('bu_c** '+updatePRIList[0].BU__c);
             //<TJ20150622>
             //<TJ20150702>
             if(updatePRIList[0].BU__c.containsIgnoreCase('DPP Polymers EMEA')|| updatePRIList[0].BU__c.containsIgnoreCase('DPT NA')|| updatePRIList[0].BU__c.containsIgnoreCase('DPP AP')||updatePRIList[0].BU__c.containsIgnoreCase('DPP Polymers NAFTA'))
             {
               try
               {
                 PAUtil.calculateNetFloorAndReference(updatePRIList);
               }

               catch(Exception e)
               {

               }
             }
             List<Pricing_Request_Item__c> upPriList = [SELECT Id,Error_Indicator__c FROM Pricing_Request_Item__c WHERE Id IN
                                                        :updatePRIIdList];

             for(Pricing_Request_Item__c x : upPriList)
             {
               priIdErrorIndMap.put(x.Id,x.Error_Indicator__c);
             }
           }
           System.debug('******priIdErrorIndMap'+priIdErrorIndMap.size());
           if(updatePRIList!=null && updatePRIList.size()>0 && updatePRIList[0].Customer_Specific__c == false)
           {
             //added for updating checkbox and link visibility                   
             for(PAWrapper wrap2:wrapperList)
             {
               if(pricingReqItemToWrapperMap.containsKey(wrap2.sObjectRecord.Id))
               {                               
                 wrap2.stringMap.put('showEditLink','false');
                 wrap2.stringMap.put('showExpLink','false');

                 if(wrap2.sObjectRecord.get('New_Rate__c') != null)
                 {
                   wrap2.stringMap.put('newRateLocale',((String)wrap2.sObjectRecord.get('New_Rate__c')).replace('.',separator));
                 }
                 if(wrap2.sObjectRecord.get('Rate_One__c') != null)
                 {
                   wrap2.stringMap.put('newRateLocale1',((String)wrap2.sObjectRecord.get('Rate_One__c')).replace('.',separator));
                 }
                 //<PP20130423> -- Ver 4.4 START
                 if(wrap2.sObjectRecord.get('USD_Rate__c') != null)
                 {
                   wrap2.stringMap.put('usdRateLocale',((String)wrap2.sObjectRecord.get('USD_Rate__c')).replace('.',separator));
                 }

                 //<PP20130423> -- Ver 4.4 END
               }
             }                       
           }
           else if(updatePRIList!=null && updatePRIList.size()>0 && updatePRIList[0].Customer_Specific__c == true)
           {
             for(PAWrapper wrap2:wrapperList)
             {
               if(pricingReqItemToWrapperMap.containsKey(wrap2.sObjectRecord.Id))
               {
                 if(wrap2.sObjectRecord.get('New_Rate__c') != null)
                 {
                   wrap2.stringMap.put('newRateLocale',((String)wrap2.sObjectRecord.get('New_Rate__c')).replace('.',separator));
                 }
                 if(wrap2.sObjectRecord.get('Rate_One__c') != null)
                 {
                   wrap2.stringMap.put('newRateLocale1',((String)wrap2.sObjectRecord.get('Rate_One__c')).replace('.',separator));
                 }
                 //<PP20130423> -- Ver 4.4 START
                 if(wrap2.sObjectRecord.get('USD_Rate__c') != null)
                 {
                   wrap2.stringMap.put('usdRateLocale',((String)wrap2.sObjectRecord.get('USD_Rate__c')).replace('.',separator));
                 }
                 if(priIdErrorIndMap.containsKey(wrap2.sObjectRecord.Id))
                 {
                   wrap2.sObjectRecord.put('Error_Indicator__c',priIdErrorIndMap.get(wrap2.sObjectRecord.Id));
                 }
                 //<PP20130423> -- Ver 4.4 END                                        
               }
             }
           }

           if(nonUpdatedPRIRemoveSet.size() > 0)
           {
             for(String Z:nonUpdatedPRIRemoveSet)
             {                           
               //Ver 1.4 START
               if(pricingReqItemIdToInstMap.containsKey(Z))
               {
                 erpToPRIMap.get(Z).New_Valid_From__c = pricingReqItemIdToInstMap.get(Z).New_Valid_From__c;
                 erpToPRIMap.get(Z).New_Valid_To__c = pricingReqItemIdToInstMap.get(Z).New_Valid_To__c;
                 erpToPRIMap.get(Z).New_Rate__c = pricingReqItemIdToInstMap.get(Z).New_Rate__c;
                 erpToPRIMap.get(Z).New_Unit__c = pricingReqItemIdToInstMap.get(Z).New_Unit__c;
                 erpToPRIMap.get(Z).New_Per__c = pricingReqItemIdToInstMap.get(Z).New_Per__c;
                 erpToPRIMap.get(Z).New_UoM__c = pricingReqItemIdToInstMap.get(Z).New_UoM__c;
               }
               else
               {
                 erpToPRIMap.get(Z).New_Valid_From__c = null;
                 erpToPRIMap.get(Z).New_Valid_To__c = null;
                 erpToPRIMap.get(Z).New_Rate__c = null;
                 erpToPRIMap.get(Z).New_Unit__c = null;
                 erpToPRIMap.get(Z).New_Per__c = null;
                 erpToPRIMap.get(Z).New_UoM__c = null;
               }
               //Ver 1.4 END
             }
           }

           if(nonUpdatedPRISet.size()!=0)
           {
             errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Validity_Dates_Modification_in_Apply_Changes_Error+' '+nonUpdatedPRISet);  
             ApexPages.addMessage(errorMsg2);
           }
          
         }
         catch(DMLException e)
         {                       
           for(PAWrapper wrap3:wrapperList)
           {
             if(pricingReqItemToWrapperMap.containsKey(wrap3.sObjectRecord.Id))
             {
               //Ver 1.4 START
               Pricing_Request_Item__c q = (Pricing_Request_Item__c)wrap3.sObjectRecord;
               if(pricingReqItemIdToInstMap.containsKey(q.Id))
               { 
                 q.New_Valid_From__c = pricingReqItemIdToInstMap.get(q.Id).New_Valid_From__c;
                 q.New_Valid_To__c = pricingReqItemIdToInstMap.get(q.Id).New_Valid_To__c;
                 q.New_Rate__c = pricingReqItemIdToInstMap.get(q.Id).New_Rate__c;
                 q.New_Unit__c = pricingReqItemIdToInstMap.get(q.Id).New_Unit__c;
                 q.New_Per__c = pricingReqItemIdToInstMap.get(q.Id).New_Per__c;
                 q.New_UoM__c = pricingReqItemIdToInstMap.get(q.Id).New_UoM__c;
               }
               else
               {
                 q.New_Valid_From__c = null;
                 q.New_Valid_To__c = null;
                 q.New_Rate__c = null;
                 q.New_Unit__c = null;
                 q.New_Per__c = null;
                 q.New_UoM__c = null;
               }
               //Ver 1.4 END
             }
           }
         }
         //Ver 1.3 END
       }
       rateChange = tempStorageMap.get('rateChange');
     }
     
        
     }
     catch(Exception e)
     {
       errorMsg2 = new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage());  
       ApexPages.addMessage(errorMsg2);
     }
     if(errorMsg2!=null)
     {
       errorFlag2=true;
     }
     else
     {
       errorFlag2=false;
       selectallflag=false;                    
     }
     system.debug('errormsg: '+errorMsg2+' errorFlag: '+errorFlag2);
   }

   //Ver 3.7 START
   public List<ProcessInstanceHistory> getApprovalSteps()
   {
     Pricing_Request__c  quote = [SELECT Id, (SELECT TargetObjectId, SystemModstamp, StepStatus, RemindersSent, ProcessInstanceId,
         OriginalActorId, IsPending, IsDeleted, Id, CreatedDate, CreatedById, Comments, ActorId FROM
         ProcessSteps WHERE StepStatus='rejected'  order by SystemModstamp desc) FROM Pricing_Request__c
         WHERE Id = :rejectionComments];
     return quote.ProcessSteps;

   }

   //APAC roll out-1
   public List<ProcessInstanceHistory> getApprovalName()
   {
     Pricing_Request__c  quote = [SELECT Id, (SELECT TargetObjectId, SystemModstamp, StepStatus, RemindersSent, ProcessInstanceId,
         OriginalActorId, IsPending, IsDeleted, Id, CreatedDate, CreatedById, Comments, ActorId FROM
         ProcessSteps WHERE StepStatus='rejected'  order by SystemModstamp desc) FROM Pricing_Request__c
         WHERE Id = : Rname];
     return quote.ProcessSteps;

   }



   //Ver 3.7 END

   //Ver 4.0 START
   //Added to get the soldto code in projct task notification uat issue
   public String getTaskComments()
   {
     String s=[SELECT TaskCompletionComment__c FROM Task WHERE WhatId =:PricingRequestIdfortask].TaskCompletionComment__c ;
     return s;
   }
   public String getTaskId()
   {
     String i=[SELECT id FROM Task WHERE WhatId =:PricingRequestIdfortask].id ;
     return i;
   }
   public String getProjectTaskId()
   {
     String i=[SELECT id FROM Task WHERE WhatId =:ProjectPriceId].id ;
     return i;
   }
   //<BR20130702>-ROLLOUT 2 added string b for sold to code
   public String getsoldToNameForCSRNotification()
   {
     String a=[select Project_Id__c from Project_Price__c where id=:ProjectPriceId].Project_Id__c;
     String b=[select Sold_To_Code__c from Project_Price__c where id=:ProjectPriceId].Sold_To_Code__c;
     String soldtoN=[select Sold_To__c from Pricing_Request__c where Project_Id__c =:a].Sold_To__c;
     return b+soldtoN;
   }
   //Ver 4.2 START
   public String getProjectVolume()
   {
     String b=[select Project_Id__c from Pricing_Request__c where id=:ProjectPriceId].Project_Id__c;
     String projectVolumefrProject=[select Project_Volume__c from Project_Price__c where Project_Id__c =:b].Project_Volume__c;
     return projectVolumefrProject;
   }


   //Ver 4.2 END
   //4.0 END

   //Added to get the requestid from project object
   public String getProjectRequestId()
   {

     String b1=[select Project_Id__c from Project_Price__c where id=:ProjectPriceId].Project_Id__c;
     String b=[select Name from Pricing_Request__c where Project_Id__c=:b1].Name;
     return b;

   }
   // <SP20140509> START
   public boolean isFixedDateApplicable 
   {
     get
     {
       if(isFixedDateApplicable == null) 
       {  
         isFixedDateApplicable = false;
       }
       return isFixedDateApplicable;
     }
     set
     {
       isFixedDateApplicable = value;
     }
   }
   private set<String> payTermsSet = new set<String>();
   private set<String> payTermsFixedDateSet = new set<String>();

   private set<String> getpaymentTermsList()
   {
     if(isPayTermsApplicableBoolean)
     {
       list<String> payTermsList = new list<String>();
       list<String> payTermsFixedDateList = new list<String>();

       list<String> splitBUSalesArea = new list<String>();

       if(requestBUSalesArea != null)
       {
         splitBUSalesArea = requestBUSalesArea.split('-');
       }

       Organizational_Group_Item__c buOrgGroup = new Organizational_Group_Item__c();   
       buOrgGroup = [SELECT Retroactive_Limit__c,OrgGroup__c,Non_Customer_Permanent_Request_Reasons__c,
                     Name,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                     Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Id, ERP_UoM__c,
                     ERP_Pricing_Procedure__c, ERP_Currency__c,Business__c, /*Approval Escalation - Pricing Requests,*/
                     Customer_Price_Payment_Terms__c,Customer_Price_Fixed_Date_Payment_Terms__c 
                     FROM Organizational_Group_Item__c WHERE Business__c IN 
                     (SELECT Id FROM OrgGroup__c WHERE Business__c = :splitBUSalesArea[0] AND 
                     RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :splitBUSalesArea[1]
                         AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :splitBUSalesArea[2] AND
                         OrgGroup__r.ERP_Division_Code__c = :splitBUSalesArea[3]];

       if(buOrgGroup!=null && buOrgGroup.Customer_Price_Payment_Terms__c!=null)
       {
         payTermsList = buOrgGroup.Customer_Price_Payment_Terms__c.split(';');
         payTermsSet.addall(payTermsList);
       }

       if(buOrgGroup!=null && buOrgGroup.Customer_Price_Fixed_Date_Payment_Terms__c!=null)
       {
         payTermsFixedDateList = buOrgGroup.Customer_Price_Fixed_Date_Payment_Terms__c.split(';');
         payTermsFixedDateSet.addall(payTermsFixedDateList);
       }

       list<string> localPaytermsList = new list<string>();
       localPaytermsList.addall(payTermsSet);

       if(localPaytermsList.size() == 1)
       {
         if(payTermsFixedDateSet.contains(localPaytermsList[0]))
         {
           isFixedDateApplicable = true;
         }
       }
     }
     return payTermsFixedDateSet;
   }

   public void enableFixedDateMethod()
   {
     system.debug('*&*&*  selected PT *'+wrapperPricingReqItem.New_Customer_Price_Payment_Terms__c);
     system.debug('payTermsFixedDateSet&&&*'+payTermsFixedDateSet);     
     isPayTermsApplicableBoolean = true;
     getpaymentTermsList();     
     if(payTermsFixedDateSet.contains(wrapperPricingReqItem.New_Customer_Price_Payment_Terms__c))
     {
       isFixedDateApplicable = true;
     }
     else
     {
       isFixedDateApplicable = false;
     }
     system.debug('*&*&*  isFixedDateApplicable ***'+isFixedDateApplicable);

   }
   public void applyChangesPaymentTerms()
   {
     system.debug('*&*&*  newPaytermsSelected ***'+wrapperPricingReqItem.New_Customer_Price_Payment_Terms__c);
     system.debug('*&*&*  NewFixedDate ***'+wrapperPricingReqItem.New_Payment_Terms_Fixed_Date__c);
     system.debug('*&*&*  isFixedDateApplicable ***'+isFixedDateApplicable);
     Boolean flag = false;
     Boolean errorFlag = false;
     List<Pricing_Request_Item__c> updatePRIList = new List<Pricing_Request_Item__c>(); 

     try
     {
       for(PAWrapper wrap1:wrapperList)
       {
         if(wrap1.isSelected == true)
         {
           flag = true;
         }
       }
       if(flag == false)
       {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
         ApexPages.addMessage(myMsg);
         errorFlag = true;
       }
       if(wrapperPricingReqItem.New_Payment_Terms_Fixed_Date__c < system.today())
       {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Fixed_Date_Past_Error);  
         ApexPages.addMessage(myMsg);
         errorFlag = true;
       }
       if(isFixedDateApplicable && wrapperPricingReqItem.New_Payment_Terms_Fixed_Date__c == null)
       {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.Fixed_Date_Payment_Terms_Mandatory);  
         ApexPages.addMessage(myMsg);
         errorFlag = true;
       }

       if(!errorFlag)
       {
         for(PAWrapper wrap1:wrapperList)
         {
           if(wrap1.isSelected == true)
           {
             Pricing_Request_Item__c pri = (Pricing_Request_Item__c)wrap1.sObjectRecord;
             pri.New_Customer_Price_Payment_Terms__c = wrapperPricingReqItem.New_Customer_Price_Payment_Terms__c;

             if(payTermsFixedDateSet.contains(wrapperPricingReqItem.New_Customer_Price_Payment_Terms__c))
             {
               pri.New_Payment_Terms_Fixed_Date__c = wrapperPricingReqItem.New_Payment_Terms_Fixed_Date__c;    
             }
             else 
             {
               pri.New_Payment_Terms_Fixed_Date__c = null;
             }
             wrap1.isSelected = false;

             updatePRIList.add(pri);
           }
         }
         update updatePRIList;
       }
     }
     catch(exception e)
     {
       system.debug('*&*&*  Exception e ***'+e);
     }
   }

   // <SP20140509> END
   //<AV20140515>-START-added action methods for save and cancel buttons at time of inline editing of new vol & uom fields and doing UoM validation
   public pageReference cancelInLineVolChanges()
   {
     return null;
   }
   public pageReference saveInLineVolChanges()
   {
     system.debug('****@@@@in save method of inline');
     List<Pricing_Request_Item__c> updateReqItemList = new List<Pricing_Request_Item__c>();
     list<String> splitBUSalesArea = new list<String>();
     //list<SelectOptions> allUomValues = new list<SelectOptions>();
     boolean UoMmatchFlag=false;
     String errormsg;
     if(requestBUSalesArea != null)
     {
       splitBUSalesArea = requestBUSalesArea.split('-');
     }
     Organizational_Group_Item__c buOrgGroup = new Organizational_Group_Item__c();   
     buOrgGroup = [SELECT Retroactive_Limit__c,OrgGroup__c,Non_Customer_Permanent_Request_Reasons__c,
                   Name,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                   Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Id, ERP_UoM__c,
                   ERP_Pricing_Procedure__c, ERP_Currency__c,Business__c, /*Approval Escalation - Pricing Requests,*/
                   Customer_Price_Payment_Terms__c,Customer_Price_Fixed_Date_Payment_Terms__c 
                   FROM Organizational_Group_Item__c WHERE Business__c IN 
                   (SELECT Id FROM OrgGroup__c WHERE Business__c = :splitBUSalesArea[0] AND 
                   RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :splitBUSalesArea[1]
                       AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :splitBUSalesArea[2] AND
                       OrgGroup__r.ERP_Division_Code__c = :splitBUSalesArea[3]];
     //<TJ20140903> Added Condition for Massive Volume Change
     try
     {
       for(PAWrapper wrap:wrapperList)
       {
         Pricing_Request_Item__c pri = (Pricing_Request_Item__c)wrap.sObjectRecord;
         if(wrap.changeVolume==true)
         {
           pri.New_Volume__c=newVol;
           pri.New_Volume_UoM__c=newVolUOM;
           system.debug('&&** '+pri.New_Volume_UoM__c+' '+newVolUOM);           
         }
         if(pri.New_Volume_UoM__c != null && buOrgGroup.ERP_UoM__c != null
             && buOrgGroup.ERP_UoM__c.contains(pri.New_Volume_UoM__c.toUpperCase()))
         {
           system.debug('Uom flag before:'+UoMmatchFlag);
           system.debug('**@@Uom match'+pri.New_Volume_UoM__c.toUpperCase());
           pri.New_Volume_UoM__c = pri.New_Volume_UoM__c.toUpperCase();
           pri = clearNPCFields(pri);
           UoMmatchFlag = true;
           system.debug('Uom flag after:'+UoMmatchFlag);
         }
         if(String.isBlank(pri.New_Volume_UoM__c))
         {
           UoMmatchFlag = true;
         }

         if(pri.New_Volume_UoM__c != null && UoMmatchFlag == false)
         {
           system.debug('**@@Uom not match error');
           errormsg = 'UoM is not valid';
           ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.UoM_not_valid_error); 
           ApexPages.addMessage(myMsg);
         }
         //<AV20140515>-START-added validation for New volume not to be blank and zero

         if(pri.New_Volume__c==null||pri.New_Volume__c==0)
         {
           System.debug('New Volume is blank----'+pri.New_Volume__c);                   
           errormsg = 'Volume is not valid';
           ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter value for mandatory field "Volume"'); 
           ApexPages.addMessage(myMsg);
         }
         if(pri.New_Volume__c<0)
         {
           System.debug('New Volume is less than 0----'+pri.New_Volume__c);                   
           errormsg = 'Volume is not valid';                   
           ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter valid value for field "Volume"'); 
           ApexPages.addMessage(myMsg);
         } 

         //<AV20140515>-END
         UoMmatchFlag = false;
         updateReqItemList.add(pri);
       }
       if(errormsg==null)
       {
         update updateReqItemList;
         system.debug('****@@@@updated list:'+updateReqItemList.size()+','+updateReqItemList);
       }
     }
     catch(exception e)
     {
       system.debug('*&*&*  Exception e ***'+e);
     }
     return null;

   }
   //<AV20140515>-END
   public pageReference saveInLineVolChangesMassive()
   {
     boolean flag=false;
     for(PAWrapper wrap:wrapperList)
     {
       if(wrap.changeVolume==true)
       {
         flag=true;
         break;
       }
     }
     if(flag)
     {
       saveInLineVolChanges();
     }
     else
     {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'No Records Selected'); 
       ApexPages.addMessage(myMsg);
     }
     return null;  
   }
   //<PP20140626>
   private Pricing_Request_Item__c clearNPCFields(Pricing_Request_Item__c prItem)
   {
     prItem.Total_Materials__c = null;
     prItem.Stamp_Current_Net_Price__c = null;
     prItem.Stamp_Floor_Net_Price__c = null;
     prItem.Stamp_New_Net_Price__c = null;
     prItem.Stamp_Reference_Net_Price__c = null;
     prItem.Net_Price_Status__c = null;
     return prItem;
   }
   private void makeNPCRequestsInactive(List<Id> prItemList)
   {
     List<NPC_Request__c> alreadyExistingNPCReqList = [SELECT Id, Status__c FROM NPC_Request__c WHERE Pricing_Request_Item__c IN
                                                       :prItemList AND Status__c = 'Active'];
     for(NPC_Request__c n : alreadyExistingNPCReqList)
     {
       n.Status__c = 'Inactive';
     }
     if(alreadyExistingNPCReqList != null && alreadyExistingNPCReqList.size() != 0)
     {
       update alreadyExistingNPCReqList;
     }
   }
   //<TJ20140908>
   public void saveScale()
   {
     String highestQuantity;
     Map<String,String> mapofScaleQuantityAndRates=new Map<String,String>();    
     List<Pricing_Request_Item__c> updateReqItem = new List<Pricing_Request_Item__c>();
     //<PP20141024> - Fix for #25 SIT
     String errorMessage = '';
     String separator = PAUtil.determineLocaleSeparator();
     String nonLocaleSeparator;
     Decimal standardDecimal = 1.1;
     boolean flag=false;
     list<String> splitBUSalesArea = new List<String>();    
     set<String> matCodeSet=new set<String>();
     set<String> phSet=new set<String>();
     if(separator == ',')
     {
       nonLocaleSeparator = '.';
     }
     else if(separator == '.')
     {
       nonLocaleSeparator = ',';
     }    
     if(requestBUSalesArea != null)
     {
       splitBUSalesArea = requestBUSalesArea.split('-');
     }
     Organizational_Group_Item__c buOrgGroup = new Organizational_Group_Item__c();   
     buOrgGroup = [SELECT ERP_UoM__c, ERP_Pricing_Procedure__c, ERP_Currency__c, Enable_Variable_Config_Materials__c,Default_Per_UoM_Setup__c,
                   Default_SalesArea_Currency__c, Default_SalesArea_UOM__c, Default_Per_Value__c,
                   Business__c FROM Organizational_Group_Item__c WHERE Business__c IN 
                   (SELECT Id FROM OrgGroup__c WHERE Business__c = :splitBUSalesArea[0] AND 
                   RecordType.Name = 'Business') AND OrgGroup__r.ERP_Sales_Org_Code__c = :splitBUSalesArea[1]
                       AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :splitBUSalesArea[2] AND
                       OrgGroup__r.ERP_Division_Code__c = :splitBUSalesArea[3]];
     Pricing_Request_Item__c reqItem = (Pricing_Request_Item__c)wrapperList[0].sObjectRecord;
     ERP_Pricing_Condition__c pc = [SELECT Scale_Base__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c FROM ERP_Pricing_Condition__c where Pricing_Condition_Code__c=:reqItem.Pricing_Condition_Code__c AND SAP_Cluster__c=:reqItem.SAP_Cluster__c AND SAP_Client_Id__c=:reqItem.SAP_Client_Id__c AND SAP_Application_Id__c=:reqItem.SAP_Application_Id__c limit 1];      
     if(reqItem.Key_Combination__c != null)
     {
       String replacedKC = reqItem.Key_Combination__c.replace('Material Price Group','');
       if(replacedKC.containsIgnoreCase('Material'))
       {
         for(PAWrapper wrapperVar : wrapperList)
         {
           if(wrapperVar.changeScale == true)
           {
             Pricing_Request_Item__c reqItem1 = (Pricing_Request_Item__c)wrapperVar.sObjectRecord;
             matCodeSet.add(reqItem1.Material_Code__c);
           }
         }         
       }
       else if(replacedKC.containsIgnoreCase('PH'))
       {
         for(PAWrapper wrapperVar : wrapperList)
         {
           if(wrapperVar.changeScale == true )
           {
             Pricing_Request_Item__c reqItem1 = (Pricing_Request_Item__c)wrapperVar.sObjectRecord;
             phSet.add(reqItem1.Product_Hierarchy_Code__c);
           }
         }
       }
     }
     map<map<String,String>,map<String,Decimal>> defVals=new map<map<String,String>,map<String,Decimal>>();
     defvals=defUoMPer(buorggroup,matcodeset,phset,reqItem);
     set<map<String,String>> key=defvals.keySet();
     map<String,String> phUoM = new map<String,String>();
     for(map<String,String> k: key)
     {
       phUoM=k;
       break;
     }
     system.debug('&&** DEF UOM PER: '+defVals+' '+key+' '+phUoM+' '+defVals.get(phUoM)+' '+matCodeSet+' '+phSet);
     map<String,decimal> phPer=new map<String,decimal>();
     phPer=defVals.get(phUoM);
     list<String> vals=new list<String>{val1,val2,val3,val4,val5,val6,val7,val8,val9,val10};
     list<String> ratesBeforeUpdate=new list<String>{rate1,rate2,rate3,rate4,rate5,rate6,rate7,rate8,rate9,rate10};
     list<String> rates=new list<String>();     
     //<TJ20141111>
     if(plusMinus1=='Negative')
     {
       rates=new List<String>();
       for(String rate:ratesBeforeUpdate)
       {
         if(!string.isblank(rate))
         {
           decimal rateVal;
           rateVal=decimal.valueOf(rate);
           rateVal=(-1)*rateVal;           
           rate=String.valueOf(rateVal);                                 
         }
         rates.add(rate);
       }
     }
     else
       rates=ratesBeforeUpdate;
     system.debug(rates);
     try
     {
       for(PAWrapper wrap:wrapperList)
       {
         if(wrap.changeScale==true)
         {
           flag=true;
           break;
         }
       }
       if(flag==true)
       {
         for(PAWrapper wrap:wrapperList)
         {
           mapofScaleQuantityAndRates = new map<String,String>();
           Pricing_Request_Item__c pricingReqItem = (Pricing_Request_Item__c)wrap.sObjectRecord;
            System.debug('validatioin&&&'+pricingReqItem);
           system.debug(wrap.quantity);
           if(wrap.changeScale==true)
           {
             if(rateType.containsIgnoreCase('Select'))
             {
               errorMessage='Please Select Rate Change Type';
             }
             if(pricingReqItem.Scaled_Price_Flag__c == true)
             { 
              
               decimal rate,change,val,valChange;
               boolean errflg=false;
               for(String value:vals)
               {                 
                 if(!String.isBlank(value) && !value.replace('-','').isNumeric())
                 {
                   errorMessage+=System.Label.Invalid_Scale_Quantity_Error;
                   errflg=true;
                 }
               }
               if(errflg==false)  
               {
                 if(rateType=='New Rate')
                 {
                   integer x=1,y=1;
                   for(String value:vals)
                   {
                     if(!string.ISBlank(value) && value!='X' && value!='x')
                     {
                       val=decimal.valueof(value.trim());
                       pricingReqItem.put('Scale_Quantity_Scale_Value'+x+'__c',String.valueOf(val));                       
                     }
                     else
                     {
                       for(integer z=x;z<=10;z++)
                         pricingReqItem.put('Scale_Quantity_Scale_Value'+z+'__c',null);                         
                       break;
                     }
                     x=x+1;
                   }                 
                   for(String rat: rates)
                   {
                     if(rat!='X' && y<x && !string.ISBlank(rat) && rat!='x')
                     {                       
                       rate=decimal.valueof(rat.trim());
                       pricingReqItem.put('ScaleRate'+y+'__c',String.valueOf(rate));
                       system.debug('**&&'+rat+' '+y+' '+pricingReqItem.get('ScaleRate'+y+'__c'));
                       mapofScaleQuantityAndRates.put((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+y+'__c'),(String)pricingReqItem.get('ScaleRate'+y+'__c'));
                     }
                     else
                     {
                       for(integer z=y;z<=10;z++)
                       {
                         pricingReqItem.put('Scale_Quantity_Scale_Value'+z+'__c',null);
                         pricingReqItem.put('ScaleRate'+z+'__c',null);
                       }
                       break;
                     }
                     y=y+1;
                   }
                   system.debug('**&&'+x+' '+y);                                                      
                 }
                 else if(rateType == 'Absolute' && !string.ISBlank(pricingReqItem.Rate__c) && !string.ISBlank(wrap.quantity))
                 {
                   integer x=1,y=1;
                   for(String value:vals)
                   {
                     if(value!='X' && (!String.isBlank(wrap.stringMap.get('Scale_Quantity'+x+'_SAP'))||wrap.stringMap.get('Scale_Quantity'+x+'_SAP')!='') && !string.ISBlank(value) && value!='x')
                     {
                       pricingReqItem.put('Scale_Quantity_Scale_Value'+x+'__c',String.valueOf(value));                       
                     }
                     else
                     {
                       for(integer z=x;z<=10;z++)
                         pricingReqItem.put('Scale_Quantity_Scale_Value'+z+'__c',null);
                       break;
                     }
                     x=x+1;
                   }                 
                   for(String rat: rates)
                   {
                     if(rat!='X' && y<=x && (!String.isBlank(wrap.stringMap.get('Scale_Rate'+y+'_SAP'))||wrap.stringMap.get('Scale_Rate'+y+'_SAP')!='') && !string.ISBlank(rat) && rat!='x')
                     {                       
                       rate=decimal.valueof(wrap.stringMap.get('Scale_Rate'+y+'_SAP'));
                       rate=rate + Decimal.valueOf(rat);
                       pricingReqItem.put('ScaleRate'+y+'__c',String.valueOf((rate)));
                       system.debug('**&&'+rat+' '+y+' '+pricingReqItem.get('ScaleRate'+y+'__c'));
                       mapofScaleQuantityAndRates.put((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+y+'__c'),(String)pricingReqItem.get('ScaleRate'+y+'__c'));
                     }
                     else
                     {
                       for(integer z=y;z<=10;z++)
                       {
                         pricingReqItem.put('Scale_Quantity_Scale_Value'+z+'__c',null);
                         pricingReqItem.put('ScaleRate'+z+'__c',null);
                       }
                       break;
                     }
                     y=y+1;
                   }
                 }                   
                 else if(rateType == 'Percentage' && !string.ISBlank(pricingReqItem.Rate__c) && !string.ISBlank(wrap.quantity))
                 {
                   integer x=1,y=1;
                   for(String value:vals)
                   {
                     if(value!='X' && (!String.isBlank(wrap.stringMap.get('Scale_Quantity'+x+'_SAP'))||wrap.stringMap.get('Scale_Quantity'+x+'_SAP')!='') && !string.ISBlank(value) && value!='x')
                     {
                       pricingReqItem.put('Scale_Quantity_Scale_Value'+x+'__c',String.valueOf(value));                       
                     }
                     else
                     {
                       for(integer z=x;z<=10;z++)
                         pricingReqItem.put('Scale_Quantity_Scale_Value'+z+'__c',null);
                       break;
                     }
                     x=x+1;
                   }                 
                   for(String rat: rates)
                   {
                     if(rat!='X' && y<=x && (!String.isBlank(wrap.stringMap.get('Scale_Rate'+y+'_SAP'))||wrap.stringMap.get('Scale_Rate'+y+'_SAP')!='') && !string.ISBlank(rat) && rat!='x')
                     {                       
                       rate=decimal.valueof(wrap.stringMap.get('Scale_Rate'+y+'_SAP'));
                       change=decimal.valueof(rat);
                       rate =rate + (rate * (change * 0.01));
                       pricingReqItem.put('ScaleRate'+y+'__c',String.valueOf(rate));
                       system.debug('**&&'+rat+' '+y+' '+pricingReqItem.get('ScaleRate'+y+'__c'));
                       mapofScaleQuantityAndRates.put((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+y+'__c'),(String)pricingReqItem.get('ScaleRate'+y+'__c'));
                     }
                     else
                     {
                       for(integer z=x;z<=10;z++)
                       {
                         pricingReqItem.put('Scale_Quantity_Scale_Value'+z+'__c',null);
                         pricingReqItem.put('ScaleRate'+z+'__c',null);
                       }
                       break;
                     }
                     y=y+1;
                   }
                 }                  
                 List<Decimal> scaleList;
                 List<Decimal> scaleQuantityValueList = new List<Decimal>();
                 for(integer i=1;i<=10;i++)
                 {                 
                   if((!String.isBlank((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+i+'__c'))) && Decimal.ValueOf((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+i+'__c'))<0)
                   {
                     errorMessage+=System.Label.Quantity_Cannot_Be_Negative_Error;
                     break;          
                   }                
                   if(!String.isBlank((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+i+'__c')))
                     scaleQuantityValueList.add(Decimal.valueOf((String)pricingReqItem.get('Scale_Quantity_Scale_Value'+i+'__c')));
                   else
                     scaleQuantityValueList.add(0);
                 }
                 boolean qFlag = false;
                 for(Integer i=0; i<scaleQuantityValueList.size()-1; i++)
                 {
                   if( ((i == 0 && scaleQuantityValueList[i]==null) || (i != 0 && (scaleQuantityValueList[i]==null || scaleQuantityValueList[i]==0))) && (scaleQuantityValueList[i+1]!=null && scaleQuantityValueList[i+1]!=0) && !(((i == 0 && scaleQuantityValueList[i]==null) || (i != 0 && (scaleQuantityValueList[i]==null || scaleQuantityValueList[i]==0)))&& (scaleQuantityValueList[i+1]==null || scaleQuantityValueList[i+1]==0)))
                   {
                     System.debug('***scaleList--->'+scaleQuantityValueList[i]+scaleQuantityValueList[i+1]);
                     qFlag = true;
                     break;
                   }
                 }
                 if(qFlag==true)
                 {
                   errorMessage+=System.Label.Sequential_Quantity_Error;
                   break;        
                 }
                 //Ascending Quantity logic
                 System.debug('****scaleQuantityValueList'+scaleQuantityValueList);
                 for(Integer j=1; j<scaleQuantityValueList.size(); j++)
                 {
                   if(scaleQuantityValueList[j] == 0 || scaleQuantityValueList[j] == null)
                   {
                     scaleQuantityValueList.remove(j);
                     j--;
                   }
                 }
                 System.debug('****scaleQuantityValueList'+scaleQuantityValueList);
                 List<Decimal> l1 = new List<Decimal>();
                 l1.addAll(scaleQuantityValueList);

                 List<Decimal> qSortedList = new List<Decimal>();
                 qSortedList = PAUtil.sortRateList(l1,'asc');
                 System.debug('****sorted list before'+scaleQuantityValueList);
                 System.debug('****sorted list'+qSortedList);
                 if(qSortedList != scaleQuantityValueList)
                 {   
                   errorMessage+=System.Label.Quantity_Value_Ascending_Error;
                   break;          
                 }              
                 else{
                   for(Integer j=1; j<qSortedList.size(); j++)
                   {
                     if(qSortedList[j] ==qSortedList[j-1] )
                     {
                       errorMessage+=System.Label.Quantity_Value_Ascending_Error;
                       break;              
                     }
                   }
                 }
                 boolean flag1 = false;
                 for(Integer i=1; i<=9; i++)
                 {
                   Integer j = i+1;
                   if(String.isBlank((String)pricingReqItem.get('ScaleRate'+i+'__c')) && !String.isBlank((String)pricingReqItem.get('ScaleRate'+j+'__c'))&& !(String.isBlank((String)pricingReqItem.get('ScaleRate'+i+'__c')) && String.isBlank((String)pricingReqItem.get('ScaleRate'+j+'__c'))))
                   {

                     flag1 = true;
                     break;
                   }
                 }
                 if(flag1==true)
                 {
                   errorMessage+=System.Label.Sequential_Rate_Error;
                   break;          
                 }
                 scaleList = new List<Decimal>();
                 for(Integer j=1; j<=10; j++)
                 {
                   if(!String.isBlank((String)pricingReqItem.get('ScaleRate'+j+'__c')))
                     scaleList.add(Decimal.valueOf((String)pricingReqItem.get('ScaleRate'+j+'__c')));
                 }
                 List<Decimal> l2 = new List<Decimal>();
                 l2.addAll(scaleList);
                 if(scaleCheck != null && scaleCheck == 'Ascending')
                 {
                   List<Decimal> sortedList = new List<Decimal>();
                   sortedList = PAUtil.sortRateList(l2,'asc');
                   if(sortedList != scaleList)
                   {
                     errorMessage+=System.Label.Scale_Rates_Ascending_Error;
                     break;            
                   }
                   else
                   {
                     for(Integer j=1; j<sortedList.size(); j++)
                     {
                       if(sortedList[j] ==sortedList[j-1] )
                       {
                         errorMessage+=System.Label.Scale_Rates_Ascending_Error;
                         break;                
                       }
                     }
                   }
                 }
                 else if (scaleCheck != null && scaleCheck == 'Descending')
                 {
                   List<Decimal> sortedList = new List<Decimal>();
                   sortedList = PAUtil.sortRateList(l2,'desc');
                   System.debug('****sorted list before'+scaleList);
                   System.debug('****sorted list'+sortedList);
                   if(sortedList != scaleList)
                   {
                     errorMessage+=System.Label.Scale_Rates_Descending_Error;
                     break;
                   }
                   else
                   {
                     for(Integer j=1; j<sortedList.size(); j++)
                     {
                       if( sortedList[j] ==sortedList[j-1] )
                       {
                         errorMessage+=System.Label.Scale_Rates_Descending_Error;
                         break;        
                       }
                     }
                   }
                 }
               }                                          
               if(errorMessage==null || errorMessage=='')
               {                
                 if(wrapperPricingReqItem.New_Valid_From__c == null && pricingReqItem.New_Valid_From__c == null)
                 {
                   pricingReqItem.New_Valid_From__c = pricingReqItem.Valid_From__c;
                 }
                 else if(wrapperPricingReqItem.New_Valid_From__c != null)
                 {
                   pricingReqItem.New_Valid_From__c = wrapperPricingReqItem.New_Valid_From__c;
                 }

                 if(wrapperPricingReqItem.New_Valid_To__c == null && pricingReqItem.New_Valid_To__c == null)
                 {
                   pricingReqItem.New_Valid_To__c = pricingReqItem.Valid_To__c;
                 }
                 else if(wrapperPricingReqItem.New_Valid_To__c != null)
                 {
                   pricingReqItem.New_Valid_To__c = wrapperPricingReqItem.New_Valid_To__c;
                 }
                 Set<String> quantityList=mapofScaleQuantityAndRates.keySet();
                 List<String> rateList=mapofScaleQuantityAndRates.values();
                 system.debug('&&**'+quantityList+' '+rateList);
                 List<Decimal> sortedQuantityList=new List<Decimal>();
                 for(String q: quantityList){
                   if(!string.isBlank(q)){
                     sortedQuantityList.add(decimal.valueOf(q));
                   }
                 }
                 highestQuantity=null;
                 if(sortedQuantityList!=null && sortedQuantityList.size()!=0){
                   sortedQuantityList.sort();
                   highestQuantity=mapofScaleQuantityAndRates.get(String.valueOf(sortedQuantityList.get(sortedQuantityList.size()-1)));
                   nQTY=String.valueOf(sortedQuantityList.get(sortedQuantityList.size()-1));
                 }
                 if(!String.isBlank(highestQuantity) && (highestQuantity.contains(',') || highestQuantity.contains('.')))
                 {
                   if(!String.isBlank(highestQuantity) && highestQuantity.contains(separator) && highestQuantity.countMatches(separator)==1 && !highestQuantity.contains(nonLocaleSeparator))
                   {
                     if(highestQuantity == ',')
                     {
                       highestQuantity = highestQuantity.replace(separator,'.');
                     }
                   }
                   else
                   {
                     errorMessage+=System.Label.Invalid_Rate_Change_Error;                     
                   }
                 }                 
                 if(errorMessage==null || errormessage=='')
                 {
                   if(highestQuantity!=null)
                     pricingReqItem.New_Rate__c=highestQuantity;                  
                   if(wrap.sObjectRecord.get('New_Rate__c') != null)
                   {
                     wrap.stringMap.put('newRateLocale',((String)wrap.sObjectRecord.get('New_Rate__c')).replace('.',separator));
                   }
                   if(wrap.sObjectRecord.get('Rate_One__c') != null)
                   {
                     wrap.stringMap.put('newRateLocale1',((String)wrap.sObjectRecord.get('Rate_One__c')).replace('.',separator));
                   }  
                   if((pricingReqItem.UoM__c == null && pricingReqItem.Per__c == null && pricingReqItem.Unit__c == null))
                   {
                     if(buOrgGroup.Default_Per_UoM_Setup__c=='Sales Area Config')
                     {
                       if(pricingReqItem.New_Unit__c!='%')
                       {
                         if(pricingReqItem.New_Unit__c==null && defReqCur==null)
                           pricingReqItem.New_Unit__c = buOrgGroup.Default_SalesArea_Currency__c;
                         else if(pricingReqItem.New_Unit__c==null)
                           pricingReqItem.New_Unit__c = defReqCur;
                         if(pricingReqItem.New_UOM__c==null || pricingReqItem.New_UOM__c==buOrgGroup.Default_SalesArea_UoM__c)
                           pricingReqItem.New_UOM__c = buOrgGroup.Default_SalesArea_UoM__c;
                         if(pricingReqItem.New_UOM__c==null || pricingReqItem.New_Per__c==buOrgGroup.Default_Per_Value__c)
                           pricingReqItem.New_Per__c = buOrgGroup.Default_Per_Value__c;
                       }
                       else
                       {
                         pricingReqItem.New_Unit__c = '%';
                       }                   
                     }
                     else if(buOrgGroup.Default_Per_UoM_Setup__c=='Product Hierarchy Config')
                     {
                       if(pricingReqItem.New_Unit__c!='%'){
                         if(pricingReqItem.New_Unit__c==null && defReqCur==null)
                           pricingReqItem.New_Unit__c = buOrgGroup.Default_SalesArea_Currency__c;
                         else if(pricingReqItem.New_Unit__c==null)
                           pricingReqItem.New_Unit__c = defReqCur;                      
                         if(pricingReqItem.Key_Combination__c.containsIgnoreCase('Material'))
                         {
                           if(pricingReqItem.New_UOM__c==null || pricingReqItem.New_UOM__c==pHUOM.get(pricingReqItem.Material_Code__c.toUpperCase()))
                             pricingReqItem.New_UOM__c = pHUOM.get(pricingReqItem.Material_Code__c.toUpperCase());
                           if(pricingReqItem.New_UOM__c==null || pricingReqItem.New_Per__c==pHPer.get(pricingReqItem.Material_Code__c.toUpperCase()))
                             pricingReqItem.New_Per__c = pHPer.get(pricingReqItem.Material_Code__c.toUpperCase());
                         }
                         else if(pricingReqItem.Key_Combination__c.containsIgnoreCase('PH'))
                         {
                           if(pricingReqItem.New_UOM__c==null || pricingReqItem.New_UOM__c==pHUOM.get(pricingReqItem.Product_Hierarchy_Code__c))
                             pricingReqItem.New_UOM__c = pHUOM.get(pricingReqItem.Product_Hierarchy_Code__c);
                           if(pricingReqItem.New_UOM__c==null || pricingReqItem.New_Per__c==pHPer.get(pricingReqItem.Product_Hierarchy_Code__c))
                             pricingReqItem.New_Per__c = pHPer.get(pricingReqItem.Product_Hierarchy_Code__c);
                         }
                       }
                       else
                       {
                         pricingReqItem.New_Unit__c = '%';
                       }
                     }                  
                   }
                   else
                   {
                     pricingReqItem.New_Unit__c = pricingReqItem.Unit__c;
                     pricingReqItem.New_UOM__c = pricingReqItem.Uom__c;
                     pricingReqItem.New_Per__c = pricingReqItem.Per__c;
                   }
                   if(scUoM.containsIgnoreCase('Select'))
                   {
                     if(scaleBase1 == 'Quantity Scale')
                       pricingReqItem.Scale_UoM_Scale_Unit__c=pricingReqItem.New_UoM__c;
                     else if(scaleBase1 == 'Value Scale')
                       pricingReqItem.Scale_UoM_Scale_Unit__c=pricingReqItem.New_Unit__c;
                   }
                   else
                     pricingReqItem.Scale_UoM_Scale_Unit__c=scUoM;
                   if(newPer!=null)
                   {
                     pricingReqItem.New_Per__c=newPer;
                   }
                   //<TJ20140901> END
                   System.debug('***pri.Unit__c'+pricingReqItem.New_Unit__c+'**'+pricingReqItem.New_UOM__c+'**'+pricingReqItem.New_Per__c+'**'+pricingReqItem.Scale_UoM_Scale_Unit__c+'**'+pricingReqItem.New_Rate__c+'**'+highestQuantity+'**'+sortedQuantityList+'**'+mapofScaleQuantityAndRates);
                   Decimal roundOfRate;
                   String newRedefinedRate;
                   System.debug('pri.New_Rate__c:-'+pricingReqItem.New_Rate__c);
                   if(pricingReqItem.New_Rate__c!='')
                   {
                     if(pricingReqItem.New_Unit__c != null && pricingReqItem.New_Unit__c!= '%')
                     {
                       roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(PAUtil.decimalPlacesMap.get(pricingReqItem.New_Unit__c),System.RoundingMode.HALF_EVEN);
                     }
                     else
                     {
                       roundOfRate = Decimal.valueOf(pricingReqItem.New_Rate__c).setScale(3,System.RoundingMode.HALF_EVEN);
                     }                                   
                   }
                   if(roundOfRate != null)
                   {
                     newRedefinedRate = String.valueOf(roundOfRate);
                   }
                   pricingReqItem.Scale_Basis__c=pc.Scale_Base__c;
                   pricingReqItem.Scale_Basis_Code__c=pc.Scale_Basis_Code__c;
                   pricingReqItem.Scale_Type__c=pc.Scale_Type__c;
                   pricingReqItem.Scale_Type_Code__c=pc.Scale_Type_Code__c;
                   pricingReqItem.New_Rate__c = newRedefinedRate;
                   updateReqItem.add(pricingReqItem);
                 }                   
               }              
             }
             else
             {
               errorMessage='Please Select A Scaled Price';
             }
           }           
         }
       }
       else
         errorMessage = System.Label.No_Record_Selected_Error;  

       if(errorMessage==null || errorMessage=='')
       {
         update updateReqItem;
         //Start:-<PG20160913>
         PAUtil.calculateFloorAndReference(updateReqItem);
         //End:--<PG20160913>
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Scale Prices Updated'); 
         ApexPages.addMessage(myMsg);
       }
       else
       {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,errorMessage); 
         ApexPages.addMessage(myMsg);
       }  
     }
     catch(Exception e)
     {
       system.debug('Exception: '+e);
     }
   }
   //<TJ20140908>
   public void changeToNonScale()
   {
     List<Pricing_Request_Item__c> updateList = new List<Pricing_Request_Item__c>();
     boolean flag=false;     
     for(PAWrapper wrap:wrapperlist)
     {
       Pricing_Request_Item__c pricingReqItem = (Pricing_Request_Item__c)wrap.sObjectRecord;
       if(wrap.isSelected==true)
       {
         flag=true;
         if(pricingReqItem.Scaled_Price_Flag__c == true)
         {
           pricingReqItem.Scaled_Price_Flag__c = false;
           pricingReqItem.Scale_Quantity_Scale_Value1__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value2__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value3__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value4__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value5__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value6__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value7__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value8__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value9__c=null;
           pricingReqItem.Scale_Quantity_Scale_Value10__c=null;
           //<TJ20141028> Issue #28: Defaulting rate to sale rate 1.
           pricingReqItem.New_Rate__c=pricingReqItem.ScaleRate1__c;
           pricingReqItem.ScaleRate1__c=null;
           pricingReqItem.ScaleRate2__c=null;
           pricingReqItem.ScaleRate3__c=null;
           pricingReqItem.ScaleRate4__c=null;
           pricingReqItem.ScaleRate5__c=null;
           pricingReqItem.ScaleRate6__c=null;
           pricingReqItem.ScaleRate7__c=null;
           pricingReqItem.ScaleRate8__c=null;
           pricingReqItem.ScaleRate9__c=null;
           pricingReqItem.ScaleRate10__c=null;
           pricingReqItem.Scale_UoM_Scale_Unit__c=null;
         }
         else
         {
           pricingReqItem.Scaled_Price_Flag__c = true;
         }
         updateList.add(pricingReqItem);
         wrap.isselected=false;
       }       
     }
     if(flag)
       update updateList;
     else
     {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,System.Label.No_Record_Selected_Error); 
       ApexPages.addMessage(myMsg);
     }     
   }   
   //<TJ20140901>
   public map<map<String,String>,map<String,Decimal>> defUomPer(Organizational_Group_Item__c buOrgGroup,Set<String> matCodeSet,Set<String> phSet, Pricing_Request_Item__c reqItem)
   {
     Set<String> phCodes=new Set<String>();
     map<String,String> materialPH=new map<String,String>();
     map<String,String> pHUOM1=new map<String,String>();
     map<String,Decimal> pHPer1=new map<String,Decimal>();
     map<String,String> pHUOM=new map<String,String>();
     map<String,Decimal> pHPer=new map<String,Decimal>();
     boolean enableVarConfigMaterial=false;
     list<BU_PH__c> allPHList=new list<BU_PH__c>();
     List<String> splitBUSalesArea = new List<String>();
     if(requestBUSalesArea != null)
     {
       splitBUSalesArea = requestBUSalesArea.split('-');
     }
     if(reqItem.key_combination__c.containsIgnoreCase('Material'))
     {
       if(buOrgGroup!=null){
         enableVarConfigMaterial = buOrgGroup.Enable_Variable_Config_Materials__c;                
       }
       List<Material__c> matList = new List<Material__c>();
       List<sObject> matSObjList = new List<sObject>();
       if(enableVarConfigMaterial)
       {
         matList=[select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,
                  ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                  ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
                  ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c FROM Material__c where ERP_Material_Code__c=:matCodeSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial 
                  AND ERP_Sales_Org_Code__c=:splitBUSalesArea[1] AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:splitBUSalesArea[2]];
       }
       else
       { 
         matList=[select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,
                  ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                  ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
                  ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c FROM Material__c where ERP_Material_Code__c=:matCodeSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Sales_Org_Code__c=:splitBUSalesArea[1] 
                      AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:splitBUSalesArea[2]];
       }  
       matSObjList = matList;
       System.debug('******** Matlist***'+matList);
       for(Integer i=0;i<matSObjList.size();i++){
         phCodes.add((String)matSObjList[i].get('ERP_Product_Hierarchy_Code__c'));
         String k = (String)matSObjList[i].get('ERP_Material_Code__c');
         k = k.toUpperCase();
         materialPH.put(k,(String)matSObjList[i].get('ERP_Product_Hierarchy_Code__c'));
       }
       PARequestItemHelper reqitem2=new PARequestItemHelper(buOrgGroup.business__c);
       allPHList=reqitem2.query(phCodes);
       pHUOM1=reqitem2.getDefaultUOM(allPHList);
       set<string> keys = phUOM1.keyset();
       set<String> keys2 = materialPH.keyset();
       for(String i: keys)
       {
         for(String j: keys2)
         {
           if((i) == materialPH.get(j))
           {
             phUOM.put(j,phUOM1.get(i));
           }
         }
       }
       pHPer1=reqitem2.getDefaultPer(allPHList);
       set<string> keys3 = phPer1.keyset();
       set<String> keys4 = materialPH.keyset();
       for(String i: keys3)
       {
         for(String j: keys4)
         {
           if(i == materialPH.get(j))
           {
             phPer.put(j,phPer1.get(i));
           }
         }
       }
       system.debug('PH UOM AND PER: '+phuom1+'**'+phper1+'**'+keys+'**'+keys2+'**'+keys3+'**'+keys4+'**'+pHUOM+'**'+pHPer);
     }
     else if(reqItem.Key_Combination__c.containsIgnoreCase('PH'))
     {
       PARequestItemHelper reqitem2=new PARequestItemHelper(buOrgGroup.business__c);
       allPHList=reqitem2.query(phSet);
       pHUOM=reqitem2.getDefaultUOM(allPHList);
       pHPer=reqitem2.getDefaultPer(allPHList);
       system.debug('PH UOM AND PER: '+pHUOM+'**'+pHPer);
     }
     map<map<String,String>,map<String,Decimal>> defVals = new  map<map<String,String>,map<String,Decimal>>();
     defVals.put(pHUOM,pHPer);
     return defVals;
   }
   
    // <VK20200819> START
    private static Decimal getCurrencyExchangeRate(String CurrencyCode){
        CurrencyType Rate = new CurrencyType();
        Rate = [SELECT ID, ConversionRate from CurrencyType WHERE ISOCode=: CurrencyCode LIMIT 1];
        return Rate.ConversionRate;
    }
    
    private static MAP<String,SalesOrgSettings__mdt> getSalesOrgSettingswithNewrateInUSD(String SalesOrgCode){
        MAP<String,SalesOrgSettings__mdt> NewRateMapinUSD = new MAP<String,SalesOrgSettings__mdt>();
        LIST<SalesOrgSettings__mdt> NewrateSettingsList= [SELECT Sales_Org_Code__c,VAT_Value__c,NewRateUSDDisplay__c from SalesOrgSettings__mdt];
        for(SalesOrgSettings__mdt NewrateSetting: NewrateSettingsList){
            if(NewrateSetting.Sales_Org_Code__c == SalesOrgCode){
                NewRateMapinUSD.put(NewrateSetting.Sales_Org_Code__c,NewrateSetting);
            }
        }
        return NewRateMapinUSD;
    }
    // <VK20200819> END
}