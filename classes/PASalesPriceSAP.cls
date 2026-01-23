/*   Ver.                      Developer                           Changes                                   Dependencies
--------------------------------------------------------------------------------------------------------------------------*/
//  1.1                         Priyanka                        Moved Schema.sObjectType out                    None
//                                                                of for Loop              
//  1.2                         Ghosh                           Modified Throw PAExceptionwarning message       None 
//
//  1.3                         sanjib                          added applicationid,clientid for pcl in query
//
//  1.4                         Shiva                           Added logic for fetching the active material    None                                                                         
//                                                                during fetch records
//  1.5                         Priyanka                        Modified getListWrappers method to 
//                                                                populate fieldsets                            None  
//  1.6                         Neeharika                       changing the limit of query                     None
//  1.7                         Priyanka                        Modified getListWrappers method to 
//                                                                populate date fieldset                        None
//  1.8                         Neeharika                       separating the holder query from dynamic        None                
//  1.9                         Priyanka                        Modified getListWrappers method to 
//                                                                populate soldTo fieldset                      None
//  2.0                         Priyanka                        Changed sObjectList to sObjectRecord in wrapper None
//  2.1                         Priyanka                        Changed limit to 1000                           None
//  2.2                         Neeharika                       populated KC SFDC desc                          None
//  2.2                         sanjib                          changed the query as the reqiurement
//                                                                is multiselect                                None
//  2.3                         Priyanka                        Added map logic in getlistwrappers
//                                                                to avoid duplicates                           None
//  2.4                         Priyanka                        Sorting fetch records Material Name
//                                                                Issue # 69 UAT Fix                            None
//  2.5                         Bala                            UAT Defect issue #75 Fetch Records for Massive  None
//  2.6                         Shiva                           Fix for, 'the key combination stops at level 6, 
//                                                                but the result after fetch records 
//                                                                gives PH beyond level 6' - UAT Fix #43        None
//  2.7                         Priyanka                        Added errorMessage to restrict adding more
//                                                                than 450 records                              None    
//  2.8                         Brundha                         Changed from csvstring to dispNCS for NCS       None
//  2.9                         Priyanka                        Adding code for additional KC filters - 
//                                                                  Price Ref. Partner,Country,End Use,
//                                                                  Market Segment                              None
//  3.0                         Shiva                           Adding code for additional KC filters - 
//  3.1                         Hema                            Added condition to handle displaying NULL in PCKC - HL20141027           None
//                                                                  End User                                                             None
//  3.2                         Nadeem                          Cleared old list variable activematerials to avoid heap size issue and extended the limit on active materials
//  3.3                         Ankit                           Added order by condition to fetch current Prices while generating PCL
//  3.4                         Kunal                           Added one filter in the query so that in export functionality it will fetch only those records which are not marked for deletion.          
//  3.5                         Arpit                           Added logic to populate Contract No. in drop down on selection of Sold To
//  3.6                         Arpit                           Added logic to fix issue related to Sales Org populating null on prices   
//  3.7                         Arpit                           Added logic to fix issue related to prices missing from customer view in SFDC
//  3.8                         Nadeem                          Updated the condition criteria from 400 to 200 to show Next page link in line  .  
//  3.9                         Nadeem                          Added TermsOfPayment and TermsOfPaymentCode in the select query.
//  3.10                        Calment                         Updated the if condition criteria for Material Group 1 to fix the error message "SObject row was retrieved via SOQL without querying the requested field: ERP_Sales_Prices_SAP__c.Material__c"  
//  3.11                        Vamsi                           Added the null check.
//  3.12                        Piyush                          Added the Distributor Code.
//  3.13                        Shivam/Sireesha                 Addeed a condition for End user code in query where we get all the prices related to end user as well.
//  3.14                        Amandeep Gautam                 SOQL Query limit change, for removing Apex Heap Size error - IS SC-00096911 
//  3.15                        Amandeep Gautam                 Added 'Distributor' fields to query (((REVERTED)))
//  3.16                        Vinay Kumar                     Added Distributor code to populate fields information on records - IS SC-00098497
//  3.17                        Amandeep Gautam                 SOQL Query limit change, for removing Apex Heap Size error - IS SC-00098740
/****************************************************************************************************************
**********************************************Modification Log***************************************************
<PP20130424>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 Apr 2013
Description         :   Locale code modification - APAC ROLLOUT1(3.0)
*****************************************************************************************************************
<VR20130510>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   10 May 2013
Description         :   Material query modification - APAC ROLLOUT1(3.1)
*****************************************************************************************************************
<VR20130510>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   10 May 2013
Description         :   Adding Customer Hierarchy filter values in query - APAC ROLLOUT1(3.2)
*****************************************************************************************************************
<BR20130718>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   18 Jul 2013
Description         :   Adding logic for viewprices relatedlist - APAC ROLLOUT2(3.3)
*****************************************************************************************************************
<BR20130723>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   23 Jul 2013
Description         :   modified columns for viewprices relatedlist - APAC ROLLOUT2(3.4)
****************************************************************************************************************
<VR20130717>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   17 Jul 2013
Description         :   Adding Logic for Creation of Floor and Reference Prices - APAC ROLLOUT2(3.5)
***************************************************************************************************************
<VR20130722>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   22 Jul 2013
Description         :   Adding Logic for Sorting the Exported records with Customer Name when Sold to is one of the value in Key Combination - APAC ROLLOUT2(3.6)
****************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - APAC ROLLOUT2(3.8)
****************************************************************************************************************
<PP20130923>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   23 September 2013
Description         :   Issue for View Customer Prices fixed - removed DC code and Division code from query - ROLLOUT2(3.9)
****************************************************************************************************************
<PP20131022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2013
Description         :   Terms of Payment Key field - ROLLOUT2(4.0)
****************************************************************************************************************
<PP20131024>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 October 2013
Description         :   Removed Distribution_Channel_Code__c and Division_Code__c from where clause - SIT Issue #25 FIX - ROLLOUT2(4.0)
*****************************************************************************************************************
<PP20131028>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   28 October 2013
Description         :   Added logic for new key field - Ship To Country - ROLLOUT2
************************************************************************************************************************************
<VR20131030>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   30 October 2013
Description         :   Added Pricing Procedure in the SAP queries - ROLLOUT2
************************************************************************************************************************************
<NE20131031>
Last Modified By    :   Neeharika
Last Modified Date  :   31 October 2013
Description         :   Removed mark_for_Deletion__c=false for all the queries.
************************************************************************************************************************************
<PP20131115>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   15 November 2013
Description         :   1) Split the key combination into 2 substrings - DTT ROLLOUT USAT issue
2) Restrict adding more than 350 records - DTT ROLLOUT
************************************************************************************************************************************
<VR20131125>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   25 November 2013
Description         :   DTT Rollout issue - Added order by condition
************************************************************************************************************************************
<VR20140116>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   16 January 2014
Description         :   Support issue - To Export Sold To based on OnBehalfOf and commented the if condition logic
**********************************************************************************************************************
<PP20140218>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   18 February 2014
Description         :   CAPITAL PROJECT - Customer Prices list views for CSRs
**********************************************************************************************************************
<BB20140404>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   04 April 2014
Description         :   CAPITAL PROJECT - Added cloneValidation method to validate the requestItems while cloning a request.
**********************************************************************************************************************
<PP20140426>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   26 February 2014
Description         :   CAPITAL PROJECT - Current Prices Screen
************************************************************************************************************************************
<SP20140428> 
Last Modified By    :  Shiva
Last Modified Date  :  28 Apr 2014
Description         :  CAPITAL PROJECT - For Config and non config materials
**********************************************************************************************************************
<PP20140502>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   2 May 2014
Description         :   CAPITAL PROJECT - Adding request items to buffer on click of 'Add To Request'
*****************************************************************************************************************
<AV20140515>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   15 May 2014
Description         :   CAPITAL PROJECT - Sales Volume requirement
*****************************************************************************************************************
<SP20140520>
Last Modified By    :   Shiva
Last Modified Date  :   20 May 2014
Description         :   CAPITAL PROJECT - New PH Selection component
******************************************************************************************************************
<TJ20140902>
Last Modified By    :   Tarun
Last Modified Date  :   02 September 2014
Description         :   Added call to method to retain th pc kc for non customer specific request
*****************************************************************************************************************
<PR20140925>
Last Modified By    :   Priyanka R
Last Modified Date  :   25 September 2014
Description         :   Added Pricing_Request__c,Pricing_Request__r.Name fields in the queries
*****************************************************************************************************************
<GT20150511>
Last Modified By    :   George Thomas
Last Modified Date  :   11 May 2015
Description         :   Added logic to populate the 6 character KC codes in export file 
*****************************************************************************************************************
Last Modified By    :   Nadeem S
Last Modified Date  :   30 Dec 2015
Description         :   Extended limit on active materials and unused varialbe activematerials is cleared after querying

*****************************************************************************************************************
Last Modified By    :   Ankit16 K
Last Modified Date  :   25 Jan 2016
Description         :   Added order by condition to fetch current Prices while generating PCL

*****************************************************************************************************************
Last Modified By    :   K Sharma4
Last Modified Date  :   4 Feb 2016
Description         :   IS ID-00059002 - Added one filter in the query so that in export functionality it will fetch only those records which are not marked for deletion.

*****************************************************************************************************************
Last Modified By    :   Arpit Jain
Last Modified Date  :   16 Feb 2016
Description         :   IS ID-00064810 - Added logic so that that correct contract number populates in Contract drop down on the basis of Sold to we selected when creating Mass Change request.

*****************************************************************************************************************
Last Modified By    :   Arpit Jain
Last Modified Date  :   22 Feb 2016
Description         :   IS ID-00065760 - Added logic for fixing issue related to Sales Org populating null on prices due to system case sensitivity.

*****************************************************************************************************************
Last Modified By    :   Arpit Jain
Last Modified Date  :   14 Mar 2016
Description         :   IS ID-00065042,IS ID-00066124 - Updated SOQL query for fixing issue related to prices missing from customer view in SFDC.

*****************************************************************************************************************
<MD20150328>
Last Modified By    :   Madhurima Daggumati
Last Modified Date  :   28 Mar 2016
Description         :   IS ID-00067457 - Updated SOQL query and added new lines of code for fixing issue related to display customer prices related to selected sales rep in Massive change request.

*****************************************************************************************************************
<NS20180328>
Last Modified By    :   Nadeem Shaik
Last Modified Date  :   28 Mar 2018
Description         :   IS ID-00084272 - Updated the if condition criteria from >400 to >200 to enable next page link .

*****************************************************************************************************************
<NS20190305>
Last Modified By    :   Nadeem S
Last Modified Date  :   05 Mar 2019
Description         :   IS ID-00084628 - Added TermsOfPayment and TermsOfPaymentCode in the select query.
*****************************************************************************************************************
<CC20198322>
Last Modified By    :   Calment Cleo C
Last Modified Date  :   22 Aug 2019
Description         :   IS ID-00087379 - Updated the if condition criteria for Material Group 1 to fix the 
error message "SObject row was retrieved via SOQL without querying the requested field: ERP_Sales_Prices_SAP__c.Material__c".
*****************************************************************************************************************
<VK20200128>
Last Modified By    :   Vamsi Krishna
Last Modified Date  :   28 Jan 20202
Description         :   IS SC-00092347 "Cannot open customer 55645561"
*****************************************************************************************************************
<PG20202707>
Last Modified By    :   Piyush Gupta
Last Modified Date  :   27 July 2020
Description         :   Added the Distributor Code
*****************************************************************************************************************
<SP20201021>
Last Modified By    :   Shivam Parashar 
Last Modified Date  :   21 Oct 2020
Description         :   Added a condition for End user code in query where we get all the prices related to end user as well.
*****************************************************************************************************************
<AG20201124>
Last Modified By    :   Amandeep Gautam 
Last Modified Date  :   24 Nov 2020
Description         :   SOQL Query limit change, for removing Apex Heap Size error - IS SC-00096911
*****************************************************************************************************************
<AG20201222>        (((REVERTED)))(((REVERTED)))(((REVERTED)))(((REVERTED)))(((REVERTED))) on 14Jan2021
Last Modified By    :   Amandeep Gautam 
Last Modified Date  :   22 Dec 2020
Description         :   Added 'Distributor' fields to query. IS SC-00097409 (Changed Version to 49.0 on 5Jan2021)
*****************************************************************************************************************
<VK20210316>         
Last Modified By    :   Vinay Kumar 
Last Modified Date  :   16 Mar 2021
Description         :   Added 'Distributor' fields to populate in the prices if KC contains distributor. IS SC-00098497
*****************************************************************************************************************
<AG20210510>         
Last Modified By    :   Amandeep Gautam 
Last Modified Date  :   10 May 2021
Description         :   SOQL Query limit change from 50k to 25k, for removing Apex Heap Size error - IS SC-00096911
*****************************************************************************************************************
<CRM-2021-04-0192>
Last Modified By   :   Harsh Gurvanshi
Last Modified Date :   08 Dec 2021
Description        :   Adding extra condition check for P80 Business
Issue #            :   CRM-2021-04-0192||
*****************************************************************************************************************
<SH20220107>
Last Modified By   :   Sapneet Kaur Hora
Last Modified Date :   07 Jan 2022
Description        :   Updated whereClause1 and whereClause2 in query
Issue #            :   IS SC-00102340
*****************************************************************************************************************
<SH20220624>
Last Modified By   :   Sapneet Kaur Hora
Last Modified Date :   24 June 2022
Description        :   Updated whereClause2 in query
Issue #            :   IS SC-00104642
*****************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic for Sales Order Item and Sales Order Item Code values - CRM-2022-07-0225
 
*****************************************************************************************************************
 <SS20221025>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   25 Oct 2022
 Description        :   Decreasing limit in Query from 2000 to 1800 to avoid heap size error in Production - IS EI-00096169.

*****************************************************************************************************************
<SH20221125>
Last Modified By   :   Sapneet Kaur Hora
Last Modified Date :   25 November 2022
Description        :   Modified Code to Resolve errors while using 'Send To Xls' under Price Lists
Issue #            :   IS SC-00105625
<SS20230501>
 Last Modified By   :   Manav Sharma
 Last Modified Date :   12 April 2023
 Description        :   Added logic for M&M P80 Business values
*****************************************************************************************************************
<AD20230613>
Last Modified By   :   Aniket Dangi
Last Modified Date :   19 June 2023
Description        :   Added new sales org codes for Derby - B902,B99I,B901
Issue #            :   IS TI-00095769

****************************************************************************************************************
*****************************************************************************************************************
<MF20240111>
Last Modified By    :   Mohd Fahad
Last Modified Date  :   11 Nov 2024
Description         :   SOQL Query limit change, for removing Apex Heap Size error - IS SC-00109199
******************************************************************************************************************/


    global class PASalesPriceSAP implements IPAServiceComponent{
    //<BR20130723> replaced Private by Public
    public Date validOnFilter{get;set;}
    public PARequest request{get;set;}
    //List to hold the Price List Type options at Sales Area level
    public List<SelectOption> priceListTypeList;  
    //Ver 2.9 START
    //List to hold the End Use options at Sales Area level
    public List<SelectOption> endUseList;
    //<PG20202707>
    public List<Selectoption> distributorList;
    //<KS20220808>
    public List<Selectoption> salesOrderItemList;
    public List<SelectOption> matlGrp1List;
    //<SS20230501>
    public List<Selectoption> valueCenterList;
    public List<Selectoption> extMaterialGroupList;
    public List<Selectoption> materialGroup2List;
    public List<Selectoption> priceZoneList;
    //List to hold the Market Segment options at Sales Area level
    public List<SelectOption> marketSegmentList;
    //List to hold the Country options at Sales Area level
    public List<SelectOption> countryList;
    //List to hold the Terms Of Payment options at Sales Area level
    public List<SelectOption> termsOfPaymentList;
    //Ver 2.9 END
    //<MS20140514> Including Variant and Sales Order Type START
    public List<SelectOption> variantList;
    public List<SelectOption> contractList;
    public List<SelectOption> salesOrderTypeList;
    public List<SelectOption> ComPartnerList;
    //<MS20150312>
    public List<SelectOption> materialGroup5KeyList;
    public List<SelectOption> PlantList;
    public List<SelectOption> ShippingConditionList;
    public List<SelectOption> DestinationCountryList;
    //<MS20140514> Including Variant and Sales Order Type END
    //List to hold the Sales Office options at Sales Area level
    public List<SelectOption> salesOfficeList;
    public List<SelectOption> salesDistrictList;
    
    public List<SelectOption> PartnerZFList;
    public List<SelectOption> PayerList;
    
    public List<SelectOption> campaignList;
    public List<SelectOption> documentCurrencyList;
    public List<SelectOption> stateList;
    
    public transient List<SObject> countFetchedList{get;set;}
    public integer offsets{get;set;}
    public integer fromSet{get;set;}
    public integer toSet{get;set;}
    public boolean nextPage{get;set;}
    public boolean prevPage{get;set;}
    public integer totalRecrds{get;set;}
    //<KJ20150519>
    public string searchedItem{get;set;}
    public string searchedMaterial{get;set;}
    //Added for fetch100 records in export price page
    boolean fetch100;
    boolean fetchRecrds = false;
    boolean exportcsv = false;
    boolean countfetch100 = false; // <HL20150511 Production issue fix for export>
    //<PP20140502>
    public List<SelectOption> pcKCConcatList {get; set;}
    public String pcKCSelected {get; set{
        System.debug('pcKCSelected value:-'+value);
        pcKCSelected = (string)value;
    }}
    //<AV20141012>
    
    public string clearViewPoint{get;set{
        if(relatedWrappersList!=null)
            relatedWrappersList = new List<PARelatedList> ();
    }}
    
    public PARequestItemHelper reqitem2{get;set;}
    
    public PASalesPriceSAP( PAServiceState paServiceState) 
    { 
        request = (PARequest) paServiceState.currentRequest; 
    }
    public boolean displayRelatedList{get;set;}
    
    public List<selectOption> cpgList;
    //to query from orgGrp-Key 
    //<GT20141028> Added variable to show the total number of records in Fetch records
    //public integer totalERPRecords{get;set;}
    public List<selectOption> getCpgList()
    {
        cpgList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> cpgStringList = request.requestServiceState.ogItems.listSelectedCPG;
        system.debug('***cpgStringList'+cpgStringList+'size'+cpgStringList.size());
        for(String cpg : cpgStringList)
        {
            cpgList.add(new SelectOption(cpg,cpg));
        }
        System.debug('******CPG'+cpgList.size());
        return cpgList;
    }
    public void setCpgList(List<selectOption> cp)
    {
        this.cpgList = cp;
    }
    //<BB20130726> Ver 3.8 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Incoterms START
    public List<selectOption> incotermsList;
    //to query from orgGrp-Key 
    public List<selectOption> getIncotermsList()
    {
        incotermsList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> incotermsStringList = request.requestServiceState.ogItems.listSelectedIncoterms;
        for(String inco : incotermsStringList)
        {
            incotermsList.add(new SelectOption(inco,inco));
        }
        System.debug('******INCO'+incotermsList.size());
        return incotermsList;
    }
    public void setIncotermsList(List<selectOption> inco)
    {
        this.incotermsList = inco;
    }
    //<BB20130726> Ver 3.8 ENDS
    
    public List<selectOption> mpgList;
    //to query from orgGrp-Key 
    
    //Added to fetch all keyt fields from custom settings
    map<string, List<String>>mapkcField;
    List<String> keyfields ;
    List<String> allKcs;
    public List<selectOption> getMpgList()
    {
        if(mpgList==null)
        {
            mpgList = new List<SelectOption>();
            request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
            List<String> mpgStringList = request.requestServiceState.ogItems.listSelectedMPG;
            for(String mpg : mpgStringList)
            {
                mpgList.add(new SelectOption(mpg,mpg));
            }
        }
        return mpgList;
        
    }
    public void setMpgList(List<selectOption> mp)
    {
        this.mpgList = mp;
    }
    
    //<GT20150511> Added a variable to capture the KC code
    string kcCode;
    
    /*
* Author      : 
* Method Name  :   getSalesOfficeList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Sales Office in the picklist
*/
    public List<SelectOption> getSalesOfficeList()
    {
        salesOfficeList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> soStringList = request.requestServiceState.ogItems.listSelectedSO;
        for(String so : soStringList)
        {
            salesOfficeList.add(new SelectOption(so,so));
        }
        System.debug('******Sales Office'+salesOfficeList.size());
        return salesOfficeList;
    }
    
    /*
* Author      : 
* Method Name  :   setSalesOfficeList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Sales Office in the picklist
*/
    public void setSalesOfficeList(List<SelectOption> so)
    {
        this.salesOfficeList = so;
    }
    /*
* Author      : 
* Method Name  :   getMaterialGroup5KeyList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Material Group 5 in the picklist
*/
    public List<SelectOption> getMaterialGroup5KeyList()
    {
        MaterialGroup5KeyList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> mg5StringList = request.requestServiceState.ogItems.listSelectedMG5;
        for(String mg : mg5StringList)
        {
            MaterialGroup5KeyList.add(new SelectOption(mg,mg));
        }
        return MaterialGroup5KeyList;
    }
    
    /*
* Author      : 
* Method Name  :   setMaterialGroup5KeyList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Material Group 5 in the picklist
*/
    public void setMaterialGroup5KeyList(List<SelectOption> mg)
    {
        this.MaterialGroup5KeyList = mg;
    }
    /*
* Author      : 
* Method Name  :   getSalesDistrictList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Sales Office in the picklist
*/
    public List<SelectOption> getSalesDistrictList()
    {
        salesDistrictList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> sdStringList = request.requestServiceState.ogItems.listSelectedSD;
        for(String sd : sdStringList)
        {
            salesDistrictList.add(new SelectOption(sd,sd));
        }
        return salesDistrictList;
    }
    
    /*
* Author      : 
* Method Name  :   setSalesDistrictList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Sales District in the picklist
*/
    public void setSalesDistrictList(List<SelectOption> sd)
    {
        this.salesDistrictList = sd;
    }
    
    /*
* Author      : 
* Method Name  :   getPriceListTypeList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Price List Type in the picklist
*/
    public List<SelectOption> getPriceListTypeList()
    {
        priceListTypeList = new List<SelectOption>();
        Set<String> pltStringSet=new Set<String>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> pltStringList = request.requestServiceState.ogItems.listSelectedPLType;
        pltStringSet.addAll(pltStringList); 
        for(String plt : pltStringSet)
        {
            priceListTypeList.add(new SelectOption(plt,plt));
        }
        System.debug('******Price List Type'+priceListTypeList.size());     
        priceListTypeList.sort();
        return priceListTypeList;
    }
    
    /*
* Author      : 
* Method Name  :   setPriceListTypeList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Price List Type in the picklist
*/
    public void setPriceListTypeList(List<SelectOption> plt)
    {
        this.priceListTypeList = plt;
    }
    
    //Ver 2.9 START
    /*
* Author      : 
* Method Name  :   getCountryList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Country in the picklist
*/
    public List<SelectOption> getCountryList()
    {
        countryList = new List<SelectOption>();
        //<GT20141103>Added set to remove the duplicate countries
        set<SelectOption> countrySet =new set<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> countryStringList = request.requestServiceState.ogItems.listSelectedCountry;
        for(String c : countryStringList)
        {
            //countryList.add(new SelectOption(c,c));
            countrySet.add(new SelectOption(c,c));
        }
        countryList.addAll(countrySet);
        countryList.sort();
        return countryList;
    }
    
    /*
* Author      : 
* Method Name  :   setCountryList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Country in the picklist
*/
    public void setCountryList(List<SelectOption> c)
    {
        this.countryList = c;
    }
    
    /*
* Author      : 
* Method Name  :   getEndUseList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for End Use in the picklist
*/
    public List<SelectOption> getEndUseList()
    {
        endUseList = new List<SelectOption>();
        //<TJ20141110>
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> endUseStringList = request.requestServiceState.ogItems.listSelectedMG3;
        for(String eu : endUseStringList)
        {
            endUseList.add(new SelectOption(eu,eu));
        }
        return endUseList;
    }
    
    /*
* Author      : 
* Method Name  :   setEndUseList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for End Use in the picklist
*/
    public void setEndUseList(List<SelectOption> eu)
    {
        this.endUseList = eu;
    }
    
        /*
* Author      : Piyush Gupta <PG20202707>
* Method Name  :   getdistributorList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Distributor Code in the picklist
*/
    public List<SelectOption> getdistributorList()
    {
        distributorList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> distributorStringList = request.requestServiceState.ogItems.listSelectedDist;
        for(String di : distributorStringList)
        {
            distributorList.add(new SelectOption(di,di));
        }
        return distributorList;
    }
    
    /*
* Author      : Piyush Gupta <PG20202707>
* Method Name  :   setdistributorList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for End Use in the picklist
*/
    public void setdistributorList(List<SelectOption> di)
    {
        this.distributorList = di;
    }
    
    /*
* Author      : Kanchan Solanki <KS20220808>
* Method Name  :   getsalesOrderItemList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Distributor Code in the picklist
*/
    public List<SelectOption> getsalesOrderItemList()
    {
        salesOrderItemList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> salesOrderItemStringList = request.requestServiceState.ogItems.listSelectedItem;
        for(String di : salesOrderItemStringList)
        {
            salesOrderItemList.add(new SelectOption(di,di));
        }
        return salesOrderItemList;
        }
/*
* Author      : Manav Sharma <SS20230501>
* Method Name  :   getvalueCenterList, getextMaterialGroupList, getmaterialGroup2List, getpriceZoneList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for New Key fields in the picklist
*/        

        public List<SelectOption> getvalueCenterList()
    {
        valueCenterList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> valueCenterStringList = request.requestServiceState.ogItems.listSelectedVC;
        for(String di : valueCenterStringList)
        {
            valueCenterList.add(new SelectOption(di,di));
        }
        return valueCenterList;
        }

        public List<SelectOption> getextMaterialGroupList()
    {
        extMaterialGroupList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> extMaterialGroupStringList = request.requestServiceState.ogItems.listSelectedEMG;
        for(String di : extMaterialGroupStringList)
        {
            extMaterialGroupList.add(new SelectOption(di,di));
        }
        return extMaterialGroupList;
        }

        public List<SelectOption> getmaterialGroup2List()
    {
        materialGroup2List = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> materialGroup2StringList = request.requestServiceState.ogItems.listSelectedMG2;
        for(String di : materialGroup2StringList)
        {
            materialGroup2List.add(new SelectOption(di,di));
        }
        return materialGroup2List;
        }

        public List<SelectOption> getpriceZoneList()
    {
        priceZoneList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> priceZoneStringList = request.requestServiceState.ogItems.listSelectedPZ;
        for(String di : priceZoneStringList)
        {
            priceZoneList.add(new SelectOption(di,di));
        }
        return priceZoneList;
        }
        
    
    /*
* Author      : Manav Sharma <SS20230501>
* Method Name  :   setsalesOrderItemList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for End Use in the picklist
*/
    public void setsalesOrderItemList(List<SelectOption> si)
    {
        this.salesOrderItemList= si;
    }
    
    /*
* Author      : Kanchan Solanki <KS20220808>
* Method Name  :   setvalueCenterList, setextMaterialGroupList, setmaterialGroup2List, setpriceZoneList,setShippingConditionList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for End Use in the picklist
*/
    public void setvalueCenterList(List<SelectOption> si)
    {
        this.valueCenterList= si;
    }

    public void setextMaterialGroupList(List<SelectOption> si)
    {
        this.extMaterialGroupList= si;
    }

    public void setmaterialGroup2List(List<SelectOption> si)
    {
        this.materialGroup2List= si;
    }

    public void setpriceZoneList(List<SelectOption> si)
    {
        this.priceZoneList= si;
    }
    
    public void setShippingConditionList(List<SelectOption> si)  // <SS20230501> 
    {
        this.ShippingConditionList = si;
    }
    
    /*
* Author      : 
* Method Name  :   getMatlGrp1List
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Material Group 1 in the picklist
*/
    public List<SelectOption> getMatlGrp1List()
    {
        matlGrp1List = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> matlGrp1StringList = request.requestServiceState.ogItems.listSelectedMG1;
        for(String mg1 : matlGrp1StringList)
        {
            matlGrp1List.add(new SelectOption(mg1,mg1));
        }
        return matlGrp1List;
    }
    
    /*
* Author      : 
* Method Name  :   setMatlGrp1List
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Material Group 1 in the picklist
*/
    public void setMatlGrp1List(List<SelectOption> mg1)
    {
        this.matlGrp1List = mg1;
    }
    
    /*
* Author      : 
* Method Name  :   getMarketSegmentList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Market Segment in the picklist
*/
    public List<SelectOption> getMarketSegmentList()
    {
        marketSegmentList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> marketSegmentStringList = request.requestServiceState.ogItems.listSelectedMG4;
        for(String ms : marketSegmentStringList)
        {
            marketSegmentList.add(new SelectOption(ms,ms));
        }
        return marketSegmentList;
    }
    
    /*
* Author      : 
* Method Name  :   setMarketSegmentList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Market Segment in the picklist
*/
    public void setMarketSegmentList(List<SelectOption> ms)
    {
        this.marketSegmentList = ms;
    }
    
    /*
* Author      : 
* Method Name  :   getTermsOfPaymentList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Terms Of Payment in the picklist
*/
    public List<SelectOption> getTermsOfPaymentList()
    {
        termsOfPaymentList = new List<SelectOption>();
        List<String> termsOfPaymentStringList = new List<String>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        //<PP20131022>
        termsOfPaymentStringList = request.requestServiceState.ogItems.listSelectedTOP;
        for(String tp : termsOfPaymentStringList)
        {
            termsOfPaymentList.add(new SelectOption(tp,tp));
        }
        return termsOfPaymentList;
    }
    
    /*
* Author      : 
* Method Name  :   setTermsOfPaymentList
* Parameters   :   List<SelectOption>
* Return type  :   void
* Description  :   This method sets the options for Terms Of Payment in the picklist
*/
    public void setTermsOfPaymentList(List<SelectOption> tp)
    {
        this.termsOfPaymentList = tp;
    }
    
    //Ver 2.9 END
    //<MS20140514> Adding Variant and Sales Order Type Lists START
    /*
* Author      :    Mohit Sinha
* Method Name  :   getVariantList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Variant in the picklist
*/
    public List<SelectOption> getVariantList()
    {
        variantList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> variantStringList = request.requestServiceState.ogItems.listSelectedVariant;
        for(String vs : variantStringList)
        {
            variantList.add(new SelectOption(vs,vs));
        }
        return variantList;
    }
    /*
* Author      :    Mohit Sinha
* Method Name  :   getContractList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Variant in the picklist
*/
    public List<SelectOption> getContractList()
    {
        contractList = new List<SelectOption>();
        string selectedBU = request.requestServiceState.ogItems.selectedBU;
        String salesArea,soldToName;
        if(request.pricingRequest.Sales_Org_Code__c!=null)
        {
            salesArea = request.pricingRequest.Sales_Org_Code__c+'-'+request.pricingRequest.Dist_Channel_Code__c+'-'+request.pricingRequest.Division_Code__c;           
            //<START> <AJ01282016> IS ID-00064810 Added if else condition as Contract# was not coming in drop down      
            //soldToName = request.pricingRequest.Sold_To__c;
            system.debug(Logginglevel.ERROR,'VJJJ@@@@@@@PricingRequestSoldTo1'+request);
            if(!string.isblank(request.pricingRequest.Sold_To__c))
            {
                soldToName = request.pricingRequest.Sold_To__c; 
                system.debug('$$$$$$$$VJVJVJ'+soldToName);
            }
            else
            {
                list<ERP_Customer__c> customerlist = new list<ERP_Customer__c>();
                system.debug(Logginglevel.ERROR,'@@@@@@@@@VJVJVJSource Filter'+request);
                system.debug(Logginglevel.ERROR,'@@@@@@@@@Source Filter'+request.soldToFilter);
                customerlist = [select name from ERP_Customer__c where Customer_Code__c =:request.soldToFilter limit 1];
                
                
                if(customerlist.size()>0) 
                    soldToName = customerlist[0].name;     
            }
            //<END> <AJ01282016>
        }
        List<Pricing_Contract__c> contracts =[SELECT Contract__c,Contract_No__c from Pricing_Contract__c where Sales_Area__c=:salesArea AND Customer__r.Name =:soldToName] ;
        List<String> contractStringList=new List<String>();
        for(Pricing_Contract__c contr : contracts)
        {
            contractStringList.add(contr.Contract_No__c+'-'+contr.Contract__c);
            
        }
        for(String vs : contractStringList)
        {
            contractList.add(new SelectOption(vs,vs));
        }
        return contractList;
    }
    /*
* Author      :    Mohit Sinha
* Method Name  :   getsalesOrderTypeList
* Parameters   :   No parameters
* Return type  :   List<SelectOption>
* Description  :   This method populates the options for Sales Order Type in the picklist
*/
    public List<SelectOption> getsalesOrderTypeList()
    {
        salesOrderTypeList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> salesOrderTypeStringList = request.requestServiceState.ogItems.listSelectedSOT;
        for(String sot : salesOrderTypeStringList)
        {
            salesOrderTypeList.add(new SelectOption(sot,sot));
        }
        return salesOrderTypeList;
    }
    
     public List<SelectOption> getPlantList()
    {
        PlantList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> PlantStringList = request.requestServiceState.ogItems.listSelectedPlant;
        for(String ps : PlantStringList)
        {
            PlantList.add(new SelectOption(ps,ps));
        }
        return PlantList;
    }
    
    public List<SelectOption> getShippingConditionList()
    {
        ShippingConditionList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> SCStringList = request.requestServiceState.ogItems.listSelectedShippingCondition;
        for(String sc : SCStringList)
        {
            ShippingConditionList.add(new SelectOption(sc,sc));
        }
        return ShippingConditionList;
    }
    
    public List<SelectOption> getDestinationCountryList()
    {
        DestinationCountryList = new List<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> DCStringList = request.requestServiceState.ogItems.listSelectedDestinationCountry;
        for(String dc : DCStringList)
        {
            DestinationCountryList.add(new SelectOption(dc,dc));
        }
        return DestinationCountryList;
    }
    public List<SelectOption> getCampaignList()
    {
        campaignList = new List<SelectOption>();
        set<SelectOption> campaignSet =new set<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> campaignStringList = request.requestServiceState.ogItems.listSelectedCampaign;
        for(String c : campaignStringList)
        {
            campaignSet.add(new SelectOption(c,c));
        }
        campaignList.addAll(campaignSet);
        campaignList.sort();
        return campaignList;
    }
    
    public void setCampaignList(List<SelectOption> c)
    {
        this.campaignList = c;
    }
    public List<SelectOption> getDocumentCurrencyList()
    {
        documentCurrencyList = new List<SelectOption>();
        set<SelectOption> documentCurrencySet =new set<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> documentCurrencyStringList = request.requestServiceState.ogItems.listSelectedDocumentCurrency;
        for(String c : documentCurrencyStringList)
        {
            documentCurrencySet.add(new SelectOption(c,c));
        }
        documentCurrencyList.addAll(documentCurrencySet);
        documentCurrencyList.sort();
        return documentCurrencyList;
    }
    public void setDocumentCurrencyList(List<SelectOption> c)
    {
        this.documentCurrencyList = c;
    }
    public List<SelectOption> getStateList()
    {
        stateList = new List<SelectOption>();
        set<SelectOption> stateSet =new set<SelectOption>();
        request.requestServiceState.ogItems.ogItemFromRequest(request.pricingRequest);
        List<String> stateStringList = request.requestServiceState.ogItems.listSelectedState;
        for(String c : stateStringList)
        {
            stateSet.add(new SelectOption(c,c));
        }
        stateList.addAll(stateSet);
        stateList.sort();
        return stateList;
    }
    
    public void setStateList(List<SelectOption> c)
    {
        this.stateList = c;
    }
    //<MS20140514> Adding Variant and Sales Order Type Lists END
    
    
    public List<PARelatedList> relatedWrappersList{get;set;}
    //Added for export all prices to CSV
    public List<PARelatedList> exportWrapList{get;set;}
    public PASalesPriceSAP( PARequest req) 
    { 
        this.request = req; 
    }
    
    public List<SObject> getListBusinessComponents()
    {
        return null;
    }
    public List<SelectOption> getListOptions()
    {
        return null;
    }
    
    public List<PARelatedList> getListWrappers() 
    {
        //<PP20130424> -- Ver 3.0
        String separator = PAUtil.determineLocaleSeparator();
        //<TJ20140522>
        //request.countOfPriceTables = 0;
        // created by shiva for getting SO, MPG, CPG codes from filters
        string splitSOFilterCode='';
        string splitSDFilterCode='';
        string splitMPGFilterCode='';
        string splitCPGFilterCode='';
        //<BB20130726> Ver 3.8 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Sales Type Incoterms START
        string splitIncotermsFilterCode='';
        //<BB20130726> Ver 3.8 ENDS
        //Ver 2.9 START
        String splitCountryFilterCode = '';
        String splitMarketSegFilterCode = '';
        String splitEndUseFilterCode = '';
        String splitPLTFilterCode = '';
        String splitPaymentTermsFilterCode = '';
        //Ver 2.9 END
        //<MS20140514> Adding Variant and Sales Order Type START
        String splitVariantFilterCode = '';
        String splitContractFilterCode = '';
        String splitSOTFilterCode = '';
        String splitSOIFilterCode = '';//<KS20220808>
        
        //SS20230501
        String splitVCFilterCode = '';
        String splitEMGFilterCode = '';
        String splitMG2FilterCode = '';
        String splitPZFilterCode = '';
        
        String splitComPartnerFilterCode = '';
        String splitMaterialGroup5KeyFilterCode = '';
        String splitPlantFilterCode = '';
        String splitSCFilterCode = '';
        String splitDCFilterCode = '';
        //<MS20140514> Adding Variant and Sales Order Type END
        //<PP20131028>
        String splitShipToCountryFilterCode = '';
        String splitMaterialGroup1FilterCode = '';
        string FinalPHCode='';
        
        String splitPartnerZFFilterCode='';
        String splitPayerFilterCode='';
        
        String splitCampaignFilterCode='';
        String splitDocumentCurrencyFilterCode='';
        String splitStateFilterCode='';
        Boolean materialFlag=false; //shiva
        //Distributor Changes START
        String splitDistFilterCode = '';
        //Distributor Changes END
        
        System.debug('*****cpg filter'+request.cpgFilter);
        System.debug('*****mpg filter'+request.mpgFilter);
        System.debug('*****soldTo filter'+request.soldToFilter);
        
        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Declaring a local variable which is used in the Floor, Reference Price query
        string conditionType='';
        
        List<PARelatedList> relatedList = new List<PARelatedList>(); 
        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Modified the list to Sobject
        List<Sobject> addFetchedList = new List<Sobject>();
        
        
        //added for displying SFDC KC description
        Map<String,String> kcIdandKcDescMap=new Map<String,String>(); 
        Boolean dispFetchedRecBoolean;
        if((request.pricingRequest.Dist_Channel_Code__c!=null && 
            request.pricingRequest.Division_Code__c!=null &&
            request.pricingRequest.Sales_Org_Code__c!=null) ||
           ((request.customer.paERPCustomer.Distribution_Channel_Code__c!=null &&
             request.customer.paERPCustomer.Division_Code__c!=null &&
             request.customer.paERPCustomer.Sales_Org_Code__c!=null))) 
        {
            String whereClause = ' ';
            String materialWhereClause = ' ';
            String salesAreaWhereClause = ' ';
            //making it a private variable 
            validOnFilter = request.pricingRequest.Due_date__c;
            boolean customerSpecificFlag = request.pricingRequest.Customer_Specific__c;
            String pricingRequestType;
            List<ERP_Sales_Prices_SAP__c> displayNonAddedList = new List<ERP_Sales_Prices_SAP__c>();
            //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Used to hold Non Added Non SAP list
            List<Sales_Prices__c> displayNonAddedNonSAPList = new List<Sales_Prices__c>();
            
            relatedList = new List<PARelatedList>();
            List<string> splitKCListFinal = new List<string>(); 
            //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Modifying the list to Sobject
            List<Sobject> displayFetchedList = new List<Sobject>(); 
            Set<string> finalKCSet = new Set<string>();
            List<String> finalKCSetList = new List<string>();
            Map<String,String> filterFieldsMap = new Map<String,String> ();
            ERP_Key_Combination__c keyCombCodeDesc = new ERP_Key_Combination__c();
            Map<String,List<ERP_Sales_Prices_SAP__c>> keyCombConcateRecordMap =new Map<String,List<ERP_Sales_Prices_SAP__c>>();
            //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Used to hold Key Combination MAP of Non SAP
            Map<String,List<Sales_Prices__c>> keyCombConcateNonSAPRecordMap =new Map<String,List<Sales_Prices__c>>();
            
            ERP_Pricing_Condition__c pricingCondCodeDesc = new ERP_Pricing_Condition__c();
            string PCKCconcat,selectedKCConcat,selectedPCCode;
            String pcSAPappId,pcSAPClientId,pcSAPClusterId;
            System.debug('&&&&'+request.pricingCondition.selectedPricingCondition+'&&&&selkey'+request.keyCombination.keyCombinationID);
            System.debug('&&&&'+request.keyCombination.PCLselectedKeyCombination+'&&&&'+request.pricingCondition.PCLselectedPricingCondition);
            //pcl
            //sanjib
            
            //<PP20140611>
            if(request.viewCustomerPrices != 'ViewCustomerPrices' && request.pricingCondition.selectedPricingCondition != null && request.keyCombination.keyCombinationID != null && request.keyCombination.keyCombinationID !='--Select--')
            {
                pricingCondCodeDesc = [SELECT Pricing_Condition_Code__c,Pricing_Condition_Description__c,SAP_Application_Id__c,SAP_Client_Id__c
                                       ,SAP_Cluster__c FROM ERP_Pricing_Condition__c WHERE Id = :request.pricingCondition.selectedPricingCondition];
                System.debug('####123'+request.keyCombination.keyCombinationID);
                keyCombCodeDesc = [SELECT Id,Key_Combination_Code__c,Key_Combination__c,SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c
                                   FROM ERP_Key_Combination__c WHERE Id = :request.keyCombination.keyCombinationID];
                PCKCconcat = pricingCondCodeDesc.Pricing_Condition_Code__c + '-' + pricingCondCodeDesc.Pricing_Condition_Description__c
                    + ' : ' + keyCombCodeDesc.Key_Combination_Code__c + '-' + keyCombCodeDesc.Key_Combination__c;
                selectedPCCode =  pricingCondCodeDesc.Pricing_Condition_Code__c;
                selectedKCConcat = keyCombCodeDesc.Key_Combination_Code__c + '-' + keyCombCodeDesc.Key_Combination__c;
                System.debug(' ***###PCcode '+selectedPCCode);
                pcSAPappId=pricingCondCodeDesc.SAP_Application_Id__c;
                pcSAPClientId=pricingCondCodeDesc.SAP_Client_Id__c;
                pcSAPClusterId=pricingCondCodeDesc.SAP_Cluster__c;
                System.debug('*****sapclusterid'+pcSAPClusterId+'@@@pcSAPClientId'+pcSAPClientId+'&&pcSAPappId'+pcSAPappId);
                //adding the condition for PCL since it doesnot have Dist Channel in PricingRequest
                string distChannelCode,divisionCode,salesOrgCode;
                string selectedBU = request.requestServiceState.ogItems.selectedBU;
                //Start CRM-2021-04-0192
                OrgGroup__c BUName=new OrgGroup__c();
                BUName = [SELECT Business__c from OrgGroup__c where id=:selectedBU];
                String BU = BUName.Business__c ;
                //End CRM-2021-04-0192
                if(request.pricingRequest.Sales_Org_Code__c!=null)
                {
                    distChannelCode = request.pricingRequest.Dist_Channel_Code__c;
                    divisionCode = request.pricingRequest.Division_Code__c;
                    salesOrgCode = request.pricingRequest.Sales_Org_Code__c;
                }
                else 
                {
                    distChannelCode = request.customer.paERPCustomer.Distribution_Channel_Code__c;
                    divisionCode = request.customer.paERPCustomer.Division_Code__c;
                    salesOrgCode = request.customer.paERPCustomer.Sales_Org_Code__c;
                }
                //for Export scenario since Request is not inserted we check the following logic    
                if(distChannelCode.contains('-') || divisionCode.contains('-') || salesOrgCode.contains('-'))
                {
                    distChannelCode = distChannelCode.subStringBefore('-').trim();
                    divisionCode = divisionCode.subStringBefore('-').trim();
                    salesOrgCode = salesOrgCode.subStringBefore('-').trim();
                }
                
                System.debug(' ***###PCcode1 '+selectedBU);
                System.debug(' ***###PCcode2 '+distChannelCode);
                System.debug(' ***###PCcode3 '+divisionCode);
                System.debug(' ***###PCcode4 '+salesOrgCode);
                System.debug(' ***###PCcode5 '+BU);
                
                //<AV20140515>-added isVolumeApplicable__c field
                Organizational_Group_Item__c buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                           Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c,isVolumeApplicable__c  FROM Organizational_Group_Item__c 
                                                           WHERE Business__c =:selectedBU /*IN (SELECT Id FROM OrgGroup__c WHERE BU__c = :request.pricingRequest.BU__c AND 
RecordType.Name = 'BU Differentiator')*/ AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                                                           AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :distChannelCode AND
                                                           OrgGroup__r.ERP_Division_Code__c = :divisionCode];
                
                //added for SFDC KC population -neeha                                 
                List<ERP_Access_Sequence__c> accSqList=new List<ERP_Access_Sequence__c>();
                if(request.pricingCondition.selectedPricingCondition!=null)
                {     
                    //Permanent           
                    //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Added condition to populate value for conditionType variable
                    //<PP20140502>
                    accSqList = [SELECT Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c,Pricing_Condition__r.Price_Types__c FROM ERP_Access_Sequence__c
                                 WHERE Pricing_Condition__c = :request.pricingCondition.selectedPricingCondition
                                 AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
                    //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Added condition to populate value for conditionType variable
                    if(accSqList!=null && accSqList.size()>0 && accSqList[0].Pricing_Condition__r.Price_Types__c!=null && (accSqList[0].Pricing_Condition__r.Price_Types__c.contains('Floor') || accSqList[0].Pricing_Condition__r.Price_Types__c.contains('Reference'))) {
                        conditionType=accSqList[0].Pricing_Condition__r.Price_Types__c;
                    }   
                }   
                for(ERP_Access_Sequence__c ac:accSqList)
                {
                    //<PP20140502>            
                    kcIdandKcDescMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.key_Combination_code__c,ac.Key_Combination__c);
                }                     
                //end-  added for SFDC KC population
                //NO SPOT IN SALES PRICE TYPE OF ERP SAP
                if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task')
                {
                    pricingRequestType= 'Permanent';
                }
                else
                {
                    if(conditionType.contains('Floor') || conditionType.contains('Reference'))
                        pricingRequestType='Floor';
                    
                    else if(request.pricingRequest.Pricing_Request_Type__c!=null)
                        pricingRequestType = request.pricingRequest.Pricing_Request_Type__c;
                    else
                        pricingRequestType= 'Permanent';
                }
                if(validOnFilter == null)
                {
                    throw new PAException(System.Label.Valid_On_Mandatory_Error,ApexPages.Severity.ERROR);  
                }
                //Commented by Shiva-- Satish instruction -- Start
                //else if(validOnFilter.daysBetween(System.now().date())>buOrgGroup.Retroactive_Limit__c || System.now().date().daysBetween(validOnFilter)>buOrgGroup.Max_Valid_From_Offset_Cust_Spec__c)
                //{
                //throw new PAException(System.Label.Valid_On_Date_Out_Of_Range_Error,ApexPages.Severity.ERROR);  
                //}
                //Commented by Shiva-- Satish instruction-- End
                else
                {
                    if(request.pricingRequest.Request_Type__c!=null)
                    {
                        if(request.pricingRequest.Request_Type__c!='Import'&&request.pricingRequest.Request_Type__c!='Massive')
                        {
                            System.debug('****request.customer.paERPCustomer.customer_code__c'+request.customer.paERPCustomer.customer_code__c);
                            request.soldToFilter = request.customer.paERPCustomer.customer_code__c;
                            //added -because request.customer.paERPCustomer.customer_code__c is null when user clicks on draft
                            if(request.customer.paERPCustomer.customer_code__c==null)
                            {
                                request.soldToFilter = request.pricingRequest.SoldTo_Code__c;
                            }
                        }
                    }
                    System.debug('*****soldTo filter'+request.soldToFilter);
                    if(request.soldToFilter == null)
                        request.soldToFilter='';
                    //Added - bala UAT Defect issue #75 Version 2.5
                    string MassiveWhereClause;
                    String user;
                    List<string> soldToCodeList = new List<string>();
                    if(request.pricingRequest.Request_Type__c!=null && request.pricingRequest.Request_Type__c.equalsIgnoreCase('Massive'))
                    {
                        if(request.pricingRequest.Id != null && request.pricingRequest.ownerId != null)
                        {
                            request.requestServiceState.ogItems.selectedUser = request.pricingRequest.ownerId;
                            system.debug('Entered in 1st IF Loop'+request.requestServiceState.ogItems.selectedUser);
                        }
                        if(String.isBlank(request.requestServiceState.ogItems.selectedUser))
                        {
                            request.requestServiceState.ogItems.selectedUser  = UserInfo.getUserId();
                            system.debug('Entered in 2nd IF Loop'+request.requestServiceState.ogItems.selectedUser);
                        }
                        if(request.pricingRequest.Id!=null)
                        {
                            user=request.PricingRequest.On_Behalf_Of__c;
                            system.debug('Entered in 3rd IF Loop'+user);
                        }
                        else
                        {
                            user=request.requestServiceState.ogItems.selectedUser;
                            system.debug('Entered in else Loop'+user);  
                        }
                        List<ERP_Customer__c> soldToList = [SELECT id,customer_code__c,Name FROM ERP_Customer__c WHERE Id IN
                                                            (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c='ZU'
                                                             AND User__c=:user
                                                             AND Related_ERP_Customer__c=NULL)
                                                            AND sales_Org_code__c=:request.pricingRequest.Sales_Org_Code__c
                                                            AND Distribution_Channel_Code__c=:request.pricingRequest.Dist_Channel_code__c
                                                            AND Division_code__c=:request.pricingRequest.division_code__c
                                                            AND customer_code__c like :request.soldToFilter+'%' AND Account_Group_Code__c ='Z001'];
                        for(ERP_Customer__c cus:soldToList)
                        {
                            soldToCodeList.add(cus.customer_code__c);
                        }
                        //<TJ20150521> START
                        if(keyCombCodeDesc.Key_Combination__c.contains('Sold to'))                                                  
                            MassiveWhereClause = ' AND Sold_To_Code__c IN:soldToCodeList';
                        else
                            MassiveWhereClause = '';
                        //<TJ20150521> END
                    }
                    system.debug('## soldToCodeList ***'+soldToCodeList);
                    if(keyCombCodeDesc!=null && keyCombCodeDesc.Key_Combination__c.contains('PH'))
                    {
                        Integer requiredLength;
                        if(keyCombCodeDesc.Key_Combination__c!=null)
                        {
                            system.debug('@#$!#@$'+keyCombCodeDesc.Key_Combination__c);
                            for(Integer i=1;i<=10;i++)
                            {
                                if(!keyCombCodeDesc.Key_Combination__c.contains('PH'+String.valueOf(i)))
                                {
                                    requiredLength = i-1;
                                    break;                    
                                }
                            }
                            system.debug('length: '+requiredLength);
                        }
                        if(!String.isBlank(request.phFilter))
                        {
                            //<SP20140520> START- commenting
                            //string redefinedPH=request.phFilter;
                            //for(Integer i=0; i<=request.phFilter.length();i++)
                            //{
                            //  if(redefinedPH.length() > request.lastPHLevelSelected*2)
                            // {
                            //      redefinedPH = redefinedPH.removeEnd('#');
                            //       system.debug('&&& redefinedPH in for '+redefinedPH);
                            //    }
                            //}
                            //system.debug('&&& redefinedPH '+redefinedPH);
                            //FinalPHCode = redefinedPH.replace('#','_');
                            // if(!String.isBlank(FinalPHCode) && FinalPHCode.length() == request.lastPHLevelSelected)
                            // {
                            //}
                            //else
                            //{
                            //    FinalPHCode =FinalPHCode+'__';
                            // }
                            //<SP20140520> END- commenting
                            
                            //<SP20140520> START
                            FinalPHCode = request.phFilter;
                            system.debug('%#$@#$%FinalPHCode'+FinalPHCode+FinalPHCode.length());
                            //if((FinalPHCode.length()/2)!=requiredLength)
                            //FinalPHCode =FinalPHCode+'__';
                            
                            //<SP20140520> END
                        }
                        else
                        {
                            FinalPHCode='%';
                        }
                        system.debug('&&& FinalPHCode '+FinalPHCode);
                    }
                    //the end version 2.6
                    if(request.shipToFilter == null)
                        request.shipToFilter='';
                    if(request.comPartnerFilter == null)
                        request.comPartnerFilter='';    
                    if(request.materialGroup5KeyFilter == '--Select--' || request.materialGroup5KeyFilter==''|| request.materialGroup5KeyFilter == null)
                    {
                        request.materialGroup5KeyFilter='';
                    }
                    else
                    {
                        splitMaterialGroup5KeyFilterCode=request.materialGroup5KeyFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }   
                    
                    if(request.materialGroup5KeyFilter == '--Select--' || request.materialGroup5KeyFilter==''|| request.materialGroup5KeyFilter == null)
                    {
                        request.materialGroup5KeyFilter='';
                    }
                    else
                    {
                        splitMaterialGroup5KeyFilterCode=request.materialGroup5KeyFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    if(request.cpgFilter == '--Select--' || request.cpgFilter==''|| request.cpgFilter == null)
                    {
                        request.cpgFilter='';
                    }
                    else
                    {
                        system.debug('*****request.cpgFilter--'+request.cpgFilter);
                        splitCPGFilterCode=request.cpgFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    //Jawahar <MJ20150511> Added code for Material Price Group filter for production issue - start 
                    if(request.mpgFilter == '--Select--' || request.mpgFilter==''|| request.mpgFilter == null)
                    {
                        request.mpgFilter='';
                    }
                    else
                    {
                        system.debug('*****request.mpgFilter--'+request.mpgFilter);
                        splitMPGFilterCode=request.mpgFilter.split('-',2)[0];
                    }
                    // <MJ20150511> Jawahar end
                    
                    //<BB20130726> Ver 3.8 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Incoterms
                    if(request.incotermsFilter == '--Select--' || request.incotermsFilter==''|| request.incotermsFilter == null)
                    {
                        request.incotermsFilter='';
                    }
                    else
                    {
                        system.debug('*****request.incoterms--'+request.incotermsFilter);
                        splitIncotermsFilterCode=request.incotermsFilter.split('-',2)[0];
                    }
                    //<BB20130726> Ver 3.8 ENDS 
                    
                    if(request.priceListTypeFilter == null|| request.priceListTypeFilter == '--Select--' || request.priceListTypeFilter=='')
                    {
                        request.priceListTypeFilter='';
                    }
                    else
                    {
                        splitPLTFilterCode=request.priceListTypeFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    //Ver 2.9 START
                    if(request.marketSegmentFilter == null|| request.marketSegmentFilter == '--Select--' || request.marketSegmentFilter=='')
                    {
                        request.marketSegmentFilter='';
                    }
                    else
                    {
                        splitMarketSegFilterCode=request.marketSegmentFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    system.debug('**request.materialGroup1Filter'+request.materialGroup1Filter);
                    if(request.materialGroup1Filter == null|| request.materialGroup1Filter == '--Select--' || request.materialGroup1Filter=='')
                    {
                        request.materialGroup1Filter='';
                    }
                    else
                    {
                       splitMaterialGroup1FilterCode=request.materialGroup1Filter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    if(request.endUseFilter == null|| request.endUseFilter == '--Select--' || request.endUseFilter=='')
                    {
                        request.endUseFilter='';
                    }
                    else
                    {
                        splitEndUseFilterCode=request.endUseFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    if(request.countryFilter == null|| request.countryFilter == '--Select--' || request.countryFilter=='')
                    {
                        request.countryFilter='';
                    }
                    else
                    {
                        splitCountryFilterCode=request.countryFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    if(request.paymentTermsFilter == null|| request.paymentTermsFilter == '--Select--' || request.paymentTermsFilter=='')
                    {
                        request.paymentTermsFilter='';
                    }
                    else
                    {
                        splitPaymentTermsFilterCode=request.paymentTermsFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    
                    if(request.priceRefPartnerFilter == null)
                        request.priceRefPartnerFilter='';
                    if(request.kcodeFilter == null)
                        request.kcodeFilter = '';
                    if(request.discRefNoFilter == null)
                        request.discRefNoFilter='';
                    if(request.fixValDateFilter == null)
                        request.fixValDateFilter='';   
                    //Distributor Changes START
                  if(request.distFilter == null|| request.distFilter == '--Select--' || request.distFilter=='')
                    {
                        request.distFilter='';
                    }
                    else{
                      splitDistFilterCode = request.distFilter.split('-',2)[0];
                    }
                    //Distributor Changes END                 
                    //Ver 2.9 END
                    //<MS20140514> Adding conditions for variant and sales order type START
                    if(request.variantFilter == null|| request.variantFilter == '--Select--' || request.variantFilter=='')
                    {
                        request.variantFilter='';
                    }
                    else
                    {
                        splitVariantFilterCode=request.variantFilter.split('-',2)[0];
                    }
                    if(request.contractFilter == null|| request.contractFilter == '--Select--' || request.contractFilter=='')
                    {
                        request.contractFilter='';
                    }
                    else
                    {
                        splitContractFilterCode=request.contractFilter.split('-',2)[0];
                    }
                    if(request.salesOrderTypeFilter == null|| request.salesOrderTypeFilter == '--Select--' || request.salesOrderTypeFilter=='')
                    {
                        request.salesOrderTypeFilter='';
                    }
                    else
                    {
                        splitSOTFilterCode=request.salesOrderTypeFilter.split('-',2)[0];
                    }
                    //<KS20220808>
                    if(request.salesOrderItemFilter== null|| request.salesOrderItemFilter== '--Select--' || request.salesOrderItemFilter=='')
                    {
                        request.salesOrderItemFilter='';
                    }
                    else
                    {
                        splitSOIFilterCode=request.salesOrderItemFilter.split('-',2)[0];
                    }

                    //SS20230501
                    if(request.valueCenterFilter== null|| request.valueCenterFilter== '--Select--' || request.valueCenterFilter=='')
                    {
                        request.valueCenterFilter='';
                    }
                    else
                    {
                        splitVCFilterCode=request.valueCenterFilter.split('-',2)[0];
                    }
                    if(request.extMaterialGroupFilter== null|| request.extMaterialGroupFilter== '--Select--' || request.extMaterialGroupFilter=='')
                    {
                        request.extMaterialGroupFilter='';
                    }
                    else
                    {
                        splitEMGFilterCode=request.extMaterialGroupFilter.split('-',2)[0];
                    }
                    if(request.materialGroup2Filter== null|| request.materialGroup2Filter== '--Select--' || request.materialGroup2Filter=='')
                    {
                        request.materialGroup2Filter='';
                    }
                    else
                    {
                        splitMG2FilterCode=request.materialGroup2Filter.split('-',2)[0];
                    }
                    if(request.prizeZoneFilter== null|| request.prizeZoneFilter== '--Select--' || request.prizeZoneFilter=='')
                    {
                        request.prizeZoneFilter='';
                    }
                    else
                    {
                        splitPZFilterCode=request.prizeZoneFilter.split('-',2)[0];
                    }




                    if(request.ComPartnerFilter == null|| request.ComPartnerFilter == '--Select--' || request.ComPartnerFilter=='')
                    {
                        request.ComPartnerFilter='';
                    }
                    else
                    {
                        splitComPartnerFilterCode=request.ComPartnerFilter.split('-',2)[0];
                    }
                    if(request.PayerFilter == null|| request.PayerFilter == '--Select--' || request.PayerFilter=='')
                    {
                        request.PayerFilter='';
                    }
                    else
                    {
                        splitPayerFilterCode=request.PayerFilter.split('-',2)[0];
                    }
                    if(request.partnerZFFilter == null|| request.partnerZFFilter == '--Select--' || request.partnerZFFilter=='')
                    {
                        request.partnerZFFilter='';
                    }
                    else
                    {
                        splitPartnerZFFilterCode=request.partnerZFFilter.split('-',2)[0];
                    }
                    if(request.PlantFilter == null|| request.PlantFilter == '--Select--' || request.PlantFilter=='')
                    {
                        request.PlantFilter='';
                    }
                    else
                    {
                        splitPlantFilterCode=request.PlantFilter.split('-',2)[0];
                    }
                    if(request.ShippingConditionFilter == null|| request.ShippingConditionFilter == '--Select--' || request.ShippingConditionFilter=='')
                    {
                        request.ShippingConditionFilter='';
                    }
                    else
                    {
                        splitSCFilterCode=request.ShippingConditionFilter.split('-',2)[0];
                    }
                    if(request.DestinationCountryFilter == null|| request.DestinationCountryFilter == '--Select--' || request.DestinationCountryFilter=='')
                    {
                        request.DestinationCountryFilter='';
                    }
                    else
                    {
                        splitDCFilterCode=request.DestinationCountryFilter.split('-',2)[0];
                    }
                    
                    //<MS20140514> Adding conditions for variant and sales order type END
                    
                    //<PP20131028> START
                    if(String.isBlank(request.shipToCountryFilter)|| request.shipToCountryFilter == '--Select--')
                    {
                        request.shipToCountryFilter='';
                    }
                    else
                    {
                        splitShipToCountryFilterCode=request.shipToCountryFilter.split('-',2)[0];
                    }
                    //<PP20131028> END
                    
                    //<VR20130509> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
                    if(request.customerHierarchyFilter == null)
                    {
                        request.customerHierarchyFilter='';
                    }
                    
                    //Ver 3.0 START
                    if(request.endUserFilter == null)
                        request.endUserFilter='';
                    //Ver 3.0 END
                    
                    if(request.salesOfficeFilter == null || request.salesOfficeFilter == '--Select--' || request.salesOfficeFilter=='')
                    {
                        request.salesOfficeFilter='';
                    }
                    else
                    {
                        splitSOFilterCode=request.salesOfficeFilter.split('-',2)[0];//Shiva changed split('-') to split('-',2) for production issue
                    }
                    if(request.salesDistrictFilter == null || request.salesDistrictFilter == '--Select--' || request.salesDistrictFilter=='')
                    {
                        request.salesDistrictFilter='';
                    }
                    else
                    {
                        splitSDFilterCode=request.salesDistrictFilter.split('-',2)[0];
                    }
                    if(request.profitCenterFilter == null)
                        request.profitCenterFilter='';
                    if(request.discRefFilter == null)
                        request.discRefFilter='';
                    if(request.campaignFilter == null|| request.campaignFilter == '--Select--' || request.campaignFilter=='')
                    {
                        request.campaignFilter='';
                    }
                    else
                    {
                        splitCampaignFilterCode=request.campaignFilter.split('-',2)[0];
                    }
                    if(request.documentCurrencyFilter == null|| request.documentCurrencyFilter == '--Select--' || request.documentCurrencyFilter=='')
                    {
                        request.documentCurrencyFilter='';
                    }
                    else
                    {
                        splitDocumentCurrencyFilterCode=request.documentCurrencyFilter.split('-',2)[0];
                    }
                    if(request.stateFilter == null|| request.stateFilter == '--Select--' || request.stateFilter=='')
                    {
                        request.stateFilter='';
                    }
                    else
                    {
                        splitStateFilterCode=request.stateFilter.split('-',2)[0];
                    }
                    if(request.ComPartnerFilter == null|| request.ComPartnerFilter == '--Select--' || request.ComPartnerFilter=='')
                    {
                        request.ComPartnerFilter='';
                    }
                    else
                    {
                        splitComPartnerFilterCode=request.ComPartnerFilter.split('-',2)[0];
                    }
                    if(request.PlantFilter == null|| request.PlantFilter == '--Select--' || request.PlantFilter=='')
                    {
                        request.PlantFilter='';
                    }
                    else
                    {
                        splitPlantFilterCode=request.PlantFilter.split('-',2)[0];
                    }
                    if(request.ShippingConditionFilter == null|| request.ShippingConditionFilter == '--Select--' || request.ShippingConditionFilter=='')
                    {
                        request.ShippingConditionFilter='';
                    }
                    else
                    {
                        splitSCFilterCode=request.ShippingConditionFilter.split('-',2)[0];
                    }
                    if(request.DestinationCountryFilter == null|| request.DestinationCountryFilter == '--Select--' || request.DestinationCountryFilter=='')
                    {
                        request.DestinationCountryFilter='';
                    }
                    else
                    {
                        splitDCFilterCode=request.DestinationCountryFilter.split('-',2)[0];
                    }
                    if(request.profitCenterFilter == null)
                        request.profitCenterFilter='';
                    if(request.discRefFilter == null)
                        request.discRefFilter='';
                    //if(customerSpecificFlag==true)
                    filterFieldsMap.put('SOLDTO', 'Sold_To_Code__c like \''+String.escapeSingleQuotes(request.soldToFilter)+ '%\'  ');
                    /*else
filterFieldsMap.put('SOLDTO', 'Sold_To_Code__c = \''+ '\'  ');*/
                    //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Added the condition since API name is different in Sales_Prices__c and ERP_Sales_Prices_SAP__c
                    if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
                        filterFieldsMap.put('PH', 'Product_Hierarchy_Code__c like \''+String.escapeSingleQuotes(FinalPHCode) +'\'');
                    }
                    else {
                        filterFieldsMap.put('PH', 'F_Product_Hierarchy_Code__c like \''+String.escapeSingleQuotes(FinalPHCode) +'\'');
                    }
                    
                    filterFieldsMap.put('SHIPTO', 'ShipTo_Code__c like \''+String.escapeSingleQuotes(request.shipToFilter) + '%\'  ');
                    if(request.mpgFilter != '')
                    {
                        system.debug('*****SplitMPGFilter***'+splitMPGFilterCode);
                        filterFieldsMap.put('MPG', 'Material_Price_Group_Code__c like \'%'+splitMPGFilterCode +'%\'');
                        filterFieldsMap.put('MATERIALPRICEGROUP', 'Material_Price_Group_Code__c like \'%'+splitMPGFilterCode +'%\'');
                    }
                    else
                    {
                        filterFieldsMap.put('MPG', 'Material_Price_Group_Code__c like \'' + '%\'  ');
                        filterFieldsMap.put('MATERIALPRICEGROUP', 'Material_Price_Group_Code__c like \'' + '%\'  ');
                    }
                    filterFieldsMap.put('CUSTOMERPRICEGROUP', 'Customer_Price_Group_Code__c like \''+String.escapeSingleQuotes(splitCPGFilterCode) + '%\'  ');
                    //<BB20130726> Ver 3.8 2013-07-26 APAC Rollout2-Adding Logic for Extra Key field Sales Type Incoterms STARTS
                    if(request.incotermsFilter!= '')
                    {
                        filterFieldsMap.put('INCOTERMS', 'Incoterms_1_Code__c like \''+splitIncotermsFilterCode + '\'  ');
                    }
                    else
                    {
                        filterFieldsMap.put('INCOTERMS', 'Incoterms_1_Code__c like \''+splitIncotermsFilterCode + '%\'  ');
                    }
                    //<BB20130726> Ver 3.8 ENDS
                    filterFieldsMap.put('PRICELISTTYPE', 'Price_List_Type_Code__c like \''+String.escapeSingleQuotes(splitPLTFilterCode) + '%\'  ');
                    filterFieldsMap.put('SALESOFFICE', 'Sales_Office_Code__c like \''+String.escapeSingleQuotes(splitSOFilterCode) + '%\'  ');
                    filterFieldsMap.put('SALESDISTRICT', 'Sales_District_Code__c like \''+String.escapeSingleQuotes(splitSDFilterCode) + '%\'  ');
                    filterFieldsMap.put('FRB', 'Profit_Center_Code__c like \''+String.escapeSingleQuotes(request.profitCenterFilter) + '%\'  ');
                    filterFieldsMap.put('DISCREF', 'Disc_Ref__c like \''+String.escapeSingleQuotes(request.discRefFilter) + '%\'  ');
                    filterFieldsMap.put('PROJECTID', 'Project_Id__c like \''+String.escapeSingleQuotes(request.discRefFilter) + '%\'  ');
                    filterFieldsMap.put('KCODE', 'Kcode__c like \''+String.escapeSingleQuotes(request.kcodeFilter) + '%\'  ');
                    filterFieldsMap.put('TERMSOFPAYMENT', 'Terms_of_Payment_Code__c like \''+String.escapeSingleQuotes(splitPaymentTermsFilterCode) + '%\'  ');
                    
                    //Ver 2.9 START
                    filterFieldsMap.put('ENDUSE', 'End_Use_Code__c like \''+String.escapeSingleQuotes(splitEndUseFilterCode) + '%\'  ');
                    filterFieldsMap.put('COUNTRY', 'Country_Code__c like \''+String.escapeSingleQuotes(splitCountryFilterCode) + '%\'  ');
                    filterFieldsMap.put('MARKETSEGMENT', 'Market_Segment_Code__c like \''+String.escapeSingleQuotes(splitMarketSegFilterCode) + '%\'  ');
                    filterFieldsMap.put('PRICEREF.PARTNER', 'Price_Ref_Partner_Code__c like \''+String.escapeSingleQuotes(request.priceRefPartnerFilter) + '%\'  ');
                    //Ver 2.9 END
                    //<MS20140514> Adding conditions for variant and sales order type START
                    filterFieldsMap.put('VARIANT', 'Variant_Code__c like \''+String.escapeSingleQuotes(splitVariantFilterCode) + '%\'  ');
                    //<START><AJ20160216> IS ID-00064810 Change as contract# were not queried correctly when fetching records for massive request by adding % at start of string also in like
                    filterFieldsMap.put('CONTRACTNO.', 'Contract_Code__c like \'%'+String.escapeSingleQuotes(splitContractFilterCode) + '%\'  ');
                    //<END><AJ20160216>
                    filterFieldsMap.put('SALESORDERTYPE', 'Sales_Order_Type_Code__c like \''+String.escapeSingleQuotes(splitSOTFilterCode) + '%\'  ');
                    //<SS20220826> START
                    filterFieldsMap.put('SALESORDERITEM', 'Sales_Order_Item_Code__c like \''+String.escapeSingleQuotes(splitSOIFilterCode) + '%\'  ');
                    //<SS20220826> END
                    //SS20230501 START
                    filterFieldsMap.put('VALUECENTER', 'Value_Center_Code__c like \''+String.escapeSingleQuotes(splitVCFilterCode) + '%\'  ');
                    filterFieldsMap.put('EXTMATLGRP', 'Ext_Matl_Grp_Code__c like \''+String.escapeSingleQuotes(splitEMGFilterCode) + '%\'  ');
                    filterFieldsMap.put('MATERIALGROUP2', 'Material_group_2_Code__c like \''+String.escapeSingleQuotes(splitMG2FilterCode) + '%\'  ');
                    filterFieldsMap.put('PRICEZONE', 'Price_Zone_Code__c like \''+String.escapeSingleQuotes(splitPZFilterCode) + '%\'  ');
                    //SS20230501 STOP
                    filterFieldsMap.put('COMPARTNER', 'ComPartner_Code__c like \''+String.escapeSingleQuotes(splitComPartnerFilterCode) + '%\'  ');
                    filterFieldsMap.put('MATERIALGROUP5KEY', 'Material_Group_5_Key_Code__c like \''+String.escapeSingleQuotes(splitMaterialGroup5KeyFilterCode) + '%\'  ');
                    filterFieldsMap.put('PLANT', 'Plant_Code__c like \''+String.escapeSingleQuotes(splitPlantFilterCode) + '%\'  ');
                    filterFieldsMap.put('SHIPPINGCONDITION', 'Shipping_Condition_code__c like \''+String.escapeSingleQuotes(splitSCFilterCode) + '%\'  ');
                    filterFieldsMap.put('DESTINATIONCOUNTRY', 'Destination_Country_Code__c like \''+String.escapeSingleQuotes(splitDCFilterCode) + '%\'  ');
                    //<MS20140514> END
                    //<PP20131028>
                    filterFieldsMap.put('SHIP-TOCOUNTRY', 'Ship_To_Country_Code__c like \''+String.escapeSingleQuotes(splitShipToCountryFilterCode) + '%\'  ');
                    
                    //Ver 3.0 START
                    filterFieldsMap.put('ENDUSER', 'End_User_Code__c like \''+String.escapeSingleQuotes(request.endUserFilter) + '%\'  ');
                    //Ver 3.0 END
                    //<VR20130510> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Condition for Customer Hierarchy filter value
                    filterFieldsMap.put('CUSTOMERHIERARCHY', 'Customer_Hierarchy_Code__c like \''+String.escapeSingleQuotes(request.customerHierarchyFilter) + '%\'  ');                    
                    filterFieldsMap.put('MATERIALGROUP1', 'Material_Group_1_Code__c like \''+String.escapeSingleQuotes(splitMaterialGroup1FilterCode) + '%\'  ');                   
                    filterFieldsMap.put('PAYER', 'Payer_Code__c like \''+String.escapeSingleQuotes(splitPayerFilterCode) + '%\'  ');
                    filterFieldsMap.put('PARTNERZF', 'Partner_ZF_Code__c like \''+String.escapeSingleQuotes(splitPartnerZFFilterCode) + '%\'  ');
                    filterFieldsMap.put('DISCREFNO', 'Disc_Ref_No__c like \''+String.escapeSingleQuotes(request.discRefNoFilter) + '%\'  ');
                    if(request.DFixValDate.Due_Date__c!=null)
                    {
                        /*   system.debug('Due_Date__c'+string.valueof(request.DFixValDate.Due_Date__c).split(' ')[0]);  
String dateValFilter=string.valueof(request.DFixValDate.Due_Date__c).split(' ')[0];*/
                        filterFieldsMap.put('FIXVALDATE', 'FixValDate__c ='+/*dateValFilter.split('-')[1]+dateValFilter.split('-')[2]+dateValFilter.split('-')[0]); */string.valueof(request.DFixValDate.Due_Date__c).split(' ')[0]);
                        
                    }
                    filterFieldsMap.put('CAMPAIGN', 'Campaign_Code__c like \''+String.escapeSingleQuotes(splitCampaignFilterCode) + '%\'  ');
                    filterFieldsMap.put('DOCUMENTCURRENCY', 'Document_Currency_Code__c like \''+String.escapeSingleQuotes(splitDocumentCurrencyFilterCode) + '%\'  ');
                    filterFieldsMap.put('STATE', 'State_Code__c like \''+String.escapeSingleQuotes(splitStateFilterCode) + '%\'  ');
                    filterFieldsMap.put('COMPARTNER', 'ComPartner_Code__c like \''+String.escapeSingleQuotes(splitComPartnerFilterCode) + '%\'  ');
                    filterFieldsMap.put('MATERIALGROUP5KEY', 'Material_Group_5_Key_Code__c like \''+String.escapeSingleQuotes(splitMaterialGroup5KeyFilterCode) + '%\'  ');
                    filterFieldsMap.put('PLANT', 'Plant_Code__c like \''+String.escapeSingleQuotes(splitPlantFilterCode) + '%\'  ');
                    filterFieldsMap.put('SHIPPINGCONDITION', 'Shipping_Condition_code__c like \''+String.escapeSingleQuotes(splitSCFilterCode) + '%\'  ');
                    filterFieldsMap.put('DESTINATIONCOUNTRY', 'Destination_Country_Code__c like \''+String.escapeSingleQuotes(splitDCFilterCode) + '%\'  ');
                    //Distributor Changes START
                    filterFieldsMap.put('DISTRIBUTOR','Distributor_Code__c like \''+String.escapeSingleQuotes(splitDistFilterCode) + '%\'  ');
                    //Distributor Changes END
                    if(request.keyCombination.KeyCombinationID != null)
                    {
                        keyCombCodeDesc = [SELECT Id,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id = :request.keyCombination.KeyCombinationID];
                        request.keyCombination.KeyCombinationName = keyCombCodeDesc.Key_Combination_Code__c + '-' + keyCombCodeDesc.Key_Combination__c; 
                        //<PP20131115> - Split the key Combination into 2 substrings
                        splitKCListFinal = request.keyCombination.KeyCombinationName.split('-',2)[1].split('/');
                        splitKCListFinal.sort();
                        //<TJ20141120> Adding Check for Landing Cost.
                        if(request.pricingRequest.Request_Type__c == 'Non Customer Specific' && keyCombCodeDesc!=null && keyCombCodeDesc.Key_Combination__c.containsIgnoreCase('Landing Cost'))
                        {   
                            filterFieldsMap.put('LANDINGCOST','Landing_Cost__c = false ');
                        }
                        if(request.requestServiceState.ogItems.value=='Export' && keyCombCodeDesc!=null && keyCombCodeDesc.Key_Combination__c.containsIgnoreCase('Landing Cost'))
                        {
                            filterFieldsMap.put('LANDINGCOST','Landing_Cost__c IN (false,true)');
                        }
                        for(Integer i=0; i<splitKCListFinal.size(); i++)
                        {
                            if(splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('SALESORG.')||splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('DIST.CHANNEL')||splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('DIVISION')||splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('SALESAREA')|| splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH1') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH2') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH3') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH4') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH5') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH6') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH7')  || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH8') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH9') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('MATERIAL'))
                            {
                                if(splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('MATERIAL'))
                                {
                                    
                                    materialFlag = true; //shiva
                                }
                            }
                            else
                            {
                                finalKCSet.add(splitKCListFinal[i]);
                            }
                            if(splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH1') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH2') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH3') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH4') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH5') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH6') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH7')  || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH8') || splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('PH9'))
                            {
                                finalKCSet.add('PH');
                                
                            }
                            if(splitKCListFinal[i].remove(' ').toUpperCase().equalsignorecase('Landing Cost'))
                            {
                                finalKCSet.add('LANDINGCOST');
                            }
                        } 
                        finalKCSetList.addall(finalKCSet);
                        finalKCSetList.sort();
                    }
                    // ADDED FOR SALES AREA
                    if(request.keyCombination.KeyCombinationName.remove(' ').toUpperCase().containsIgnoreCase('SALESORG.'))
                    {
                        salesAreaWhereClause = salesAreaWhereClause + 'AND Sales_Org_Code__c = :salesOrgCode ';
                    }
                    if(request.keyCombination.KeyCombinationName.remove(' ').toUpperCase().containsIgnoreCase('DIST.CHANNEL'))
                    {
                        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Added the condition since API name is different in Sales_Prices__c and ERP_Sales_Prices_SAP__c
                        if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
                            salesAreaWhereClause = salesAreaWhereClause + 'AND Dist_Channel_Code__c = :distChannelCode ';
                        }
                        else {
                            salesAreaWhereClause = salesAreaWhereClause + 'AND Distribution_Channel_Code__c = :distChannelCode ';   
                        }
                    }
                    if(request.keyCombination.KeyCombinationName.remove(' ').toUpperCase().containsIgnoreCase('DIVISION'))
                    {
                        salesAreaWhereClause = salesAreaWhereClause + 'AND Division_Code__c = :divisionCode '; 
                    }
                    //Start CRM-2021-04-0192
                    if( pcSAPclusterId == System.Label.SourceClusterCheckP80 && BUName != null ){
                            salesAreaWhereClause = salesAreaWhereClause + 'AND BU__c = :BU' ; 
                    } //End CRM-2021-04-0192                    
                    Set<String> finKCSet = new Set<String>();
                    List<String> finalKCList = new List<String>();
                    for(Integer i=0; i<splitKCListFinal.size(); i++)
                    {
                        string s = splitKCListFinal[i].remove(' ').toUpperCase();
                        if(s.remove(' ').toUpperCase().equalsignorecase('SALESORG.')||s.remove(' ').toUpperCase().equalsignorecase('DIST.CHANNEL')||s.remove(' ').toUpperCase().equalsignorecase('DIVISION')||s.remove(' ').toUpperCase().equalsignorecase('SOLDTO')||s.remove(' ').toUpperCase().equalsignorecase('SALESAREA'))
                        {}
                        else
                        {
                            finKCSet.add(splitKCListFinal[i]);
                        }
                    } 
                    finalKCList.addall(finKCSet);
                    finalKCList.sort();
                    System.debug('****conditionType'+conditionType+' '+finalKCSetList);
                    if(finalKCSetList.size() > 0)
                    {
                        whereClause = ' AND';
                        for(Integer i=0; i<finalKCSetList.size(); i++)
                        {
                            if(i != finalKCSetList.size()-1)
                            {
                                whereClause = whereClause+' '+filterFieldsMap.get(finalKCSetList[i].remove(' ').toUpperCase())+' '+' AND ';
                            }
                            else
                            {
                                whereClause = whereClause+' '+filterFieldsMap.get(finalKCSetList[i].remove(' ').toUpperCase());
                            }
                            
                        }
                    }
                    System.debug('1st Where Clause:'+whereClause);
                    
                    //Added case if fix valdate filer is null
                    if(whereClause.contains('AND null  AND'))
                        whereClause = whereClause.replace('AND null  AND', 'AND');
                    
                    //<TJ20141031>
                    /*if(validOnFilter!=null)
{
whereclause = whereClause + ' AND (Valid_From__c <= :validOnFilter AND Valid_To__c >= :validOnFilter)';
}*/                 
                    List<String> splitMaterialList = new List<String>(); 
                    if(!string.IsBlank(request.materialFilter))
                    {
                        List<string> splitMaterialListDummy = new List<string>(); 
                        System.debug('$$$ request.materialFilter $$ '+request.materialFilter.length());
                        String s1=   request.materialFilter.trim();
                        request.materialFilter=s1;
                        splitMaterialListDummy = request.materialFilter.split(',');
                        for(string X:splitMaterialListDummy)
                        {
                            splitMaterialList.add(X.trim());
                        }
                    }
                    System.debug('$$$$ splitMaterialList $$ '+splitMaterialList+'$$$$ splitMaterialList size $$ '+splitMaterialList.size());
                    //Shiva - WIP version 1.4 start
                    List<Material__c> activeMaterials = new List<Material__c>();
                    List<String> activeMaterialsList = new List<String>();
                    if(materialFlag)
                    {
                        
                        Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
                        //<VR20130510> Ver 3.1 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                        if(splitMaterialList.size()>0)
                        {
                            //<SP20140428> START
                            if(buOrgGroup.Enable_Variable_Config_Materials__c)
                            {
                                activeMaterials = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Deletion_Flag__c=false AND ERP_Source_Cluster__c=:pcSAPclusterId AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distChannelCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_Code__c IN :splitMaterialList AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:buOrgGroup.Enable_Variable_Config_Materials__c];
                            }
                            else
                            {
                                activeMaterials = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Deletion_Flag__c=false AND ERP_Source_Cluster__c=:pcSAPclusterId AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distChannelCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_Code__c IN :splitMaterialList];
                            }
                            //<SP20140428> END
                        }
                        else
                        {
                            //<SP20140428> START
                            if(buOrgGroup.Enable_Variable_Config_Materials__c)
                            {
                                activeMaterials = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Deletion_Flag__c=false AND ERP_Source_Cluster__c=:pcSAPclusterId AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distChannelCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:buOrgGroup.Enable_Variable_Config_Materials__c];
                            }
                            else
                            {
                                //<AV20152206>-Production-heap size error on export||Version 3.2
                                activeMaterials = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Deletion_Flag__c=false AND ERP_Source_Cluster__c=:pcSAPclusterId AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distChannelCode AND RecordTypeId = :Material_RTYPE_Id limit 25000];
                            }
                            //<SP20140428> END
                        }
                        system.debug('$$$ activeMaterials $$ '+activeMaterials);
                        system.debug('$$$ activeMaterials size $$ '+activeMaterials.size());
                        
                        for(Material__c X:activeMaterials)
                        {
                            activeMaterialsList.add(X.ERP_Material_Code__c);                    
                        }
                        //Version 3.2
                        activeMaterials.clear();
                        //activeMaterials = new List<Material__c> ();
                        // version 1.4 end
                        if(splitMaterialList.size()>0)
                        {
                            materialWhereClause =' AND (';
                            for(Integer i=0; i<splitMaterialList.size() ;i++)
                            {
                                if(i!=splitMaterialList.size()-1)
                                {
                                    materialWhereClause = materialWhereClause+'Material_Code__c like \''+String.escapeSingleQuotes(splitMaterialList[i])+ '%\'  '+' OR ';
                                    
                                }
                                else  
                                {
                                    materialWhereClause = materialWhereClause+'Material_Code__c like \''+String.escapeSingleQuotes(splitMaterialList[i])+ '%\') AND Material_Code__c IN:activeMaterialsList';
                                    
                                }
                            }
                        } 
                        else
                        {
                            materialWhereClause =' AND Material_Code__c IN: activeMaterialsList';
                        }
                        //activeMaterialsList = new List<String>();
                    }
                    
                    
                    system.debug('$$$ whereClause query $$ '+whereClause);
                    system.debug('$$$ massivewhereClause query $$ '+massiveWhereClause);
                    system.debug('$$$ materialWhereClause query $$ '+materialWhereClause);
                    System.debug('@@@ cust spec'+customerSpecificFlag+'@@@ type'+pricingRequestType+'@@@ Req.Type'+request.pricingRequest.Request_Type__c);
                    Id pricingProcedure = buOrgGroup.ERP_Pricing_Procedure__c;
                    String query;
                    system.debug('$$$ pricingProcedure$$ '+pricingProcedure);
                    string selectedKCCode = keyCombCodeDesc.Key_Combination_Code__c;
                    //<GT20150511>
                    kcCode = selectedKCCode;
                    //<AV20150703>- Production issue- Export issue A580Sd KC
                    if(selectedKCCode.length()>4 && (request.pricingRequest.Request_Type__c=='Massive' || pricingRequestType=='Permanent'))
                    {
                        selectedKCCode=selectedKCCode.substring(0,4);
                    }
                    string selectedKCDesc = keyCombCodeDesc.Key_Combination__c;
                    system.debug('$$$ pricingProcedure$$ '+selectedPCCode+pcSAPclusterId+pcSAPappId+pcSAPclientId+selectedKCCode+selectedKCDesc);
                    
                    //<VR20140116> - Support issue - To Export Sold To based on OnBehalfOf
                    Set<string> soldToIds = new Set<string>();
                    system.debug('request.pricingRequest.Request_Type__c value : '+request.pricingRequest.Request_Type__c);
                    if(request.requestServiceState.ogItems.value=='Export'||request.pricingRequest.Request_Type__c=='Import') {
                        if(!(string.isBlank(request.requestServiceState.ogItems.selectedUser) || string.isBlank(request.requestServiceState.ogItems.userName))) {
                            List<ERP_Relationship__c> erpRelationshipList = [SELECT ERP_Customer__r.Customer_Code__c FROM ERP_Relationship__c WHERE User__c=:request.requestServiceState.ogItems.selectedUser AND Partner_Function__c like 'SALES REP%'];          
                            for(ERP_Relationship__c erpRelationshipObj : erpRelationshipList) {
                                soldToIds.add(erpRelationshipObj.ERP_Customer__r.Customer_Code__c.trim());
                            }
                        }
                    }
                    //<MD20150328> - Start
                    Set<string> soldToMassiveIds = new Set<string>();
                    system.debug('request.pricingRequest.Request_Type__c value : '+request.pricingRequest.Request_Type__c);
                    if((request.pricingRequest.Request_Type__c=='Massive') && (request.requestServiceState.ogItems.value!='Export') && (request.pricingRequest.Request_Type__c!='Import')){
                        if(!(string.isBlank(user))) {
                            List<ERP_Relationship__c> erpRelationshipList = [SELECT ERP_Customer__r.Customer_Code__c FROM ERP_Relationship__c WHERE User__c=:user AND Partner_Function__c like 'SALES REP%'];          
                            for(ERP_Relationship__c erpRelationshipObj : erpRelationshipList) {
                                soldToMassiveIds.add(erpRelationshipObj.ERP_Customer__r.Customer_Code__c.trim());
                                System.debug('Sold To Ids for Massive Change Request'+soldToMassiveIds);
                            }
                        }
                    } 
                    //<MD20150328> - End
                    /*mapkcField = new map<string, List<String>>();
for (KeyFieldLabelAPIName__c kc : KeyFieldLabelAPIName__c.getAll().values())
{
if(!mapkcField.containsKey(kc.keyField__c))
{
mapkcField.put(kc.keyField__c,new List<String>{kc.apiName__c});
}
else
{
List<String>kcs = mapkcField.get(kc.keyField__c);
kcs.add(kc.apiName__c);
mapkcField.put(kc.keyField__c,kcs);
}
}*/
                    
                    string mandatoryFields;
                    keyfields = New List<String>();
                    keyfields = kfPop(splitKCListFinal);
                    System.debug('splitKCListFinal:'+splitKCListFinal);
                    //System.debug('keyfields: '+keyfields);
                    
                    /*for(integer indx=0;indx<splitKCListFinal.size();indx++)
{
if(mapkcField.get(splitKCListFinal[indx])!=null)
{
keyfields.addAll(mapkcField.get(splitKCListFinal[indx]));
}
}*/
                    
                    //allkcs = splitKCListFinal;          
                    
                    for(string str:keyfields )
                    {
                        System.debug('str:'+str+' conditionType:'+conditionType);
                        if(mandatoryFields ==null)
                            mandatoryFields='';
                        if((conditionType.contains('Floor') || conditionType.contains('Reference')) &&
                           !((str=='PH1__c')||(str=='PH2__c')||(str=='PH3__c')||(str=='PH4__c')||(str=='PH5__c')||(str=='PH6__c')||(str=='PH7__c')||(str=='PH8__c')||(str=='PH9__c')))
                            mandatoryFields +=','+str;
                        else if(!(conditionType.contains('Floor') ||conditionType.contains('Reference')))
                            mandatoryFields +=','+str;
                    }
                    
                    system.debug('mandatoryFields :'+mandatoryFields);
                    System.debug('materialWhereClause:'+materialWhereClause);
                    
                    
                    if(materialWhereClause != null)
                    {   //<AG20201222> Start (((REVERTED)))
                        query = 'SELECT BU__c,ShipTo__c,ShipTo_Code__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,Scale_UoM_Scale_Unit__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Customer_Specific__c,Scaled_Price_Flag__c,Product_Hierarchy_Code__c,Product_Hierarchy__C,Project__c,Key_Combination_Code__c,Calculation_Type__c,Condition_Class__c,Condition_Class_Code__c,Calculation_Type_Code__c,PCKC__C,Approved_Date__c,Sales_Price_Type__c,Key_Combination__c,Per__c,Pricing_Condition__c,Pricing_Condition_Code__c,Rate__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Unit__c,UoM__c,Valid_From__c,Valid_To__c,Price_Holder__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c,Plus_Minus_Code__c,Plus_Minus__c,Profit_Center__c,Profit_Center_Code__c';
                        //<AG20201222> End   (((REVERTED)))
                        System.debug('Query before :'+query); 
                        // system.debug('$$$ Sales Org  $$ '+salesOrgCode+' '+divisionCode+' '+distChannelCode +' '+selectedKCCode+' '+validOnFilter+' '+selectedPCCode);
                        ///<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Added the query for Sales_Prices__c object
                        if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
                            mandatoryFields = mandatoryFields+',Pricing_Request__r.SoldTo_Code__c,Pricing_Request__r.Sold_To__c'; //<SH20221125>
                            if(!mandatoryFields.contains('Dist_Channel_Code__c'))
                                mandatoryFields = mandatoryFields+',Dist_Channel_Code__c, Dist_Channel__c,Division_Code__c'; //<SH20221125>
                            query+=mandatoryFields+' FROM Sales_Prices__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND markForDeletion__c=false AND Sales_Price_Type__c = :conditionType' + salesAreaWhereClause + whereClause+materialWhereClause;
                            //query= 'SELECT BU__c, Contract__c,Contract_Code__c,Landing_Cost__c, PCKC__C,Ship_To_Country_Code__c,Ship_To_Country__c,ShipTo__c, ShipTo_Code__c, Calculation_Type_Code__c,Calculation_Type__c,Condition_Class_Code__c,Condition_Class__c,Plus_Minus_Code__c,Plus_Minus__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,Market_Segment__c,Market_Segment_Code__c,Project__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,Sales_Order_Type_Code__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c, Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND markForDeletion__c=false AND Sales_Price_Type__c = :conditionType' + salesAreaWhereClause + whereClause+materialWhereClause;
                        }
                        else if(request.requestServiceState.ogItems.value=='Export' || request.pricingRequest.Request_Type__c=='Import') 
                        {
                            //<PP20131022> - Added Terms_of_Payment__c in query
                            //<PP20131028>
                            //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                            //<VR20140116> - Support issue - Added extra where condition for onbehalfof check if Onbehalf is selected
                            //<MS20140515> Added Variant and SalesOrderType fields in the queries
                            //<SS20220826> Added Sales Order Item fields in queries.
                            //<SS20230501> Added M&M P80 key fields in query
                            if(!(string.isBlank(request.requestServiceState.ogItems.selectedUser) || string.isBlank(request.requestServiceState.ogItems.userName)) && request.pricingRequest.Customer_Specific__c) {
                                query= 'SELECT BU__C, PCKC__C,Ship_To_Country__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Project_Id__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c, Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE  Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null  AND Sales_Pricing_Procedure__c=:pricingProcedure AND Sold_To_Code__c IN :soldToIds' + salesAreaWhereClause + whereClause +materialWhereClause;  //version 1.4 added 'markForDeletion__c=false' in where clause
                                
                            }
                            
                            else {
                                //Updated by Kunal Sharma(752081) added one filter i.e mark for deletion in the below query on 2/4/2016 for IS ID-00059002 Start
                                query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Project_Id__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c, Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE  Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null  AND Sales_Pricing_Procedure__c=:pricingProcedure AND markForDeletion__c=false' + salesAreaWhereClause + whereClause +materialWhereClause;  //version 1.4 added 'markForDeletion__c=false' in where clause
                                //Updated by Kunal Sharma(752081) on 2/4/2016 for IS ID-00059002 End
                            }
                            
                            
                            //query= 'SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Project_Id__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c FROM ERP_Sales_Prices_SAP__c WHERE  Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null  AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause +materialWhereClause;  //version 1.4 added 'markForDeletion__c=false' in where clause            
                        }
                        //2.5 Bala -Added 
                        else if(request.pricingRequest.Request_Type__c!=null && request.pricingRequest.Request_Type__c.equalsIgnoreCase('Massive'))
                        {
                            //<PP20131022> - Added Terms_of_Payment__c in query
                            //<PP20131028>
                            //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                            //<MS20140515> Added Variant and SalesOrderType fields in the queries
                            //<TJ20150521>
                            //<MD20150328> - Start
                            //<SS20220826> Added Sales Order Item fields in queries.
                            //<SS20230501> Added M&M P80 key fields in query
                            if(selectedKCDesc.containsIgnorecase('Sold to')) //<SS20230501> -Added query in else condition for removing sold to code 
                            { 
                            query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure AND Sold_To_Code__C IN : soldToMassiveIds' + salesAreaWhereClause + whereClause +materialWhereClause+MassiveWhereClause; //version 1.4 added 'markForDeletion__c=false' in where clausease
                            }
                            else
                            {
                            query= 'SELECT BU__C,Ship_To_Country__c,Pricing_Request__r.SoldTo_Code__c,Pricing_Request__r.Sold_To__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause +materialWhereClause+MassiveWhereClause; //version 1.4 added 'markForDeletion__c=false' in where clause    
                            }
                                //<MD20150328> - End
                            system.debug(logginglevel.error,'query entered in Massive If Loop'+query);
                        }
                        else 
                        {
                            //<PP20131022> - Added Terms_of_Payment__c in query
                            //<PP20131028>
                            //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                            //<MS20140515> Added Variant and SalesOrderType fields in the queries
                            //query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM ERP_Sales_Prices_SAP__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause +materialWhereClause; //version 1.4 added 'markForDeletion__c=false' in where clause
                            //<NS20190304>Nadeem S Added ,Terms_of_Payment_Code__c,Terms_of_Payment__c
                            //mandatoryFields = mandatoryFields.replace('Dist_Channel_Code__c','Distribution_Channel_Code__c'); //<SH20221125>
                             //<SH20221125> - Start
                            if((mandatoryFields != null || mandatoryFields != '') & mandatoryFields.contains('Dist_Channel_Code__c')){
                                mandatoryFields = mandatoryFields.replace('Dist_Channel_Code__c','Distribution_Channel_Code__c');
                            }
                            else if ((mandatoryFields != null || mandatoryFields != '') & !mandatoryFields.contains('Distribution_Channel_Code__c')){
                                mandatoryFields += ',Distribution_Channel_Code__c';
                            }
                            else{
                                mandatoryFields = mandatoryFields;
                            }
                            if((mandatoryFields != null || mandatoryFields != '') & !mandatoryFields.contains('Division_Code__c')){
                                mandatoryFields += ',Division_Code__c';
                            }
                            
                            System.debug('After Dist:'+mandatoryFields);
                            query+=mandatoryFields+',Pricing_Request__r.SoldTo_Code__c,Pricing_Request__r.Sold_To__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,F_Product_Hierarchy_Code__c,Quantity__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause +materialWhereClause; //version 1.4 added 'markForDeletion__c=false' in where clause //<SH20221125>
                            //System.debug('query: '+query); 
                            //<SH20221125> - End
                        }
                    }
                    else
                    {   
                        // system.debug('$$$ Sales Org  $$ '+salesOrgCode+' '+divisionCode+' '+distChannelCode +' '+selectedKCCode+' '+validOnFilter+' '+selectedPCCode);
                        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Added the query for Sales_Prices__c
                        if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
                            query= 'SELECT BU__c, Contract__c,Contract_Code__c,Landing_Cost__c,PCKC__C,Ship_To_Country_Code__c,Ship_To_Country__c, ShipTo__c, ShipTo_Code__c, Calculation_Type_Code__c,Calculation_Type__c,Condition_Class_Code__c,Condition_Class__c,Plus_Minus_Code__c,Plus_Minus__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,Market_Segment__c,Market_Segment_Code__c,Project__c,Contract_Code__c,Contract__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,Sales_Order_Type_Code__c,Sales_Order_Item__c,Sales_Order_Item_Code__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM Sales_Prices__c WHERE Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND markForDeletion__c=false AND Sales_Price_Type__c = :conditionType' + salesAreaWhereClause + whereClause;
                        }
                        else if(request.requestServiceState.ogItems.value=='Export' || request.pricingRequest.Request_Type__c=='Import') 
                        {
                            //<PP20131022> - Added Terms_of_Payment__c in query
                            //<PP20131028>
                            //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                            //<VR20140116> - Support issue - Added extra where condition for onbehalfof check if Onbehalf of is selected
                            //<MS20140515> Added Variant and SalesOrderType fields in the queries
                            //<SS20220826> Added Sales Order Item fields in queries.
                            //<SS20230501> Added M&M P80 key fields in query
                            if(!(string.isBlank(request.requestServiceState.ogItems.selectedUser) || string.isBlank(request.requestServiceState.ogItems.userName))) {
                                query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Project_Id__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE  Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND  Sales_Pricing_Procedure__c=:pricingProcedure AND Sold_To_Code__c IN :soldToIds' +salesAreaWhereClause +whereClause;  //version 1.4 added 'markForDeletion__c=false' in where clause
                            }
                            else {
                                query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Project_Id__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name, Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE  Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND  Sales_Pricing_Procedure__c=:pricingProcedure' +salesAreaWhereClause +whereClause;  //version 1.4 added 'markForDeletion__c=false' in where clause
                            }
                            //query= 'SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Project_Id__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c FROM ERP_Sales_Prices_SAP__c WHERE  Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND  Sales_Pricing_Procedure__c=:pricingProcedure' +salesAreaWhereClause +whereClause;  //version 1.4 added 'markForDeletion__c=false' in where clause                
                        }
                        //2.5 Bala -Added 
                        else if(request.pricingRequest.Request_Type__c!=null && request.pricingRequest.Request_Type__c.equalsIgnoreCase('Massive'))
                        {
                            //<PP20131022> - Added Terms_of_Payment__c in query
                            //<PP20131028>
                            //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                            //<MS20140515> Added Variant and SalesOrderType fields in the queries
                            //<TJ20150521>
                            //<SS20220826> Added Sales Order Item fields in queries.
                            //<SS20230501> Added M&M P80 key fields in query
                            query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c, Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE   Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Key_Combination__c = :selectedKCDesc AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause+MassiveWhereClause; //version 1.4 added 'markForDeletion__c=false' in where clause
                            system.debug(logginglevel.error,'query entered in Massive else Loop'+query);
                        }
                        else 
                        {
                            //<PP20131022> - Added Terms_of_Payment__c in query
                            //<PP20131028>
                            //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                            //<MS20140515> Added Variant and SalesOrderType fields in the queries
                            //<SS20220826> Added Sales Order Item fields in queries.
                            //<SS20230501> Added M&M P80 key fields in query
                            query= 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c WHERE   Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause; //version 1.4 added 'markForDeletion__c=false' in where clause
                            
                        }
                    }
                    //Ver 2.1
                    /*if(totalERPRecords==null) 
totalERPRecords = database.query(query).size();*/
                    //query = 'SELECT BU__C,Ship_To_Country__c,PCKC__C,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c FROM ERP_Sales_Prices_SAP__c WHERE   Pricing_Condition_Code__c =:selectedPCCode AND SAP_Cluster__c = :pcSAPclusterId AND SAP_Application_Id__c = :pcSAPappId AND SAP_Client_Id__c = :pcSAPclientId AND Key_Combination_Code__c =:selectedKCCode AND Price_Holder__c != null AND Customer_Specific__c = :customerSpecificFlag AND  Sales_Price_Type__c = :pricingRequestType AND Sales_Pricing_Procedure__c=:pricingProcedure' + salesAreaWhereClause + whereClause; 
                    query = query + ' ORDER BY Approved_Date__c DESC';
                    system.debug(logginglevel.error,'query is '+query);
                    system.debug(logginglevel.error,'selectedPCCode  is '+selectedPCCode );
                    system.debug(logginglevel.error,'selectedKCCode  is '+selectedKCCode );
                    system.debug(logginglevel.error,'pcSAPclusterId  is '+pcSAPclusterId );
                    system.debug(logginglevel.error,'pcSAPappId   is '+pcSAPappId  );
                    system.debug(logginglevel.error,'pcSAPclientId   is '+pcSAPclientId  );
                    system.debug(logginglevel.error,'pricingProcedure   is '+pricingProcedure  );
                    system.debug(logginglevel.error,'salesOrgCode   is '+salesOrgCode  );
                    system.debug(logginglevel.error,'distChannelCode   is '+distChannelCode  );
                    system.debug(logginglevel.error,'divisionCode    is '+divisionCode   );
                    //system.debug(logginglevel.error,'selectedKCCode  is '+selectedKCCode );
                    
                    //<HL20150113> Added limit on export query.
                    //if (fetch100 ==false)
                    //query = query +' limit 1000';
                    //Added for export 100 recods from export page
                    //<TJ20141215> Added Fix for issue raised in Spinco
                    if(fetch100!=null && fetch100 ==true)
                    {
                        String q1 = query;
                        //<HL20150113> Added limit on export query.
                        //<AV20152206>-Production-heap size error on export
                        q1 = query+' limit 2000';
                        query = query;// +' limit 100';<HL20150511 commented limit 100 - Production issue fix for export>
                        system.debug(logginglevel.error,'query is '+query);
                        if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
                            countFetchedList = new List<Sales_Prices__c>();
                            countFetchedList = database.query(q1);
                        }
                        else{
                            countFetchedList = new List<ERP_Sales_Prices_SAP__c>();
                            countFetchedList = database.query(q1);
                        }
                        countFetchedList = changeValidityDates(countFetchedList);
                        fetch100 = false;
                    }
                    //query = query +' limit 400';
                    /*if(offsets !=null)
{
query+=' offset : offsets';
} */
                    //changing the limit to 50000
                    //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Initilizing the list with Non SAP object if the type is Floor or Reference
                    
                    if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
                        
                        if(request.requestServiceState.ogItems.value!='Export') query = query +' limit 500';
                        system.debug(logginglevel.error,'query inside floor ref is '+query);
                        displayFetchedList = new List<Sales_Prices__c>();//Review: add it outside
                        displayFetchedList = database.query(query);                        
                        system.debug('query@@'+selectedPCCode+','+pcSAPclusterId+','+pcSAPappId+','+pcSAPclientId+','+selectedKCCode+','+customerSpecificFlag+','+pricingRequestType+','+pricingProcedure+','+salesOrgCode+','+distChannelCode+','+divisionCode);
                        //system.debug('querylist$$'+activeMaterialsList+','+soldToCodeList);
                    }
                    else {
                        displayFetchedList = new List<ERP_Sales_Prices_SAP__c>();
                        if(request.requestServiceState.ogItems.value!='Export') {query = query +' limit 500';
                                                                                 system.debug(logginglevel.error,'query inside perm is '+query);
                                                                                }
                        //<HL20150702> added limit to avoid Heapsize issue in production
                        else{
                            query = query +' limit 1800'; //<SS20221025>
                        }  
                        displayFetchedList = database.query(query);
                        system.debug('query@@'+selectedPCCode+','+pcSAPclusterId+','+pcSAPappId+','+pcSAPclientId+','+selectedKCCode+','+customerSpecificFlag+','+pricingRequestType+','+pricingProcedure+','+salesOrgCode+','+distChannelCode+','+divisionCode);
                        //system.debug('querylist$$'+activeMaterialsList+','+soldToCodeList);
                    }
                    if(displayFetchedList.size()>0)
                    {
                        //<START> <vz3360> IS ID-00084272 Updated if condition >400 to >200 as nextpage link is not shown      
                        if(displayFetchedList.size()>=200)
                            //<END> <vz3360> IS ID-00084272 Updated if condition >400 to >200 as nextpage link is not shown
                            nextPage = true;
                        else
                            nextPage = false;   
                        
                        if(offsets!=null && offsets>0)
                        {
                            fromSet = offsets+1;
                            prevPage = true;
                            if(addFetchedList.size()<400)
                                toSet = offsets+displayFetchedList.size();
                            else
                                toSet = offsets+100;
                        }
                        else
                        {
                            fromSet = 1;
                            toSet = displayFetchedList.size();
                            prevPage = false;
                        }
                    }
                    
                    //activeMaterialsList = new List<String>();
                    
                    //Export OnBehalfOf based on Sold To
                    //<VR20140116> - Support issue - Commented as the condition is moved to query
                    if(addFetchedList.size()>=400)
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,'Search returned too many records, please use filers to refine the results'));                    
                    System.debug('$$$ dynamic query size $$ '+displayFetchedList.size());
                    System.debug('$$$ dynamic query size $$ '+displayFetchedList);                  
                    addFetchedList=changeValidityDates(displayFetchedList);
                    system.debug(addfetchedlist.size()+' '+validonfilter); 
                    displayFetchedList.clear();
                }
            }
            else if(Request.pricingCondition.PCLselectedPricingCondition!=null && Request.pricingCondition.PCLselectedPricingCondition.size()!=0 && Request.keyCombination.PCLselectedKeyCombination!=null && Request.keyCombination.PCLselectedKeyCombination.size()!=0){
                System.debug(' ***###PCcode1 '+request.requestServiceState.ogItems.selectedBU);
                System.debug(' ***###PCcode2 '+request.customer.paERPCustomer.Distribution_Channel_Code__c);
                System.debug(' ***###PCcode3 '+request.customer.paERPCustomer.Division_Code__c);
                System.debug(' ***###PCcode4 '+request.customer.paERPCustomer.Sales_Org_Code__c);
                System.debug(' ***###PCcode5 '+request.customer.paERPCustomer.Customer_code__c);
                String Applicationid;
                String Clientid;
                String Clusterid;
                list<ERP_Pricing_Condition__c> pricingCondCodeDescPCL=new list<ERP_Pricing_Condition__c>();
                list<ERP_Key_Combination__c> keyCombCodeDescPCL = new list<ERP_Key_Combination__c>();
                list<String> pclpclist=new list<String>();
                list<String> pclkclist=new list<String>();
                list<String> splitedKCListFinal=new list<String>();
                list<String> individualkeycomb=new list<String>();
                list<ERP_Access_Sequence__c> accessPCKC=new list<ERP_Access_Sequence__c>();
                pricingCondCodeDescPCL=[SELECT Pricing_Condition_Code__c,Pricing_Condition_Description__c FROM ERP_Pricing_Condition__c WHERE Id in :request.pricingCondition.PCLselectedPricingCondition];
                //to get the pricing cong codes
                for(ERP_Pricing_Condition__c pcl:pricingCondCodeDescPCL)
                {
                    pclpclist.add(pcl.Pricing_Condition_Code__c);
                }
                //1.3 starts             
                keyCombCodeDescPCL = [SELECT Id,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id in :Request.keyCombination.PCLselectedKeyCombination];
                //to get the kc codes and desc
                for(ERP_Key_Combination__c kc:keyCombCodeDescPCL){
                    Applicationid=kc.SAP_Application_Id__c;
                    Clientid=kc.SAP_Client_ID__c;
                    Clusterid=kc.SAP_Cluster__c;
                    //add key comb codes into list
                    pclkclist.add(kc.Key_Combination_Code__c);
                }
                //1.3 ends
                accessPCKC=[select Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Key_Combination__r.Key_Combination_Code__c,Pricing_Key_Combination__r.Key_Combination__c,Pricing_Condition__r.Pricing_Condition_Description__c from ERP_Access_Sequence__c where Pricing_Condition__r.Pricing_Condition_Code__c in:pclpclist and Pricing_Key_Combination__r.Key_Combination_Code__c in:pclkclist];
                //concate the pc kc desc
                for(ERP_Access_Sequence__c s:accessPCKC){
                    String b=s.Pricing_Condition__r.Pricing_Condition_Code__c+'-'+s.Pricing_Condition__r.Pricing_Condition_Description__c+':'+s.Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+s.Pricing_Key_Combination__r.Key_Combination__c;
                    individualkeycomb.add(b);
                }
                //added for SFDC KC population -neeha   
                Organizational_Group_Item__c    buOrgGroup=new Organizational_Group_Item__c();  
                List<Organizational_Group_Item__c> orgGroupItemsList = [select ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__c,Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c where Business__c =:request.requestServiceState.ogItems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c=: request.customer.paERPCustomer.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.customer.paERPCustomer.Distribution_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c=:request.customer.paERPCustomer.Division_Code__c ];                       
                
                if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0)
                {
                    buOrgGroup  =   orgGroupItemsList[0];  
                }   
                List<ERP_Access_Sequence__c> accSqList=new List<ERP_Access_Sequence__c>();  
                
                if(request.pricingCondition.PCLselectedPricingCondition!=null)
                {  
                    //PCL            
                    //<PP20140502>
                    accSqList = [SELECT Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c FROM ERP_Access_Sequence__c
                                 WHERE Pricing_Condition__c IN :request.pricingCondition.PCLselectedPricingCondition
                                 AND Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c order by sequence_Number__c];
                    
                }   
                for(ERP_Access_Sequence__c ac:accSqList)
                {
                    //<PP20140502>            
                    kcIdandKcDescMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                         + ac.Pricing_Key_Combination__r.key_Combination_code__c,ac.Key_Combination__c);
                }            
                System.debug(LoggingLevel.Error,'***kcIdandKcDescMap'+kcIdandKcDescMap);        
                //end-  added for SFDC KC population
                List<ERP_Sales_Prices_SAP__c> erpSales=new list<ERP_Sales_Prices_SAP__c>();
                
                //<AV20150610>-Start-Production issue-Logic to filter the query to display prices related to selected customer-Heap size error issue
                List<ERP_Relationship__c> shipToList = new List<ERP_Relationship__c>();
                List<ERP_Customer__c> shipToCustomersList = new List<ERP_Customer__c>();
                List<String> shipToCodesListPQ = new List<String>();
                List<Id> shipToIds = new List<Id>();
                Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
                shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                              FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                              AND Partner_Function_Code__c='WE'];
                for(ERP_Relationship__c X:shipToList)
                {
                    shipToIds.add(X.Related_ERP_Customer__c);
                }
                shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                                       AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                       Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                                       RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                                       AND Deletion_Flag__c = false];
                for(ERP_Customer__c X1 : shipToCustomersList)
                {
                    shipToCodesListPQ.add(X1.Customer_Code__c);
                    
                }
                
                
                List<String> endUserCodesListPQ = new List<String>();
                shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                              FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                              AND Partner_Function_Code__c IN ('ZH','ZQ') ];
                shipToIds = new List<Id>();
                for(ERP_Relationship__c X:shipToList)
                {
                    shipToIds.add(X.Related_ERP_Customer__c);
                }
                shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                                       AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                       Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                                       RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                                       AND Deletion_Flag__c = false];
                for(ERP_Customer__c X1 : shipToCustomersList)
                {
                    endUserCodesListPQ.add(X1.Customer_Code__c);
                    
                }
                
                
                List<String> partnerZFCodesListPQ = new List<String>();
                shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                              FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                              AND Partner_Function_Code__c IN ('ZF') ];
                shipToIds = new List<Id>();
                for(ERP_Relationship__c X:shipToList)
                {
                    shipToIds.add(X.Related_ERP_Customer__c);
                }
                shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                                       AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                       Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                                       RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                                       AND Deletion_Flag__c = false];
                for(ERP_Customer__c X1 : shipToCustomersList)
                {
                    partnerZFCodesListPQ.add(X1.Customer_Code__c);
                    
                }
                
                
                
                List<String> payerCodesListPQ = new List<String>();
                shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                              FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                              AND Partner_Function_Code__c IN ('RG') ];
                shipToIds = new List<Id>();
                for(ERP_Relationship__c X:shipToList)
                {
                    shipToIds.add(X.Related_ERP_Customer__c);
                }
                shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                                       AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                                       Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                                       RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                                       AND Deletion_Flag__c = false];
                for(ERP_Customer__c X1 : shipToCustomersList)
                {
                    payerCodesListPQ.add(X1.Customer_Code__c);
                    
                }
                
                
                //<VR20130509> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Extra field Customer Hierarchy in query
                //<PP20131022> - Added Terms_of_Payment__c in the query,//<PP20131024> - Removed Division_Code__c filter from the where clause
                //<PP20131028>, //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                //<VR20131125> - DTT Rollout issue - Added order by condition
                //<MS20140515> Added Variant and SalesOrderType fields in the queries
                //Added order by condition to fetch current Prices while generating PCL
                //<AJ20160314> IS ID-00065042,IS ID-00066124 Added ShipTo_Code__c!= NULL,End_User_Code__c != NULL, Partner_ZF_Code__c != NULL, Payer_Code__c != NULL in where clause
                //<SS20220826> Added Sales Order Item fields in queries.
                //<SS20230501> Added M&M P80 key fields in query
                erpSales=[SELECT BU__c,Ship_To_Country__c,PCKC__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c,Sales_Order_Item__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,SAP_Cluster__c,
                          Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,
                          End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,
                          Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
                          Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,
                          PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,
                          PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
                          Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,
                          Profit_Center_Code__c,project_id__C,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
                          Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,
                          SAP_Application_Id__c,SAP_Client_ID__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,
                          ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,
                          ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,
                          Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,
                          Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c 
                          WHERE Pricing_Condition_Code__c in :pclpclist AND Key_Combination_Code__c in:pclkclist and Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND (Sold_To_Code__c =: request.customer.paERPCustomer.Customer_code__c OR (Sold_To_Code__c = NULL  AND ShipTo_Code__c!= NULL AND ShipTo_Code__c IN :shipToCodesListPQ) OR (Sold_To_Code__c = NULL AND End_User_Code__c != NULL AND End_User_Code__c IN :endUserCodesListPQ) OR (Sold_To_Code__c = NULL AND Partner_ZF_Code__c != NULL AND Partner_ZF_Code__c IN :partnerZFCodesListPQ) OR (Sold_To_Code__c = NULL AND Payer_Code__c != NULL AND Payer_Code__c IN :payerCodesListPQ)) ORDER BY Approved_Date__c DESC limit 15000/*and Distribution_Channel_Code__c=:request.customer.paERPCustomer.Distribution_Channel_Code__c*/ /*and SAP_Cluster__c = :Clusterid AND SAP_Application_Id__c = :Applicationid AND SAP_Client_Id__c = :Clientid/* and Division_Code__c=:request.customer.paERPCustomer.Division_Code__c and Sold_To_Code__c=:request.customer.paERPCustomer.Customer_code__c and isPriceHolder__c=false and Price_Holder__c!=null and Sales_Pricing_Procedure__c=:buOrgGroup.ERP_Pricing_Procedure__c ORDER BY Approved_Date__c DESC limit 5000*/];
                
                
                //<AV20150610>-End-Production issue-Logic to filter the query to display prices related to selected customer-Heap size error issue          
                
                //erpSales=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salespriceobj','Pricing_Condition_Code__c in \''+pclpclist+'\'AND Key_Combination_Code__c in\''+pclkclist+'\'AND Sales_Org_Code__c=\''+request.customer.paERPCustomer.Sales_Org_Code__c+'\'AND SAP_Cluster__c =\''+Clusterid+'\'AND SAP_Application_Id__c =\''+Applicationid+'\'AND SAP_Client_Id__c =\''+Clientid+'\'AND Sold_To_Code__c=\''+request.customer.paERPCustomer.Customer_code__c+'\'and isPriceHolder__c=false and Price_Holder__c!=null and Sales_Pricing_Procedure__c=\''+buOrgGroup.ERP_Pricing_Procedure__c+'\' ORDER BY Approved_Date__c DESC limit 50000');
                displayFetchedList = erpSales;   
                System.debug(LoggingLevel.Error,'displayFetchedList!!!!!'+pclpclist+'displayFetchedList!!!!!'+pclkclist);
                System.debug(LoggingLevel.Error,'displayFetchedList!!!!!'+request.customer.paERPCustomer.Sales_Org_Code__c+'displayFetchedList!!!!!'+request.customer.paERPCustomer.Distribution_Channel_Code__c);
                System.debug(LoggingLevel.Error,'displayFetchedList!!!!!'+request.customer.paERPCustomer.Division_Code__c+'displayFetchedList!!!!!'+request.customer.paERPCustomer.Customer_code__c);
                //neeha- calling a private method which would manipulate the dates as required
                addFetchedList=changevalidityDates(displayFetchedList);
                for(ERP_Sales_Prices_SAP__c priceRec : erpSales){
                    PCKCconcat = priceRec.Pricing_Condition_Code__c+'-'+ priceRec.Pricing_Condition__c+' : '+priceRec.Key_Combination_Code__c+'-'
                        +priceRec.Key_Combination__c;
                    splitedKCListFinal = priceRec.Key_Combination__c.split('/');
                    splitedKCListFinal.sort();
                    for(Integer i=0; i<splitedKCListFinal.size(); i++)
                    {
                        String s1 = splitedKCListFinal[i].remove(' ').toUpperCase();
                        if(s1.remove(' ').toUpperCase().equalsignorecase('SALESORG.')||s1.remove(' ').toUpperCase().equalsignorecase('DIST.CHANNEL')||s1.remove(' ').toUpperCase().equalsignorecase('DIVISION')||s1.remove(' ').toUpperCase().equalsignorecase('SOLDTO')||s1.remove(' ').toUpperCase().equalsignorecase('SALESAREA'))
                        {}
                        else
                        {
                            finalKCSet.add(splitedKCListFinal[i]);
                        }                               
                    }
                    //columns
                    for(String s1 : finalKCSet)
                    {
                        finalKCSetList.add(s1);
                    }
                    finalKCSetList.sort();
                }   
            }
            // <BR20130718> added not to render for view prices  
            else if(Request.viewCustomerPrices!=null && Request.viewCustomerPrices!='ViewCustomerPrices' && Request.pricingCondition.PCLselectedPricingCondition!=null && Request.pricingCondition.PCLselectedPricingCondition.size()==0 && request.keyCombination.PCLselectedKeyCombination!=null && request.keyCombination.PCLselectedKeyCombination.size()==0)
            {
                system.debug('parmanent or any other flow except pcl should not come here');
                if(request.requestServiceState.ogItems.selectedBU !=null)
                {
                    list<Organizational_Group_Item__c> orgGroupItem=new list<Organizational_Group_Item__c>();
                    list<ERP_Pricing_Condition__c> pcListPC=new list<ERP_Pricing_Condition__c>();
                    list<ERP_Key_Combination__c> KCListKC=new list<ERP_Key_Combination__c>();
                    list<String> FALLPCList=new list<String>();
                    list<String> KClistKC1=new list<String>();
                    list<String> FALLKCList=new list<String>();
                    list<String> splitedKCListFinal=new list<String>();
                    set<String> KCSet=new set<String>();
                    list<ERP_Sales_Prices_SAP__c> erpSalesFetchAll=new list<ERP_Sales_Prices_SAP__c>();
                    orgGroupItem = [select ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__c,Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c where Business__c =:request.requestServiceState.ogItems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c=: request.customer.paERPCustomer.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.customer.paERPCustomer.Distribution_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c=:request.customer.paERPCustomer.Division_Code__c ];
                    
                    String applicationId;
                    String ClientId;
                    String ClusterId;  
                    //getting the pcs
                    pcListPC = [SELECT Pricing_Condition_Code__c,Pricing_Condition_Description__c FROM ERP_Pricing_Condition__c WHERE Id IN
                                (SELECT Pricing_Condition__c  FROM ERP_Procedure_Conditions__c WHERE Sales_Pricing_Procedure__c = :orgGroupItem.get(0).ERP_Pricing_Procedure__c)];
                    
                    //getting the kc depending upon pc
                    KCListKC = [SELECT Id,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN
                                (SELECT Pricing_Key_Combination__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :pcListPC 
                                 AND Sales_Pricing_Procedure__c = :orgGroupItem.get(0).ERP_Pricing_Procedure__c)];
                    system.debug(LoggingLevel.Error,'!!!kclist'+kcListKC.size());   
                    //added for SFDC KC population -neeha    
                    //<PP20140502>    
                    List<ERP_Access_Sequence__c>   accSqList = [SELECT Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Key_Combination__c,
                                                                Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c
                                                                FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :pcListPC
                                                                AND Sales_Pricing_Procedure__c = :orgGroupItem.get(0).ERP_Pricing_Procedure__c order by sequence_Number__c];       
                    for(ERP_Access_Sequence__c ac:accSqList)
                    {
                        //<PP20140502>
                        kcIdandKcDescMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                             + ac.Pricing_Key_Combination__r.key_Combination_code__c,ac.Key_Combination__c);
                    }
                    System.debug(LoggingLevel.Error,'****kcIdandKcDescMap'+kcIdandKcDescMap);
                    //end-  added for SFDC KC population  
                    //getting the string pcs 
                    for(ERP_Pricing_Condition__c pc:pclistPC)
                    {
                        FALLPCList.add(pc.Pricing_Condition_Code__c);
                    }
                    for(ERP_Key_Combination__c kc:KClistKC)
                    {
                        applicationId=kc.SAP_Application_Id__c;
                        ClientId=kc.SAP_Client_ID__c;
                        ClusterId=kc.SAP_Cluster__c;
                        if(kc.Key_Combination__c.contains('Sold to') ||kc.Key_Combination__c.contains('Ship to') ||kc.Key_Combination__c.contains('End User')) {
                            FALLKCList.add(kc.Key_Combination_Code__c);
                        }
                    }
                    //<VR20130509> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Extra field Customer Hierarchy in query
                    //<PP20131022> - Added Terms_of_Payment__c to the query
                    //<PP20131024>
                    //<PP20131028>
                    //<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
                    //<MS20140515> Added Variant and SalesOrderType fields in the query
                    /*erpSalesFetchAll=[SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,
End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,
Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,
PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,
PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,
SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,
ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,
ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,
ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,
Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,
Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c FROM ERP_Sales_Prices_SAP__c 
WHERE Pricing_Condition_Code__c in :FALLPCList AND Key_Combination_Code__c in :FALLKCList and Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c /*and Distribution_Channel_Code__c=:request.customer.paERPCustomer.Distribution_Channel_Code__c and Division_Code__c=:request.customer.paERPCustomer.Division_Code__c and Sold_To_Code__c=:request.customer.paERPCustomer.Customer_code__c and SAP_Application_Id__c  =:applicationId and SAP_Client_ID__c=:ClientId and SAP_Cluster__c=:ClusterId and isPriceHolder__c=false and Price_Holder__c!=null and Sales_Pricing_Procedure__c=:orgGroupItem.get(0).ERP_Pricing_Procedure__c ORDER BY Approved_Date__c DESC limit 50000];*/
                    erpSalesFetchAll=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salespriceobj','Pricing_Condition_Code__c in\''+FALLPCList+'\'AND Key_Combination_Code__c in \''+FALLKCList+'\' and Sales_Org_Code__c=\''+request.customer.paERPCustomer.Sales_Org_Code__c+'\'and Sold_To_Code__c=\''+request.customer.paERPCustomer.Customer_code__c+'\'and SAP_Application_Id__c  =\''+applicationId+'\' and SAP_Client_ID__c=\''+ClientId+'\'and SAP_Cluster__c=\''+ClusterId+'\'and isPriceHolder__c=false and Price_Holder__c!=null and Sales_Pricing_Procedure__c=\''+orgGroupItem.get(0).ERP_Pricing_Procedure__c+'\'ORDER BY Approved_Date__c DESC limit 50000');
                    System.debug(LoggingLevel.Error,'*****list from query'+erpSalesFetchAll.size());
                    displayFetchedList = erpSalesFetchAll; 
                    //sanjib edited after price holder
                    ///****neeha- calling a private method which would manipulate the dates as required/
                    addFetchedList=changevalidityDates(displayFetchedList);
                }
            }
            // <BR20130718>               
            if(request.viewCustomerPrices=='ViewCustomerPrices')
            {
                System.debug('validOnFilter***'+validOnFilter);
                //<PP20140502> START
                if(request.requestServiceState.ogItems.selectedBU != null)
                {
                    List<ERP_Pricing_Condition__c> pcList = new List<ERP_Pricing_Condition__c>();
                    List<ERP_Key_Combination__c> kcList = new List<ERP_Key_Combination__c>();
                    List<ERP_Access_Sequence__c> accSeqList = new List<ERP_Access_Sequence__c>();
                    String applicationId, clientId, clusterId;
                }
                List<Organizational_Group_Item__c> ogiList = new List<Organizational_Group_Item__c>();
                Organizational_Group_Item__c ogi = new Organizational_Group_Item__c();
                if(request.pricingRequest.Request_Type__c == 'Non Customer Specific' || request.pricingRequest.Request_Type__c == 'Massive')
                    ogiList = [SELECT Id, ERP_Pricing_Procedure__c, ERP_Pricing_Procedure__r.SAP_Cluster__c,ERP_Pricing_Procedure__r.SAP_Application_Id__c,ERP_Pricing_Procedure__r.SAP_Client_Id__c, Enable_Variable_Config_Materials__c FROM
                               Organizational_Group_Item__c WHERE Business__c = :request.requestServiceState.ogItems.selectedBU AND
                               OrgGroup__r.ERP_Sales_Org_Code__c = : request.pricingRequest.Sales_Org_Code__c AND
                               OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c AND
                               OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
                else
                    ogiList = [SELECT Id, ERP_Pricing_Procedure__c, ERP_Pricing_Procedure__r.SAP_Cluster__c, Enable_Variable_Config_Materials__c FROM
                               Organizational_Group_Item__c WHERE Business__c = :request.requestServiceState.ogItems.selectedBU AND
                               OrgGroup__r.ERP_Sales_Org_Code__c = : request.customer.paERPCustomer.Sales_Org_Code__c AND
                               OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                               OrgGroup__r.ERP_Division_Code__c = :request.customer.paERPCustomer.Division_Code__c];
                system.debug('ogiList'+ogiList);
                if(ogiList.size() >0 )
                {
                    ogi = ogiList[0];
                }
                //Retrieving the access sequences for the pricing procedure
                List<ERP_Access_Sequence__c> accSeqList = new List<ERP_Access_Sequence__c>();
                //system.debug('request.requestServiceState.ogItems.isEndUserRebate is '+request.requestServiceState.ogItems.isEndUserRebate);
                //IM20150210 To get only RPQ Access Sequences
                /*if(request.requestServiceState.ogItems.isEndUserRebate)
accSeqList = [SELECT Id, Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c,
Sequence_Number__c,Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Condition__r.Pricing_Condition__c FROM ERP_Access_Sequence__c WHERE
Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c and Is_End_User_Rebate__c=true];
else*/
                if(request.requestServiceState.ogItems.isEndUserRebate)
                    accSeqList = [SELECT Id, Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c,
                                  Sequence_Number__c,Pricing_Condition__r.Pricing_Condition_Code__c,Pricing_Condition__r.Pricing_Condition__c FROM ERP_Access_Sequence__c WHERE
                                  Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c and Is_End_User_Rebate__c=true];
                else
                    accSeqList = [SELECT Id, Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c, Key_Combination__c,
                                  Sequence_Number__c,Pricing_Condition__r.Pricing_Condition_Code__c FROM ERP_Access_Sequence__c WHERE
                                  Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c];  
                for(ERP_Access_Sequence__c ac : accSeqList)
                {
                    System.debug('putting Key:'+ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_code__c+'- Value:'+ac.Key_Combination__c);
                    kcIdandKcDescMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_code__c,
                                         ac.Key_Combination__c);
                }
                
                for(String key: kcIdandKcDescMap.keySet())
                    System.debug('kcIdandKcDescMap:'+key +'-'+ kcIdandKcDescMap.get(key));
                //if(request.requestServiceState.ogItems.isEndUserRebate){
                //if(accSeqList!=null && accSeqList.size()!=0)
                //pcKCSelected = accSeqList[0].Pricing_Condition__r.Pricing_Condition_Code__c+'-'+accSeqList[0].Pricing_Condition__r.Pricing_Condition__c+' : '+accSeqList[0].Pricing_Key_Combination__r.Key_Combination_Code__c+'-'+accSeqList[0].Key_Combination__c;
                //}
                
                addFetchedList = retrievePriceRecords(ogi);
                system.debug(logginglevel.error,'*******addfetchedlist'+addfetchedlist);
                system.debug(logginglevel.error,'*******addfetchedlistsize'+addfetchedlist.size());
                /*if(request.requestServiceState.ogItems.selectedBU !=null){
list<Organizational_Group_Item__c> orgGroupItem=new list<Organizational_Group_Item__c>();
list<ERP_Pricing_Condition__c> pcListPC=new list<ERP_Pricing_Condition__c>();
list<ERP_Key_Combination__c> kcListKC=new list<ERP_Key_Combination__c>();
list<String> ViewPricesPCList=new list<String>();
list<String> ViewPricesKCList=new list<String>();
list<String> splitedKCListFinal=new list<String>();
set<String> KCSet=new set<String>();
list<ERP_Sales_Prices_SAP__c> erpSalesViewPrices=new list<ERP_Sales_Prices_SAP__c>();
system.debug('request.requestServiceState.ogItems.selectedBU***'+request.requestServiceState.ogItems.selectedBU
+'**'+request.customer.paERPCustomer.Sales_Org_Code__c+'**'+request.customer.paERPCustomer.Distribution_Channel_Code__c
+'**'+request.customer.paERPCustomer.Division_Code__c);
orgGroupItem = [select ERP_Pricing_Procedure__r.id,ERP_Pricing_Procedure__c,Enable_Variable_Config_Materials__c FROM Organizational_Group_Item__c where Business__c =:request.requestServiceState.ogItems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c=: request.customer.paERPCustomer.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:request.customer.paERPCustomer.Distribution_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c=:request.customer.paERPCustomer.Division_Code__c ];

String applicationId;
String ClientId;
String ClusterId;  
//getting the pcs
pcListPC = [SELECT Pricing_Condition_Code__c,Pricing_Condition_Description__c FROM ERP_Pricing_Condition__c WHERE Id IN
(SELECT Pricing_Condition__c  FROM ERP_Procedure_Conditions__c WHERE Sales_Pricing_Procedure__c = :orgGroupItem.get(0).ERP_Pricing_Procedure__c)];

//getting the kc depending upon pc
KCListKC = [SELECT Id,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Key_Combination_Code__c,Key_Combination__c FROM ERP_Key_Combination__c WHERE Id IN
(SELECT Pricing_Key_Combination__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :pcListPC 
AND Sales_Pricing_Procedure__c = :orgGroupItem.get(0).ERP_Pricing_Procedure__c)];
system.debug(logginglevel.error,'!!!kclist'+kcListKC.size());   
//added for SFDC KC population -neeha    
List<ERP_Access_Sequence__c>   accSqList = [SELECT Pricing_Key_Combination__c,Pricing_Key_Combination__r.key_Combination_code__c,Key_Combination__c,sequence_Number__c FROM ERP_Access_Sequence__c
WHERE Pricing_Condition__c IN :pcListPC
AND Sales_Pricing_Procedure__c = :orgGroupItem.get(0).ERP_Pricing_Procedure__c order by sequence_Number__c];       
for(ERP_Access_Sequence__c ac:accSqList)
{
kcIdandKcDescMap.put(ac.Pricing_Key_Combination__r.key_Combination_code__c,ac.Key_Combination__c);
}
System.debug('****kcIdandKcDescMap'+kcIdandKcDescMap);
//end-  added for SFDC KC population  
//getting the string pcs 
for(ERP_Pricing_Condition__c pc:pclistPC)
{
ViewPricesPCList.add(pc.Pricing_Condition_Code__c);
}

for(ERP_Key_Combination__c kc:KClistKC)
{
applicationId=kc.SAP_Application_Id__c;
ClientId=kc.SAP_Client_ID__c;
ClusterId=kc.SAP_Cluster__c;
if(kc.Key_Combination__c.contains('Sold to') ||kc.Key_Combination__c.contains('Ship to')
||kc.Key_Combination__c.contains('End User'))
{
ViewPricesKCList.add(kc.Key_Combination_Code__c);
}
}
System.debug(logginglevel.error,ViewPricesKCList.size()+'***In VIEW CUST PRICES'+ViewPricesKCList);
//<VR20130509> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Extra field Customer Hierarchy in query
//<PP20130923> -- Removed distribution channel code and division code from query as they may not be in the key combination
//<PP20131022> - Added Terms_of_Payment__c to the query
//<PP20131028>
//<VR20131030> - DTT Rollout issue - Added pricing procedure in the where condition
erpSalesViewPrices=[SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Sales_Order_Item_Code__c,Sales_Order_Item__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,
End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,
Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,
PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,
PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,
Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,
SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,
ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,
ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,
ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,
Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,
Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c FROM ERP_Sales_Prices_SAP__c 
WHERE Pricing_Condition_Code__c in :ViewPricesPCList AND Key_Combination_Code__c in :ViewPricesKCList and Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c and Sold_To_Code__c=:request.customer.paERPCustomer.Customer_code__c and SAP_Application_Id__c  =:applicationId and SAP_Client_ID__c=:ClientId and SAP_Cluster__c=:ClusterId and isPriceHolder__c=false and Price_Holder__c!=null and Sales_Pricing_Procedure__c=:orgGroupItem.get(0).ERP_Pricing_Procedure__c ORDER  BY Approved_Date__c DESC limit 50000];

System.debug('*****list from query'+erpSalesViewPrices.size());
System.debug('*****list from query'+ViewPricesKCList);
System.debug('*****list from query'+ViewPricesPCList);
System.debug('*****list from query'+request.customer.paERPCustomer.Sales_Org_Code__c
+'*****list from query'+request.customer.paERPCustomer.Distribution_Channel_Code__c
+'*****list from query'+request.customer.paERPCustomer.Division_Code__c
+'*****list from query'+request.customer.paERPCustomer.Customer_code__c
+'*****list from query'+applicationId+'**'+clusterId+'**'+ClientId);
displayFetchedList = erpSalesViewPrices; 
//to be removed- start
/**set<string> prjtIdTest = new set<string>();
for(ERP_Sales_Prices_SAP__c X: erpSalesViewPrices)
{
prjtIdTest.add(X.project_id__c);
}
system.debug(logginglevel.error,'# Prjt Test '+prjtIdTest);
system.debug(logginglevel.error,'# Prjt Test size - '+prjtIdTest.size());**/
                //to be removed- end
                //sanjib edited after price holder
                ///****neeha- calling a private method which would manipulate the dates as required/
                /*addFetchedList=changevalidityDates(displayFetchedList);
} */
                //    
                
            }
            if(addFetchedList.size() > 900)
            {
                dispFetchedRecBoolean = false;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, System.Label.More_Than_1000_Pricing_Records_Warning);  
                ApexPages.addMessage(myMsg);
            }
            system.debug(addFetchedList.size());
            if(addFetchedList.size() == 0)
            {
                dispFetchedRecBoolean = false;
                // <BR20130718> added if condition not to render for View prices
                if(Request.viewCustomerPrices!='ViewCustomerPrices')
                {
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, System.Label.No_Pricing_Records_Warning);  
                    ApexPages.addMessage(myMsg);
                }
                // <BR20130718>
                /*if(request.currentPricesSelection!=null && request.currentPricesSelection.containsIgnoreCase('Expiring By') && request.validOnDateViewCustomerprices!=null && request.validOnDateViewCustomerprices<System.today())
{
ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Please select present or future Date'); 
ApexPages.addMessage(myMsg);  
}
else */if(Request.viewCustomerPrices=='ViewCustomerPrices'  && request.customer!=null && request.customer.currentPrices!=null && request.customer.currentPrices != 'viewPricesOnLoad'
          && !request.customer.currentPrices.containsIgnoreCase('ExpOnly')){
              throw new PAException(System.Label.No_View_Prices_records,ApexPages.Severity.WARNING);
          }
                else if(Request.viewCustomerPrices=='ViewCustomerPrices' && request.customer!=null && request.customer.currentPrices!=null && (request.customer.currentPrices == 'viewPricesOnLoad'
                                                                                                                                               || request.customer.currentPrices.containsIgnoreCase('ExpOnly')))
                {
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, System.Label.No_Pricing_Records_Warning);  
                    ApexPages.addMessage(myMsg);
                }
                //  <BR20130718> added if condition not to render for View prices
                //added for pcl-- version 1.2 start 21-02-13 Sanjib
                if(Request.viewCustomerPrices!='ViewCustomerPrices' && request.requestServiceState.ogItems.value!='Export' && request.pricingRequest.Request_Type__c != 'Massive')
                {
                    throw new PAException(System.Label.No_Pricing_Records_Warning,ApexPages.Severity.WARNING);
                }
                
                if((request.pricingRequest.Request_Type__c == 'Non Customer Specific' || request.pricingRequest.Request_Type__c == 'Massive') && request.customer.currentPrices == 'viewPricesOnLoad')
                {
                    throw new PAException('No Records Found',ApexPages.Severity.WARNING);
                }
                // version 1.2 end 
            }
            if(addFetchedList.size() <= 900 && addFetchedList.size() != 0)
            {
                dispFetchedRecBoolean = true;
            }
            
        }
        //loop thru addfetchedlist and get the set of pckcconcat
        System.debug('**** sap rec size'+addFetchedList.size());
        System.debug('**** sap rec size'+addFetchedList);
        Set<String> PCKCConcatSet = new Set<String>();
        Map<String,List<Sobject>> priceCondToERPMap = new Map<String,List<Sobject>>();
        //Ver 2.3 
        String finalKC='';
        String concatPCKC,concatSAPPCKC;
        Map<String,String> concatPCKCToSAPPCKCMap = new Map<String,String>();
        //Ver 2.4  
        if(addFetchedList.size()>0)  
        {
            string kcTxt = (string)addFetchedList[0].get('Key_Combination__c');
            //<VK20200128> Added null check to Production Issue.
            if(kcTxt!=null)
            {
                //<HL20150522> added Null check to fix production issue
                //<START> IS ID-00087379 Updated if condition for Material Group 1
                //if(kcTxt!=null && kcTxt.toUpperCase().contains('MATERIAL') && !kcTxt.toUpperCase().contains('MATERIAL PRICE GROUP')) 
                //<END>
                
                if(kcTxt.toUpperCase().contains('MATERIAL') && !(kcTxt.toUpperCase().contains('MATERIAL PRICE GROUP') || kcTxt.toUpperCase().contains('MATERIAL GROUP'))) 
                {
                    PAUtil.sortList(addFetchedList, 'Material__c', 'asc');
                }
            }   
        }
        
        if(((request.requestServiceState.ogItems.value=='Export' || request.pricingRequest.Request_Type__c=='Import') && request.keyCombination!=null && request.keyCombination.KeyCombinationName!=null
            && request.keyCombination.KeyCombinationName.containsIgnoreCase('sold to')))
        {
            PAUtil.sortList(addFetchedList, 'Sold_To__c', 'asc');
        }
        //added by sanjib to sort project by project id
        //<VR20130722> APAC Rollout2-Added the if condition to skip the following lines when View Customer Prices button is clicked
        IF(request.viewCustomerPrices=='ViewCustomerPrices'
           || ((Request.pricingCondition.selectedPricingCondition==NULL && Request.pricingCondition.PCLselectedPricingCondition!=null
                && Request.pricingCondition.PCLselectedPricingCondition.size()!=0 && Request.keyCombination.PCLselectedKeyCombination!=null
                && Request.keyCombination.PCLselectedKeyCombination.size()!=0) || ( Request.pricingCondition.selectedPricingCondition==NULL
                                                                                   && Request.pricingCondition.PCLselectedPricingCondition.size()==0 &&  request.keyCombination.PCLselectedKeyCombination.size()==0)))
        {
            PAUtil.sortList(addFetchedList, 'Project_id__c', 'asc');
        }
        
        
        System.debug('addFetchedListsize '+addFetchedList.size());
        for(Sobject ERPSales : addFetchedList){
            concatPCKC = ((string)ERPSales.get('Pricing_Condition_Code__c')) + '-' +((string)ERPSales.get('Pricing_Condition__c')) + ':' +((string)ERPSales.get('Key_Combination_Code__c')) + '-' +((string)ERPSales.get('Key_Combination__c'));
            //system.debug(LoggingLevel.Error,'@^#%concatPCKC'+concatPCKC);
            //added SFDC key Comb-VIMP
            //System.debug(LoggingLevel.Error,'****kcIdandKcDescMap'+kcIdandKcDescMap);
            // System.debug(LoggingLevel.Error,'***ERPSales.Key_Combination_Code__c'+ERPSales.get('Key_Combination_Code__c')+ERPSales.get('Id'));
            //<PP20140502>
            //<AV20152802>-START- Production issue fix- View cust prices- kc desc null issue
            System.debug('kcIdandKcDescMap.size() '+kcIdandKcDescMap.size());
            for(String key : kcIdandKcDescMap.keySet()){
                System.debug('**mapkey '+key+' **value '+ kcIdandKcDescMap.get(key));
            }
            for(String key : kcIdandKcDescMap.keySet())
            {
                String orgKey = key;
                system.debug('#&&**&'+key);
                //String PCKC1 = (key+'d').substring(9,10);
                String PCKC = key.right(2);
                system.debug('*#&#^!^'+PCKC+','+key);
                if(key.length() > 4 && PCKC.isAlpha()) //<SS01052023> Added logic for A9AF Key combination 
                {
                    String revKey = key.reverse();
                    String splitKey = revKey.substring(2);
                    Key = splitKey.reverse();
                }
                
                if(Key.equals((string)ERPSales.get('Pricing_Condition_Code__c') + (string)ERPSales.get('Key_Combination_Code__c')))
                {
                    system.debug('Key:'+key+'@^%#1'+ (string)ERPSales.get('Pricing_Condition_Code__c') + (string)ERPSales.get('Key_Combination_Code__c'));
                    String priceKCdesc = (string)ERPSales.get('Key_Combination__c');
                    system.debug('@^%#2'+priceKCdesc);
                    if(priceKCdesc.containsignoreCase('Sold to') || priceKCdesc.containsignoreCase('Ship to') || priceKCdesc.containsignoreCase('End user'))
                    {
                        system.debug('@^%#3 - orgkey'+orgkey+':kcIdandKcDescMap -'+kcIdandKcDescMap);
                        String keyKCdesc = kcIdandKcDescMap.get(orgkey);
                        system.debug('@^%#4'+keyKCdesc);
                        if(((keyKCdesc.containsignoreCase('Sold-to') || keyKCdesc.containsignoreCase('Sold to') || keyKCdesc.containsignoreCase('Customer Specific') || keyKCdesc.containsignoreCase('Customer'))&&(priceKCdesc.containsignoreCase('Sold to')) || priceKCdesc.containsignoreCase('Sold-to')) || ((keyKCdesc.containsignoreCase('Ship to') || keyKCdesc.containsignoreCase('Ship-to'))&&(priceKCdesc.containsignoreCase('Ship to') || priceKCdesc.containsignoreCase('Ship-to'))) || ((keyKCdesc.containsignoreCase('End user') || keyKCdesc.containsignoreCase('End-user'))&&(priceKCdesc.containsignoreCase('End user') || priceKCdesc.containsignoreCase('End-user'))))
                        {
                            system.debug('@^%#5');
                            finalKC=kcIdandKcDescMap.get(orgkey);
                            System.debug('***123finalKC'+finalKC);
                        }
                    }
                    else
                    {
                        System.debug('** orgkey '+orgkey);
                        finalKC=kcIdandKcDescMap.get(orgkey);
                        System.debug('** finalKC '+finalKC);
                    }
                    
                    if(key=='ZBPAA578' || key=='ZBPAA911')
                    {
                        finalKC =((string)ERPSales.get('Key_Combination__c')).replace('Sales Org./Dist. Channel/Division/', 'Sales Area/');
                        finalKC  = finalKC.replace('/PH1/PH2/PH3/PH4/PH5/PH6/PH7/PH8/PH9','/ ProductHierarchy{18}');
                    }
                }
            }
            //<AV20152802>-END- Production issue fix- View cust prices- kc desc null issue
            /*if(kcIdandKcDescMap.containsKey((string)ERPSales.get('Pricing_Condition_Code__c') + (string)ERPSales.get('Key_Combination_Code__c')))
{
//<PP20140502>
finalKC=kcIdandKcDescMap.get((string)ERPSales.get('Pricing_Condition_Code__c')
+ (string)ERPSales.get('Key_Combination_Code__c'));
System.debug('***finalKC'+finalKC);
}*/
            concatSAPPCKC = ((string)ERPSales.get('Pricing_Condition_Code__c')) + '-' + ((string)ERPSales.get('Pricing_Condition__c')) +
                ' : ' + ((string)ERPSales.get('Key_Combination_Code__c'))+ '-' + finalKC;
            system.debug('&@^#%%concatSAPPCKC'+concatSAPPCKC);
            
            concatPCKCToSAPPCKCMap.put(concatPCKC,concatSAPPCKC);
            //added SFDC key Comb-VIMP-end
            if(priceCondToERPMap.containsKey(concatPCKC))
            {
                List<Sobject> l1 = new List<Sobject>();
                l1= priceCondToERPMap.get(concatPCKC);
                l1.add(ERPSales);
                priceCondToERPMap.put(concatPCKC,l1);
            }
            else
            {
                List<Sobject> l1 = new List<Sobject>();
                l1.add(ERPSales);
                priceCondToERPMap.put(concatPCKC,l1);
            }
        }
        PCKCConcatSet = priceCondToERPMap.keySet();
        System.debug(LoggingLevel.Error,'**** PCKCConcatSet'+PCKCConcatSet);
        System.debug(LoggingLevel.Error,'**** PCKCConcatSet size'+PCKCConcatSet.size());
        //<TJ20140522>
        request.countOfPriceTables = PCKCConcatSet.size();      
        //loop thru pckcconcat and 
        relatedList = new List<PARelatedList>();
        //Ver 1.1 START
        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Getting the Schema of Sales_Prices__c Object
        Map<String,Schema.FieldSet> fieldSetMap;
        if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
            fieldSetMap = Schema.SObjectType.Sales_Prices__c.fieldSets.getMap();
        }
        else {
            fieldSetMap = Schema.SObjectType.ERP_Sales_Prices_SAP__c.fieldSets.getMap();
        }
        system.debug('**fieldSetMap'+fieldSetMap);
        List<Schema.FieldSetMember> kcFields = fieldSetMap.get('PAPricingRecordsColumns').getFields();
        List<Schema.FieldSetMember> commonFields = fieldSetMap.get('PAPricingRecordCommonColumns').getFields();
        List<Schema.FieldSetMember> soldToFields = fieldSetMap.get('PASoldTo').getFields();
        //Ver 1.7
        List<Schema.FieldSetMember> dateFields = fieldSetMap.get('PAPricingRecordDateColumns').getFields();
        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Getting the name of the SObject based on various Conditions
        String sapObj = ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
        String sObjectName;
        if(conditionType.contains('Floor') || conditionType.contains('Reference')) {
            sObjectName = Sales_Prices__c.sObjectType.getDescribe().getName().toLowerCase();
        }
        else {
            sObjectName = ERP_Sales_Prices_SAP__c.sObjectType.getDescribe().getName().toLowerCase();
        }
        System.debug(LoggingLevel.Error,'***request.keyCombination.keyCombinationID'+request.keyCombination.keyCombinationID);
        
        
        
        for(String s : PCKCConcatSet)
        {  System.debug(LoggingLevel.Error,'*****s header'+s);
         if(s == 'null-null:null-null') continue;
         PARelatedList c = new PARelatedList();
         c.wrapperList = new List<PAWrapper>();
         //Ver 1.5 START
         List<Schema.FieldSetMember> kcSet = new List<Schema.FieldSetMember>();
         if(s.remove(' ').toUpperCase().contains('SOLDTO') && (request.pricingRequest.Request_Type__c=='Massive' 
                                                               || request.pricingRequest.Request_Type__c=='Import' || request.requestServiceState.ogItems.value=='Export' || request.pricingRequest.Pricing_Request_Type__c == 'Floor' 
                                                               || request.pricingRequest.Pricing_Request_Type__c == 'Reference' ))
         {
             kcSet.addAll(soldToFields);
             //c.soldToColumns = soldToFields;
         }
         if(s.containsIgnoreCase('Project'))
             c.projectPC=true;
         else
             c.projectPC=false;
         System.debug('kcFields:'+kcFields);        
         for(Schema.FieldSetMember fSet : kcFields)
         {
             String fLabel = fSet.getLabel();
             String kc = s.split(':',2)[1].split('-',2)[1];
             system.debug('Current KC field: '+fset+' **fLabel** '+fLabel+' **kc** '+kc);
             String replacedS = kc.replace('Material Price Group','');
             String replacedEU = kc.replace('End User','');
             String replacedMG = kc.replace('Material Group','');
             String replacedG = kc.replace('Material Group 5 key','');
             String replacedSTC = kc.replace('Ship-To Country','');
             
             //<START> IS ID-00087379 Updated if condition for Material Group 1
             //if(fLabel.contains('Material') &&(!fLabel.contains('Price'))&&(replacedS.contains('Material'))&&(!fLabel.contains('Group'))&&(replacedG.contains('Material'))) 
             //<END>
             
             if(fLabel.contains('Material') &&(!fLabel.contains('Price'))&&(replacedS.contains('Material'))&&(!fLabel.contains('Group'))&&(replacedG.contains('Material'))&&(replacedMG.contains('Material')))
             {
                 kcSet.add(fSet);
             }
             if(fLabel.contains('Material Price Group') &&(kc.contains('Material Price Group')))
             {
                 kcSet.add(fSet);
             }
             //<PP20131028> START
             if(fLabel.contains('Ship-To Country') &&(kc.contains('Ship-To Country')))
             {
                 kcSet.add(fSet);                    
             }
             if(fLabel.contains('Country') && (!fLabel.contains('Ship-To Country')) && (replacedSTC.contains('Country')))
             {
                 kcSet.add(fSet);
             }
             //<PP20131028> END
             //Ver 3.0 START
             if(fLabel.contains('End User') &&(kc.contains('End User')))
             {
                 kcSet.add(fSet);                    
             }
             
             if(fLabel.contains('End Use') && (!fLabel.contains('End User')) && (replacedEU.contains('End Use')))
             {
                 kcSet.add(fSet);
             }
             //<PP20131028>
             if(!fLabel.contains('Material')&& !fLabel.contains('End Use') && !fLabel.contains('Country') &&(kc.remove(' ').toLowerCase().contains(fLabel.remove(' ').toLowerCase()) || kc.remove(' ').toLowerCase().contains(fLabel.replace(' Code','').remove(' ').toLowerCase())))
             {
                 //Ver 3.0 END
                 kcSet.add(fSet);
             }
             if(fLabel.contains('Material Group 2') &&(kc.contains('Material Group 2'))) //Added by MM
                {
                    kcSet.add(fSet);  
                    System.debug('@#$'+kcSet);
                }
             //<KK20200817>
                if(flabel.contains('Distributor Name') && (kc.contains('Distributor')))
                {
                kcSet.add(fSet);
                }
                if(fLabel.contains('Product Hierarchy') &&(kc.contains('PH')))
             {
                 if(replacedS.contains('Material'))
                 {
                     if(fLabel != 'Product Hierarchy')
                         kcSet.add(fSet);
                 }
                 else
                     kcSet.add(fSet);
             }
             if(fLabel.contains('Profit Center') &&(kc.contains('FRB')))
             {
                 kcSet.add(fSet);
                 
             }
             //<HL20141113>Added extra key field Incoterms Code
             if(fLabel.contains('Incoterms code') &&(kc.contains('Incoterms code')))
             {
                 kcSet.add(fSet);
             }
             if(fLabel.contains('Project') &&(kc.contains('Project')))
             {
                 kcSet.add(fSet);
                 
             }
             if(fLabel.contains('ComPartner_Code') && (s.contains('ComPartner'))){
                 kcSet.add(fSet);
             } 
             if(fLabel.containsIgnoreCase('Material Group 5 Key') && (s.containsIgnoreCase('Material Group 5 Key'))){
                 kcSet.add(fSet);
             }
             
             if(fLabel.contains('Char Name') && (s.contains('Kcode'))){
                 kcSet.add(fSet);
             } 
             if(fLabel.contains('Material Group 1 Code') && ((s.contains('Material Group 1') || s.contains('Matl grp1')
                                                              || s.contains('Matl grp 1') || s.contains('MatGrp1')))){
                                                                  kcSet.add(fSet);
                                                              }   
         }
         //Ver 1.5 END
         //<BR20130723> starts,//<PP20140428>
         //if(Request.viewCustomerPrices=='ViewCustomerPrices'){
         //   for(Schema.FieldSetMember fSet : commonFields)
         //{
         //  String fLabel = fSet.getLabel();                   
         
         //if(fLabel.contains('Rate'))
         //{
         //  kcSet.add(fSet);
         //}
         //}
         //}
         //<BR20130723> ends
         
         //else{
         kcSet.addAll(commonFields);
         //}
         
         //c.commonColumns = commonFields;
         //Ver 1.9 START
         System.debug('All KC columns:'+kcSet);
         System.debug('concatPCKCToSAPPCKCMap:'+concatPCKCToSAPPCKCMap);
         
         c.keyCombinationColumns = kcSet;
         //Ver 1.9 END
         //c.priceType = s;
         /*added for KC SFDC desc*/
         if(concatPCKCToSAPPCKCMap.containsKey(s)){
             System.debug('********s'+s);
             c.priceType = concatPCKCToSAPPCKCMap.get(s);
             System.debug('********priceType'+c.priceType);
         } 
         /*end*/ 
         //Ver1.7  
         c.sObjectTypeName=sObjectName;
         //<PP20140614>
         c.hasScaledRecordFlag = false;
         c.selectAllFlag = false;
         //Ver 1.1 END 
         //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Modified the list to Sobject List
         integer currentIndex = 0;
         integer listIndex = 0;
         if(fromset==1)
             currentIndex = 1;
         System.debug(LoggingLevel.Error,'request.requestServiceState.ogItems.value='+request.requestServiceState.ogItems.value);
         System.debug(LoggingLevel.Error,'fetchRecrds:'+fetchRecrds);
         system.debug(LoggingLevel.Error,'fromset:'+fromset);
         Boolean IsERPPrice; //<SH20221125>
         for(Sobject ERPSales : priceCondToERPMap.get(s)){
             //System.debug('currentIndex'+currentIndex);
             //System.debug('listIndex'+listIndex);
             //if((currentIndex>=fromset && listIndex<400)||(request.requestServiceState.ogItems.value=='Export'))
             if((fetchRecrds && (currentIndex>=fromset && listIndex<200)) ||(request.requestServiceState.ogItems.value=='Export'))
             {
                 PAWrapper rw = new PAWrapper();
                 rw.isSelected = false;
                 rw.stringMap = new Map<String,String>();
                 rw.stringMap.put('rateLocale','');
                 //<PP20130424> -- Ver 3.0 START 
                 if(!String.isBlank((string)ERPSales.get('Rate__c')))
                 {
                     rw.stringMap.put('rateLocale',((string)ERPSales.get('Rate__c')).replace('.',separator));
                 }
                 //<PP20130424> -- Ver 3.0 END
                 //Ver 2.0 START
                 rw.sObjectRecord = ERPSales;
                 //<SH20221125> - Start
                 String RecId = (String)ERPSales.get('Id');
                 If (RecId.startsWith('a0K'))
                 rw.IsERPPrice =true;
                 else
                 rw.IsERPPrice=false;
                 //<SH20221125> - End
                 //Ver 2.0 END
                 rw.stringMap.put('disableCheckBox','false');
                 if(c.sObjectTypeName == sapObj && c.hasScaledRecordFlag == false)
                     c.hasScaledRecordFlag = (boolean)ERPSales.get('Scaled_Price_Flag__c');
                 c.wrapperList.add(rw);
                 listIndex++;
             }
             else if(!fetchRecrds && (request.requestServiceState.ogItems.value!='Export') && c.wrapperList.size()<400)
             {
                 PAWrapper rw = new PAWrapper();
                 rw.isSelected = false;
                 rw.stringMap = new Map<String,String>();
                 rw.stringMap.put('rateLocale','');
                 //<PP20130424> -- Ver 3.0 START 
                 if(!String.isBlank((string)ERPSales.get('Rate__c')))
                 {
                     rw.stringMap.put('rateLocale',((string)ERPSales.get('Rate__c')).replace('.',separator));
                 }
                 //<PP20130424> -- Ver 3.0 END
                 //Ver 2.0 START
                 rw.sObjectRecord = ERPSales;
                 //Ver 2.0 END
                 rw.stringMap.put('disableCheckBox','false');
                 if(c.sObjectTypeName == sapObj && c.hasScaledRecordFlag == false)
                     c.hasScaledRecordFlag = (boolean)ERPSales.get('Scaled_Price_Flag__c');
                 c.wrapperList.add(rw);
                 listIndex++;
             }
             
             currentIndex++;
         }
         
         
         totalRecrds = currentIndex-1;
         if(fromset!=null)
         {
             if(fromSet!=1)
                 toSet = fromSet+listIndex-1;
             else
                 toSet = fromSet+listIndex-1;
             
             if(toSet == currentIndex)
             {
                 nextPage = false;
             }
         }   
         System.debug(logginglevel.error,'****** PARelatedList size of wrappers added'+c.wrapperList.size());
         relatedList.add(c);
         System.debug(LoggingLevel.Error,'****** PARelatedList Final '+relatedList+relatedList.get(0).priceType);
         //<PP20140502>
         //<HL20141027 - Added condition to handle displaying NULL in PCKC>
         if((pcKCConcatList != null && !c.priceType.containsignorecase('null')) && (String.isBlank(pckcSelected) || pckcSelected == '--Select--'))
             pcKCConcatList.add(new SelectOption(c.priceType,c.priceType));
        }
        System.debug('pcKCConcatList:-'+pcKCConcatList);
        //<PP20140502> START
        if(pcKCConcatList != null && pcKCConcatList.size() > 1 && (String.isBlank(pckcSelected) || pckcSelected == '--Select--'))
        {
            pcKCConcatList.add(0,new SelectOption('--Select--','--Select--'));
            pckcSelected = '--Select--';
        }
        else if(pcKCConcatList != null && pcKCConcatList.size() == 1  && (String.isBlank(pckcSelected) || pckcSelected == '--Select--'))
        {
            pckcSelected = pcKCConcatList[0].getValue();
        }
        System.debug(LoggingLevel.Error,'PCKC LIST:-'+pcKCConcatList);
        //<PP20140502> END
        return relatedList;
    }            
    public void add() 
    {
    }
    
    public void save()
    {
    }
    
    public void deleteRecord()
    {
    }
    
    public String getName()
    {
        return PAService.NAME_REQUESTITEMS;
    }
    
    public String getType()
    {
        return null;
    }
    
    public String validate(String desiredAction) 
    {
        String errorMessage='';
        boolean selectedListFlag = false;
        if(desiredAction.equalsIgnoreCase('AddSelectedPrices'))
        {
            for(PARelatedList wRec : relatedWrappersList)
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
            
            if(selectedListFlag==false)
            {
                
                errorMessage+= '<br>'+System.Label.Select_Pricing_Records_Mandatory_Error;
                return errorMessage.trim();
            }
        }
        if(desiredAction.equalsIgnoreCase('AddRequestItems'))
        {
            for(PARelatedList wRec : relatedWrappersList)
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
            if(selectedListFlag==false)
            {
                errorMessage+= '<br>'+System.Label.Select_Pricing_Records_Mandatory_Error;
                return errorMessage.trim();
            }
            //Ver 2.7 START
            //added to avoid adding more than 1000 request items
            Integer priCount=[select count() FROM Pricing_Request_Item__c where Pricing_Request__c=:request.pricingRequest.Id];
            //<PP20131115>
            if(priCount>=350)
            {
                //<PP20131115>
                errorMessage+= '<br>'+'This request already holds 350 request items. Cannot add more.';
                return errorMessage.trim();
            }
            Integer selectedRecordsSize = 0;
            for(PARelatedList wRec : relatedWrappersList)
            {
                for(PAWrapper r : wRec.wrapperList)
                {
                    if(r.isSelected == true)
                    {
                        selectedRecordsSize++ ;
                    }
                }
            }
            //<PP20131115>
            Integer z = 350 - priCount;
            //<PP20131115>
            if(priCount<350 && selectedRecordsSize > z)
            {
                errorMessage+= '<br>'+'Cannot add more than '+z+' request items to this request.';
                return errorMessage.trim();
            }
            //Ver 2.7 END
            
        }
        if(desiredAction.contains('#'))
        {
            errorMessage=system.label.PH_Code_Error;
        }
        return errorMessage.trim();
    }
    
    public string action(String newPagelabel,String currentPageLabel, String desiredAction) 
    {
        System.debug('desiredAction:-'+desiredAction);    
        if(desiredAction.equalsIgnoreCase('FetchRecordswithOffset'))
        {
            fetchRecrds =true;
            if(offsets== null)
                offsets = 200;
            else if(offsets+200<=2000)
                offsets += 200;
            relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList = getListWrappers();
            system.debug('Size of wrapper: -'+relatedWrappersList);
            
        }
        else if(desiredAction.equalsIgnoreCase('FetchRecordswithOffsetback'))
        {
            fetchRecrds =true;
            if(offsets>=200)
                offsets -= 200;
            else
                offsets = null; 
            relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList = getListWrappers();
            system.debug('Size of wrapper: -'+relatedWrappersList);
        }
        else if(desiredAction.equalsIgnoreCase('FetchRecords'))
        {
            offsets = null; 
            fetchRecrds =true;
            relatedWrappersList = new List<PARelatedList>();
            system.debug('!@#$!@#$');
            relatedWrappersList = getListWrappers();
            system.debug('Size of wrapper: -'+relatedWrappersList);
            fetchRecrds =false;
        }
        //Added for export 100 records in export price page
        else if(desiredAction.equalsIgnoreCase('Fetch100Records'))
        {
            countfetch100 = true; //<HL20150511 added counter to display valid 100 for export - Production issue fix for export>
            offsets = null; 
            relatedWrappersList = new List<PARelatedList>();
            fetch100 = true;
            relatedWrappersList = getListWrappers();
            system.debug('Size of wrapper: -'+relatedWrappersList);
            system.debug('keyCombinationcolumns wrapper: -'+relatedWrappersList);
        }
        //Added logic to export all prices to CSV file
        else if(desiredAction.equalsIgnoreCase('exportCSV'))
        {
            exportcsv = true;
            exportWrapList = new List<PARelatedList>();
            exportWrapList = getListWrappers();
            system.debug('Size of exportCSV wrapper: -'+relatedWrappersList.size());
        }
        //<BR20130718> 
        //<PP20140218> - Changed equalsIgnoreCase to containsIgnoreCase
        if(desiredAction.containsIgnoreCase('ViewCustomerPrices'))
        {
            relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList = getListWrappers();
            system.debug('\n\n\n relatedWrappersList '+relatedWrappersList.size());
        }
        else  if(desiredAction.equalsIgnoreCase('PCLfetch'))
        {
            relatedWrappersList = new List<PARelatedList>();
            relatedWrappersList = getListWrappers();
        }
        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Modified the list to Sobject List
        //<PP20140502>
        else if(desiredAction.equalsIgnoreCase('AddRequestItems') || desiredAction.equalsIgnoreCase('AddSelectedPrices'))
        {
            Set<Pricing_Request_Item__c> pricingRequestItemSet = new Set<Pricing_Request_Item__c>();
            List<Pricing_Request_Item__c> pricingRequestItemList = new List<Pricing_Request_Item__c>();
            List<Pricing_Request_Item__c> pricingRequestItemRecList = new List<Pricing_Request_Item__c>();
            //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Modified the list to Sobject List
            List<Sobject> fetchedList = new List<Sobject>();
            //
            String retErrorMsg = validate(desiredAction);
            if(!String.isBlank(retErrorMsg))
            {
                throw new PAException('<html>'+retErrorMsg+'</html>', ApexPages.Severity.ERROR);
            }
            else
            {   
                for(PARelatedList wRec1 : relatedWrappersList)
                {
                    for(PAWrapper r1 : wRec1.wrapperList)
                    {
                        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2- (commented)
                        //ERP_Sales_Prices_SAP__c erpPricingRecord = new ERP_Sales_Prices_SAP__c();
                        //erpPricingRecord = (ERP_Sales_Prices_SAP__c) r1.sObjectRecord;
                        //fetchedList.add(erpPricingRecord);
                        fetchedList.add(r1.sObjectRecord);
                        //<PP20140502>
                        break;
                    }
                }
                string priceType=' ';
                if(fetchedList!=null && fetchedList.size()>0) {
                    priceType=(string)fetchedList[0].get('Sales_Price_Type__c');
                }
                //populating SFDC KC descrpiton
                Organizational_Group_Item__c buOrgGroup=new Organizational_Group_Item__c();
                //<PP20140502>
                Map<String,String> kcIdandKcDescMap=new Map<String,String>();
                List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
                //<PP20140502> START
                Map<String,boolean> pcKCCodeisNPCAppMap = new Map<String,boolean>();
                Map<String,boolean> pcKCCodeisFlrRefAppMap = new Map<String,boolean>();
                Map<String,boolean> pcKCCodeisPmtTermsAppMap = new Map<String,boolean>();
                Map<String,boolean> pcKCCodeisVolumeAppMap = new Map<String,boolean>();
                //<TJ20140923>
                String query,whereClause,selBU=request.requestServiceState.ogItems.selectedBU,soc1=request.customer.paERPCustomer.Sales_Org_Code__c,soc2=request.pricingRequest.Sales_Org_Code__c;
                String distCode1=request.customer.paERPCustomer.Distribution_Channel_Code__c,divCode1=request.customer.paERPCustomer.Division_Code__c;
                String distCode2=request.pricingRequest.Dist_Channel_Code__c,divCode2=request.pricingRequest.Division_Code__c;
                query='SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,isPaymentTermsApplicable__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,Enable_Variable_Config_Materials__c,isVolumeApplicable__c FROM Organizational_Group_Item__c ';
                if(desiredAction.equalsIgnoreCase('AddSelectedPrices'))
                {
                    if(request.pricingRequest.Request_Type__c == 'Non Customer Specific' || request.pricingRequest.Request_Type__c == 'Massive')
                        whereClause='where Business__c = \''+selBU+'\' AND OrgGroup__r.ERP_Sales_Org_Code__c =\''+soc2+'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c =  \''+distCode2 +'\' AND OrgGroup__r.ERP_Division_Code__c =  \''+divCode2+'\'';
                    else
                        whereClause='where Business__c =\''+selBU+'\'  AND OrgGroup__r.ERP_Sales_Org_Code__c =\''+soc1 +'\' AND OrgGroup__r.ERP_Distribution_Channel_Code__c = \''+distCode1 +'\' AND OrgGroup__r.ERP_Division_Code__c =\''+divCode1+'\'';
                    query=query+whereClause;
                    //<AV20140515>-added isVolumeApplicable__c field
                    System.debug('Query:-'+query);
                    orgGroupItemsList = database.query(query);
                }
                else
                {
                    //<AV20140515>-added isVolumeApplicable__c field
                    //System.debug('OrgGroup__c :'+[SELECT Id FROM OrgGroup__c WHERE Business__c = :request.pricingRequest.BU__c AND RecordType.Name = 'Business']);
                    system.debug('request.pricingRequest.Sales_Org_Code__c:'+request.pricingRequest.Sales_Org_Code__c);
                    system.debug('request.pricingRequest.Dist_Channel_Code__c:'+request.pricingRequest.Dist_Channel_Code__c);
                    system.debug('request.pricingRequest.Division_Code__c:'+request.pricingRequest.Division_Code__c);
                    orgGroupItemsList = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,isPaymentTermsApplicable__c,
                                         Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                         Retroactive_Limit__c ,Latest_Valid_To_Offset_Non_Cust_Spec__c,Enable_Variable_Config_Materials__c,isVolumeApplicable__c
                                         FROM Organizational_Group_Item__c WHERE Business__c IN (SELECT Id FROM OrgGroup__c WHERE
                                                                                                 Business__c = :request.pricingRequest.BU__c AND RecordType.Name = 'Business') AND
                                         OrgGroup__r.ERP_Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c AND
                                         OrgGroup__r.ERP_Distribution_Channel_Code__c = :request.pricingRequest.Dist_Channel_Code__c AND
                                         OrgGroup__r.ERP_Division_Code__c = :request.pricingRequest.Division_Code__c];
                }
                //<PP20140502> END
                if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0)
                {
                    buOrgGroup  =   orgGroupItemsList[0];  
                }            
                //<PP20140502> START
                //<AV20140515>-added isVolumeApplicable__c field
                /*  List<ERP_Access_Sequence__c> accSqList = [SELECT isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c,
Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c,
Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
Reference_Key_Combination__c, Reference_Pricing_Condition__c,isPaymentTermsApplicable__c,isVolumeApplicable__c
FROM ERP_Access_Sequence__c   WHERE
Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c ORDER BY
Sequence_Number__c];  */
                List<ERP_Access_Sequence__c> accSqList=(List<ERP_Access_Sequence__c>)PAQueryUtil.query('PASalesPriceSAP','accessSeqObj','Sales_Pricing_Procedure__c =\''+buOrgGroup.ERP_Pricing_Procedure__c +'\'ORDER BY Sequence_Number__c');
                for(ERP_Access_Sequence__c ac:accSqList)
                {
                    //<PP20140502> START
                    kcIdandKcDescMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                         + ac.Pricing_Key_Combination__r.Key_Combination_Code__c,ac.Key_Combination__c);
                    pcKCCodeisNPCAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                            + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, false);
                    pcKCCodeisFlrRefAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                               + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, false);
                    pcKCCodeisPmtTermsAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                                 + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, false);
                    if(ac.isNPCApplicable__c)
                    {
                        pcKCCodeisNPCAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                                + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
                    }
                    if(!String.isBlank(ac.Floor_Key_Combination__c) || !String.isBlank(ac.Floor_Pricing_Condition__c)
                       || !String.isBlank(ac.Reference_Key_Combination__c) || !String.isBlank(ac.Reference_Pricing_Condition__c))
                    {
                        pcKCCodeisFlrRefAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                                   + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
                    }
                    if(buOrgGroup.isPaymentTermsApplicable__c && ac.isPaymentTermsApplicable__c)
                    {
                        pcKCCodeisPmtTermsAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                                     + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
                    }
                    //<AV20140515>-stored volume enabled pckc in map
                    if(buOrgGroup.isVolumeApplicable__c && ac.isVolumeApplicable__c)
                    {
                        pcKCCodeisVolumeAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c
                                                   + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
                    }
                    //<PP20140502> END
                }
                
                /*end*/
                
                for(PARelatedList wRec1 : relatedWrappersList)
                {
                    for(PAWrapper r1 : wRec1.wrapperList)
                    {
                        if(r1.isSelected == true)
                        {
                            //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Using the Sobject list to get the values
                            sObject pricingRecord;
                            pricingRecord =  r1.sObjectRecord;
                            Pricing_Request_Item__c pricingReqItemObj = new Pricing_Request_Item__c();
                            pricingReqItemObj.Approval_Status__c = request.pricingRequest.Request_Approval_Status__c;
                            pricingReqItemObj.Calculation_Type_Code__c = (string)pricingRecord.get('Calculation_Type_Code__c');
                            pricingReqItemObj.Calculation_Type__c = (string)pricingRecord.get('Calculation_Type__c');
                            pricingReqItemObj.Condition_Class_Code__c = (string)pricingRecord.get('Condition_Class_Code__c');
                            pricingReqItemObj.Condition_Class__c = (string)pricingRecord.get('Condition_Class__c');
                            //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Moving the fields inside the condition based on the object
                            List<String> splitKCListFinal=new List<String>();
                            string kc = (string)pricingRecord.get('Key_Combination__c');
                            splitKCListFinal = kc.split('/');
                            keyfields=kfpop(splitKCListFinal);
                            system.debug(splitKCListFinal+' '+keyfields);
                            
                            for(string field: keyfields)
                            {  
                                
                                if(pricingRecord.getSobjectTYpe() == ERP_Sales_Prices_SAP__C.sObjectType)
                                {
                                    if(field=='Dist_Channel_Code__c')
                                    {
                                        pricingReqItemObj.put('Dist_Channel_Code__c',(string)pricingRecord.get('Distribution_Channel_Code__c'));
                                        system.debug('Current Field:'+field+'- Value:'+(string)pricingRecord.get('Distribution_Channel_Code__c'));
                                    }
                                    else if(field=='Incoterms_1_Code__c')
                                    {
                                        pricingReqItemObj.put('Incoterms_Code__c',(string)pricingRecord.get('Incoterms_1_Code__c'));
                                    }
                                    else if(field=='Incoterms1__c')
                                    {
                                        pricingReqItemObj.put('Inco_terms__c',(string)pricingRecord.get('Incoterms1__c'));
                                    }
                                    //Added to handle the type conversion for fix value date
                                    else if(field=='FixValDate__c')
                                    {
                                        pricingReqItemObj.put('FixValDate__c',(Date)pricingRecord.get('FixValDate__c'));
                                    }
                                    else
                                    {
                                        system.debug('Current Field:'+field+'- Value:'+pricingRecord.get(field));
                                        pricingReqItemObj.put(field,(string)pricingRecord.get(field));
                                    }
                                }
                                
                                else
                                {
                                    if(field!='Landing_Cost__c' && field!='PH1__c' && field!='PH2__c' && field!='PH3__c'
                                       && field!='PH4__c'&& field!='PH5__c'&& field!='PH6__c'&& field!='PH7__c'&& field!='PH8__c'&& field!='PH9__c'
                                      )
                                    {
                                        pricingReqItemObj.put(field,(string)pricingRecord.get(field));
                                    }
                                }
                            }
                            System.debug('After adding madatory fields:'+pricingReqItemObj);
                            if(priceType != null && (priceType.contains('Floor') || priceType.contains('Reference')))
                            {
                                pricingReqItemObj.Dist_Channel_Code__c = (string)pricingRecord.get('Dist_Channel_Code__c');
                                pricingReqItemObj.Pricing_Request_Type__c = (string)pricingRecord.get('Sales_Price_Type__c');
                            }
                            else
                            {
                                pricingReqItemObj.Check_Scale_Code__c = (string)pricingRecord.get('Check_Scale_Code__c');
                                pricingReqItemObj.Check_Scale__c = (string)pricingRecord.get('Check_Scale__c');
                                pricingReqItemObj.Customer_Specific__c = (boolean)pricingRecord.get('Customer_Specific__c');
                                
                                /*George
Commented code to select KC fields on demand

pricingReqItemObj.Disc_Ref__c = (string)pricingRecord.get('Disc_Ref__c');
pricingReqItemObj.End_User__c = (string)pricingRecord.get('End_User__c');
pricingReqItemObj.End_User_Code__c = (string)pricingRecord.get('End_User_Code__c');
//<VR20130509> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Logic for Extra Key field Customer Hierarchy
pricingReqItemObj.Customer_Hierarchy__c = (string)pricingRecord.get('Customer_Hierarchy__c');
pricingReqItemObj.Customer_Hierarchy_Code__c = (string)pricingRecord.get('Customer_Hierarchy_Code__c');


pricingReqItemObj.PH1__c = (string)pricingRecord.get('PH1__c');
pricingReqItemObj.PH2__c = (string)pricingRecord.get('PH2__c');
pricingReqItemObj.PH3__c = (string)pricingRecord.get('PH3__c');
pricingReqItemObj.PH4__c = (string)pricingRecord.get('PH4__c');
pricingReqItemObj.PH5__c = (string)pricingRecord.get('PH5__c');
pricingReqItemObj.PH6__c = (string)pricingRecord.get('PH6__c');
pricingReqItemObj.PH7__c = (string)pricingRecord.get('PH7__c');
pricingReqItemObj.PH8__c = (string)pricingRecord.get('PH8__c');
pricingReqItemObj.PH9__c = (string)pricingRecord.get('PH9__c');
//Ver 2.9 START
pricingReqItemObj.Price_Ref_Partner__c = (string)pricingRecord.get('Price_Ref_Partner__c');
pricingReqItemObj.Price_Ref_Partner_Code__c = (string)pricingRecord.get('Price_Ref_Partner_Code__c');


*/
                                
                                //Ver 2.9 END
                                pricingReqItemObj.Quantity__c = (string)pricingRecord.get('Quantity__c');
                                /*if(request.requestServiceState.ogitems.isEndUserRebate && ((string)pricingRecord.get('Quantity__c')=='' || (string)pricingRecord.get('Quantity__c')==null)){
pricingReqItemObj.Quantity__c = '1';        
}*/
                                pricingReqItemObj.Scale_Basis_Code__c = (string)pricingRecord.get('Scale_Basis_Code__c');
                                pricingReqItemObj.Scale_Basis__c = (string)pricingRecord.get('Scale_Basis__c');
                                pricingReqItemObj.Scaled_Price_Flag__c = (boolean)pricingRecord.get('Scaled_Price_Flag__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value1__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value1__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value2__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value2__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value3__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value3__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value4__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value4__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value5__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value5__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value6__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value6__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value7__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value7__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value8__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value8__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value9__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value9__c');
                                pricingReqItemObj.Scale_Quantity_Scale_Value10__c = (string)pricingRecord.get('Scale_Quantity_Scale_Value10__c');
                                pricingReqItemObj.ScaleRate1__c = (string)pricingRecord.get('ScaleRate1__c');
                                pricingReqItemObj.ScaleRate2__c = (string)pricingRecord.get('ScaleRate2__c');
                                pricingReqItemObj.ScaleRate3__c = (string)pricingRecord.get('ScaleRate3__c');
                                pricingReqItemObj.ScaleRate4__c = (string)pricingRecord.get('ScaleRate4__c');
                                pricingReqItemObj.ScaleRate5__c = (string)pricingRecord.get('ScaleRate5__c');
                                pricingReqItemObj.ScaleRate6__c = (string)pricingRecord.get('ScaleRate6__c');
                                pricingReqItemObj.ScaleRate7__c = (string)pricingRecord.get('ScaleRate7__c');
                                pricingReqItemObj.ScaleRate8__c = (string)pricingRecord.get('ScaleRate8__c');
                                pricingReqItemObj.ScaleRate9__c = (string)pricingRecord.get('ScaleRate9__c');
                                pricingReqItemObj.ScaleRate10__c = (string)pricingRecord.get('ScaleRate10__c');                         
                                pricingReqItemObj.Scale_Type__c = (string)pricingRecord.get('Scale_Type__c');
                                pricingReqItemObj.Scale_Type_Code__c = (string)pricingRecord.get('Scale_Type_Code__c');
                                pricingReqItemObj.Scale_UoM_Scale_Unit__c = (string)pricingRecord.get('Scale_UoM_Scale_Unit__c');
                                pricingReqItemObj.ShipTo__c = (string)pricingRecord.get('ShipTo__c');
                                pricingReqItemObj.ShipTo_Code__c = (string)pricingRecord.get('ShipTo_Code__c');
                                /*
pricingReqItemObj.Ship_To_Country_Code__c = (string)pricingRecord.get('Ship_To_Country_Code__c');
pricingReqItemObj.Ship_To_Country__c = (string)pricingRecord.get('Ship_To_Country__c');
pricingReqItemObj.Dist_Channel_Code__c = (string)pricingRecord.get('Distribution_Channel_Code__c');
*/
                                
                                pricingReqItemObj.Pricing_Request_Type__c = request.pricingRequest.Pricing_Request_Type__c;
                                //<AV20140515>-assign volume and uom of reqitem obj to old volume and old uom
                                pricingReqItemObj.Volume__c = (Integer)pricingRecord.get('Volume__c');
                                pricingReqItemObj.Volume_UoM__c = (String)pricingRecord.get('Volume_UoM__c');
                                pricingReqItemObj.New_Volume__c = (Integer)pricingRecord.get('Volume__c');
                                pricingReqItemObj.New_Volume_UoM__c = (String)pricingRecord.get('Volume_UoM__c');
                                pricingReqItemObj.Customer_Price_Payment_Terms__c = (String)pricingRecord.get('Customer_Price_Payment_Terms__c');
                                pricingReqItemObj.Payment_Terms_Fixed_Date__c = (Date)pricingRecord.get('Payment_Terms_Fixed_Date__c');
                                pricingReqItemObj.New_Customer_Price_Payment_Terms__c = (String)pricingRecord.get('Customer_Price_Payment_Terms__c');
                                pricingReqItemObj.New_Payment_Terms_Fixed_Date__c = (Date)pricingRecord.get('Payment_Terms_Fixed_Date__c');
                            }
                            //Ver 2.9 START
                            String tempKCDesc=(string)pricingRecord.get('Key_Combination__c');
                            
                            //Ver 2.9 END
                            //<MS20140515> Adding conditions for variant and sales order type START
                            /*George
Commented code to select KC fields on demand

pricingReqItemObj.Market_Segment__c = (string)pricingRecord.get('Market_Segment__c');
pricingReqItemObj.Market_Segment_Code__c = (string)pricingRecord.get('Market_Segment_Code__c');


pricingReqItemObj.Variant__c = (string)pricingRecord.get('Variant__c');
pricingReqItemObj.Variant_Code__c = (string)pricingRecord.get('Variant_Code__c');
pricingReqItemObj.Contract__c = (string)pricingRecord.get('Contract__c');
pricingReqItemObj.Contract_Code__c = (string)pricingRecord.get('Contract_Code__c');

pricingReqItemObj.Kcode__c = (string)pricingRecord.get('Kcode__c');
pricingReqItemObj.Material_Group_5_Key__c = (string)pricingRecord.get('Material_Group_5_Key__c');
pricingReqItemObj.Material_Group_5_Key_Code__c = (string)pricingRecord.get('Material_Group_5_Key_Code__c');
pricingReqItemObj.ComPartner__c = (string)pricingRecord.get('ComPartner__c');
pricingReqItemObj.ComPartner_Code__c = (string)pricingRecord.get('ComPartner_Code__c');
pricingReqItemObj.Plant__c = (string)pricingRecord.get('Plant__c');
pricingReqItemObj.Plant_Code__c = (string)pricingRecord.get('Plant_Code__c');
pricingReqItemObj.Shipping_Condition__c = (string)pricingRecord.get('Shipping_Condition__c');
pricingReqItemObj.Shipping_Condition_Code__c = (string)pricingRecord.get('Shipping_Condition_Code__c');
pricingReqItemObj.Destination_Country__c = (string)pricingRecord.get('Destination_Country__c');
pricingReqItemObj.Destination_Country_Code__c = (string)pricingRecord.get('Destination_Country_Code__c');
pricingReqItemObj.Sales_Order_Type__c = (string)pricingRecord.get('Sales_Order_Type__c');
pricingReqItemObj.Sales_Order_Type_Code__c = (string)pricingRecord.get('Sales_Order_Type_Code__c');
//<MS20140515> Adding conditions for variant and sales order type END

pricingReqItemObj.Country__c = (string)pricingRecord.get('Country__c');
pricingReqItemObj.Country_Code__c = (string)pricingRecord.get('Country_Code__c');
//pricingReqItemObj.Currency__c = pricingRecord.;
pricingReqItemObj.Customer_Price_Group__c = (string)pricingRecord.get('Customer_Price_Group__c');
pricingReqItemObj.Customer_Price_Group_Code__c = (string)pricingRecord.get('Customer_Price_Group_Code__c');                                                     
pricingReqItemObj.Dist_Channel__c = (string)pricingRecord.get('Dist_Channel__c');

pricingReqItemObj.Division__c = (string)pricingRecord.get('Division__c');
pricingReqItemObj.Division_Code__c = (string)pricingRecord.get('Division_Code__c');
pricingReqItemObj.End_Use__c = (string)pricingRecord.get('End_Use__c');
pricingReqItemObj.End_Use_Code__c = (string)pricingRecord.get('End_Use_Code__c');

*/
                            
                            pricingReqItemObj.Project__c = (string)pricingRecord.get('Project__c');
                            pricingReqItemObj.ERP_Sales_Prices_SAP__c = (string)pricingRecord.get('Id');  
                            pricingReqItemObj.Per__c = (Decimal)pricingRecord.get('Per__c');
                            
                            pricingReqItemObj.Plus_Minus_Code__c = (string)pricingRecord.get('Plus_Minus_Code__c');
                            pricingReqItemObj.Plus_Minus__c = (string)pricingRecord.get('Plus_Minus__c');
                            
                            pricingReqItemObj.Pricing_Condition__c = (string)pricingRecord.get('Pricing_Condition__c');
                            pricingReqItemObj.Pricing_Condition_Code__c = (string)pricingRecord.get('Pricing_Condition_Code__c');
                            pricingReqItemObj.Pricing_Request__c = request.pricingRequest.Id;
                            pricingReqItemObj.Rate__c = (string)pricingRecord.get('Rate__c');
                            
                            pricingReqItemObj.SAP_Application_Id__c = (string)pricingRecord.get('SAP_Application_Id__c');
                            pricingReqItemObj.SAP_Client_Id__c = (string)pricingRecord.get('SAP_Client_ID__c');
                            pricingReqItemObj.SAP_Cluster__c = (string)pricingRecord.get('SAP_Cluster__c');
                            //pricingReqItemObj.Scale__c = pricingRecord.Check_Scale__c;
                            pricingReqItemObj.Sold_To__c = (string)pricingRecord.get('Sold_To__c');
                            pricingReqItemObj.Sold_To_Code__c = (string)pricingRecord.get('Sold_To_Code__c');
                            
                            pricingReqItemObj.Unit__c = (string)pricingRecord.get('Unit__c');
                            pricingReqItemObj.UoM__c = (string)pricingRecord.get('UoM__c');
                            pricingReqItemObj.Valid_From__c = (Date)pricingRecord.get('Valid_From__c');
                            pricingReqItemObj.Valid_To__c = (Date)pricingRecord.get('Valid_To__c');
                            //<VK20210316> START
                            // [KV08182020] Distributor Code and Name Changes START
                            /*pricingReqItemObj.Distributor_Code__c = (string)pricingRecord.get('Distributor_Code__c');
                            pricingReqItemObj.Distributor_Name__c = (string)pricingRecord.get('Distributor_Name__c');*/
                            // [KV08182020] Distributor Code and Name Changes END
                            //<VK20210316> END
                            if((id)pricingRecord.get('Sales_Pricing_Procedure__c')==null || String.isBlank((id)pricingRecord.get('Sales_Pricing_Procedure__c')))
                                pricingReqItemObj.ERP_Pricing_Procedure__c = buOrgGroup.ERP_Pricing_Procedure__c;
                            else           
                                pricingReqItemObj.ERP_Pricing_Procedure__c = (id)pricingRecord.get('Sales_Pricing_Procedure__c');
                            
                            System.debug('tempKCDesc:'+tempKCDesc);
                            System.debug('mapkcField'+mapkcField);
                            System.debug('keyfields'+keyfields);
                            system.debug('All Kcs:'+allKcs);
                            /*George
Commented code to select KC fields on demand

pricingReqItemObj.Inco_terms__c = (string)pricingRecord.get('Incoterms1__c');                           
//pricingReqItemObj.Incoterms2__c = pricingRecord.;
pricingReqItemObj.Incoterms_Code__c = (string)pricingRecord.get('Incoterms_1_Code__c');
*/
                            
                            String tempKCCode=(string)pricingRecord.get('Key_Combination_Code__c');
                            String tempBU=(string)pricingRecord.get('BU__c');
                            system.debug('tempKCDesc:'+tempKCDesc+'- tempKCCode:'+tempKCCode+',tempBU:'+tempBU);
                            if(tempKCDesc!=Null && tempKCCode!=Null && tempKCDesc.containsignorecase('Sold to') && (tempBU.contains('DPP') || tempBU == 'DCP AP') && (tempKCCode=='A580' || tempKCCode=='A832')){
                                pricingReqItemObj.Key_Combination__c = (string)pricingRecord.get('Key_Combination__c');
                                pricingReqItemObj.Key_Combination_Code__c = (string)pricingRecord.get('Key_Combination_Code__c')+'SD';
                            }
                            else if(tempKCDesc!=Null && tempKCCode!=Null && tempKCDesc.containsignorecase('Ship to') && (tempBU.contains('DPP') || tempBU == 'DCP AP') && (tempKCCode=='A580' || tempKCCode=='A832')){
                                pricingReqItemObj.Key_Combination__c = (string)pricingRecord.get('Key_Combination__c');
                                pricingReqItemObj.Key_Combination_Code__c = (string)pricingRecord.get('Key_Combination_Code__c')+'SH';
                            }
                            //<TJ20150308> 
                            else if(tempKCDesc!=Null && tempKCCode!=Null && tempKCDesc.containsignorecase('Sold to') && ((tempBU.contains('DPP Global')||tempBU.contains('DCP EMEA'))) && (tempKCCode=='A580' || tempKCCode=='A916' || tempKCCode=='A871' || tempKCCode=='A695' || tempKCCode=='A692') && ((string)pricingRecord.get('Sales_Org_Code__c')=='B900' || (string)pricingRecord.get('Sales_Org_Code__c')=='B918' || (string)pricingRecord.get('Sales_Org_Code__c')=='B971' || (string)pricingRecord.get('Sales_Org_Code__c')=='B950' || (string)pricingRecord.get('Sales_Org_Code__c')=='B974' || (string)pricingRecord.get('Sales_Org_Code__c')=='B902' || (string)pricingRecord.get('Sales_Org_Code__c')=='B99I' || (string)pricingRecord.get('Sales_Org_Code__c')=='B901' || tempBU.contains('DCP EMEA'))) //<AD20230613- Added new sales org codes for Derby - B902,B99I,B901>
                            {
                                pricingReqItemObj.Key_Combination__c = (string)pricingRecord.get('Key_Combination__c');
                                pricingReqItemObj.Key_Combination_Code__c = (string)pricingRecord.get('Key_Combination_Code__c')+'SD';
                            }
                            //<VK20210316> START
                            else if(tempKCDesc!=Null && tempKCCode!=Null && tempKCDesc.containsignorecase('Distributor')){
                                pricingReqItemObj.Distributor_Code__c = (string)pricingRecord.get('Distributor_Code__c');
                                pricingReqItemObj.Distributor_Name__c = (string)pricingRecord.get('Distributor_Name__c');
                            }
                            //<VK20210316> END
                            else if(tempKCDesc!=Null && tempKCCode!=Null && tempKCDesc.containsignorecase('End User') && (tempBU.contains('DPP Global')) && (tempKCCode=='A580' || tempKCCode=='A916' || tempKCCode=='A871' || tempKCCode=='A695' || tempKCCode=='A692') && ((string)pricingRecord.get('Sales_Org_Code__c')=='B900' || (string)pricingRecord.get('Sales_Org_Code__c')=='B918' || (string)pricingRecord.get('Sales_Org_Code__c')=='B971' || (string)pricingRecord.get('Sales_Org_Code__c')=='B950' || (string)pricingRecord.get('Sales_Org_Code__c')=='B974' || (string)pricingRecord.get('Sales_Org_Code__c')=='B902' || (string)pricingRecord.get('Sales_Org_Code__c')=='B99I' || (string)pricingRecord.get('Sales_Org_Code__c')=='B901' )) //<AD20230613- Added new sales org codes for Derby - B902,B99I,B901>
                            {
                                pricingReqItemObj.Key_Combination__c = (string)pricingRecord.get('Key_Combination__c');
                                pricingReqItemObj.Key_Combination_Code__c = (string)pricingRecord.get('Key_Combination_Code__c')+'EU';
                            }
                            else{
                                pricingReqItemObj.Key_Combination__c = (string)pricingRecord.get('Key_Combination__c');
                                pricingReqItemObj.Key_Combination_Code__c = (string)pricingRecord.get('Key_Combination_Code__c');
                            }
                            
                            pricingReqItemObj.Product_Hierarchy__c = (string)pricingRecord.get('Product_Hierarchy__c');
                            pricingReqItemObj.Profit_Center__c = (string)pricingRecord.get('Profit_Center__c');
                            pricingReqItemObj.Profit_Center_Code__c = (string)pricingRecord.get('Profit_Center_Code__c');
                            
                            /*George
Commented code to select KC fields on demand

pricingReqItemObj.Material__c = (string)pricingRecord.get('Material__c');
pricingReqItemObj.Material_Code__c = (string)pricingRecord.get('Material_Code__c');
pricingReqItemObj.Material_Price_Group__c = (string)pricingRecord.get('Material_Price_Group__c');
pricingReqItemObj.Material_Price_Group_Code__c = (string)pricingRecord.get('Material_Price_Group_Code__c');
//pricingReqItemObj.Non_Commercial_Products__c = pricingRecord.;

pricingReqItemObj.PH1_Code__c = (string)pricingRecord.get('PH1_Code__c');                           
pricingReqItemObj.PH2_Code__c = (string)pricingRecord.get('PH2_Code__c');                           
pricingReqItemObj.PH3_Code__c = (string)pricingRecord.get('PH3_Code__c');                           
pricingReqItemObj.PH4_Code__c = (string)pricingRecord.get('PH4_Code__c');                           
pricingReqItemObj.PH5_Code__c = (string)pricingRecord.get('PH5_Code__c');                           
pricingReqItemObj.PH6_Code__c = (string)pricingRecord.get('PH6_Code__c');                           
pricingReqItemObj.PH7_Code__c = (string)pricingRecord.get('PH7_Code__c');                           
pricingReqItemObj.PH8_Code__c = (string)pricingRecord.get('PH8_Code__c');                           
pricingReqItemObj.PH9_Code__c = (string)pricingRecord.get('PH9_Code__c');

pricingReqItemObj.Price_List_Type__c = (string)pricingRecord.get('Price_List_Type__c');
pricingReqItemObj.Price_List_Type_Code__c = (string)pricingRecord.get('Price_List_Type_Code__c');


//pricingReqItemObj.Pricing_Task_UoM__c = (string)pricingRecord.get('');
pricingReqItemObj.Product_Hierarchy__c = (string)pricingRecord.get('Product_Hierarchy__c');
//pricingReqItemObj.Product_Hierarchy_Code__c =  (string)pricingRecord.get('Product_Hierarchy_Code__c; //commented by shiva as this will be a formula field in Req Item also


pricingReqItemObj.Sales_Office__c = (string)pricingRecord.get('Sales_Office__c');
pricingReqItemObj.Sales_Office_Code__c = (string)pricingRecord.get('Sales_Office_Code__c');
pricingReqItemObj.Sales_District__c = (string)pricingRecord.get('Sales_District__c');
pricingReqItemObj.Sales_District_Code__c = (string)pricingRecord.get('Sales_District_Code__c');
pricingReqItemObj.Sales_Org__c = (string)pricingRecord.get('Sales_Org__c');
pricingReqItemObj.Sales_Org_Code__c = (string)pricingRecord.get('Sales_Org_Code__c');

//pricingReqItemObj.Terms_Of_Payment__c = pricingRecord.Terms_Of_Payment__c;
pricingReqItemObj.Terms_Of_Payment_Code__c = (string)pricingRecord.get('Terms_of_Payment_Code__c');

pricingReqItemObj.Material_Group_1__c = (string)pricingRecord.get('Material_Group_1__c');
pricingReqItemObj.Material_Group_1_Code__c = (string)pricingRecord.get('Material_Group_1_Code__c');

pricingReqItemObj.Kcode__c = (string)pricingRecord.get('Kcode__c');
pricingReqItemObj.Partner_ZF__c = (string)pricingRecord.get('Partner_ZF__c');
pricingReqItemObj.Partner_ZF_Code__c = (string)pricingRecord.get('Partner_ZF_Code__c');
pricingReqItemObj.Payer__c = (string)pricingRecord.get('Payer__c');
pricingReqItemObj.Payer_Code__c = (string)pricingRecord.get('Payer_Code__c');

pricingReqItemObj.Disc_Ref_No__c = (string)pricingRecord.get('Disc_Ref_No__c');
pricingReqItemObj.FixValDate__c = Date.valueOf(pricingRecord.get('FixValDate__c'));
pricingReqItemObj.Campaign__c = (string)pricingRecord.get('Campaign__c');
pricingReqItemObj.Campaign_Code__c = (string)pricingRecord.get('Campaign_Code__c');
pricingReqItemObj.Document_Currency__c = (string)pricingRecord.get('Document_Currency__c');
pricingReqItemObj.Document_Currency_Code__c = (string)pricingRecord.get('Document_Currency_Code__c');
pricingReqItemObj.State__c = (string)pricingRecord.get('State__c');
pricingReqItemObj.State_Code__c = (string)pricingRecord.get('State_Code__c');


*/
                            
                            
                            //system.debug('****@@@@ old volume & uom:'+pricingReqItemObj.Volume__c+','+pricingReqItemObj.Volume_UoM__c);
                            /*populating SFDC KC*/
                            String finalKC ='';
                            //<PP20140502> START
                            String pcKCCon = (string)pricingRecord.get('Pricing_Condition_Code__c')
                                + (string)pricingRecord.get('Key_Combination_Code__c');
                            system.debug('!^%@^%pckcprice:-'+pcKCCon);
                            system.debug('@%$%#^kcMap:-'+kcIdandKcDescMap);
                            //<AV20151003>-Start-Production issue-KC desc null for A580SD when adding prices
                            for(String key : kcIdandKcDescMap.keySet())
                            {
                                String orgKey = key;
                                system.debug('#&&**&'+key);
                                //String PCKC1 = (key+'d').substring(9,10);
                                String PCKC = key.right(2);
                                system.debug('*#&#^!^'+PCKC+','+key);
                                if(PCKC.isAlpha())
                                {
                                    String revKey = key.reverse();
                                    String splitKey = revKey.substring(2);
                                    Key = splitKey.reverse();
                                }
                                if(key.equals(pcKCCon))
                                {
                                    system.debug('@^%#1');
                                    String priceKCdesc = (string)pricingRecord.get('Key_Combination__c');
                                    system.debug('@^%#2'+priceKCdesc);
                                    //<TJ20150320> Added Condition for End User
                                    if(priceKCdesc.containsignoreCase('Sold to') || priceKCdesc.containsignoreCase('Ship to') || priceKCdesc.containsignoreCase('End User'))
                                    {
                                        system.debug('@^%#3');
                                        String keyKCdesc = kcIdandKcDescMap.get(orgkey);
                                        system.debug('@^%#4'+keyKCdesc);                                
                                        if(((keyKCdesc.containsignoreCase('Sold-to') || keyKCdesc.containsignoreCase('Sold to') || keyKCdesc.containsignoreCase('Customer Specific') || keyKCdesc.containsignoreCase('Customer'))&&(priceKCdesc.containsignoreCase('Sold to')) || priceKCdesc.containsignoreCase('Sold-to')) || ((keyKCdesc.containsignoreCase('Ship to') || keyKCdesc.containsignoreCase('Ship-to'))&&(priceKCdesc.containsignoreCase('Ship to') || priceKCdesc.containsignoreCase('Ship-to'))))
                                        {
                                            system.debug('@^%#5');
                                            finalKC=kcIdandKcDescMap.get(orgkey);
                                            System.debug('***123finalKC'+finalKC);
                                        }
                                    }
                                    else
                                    {
                                        finalKC=kcIdandKcDescMap.get(orgkey);
                                        System.debug('***finalKC'+finalKC);
                                    }
                                }
                            }
                            //<AV20151003>-End-Production issue-KC desc null for A580SD when adding prices
                            /**if(kcIdandKcDescMap.containsKey(pcKCCon))
{
finalKC=kcIdandKcDescMap.get(pcKCCon);
System.debug('***finalKC'+finalKC);
}**/
                            if(request.pricingRequest.Pricing_Request_Type__c != 'Pricing Task')
                            {
                                //<AV20151003>-Start-Production issue-NPC,floor,vol,payment terms checkbox not getting checked
                                system.debug('!^@%^npcmap:'+pcKCCodeisNPCAppMap);
                                system.debug('#^%&^@ptmmap:'+pcKCCodeisPmtTermsAppMap);
                                system.debug('#^%#^#^volmap:'+pcKCCodeisVolumeAppMap);
                                for(String key : pcKCCodeisNPCAppMap.keySet())
                                {
                                    String org1Key = key;
                                    system.debug('#&&**&1'+key);
                                    //String PCKC1 = (key+'d').substring(9,10);
                                    String PCKC1 = key.right(2);
                                    system.debug('*#&#^!^1'+PCKC1+','+key);
                                    if(PCKC1.isAlpha())
                                    {
                                        String revKey1 = key.reverse();
                                        String splitKey1 = revKey1.substring(2);
                                        Key = splitKey1.reverse();
                                    }
                                    if(key.equals(pcKCCon))
                                    {
                                        system.debug('@^%#12');
                                        String priceKCdesc1 = (string)pricingRecord.get('Key_Combination__c');
                                        system.debug('@^%#22'+priceKCdesc1);
                                        //<TJ20150320> Added Condition for End User
                                        if(priceKCdesc1.containsignoreCase('Sold to') || priceKCdesc1.containsignoreCase('Ship to') || priceKCdesc1.containsignoreCase('End User'))
                                        {
                                            system.debug('@^%#33');
                                            //<TJ20150320> Added Condition for End User
                                            if(((org1key.containsignoreCase('SD'))&&(priceKCdesc1.containsignoreCase('Sold to') || priceKCdesc1.containsignoreCase('Sold-to'))) || ((org1key.containsignoreCase('SH'))&&(priceKCdesc1.containsignoreCase('Ship to') || priceKCdesc1.containsignoreCase('Ship-to'))) || ((org1key.containsignoreCase('EU'))&&(priceKCdesc1.containsignoreCase('End User'))))
                                            {
                                                system.debug('@^%#55');
                                                pricingReqItemObj.isNPCApplicable__c = pcKCCodeisNPCAppMap.get(org1Key);
                                                system.debug('#^%#^123'+pricingReqItemObj.isNPCApplicable__c);
                                            }
                                            //<AV20151103>-Start-added else condition
                                            else if(!(org1key.containsignoreCase('SD') || org1key.containsignoreCase('SH') || org1key.containsignoreCase('EU')))
                                            {
                                                pricingReqItemObj.isNPCApplicable__c = pcKCCodeisNPCAppMap.get(org1Key);
                                                system.debug('#*^$&67'+pricingReqItemObj.isNPCApplicable__c);
                                            }
                                            //<AV20151103>-End-added else condition
                                        }
                                        else
                                        {
                                            pricingReqItemObj.isNPCApplicable__c = pcKCCodeisNPCAppMap.get(org1Key);
                                            system.debug('#^%#^1234'+pricingReqItemObj.isNPCApplicable__c);
                                        }
                                    }
                                }
                                for(String key : pcKCCodeisPmtTermsAppMap.keySet())
                                {
                                    String org2Key = key;
                                    system.debug('#&&**&1'+key);
                                    //String PCKC1 = (key+'d').substring(9,10);
                                    String PCKC2 = key.right(2);
                                    system.debug('*#&#^!^1'+PCKC2+','+key);
                                    if(PCKC2.isAlpha())
                                    {
                                        String revKey2 = key.reverse();
                                        String splitKey2 = revKey2.substring(2);
                                        Key = splitKey2.reverse();
                                    }
                                    if(key.equals(pcKCCon))
                                    {
                                        system.debug('@^%#12');
                                        String priceKCdesc2 = (string)pricingRecord.get('Key_Combination__c');
                                        system.debug('@^%#22'+priceKCdesc2);
                                        //<TJ20150320> Added Condition for End User
                                        if(priceKCdesc2.containsignoreCase('Sold to') || priceKCdesc2.containsignoreCase('Ship to') || priceKCdesc2.containsignoreCase('End User'))
                                        {
                                            system.debug('@^%#33');
                                            //<TJ20150320> Added Condition for End User
                                            if(((org2key.containsignoreCase('SD'))&&(priceKCdesc2.containsignoreCase('Sold to') || priceKCdesc2.containsignoreCase('Sold-to'))) || ((org2key.containsignoreCase('SH'))&&(priceKCdesc2.containsignoreCase('Ship to') || priceKCdesc2.containsignoreCase('Ship-to'))) || ((org2key.containsignoreCase('EU'))&&(priceKCdesc2.containsignoreCase('End User'))))
                                            {
                                                system.debug('@^%#55');
                                                pricingReqItemObj.isPaymentTermsApplicable__c = pcKCCodeisPmtTermsAppMap.get(org2Key);
                                                system.debug('#^%#^123'+pricingReqItemObj.isPaymentTermsApplicable__c);
                                            }
                                            //<AV20151103>-Start-added else condition
                                            else if(!(org2key.containsignoreCase('SD') || org2key.containsignoreCase('SH') || org2key.containsignoreCase('EU')))
                                            {
                                                pricingReqItemObj.isPaymentTermsApplicable__c = pcKCCodeisPmtTermsAppMap.get(org2Key);
                                                system.debug('#*^$&67'+pricingReqItemObj.isPaymentTermsApplicable__c);
                                            }
                                            //<AV20151103>-End-added else condition
                                        }
                                        else
                                        {
                                            pricingReqItemObj.isPaymentTermsApplicable__c = pcKCCodeisPmtTermsAppMap.get(org2Key);
                                            system.debug('#^%#^1234'+pricingReqItemObj.isPaymentTermsApplicable__c);
                                        }
                                    }
                                }
                                for(String key : pcKCCodeisVolumeAppMap.keySet())
                                {
                                    String org3Key = key;
                                    system.debug('#&&**&1'+key);
                                    //String PCKC1 = (key+'d').substring(9,10);
                                    String PCKC3 = key.right(2);
                                    system.debug('*#&#^!^1'+PCKC3+','+key);
                                    if(PCKC3.isAlpha())
                                    {
                                        String revKey3 = key.reverse();
                                        String splitKey3 = revKey3.substring(2);
                                        Key = splitKey3.reverse();
                                    }
                                    if(key.equals(pcKCCon))
                                    {
                                        system.debug('@^%#12');
                                        String priceKCdesc3 = (string)pricingRecord.get('Key_Combination__c');
                                        system.debug('@^%#22'+priceKCdesc3);
                                        //<TJ20150320> Added Condition for End User
                                        if(priceKCdesc3.containsignoreCase('Sold to') || priceKCdesc3.containsignoreCase('Ship to') || priceKCdesc3.containsignoreCase('End User'))
                                        {
                                            system.debug('@^%#33');
                                            //<TJ20150320> Added Condition for End User
                                            if(((org3key.containsignoreCase('SD'))&&(priceKCdesc3.containsignoreCase('Sold to') || priceKCdesc3.containsignoreCase('Sold-to'))) || ((org3key.containsignoreCase('SH'))&&(priceKCdesc3.containsignoreCase('Ship to') || priceKCdesc3.containsignoreCase('Ship-to'))) || ((org3key.containsignoreCase('EU'))&&(priceKCdesc3.containsignoreCase('End User'))))
                                            {
                                                system.debug('@^%#55');
                                                pricingReqItemObj.isVolumeApplicable__c = pcKCCodeisVolumeAppMap.get(org3Key);
                                                system.debug('#^%#^123'+pricingReqItemObj.isVolumeApplicable__c);
                                            }
                                            //<AV20151103>-Start-added else condition
                                            else if(!(org3key.containsignoreCase('SD') || org3key.containsignoreCase('SH') || org3key.containsignoreCase('EU')))
                                            {
                                                pricingReqItemObj.isVolumeApplicable__c = pcKCCodeisVolumeAppMap.get(org3Key);
                                                system.debug('#*^$&67'+pricingReqItemObj.isVolumeApplicable__c);
                                            }
                                            //<AV20151103>-End-added else condition
                                        }
                                        else
                                        {
                                            pricingReqItemObj.isVolumeApplicable__c = pcKCCodeisVolumeAppMap.get(org3Key);
                                            system.debug('#^%#^1234'+pricingReqItemObj.isVolumeApplicable__c);
                                        }
                                    }
                                }
                                
                                /**if(pcKCCodeisNPCAppMap.containsKey(pcKCCon))
{
pricingReqItemObj.isNPCApplicable__c = pcKCCodeisNPCAppMap.get(pcKCCon);
}**/
                                /**if(pcKCCodeisPmtTermsAppMap.containsKey(pcKCCon))
{
pricingReqItemObj.isPaymentTermsApplicable__c = pcKCCodeisPmtTermsAppMap.get(pcKCCon);
}**/
                                
                                //<AV20140515>-starts
                                /**if(pcKCCodeisVolumeAppMap.containsKey(pcKCCon))
{
pricingReqItemObj.isVolumeApplicable__c = pcKCCodeisVolumeAppMap.get(pcKCCon);
}**/
                                //<AV20140515>-ends
                            }
                            system.debug('#^%^@!^flrrefmap:'+pcKCCodeisFlrRefAppMap);
                            for(String key : pcKCCodeisFlrRefAppMap.keySet())
                            {
                                String org4Key = key;
                                system.debug('#&&**&1'+key);
                                //String PCKC1 = (key+'d').substring(9,10);
                                String PCKC4 = key.right(2);
                                system.debug('*#&#^!^1'+PCKC4+','+key);
                                if(PCKC4.isAlpha())
                                {
                                    String revKey4 = key.reverse();
                                    String splitKey4 = revKey4.substring(2);
                                    Key = splitKey4.reverse();
                                }
                                if(key.equals(pcKCCon))
                                {
                                    system.debug('@^%#12');
                                    String priceKCdesc4 = (string)pricingRecord.get('Key_Combination__c');
                                    system.debug('@^%#22'+priceKCdesc4);
                                    //<TJ20150320> Added Condition for End User
                                    if(priceKCdesc4.containsignoreCase('Sold to') || priceKCdesc4.containsignoreCase('Ship to') || priceKCdesc4.containsignoreCase('End User'))
                                    {
                                        system.debug('@^%#33');
                                        //<TJ20150320> Added Condition for End User
                                        if(((org4key.containsignoreCase('SD'))&&(priceKCdesc4.containsignoreCase('Sold to') || priceKCdesc4.containsignoreCase('Sold-to'))) || ((org4key.containsignoreCase('SH'))&&(priceKCdesc4.containsignoreCase('Ship to') || priceKCdesc4.containsignoreCase('Ship-to'))) || ((org4key.containsignoreCase('EU'))&&(priceKCdesc4.containsignoreCase('End User'))))
                                        {
                                            system.debug('@^%#55');
                                            pricingReqItemObj.isFloorApplicable__c = pcKCCodeisFlrRefAppMap.get(org4Key);
                                            system.debug('#^%#^123'+pricingReqItemObj.isFloorApplicable__c);
                                        }
                                        //<AV20151103>-Start-added else condition
                                        else if(!(org4key.containsignoreCase('SD') || org4key.containsignoreCase('SH') || org4key.containsignoreCase('EU')))
                                        {
                                            pricingReqItemObj.isFloorApplicable__c = pcKCCodeisFlrRefAppMap.get(org4Key);
                                            system.debug('#*^$&67'+pricingReqItemObj.isFloorApplicable__c);
                                        }
                                        //<AV20151103>-End-added else condition
                                    }
                                    else
                                    {
                                        pricingReqItemObj.isFloorApplicable__c = pcKCCodeisFlrRefAppMap.get(org4Key);
                                        system.debug('#^%#^1234'+pricingReqItemObj.isFloorApplicable__c);
                                    }
                                }
                            }
                            //<AV20151003>-End-Production issue-NPC,floor,vol,payment terms checkbox not getting checked
                            
                            /**if(pcKCCodeisFlrRefAppMap.containsKey(pcKCCon))
{
pricingReqItemObj.isFloorApplicable__c = pcKCCodeisFlrRefAppMap.get(pcKCCon);
}**/
                            
                            //<PP20140502> END
                            
                            pricingReqItemObj.Key_Combination_SFDC__c=finalKC;
                            request.SFDCKCDesc=finalKC;
                            /*end*/
                            //added for updating spot price to 0 in case of Free of charge (Prachi 6th feb)
                            if(request.pricingRequest.Pricing_Request_Type__c == 'Pricing Task' && request.pricingRequest.Spot_Type__c == 'Free of Charge')
                            {
                                pricingReqItemObj.New_Rate__c = '0';
                            }
                            pricingRequestItemSet.add(pricingReqItemObj);
                        }
                    }
                }
                
                for(Pricing_Request_Item__c pri : pricingRequestItemSet)
                {
                    pricingRequestItemList.add(pri);
                }
                
                System.debug('****** pricingRequestItemList'+pricingRequestItemList);
                //<PP20140502> START
                if(desiredAction.equalsIgnoreCase('AddSelectedPrices'))
                {
                    //request.pricingReqItemList=new List<Pricing_Request_Item__c>();
                    request.pricingReqItemList.addAll(pricingRequestItemList);
                    //System.debug('pricingReqItemList-KC :'+request.pricingReqItemList);
                    for(PARelatedList wRec1 : relatedWrappersList)
                    {
                        wRec1.selectAllFlag=false;  
                        for(Integer j = 0 ; j < wRec1.wrapperList.size(); j++)
                        {
                            if(wRec1.wrapperList[j].isSelected == true)
                            {
                                sObject a = wRec1.wrapperList.remove(j).sObjectRecord;
                                j = j - 1;
                            }
                        }
                    }
                    throw new PAException(System.Label.Selected_Records_Added_Info,ApexPages.Severity.INFO);
                }
                else
                {
                    insert pricingRequestItemList;
                }
                //<PP20140502> END
                List<Id> pri1Ids = new List<Id>();
                for(Pricing_Request_Item__c pri1 : pricingRequestItemList)
                {
                    pri1Ids.add(pri1.Id);
                }
                
                pricingRequestItemRecList = [SELECT Id,ERP_Sales_Prices_SAP__c,Pricing_Condition_Code__c,Key_Combination_Code__c,SAP_Cluster__c,SAP_Application_Id__c,
                                             SAP_Client_Id__c FROM Pricing_Request_Item__c WHERE Id IN :pri1Ids];
                String keyCombCode;
                String pricon;
                String sapClusterId;
                String sapAppId;
                String sapClientId;
                if(pricingRequestItemRecList != null && pricingRequestItemRecList.size()!=0)
                {
                    pricon = pricingRequestItemRecList[0].Pricing_Condition_Code__c;
                    keyCombCode = pricingRequestItemRecList[0].Key_Combination_Code__c;
                    sapClusterId = pricingRequestItemRecList[0].SAP_Cluster__c;
                    sapAppId = pricingRequestItemRecList[0].SAP_Application_Id__c;
                    sapClientId = pricingRequestItemRecList[0].SAP_Client_Id__c;
                }
                Set<Id> removeERPIdSet = new Set<Id>();
                List<ERP_Sales_Prices_SAP__c> finalERPList = new List<ERP_Sales_Prices_SAP__c>();
                for(Pricing_Request_Item__c pri2 : pricingRequestItemRecList)
                {
                    removeERPIdSet.add(pri2.ERP_Sales_Prices_SAP__c);
                }
                for(PARelatedList wRec1 : relatedWrappersList)
                {
                    wRec1.selectAllFlag=false;
                    for(Integer j = 0 ; j < wRec1.wrapperList.size(); j++)
                    {
                        //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Using the Sobject list to get the values
                        if(removeERPIdSet.contains((string)wRec1.wrapperList[j].sObjectRecord.get('Id')))
                        {
                            sObject a = wRec1.wrapperList.remove(j).sObjectRecord;
                            j = j - 1;
                        }
                    }
                } 
                boolean flag = true;
                for(Pricing_Request_Item__c pri : pricingRequestItemList)
                {
                    if(pri.Id == null)
                    {
                        flag = false;
                        break;
                    }
                }
                //added by Brundha on MARCH 11th 2013
                if(flag==true)
                {
                    if(keyCombCode !=null && request.pricingRequest!=null && request.pricingRequest.Request_Type__c=='Non Customer Specific')
                    {
                        request.dispNCS = 'dispNCS';
                        request.keyCombination.getKCFromCodeAndSAPCluster(keyCombCode,sapClusterId,sapAppId,sapClientId);
                        //<TJ20140902> Added statement to retain PCKC for non customer specific request
                        request.keyCombination.getPCKCFromCodeAndSAPCluster(pricon,keyCombCode,sapClusterId,sapAppId,sapClientId);
                    }
                    else
                    {
                        request.dispNCS = null;
                    }
                    
                    throw new PAException(System.Label.Selected_Records_Added_Info,ApexPages.Severity.INFO);
                }
            }
        }
        system.debug('Size of wrapper: -'+relatedWrappersList.size());
        system.debug('Size of wrapper: -'+relatedWrappersList);
        return newPagelabel;
    }
    
    //<VR20130717> Ver 3.5 VR 2013-07-17 APAC Rollout2-Modified all list to Sobject Lists
    private List<Sobject> changeValidityDates(List<Sobject> displayFetchedList) {
        /*Ver.1.8*/
        Map<Sobject,List<Sobject>> holderChildRecordMap =new Map<Sobject,List<Sobject>>();
        Sobject recordAdded ;
        Set<Sobject> priceHolderSet =new Set<Sobject>();
        List<Sobject> nonPriceHolderList =new List<Sobject>();
        List<Sobject> validFromList =new List<Sobject>();
        List<Sobject> childRecordsOfHolder=new List<Sobject>();
        List<Sobject> validToList =new List<Sobject>();
        List<Sobject> addFetchedList=new List<Sobject> ();
        //<AV20152206>-Production-heap size error on export
        Transient Set<Id> pricingRecHolderIdSet =new Set<Id>();
        for(Sobject e: displayFetchedList)
        {
            pricingRecHolderIdSet.add((Id)e.get('Price_Holder__c'));
        }    
        String prRec;
        system.debug(pricingRecHolderIdSet);  
        if(pricingRecHolderIdSet.size()>0)
        {
            prRec='(';
            for(String prRecId:pricingRecHolderIdSet)
            {
                if(prRecId!=null)
                    prRec=prRec+'\''+prRecId+'\',';
            }
            prRec=prRec.substring(0,prRec.length()-1);
            prRec=prRec+')';      
        }
        else
            prRec='()';
        //<VR20130509> Ver 3.2 VR 2013-05-10 APAC Rollout1-Adding Extra field Customer Hierarchy in query
        List<Sobject> priceHolderList = new List<Sobject>();
        if(displayFetchedList!=null && displayFetchedList.size()>0) {
            
            if(((string)displayFetchedList[0].get('Sales_Price_Type__c'))=='Floor' || ((string)displayFetchedList[0].get('Sales_Price_Type__c'))=='Reference' || ((string)displayFetchedList[0].get('Sales_Price_Type__c'))=='Net Reference' || ((string)displayFetchedList[0].get('Sales_Price_Type__c'))=='Net Floor') {
                /*priceHolderList=[SELECT Ship_To_Country_Code__c, Ship_To_Country__c, ShipTo__c, ShipTo_Code__c, Calculation_Type_Code__c,Calculation_Type__c,Condition_Class_Code__c,Condition_Class__c,Plus_Minus_Code__c,Plus_Minus__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
Customer_Specific__c,Dist_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,Incoterms_1_Code__c,Incoterms1__c,Market_Segment__c,Market_Segment_Code__c,Project__c,Variant__c,Variant_Code__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type__c,Sales_Order_Type_Code__c,
Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,
PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,
Product_Hierarchy__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Rate__c,Sales_Office_Code__c, Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,
Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Sold_To_Code__c,Sold_To__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,
Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Scale_UoM_Scale_Unit__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,
Scale_Quantity_Scale_Value8__c,Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,ScaleRate1__c,
ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Check_Scale__c,Check_Scale_Code__c,Scale_Basis__c,Scale_Basis_Code__c,Scale_Type__c,Scale_Type_Code__c,Char_Name__c, Kcode__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c FROM Sales_Prices__c WHERE Id =:pricingRecHolderIdSet AND(  Valid_From__c <= :validOnFilter AND Valid_To__c >= :validOnFilter)];*/
                priceHolderList=(List<Sales_Prices__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceNonSAP','Id IN '+prRec+' AND (Valid_From__c <='+string.valueof(validOnFilter).split(' ')[0]+' AND Valid_To__c >= '+string.valueof(validOnFilter).split(' ')[0]+')');
            }
            else {
                //<BB20130726> --Ver 3.8 Added Sales_Type__c,Sales_Type_Code__c in the query
                /*priceHolderList=[SELECT Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,
Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,Material_Price_Group_Code__c,
Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,
PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,
Price_List_Type__c,Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,
Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Product_Hierarchy_Code__c,
ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,ScaleRate4__c,
ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,ScaleRate8__c,
ScaleRate9__c,ScaleRate10__c,
Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,SAP_Application_Id__c,
SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,
ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,
Price_Holder__c,Volume__c,Volume_UoM__c,Pricing_Request__c,Pricing_Request__r.Name,Sales_District__c, Sales_District_Code__c FROM ERP_Sales_Prices_SAP__c WHERE Id =:pricingRecHolderIdSet AND(  Valid_From__c <= :validOnFilter AND Valid_To__c >= :validOnFilter) ];*/
                priceHolderList=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','erpSalesPriceSAP','Id IN '+prRec+' AND (Valid_From__c <= '+string.valueof(validOnFilter).split(' ')[0]+' AND Valid_To__c >= '+string.valueof(validOnFilter).split(' ')[0]+')');
            }
            system.debug(LoggingLevel.Error,'*** pricingRecHolderIdSet'+pricingRecHolderIdSet);
        }
        for(Sobject pholder: priceHolderList)
        {
            priceHolderSet.add(pholder);
        }
        /*added for seperating the holder query  Ver.1.8 end*/
        Map<Id,List<ERP_Sales_Prices_SAP__c>> newChildRecMap = new Map<Id,List<ERP_Sales_Prices_SAP__c>>();
        
        for(Sobject rec1: displayFetchedList)
        {
            if(!newChildRecMap.containskey((id)rec1.get('Price_Holder__c')))
            {
                //System.debug('*****in if');
                List<Sobject> l1=new List<Sobject>();
                l1.add(rec1);
                newChildRecMap.put((string)rec1.get('Price_Holder__c'),l1);
            }     
            else
            {       
                //System.debug('*****in else');
                List<Sobject> hRecList = newChildRecMap.get((string)rec1.get('Price_Holder__c'));
                hRecList.add(rec1);
                newChildRecMap.put((string)rec1.get('Price_Holder__c'),hRecList);
            } 
        }
        system.debug(LoggingLevel.Error,'#### priceHolderSet size '+priceHolderSet.size());
        system.debug(LoggingLevel.Error,'#### nonPriceHolderList size '+nonPriceHolderList.size());
        system.debug(LoggingLevel.Error,'#### newChildRecMap size '+newChildRecMap.size());
        
        Integer exportcount = 0;
        Integer fetch100count = 0;//<HL20150511 - Production issue fix for export>
        for(Sobject X: priceHolderSet)
        {    
            Integer flag=1;
            if(newChildRecMap.get((id)X.get('Id')) !=null)
            {
                system.debug(newChildRecMap.get((id)X.get('Id')));
                childRecordsOfHolder=  newChildRecMap.get((id)X.get('Id'));
                for(Sobject finalRec:childRecordsOfHolder)
                {
                    if(((Date)finalRec.get('Valid_From__c')) <= (Date)validOnFilter && ((Date)finalRec.get('Valid_To__c')) >= (Date)validOnFilter)
                    {
                        recordAdded =finalRec;
                        flag=0;
                        break;
                    } 
                }
            }
            validFromList=new List<Sobject>();
            validToList=new List<Sobject>();
            for(Sobject otherRec:childRecordsOfHolder)
            {
                if(recordAdded!=null)
                {
                    if(((DateTime)otherRec.get('Approved_Date__c')) > ((DateTime)recordAdded.get('Approved_Date__c')) )
                    {
                        if( (((Date)otherRec.get('Valid_From__c')) > validOnFilter) && (((Date)otherRec.get('Valid_From__c'))>=((Date)recordAdded.get('Valid_From__c'))) && (((Date)otherRec.get('Valid_From__c')) <= ((Date)recordAdded.get('Valid_To__c'))))
                        {
                            validFromList.add(otherRec);
                        }                  
                        
                        if((((Date)otherRec.get('Valid_To__c')) < validOnFilter) && (((Date)otherRec.get('Valid_To__c'))>=((Date)recordAdded.get('Valid_From__c'))) && (((Date)otherRec.get('Valid_To__c')) <= ((Date)recordAdded.get('Valid_To__c'))) )
                        {
                            validToList.add(otherRec);
                        }
                    }
                }
            }
            //System.debug(LoggingLevel.Error,'****validFromList'+validFromList+'****validToList'+validToList);
            if(validFromList.size()>1)
            {
                validFromList=PAUtil.sortList(validFromList,'Valid_From__c','asc');
            }
            if(validToList.size()>1)
            {
                validToList=PAUtil.sortList(validToList,'Valid_To__c', 'desc');
            }
            if(validFromList.size()!=0 && ((validOnFilter >= ((Date)recordAdded.get('Valid_From__c'))) && (validOnFilter <= ((Date)validFromList.get(0).get('Valid_From__c')))))
            {
                recordAdded.put('Valid_To__c',((Date)validFromList.get(0).get('Valid_From__c')).addDays(-1));
            }
            if(validToList.size()!=0 && ((validOnFilter <= ((Date)recordAdded.get('Valid_To__c'))) && (validOnFilter >= ((Date)validToList.get(0).get('Valid_To__c')))))
            {
                recordAdded.put('Valid_From__c',((Date)validToList.get(0).get('Valid_To__c')).addDays(1)) ;       
            }
            //change rate logic
            //add to wrapper
            if(recordAdded!=null && flag==0)
            {   
                System.debug('****exportcsv'+exportcsv+countfetch100+addFetchedList.size());
                
                if(exportcsv == true){
                    //<GT20150511> Added code to compare the KC code from selected PCKC, Price record to populate the export list with selected KC Code
                    if(recordAdded.get('Key_Combination_Code__c') !=KCCOde)
                    {
                        recordAdded.put('Key_Combination_Code__c',KCCOde);
                    }
                    exportcount = exportcount+1;
                    addFetchedList.add(recordAdded);
                    if(exportcount == 1000)
                        break;
                }
                //<HL20150511 start - Production issue fix for export>
                else if(countfetch100 == true && fetch100 == false){
                    fetch100count = fetch100count+1;
                    addFetchedList.add(recordAdded);
                    if(fetch100count == 100)
                        break;
                }
                //<HL20150511 end - Production issue fix for export>
                else 
                {
                    addFetchedList.add(recordAdded);                  
                }
            }
            
        }
        
        return addFetchedList;
        
    }
    
    /*
* Author       :   
* Method Name  :   cloneValidation
* Parameters   :
* Return type  :   List<Pricing_Request_Item__c>
* Description  :   This method is used to validate the request item while cloning a request.
*/
    //<BB20140404> - 
    public List<Pricing_Request_Item__c>  cloneValidation(List<Pricing_Request_Item__c> pricingRequestItemList,Pricing_Request__c priceReqClone)
    {
        List<String> PCKCpriItemList= new List<String>();
        Set<String> priItemKeyComSet= new Set<String>();
        Set<String> priItemKeyComCodeSet= new Set<String>();
        Set<String> priItemPCSet= new Set<String>();
        Set<String> priItemMatSet= new Set<String>();
        Set<String> priItemSoldToSet= new Set<String>();
        Set<String> priItemShipToSet= new Set<String>();
        Set<String> priItemEndUserSet= new Set<String>();
        Map<String,boolean> pcKCCodeisNPCAppMap = new Map<String,boolean>();
        Map<String,boolean> pcKCCodeisFlrRefAppMap = new Map<String,boolean>();
        Map<String,boolean> pcKCCodeisPmtTermsAppMap = new Map<String,boolean>();
        Map<String,boolean> pcKCCodeisVolumeAppMap = new Map<String,boolean>();
        
        
        
        String selectedBU,reqSalesOrgCode,reqDistChannelCode,reqDivCode;
        List<ERP_Sales_Prices_SAP__c> erpSalesPricesList= new List<ERP_Sales_Prices_SAP__c>();
        ERP_Sales_Prices_SAP__c erpRec= new ERP_Sales_Prices_SAP__c();
        List<Date> expValidTo = new List<Date>();
        Date valFrm;
        String reqItemOldSOCode,reqItemOldDCCode,reqItemOldDivCode;
        Map<Date,ERP_Sales_Prices_SAP__c> expMap= new Map<Date,ERP_Sales_Prices_SAP__c>(); 
        Boolean expFlag= false;
        String pckc;
        List<String> orgGroupItemCurr= new List<String>();
        List<String> orgGroupItemUoM= new List<String>();
        List<String> orgGroupItemNonstdPay= new List<String>();
        //<AV20140617>
        String defaultUoM;
        
        
        system.debug('**** inside cloneValidation pricingRequestItemList'+ pricingRequestItemList.size()+ pricingRequestItemList);
        valFrm=priceReqClone.Request_Valid_From__c;
        reqsalesOrgCode=priceReqClone.Sales_Org_Code__c;
        reqdistChannelCode=priceReqClone.Dist_Channel_Code__c;
        reqdivCode=priceReqClone.Division_Code__c;
        selectedBU=request.requestServiceState.ogItems.selectedBU;
        //<AV20140612> added Default_Per_Value__c,Default_Per_UoM_Setup__c,Default_SalesArea_UoM__c fields in the query
        Organizational_Group_Item__c buOrgGroup = [SELECT isVolumeApplicable__c,isPaymentTermsApplicable__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,
                                                   ERP_Pricing_Procedure__r.SAP_Application_Id__c,ERP_Pricing_Procedure__r.SAP_Client_Id__c,Id,Default_Per_UoM_Setup__c,Enable_Variable_Config_Materials__c,ERP_UoM__c,ERP_Currency__c,Include_Customer_Currency__c,Default_Per_Value__c,Default_SalesArea_UoM__c  
                                                   FROM Organizational_Group_Item__c WHERE Business__c =:selectedBU  AND 
                                                   OrgGroup__r.ERP_Sales_Org_Code__c = :reqsalesOrgCode AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :reqdistChannelCode AND
                                                   OrgGroup__r.ERP_Division_Code__c = :reqdivCode];
        
        //retrieving the PCKC value for the request item in case the salesarea is changed during Cloning a request
        //retriving the material code,Shipto Code,Enduser code from RequestItems to a set. 
        for(Integer i=0;i< pricingRequestItemList.size();i++)
        {
            String priItemKeyCom = pricingRequestItemList.get(i).Key_Combination__c;
            String priItemPC=pricingRequestItemList.get(i).Pricing_Condition_Code__c;
            reqItemOldSOCode=pricingRequestItemList.get(i).Sales_Org_Code__c;
            reqItemOldDCCode=pricingRequestItemList.get(i).Dist_Channel_Code__c;
            reqItemOldDivCode=pricingRequestItemList.get(i).Division_Code__c;
            pricingRequestItemList.get(i).Approval_Status__c='Draft';
            pricingRequestItemList.get(i).Approved_Date__c=null;
            pricingRequestItemList.get(i).Approver1__c=null;
            pricingRequestItemList.get(i).Approver2__c=null;
            pricingRequestItemList.get(i).Approver3__c=null;
            pricingRequestItemList.get(i).Approver4__c=null;
            pricingRequestItemList.get(i).Approver5__c=null;
            pricingRequestItemList.get(i).Approver1_Date__c=null;
            pricingRequestItemList.get(i).Approver2_Date__c=null;
            pricingRequestItemList.get(i).Approver3_Date__c=null;
            pricingRequestItemList.get(i).Approver4_Date__c=null;
            pricingRequestItemList.get(i).Approver5_Date__c=null;
            pricingRequestItemList.get(i).Net_Price_Status__c=null;
            pricingRequestItemList.get(i).New__c=false;
            pricingRequestItemList.get(i).Below_Current_Flag__c=false;
            pricingRequestItemList.get(i).Below_Floor_Flag__c=false;
            pricingRequestItemList.get(i).Below_Reference_Flag__c=false;
            pricingRequestItemList.get(i).Below_Floor_Price__c=null;
            pricingRequestItemList.get(i).Below_Reference_Price__c=null;
            pricingRequestItemList.get(i).Stamp_Converted_Current_Price__c=null;
            pricingRequestItemList.get(i).Stamp_Current_Net_Price__c=null;
            pricingRequestItemList.get(i).Stamp_Floor_Net_Price__c=null;
            pricingRequestItemList.get(i).Stamp_Floor_Price__c=null;
            pricingRequestItemList.get(i).Stamp_New_Net_Price__c=null;
            pricingRequestItemList.get(i).Stamp_Reference_Net_Price__c=null;
            pricingRequestItemList.get(i).Stamp_Reference_Price__c=null;
            pricingRequestItemList.get(i).Expire__c=false;
            pricingRequestItemList.get(i).ERP_Pricing_Procedure__c=buOrgGroup.ERP_Pricing_Procedure__c;
            
            if(priceReqClone.SoldTo_Code__c != pricingRequestItemList.get(i).Sold_To_Code__c || (priceReqClone.Sales_Org_Code__c != pricingRequestItemList.get(i).Sales_Org_Code__c && priceReqClone.Dist_Channel_Code__c != pricingRequestItemList.get(i).Dist_Channel_Code__c))
            {
                String matCodeTrim;               
                pricingRequestItemList.get(i).Sold_To_Code__c=priceReqClone.SoldTo_Code__c;
                pricingRequestItemList.get(i).Sales_Org_Code__c=priceReqClone.Sales_Org_Code__c;
                if(priItemKeyCom.containsIgnoreCase('Dist. Channel'))
                    pricingRequestItemList.get(i).Dist_Channel_Code__c=priceReqClone.Dist_Channel_Code__c;
                if(priItemKeyCom.containsIgnoreCase('Division'))
                    pricingRequestItemList.get(i).Division_Code__c=priceReqClone.Division_Code__c;
                
                if(pricingRequestItemList.get(i).Material_Code__c != null){
                    matCodeTrim = pricingRequestItemList.get(i).Material_Code__c.trim();
                }
                
                
                //<MS20140515> Added Variant and SalesOrderType fields in the query codes to pckc
                //<SS20220826> Added Sales Order Item fields in the query codes to pckc
                //<SS20230501> Added M&M P80 key fields in query code to pckc
                pckc=pricingRequestItemList.get(i).Pricing_Condition_Code__c+pricingRequestItemList.get(i).Sales_Org_Code__c+
                    pricingRequestItemList.get(i).Dist_Channel_Code__c+pricingRequestItemList.get(i).Division_Code__c+pricingRequestItemList.get(i).Sold_To_Code__c+              
                    matCodeTrim+pricingRequestItemList.get(i).F_Product_Hierarchy_Code__c+ pricingRequestItemList.get(i).ShipTo_Code__c +
                    pricingRequestItemList.get(i).Sales_Office_Code__c + pricingRequestItemList.get(i).Customer_Price_Group_Code__c + 
                    pricingRequestItemList.get(i).Material_Price_Group_Code__c + pricingRequestItemList.get(i).Price_List_Type_Code__c+ pricingRequestItemList.get(i).Terms_Of_Payment_Code__c + 
                    pricingRequestItemList.get(i).Disc_Ref__c +pricingRequestItemList.get(i).End_Use_Code__c+ pricingRequestItemList.get(i).Market_Segment_Code__c+
                    pricingRequestItemList.get(i).Variant_Code__c +pricingRequestItemList.get(i).Contract_Code__c+pricingRequestItemList.get(i).Sales_Order_Type_Code__c+pricingRequestItemList.get(i).Sales_Order_Item_Code__c+
                    pricingRequestItemList.get(i).Value_Center_Code__c+pricingRequestItemList.get(i).Material_group_2_Code__c+pricingRequestItemList.get(i).Ext_Matl_Grp_Code__c+pricingRequestItemList.get(i).Price_Zone_Code__c+
                    pricingRequestItemList.get(i).ComPartner_Code__c + pricingRequestItemList.get(i).Material_Group_5_Key_Code__c +pricingRequestItemList.get(i).Plant_Code__c+
                    pricingRequestItemList.get(i).Shipping_Condition_Code__c +pricingRequestItemList.get(i).Destination_Country_Code__c+
                    pricingRequestItemList.get(i).Price_Ref_Partner_Code__c+pricingRequestItemList.get(i).Country_Code__c +pricingRequestItemList.get(i).End_User_Code__c+ 
                    pricingRequestItemList.get(i).Customer_Hierarchy_Code__c+pricingRequestItemList.get(i).Profit_Center_Code__c+
                    pricingRequestItemList.get(i).Ship_To_Country_Code__c+pricingRequestItemList.get(i).Incoterms_Code__c+pricingRequestItemList.get(i).Material_Group_1_Code__c+pricingRequestItemList.get(i).Sales_District_Code__c+
                    pricingRequestItemList.get(i).Partner_ZF_Code__c+pricingRequestItemList.get(i).Payer_Code__c+pricingRequestItemList.get(i).FixValDate__c+pricingRequestItemList.get(i).Disc_Ref_No__c+
                    pricingRequestItemList.get(i).Campaign_Code__c+pricingRequestItemList.get(i).Document_Currency_Code__c+pricingRequestItemList.get(i).State_Code__c;
                
                
            }
            else{
                
                pckc=(String)pricingRequestItemList.get(i).get('PCKC__c');
                
            }
            if(pckc!=null)
            {
                pckc=pckc.remove('null');
                system.debug('****@@@@PCKC'+pckc);
            }
            
            PCKCpriItemList.add(pckc); 
            system.debug('****@@@@PCKCpriItemList'+PCKCpriItemList.size()+PCKCpriItemList);
            priItemKeyComSet.add(priItemKeyCom);
            priItemPCSet.add(priItemPC);
            priItemKeyComCodeSet.add(pricingRequestItemList.get(i).Key_Combination_Code__c);
            
            if(pricingRequestItemList.get(i).Material_Code__c!= null)
            {
                String priItemMat=pricingRequestItemList.get(i).Material_Code__c.trim();
                priItemMatSet.add(priItemMat.trim()); 
            }
            if(pricingRequestItemList.get(i).Sold_To_Code__c!= null)
            {
                String priItemSoldTo=pricingRequestItemList.get(i).Sold_To_Code__c;
                priItemSoldToSet.add(priItemSoldTo); 
            }
            if(pricingRequestItemList.get(i).ShipTo_Code__c!= null)
            {
                String priItemShipTo=pricingRequestItemList.get(i).ShipTo_Code__c;
                priItemShipToSet.add(priItemShipTo); 
            }
            if(pricingRequestItemList.get(i).End_User_Code__c!= null){
                String priItemEndUser=pricingRequestItemList.get(i).End_User_Code__c;
                priItemEndUserSet.add(priItemEndUser); 
            }                    
        }
        
        system.debug('**** PCKCpriItemList'+ PCKCpriItemList); 
        
        system.debug('**** inside cloneValidation PCKCpriItemList'+ PCKCpriItemList.size()+ PCKCpriItemList);
        
        //<MS20140515> Added Variant and SalesOrderType fields in the query
        //<SS20220826> Added Sales Order Item fields in the query 
        //<SS20230501> Added M&M P80 key fields in query 
        erpSalesPricesList = [SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,Calculation_Type_Code__c,Calculation_Type__c,
                              Check_Scale_Code__c,Check_Scale__c,Condition_Class_Code__c,Condition_Class__c,Customer_Hierarchy_Code__c,Customer_Hierarchy__c,
                              Plus_Minus_Code__c,Plus_Minus__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Type_Code__c,Price_Ref_Partner_Code__c,Price_Ref_Partner__c,
                              Market_Segment_Code__c,Market_Segment__c,Contract_Code__c,Contract__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Material_Group_5_Key__c,Material_Group_5_Key_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c, Sales_Order_Item_Code__c,Value_Center__c, Value_Center_Code__c, Material_group_2__c, Material_group_2_Code__c, Ext_Matl_Grp__c, Ext_Matl_Grp_Code__c, Price_Zone__c, Price_Zone_Code__c
, Sales_Order_Item__c,Id,Name,Country_Code__c,Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
                              Customer_Specific__c,Distribution_Channel_Code__c,Dist_Channel__c,Division__c,Division_Code__c,Disc_Ref__c,End_Use_Code__c,End_Use__c,
                              End_User_Code__c,End_User__c,Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,
                              Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,
                              PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,
                              Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Product_Hierarchy_Code__c,Profit_Center_Code__c,
                              Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,
                              Sales_Pricing_Procedure__c,SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Scaled_Price_Flag__c,Scale_UoM_Scale_Unit__c,
                              Scale_Quantity_Scale_Value1__c,ScaleRate1__c,Scale_Quantity_Scale_Value2__c,ScaleRate2__c,Scale_Quantity_Scale_Value3__c,ScaleRate3__c,
                              Scale_Quantity_Scale_Value4__c,ScaleRate4__c,Scale_Quantity_Scale_Value5__c,ScaleRate5__c,Scale_Quantity_Scale_Value6__c,ScaleRate6__c,
                              Scale_Quantity_Scale_Value7__c,ScaleRate7__c,Scale_Quantity_Scale_Value8__c,ScaleRate8__c,Scale_Quantity_Scale_Value9__c,ScaleRate9__c,
                              Scale_Quantity_Scale_Value10__c,ScaleRate10__c,Scale_Type__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Terms_of_Payment_Code__c,
                              Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,isPriceHolder__c,PCKC__c,Volume__c,Volume_UoM__c,Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name, Kcode__c, Char_Name__c, Material_Group_1__c, Material_Group_1_Code__c,Sales_District__c, Sales_District_Code__c,Partner_ZF__c, Partner_ZF_Code__c, Payer__c, Payer_Code__c,Disc_Ref_No__c, FixValDate__c,
                              Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c,Distributor_Code__c,Distributor_Name__c FROM ERP_Sales_Prices_SAP__c 
                              WHERE PCKC__c IN :PCKCpriItemList];
        
        system.debug('**** erpSalesPricesList'+ erpSalesPricesList.size()+ erpSalesPricesList);
        //validating if SalesPriceSAP record is available for the requested period or else if expired prices are avaliable, updating it with expired values.
        for(Integer pk=0;pk< PCKCpriItemList.size();pk++)
        {
            for(Integer j=0;j<erpSalesPricesList.size();j++)
            {
                if(erpSalesPricesList.get(j).get('isPriceHolder__c') != true)
                {
                    if(PCKCpriItemList.get(pk)==erpSalesPricesList.get(j).PCKC__c && valFrm >= (Date)erpSalesPricesList.get(j).Valid_From__c && valFrm <= (Date)erpSalesPricesList.get(j).Valid_To__c)
                    {
                        system.debug('****@@@@ Sap Prices present'+'pk '+pk+'j'+ j+ valFrm);
                        pricingRequestItemList.get(pk).Valid_From__c=erpSalesPricesList.get(j).Valid_From__c;
                        pricingRequestItemList.get(pk).Valid_To__c=erpSalesPricesList.get(j).Valid_To__c;
                        pricingRequestItemList.get(pk).Rate__c=erpSalesPricesList.get(j).Rate__c;
                        pricingRequestItemList.get(pk).Customer_Price_Payment_Terms__c=erpSalesPricesList.get(j).Customer_Price_Payment_Terms__c;
                        pricingRequestItemList.get(pk).Payment_Terms_Fixed_Date__c=erpSalesPricesList.get(j).Payment_Terms_Fixed_Date__c;
                        if(erpSalesPricesList.get(j).Volume__c != null)
                            pricingRequestItemList.get(pk).Volume__c=Integer.valueOf(erpSalesPricesList.get(j).Volume__c);
                        pricingRequestItemList.get(pk).Volume_UoM__c=erpSalesPricesList.get(j).Volume_UoM__c;
                        pricingRequestItemList.get(pk).UoM__c=erpSalesPricesList.get(j).UoM__c;
                        pricingRequestItemList.get(pk).Per__c=erpSalesPricesList.get(j).Per__c;
                        pricingRequestItemList.get(pk).Unit__c=erpSalesPricesList.get(j).Unit__c;
                        /*pricingRequestItemList.get(pk).Condition_Class__c=erpSalesPricesList.get(j).Condition_Class__c;
pricingRequestItemList.get(pk).Condition_Class_Code__c=erpSalesPricesList.get(j).Condition_Class_Code__c;
pricingRequestItemList.get(pk).Scaled_Price_Flag__c=erpSalesPricesList.get(j).Scaled_Price_Flag__c;
pricingRequestItemList.get(pk).Scale_Type_Code__c=erpSalesPricesList.get(j).Scale_Type_Code__c;
pricingRequestItemList.get(pk).Scale_Type__c=erpSalesPricesList.get(j).Scale_Type__c;
pricingRequestItemList.get(pk).Scale_Basis_Code__c=erpSalesPricesList.get(j).Scale_Basis_Code__c;
pricingRequestItemList.get(pk).Scale_Basis__c=erpSalesPricesList.get(j).Scale_Basis__c;*/
                        
                        pricingRequestItemList.get(pk).ERP_Sales_Prices_SAP__c=erpSalesPricesList.get(j).Id;
                        pricingRequestItemList.get(pk).New_Valid_From__c=priceReqClone.Request_Valid_From__c;
                        pricingRequestItemList.get(pk).New_Valid_To__c=priceReqClone.Request_Valid_To__c;
                        pricingRequestItemList.get(pk).Error_Indicator__c='Valid';
                        break;
                    }
                    else if(PCKCpriItemList.get(pk)==erpSalesPricesList.get(j).PCKC__c && valFrm >= (Date)erpSalesPricesList.get(j).Valid_To__c)
                    {
                        system.debug('****@@@@ Sap Prices present but expired'+'pk '+pk+'j'+ j+ valFrm);        
                        expValidTo.add((Date)erpSalesPricesList.get(j).Valid_To__c);
                        expMap.put((Date)erpSalesPricesList.get(j).Valid_To__c,erpSalesPricesList.get(j));
                        expFlag= true;
                        
                    }
                }
                
                
            }
            
            pricingRequestItemList.get(pk).New_Valid_From__c=priceReqClone.Request_Valid_From__c;
            pricingRequestItemList.get(pk).New_Valid_To__c=priceReqClone.Request_Valid_To__c;
            system.debug('****@@@@ New_Valid_From__c'+pricingRequestItemList.get(pk).New_Valid_From__c);
            
            if(expFlag== true)
            {
                expValidTo.sort();
                Date expDate= expValidTo.get(expValidTo.size()-1);
                erpRec=expMap.get(expDate);
                system.debug('****@@@@ Sap Prices  expired Valid to'+erpRec.Valid_To__c);
                system.debug('****@@@@ Sap Prices expired valid From'+erpRec.Valid_From__c);
                system.debug('****@@@@ Sap Prices  expired rate'+erpRec.Rate__c);
                pricingRequestItemList.get(pk).ERP_Sales_Prices_SAP__c = erpRec.Id; 
                pricingRequestItemList.get(pk).Valid_From__c=erpRec.Valid_From__c;
                pricingRequestItemList.get(pk).Valid_To__c=erpRec.Valid_To__c;
                pricingRequestItemList.get(pk).Rate__c=erpRec.Rate__c;
                pricingRequestItemList.get(pk).UoM__c=erpRec.UoM__c;
                pricingRequestItemList.get(pk).Per__c=erpRec.Per__c;
                pricingRequestItemList.get(pk).Unit__c=erpRec.Unit__c;
                pricingRequestItemList.get(pk).Customer_Price_Payment_Terms__c=erpRec.Customer_Price_Payment_Terms__c;
                pricingRequestItemList.get(pk).Payment_Terms_Fixed_Date__c=erpRec.Payment_Terms_Fixed_Date__c;
                if(erpRec.Volume__c != null)
                    pricingRequestItemList.get(pk).Volume__c=Integer.valueOf(erpRec.Volume__c);
                pricingRequestItemList.get(pk).Volume_UoM__c=erpRec.Volume_UoM__c;
                pricingRequestItemList.get(pk).New_Valid_From__c=priceReqClone.Request_Valid_From__c;
                pricingRequestItemList.get(pk).New_Valid_To__c=priceReqClone.Request_Valid_To__c;
                pricingRequestItemList.get(pk).Error_Indicator__c='WARNING:Expired Prices Displayed.';
                system.debug('****@@@@ Error_Indicator__c'+pricingRequestItemList.get(pk).Error_Indicator__c);                      
            }
        }
        
        //Quering all the objects necessary for Key field Validations --START
        List<ERP_Pricing_Condition__c> reqItemPC=[SELECT Pricing_Condition_Code__c,SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c FROM ERP_Pricing_Condition__c WHERE
                                                  Pricing_Condition_Code__c IN :priItemPCSet AND SAP_Cluster__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Cluster__c AND
                                                  SAP_Application_Id__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Application_Id__c AND 
                                                  SAP_Client_Id__c = :buOrgGroup.ERP_Pricing_Procedure__r.SAP_Client_Id__c];
        
        system.debug('****@@@@ Pricng Condition'+reqItemPC.size()+reqItemPC+' request.pricingCondition.selectedPricingCondition '+request.pricingCondition.selectedPricingCondition);
        String pcSAPclusterId;
        //TODO: refine fr single req item DONE
        
        pcSAPclusterId=(String)reqItemPC.get(0).SAP_Cluster__c;
        
        
        system.debug('****@@@@ selectedBU'+selectedBU+' reqsalesOrgCode'+reqsalesOrgCode+' reqdistChannelCode'+reqdistChannelCode+' reqdivCode'+reqdivCode);
        system.debug('****@@@@ pcSAPclusterId'+pcSAPclusterId+' priItemMatSet'+priItemMatSet);
        
        //<MS20140903> Addeing condition to check if Cusotmer Specific
        if(priceReqClone.Request_Type__c=='Customer Specific' && buOrgGroup.Include_Customer_Currency__c == true)
        {                           
            List<ERP_Customer__c> customerList= [SELECT id,customer_code__c,Name,Currency_Code__c FROM ERP_Customer__c WHERE customer_code__c =:priceReqClone.SoldTo_Code__c ];
            orgGroupItemCurr.add(customerList.get(0).Currency_Code__c);
        }
        
        List<ERP_Access_Sequence__c> accSqList = [SELECT isNPCApplicable__c, Pricing_Condition__r.Pricing_Condition_Code__c,
                                                  Pricing_Key_Combination__c, Pricing_Key_Combination__r.Key_Combination_Code__c,
                                                  Key_Combination__c, Sequence_Number__c, Floor_Key_Combination__c,
                                                  Floor_Pricing_Condition__c, Net_Floor_Key_Combination__c, Net_Reference_Key_Combination__c,
                                                  Reference_Key_Combination__c, Reference_Pricing_Condition__c, isPaymentTermsApplicable__c,isVolumeApplicable__c
                                                  FROM ERP_Access_Sequence__c   WHERE
                                                  Sales_Pricing_Procedure__c = :buOrgGroup.ERP_Pricing_Procedure__c AND
                                                  Pricing_Condition__r.Pricing_Condition_Code__c IN :priItemPCSet AND
                                                  Pricing_Key_Combination__r.Key_Combination_Code__c IN :priItemKeyComCodeSet ORDER BY Sequence_Number__c];
        
        for(ERP_Access_Sequence__c ac:accSqList)
        {
            pcKCCodeisNPCAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, false);
            pcKCCodeisFlrRefAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, false);
            pcKCCodeisPmtTermsAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, false);
            if(ac.isNPCApplicable__c)
            {
                pcKCCodeisNPCAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
            }
            if(!String.isBlank(ac.Floor_Key_Combination__c) || !String.isBlank(ac.Floor_Pricing_Condition__c)
               || !String.isBlank(ac.Reference_Key_Combination__c) || !String.isBlank(ac.Reference_Pricing_Condition__c))
            {
                pcKCCodeisFlrRefAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
            }
            if(buOrgGroup.isPaymentTermsApplicable__c && ac.isPaymentTermsApplicable__c)
            {
                pcKCCodeisPmtTermsAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
            }
            if(buOrgGroup.isVolumeApplicable__c && ac.isVolumeApplicable__c)
            {
                pcKCCodeisVolumeAppMap.put(ac.Pricing_Condition__r.Pricing_Condition_Code__c + ac.Pricing_Key_Combination__r.Key_Combination_Code__c, true);
            }
        }
        
        system.debug('****@@@@ Enable_Variable_Config_Materials__c'+buOrgGroup.Enable_Variable_Config_Materials__c);
        orgGroupItemCurr =+ buOrgGroup.ERP_Currency__c.split(';');
        orgGroupItemUoM=buOrgGroup.ERP_UoM__c.split(';');
        defaultUoM=buOrgGroup.Default_SalesArea_UoM__c; //<AV20140617>    
        
        system.debug('****@@@@ orgGroupItemCurr '+orgGroupItemCurr + ' orgGroupItemUoM'+orgGroupItemUoM);                            
        
        Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
        // <SP20140428> START
        List<Material__c>  activeMaterials = new List<Material__c>();
        
        if(buOrgGroup.Enable_Variable_Config_Materials__c)
        {
            activeMaterials = [SELECT ERP_Material_Code__c,Name,ERP_Deletion_Flag__c,ERP_Material_General_Data__r.ERP_Deletion_Flag__c FROM Material__c WHERE 
                               ERP_Source_Cluster__c = :pcSAPclusterId AND ERP_Sales_Org_Code__c=:reqsalesOrgCode AND 
                               ERP_Distribution_Channel_Code__c=:reqdistChannelCode AND RecordTypeId = :Material_RTYPE_Id AND 
                               ERP_Material_General_Data__r.ERP_IsConfigurable__c=:buOrgGroup.Enable_Variable_Config_Materials__c
                               AND ERP_Material_Code__c IN :priItemMatSet];
        }
        else
        {
            activeMaterials = [SELECT ERP_Material_Code__c,Name,ERP_Deletion_Flag__c,ERP_Material_General_Data__r.ERP_Deletion_Flag__c FROM Material__c WHERE 
                               ERP_Source_Cluster__c  = :pcSAPclusterId AND ERP_Sales_Org_Code__c=:reqsalesOrgCode AND 
                               ERP_Distribution_Channel_Code__c=:reqdistChannelCode AND RecordTypeId = :Material_RTYPE_Id AND 
                               ERP_Material_Code__c IN :priItemMatSet];
        }
        // <SP20140428> END     
        system.debug('****@@@@ Active Materials Size'+activeMaterials.size()+ 'Material_RTYPE_Id'+ Material_RTYPE_Id);
        system.debug('****@@@@ Enable_Variable_Config_Materials__c'+buOrgGroup.Enable_Variable_Config_Materials__c);                            
        
        map<String,String> materialPH=new map<String,String>();
        Set<String> phCodes=new Set<String>();
        map<String,String> pHUOM=new map<String,String>();
        map<String,Decimal> pHPer=new map<String,Decimal>();
        reqitem2=new PARequestItemHelper(selectedBU);
        List<Material__c> matList = new List<Material__c>();
        if(buOrgGroup.Enable_Variable_Config_Materials__c)
        {
            matList=[select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c FROM Material__c where ERP_Material_Code__c IN :priItemMatSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:buOrgGroup.Enable_Variable_Config_Materials__c 
                     AND ERP_Sales_Org_Code__c=:reqsalesOrgCode AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:reqdistChannelCode];
        }
        else
        { 
            matList=[select Id,ERP_Material_Code__c,Description__c,Name,ERP_Product_Hierarchy_Code__c FROM Material__c where ERP_Material_Code__c IN :priItemMatSet  AND RecordTypeId = :Material_RTYPE_Id AND ERP_Sales_Org_Code__c=:reqsalesOrgCode 
                     AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:reqdistChannelCode];
        }
        System.debug('******** Matlist***'+matList);
        for(Integer j=0;j<matList.size();j++)
        {
            phCodes.add(matList[j].ERP_Product_Hierarchy_Code__c);
            materialPH.put(matList[j].ERP_Material_Code__c,matList[j].ERP_Product_Hierarchy_Code__c);
        }
        list<BU_PH__c> allPHList1=new list<BU_PH__c>();
        allPHList1=reqitem2.query(phCodes);
        pHUOM=reqitem2.getDefaultUOM(allPHList1);
        pHPer=reqitem2.getDefaultPer(allPHList1);
        system.debug('*******allPHList1'+allPHList1.size()+allPHList1);
        system.debug('uom: '+pHUOM+' per: '+pHPer);
        List<ERP_Relationship__c> shipToSoldToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,Related_ERP_Customer__r.Deletion_Flag__c,ERP_Customer__r.Deletion_Flag__c,
                                                      Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c 
                                                      WHERE ERP_Customer__r.Customer_Code__c =: priceReqClone.SoldTo_Code__c AND 
                                                      Related_ERP_Customer__r.Customer_Code__c IN :priItemShipToSet AND Partner_Function_Code__c='WE' AND 
                                                      (Related_ERP_Customer__r.Sales_Org_Code__c= : reqsalesOrgCode AND 
                                                       Related_ERP_Customer__r.Distribution_Channel_Code__c= : reqdistChannelCode AND 
                                                       Related_ERP_Customer__r.Division_Code__c= : reqdivCode)];
        
        List<ERP_Relationship__c> shipToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,ERP_Customer__r.Deletion_Flag__c,
                                                Related_ERP_Customer__r.Deletion_Flag__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,
                                                Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c IN :priItemShipToSet 
                                                AND Partner_Function_Code__c='WE' AND (Related_ERP_Customer__r.Sales_Org_Code__c= : reqsalesOrgCode AND 
                                                                                       Related_ERP_Customer__r.Distribution_Channel_Code__c= : reqdistChannelCode AND 
                                                                                       Related_ERP_Customer__r.Division_Code__c= : reqdivCode)];
        
        List<ERP_Relationship__c> endUserSoldToList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,ERP_Customer__r.Deletion_Flag__c,
                                                       Related_ERP_Customer__r.Deletion_Flag__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,
                                                       Partner_Function_Code__c FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c  =:priceReqClone.SoldTo_Code__c 
                                                       AND Partner_Function_Code__c IN ('ZH','ZQ') AND (Related_ERP_Customer__r.Sales_Org_Code__c= : reqsalesOrgCode AND 
                                                                                                        Related_ERP_Customer__r.Distribution_Channel_Code__c= : reqdistChannelCode AND 
                                                                                                        Related_ERP_Customer__r.Division_Code__c= : reqdivCode)];
        
        List<ERP_Relationship__c> endUserList = [SELECT Id,ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Customer_Code__c,Related_ERP_Customer__r.Name,ERP_Customer__r.Deletion_Flag__c,
                                                 Related_ERP_Customer__r.Deletion_Flag__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,
                                                 Partner_Function_Code__c FROM ERP_Relationship__c WHERE Related_ERP_Customer__r.Customer_Code__c 
                                                 IN :priItemEndUserSet AND Partner_Function_Code__c IN ('ZH','ZQ') AND 
                                                 (Related_ERP_Customer__r.Sales_Org_Code__c= : reqsalesOrgCode AND 
                                                  Related_ERP_Customer__r.Distribution_Channel_Code__c= : reqdistChannelCode AND 
                                                  Related_ERP_Customer__r.Division_Code__c= : reqdivCode)];   
        
        Set<String> cpgSet= new Set<String>();
        Set<String> mpgSet= new Set<String>();  
        Set<String> incotermsSet= new Set<String>();    
        Set<String> salesOfficeSet= new Set<String>();
        Set<String> salesDistrictSet = new Set<String>();
        Set<String> countrySet= new Set<String>();  
        Set<String> paymentTermsSet= new Set<String>();
        Set<String> marketSegmentSet= new Set<String>();
        Set<String> endUseSet= new Set<String>();   
        Set<String> priceListTypeSet= new Set<String>();
        //<MS20140515> Added Variant and SalesOrderType Sets
        Set<String> variantSet= new Set<String>();
        Set<String> contractSet= new Set<String>();
        Set<String> salesOrderTypeSet= new Set<String>();
        Set<String> ComPartnerSet= new Set<String>();
        Set<String> MaterialGroup5KeySet= new Set<String>();
        Set<String> PlantSet= new Set<String>();
        Set<String> ShippingConditionSet= new Set<String>();
        Set<String> DestinationCountrySet= new Set<String>();
        Set<String> MaterialGroup1Set = new Set<String>();
        Set<String> PartnerZFSet= new Set<String>();
        Set<String> PayerSet= new Set<String>();
        Set<String> campaignSet= new Set<String>();
        Set<String> documentCurrencySet= new Set<String>();
        Set<String> stateSet= new Set<String>();
        
        List<Org_Group_ERP_Key__c> orgGroupKeyList = [SELECT id,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Description__c,ERP_Cus_Mat_Compt_Key__r.Type__c,
                                                      ERP_Cus_Mat_Compt_Key__r.Name__c  FROM Org_Group_ERP_Key__c WHERE Organizational_Group_Item__c =:buOrgGroup.id 
                                                      AND ERP_Cus_Mat_Compt_Key__r.Status__c='Active'];
        
        //TODO: Priyanka: check for reducing the iterations                                      
        for(Org_Group_ERP_Key__c orgGroupKeyObj : orgGroupKeyList) 
        {
            for(Pricing_Request_Item__c priItem : pricingRequestItemList)
            {   
                if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Customer Price Group')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Customer Price Group')) 
                    {
                        cpgSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Incoterms')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Incoterms')) 
                    {
                        incotermsSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Price Group')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Material Price Group')) 
                    {
                        mpgSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Price List Type'))
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Price List Type')) 
                    {
                        priceListTypeSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                        
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales Office')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Sales office')) 
                    {
                        salesOfficeSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales District')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Sales District')) 
                    {
                        salesDistrictSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Country'))
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Country') || priItem.Key_Combination__c.containsIgnoreCase('Country to') || priItem.Key_Combination__c.containsIgnoreCase('Recip Country')) 
                    {
                        countrySet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);              
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Terms of Payment')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Terms of Payment')) 
                    {
                        paymentTermsSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 4')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Market Segment')) 
                    {
                        marketSegmentSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                //<MS20140515> Added conditions for Variant and SalesOrderType  START
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Variant')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Variant')) 
                    {
                        variantSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Sales Order Type')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Sales Order Type')) 
                    {
                        salesOrderTypeSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('ComPartner')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('ComPartner')) 
                    {
                        ComPartnerSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 5 Key')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Material Group 5 Key')) 
                    {
                        MaterialGroup5KeySet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Plant')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Plant')) 
                    {
                        PlantSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Shipping Condition')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Shipping Condition')) 
                    {
                        ShippingConditionSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Destination Country')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Destination Country')) 
                    {
                        DestinationCountrySet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                //<MS20140515> Added conditions for Variant and SalesOrderType END     
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 3')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('End User')) 
                    {
                        String keyCombinationCodeDesc = priItem.Key_Combination__c.replace('End User','EndUser');
                    }
                    if(priItem.Key_Combination__c.containsIgnoreCase('End Use')) 
                    {
                        endUseSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                    if(priItem.Key_Combination__c.containsIgnoreCase('EndUser')) 
                    {
                        String keyCombinationCodeDesc = priItem.Key_Combination__c.replace('EndUser','End User');
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Material Group 1')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Material Group 1') || priItem.Key_Combination__c.containsIgnoreCase('Matl grp1')
                       || priItem.Key_Combination__c.containsIgnoreCase('Matl grp 1') || priItem.Key_Combination__c.containsIgnoreCase('MatGrp1')) 
                    {
                        MaterialGroup1Set.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Partner ZF')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Partner ZF')) 
                    {
                        PartnerZFSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Payer')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Payer')) 
                    {
                        PayerSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Campaign')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Campaign')) 
                    {
                        campaignSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('Document Currency')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('Document Currency')) 
                    {
                        documentCurrencySet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
                else if(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Type__c.equalsIgnoreCase('State')) 
                {
                    if(priItem.Key_Combination__c.containsIgnoreCase('State')) 
                    {
                        stateSet.add(orgGroupKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c);
                    }
                }
            }                                               
        } 
        system.debug('mpgSet is '+mpgSet);
        //  Quering all the objects necessary for Key field Validations --END                                   
        integer matCount=0;
        List<String> validMat=new List<String>();                                           
        for(integer i=0;i<pricingRequestItemList.size();i++)
        {           
            // Key Field Validations from the Key Combination START
            String keyComDesc=pricingRequestItemList.get(i).Key_Combination__c;
            if(keyComDesc.containsIgnoreCase('Material'))
            {
                system.debug('****@@@@ materials in KC'+pricingRequestItemList.get(i).Material_Code__c);    
                if(activeMaterials.size()>0)
                {
                    for(Integer mat=0;mat<activeMaterials.size();mat++)
                    {
                        system.debug('****@@@@ Active Material_material code:'+activeMaterials.get(mat).ERP_Material_Code__c+'****@@@@pricingreqlist_material code:'+pricingRequestItemList.get(i).get('Material_Code__c'));
                        if(pricingRequestItemList.get(i).get('Material_Code__c')==activeMaterials.get(mat).ERP_Material_Code__c)
                        {
                            pricingRequestItemList.get(i).Material__c=activeMaterials.get(mat).Name;
                            if(activeMaterials.get(mat).ERP_Deletion_Flag__c == true || activeMaterials.get(mat).ERP_Material_General_Data__r.ERP_Deletion_Flag__c == true)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Material is flaged for deletion';
                                system.debug('****@@@@ Error_Indicator__c in if Material'+pricingRequestItemList.get(i).Error_Indicator__c);
                            }
                            /*   else if(reqItemOldSOCode != reqSalesOrgCode || reqItemOldDCCode != reqDistChannelCode || reqItemOldDivCode != reqDivCode)
{

pricingRequestItemList.get(i).Error_Indicator__c= 'Success:Material is valid';

if()
system.debug('****@@@@ Error_Indicator__c in else Material'+pricingRequestItemList.get(i).Error_Indicator__c);
}*/
                            
                            if(pricingRequestItemList.get(i).Error_Indicator__c == null)
                            {
                                
                                if(validMat.size() != 0) 
                                {
                                    for(integer v=0;v<validMat.size();v++)
                                    {
                                        if(validMat[v].contains(pricingRequestItemList.get(i).Material_Code__c))
                                        {
                                            matCount++;
                                        }
                                    }
                                    
                                }
                                validMat.add((String)pricingRequestItemList.get(i).get('Material_Code__c'));
                            }
                            
                            if(matCount>0){
                                system.debug('****@@@@ matCount'+matCount);
                                pricingRequestItemList.get(i).New_Valid_From__c=null;
                                pricingRequestItemList.get(i).New_Valid_To__c=null;
                                pricingRequestItemList.get(i).Error_Indicator__c='WARNING:Set a different New Valid To and New Valid From';
                                system.debug('****@@@@ pricingRequestItemList.get(i).Error_Indicator__c'+pricingRequestItemList.get(i).Error_Indicator__c);
                            }
                        }
                        
                    }
                }
                else{
                    pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Material is not mapped for the selected Sales Area.';
                    system.debug('****@@@@ Error_Indicator__c in else'+pricingRequestItemList.get(i).Error_Indicator__c);
                }
                
                
            }
            if(keyComDesc.containsIgnoreCase('Sold To') && keyComDesc.containsIgnoreCase('Ship To'))
            {
                if(shipToSoldToList.size()>0)
                {
                    for(Integer sst=0;sst<shipToSoldToList.size();sst++)
                    {
                        if(priceReqClone.SoldTo_Code__c==shipToSoldToList.get(sst).ERP_Customer__r.Customer_Code__c && pricingRequestItemList.get(i).get('ShipTo_Code__c') == shipToSoldToList.get(sst).Related_ERP_Customer__r.Customer_Code__c)
                        {
                            if(shipToSoldToList.get(sst).ERP_Customer__r.Deletion_Flag__c == true)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Ship to Customer is marked for deletion';
                                System.debug('****@@@@ Error_Indicator__c in if'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                            else if(reqItemOldSOCode != reqSalesOrgCode || reqItemOldDCCode != reqDistChannelCode || reqItemOldDivCode != reqDivCode)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Ship to is valid';
                                System.debug('****@@@@ Error_Indicator__c in else'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                        }
                        else{
                            pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Ship to is not valid for the Sold To.';
                            system.debug('****@@@@ Error_Indicator__c in not avali else'+pricingRequestItemList.get(i).Error_Indicator__c);
                        }
                    }
                }            
            }
            else if((!keyComDesc.containsIgnoreCase('Sold To')) && keyComDesc.containsIgnoreCase('Ship To')) 
            {                  
                if(shipToList.size()>0)
                {
                    for(Integer st=0;st<shipToSoldToList.size();st++)
                    {
                        if(pricingRequestItemList.get(i).get('ShipTo_Code__c') == shipToSoldToList.get(st).Related_ERP_Customer__r.Customer_Code__c)
                        {
                            if(shipToSoldToList.get(st).ERP_Customer__r.Deletion_Flag__c == true)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Ship to Customer is marked for deletion';
                                System.debug('****@@@@ Error_Indicator__c in if'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                            else if(reqItemOldSOCode != reqSalesOrgCode || reqItemOldDCCode != reqDistChannelCode || reqItemOldDivCode != reqDivCode)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Success:Ship to is valid';
                                System.debug('****@@@@ Error_Indicator__c in else'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                        }
                        else{
                            pricingRequestItemList.get(i).Error_Indicator__c= 'Success:Ship to is valid';
                            System.debug('****@@@@ Error_Indicator__c in not valid else'+pricingRequestItemList.get(i).Error_Indicator__c);
                        }
                    }
                }           
            }
            
            if(keyComDesc.containsIgnoreCase('Sold To') && keyComDesc.containsIgnoreCase('End User'))
            {
                if(endUserSoldToList.size()>0)
                {
                    for(Integer eus=0;eus<=shipToSoldToList.size();eus++)
                    {
                        if(priceReqClone.SoldTo_Code__c==endUserSoldToList.get(eus).ERP_Customer__r.Customer_Code__c)
                        {
                            if(endUserSoldToList.get(eus).ERP_Customer__r.Deletion_Flag__c == true)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Error:End User Customer is marked for deletion';
                                System.debug('****@@@@ Error_Indicator__c in if'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                            else if(reqItemOldSOCode != reqSalesOrgCode || reqItemOldDCCode != reqDistChannelCode || reqItemOldDivCode != reqDivCode)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Success:End User is valid';
                                System.debug('****@@@@ Error_Indicator__c in else'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                        }
                        else
                        {
                            pricingRequestItemList.get(i).Error_Indicator__c= 'Error:End User is not valid for the Sold To.';
                            system.debug('****@@@@ Error_Indicator__c in not valid else'+pricingRequestItemList.get(i).Error_Indicator__c);
                        }
                    }
                }
            }
            else if(!keyComDesc.containsIgnoreCase('Sold To') && keyComDesc.containsIgnoreCase('End User'))
            {
                if(endUserList.size()>0)
                {
                    for(Integer eu=0;eu<=shipToSoldToList.size();eu++)
                    {
                        if(pricingRequestItemList.get(i).get('End_User_Code__c') == endUserSoldToList.get(eu).Related_ERP_Customer__r.Customer_Code__c)
                        {
                            if(endUserSoldToList.get(eu).ERP_Customer__r.Deletion_Flag__c == true)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Error:End User Customer is marked for deletion';
                                System.debug('****@@@@ Error_Indicator__c in if'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                            else if(reqItemOldSOCode != reqSalesOrgCode || reqItemOldDCCode != reqDistChannelCode || reqItemOldDivCode != reqDivCode)
                            {
                                pricingRequestItemList.get(i).Error_Indicator__c= 'Success:End User is valid';
                                System.debug('****@@@@ Error_Indicator__c in else'+pricingRequestItemList.get(i).Error_Indicator__c);
                                break;
                            }
                        }       
                        else{
                            pricingRequestItemList.get(i).Error_Indicator__c= 'Error:End User is not valid for the Sold To.';
                            system.debug('****@@@@ Error_Indicator__c in not valid else'+pricingRequestItemList.get(i).Error_Indicator__c);
                        }
                    }
                }                   
            }
            //<SS20220826> Added Sales Order Item fields in the mapping
            //<SS20230501> Added M&M P80 key fields in the mapping
            Map<String,String> keyErrorMap=new Map<String,String>{'ComPartner'=>(String)pricingRequestItemList.get(i).ComPartner_Code__c,'Country'=>(String)pricingRequestItemList.get(i).Country_Code__c,'Customer Price Group'=>(String)pricingRequestItemList.get(i).Customer_Price_Group_Code__c, 'Destination Country'=>(String)pricingRequestItemList.get(i).Destination_Country_Code__c,'Incoterms'=>(String)pricingRequestItemList.get(i).Incoterms_Code__c,'Material Group 3'=>(String)pricingRequestItemList.get(i).End_Use_Code__c,'Material Group 4'=>(String)pricingRequestItemList.get(i).Market_Segment_Code__c,'Material Price Group'=>(String)pricingRequestItemList.get(i).Material_Price_Group_Code__c,'Plant'=>(String)pricingRequestItemList.get(i).Plant_Code__c,'Price List Type'=>(String)pricingRequestItemList.get(i).Price_List_Type_Code__c,'Sales Office'=>(String)pricingRequestItemList.get(i).Sales_Office_Code__c,'Sales Order Type'=>(String)pricingRequestItemList.get(i).Sales_Order_Type_Code__c,'Sales Order Item'=>(String)pricingRequestItemList.get(i).Sales_Order_Item_Code__c,'Value Center'=>(String)pricingRequestItemList.get(i).Value_Center_Code__c,'Material Group 2'=>(String)pricingRequestItemList.get(i).Material_group_2_Code__c,'External Material Group'=>(String)pricingRequestItemList.get(i).Ext_Matl_Grp_Code__c,'Price Zone'=>(String)pricingRequestItemList.get(i).Price_Zone_Code__c,'Shipping Condition'=>(String)pricingRequestItemList.get(i).Shipping_Condition_Code__c,'Terms of Payment'=>(String)pricingRequestItemList.get(i).Terms_Of_Payment_Code__c,'Variant'=>(String)pricingRequestItemList.get(i).Variant_Code__c,'Material Group 1'=>(String)pricingRequestItemList.get(i).Material_Group_1_Code__c,'Sales District'=>(String)pricingRequestItemList.get(i).Sales_District_Code__c,'Partner ZF'=>(String)pricingRequestItemList.get(i).Partner_ZF_Code__c,'Payer'=>(String)pricingRequestItemList.get(i).Payer_Code__c,'Material Group 5 Key'=>(String)pricingRequestItemList.get(i).Material_Group_5_Key_Code__c};
                Map<String,Set<String>> keySetMap=new Map<String,Set<String>>{'Customer Price Group'=>cpgset,'Incoterms'=>incotermsSet,'Material Price Group'=>mpgset,'Price List Type'=>priceListTypeSet,'Sales Office'=>salesOfficeSet,'Country'=>countrySet,'Terms of Payment'=>paymentTermsSet,'Material Group 4'=>marketSegmentSet,'Variant'=>variantSet,'Sales Order Type'=>salesOrderTypeSet,'ComPartner'=>compartnerset,'Plant'=>PlantSet,'Shipping Condition'=>ShippingConditionSet,'Destination Country'=>DestinationCountrySet,'Material Group 3'=>endUseSet,'Material Group 1'=>MaterialGroup1Set,'Sales District'=>salesDistrictSet,'Partner ZF'=>partnerZFset,'Payer'=>payerset,'Material Group 5 Key'=>MaterialGroup5KeySet};
            pricingRequestItemList.get(i).Error_Indicator__c=keyValidityErr(keyComDesc,keyErrorMap,keySetMap);
            /*if(keyComDesc.containsIgnoreCase('Customer Price Group'))
{
if(!cpgSet.contains((String)pricingRequestItemList.get(i).Customer_Price_Group_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Customer Price Group is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Incoterms'))
{
if(!incotermsSet.contains((String)pricingRequestItemList.get(i).Incoterms_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Incoterms is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Material Price Group'))
{
if(!mpgSet.contains((String)pricingRequestItemList.get(i).Material_Price_Group_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Material Price Group is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Price List Type'))
{
if(!priceListTypeSet.contains((String)pricingRequestItemList.get(i).Price_List_Type_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Price List Type is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Sales Office'))
{
if(!salesOfficeSet.contains((String)pricingRequestItemList.get(i).Sales_Office_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Sales Office is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Country'))
{
if(!countrySet.contains((String)pricingRequestItemList.get(i).Country_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Country is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Terms of Payment'))
{
if(!paymentTermsSet.contains((String)pricingRequestItemList.get(i).Terms_Of_Payment_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Terms of Payment is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Material Group 4'))
{
if(!marketSegmentSet.contains((String)pricingRequestItemList.get(i).Market_Segment_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Market Segment is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}

//<MS20140515> Added conditions for Variant and SalesOrderType  START
if(keyComDesc.containsIgnoreCase('Variant'))
{
if(!variantSet.contains((String)pricingRequestItemList.get(i).Variant_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Variant is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Sales Order Type'))
{
if(!salesOrderTypeSet.contains((String)pricingRequestItemList.get(i).Sales_Order_Type_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Sales Order Type is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
//<KS20220808>
if(keyComDesc.containsIgnoreCase('Sales Order Item'))
{
if(!salesOrderItemSet.contains((String)pricingRequestItemList.get(i).Sales_Order_Item_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Sales Order Item is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Sales Order Item'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('ComPartner'))
{
if(!ComPartnerSet.contains((String)pricingRequestItemList.get(i).ComPartner_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:ComPartner is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Plant'))
{
if(!PlantSet.contains((String)pricingRequestItemList.get(i).Plant_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Plant is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}
if(keyComDesc.containsIgnoreCase('Shipping Condition'))
{
if(!ShippingConditionSet.contains((String)pricingRequestItemList.get(i).Shipping_Condition_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Shipping Condition is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}

if(keyComDesc.containsIgnoreCase('Destination Country'))
{
if(!DestinationCountrySet.contains((String)pricingRequestItemList.get(i).Destination_Country_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Destination Country is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}



if(keyComDesc.containsIgnoreCase('Material Group 3'))
{
if(!endUseSet.contains((String)pricingRequestItemList.get(i).End_Use_Code__c))
{
pricingRequestItemList.get(i).Error_Indicator__c= 'Error:End Use is not valid for the Sold To.';
system.debug('****@@@@ Error_Indicator__c in Customer Price Group'+pricingRequestItemList.get(i).Error_Indicator__c);
}
}*/
            pricingRequestItemList.get(i).Sales_Org_Code__c=priceReqClone.Sales_Org_Code__c;
            //Fix for IS ID-00046572 
            if(keyComDesc.containsIgnoreCase('Dist. Channel'))
                pricingRequestItemList.get(i).Dist_Channel_Code__c=priceReqClone.Dist_Channel_Code__c;
            if(keyComDesc.containsIgnoreCase('Division'))
                pricingRequestItemList.get(i).Division_Code__c=priceReqClone.Division_Code__c;
            pricingRequestItemList.get(i).Sold_To_Code__c=priceReqClone.SoldTo_Code__c;
            
            String pcKCCon = pricingRequestItemList.get(i).Pricing_Condition_Code__c + pricingRequestItemList.get(i).Key_Combination_Code__c;
            system.debug('****pcKCCon'+pcKCCon);
            if(priceReqClone.Pricing_Request_Type__c != 'Pricing Task')
            {
                if(pcKCCodeisNPCAppMap.containsKey(pcKCCon))
                {
                    pricingRequestItemList.get(i).isNPCApplicable__c = pcKCCodeisNPCAppMap.get(pcKCCon);
                }
                if(pcKCCodeisPmtTermsAppMap.containsKey(pcKCCon))
                {
                    pricingRequestItemList.get(i).isPaymentTermsApplicable__c = pcKCCodeisPmtTermsAppMap.get(pcKCCon);
                }
                //<AV20140515>-starts
                if(pcKCCodeisVolumeAppMap.containsKey(pcKCCon))
                {
                    pricingRequestItemList.get(i).isVolumeApplicable__c = pcKCCodeisVolumeAppMap.get(pcKCCon);
                }
            }
            
            if(pcKCCodeisFlrRefAppMap.containsKey(pcKCCon))
            {
                pricingRequestItemList.get(i).isFloorApplicable__c = pcKCCodeisFlrRefAppMap.get(pcKCCon);
            }
            
            //Key Field Validations ENDS
            
            //Non-Key Field Validations from the Org Group Item.START
            boolean currCheck= false;
            boolean uomCheck = false;
            //boolean payCheck = false;
            system.debug('******Currency is:'+pricingRequestItemList.get(i).get('New_Unit__c')+'orgGroupItemCurr'+orgGroupItemCurr);
            system.debug('******Uom is:'+pricingRequestItemList.get(i).get('New_UoM__c')+'orgGroupItemUoM'+orgGroupItemUoM);
            
            if(pricingRequestItemList.get(i).get('New_Unit__c')!=null)
            {
                //<AV20140612> Added logic to populate new unit with % for percentage calulation type
                if(pricingRequestItemList.get(i).get('Calculation_Type__c')!=null && pricingRequestItemList.get(i).Calculation_Type__c.containsIgnoreCase('Percentage'))
                {
                    pricingRequestItemList.get(i).New_Unit__c='%';
                    system.debug('***@@@new unit when calculationtype is %:'+pricingRequestItemList.get(i).New_Unit__c+','+pricingRequestItemList.get(i).get('Calculation_Type__c'));   
                }
                //<AV20140612> end
                else
                {
                    for(Integer cur=0;cur< orgGroupItemCurr.size();cur++)
                    {
                        if(pricingRequestItemList.get(i).get('New_Unit__c') == orgGroupItemCurr.get(cur))
                        {           
                            currCheck= true;
                            break;
                        }
                    }
                    if(currCheck== false)
                    {
                        //pricingRequestItemList.get(i).Error_Indicator__c= 'Error:Currency is not valid for the selected Sales Area';
                        pricingRequestItemList.get(i).New_Unit__c=orgGroupItemCurr.get(0);
                        system.debug('****@@@@ Error_Indicator__c in Currency check'+pricingRequestItemList.get(i).Error_Indicator__c);
                    }
                }
            }
            //<AV20140612> populating new unit field with default value if new unit is blank
            else if(pricingRequestItemList.get(i).get('New_Unit__c')==null)
            {
                if(pricingRequestItemList.get(i).get('Calculation_Type__c')!=null && pricingRequestItemList.get(i).Calculation_Type__c.containsIgnoreCase('Percentage'))
                {
                    pricingRequestItemList.get(i).New_Unit__c='%';
                    system.debug('***@@@new unit when calculationtype is %:'+pricingRequestItemList.get(i).New_Unit__c+','+pricingRequestItemList.get(i).get('Calculation_Type__c'));   
                }
                else if(priceReqClone.Default_Currency__c != null)
                {
                    pricingRequestItemList.get(i).New_Unit__c=priceReqClone.Default_Currency__c;
                    system.debug('**##def curr:'+pricingRequestItemList.get(i).New_Unit__c);
                }
            }
            //<AV20140612> end
            
            
            if(pricingRequestItemList.get(i).get('New_UoM__c')!=null)
            {
                for(Integer uom=0;uom< orgGroupItemUoM.size();uom++)
                {
                    if(pricingRequestItemList.get(i).get('New_UoM__c') == orgGroupItemUoM.get(uom))
                    {                   
                        uomCheck= true;
                        break;
                    }
                }
                if(uomCheck== false)
                {
                    //pricingRequestItemList.get(i).Error_Indicator__c= 'Error:UoM is not valid for the selected Sales Area';
                    pricingRequestItemList.get(i).New_UoM__c=defaultUoM;
                    system.debug('****@@@@ Error_Indicator__c in UoM check'+pricingRequestItemList.get(i).Error_Indicator__c);
                }
            }
            //<AV20140612> populating new uom with default value if it is blank
            else if(pricingRequestItemList.get(i).get('New_UoM__c')==null || pricingRequestItemList.get(i).get('New_Per__c')==null)
            {
                map<String,String> pH_UOM=new map<String,String>();
                map<String,Decimal> pH_Per=new map<String,Decimal>();
                
                Set<String> phSet=new Set<String>();
                Set<String> matSet=new Set<String>();
                system.debug('**@@new per is:'+pricingRequestItemList.get(i).New_Per__c);
                system.debug('@@***default_per_uom setup'+buOrgGroup.Default_Per_UoM_Setup__c);
                system.debug('@@**ph filter & material filter:'+request.phFilter+','+request.materialFilter);
                if(pricingRequestItemList.get(i).get('Calculation_Type__c')!=null && pricingRequestItemList.get(i).Calculation_Type__c.containsIgnoreCase('Percentage'))
                {
                    pricingRequestItemList.get(i).New_UoM__c='';
                    
                    system.debug('***@@@new unit when calculationtype is %:'+pricingRequestItemList.get(i).New_UoM__c+','+pricingRequestItemList.get(i).get('Calculation_Type__c'));    
                }
                else{
                    if(pricingRequestItemList.get(i).Key_Combination__c.containsIgnoreCase('PH') && !pricingRequestItemList.get(i).Non_Commercial_Products__c)
                    {
                        system.debug('@@**key combiantion contains ph');
                        reqitem2=new PARequestItemHelper(selectedBU);
                        List<String> splitPHList = new List<String>();
                        splitPHList = pricingRequestItemList.get(i).F_Product_Hierarchy_Code__c.split(',');
                        for(String s1 : splitPHList)
                        {
                            if(!String.isBlank(s1))
                            {
                                phSet.add(s1.trim());
                            }
                        }
                        List<BU_PH__c> allPHList=reqitem2.query(phSet);
                        pH_UOM=reqitem2.getDefaultUOM(allPHList);
                        pH_Per=reqitem2.getDefaultPer(allPHList);
                        system.debug('**@@phset size:'+phSet.size()+'**@@allPHList size:'+allPHList.size());
                        for(String X: phSet)
                        {
                            if(buOrgGroup.Default_Per_UoM_Setup__c=='Sales Area Config')
                            {
                                if(pricingRequestItemList.get(i).get('New_UoM__c')==null)
                                {
                                    pricingRequestItemList.get(i).New_UoM__c = defaultUoM;
                                }
                                if(pricingRequestItemList.get(i).get('New_Per__c')==null)
                                {
                                    pricingRequestItemList.get(i).New_Per__c = buOrgGroup.Default_Per_Value__c;
                                }
                            }
                            else
                            {
                                for(Integer j=0;j<allPHList.size();j++)
                                {
                                    if(pricingRequestItemList.get(i).get('New_UoM__c')==null)
                                    {
                                        pricingRequestItemList.get(i).New_UoM__c = pH_UOM.get(allPHList[j].Product_Hierarchy__r.PH_Code__c);
                                    }
                                    if(pricingRequestItemList.get(i).get('New_Per__c')==null)
                                    {
                                        pricingRequestItemList.get(i).New_Per__c = pH_Per.get(allPHList[j].Product_Hierarchy__r.PH_Code__c);
                                    }
                                }
                                
                            }
                        }   
                    }
                    else if(pricingRequestItemList.get(i).Key_Combination__c.containsIgnoreCase('Material') && !pricingRequestItemList.get(i).Non_Commercial_Products__c)
                    {
                        system.debug('@@**key combiantion contains Material');
                        //List<String> splitMaterialList = new List<String>();
                        //splitMaterialList = pricingRequestItemList.get(i).Material_Code__c.split(',');
                        //System.debug('***splitMaterialList'+splitMaterialList);
                        /*for(String s:splitMaterialList){
if(!String.ISBLANK(s)){
matSet.add(s.trim());
} 
}*/
                        
                        //boolean enableVarConfigMaterial=false;
                        /*if(buOrgGroup!=null)
{
enableVarConfigMaterial = buOrgGroup.Enable_Variable_Config_Materials__c;                
}*/
                        
                        
                        
                        if(buOrgGroup.Default_Per_UoM_Setup__c=='Sales Area Config')
                        {
                            if(pricingRequestItemList.get(i).get('New_UoM__c')==null)
                            {
                                pricingRequestItemList.get(i).New_UoM__c = defaultUoM;
                            }
                            if(pricingRequestItemList.get(i).get('New_Per__c')==null)
                            {
                                pricingRequestItemList.get(i).New_Per__c = buOrgGroup.Default_Per_Value__c;
                            }
                            
                        }
                        else
                        {
                            if(pricingRequestItemList.get(i).get('New_UoM__c')==null)
                            {
                                pricingRequestItemList.get(i).New_UOM__c = pHUOM.get(materialPH.get(pricingRequestItemList.get(i).Material_Code__c));
                            }
                            if(pricingRequestItemList.get(i).get('New_Per__c')==null)
                            {
                                pricingRequestItemList.get(i).New_Per__c = pHPer.get(materialPH.get(pricingRequestItemList.get(i).Material_Code__c));
                            }
                            //system.debug('material '+m+' ph: '+materialPH.get(m));
                        }
                        
                    }
                }
            }
            //<AV20140612> end
            
        }
        //Non-Key Field Validations from the Org Group Item.END
        return pricingRequestItemList;
        //
    }
    //<MS20141215> Method to return error message for invalid key field entry
    public String keyValidityErr(String keyComDesc,Map<String,String>keyErrorMap,Map<String,Set<String>>keySetMap)
    {
        Set<String> kcNameSet=new Set<String>{'Customer Price Group','Incoterms','Material Price Group','Price List Type','Sales office','Sales District','Country','Terms of Payment','Market Segment','Variant','Sales Order Type','ComPartner','Plant','Shipping Condition','Destination Country','Material Group 3','End Use','Material Group 1','Partner ZF','Payer','Campaign','Document Currency','State','Material Group 5 Key'};
            for(String kc:kcNameSet)
        {
            if(keyComDesc.containsIgnoreCase(kc))
            {
                if(keySetMap.get(kc)!=null && !keySetMap.get(kc).contains(keyErrorMap.get(kc)))
                {
                    system.debug('keyErrorMap.get(kc) is '+keyErrorMap.get(kc));
                    return Key_Field_Error__c.getInstance(kc).Error_Message__c;
                }
            }
        }
        return '';
    }
    //<PP20140429>
    /*
* Author       :   Infosys
* Method Name  :   retrievePriceRecords
* Parameters   :
* Return type  :   List<ERP_Sales_Prices_SAP__c>
* Description  :   This method is used to get the valid price records in Current Prices screen
*/
    public List<SObject> retrievePriceRecords(Organizational_Group_Item__c ogi)
    {
        //relatedWrappersList = new List<PARelatedList>();
        List<ERP_Sales_Prices_SAP__c> priceRecordsList = new List<ERP_Sales_Prices_SAP__c>();
        List<ERP_Sales_Prices_SAP__c> soldToPrices = new List<ERP_Sales_Prices_SAP__c>();
        List<ERP_Sales_Prices_SAP__c> allOtherPrices = new List<ERP_Sales_Prices_SAP__c>();
        List<ERP_Sales_Prices_SAP__c> priceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
        Set<ERP_Sales_Prices_SAP__c> priceHoldersSet = new Set<ERP_Sales_Prices_SAP__c>();
        List<ERP_Sales_Prices_SAP__c> finalPriceHoldersList;
        List<SObject> finalPriceRecList;
        Map<Id,List<ERP_Sales_Prices_SAP__c>> holderIdChildRecMap = new Map<Id,List<ERP_Sales_Prices_SAP__c>>();
        Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
        List<ERP_Sales_Prices_SAP__c> relatedPrices, validToList, validFromList;
        //<KJ20150519>
        String shMaterial = '%'+searchedMaterial+'%';
        String shItem ='%'+searchedItem+'%';
        //System.debug('****validOnFilter'+validOnFilter+'***'+request.currentPricesSelection+'****'+pcKCSelected);
        //ZMBS-MCM Zbase : A580-Sales Area/Sold to/Material
        String pcCode, kcCode;
        System.debug('***pcKCSelected '+pcKCSelected+' ***pcCode '+pcCode+' ***kcCode '+kcCode);
        if(!String.isBlank(pcKCSelected) && pcKCSelected != '--Select--')
        {
            pcCode = pcKCSelected.split(':',2)[0].trim().split('-',2)[0].trim();
            kcCode = pcKCSelected.split(':',2)[1].trim().split('-',2)[0].trim();
        }
        else
        {
            pcCode = '%';
            kcCode = '%';
        }
        System.debug('***pcKCSelected '+pcKCSelected+' ***pcCode '+pcCode+' ***kcCode '+kcCode);
        //retrieving active materials for the sales area
        List<Material__c> activeMaterialsList = new List<Material__c>();
        //Only Ship-to enhancement START
        List<ERP_Relationship__c> shipToList = new List<ERP_Relationship__c>();
        List<ERP_Customer__c> shipToCustomersList = new List<ERP_Customer__c>();
        List<String> shipToCodesList = new List<String>();
        List<String> shipToCodesListPQ = new List<String>();
        List<Id> shipToIds = new List<Id>();
        //Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
        Id Customer_RTYPE_Id = Schema.SObjectType.ERP_Customer__c.getRecordTypeInfosByName().get('ERP Customer - Extended Data').getRecordTypeId();
        shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                      FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                      AND Partner_Function_Code__c='WE'];
        for(ERP_Relationship__c X:shipToList)
        {
            shipToIds.add(X.Related_ERP_Customer__c);
        }
        shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                               AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                               Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                               RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                               AND Deletion_Flag__c = false];
        for(ERP_Customer__c X1 : shipToCustomersList)
        {
            shipToCodesListPQ.add('\''+X1.Customer_Code__c+'\'');
            shipToCodesList.add(X1.Customer_Code__c);
        }
        List<String> endUserCodesList = new List<String>();
        //Added for pAQuery
        List<String> endUserCodesListPQ = new List<String>();
        shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                      FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                      AND Partner_Function_Code__c IN ('ZH','ZQ') ];
        shipToIds = new List<Id>();
        for(ERP_Relationship__c X:shipToList)
        {
            shipToIds.add(X.Related_ERP_Customer__c);
        }
        shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                               AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                               Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                               RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                               AND Deletion_Flag__c = false];
        for(ERP_Customer__c X1 : shipToCustomersList)
        {
            endUserCodesListPQ.add('\''+X1.Customer_Code__c+'\'');
            endUserCodesList.add(X1.Customer_Code__c);
        }
        
        //<MS20150402> 
        List<String> partnerZFCodesList = new List<String>();
        //Added for pAQuery
        List<String> partnerZFCodesListPQ = new List<String>();
        shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                      FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                      AND Partner_Function_Code__c IN ('ZF') ];
        shipToIds = new List<Id>();
        for(ERP_Relationship__c X:shipToList)
        {
            shipToIds.add(X.Related_ERP_Customer__c);
        }
        shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                               AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                               Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                               RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                               AND Deletion_Flag__c = false];
        for(ERP_Customer__c X1 : shipToCustomersList)
        {
            partnerZFCodesListPQ.add('\''+X1.Customer_Code__c+'\'');
            partnerZFCodesList.add(X1.Customer_Code__c);
        }
        
        
        List<String> payerCodesList = new List<String>();
        //Added for pAQuery
        List<String> payerCodesListPQ = new List<String>();
        shipToList = [SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c
                      FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_Code__c =:request.customer.paERPCustomer.Customer_code__c
                      AND Partner_Function_Code__c IN ('RG') ];
        shipToIds = new List<Id>();
        for(ERP_Relationship__c X:shipToList)
        {
            shipToIds.add(X.Related_ERP_Customer__c);
        }
        shipToCustomersList = [SELECT Id,Customer_Code__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c
                               AND Distribution_Channel_Code__c = :request.customer.paERPCustomer.Distribution_Channel_Code__c AND
                               Division_Code__c = :request.customer.paERPCustomer.Division_Code__c AND
                               RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                               AND Deletion_Flag__c = false];
        for(ERP_Customer__c X1 : shipToCustomersList)
        {
            payerCodesListPQ.add('\''+X1.Customer_Code__c+'\'');
            payerCodesList.add(X1.Customer_Code__c);
        }
        
        //Only Ship-to enhancement END
        List<String> activeMatCodesList = new List<String>();
        String sapCluster = ogi.ERP_Pricing_Procedure__r.SAP_Cluster__c + '%';
        String salesOrgDC = '%' + request.customer.paERPCustomer.Sales_Org_Code__c + '-' + request.customer.paERPCustomer.Distribution_Channel_Code__c + '%';
        salesorgDC = '%'+request.pricingRequest.Sales_Org_Code__c+'-'+request.pricingRequest.Dist_Channel_Code__c+'%';
        
        
        //retrieving all price records for the valid date-add external erp id TODO, active materials
        //<MS20140515> Added Variant and SalesOrderType fields in the query
        System.debug('****pcCode'+pcCode+'***kcCode'+kcCode+'**'+pcKCSelected);
        system.debug(LoggingLevel.Error,'request.requestServiceState.ogItems.value is '+request.requestServiceState.ogItems.value);
        system.debug(LoggingLevel.Error,'request.pclDisplayPopUp is '+request.pclDisplayPopUp);
        system.debug('**** ogi.ERP_Pricing_Procedure__c'+ogi.ERP_Pricing_Procedure__c+'***request.customer.paERPCustomer.Sales_Org_Code__c'+request.customer.paERPCustomer.Sales_Org_Code__c);
        //<TJ20140923>
        if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
            /*priceRecordsList = [SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,
Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Id,Name,Country_Code__c,
Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,
Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Condition_Class__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,
Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,
PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,
PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,markForDeletion__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Condition_Class_Code__c,
Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,
Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,Calculation_Type__c,
SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,
ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,
ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Calculation_Type_Code__c,
Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,
Check_Scale_Code__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,
Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,
Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,
Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,
Plus_Minus_Code__c,Plus_Minus__c,Volume__c,Volume_UoM__c, Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name
FROM ERP_Sales_Prices_SAP__c WHERE Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND
(Sold_To_Code__c = :request.customer.paERPCustomer.Customer_code__c OR (Sold_To_Code__c = NULL AND ShipTo_Code__c IN :shipToCodesList)
OR (Sold_To_Code__c = NULL AND End_User_Code__c IN :endUserCodesList)) AND
Pricing_Condition_Code__c LIKE :pcCode AND Key_Combination_Code__c LIKE :kcCode AND Sales_Price_Type__c = 'Permanent' AND Customer_Specific__c=false AND
Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c AND isPriceHolder__c = false ORDER BY
Approved_Date__c DESC limit 50000];*/
            //<AJ20160314> IS ID-00065042,IS ID-00066124 Added ShipTo_Code__c!= NULL,End_User_Code__c != NULL, Partner_ZF_Code__c != NULL, Payer_Code__c != NULL in where clause
            //<AG20210510>START
            priceRecordsList=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList','Sales_Pricing_Procedure__c ='+ogi.ERP_Pricing_Procedure__c+' AND (Sold_To_Code__c =\''+request.customer.paERPCustomer.Customer_code__c+'\' OR (Sold_To_Code__c = NULL AND ShipTo_Code__c != NULL AND ShipTo_Code__c IN \''+shipToCodesListPQ+'\') OR (Sold_To_Code__c = NULL AND End_User_Code__c != NULL AND End_User_Code__c IN \''+endUserCodesListPQ+'\')OR (Sold_To_Code__c = NULL AND Partner_ZF_Code__c != NULL  AND Partner_ZF_Code__c IN \''+partnerZFCodesListPQ+'\')OR (Sold_To_Code__c = NULL AND Payer_Code__c != NULL AND Payer_Code__c IN \''+payerCodesListPQ+'\')) AND Pricing_Condition_Code__c LIKE \''+pcCode+'\' AND Key_Combination_Code__c LIKE \''+kcCode+'\' AND Sales_Price_Type__c = \'Permanent\' AND Customer_Specific__c=false AND Sales_Org_Code__c =\''+request.pricingRequest.Sales_Org_Code__c+'\' AND isPriceHolder__c = false ORDER BY Approved_Date__c DESC limit 25000');
            //<AG20210510>END
        else if(request.pricingRequest.Request_Type__c == 'Massive')
            /*  priceRecordsList = [SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,
Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Id,Name,Country_Code__c,
Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,
Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Condition_Class__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,
Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,
PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,
PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,markForDeletion__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Condition_Class_Code__c,
Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,
Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,Calculation_Type__c,
SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,
ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,
ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Calculation_Type_Code__c,
Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,
Check_Scale_Code__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,
Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,
Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,
Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,
Plus_Minus_Code__c,Plus_Minus__c,Volume__c,Volume_UoM__c, Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name
FROM ERP_Sales_Prices_SAP__c WHERE Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND
Pricing_Condition_Code__c LIKE :pcCode AND Key_Combination_Code__c LIKE :kcCode AND Sales_Price_Type__c = 'Permanent' AND Customer_Specific__c=true AND
Sales_Org_Code__c = :request.pricingRequest.Sales_Org_Code__c AND isPriceHolder__c = false ORDER BY
Approved_Date__c DESC limit 50000];*/
            //<AG20210510>START
            priceRecordsList=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList','Sales_Pricing_Procedure__c = \''+ogi.ERP_Pricing_Procedure__c+'\' AND Pricing_Condition_Code__c LIKE \''+pcCode+'\' AND Key_Combination_Code__c LIKE \''+kcCode+'\' AND Sales_Price_Type__c = \'Permanent\' AND Customer_Specific__c=true AND Sales_Org_Code__c =\''+request.pricingRequest.Sales_Org_Code__c+'\' AND isPriceHolder__c = false ORDER BY Approved_Date__c DESC limit 25000');
        /*else if(request.requestServiceState.ogItems.isEndUserRebate){
priceRecordsList=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList','Sales_Pricing_Procedure__c = \''+ogi.ERP_Pricing_Procedure__c+'\' AND Pricing_Condition_Code__c LIKE \''+pcCode+'\' AND Key_Combination_Code__c LIKE \''+kcCode+'\' AND Sales_Price_Type__c = \'Permanent\' AND Customer_Specific__c=true AND Sales_Org_Code__c =\''+request.pricingRequest.Sales_Org_Code__c+'\''+' AND Sold_To_Code__c= \''+request.requestServiceState.erpcustomer.paERPCustomer.Customer_Code__c+'\''+' AND Customer_Price_Group_Code__c= \''+request.requestServiceState.erpcustomer.paERPCustomer.Customer_Price_Group_Code__c+'\' AND End_User_Code__c = '+'\''+request.pricingRequest.End_User_Code__c+'\' AND isPriceHolder__c = false ORDER BY Approved_Date__c DESC limit 25000');
}*/
        else if(request.requestServiceState.ogItems.isEndUserRebate){
            
            String rpqIdentifier = request.requestServiceState.currentRequest.pricingRequest.BU__c+'-'+request.requestServiceState.currentRequest.pricingRequest.Sales_Org_Code__c;
            system.debug('rpqIdentifier is '+rpqIdentifier);
            Rebate_Price_Quote_Data__c rpqdata = Rebate_Price_Quote_Data__c.getInstance(rpqIdentifier);
            system.debug('rpqdata is '+rpqdata);
            priceRecordsList=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList','Sales_Pricing_Procedure__c = \''+ogi.ERP_Pricing_Procedure__c+'\' AND Pricing_Condition_Code__c LIKE \''+pcCode+'\' AND Key_Combination_Code__c LIKE \''+rpqdata.Lookup_KeyCombination__c+'\' AND Sales_Org_Code__c =\''+request.pricingRequest.Sales_Org_Code__c+'\''+' AND Customer_Price_Group_Code__c= \''+request.requestServiceState.erpcustomer.paERPCustomer.Customer_Price_Group_Code__c+'\''+' AND isPriceHolder__c = false ORDER BY Approved_Date__c DESC limit 25000');
            system.debug('priceRecordsList size is '+priceRecordsList.size());
            //<AG20210510>END
        }
        else
            /*  priceRecordsList = [SELECT Ship_To_Country__c,Ship_To_Country_Code__c,Terms_of_Payment__c,
Price_Ref_Partner_Code__c,Price_Ref_Partner__c,Market_Segment_Code__c,Market_Segment__c,Project__c,Variant_Code__c,Variant__c,ComPartner__c,ComPartner_Code__c,Plant__c,Plant_Code__c,Shipping_Condition__c,Shipping_Condition_Code__c,Destination_Country__c,Destination_Country_Code__c,Sales_Order_Type_Code__c,Sales_Order_Type__c,Id,Name,Country_Code__c,
Country__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Customer_Specific__c,Distribution_Channel_Code__c,
Dist_Channel__c,Division__c,Division_Code__c,End_Use_Code__c,End_Use__c,End_User_Code__c,End_User__c,Condition_Class__c,
Incoterms_1_Code__c,Incoterms1__c,Key_Combination_Code__c,Key_Combination__c,Material_Code__c,Material__c,
Customer_Hierarchy_Code__c,Customer_Hierarchy__c,Material_Price_Group_Code__c,Material_Price_Group__c ,Per__c,
PH1__c,PH1_Code__c,PH2__c,PH2_Code__c,PH3__c,PH3_Code__c,PH4__c,PH4_Code__c,PH5__c,PH5_Code__c,PH6__c,PH6_Code__c,
PH7__c,PH7_Code__c,PH8__c,PH8_Code__c,PH9__c,PH9_Code__c,Price_List_Type_Code__c,Price_List_Type__c,markForDeletion__c,
Pricing_Condition__c,Pricing_Condition_Code__c,Product_Hierarchy__c,F_Product_Hierarchy_Code__c,Condition_Class_Code__c,
Product_Hierarchy_Code__c,Profit_Center_Code__c,Profit_Center__c,Quantity__c,Rate__c,Sales_Office_Code__c,
Sales_Office__c,Sales_Org__c,Sales_Org_Code__c,Sales_Price_Type__c,Sales_Pricing_Procedure__c,Calculation_Type__c,
SAP_Application_Id__c,SAP_Client_ID__c,SAP_Cluster__c,Check_Scale__c,Scaled_Price_Flag__c,Scale_Type__c,
ScaleRate1__c,ScaleRate2__c,ScaleRate3__c,project_id__c,ScaleRate4__c,ScaleRate5__c,ScaleRate6__c,ScaleRate7__c,
ScaleRate8__c,ScaleRate9__c,ScaleRate10__c,Sold_To_Code__c,Sold_To__c,ShipTo__c,ShipTo_Code__c,Calculation_Type_Code__c,
Terms_of_Payment_Code__c,Unit__c,UoM__c,Approved_Date__c,Valid_From__c,Valid_To__c,Price_Holder__c,Disc_ref__c,
Check_Scale_Code__c,Scale_Basis_Code__c,Scale_Basis__c,Scale_Quantity_Scale_Value1__c,Scale_Quantity_Scale_Value2__c,
Scale_Quantity_Scale_Value3__c,Scale_Quantity_Scale_Value4__c,Scale_Quantity_Scale_Value5__c,
Scale_Quantity_Scale_Value6__c,Scale_Quantity_Scale_Value7__c,Scale_Quantity_Scale_Value8__c,
Scale_Quantity_Scale_Value9__c,Scale_Quantity_Scale_Value10__c,Scale_Type_Code__c,Scale_UoM_Scale_Unit__c,
Plus_Minus_Code__c,Plus_Minus__c,Volume__c,Volume_UoM__c, Customer_Price_Payment_Terms__c,Payment_Terms_Fixed_Date__c,Pricing_Request__c,Pricing_Request__r.Name
FROM ERP_Sales_Prices_SAP__c WHERE Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND
(Sold_To_Code__c = :request.customer.paERPCustomer.Customer_code__c OR (Sold_To_Code__c = NULL AND ShipTo_Code__c IN :shipToCodesList)
OR (Sold_To_Code__c = NULL AND End_User_Code__c IN :endUserCodesList)) AND Pricing_Condition_Code__c LIKE :pcCode AND
Key_Combination_Code__c LIKE :kcCode AND Sales_Price_Type__c = 'Permanent' AND
Sales_Org_Code__c = :request.customer.paERPCustomer.Sales_Org_Code__c AND isPriceHolder__c = false ORDER BY
Approved_Date__c DESC limit 50000];*/
        { String priprocStr;
         String shipToStringList='',endUserStringList='',partnerZFStringList='',payerStringList='';
         if(ogi.ERP_Pricing_Procedure__c==null)
             priprocStr = 'NULL';
         else
             priprocStr = '\''+ogi.ERP_Pricing_Procedure__c+'\'';                                
         if(shipToCodesListPQ.size()>0)
         {
             for(String shipTo:shipToCodesListPQ)
                 shipToStringList=shipToStringList+shipTo+',';
             shipToStringList=shipToStringList.substring(0,shipToStringList.length()-1);
             shipToStringList='('+shipToStringList+')';
         }
         else
             shipToStringList='(\''+'\')';
         if(endUserCodesListPQ.size()>0)
         {
             for(String endUser:endUserCodesListPQ)
                 endUserStringList=endUserStringList+endUser+',';
             endUserStringList=endUserStringList.substring(0,endUserStringList.length()-1);
             endUserStringList='('+endUserStringList+')';
         }
         else
             endUserStringList='(\''+'\')';
         
         if(partnerZFCodesListPQ.size()>0)
         {
             for(String partnerZF:partnerZFCodesListPQ)
                 partnerZFStringList=partnerZFStringList+partnerZF+',';
             partnerZFStringList=partnerZFStringList.substring(0,partnerZFStringList.length()-1);
             partnerZFStringList='('+partnerZFStringList+')';
         }
         else
             partnerZFStringList='(\''+'\')';
         
         if(payerCodesListPQ.size()>0)
         {
             for(String payer:payerCodesListPQ)
                 payerStringList=payerStringList+payer+',';
             payerStringList=payerStringList.substring(0,payerStringList.length()-1);
             payerStringList='('+payerStringList+')';
         }
         else
             payerStringList='(\''+'\')';
         //<HL20150624> changed the limit from 30K to 10K in the below query to solve production issue for too many query rows  
         System.debug('priceRecordsList size after '+priceRecordsList.size());
         /* <SD20160518> updated by Sumita Dabas under IS ID-00069797, dynamic where clause formation, changed the query call START  */
         //<SH20220107>Updated by Sapneet Hora for IS SC-00102340 in production where prices are not available in current prices view, updated whereClause1 and whereClause2 in query
         String whereClause1 = '';
         if(soldToPrices.size()== 0)
             
             if(!String.isBlank(priprocStr))
         {
             whereClause1 += 'Sales_Pricing_Procedure__c = ' + priprocStr;
         }
         if(request.customer.paERPCustomer.Customer_code__c != null && (!String.isBlank(request.customer.paERPCustomer.Customer_code__c)))
         {
             whereClause1 += ' AND Sold_To_Code__c = \''+request.customer.paERPCustomer.Customer_code__c+'\'';
         }
         
         if(!String.isBlank(pcCode) && pcCode != '%')
         {
             whereClause1 += ' AND Pricing_Condition_Code__c LIKE ' + '\''+pcCode+'\'';
         }
         if(!String.isBlank(kcCode) && kcCode != '%')
         {
             whereClause1 += ' AND Key_Combination_Code__c LIKE ' + '\''+kcCode+'\'';
         }
         
         whereClause1 += ' AND Sales_Price_Type__c = \'Permanent\''+
             ' AND Sales_Org_Code__c = \''+request.customer.paERPCustomer.Sales_Org_Code__c+'\''+
             ' AND isPriceHolder__c = false ';
         //' AND markforDeletion__c = false ';
         //<AG20201124> Limit changed from 15000 to 12000
         //<MF20240111> Limit changed from 12000 to 10000
         whereClause1 += ' ORDER BY Approved_Date__c DESC limit 10000';
         
         soldToPrices=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList',whereClause1);
         Integer NoOfsoldToPrices= soldToPrices.size();
         
         String whereClause2 = '';
         if(allOtherPrices.size()== 0)
             
             if(!String.isBlank(priprocStr))
         {
             whereClause2 += 'Sales_Pricing_Procedure__c = ' + priprocStr;
         }
         if((shipToStringList != null && shipToStringList.length()>0 && shipToStringList != '(\'\')' )||( endUserStringList != null && endUserStringList.length()>0 && endUserStringList != '(\'\')')||(partnerZFStringList != null && partnerZFStringList.length()>0 && partnerZFStringList != '(\'\')')||(payerStringList != null && payerStringList.length()>0 && payerStringList != '(\'\')'))
         {
             whereClause2 += 'AND (';
         }
         if(shipToStringList != null && shipToStringList.length()>0 && shipToStringList != '(\'\')' )
         {
             //whereClause1 += ' OR (ShipTo_Code__c != NULL AND ShipTo_Code__c IN '+shipToStringList+')';
             whereClause2 += '(ShipTo_Code__c IN '+shipToStringList+')';
         }
         if(endUserStringList != null && endUserStringList.length()>0 && endUserStringList != '(\'\')')
         {if(shipToStringList != null && shipToStringList.length()>0 && shipToStringList != '(\'\')' ){   //<SH20220624>
             //whereClause1 += ' OR (End_User_Code__c != NULL AND End_User_Code__c IN '+endUserStringList+')'; 
             whereClause2 += ' OR (End_User_Code__c IN '+endUserStringList+')'; }
          else{                                                                                           //<SH20220624>
              whereClause2 += '(End_User_Code__c IN '+endUserStringList+')';
          }
         }
         //siri-end
         if(partnerZFStringList != null && partnerZFStringList.length()>0 && partnerZFStringList != '(\'\')')
         {if((shipToStringList != null && shipToStringList.length()>0 && shipToStringList != '(\'\')' )||(endUserStringList != null && endUserStringList.length()>0 && endUserStringList != '(\'\')')){   //<SH20220624>
             //whereClause1 += ' OR (Partner_ZF_Code__c != NULL AND Partner_ZF_Code__c IN '+partnerZFStringList+')';
             whereClause2 += ' OR (Partner_ZF_Code__c IN '+partnerZFStringList+')';}
          else                                                                                 //<SH20220624>
              whereClause2 += '(Partner_ZF_Code__c IN '+partnerZFStringList+')';
         }
         if(payerStringList != null && payerStringList.length()>0 && payerStringList != '(\'\')')
         {if((shipToStringList != null && shipToStringList.length()>0 && shipToStringList != '(\'\')' )||(endUserStringList != null && endUserStringList.length()>0 && endUserStringList != '(\'\')')||(partnerZFStringList != null && partnerZFStringList.length()>0 && partnerZFStringList != '(\'\')')){         //<SH20220624>

             //whereClause1 += ' OR (Payer_Code__c != NULL AND Payer_Code__c IN '+payerStringList+')'; 
             whereClause2 += ' OR (Payer_Code__c IN '+payerStringList+')'; }
          else                                                                                  //<SH20220624>
               whereClause2 += '(Payer_Code__c IN '+payerStringList+')';
         }
                  if((shipToStringList != null && shipToStringList.length()>0 && shipToStringList != '(\'\')' )||( endUserStringList != null && endUserStringList.length()>0 && endUserStringList != '(\'\')')||(partnerZFStringList != null && partnerZFStringList.length()>0 && partnerZFStringList != '(\'\')')||(payerStringList != null && payerStringList.length()>0 && payerStringList != '(\'\')'))
                  {
         whereClause2 += ')';
                  }
         if(!String.isBlank(pcCode) && pcCode != '%')
         {
             whereClause2 += ' AND Pricing_Condition_Code__c LIKE ' + '\''+pcCode+'\'';
         }
         if(!String.isBlank(kcCode) && kcCode != '%')
         {
             whereClause2 += ' AND Key_Combination_Code__c LIKE ' + '\''+kcCode+'\'';
         }
         
         whereClause2 += ' AND Sales_Price_Type__c = \'Permanent\''+
             ' AND Sales_Org_Code__c = \''+request.customer.paERPCustomer.Sales_Org_Code__c+'\''+
             ' AND isPriceHolder__c = false ';
         //' AND markforDeletion__c = false ';
         //<AG20201124> Limit changed from 15000 to 12000
         //<MF20240111> Limit changed from 12000 to 10000
         Integer NoOfOtherPrices= 10000 - NoOfsoldToPrices;
         whereClause2 += ' ORDER BY Approved_Date__c DESC limit ' +NoOfOtherPrices  ;
         
         allOtherPrices=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList',whereClause2);
         //<AG20201124>
         //<AJ20160314> IS ID-00065042,IS ID-00066124 Added ShipTo_Code__c!= NULL,End_User_Code__c != NULL, Partner_ZF_Code__c != NULL, Payer_Code__c != NULL in where clause
         //priceRecordsList=(List<ERP_Sales_Prices_SAP__c>)PAQueryUtil.query('PASalesPriceSAP','salesPriceRecordsList','Sales_Pricing_Procedure__c = '+priprocStr+' AND (Sold_To_Code__c =\''+request.customer.paERPCustomer.Customer_code__c+'\' OR (Sold_To_Code__c = NULL AND ShipTo_Code__c != NULL AND ShipTo_Code__c IN '+shipToStringList+') OR (Sold_To_Code__c = NULL AND End_User_Code__c != NULL AND End_User_Code__c IN '+endUserStringList+') OR (Sold_To_Code__c = NULL AND Partner_ZF_Code__c != NULL  AND Partner_ZF_Code__c IN '+partnerZFStringList+')OR(Sold_To_Code__c = NULL AND Payer_Code__c != NULL AND Payer_Code__c IN '+payerStringList+')) AND Pricing_Condition_Code__c LIKE \''+pcCode+'\' AND Key_Combination_Code__c LIKE \''+kcCode+ '\' AND Sales_Price_Type__c = \'Permanent\' AND Sales_Org_Code__c = \''+request.customer.paERPCustomer.Sales_Org_Code__c+'\' AND isPriceHolder__c = false ORDER BY Approved_Date__c DESC limit 15000');
        
        
         soldToPrices.addAll(allOtherPrices);
         priceRecordsList.addAll(soldToPrices);
         /* <SD20160518> updated by Sumita Dabas under IS ID-00069797, dynamic where clause formation, changed the query call END  */
        }
        //<SH20220107>Updated by Sapneet Hora for IS SC-00102340 in production where prices are not available in current prices view, updated whereClause1 and whereClause2 in query
        System.debug('priceRecordsList size after '+priceRecordsList.size());
        system.debug('request.currentPricesSelection is '+request.currentPricesSelection);
        //System.debug('request.customer.paERPCustomer.Customer_code__c:-'+request.customer.paERPCustomer.Customer_code__c);
        //checking for the currentPricesLoad value //Valid On, Current Prices
        if(!String.isBlank(request.currentPricesSelection) && (request.currentPricesSelection.equalsIgnoreCase('Valid On')
                                                               || request.currentPricesSelection.equalsIgnoreCase('Current Prices')))
        {
            if(request.currentPricesSelection.equalsIgnoreCase('Valid On') && request.validOnDateViewCustomerprices!=null)
                validOnFilter = request.validOnDateViewCustomerprices;
            else
                validOnFilter = System.today();
            System.debug('****validOnFilter'+validOnFilter);
            
            if(validOnFilter == null)
            {
                throw new PAException(System.Label.Valid_On_Mandatory_Error,ApexPages.Severity.ERROR);  
            }
            finalPriceRecList = new List<SObject>();
            finalPriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            
            List<String> matCodesList = new List<String>();
            
            for(ERP_Sales_Prices_SAP__c prRec : priceRecordsList)
            {
                if(!holderIdChildRecMap.containskey(prRec.Price_Holder__c))
                {
                    List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
                    l1.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,l1);
                }
                else
                {
                    List<ERP_Sales_Prices_SAP__c> hRecList = holderIdChildRecMap.get(prRec.Price_Holder__c);
                    hRecList.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,hRecList);
                }
                //System.debug(' material codes : '+ prRec.Material_Code__c);
                matCodesList.add(prRec.Material_Code__c);
            }      
            System.debug(' matCodesList'+  matCodesList.size());
            //for(Integer i=0;i<matCodesList.size();i++)
                //System.debug(' matCodesList'+  matCodesList[i]);
            System.debug(' salesOrgDC :'+  salesOrgDC);
            System.debug(' sapCluster :'+  sapCluster);
            System.debug('Material_RTYPE_Id'+Material_RTYPE_Id);
            System.debug('holderIdChildRecMap'+ holderIdChildRecMap.size());      
            
            system.debug('searchMt&& '+ shMaterial);
            //<KJ20150519> Added queries to retrieve the prices according to the searched text
            if(ogi.Enable_Variable_Config_Materials__c)
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND
                                       External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                       AND RecordTypeId = :Material_RTYPE_Id AND 
                                       ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                
            }
            else
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND External_ERP_ID__c LIKE :salesOrgDC
                                       AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false AND
                                       RecordTypeId = :Material_RTYPE_Id limit 50000];
                
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
            }
            System.debug(' activeMaterialsList'+ activeMaterialsList.size());      
            for(Material__c mat : activeMaterialsList)
            {
                activeMatCodesList.add(mat.ERP_Material_Code__c);
            }
            //retrieving price holders for the price records
            system.debug('holderIdChildRecMap.keySet() is '+holderIdChildRecMap.keySet());
            system.debug('request.customer.paERPCustomer.Sales_Org_Code__c is '+request.customer.paERPCustomer.Sales_Org_Code__c);
            system.debug('customer code is '+request.customer.paERPCustomer.Customer_code__c);
            system.debug('ogi.ERP_Pricing_Procedure__c is '+ogi.ERP_Pricing_Procedure__c);
            system.debug('validOnFilter is '+validOnFilter);
            System.debug('Shipto List:'+shipToCodesList);
            
            //<TJ20140923>
            if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
                finalPriceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                         Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                         Sold_To_Code__c = :request.pricingRequest.Sales_Org_code__c AND isPriceHolder__c = true AND
                                         Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND Valid_From__c <= :validOnFilter AND Customer_Specific__c=false AND
                                         Valid_To__c >= :validOnFilter AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else if(request.pricingRequest.Request_Type__c == 'Massive')
                finalPriceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                         Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                         Sold_To_Code__c = :request.pricingRequest.Sales_Org_code__c AND isPriceHolder__c = true AND
                                         Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND Valid_From__c <= :validOnFilter AND Customer_Specific__c=true AND
                                         Valid_To__c >= :validOnFilter AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else if(request.requestServiceState.ogItems.isEndUserRebate){
                finalPriceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                         Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                         isPriceHolder__c = true AND
                                         Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND Valid_From__c <= :validOnFilter AND
                                         Valid_To__c >= :validOnFilter AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
                
            }
            //<AV20150404>-Production issue-view cust prices null section issue-added markfordeletion = false in where condition
            else
                //<AJ20160314> IS ID-00065042,IS ID-00066124 Added ShipTo_Code__c != NULL, End_User_Code__c != NULL, Partner_ZF_Code__c != NULL, Payer_Code__c != NULL in where clause
                
                finalPriceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                         Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                         (Sold_To_Code__c = :request.customer.paERPCustomer.Customer_code__c OR (Sold_To_Code__c = NULL AND ShipTo_Code__c != NULL AND ShipTo_Code__c IN :shipToCodesList)
                                          OR (Sold_To_Code__c = NULL AND End_User_Code__c != NULL AND End_User_Code__c IN :endUserCodesList)OR (Sold_To_Code__c = NULL AND Partner_ZF_Code__c != NULL AND Partner_ZF_Code__c IN :partnerZFCodesList)OR (Sold_To_Code__c = NULL AND Payer_Code__c != NULL AND Payer_Code__c IN :payerCodesList))  AND isPriceHolder__c = true AND
                                         Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND Valid_From__c <= :validOnFilter AND
                                         Valid_To__c >= :validOnFilter AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) AND markForDeletion__c = false limit 50000];
            //Retrieving the child records and modifying them according to the latest approved date  
            System.debug('finalPriceHoderList:'+ finalPriceHoldersList.size()+ finalPriceHoldersList);   
            
            Integer listsize = 0;
            //<AV20152306>-Production Heap size error-commented debug statements
            for(ERP_Sales_Prices_SAP__c erpSAPHolder : finalPriceHoldersList)
            {
                relatedPrices = new List<ERP_Sales_Prices_SAP__c>();
                relatedPrices = holderIdChildRecMap.get(erpSAPHolder.Id);
                //System.debug('relatedPrices:'+relatedPrices);
                //System.debug('*****holderIdChildRecMap.get(erpSAPHolder.Id)'+holderIdChildRecMap.get(erpSAPHolder.Id));
                //System.debug('validOnFilter:'+validOnFilter);
                ERP_Sales_Prices_SAP__c currentPrice = new ERP_Sales_Prices_SAP__c();
                for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                {
                    //<PS20150721> For Current Prices.
                    if(erpSAP.Valid_From__c <= validOnFilter && erpSAP.Valid_To__c >= validOnFilter && erpSAP.markForDeletion__c == false)
                    {
                        currentPrice = erpSAP;
                        break;
                    }
                }
                validToList = new List<ERP_Sales_Prices_SAP__c>();
                validFromList = new List<ERP_Sales_Prices_SAP__c>();
                for(ERP_Sales_Prices_SAP__c otherRec : relatedPrices)
                {
                    if(otherRec.Id != currentPrice.Id && otherRec.Approved_Date__c > currentPrice.Approved_Date__c)
                    {
                        if(otherRec.Valid_From__c > validOnFilter && otherRec.Valid_From__c >= currentPrice.Valid_From__c
                           && otherRec.Valid_From__c <= currentPrice.Valid_To__c)
                        {
                            validFromList.add(otherRec);
                        }
                        if(otherRec.Valid_To__c < validOnFilter && otherRec.Valid_To__c >= currentPrice.Valid_From__c
                           && otherRec.Valid_To__c <= currentPrice.Valid_To__c)
                        {
                            validToList.add(otherRec);
                        }
                    }
                }
                if(validFromList.size()>1)
                {
                    validFromList = PAUtil.sortList(validFromList,'Valid_From__c', 'asc');
                }
                if(validToList.size()>1)
                {
                    validToList = PAUtil.sortList(validToList,'Valid_To__c', 'desc');
                }
                if(validFromList.size()!=0)
                {
                    currentPrice.Valid_To__c = validFromList[0].Valid_From__c - 1 ;       
                }
                if(validToList.size()!=0)
                {
                    currentPrice.Valid_From__c = validToList[0].Valid_To__c + 1 ;         
                }
                //System.debug('currentPrice size:'+currentPrice);
                finalPriceRecList.add(currentPrice);
                //Added to get the prices with latest valid to on top
                //system.debug('^&@#%^hi'+finalPriceRecList.size()+','+request.currentPricesSelection+','+currentPrice.markForDeletion__c+','+currentPrice.Id+','+currentPrice.Valid_To__c);
                listsize++;
                //if(listsize>=400 && request.requestServiceState.ogItems.isEndUserRebate) break; 
                //<HL20150624> commented the && condition from above line to fix Heap size issue in production
                if(listsize>=400) break;
            }
            finalPriceRecList = PAUtil.sortList(finalPriceRecList,'Valid_To__c', 'desc');
        }
        //checking for the currentPricesLoad value //Last Valid Prices
        else if((!String.isBlank(request.currentPricesSelection) && request.currentPricesSelection.equalsIgnoreCase('Last Valid Prices')))
        {
            validOnFilter = System.today();
            finalPriceRecList = new List<SObject>();
            finalPriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            List<String> matCodesList = new List<String>();
            
            for(ERP_Sales_Prices_SAP__c prRec : priceRecordsList)
            {
                if(!holderIdChildRecMap.containskey(prRec.Price_Holder__c))
                {
                    List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
                    l1.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,l1);
                }
                else
                {
                    List<ERP_Sales_Prices_SAP__c> hRecList = holderIdChildRecMap.get(prRec.Price_Holder__c);
                    hRecList.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,hRecList);
                }
                matCodesList.add(prRec.Material_Code__c);
            }  
            //<KJ20150519> Added queries to retrieve the prices according to the searched text    
            if(ogi.Enable_Variable_Config_Materials__c)
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND
                                       External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                       AND RecordTypeId = :Material_RTYPE_Id AND 
                                       ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
            }
            else
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND External_ERP_ID__c LIKE :salesOrgDC
                                       AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false AND
                                       RecordTypeId = :Material_RTYPE_Id limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }         
                
            }
            for(Material__c mat : activeMaterialsList)
            {
                activeMatCodesList.add(mat.ERP_Material_Code__c);
            }
            //<TJ20140923>
            //retrieving price holders for the price records
            if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND
                                    isPriceHolder__c = true AND Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND Customer_Specific__c=false AND
                                    ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else if(request.pricingRequest.Request_Type__c == 'Massive')
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND
                                    isPriceHolder__c = true AND Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND Customer_Specific__c=true AND
                                    ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                    (Sold_To_Code__c = :request.customer.paERPCustomer.Customer_code__c OR ShipTo_Code__c IN :shipToCodesList) AND isPriceHolder__c = true AND
                                    Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND
                                    ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            List<ERP_Sales_Prices_SAP__c> inActivePriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            Map<String,ERP_Sales_Prices_SAP__c> pckcPriceHolder = new Map<String,ERP_Sales_Prices_SAP__c>();
            Set<String> validPCKCSet = new Set<String>();
            for(ERP_Sales_Prices_SAP__c pHolder : priceHoldersList)
            {
                if(pHolder.Valid_From__c <= validOnFilter && pHolder.Valid_To__c >= validOnFilter)
                {
                    finalPriceHoldersList.add(pHolder);
                    pckcPriceHolder.put(pHolder.PCKC__c,pHolder);
                }
                else if(!pckcPriceHolder.containsKey(pHolder.PCKC__c))
                {
                    inActivePriceHoldersList.add(pHolder);
                }
            }
            validPCKCSet.addAll(pckcPriceHolder.keySet());
            pckcPriceHolder = new Map<String,ERP_Sales_Prices_SAP__c>();
            System.debug('***inActivePriceHoldersList'+inActivePriceHoldersList.size());
            System.debug('***finalPriceHoldersList'+finalPriceHoldersList.size());
            for(ERP_Sales_Prices_SAP__c pHolder : inActivePriceHoldersList)
            {
                if(!validPCKCSet.contains(pHolder.PCKC__c))
                {
                    if(pckcPriceHolder.containsKey(pHolder.PCKC__c))
                    {
                        //present record is future & existing record is expired
                        //BOTH FUTURE : present record's valid from<existing record's valid from
                        //BOTH EXPIRED : present record's valid to > existing record's valid to
                        if((pckcPriceHolder.get(pHolder.PCKC__c).Valid_To__c < System.today() && pHolder.Valid_From__c > System.today())
                           || (pckcPriceHolder.get(pHolder.PCKC__c).Valid_From__c > System.today() && pHolder.Valid_From__c > System.today()
                               && (pHolder.Valid_From__c < pckcPriceHolder.get(pHolder.PCKC__c).Valid_From__c))
                           || (pckcPriceHolder.get(pHolder.PCKC__c).Valid_To__c < System.today() && pHolder.Valid_To__c < System.today()
                               && (pHolder.Valid_To__c > pckcPriceHolder.get(pHolder.PCKC__c).Valid_To__c)))
                        {
                            pcKcPriceHolder.put(pHolder.PCKC__c,pHolder);
                        }
                    }
                    else
                    {
                        pckcPriceHolder.put(pHolder.PCKC__c,pHolder);
                    }
                }
            }
            finalPriceHoldersList.addAll(pckcPriceHolder.values());
            //Retrieving the child records and modifying them according to the latest approved date     
            for(ERP_Sales_Prices_SAP__c erpSAPHolder : finalPriceHoldersList)
            {
                relatedPrices = new List<ERP_Sales_Prices_SAP__c>();
                relatedPrices = holderIdChildRecMap.get(erpSAPHolder.Id);
                //System.debug('*****holderIdChildRecMap.get(erpSAPHolder.Id)'+holderIdChildRecMap.get(erpSAPHolder.Id));
                ERP_Sales_Prices_SAP__c lastValidPrice = new ERP_Sales_Prices_SAP__c();
                for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                {
                    //<PS20150721> For expired prices.
                    if(erpSAP.Valid_To__c == erpSAPHolder.Valid_To__c)
                    {
                        lastValidPrice = erpSAP;
                        //System.debug('****prankysapiD'+erpSAP.Id);
                        break;
                    }
                    else
                        System.debug('***PRANKY'+erpSAP.Valid_To__c+'***'+erpSAPHolder.Valid_To__c+erpSAPHolder.Id);
                }
                boolean gotValidPrice = false;
                if(lastValidPrice.Id == null)
                {
                    for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                    {
                        if(erpSAP.Valid_To__c > erpSAPHolder.Valid_To__c && !erpSAP.markForDeletion__c)
                        {
                            lastValidPrice = erpSAP;
                            gotValidPrice = true;
                            break;
                        }
                    }
                }
                if(gotValidPrice)
                {
                    lastValidPrice.Valid_To__c = erpSAPHolder.Valid_To__c;
                }
                validToList = new List<ERP_Sales_Prices_SAP__c>();
                for(ERP_Sales_Prices_SAP__c otherRec : relatedPrices)
                {
                    if(otherRec.Id != lastValidPrice.Id && otherRec.Approved_Date__c > lastValidPrice.Approved_Date__c
                       && otherRec.Valid_To__c >= lastValidPrice.Valid_From__c && otherRec.Valid_To__c <= lastValidPrice.Valid_To__c
                       && !otherRec.markForDeletion__c)
                    {
                        validToList.add(otherRec);
                    }
                }
                if(validToList.size()>1)
                {
                    validToList=PAUtil.sortList(validToList,'Valid_To__c', 'desc');
                }
                if(validToList.size()!=0)
                {
                    lastValidPrice.Valid_From__c = validToList[0].Valid_To__c + 1 ;       
                }
                finalPriceRecList.add(lastValidPrice);
            }
        }
        
        //checking for the currentPricesLoad value //Expired Prices
        else if(!String.isBlank(request.currentPricesSelection) && request.currentPricesSelection.equalsIgnoreCase('Expired Prices'))
        {
            validOnFilter = System.today();
            finalPriceRecList = new List<SObject>();
            finalPriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            List<String> matCodesList = new List<String>();
            
            for(ERP_Sales_Prices_SAP__c prRec : priceRecordsList)
            {
                if(!holderIdChildRecMap.containskey(prRec.Price_Holder__c))
                {
                    List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
                    l1.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,l1);
                }
                else
                {
                    List<ERP_Sales_Prices_SAP__c> hRecList = holderIdChildRecMap.get(prRec.Price_Holder__c);
                    hRecList.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,hRecList);
                }
                matCodesList.add(prRec.Material_Code__c);
            }
            //<KJ20150519> Added queries to retrieve the prices according to the searched text      
            if(ogi.Enable_Variable_Config_Materials__c)
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND External_ERP_ID__c LIKE :salesOrgDC
                                       AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false AND
                                       RecordTypeId = :Material_RTYPE_Id AND 
                                       ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
            }
            else
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND External_ERP_ID__c LIKE :salesOrgDC
                                       AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false AND
                                       RecordTypeId = :Material_RTYPE_Id limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
            }
            for(Material__c mat : activeMaterialsList)
            {
                activeMatCodesList.add(mat.ERP_Material_Code__c);
            }
            //retrieving price holders for the price records - TODO: last 6 mnths expiry
            //<TJ20140923>
            if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c
                                    AND isPriceHolder__c = true AND Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND ((Valid_From__c <= :validOnFilter AND Customer_Specific__c=false AND
                                                                                                                                     Valid_To__c >= :validOnFilter) OR (Valid_To__c < :validOnFilter)) AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else if(request.pricingRequest.Request_Type__c == 'Massive')
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c
                                    AND isPriceHolder__c = true AND Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND ((Valid_From__c <= :validOnFilter AND Customer_Specific__c=true AND
                                                                                                                                     Valid_To__c >= :validOnFilter) OR (Valid_To__c < :validOnFilter)) AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                    (Sold_To_Code__c = :request.customer.paERPCustomer.Customer_code__c OR ShipTo_Code__c IN :shipToCodesList) AND isPriceHolder__c = true AND
                                    Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND ((Valid_From__c <= :validOnFilter AND
                                                                                                     Valid_To__c >= :validOnFilter) OR (Valid_To__c < :validOnFilter)) AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            List<ERP_Sales_Prices_SAP__c> expiredPriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            Map<String,ERP_Sales_Prices_SAP__c> pckcPriceHolder = new Map<String,ERP_Sales_Prices_SAP__c>();
            Set<String> validPCKCSet = new Set<String>();
            for(ERP_Sales_Prices_SAP__c pHolder : priceHoldersList)
            {
                if(pHolder.Valid_From__c <= validOnFilter && pHolder.Valid_To__c >= validOnFilter)
                {
                    pckcPriceHolder.put(pHolder.PCKC__c,pHolder);
                }
                else if(!pckcPriceHolder.containsKey(pHolder.PCKC__c) && pHolder.Valid_To__c < validOnFilter)
                {
                    expiredPriceHoldersList.add(pHolder);
                }
            }
            validPCKCSet.addAll(pckcPriceHolder.keySet());
            pckcPriceHolder = new Map<String,ERP_Sales_Prices_SAP__c>();
            system.debug(logginglevel.error,'*******expiredpriceholderlistsize'+expiredPriceHoldersList.size());
            for(ERP_Sales_Prices_SAP__c pHolder : expiredPriceHoldersList)
            {
                if(!validPCKCSet.contains(pHolder.PCKC__c))
                {
                    if(pckcPriceHolder.containsKey(pHolder.PCKC__c))
                    {
                        //BOTH EXPIRED : present record's valid to > existing record's valid to
                        if((pckcPriceHolder.get(pHolder.PCKC__c).Valid_To__c < System.today()) && (pHolder.Valid_To__c < System.today())
                           && (pHolder.Valid_To__c > pckcPriceHolder.get(pHolder.PCKC__c).Valid_To__c))
                        {
                            pcKcPriceHolder.put(pHolder.PCKC__c,pHolder);
                        }
                    }
                    else
                    {
                        pckcPriceHolder.put(pHolder.PCKC__c,pHolder);
                    }
                }
            }
            finalPriceHoldersList.addAll(pckcPriceHolder.values());
            //Retrieving the child records and modifying them according to the latest approved date     
            system.debug(logginglevel.error,'*******finalPriceHoldersListsize'+finalPriceHoldersList.size());
            for(ERP_Sales_Prices_SAP__c erpSAPHolder : finalPriceHoldersList)
            {
                relatedPrices = new List<ERP_Sales_Prices_SAP__c>();
                relatedPrices = holderIdChildRecMap.get(erpSAPHolder.Id);
                System.debug('*****holderIdChildRecMap.get(erpSAPHolder.Id)'+holderIdChildRecMap.get(erpSAPHolder.Id));
                ERP_Sales_Prices_SAP__c lastValidPrice = new ERP_Sales_Prices_SAP__c();
                for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                {
                    if(erpSAP.Valid_To__c == erpSAPHolder.Valid_To__c)
                    {
                        lastValidPrice = erpSAP;
                        break;
                    }
                }
                boolean gotValidPrice = false;
                if(lastValidPrice.Id == null)
                {
                    for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                    {
                        if(erpSAP.Valid_To__c > erpSAPHolder.Valid_To__c && !erpSAP.markForDeletion__c)
                        {
                            lastValidPrice = erpSAP;
                            gotValidPrice = true;
                            break;
                        }
                    }
                }
                if(gotValidPrice)
                {
                    lastValidPrice.Valid_To__c = erpSAPHolder.Valid_To__c;
                }
                validToList = new List<ERP_Sales_Prices_SAP__c>();
                for(ERP_Sales_Prices_SAP__c otherRec : relatedPrices)
                {
                    if(otherRec.Id != lastValidPrice.Id && otherRec.Approved_Date__c > lastValidPrice.Approved_Date__c
                       && otherRec.Valid_To__c >= lastValidPrice.Valid_From__c && otherRec.Valid_To__c <= lastValidPrice.Valid_To__c
                       && !otherRec.markForDeletion__c)
                    {
                        validToList.add(otherRec);
                    }
                }
                if(validToList.size()>1)
                {
                    validToList=PAUtil.sortList(validToList,'Valid_To__c', 'desc');
                }
                if(validToList.size()!=0)
                {
                    lastValidPrice.Valid_From__c = validToList[0].Valid_To__c + 1 ;       
                }
                finalPriceRecList.add(lastValidPrice);
            }
        }
        //checking for the currentPricesLoad value //Expiring in 30/60/90 days & Expiring By
        else if(!String.isBlank(request.currentPricesSelection) && request.currentPricesSelection.containsIgnoreCase('Expiring'))
        {
            validOnFilter = request.validOnDateViewCustomerprices;
            if(request.currentPricesSelection.containsIgnoreCase('By') && validOnFilter == null)
            {
                throw new PAException(System.Label.Expiring_By_Mandatory_Error,ApexPages.Severity.ERROR);  
            }
            if(request.currentPricesSelection.containsIgnoreCase('By') && validOnFilter < System.today())
            {
                throw new PAException('Please select present or future date',ApexPages.Severity.ERROR);  
            }
            Date todayDate = System.today();
            
            finalPriceRecList = new List<SObject>();
            finalPriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            List<String> matCodesList = new List<String>();
            
            for(ERP_Sales_Prices_SAP__c prRec : priceRecordsList)
            {
                if(!holderIdChildRecMap.containskey(prRec.Price_Holder__c))
                {
                    List<ERP_Sales_Prices_SAP__c> l1=new List<ERP_Sales_Prices_SAP__c>();
                    l1.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,l1);
                }
                else
                {
                    List<ERP_Sales_Prices_SAP__c> hRecList = holderIdChildRecMap.get(prRec.Price_Holder__c);
                    hRecList.add(prRec);
                    holderIdChildRecMap.put(prRec.Price_Holder__c,hRecList);
                }
                matCodesList.add(prRec.Material_Code__c);
            }
            //<KJ20150519> Added queries to retrieve the prices according to the searched text      
            if(ogi.Enable_Variable_Config_Materials__c)
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND External_ERP_ID__c LIKE :salesOrgDC
                                       AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false AND
                                       RecordTypeId = :Material_RTYPE_Id AND 
                                       ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
            }
            else
            {
                activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN :matCodesList AND External_ERP_ID__c LIKE :salesOrgDC
                                       AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false AND
                                       RecordTypeId = :Material_RTYPE_Id limit 50000];
                if(searchedMaterial!=null && searchedMaterial!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE name  LIKE :shMaterial AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
                if(searchedItem!=null && searchedItem!=''){
                    activeMaterialsList = [SELECT Id,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c LIKE :shItem AND
                                           External_ERP_ID__c LIKE :salesOrgDC AND External_ERP_ID__c LIKE :sapCluster AND ERP_Deletion_Flag__c = false
                                           AND RecordTypeId = :Material_RTYPE_Id AND 
                                           ERP_Material_General_Data__r.ERP_IsConfigurable__c = :ogi.Enable_Variable_Config_Materials__c limit 50000];
                }
            }
            for(Material__c mat : activeMaterialsList)
            {
                activeMatCodesList.add(mat.ERP_Material_Code__c);
            }
            //retrieving price holders for the price records
            //<TJ20140923>
            if(request.pricingRequest.Request_Type__c == 'Non Customer Specific')
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND Customer_Specific__c=false AND
                                    isPriceHolder__c = true AND Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND ((Valid_From__c <= :todayDate AND
                                                                                                                                 Valid_To__c >= :todayDate) OR (Valid_From__c > :todayDate)) AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else if(request.pricingRequest.Request_Type__c == 'Massive')
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.pricingRequest.Sales_Org_Code__c AND
                                    isPriceHolder__c = true AND Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND ((Valid_From__c <= :todayDate AND Customer_Specific__c=true AND
                                                                                                                                 Valid_To__c >= :todayDate) OR (Valid_From__c > :todayDate)) AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            else
                priceHoldersList = [SELECT Id, Valid_From__c, Valid_To__c, PCKC__c,Pricing_Request__c,Pricing_Request__r.Name FROM ERP_Sales_Prices_SAP__c WHERE
                                    Id IN :holderIdChildRecMap.keySet() AND Sales_Org_Code__c=:request.customer.paERPCustomer.Sales_Org_Code__c AND
                                    (Sold_To_Code__c = :request.customer.paERPCustomer.Customer_code__c OR ShipTo_Code__c IN :shipToCodesList) AND isPriceHolder__c = true AND
                                    Sales_Pricing_Procedure__c = :ogi.ERP_Pricing_Procedure__c AND ((Valid_From__c <= :todayDate AND
                                                                                                     Valid_To__c >= :todayDate) OR (Valid_From__c > :todayDate)) AND ((Material_Code__c != null AND Material_Code__c IN :activeMatCodesList) OR (Material_Code__c = null)) limit 50000];
            List<ERP_Sales_Prices_SAP__c> futurePriceHoldersList = new List<ERP_Sales_Prices_SAP__c>();
            Map<String,ERP_Sales_Prices_SAP__c> pckcPriceHolder = new Map<String,ERP_Sales_Prices_SAP__c>();
            Integer noOfDays;
            if(request.currentPricesSelection.containsIgnoreCase('30'))
            {
                noOfDays = 30;
            }
            else if(request.currentPricesSelection.containsIgnoreCase('60'))
            {
                noOfDays = 60;
            }
            else if(request.currentPricesSelection.containsIgnoreCase('90'))
            {
                noOfDays = 90;
            }
            else if(request.currentPricesSelection.containsIgnoreCase('By') && validOnFilter != null)
            {
                noOfDays = todayDate.daysBetween(validOnFilter);
            }
            //System.debug('***noOfDays'+noOfDays+' '+(todayDate + noOfDays));
            Set<String> validPCKCSet = new Set<String>();
            for(ERP_Sales_Prices_SAP__c pHolder : priceHoldersList)
            {//System.debug('***noOfDays'+noOfDays+' '+pHolder.Valid_To__c+' '+(todayDate + noOfDays));
                
                if(pHolder.Valid_To__c <= (todayDate + noOfDays))
                {                    
                    if(pHolder.Valid_From__c <= todayDate && pHolder.Valid_To__c >= todayDate)
                    {
                        finalPriceHoldersList.add(pHolder);
                        pckcPriceHolder.put(pHolder.PCKC__c,pHolder);
                    }
                    else if(!pckcPriceHolder.containsKey(pHolder.PCKC__c) && pHolder.Valid_From__c > todayDate)
                    {
                        futurePriceHoldersList.add(pHolder);
                    }
                }
            }
            validPCKCSet.addAll(pckcPriceHolder.keySet());
            for(ERP_Sales_Prices_SAP__c pHolder : futurePriceHoldersList)
            {
                if(!validPCKCSet.contains(pHolder.PCKC__c) && pHolder.Valid_From__c > todayDate)
                {
                    finalPriceHoldersList.add(pHolder);
                }
            }
            //Retrieving the child records and modifying them according to the latest approved date     
            for(ERP_Sales_Prices_SAP__c erpSAPHolder : finalPriceHoldersList)
            {
                relatedPrices = new List<ERP_Sales_Prices_SAP__c>();
                relatedPrices = holderIdChildRecMap.get(erpSAPHolder.Id);
                System.debug('*****holderIdChildRecMap.get(erpSAPHolder.Id)'+holderIdChildRecMap.get(erpSAPHolder.Id));
                ERP_Sales_Prices_SAP__c lastValidPrice = new ERP_Sales_Prices_SAP__c();
                for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                {
                    if(erpSAP.Valid_To__c == erpSAPHolder.Valid_To__c)
                    {
                        lastValidPrice = erpSAP;
                        break;
                    }
                }
                boolean gotValidPrice = false;
                if(lastValidPrice.Id == null)
                {
                    for(ERP_Sales_Prices_SAP__c erpSAP : relatedPrices)
                    {
                        if(erpSAP.Valid_To__c > erpSAPHolder.Valid_To__c && !erpSAP.markForDeletion__c)
                        {
                            lastValidPrice = erpSAP;
                            gotValidPrice = true;
                            break;
                        }
                    }
                }
                if(gotValidPrice)
                {
                    lastValidPrice.Valid_To__c = erpSAPHolder.Valid_To__c;
                }
                validToList = new List<ERP_Sales_Prices_SAP__c>();
                for(ERP_Sales_Prices_SAP__c otherRec : relatedPrices)
                {
                    if(otherRec.Id != lastValidPrice.Id && otherRec.Approved_Date__c > lastValidPrice.Approved_Date__c
                       && otherRec.Valid_To__c >= lastValidPrice.Valid_From__c && otherRec.Valid_To__c <= lastValidPrice.Valid_To__c
                       && !otherRec.markForDeletion__c)
                    {
                        validToList.add(otherRec);
                    }
                }
                if(validToList.size()>1)
                {
                    validToList=PAUtil.sortList(validToList,'Valid_To__c', 'desc');
                }
                if(validToList.size()!=0)
                {
                    lastValidPrice.Valid_From__c = validToList[0].Valid_To__c + 1 ;       
                }
                finalPriceRecList.add(lastValidPrice);
            }
        }
        if(finalPriceRecList == null)
            finalPriceRecList = new List<SObject>();        
        return finalPriceRecList;
    }
    
    public List<String> kfPop(List<String> splitKCListFinal)
    {
        mapkcField = new map<string, List<String>>();
        for (KeyFieldLabelAPIName__c kc : KeyFieldLabelAPIName__c.getAll().values())
        {     
             //System.debug('KeyFieldLabelAPIName'+KeyFieldLabelAPIName__c.getAll().values());
            //<START> <AJ201602222> <IS ID-00065760> Added string "keyfield" with populating value in upper case to remove system case sensitive Issue.
            string keyfield = kc.keyField__c.touppercase();
            //System.debug('pricingReqItemList-KC keyfld Uppercase' +keyfield);
            if(!mapkcField.containsKey(keyField))
            {
                mapkcField.put(keyField,new List<String>{kc.apiName__c});
                //System.debug('pricingReqItemList-KC map values' +mapkcField);
            }
            else
            {
                List<String>kcs = mapkcField.get(keyField);
                kcs.add(kc.apiName__c);
                mapkcField.put(keyField,kcs);
                //System.debug('pricingReqItemList-KC map values else' +mapkcField);
            }
            //<END> <AJ201602222>
        }
        List<String> kf=new List<String>();
        for(integer indx=0;indx<splitKCListFinal.size();indx++)
        {
            // <START> <AJ20160222> <IS ID-00065760> Added touppercase with "splitKCListFinal[indx]" to remove system case sensitive Issue.
            if(mapkcField.get(splitKCListFinal[indx].touppercase())!=null)
            {
                kf.addAll(mapkcField.get(splitKCListFinal[indx].touppercase()));
                //System.debug('pricingReqItemList-KC KF values' +kf);
            }
            // <END> <AJ20160222>
        }
        return kf;
    }
}