/*
 * Name         :   PAService
 * Description  :   This class holds the service state variables of the application
 * Author       :   Infosys Limited
 * Created Date :   16-01-2013
 * Version      Modified Date   Modified By             Modification                                            Dependencies
 *  1.1                         Anand           Initialized project when Request Is Initialized                     None      
 *  1.2                         Utkarsh         Added condition for the case when Id is passeed in url      ctrlPAMain, PARequestItems
 *  1.3                         Prachi          Added 'if' condition                                            PARequestItems
 *  1.4         02-07-13          Shiva                Fix for issue407
 --------------------------------------------------------------------------------------------------------------------------------------------
 ***********************************************Modification Log************************************************
 <PP20130424>
 Last Modified By   :   Priyanka Pillala
 Last Modified Date :   24 Apr 2013
 Description        :   Added code so that currentRequestItem becomes null on click of Cancel of 'New Price' and
                        on click of 'Add Prices' at PC KC Level on Pricing Request page -- APAC ROLLOUT1(1.4)
 ***********************************************Modification Log************************************************
 <PP20130619>
 Last Modified By   :   Priyanka Pillala
 Last Modified Date :   19 Jun 2013
 Description        :   Added code to clear Request Item from Service State on click of Edit Header of Project
                         -- APAC ROLLOUT1(1.5)
 ******************************************************************************************************************
 <TJ20140505>
Last Modified By    :   Tarun
Last Modified Date  :   05 May 2014
Description         :   Resetting data to first load except for the selected business when landing page link is clicked 
 ******************************************************************************************************************
<HL20140908>
Last Modified By    :   Hema Latha
Last Modified Date  :   08 Sep 2014
Description         :   Added code to redirect to Product hierarchy from PHcreation page. 

 *****************************************************************************************************************
<PR20140926>
Last Modified By    :   Priyanka R
Last Modified Date  :   26 Sep 2014
Description         :   Added check for null conditions at lines 182 and 320.
 **********************************************************************************************************************
<PP20141022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2014
Description         :   Hide Matching records on change of PC-KC in Non customer specific - Issue # 128

**********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic to include Sales Order Item and Sales Order Item Code values- CRM-2022-07-0225
 
 <SS20230501>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   1 May 2023
 Description        :   Added logic to include M&M P80 fields
 *****************************************************************************************************************/ 
public class PAService
{
    public PAServiceState paServiceState{get;set;}//changing  on jan18
    public IPAServiceComponent component{get;set;}//changing
    public string name{get;set;}//TODO: Delete this  - priyanka
    public static final String NAME_BU='OrganizationalGroupItem';
    public static final String NAME_CUSTOMER='ERPCustomer';
    public static final String NAME_REQUESTS='Requests';
    public static final String NAME_REQUESTITEMS='RequestItems'; 
    public static final String NAME_PH='PH';
    public static final String NAME_ProductHierarchy='ProductHierarchy';// <HL20140908> Added by Hema
    public static final String NAME_FRB='FRB';
    public static final String NAME_PRICING_CONDITION='PricingConditions'; 
    public static final String NAME_KEY_COMBINATION = 'KeyCombinations';
    public static final String NAME_SALESPRICESAP='SalesPriceSAP';
    public static final String NAME_PROJECT='ProjectPrice';
    public static final String NAME_APPROVALSETUP='ApprovalSetup';
    public static final String NAME_NETPRICEDETAIL='NetPriceDetail'; //for NPC new requirement
    public static final String NAME_RPQREPORTING='RPQReporting'; 
    //String which sets error message from component on the page
    public List<String> componentErrorMessage {get;set;} //TODO: Delete this  - priyanka
    public PAService()
    {
        paServiceState= new PAServiceState(); 
        componentErrorMessage = new List<String>();
        componentErrorMessage.add('helo112');
    } 
    public IPAServiceComponent getBusinessComponent(String action, string name)
    {
        System.debug('In Service getBusinessComponent Method Action:'+action + ' Name:' + name +action);
        system.debug('\n\n\n id '+ApexPages.currentPage().getParameters().get('id'));
        if(name==NAME_RPQREPORTING){


        }
        if(name==NAME_BU)
        {
            if(paServiceState.ogItems == null)
            { 
                paServiceState.ogItems = new PAOrganizationalGroupItems();
            }
            //<TJ20140505> Resetting data to first load except for the selected business when landing page link is clicked
            if(action == 'landingpage' || ('abandonImport').equalsIgnoreCase(action) || ('Abandon').equalsIgnoreCase(action))
            {
                paServiceState.ogItems.selectedUser= null;
                paServiceState.ogItems.userName = null;
                paServiceState.ogItems.paOrgGrp = null;
                paServiceState.ogItems.value = null;
                paServiceState.ogItems.isViewCustomerPrices = null;
                paServiceState.ogItems.isViewPLPrices = null;
                paServiceState.erpCustomer = null;
                //to delete view state data
                pautil.deleteViewState(paServiceState.currentrequest);
                paServiceState.currentrequest = null;
                paServiceState.currentRequestItem = null;
                paServiceState.approvalSetup = null;
                paServiceState.productHierarchy = null;
                paServiceState.currentProjectPrice = null;
                paServiceState.currentNPCRequest = null;
                paServiceState.rpqReporting = null;
                paServiceState.ogItems.selectedRecordId = null;
                paServiceState.ogItems.errorMessageDisp = null;
                paServiceState.ogItems.isEndUserRebate = false;
                system.debug('***ogi: '+paServiceState.ogItems.selectedBU);
            }
            if(action!= null && action.equalsIgnoreCase('RPQReporting')){
                if(paServiceState.rpqReporting == null)
                {
                    paServiceState.rpqReporting = new RPQReportHandler(paServiceState);
                    paServiceState.rpqReporting.loadState();
                }
                system.debug('inside RPQReports action');
                component = paServiceState.rpqReporting;
            }
            if(action!=null && action.equalsIgnoreCase('exportRPQ')){
                system.debug('inside exportRPQ method');
                paServiceState.rpqReporting.ExportData();
            }
            if(action!= null && action.containsIgnoreCase('BUSetup'))
            {
                if(paServiceState.productHierarchy == null)
                {

                    paServiceState.productHierarchy = new PAProductHierarchy(paServiceState);

                }
                component = paServiceState.productHierarchy;
            }

            // <HL20140908> -- Start -- added if condition

            else if(action!= null && action.containsIgnoreCase('BUSetupAddNewPH')) 
            {
                System.debug('In paServiceState.productHierarchy:' +paServiceState.productHierarchy);
                if(paServiceState.productHierarchy == null)
                {
                    paServiceState.productHierarchy = new PAProductHierarchy(paServiceState);
                }
                component = paServiceState.productHierarchy;
                System.debug('In if condition of PH Component:' +component);
            }
            // <HL20140908> -- End -- added if condition
            else
            {
                component = paServiceState.ogItems;
            }
            // Shiva - For Issue 407 Start Ver 1.4
            if(action == 'Quit' && ApexPages.currentPage().getParameters().get('id')!= null)
            {
                //to delete view state data
                pautil.deleteViewState(paServiceState.currentRequest);
                paServiceState.currentRequest = null;
                paServiceState.erpCustomer = null;
                paServiceState.currentRequestItem = null;
                paServiceState.currentProjectPrice = null;
            }
            // Shiva - For Issue 407 End
            return component;
        }
        // <HL20140908> -- Start -- added if condition
        /*else if(name==NAME_ProductHierarchy)
        {
            System.debug('In if condition of PH Method Action:'+action + ' Name:' + name +action);
        if(paServiceState.productHierarchy == null)
                {

                paServiceState.productHierarchy = new PAProductHierarchy(paServiceState);

                }
        //else if(action!= null && action.containsIgnoreCase('Save'))
            //{             
                //paservicestate.productHierarchy.valuePH = 'save';
                //paservicestate.productHierarchy.action();
            //}
            component = paServiceState.productHierarchy;
            System.debug('In if condition of PH Component:' +component);
        }*/
        // <HL20140908> -- end of if condition  
        else if(name==NAME_CUSTOMER)
        {
            if(paServiceState.erpCustomer == null)
            {
                paServiceState.erpCustomer = new PAERPCustomer(paServiceState);
            }       
            //<PP20140425> START
            //<TJ20140923>
            if(action.equalsIgnoreCase('onBehalfOf') || action.equalsIgnoreCase('PCL') || action.equalsIgnoreCase('massiveOnBehalfOf'))
            {
                paServiceState.erpCustomer.getAllSRList();
                if(paServiceState.currentRequest != null)
                {
                    //to delete view state data
                    pautil.deleteViewState(paServiceState.currentRequest);
                    paServiceState.currentRequest = null;
                }
            }
            else if(action.equalsIgnoreCase('customerList') || action.equalsIgnoreCase('ViewAllCustomerPrices') || action.equalsIgnoreCase('PCL') ||(paServicestate.currentrequest != null && paServiceState.currentRequest.pricingRequest.Request_Type__c == 'Massive'))
            {
                paServiceState.erpCustomer.getAllSoldToList();
                if(paServiceState.currentRequest != null && paServiceState.currentRequest.pricingRequest.Request_Type__c != 'Massive')
                {
                    //to delete view state data
                    pautil.deleteViewState(paServiceState.currentRequest);
                    paServiceState.currentRequest = null;
                }
            }
            else if(action!=null && action.equalsIgnoreCase('CancelFromEndUserSelBack')){
                paServiceState.erpCustomer.getAllSoldToList();
                if(paServiceState.currentRequest != null && paServiceState.currentRequest.pricingRequest.Request_Type__c != 'Massive')
                {
                    //to delete view state data
                    pautil.deleteViewState(paServiceState.currentRequest);
                    paServiceState.currentRequest = null;
                }
            }
            else if(action!=null && action.equalsIgnoreCase('CancelBack') && paServiceState.ogitems.isEndUserRebate){
                paServiceState.erpCustomer.getAllSRList();
                if(paServiceState.currentRequest != null && paServiceState.currentRequest.pricingRequest.Request_Type__c != 'Massive')
                {
                    //to delete view state data
                    pautil.deleteViewState(paServiceState.currentRequest);
                    paServiceState.currentRequest = null;
                }
            }

            //<PP20140425> END 

            component = paServiceState.erpCustomer;
            return paServiceState.erpCustomer;
        }
        else if(name==NAME_REQUESTS)
        {
            system.debug('inside NAME_REQUESTS - PAService classm action is '+action);
            system.debug('paServiceState.erpCustomer is'+paServiceState.erpCustomer);
            if(action.equalsIgnoreCase('RPQEndUserSelected'))
            {
                paServiceState.ogItems.rebateQuotesCheck(paServiceState.erpCustomer.customerCode,PAServicestate.currentRequest.endUserFilter);
                if(paServiceState.ogItems.rebatesExists){
                    //action = 'RequestOverview';
                }
                else{
                    //  action = 'currentPricesCustomer PriceNewPricingRequest';
                    paServiceState.ogitems.value='CustRequestReasons';
                }

            }
            //IM20150113
            if(action!=null && action.containsIgnoreCase('CheckRequests'))
            {
                //if(PAServicestate.currentRequest.endUserFilter!=null)
                //paServiceState.ogItems.rebateQuotesCheck(paServiceState.erpCustomer.customerCode,PAServicestate.currentRequest.endUserFilter);
            }
            if(action!=null && action.equals('Massive'))
            {
                paServiceState.ogItems.value='Massive';             
                if(paServiceState.currentRequest==null || paServiceState.currentRequest.pricingRequest.Sales_Org_Code__c==null)
                    paServiceState.ogItems.salesAreaCheck();
            }
            if(paServiceState.erpCustomer != null && paServicestate.currentrequest != null)
                System.debug('**** test pranky'+paServiceState.erpCustomer.currentPrices+'**'+paServicestate.currentrequest+'**'+paServicestate.currentrequest.csvString);
            if(action != null && (action.equalsIgnoreCase('Abandon') || action.equalsIgnoreCase('Quit') || action.equalsIgnoreCase('quitImport')
                    || action.equalsIgnoreCase('abandonImport') || (paServiceState.erpCustomer != null && paServiceState.erpCustomer.currentPrices != null
                    && paServiceState.erpCustomer.currentPrices.containsIgnoreCase('ExpOnly') && !action.equalsIgnoreCase('pcKCSelChange')
                    && !action.containsIgnoreCase('cpSelChange'))) && paServiceState.currentRequest != null && paServiceState.currentRequest.ncsPCKC!=true)
            {
                //to delete view state data
                pautil.deleteViewState(paServiceState.currentrequest);
                paServiceState.currentRequest=null;
                paServiceState.currentRequestItem=null;
                PAServiceState.currentProjectPrice=null;
                //<PP20141029> START - Added for SIT Wave-2 Issue #50
                if(action.equalsIgnoreCase('abandonImport') || action.equalsIgnoreCase('Abandon'))
                {                   
                    paServiceState.ogItems.selectedUser= null;
                    paServiceState.ogItems.userName = null;
                    paServiceState.ogItems.paOrgGrp = null;
                    paServiceState.ogItems.value = null;
                    paServiceState.ogItems.isViewCustomerPrices = null;
                    paServiceState.ogItems.isViewPLPrices = null;
                    paServiceState.erpCustomer = null;
                    //to delete view state data
                    pautil.deleteViewState(paServiceState.currentrequest);
                    paServiceState.currentrequest = null;
                    paServiceState.currentRequestItem = null;
                    paServiceState.approvalSetup = null;
                    paServiceState.productHierarchy = null;
                    paServiceState.currentProjectPrice = null;
                    paServiceState.currentNPCRequest = null;
                    paServiceState.ogItems.selectedRecordId = null;
                    paServiceState.ogItems.errorMessageDisp = null;
                }
                //<PP20141029> END
            }

            if(action != null && (action.equalsIgnoreCase('AddPrices'))){
                paServiceState.currentRequest.pricingCondition= new PAPricingCondition(paServiceState);

            }
            //<PP20130424> -- Ver 1.4  START
            //<MS20141019>
            if(action != null && (action.equalsIgnoreCase('AddPrices') || action.equalsIgnoreCase('AddPricesNCS')
                    ||action.equalsIgnoreCase('EditHeader') || action.containsIgnoreCase('AddPricesPCKC') || action.equalsIgnoreCase('AddPricesReqCreated') || (paServiceState.currentRequest != null && action.equalsIgnoreCase('NonCustomerSpecific')) || (paServiceState.currentRequest != null && action.equalsIgnoreCase('Massive'))))
            {
                System.debug('*****IN ADD PRICES');
                //<TJ20140903>
                if(!action.equalsIgnoreCase('Massive') || (action.equalsIgnoreCase('Massive') && !paServiceState.ogItems.salesAreaCheck()))
                    paServiceState.currentRequest.keyCombination.pcKCOptionsList = paServiceState.currentRequest.keyCombination.getListPcKc();
                //<TJ20140923>
                if(action.equalsIgnoreCase('NonCustomerSpecific'))
                {
                    paServicestate.currentRequest.salesPriceSAP.pcKCConcatList = paServiceState.currentRequest.keyCombination.getListPcKc();
                    system.debug(paServicestate.currentRequest.salesPriceSAP.pcKCConcatList+' '+paServicestate.currentRequest.salesPriceSAP.pcKCSelected);
                }
                paServiceState.currentRequestItem=null;             
                paServiceState.currentRequest.soldToFilter = null;
                paServiceState.currentRequest.materialFilter = null;
                paServiceState.currentRequest.phFilter = null;
                paServiceState.currentRequest.profitCenterFilter = null;
                paServiceState.currentRequest.cpgFilter = null;
                paServiceState.currentRequest.priceListTypeFilter = null;
                paServiceState.currentRequest.discRefFilter = null;
                paServiceState.currentRequest.mpgFilter = null;
                paServiceState.currentRequest.paymentTermsFilter = null;
                paServiceState.currentRequest.salesOfficeFilter = null;
                paServiceState.currentRequest.salesDistrictFilter = null;
                paServiceState.currentRequest.shipToFilter = null;
                paServiceState.currentRequest.priceRefPartnerFilter = null;
                paServiceState.currentRequest.endUseFilter = null;
                paServiceState.currentRequest.marketSegmentFilter = null;
                paServiceState.currentRequest.endUserFilter = null;
                paServiceState.currentRequest.countryFilter = null;
                paServiceState.currentRequest.customerHierarchyFilter = null;
                paServiceState.currentRequest.incotermsFilter = null;
                paServiceState.currentRequest.shipToCountryFilter = null;
                paServiceState.currentRequest.variantFilter = null;
                paServiceState.currentRequest.contractFilter = null;
                paServiceState.currentRequest.ComPartnerFilter = null;
                paServiceState.currentRequest.MaterialGroup5KeyFilter = null;
                paServiceState.currentRequest.PlantFilter = null;
                paServiceState.currentRequest.ShippingConditionFilter = null;
                paServiceState.currentRequest.DestinationCountryFilter = null;
                paServiceState.currentRequest.salesOrderTypeFilter = null;
                paServiceState.currentRequest.salesOrderItemFilter = null; //<SS20220826>
                //<SS20230501>
                paServiceState.currentRequest.valueCenterFilter = null;
                paServiceState.currentRequest.extMaterialGroupFilter = null;
                paServiceState.currentRequest.materialGroup2Filter = null;
                paServiceState.currentRequest.prizeZoneFilter = null;
                //<MS20141114>
                paServiceState.currentRequest.projectFilter = null;         
                paServiceState.currentRequest.kcodeFilter = null;   
                paServiceState.currentRequest.materialGroup1Filter = null;
                paServiceState.currentRequest.payerFilter = null;
                paServiceState.currentRequest.partnerZFFilter = null;
                paServiceState.currentRequest.discRefNoFilter = null;
                paServiceState.currentRequest.fixValDateFilter = null;
                paServiceState.currentRequest.campaignFilter = null;
                paServiceState.currentRequest.documentCurrencyFilter = null;
                paServiceState.currentRequest.stateFilter = null;
                paServiceState.currentRequest.pricingRequest.Due_Date__c = system.today();
            }          
            if(action != null && action.equalsIgnoreCase('Cancel') && paServiceState.currentRequestItem != null
                    &&paServiceState.currentRequestItem.pricingReqItem != null && paServiceState.currentRequestItem.pricingReqItem.Id == null)
            {
                paServiceState.currentRequestItem = null;
            }
            //<PP20130424> --Ver 1.4 END
            if(paServiceState.currentRequest == null)
            {   
                paServiceState.currentRequest = new PARequest(paServiceState);
                paServiceState.currentRequest.pricingCondition= new PAPricingCondition(paServiceState); 
                paServiceState.currentRequest.keyCombination=new PAKeyCombination(paServiceState); 
                paServiceState.currentRequest.salesPriceSAP =new PASalesPriceSAP(paServiceState);

                //<PP20140425> START
                if((action.containsIgnoreCase('customerPrices') || action.equalsIgnoreCase('AddPricesReqCreated'))
                        && !action.containsIgnoreCase('PCL') && !action.containsIgnoreCase('Prev')
                        && !String.isBlank(paServiceState.erpCustomer.currentPrices)
                        && (paServiceState.erpCustomer.currentPrices.equalsIgnoreCase('viewPricesOnLoad')
                                || paServiceState.erpCustomer.currentPrices.containsIgnoreCase('ExpOnly')))
                {
                    paServiceState.currentRequest.pricingReqItemList = new List<Pricing_Request_Item__c>();
                    System.debug('pricingReqItemList-KC '+paServiceState.currentRequest.pricingReqItemList);
                    if(!String.isBlank(paServiceState.currentRequest.currentPricesSelection)
                            && (paServiceState.currentRequest.currentPricesSelection.equalsIgnoreCase('Valid On')
                                    || paServiceState.currentRequest.currentPricesSelection.equalsIgnoreCase('Expiring By')))
                    {
                        paServiceState.currentRequest.pricingRequest.Due_Date__c = System.today();
                    }
                    if(String.isBlank(paServiceState.currentRequest.currentPricesSelection))
                    {
                        paServiceState.currentRequest.currentPricesSelection = 'Last Valid Prices';
                    }
                    paServiceState.currentRequest.salesPriceSAP.pcKCConcatList = new List<SelectOption>();
                    paServiceState.currentRequest.action('','','ViewCustomerPrices');
                }
                //<PP20140425> END
                //<TJ20140923>
                if(action.equalsIgnoreCase('NonCustomerSpecific'))
                {                   
                    paServiceState.currentRequest.pricingRequest.Request_Type__c = 'Non Customer Specific';
                    paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Permanent';
                    //<PP20141022>
                    paServiceState.currentRequest.pricingReqItemList = new List<Pricing_Request_Item__c>();
                    System.debug('pricingReqItemList-KC '+ paServiceState.currentRequest.pricingReqItemList);
                    paServiceState.currentRequest.relatedWrappersList=paServiceState.currentRequest.getListWrappers();
                    paServiceState.currentRequest.salesPriceSAP.pcKCConcatList = new List<SelectOption>();
                    if(paServiceState.currentRequest.dispNCS=='dispNCS')
                    {
                        paServiceState.currentRequest.salesPriceSAP.pcKCSelected = paServiceState.currentRequest.keyCombination.pckcconcat;
                    }

                    getBusinessComponent(action,name);
                }
                if(action.equalsIgnoreCase('Massive'))
                {                   
                    paServiceState.currentRequest.pricingRequest.Request_Type__c = 'Massive';
                    paServiceState.currentRequest.pricingRequest.Customer_Specific__c = true;
                    paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c = 'Permanent';
                    paServiceState.currentRequest.relatedWrappersList=paServiceState.currentRequest.getListWrappers();                  
                    paServiceState.currentRequest.salesPriceSAP.pcKCConcatList = new List<SelectOption>();                  
                    getBusinessComponent(action,name);
                    system.debug(paServiceState.currentRequest.pricingRequest.on_behalf_of__c);
                }
                //Ver 1.1 - Start
                if(paServiceState.currentProjectPrice==null) 
                {
                    paServiceState.currentProjectPrice = new PAProjectPrice(paServiceState); 
                }
                //Ver 1.1 - End
                component = paServiceState.currentRequest;
                if(action == 'Abandon'){
                    paServiceState.currentRequest.relatedWrappersList = paServiceState.currentRequest.getListWrappers();
                    if(paServiceState.ogItems.value!=null && paServiceState.ogItems.value=='NonCustomerSpecific'){
                        if(paServiceState.ogItems.orgGroupItems != null){
                            paServiceState.currentRequest.pricingRequest.Sales_Org_Code__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Sales_Org_Code__c;
                            paServiceState.currentRequest.pricingRequest.Sales_Org__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Sales_Org__c;
                            paServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Distribution_Channel_Code__c;
                            paServiceState.currentRequest.pricingRequest.Dist_Channel__c= paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Distribution_Channel__c;
                            paServiceState.currentRequest.pricingRequest.Division_Code__c= paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Division_Code__c;
                            paServiceState.currentRequest.pricingRequest.Division__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Division__c;
                        }
                        paServiceState.currentRequest.pricingRequest.Request_Type__c = 'Non Customer Specific';
                    }
                }   
            }
            //<PP20140425> START
            if(action != null && ((action.equalsIgnoreCase('AddPricesReqCreated') && !String.isBlank(paServiceState.erpCustomer.currentPrices)
                    && (paServiceState.erpCustomer.currentPrices.equalsIgnoreCase('viewPricesOnLoad')))
                    || (action.equalsIgnoreCase('cpSelChange'))))
            {
                System.debug('****PRIYANKA-cpsel'+paServiceState.currentRequest.currentPricesSelection);
                paServiceState.currentRequest.pricingReqItemList = new List<Pricing_Request_Item__c>();
                System.debug('pricingReqItemList-KC '+paServiceState.currentRequest.pricingReqItemList);
                if(!String.isBlank(paServiceState.currentRequest.currentPricesSelection)
                        && (paServiceState.currentRequest.currentPricesSelection.equalsIgnoreCase('Valid On')
                                || paServiceState.currentRequest.currentPricesSelection.equalsIgnoreCase('Expiring By')))
                {
                    paServiceState.currentRequest.pricingRequest.Due_Date__c = System.today();
                }
                if(String.isBlank(paServiceState.currentRequest.currentPricesSelection))
                {
                    paServiceState.currentRequest.currentPricesSelection = 'Last Valid Prices';
                }
                paServiceState.currentRequest.salesPriceSAP.pcKCConcatList = new List<SelectOption>();
                paServiceState.currentRequest.action('','','ViewCustomerPrices');
            }
            //<PP20140425> END
            if(action=='exportCSV')
            {
                PAServiceState.currentRequest.action('PAExportPrices', 'PAExportPrices', action);
            }
            if(action=='PCLGeneration')
            {
                component = paServiceState.currentRequest;
            }
            if(action.equalsIgnoreCase('Quit'))
            {
                PAServiceState.currentRequest.relatedWrappersList = PAServiceState.currentRequest.getListWrappers();
                if(paServiceState.ogItems.value!=null && paServiceState.ogItems.value=='NonCustomerSpecific'){
                    if(paServiceState.ogItems.orgGroupItems != null){
                        paServiceState.currentRequest.pricingRequest.Sales_Org_Code__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Sales_Org_Code__c;
                        paServiceState.currentRequest.pricingRequest.Sales_Org__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Sales_Org__c;
                        paServiceState.currentRequest.pricingRequest.Dist_Channel_Code__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Distribution_Channel_Code__c;
                        paServiceState.currentRequest.pricingRequest.Dist_Channel__c= paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Distribution_Channel__c;
                        paServiceState.currentRequest.pricingRequest.Division_Code__c= paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Division_Code__c;
                        paServiceState.currentRequest.pricingRequest.Division__c = paServiceState.ogItems.orgGroupItems.OrgGroup__r.ERP_Division__c;
                    }
                    paServiceState.currentRequest.pricingRequest.Request_Type__c = 'Non Customer Specific';
                }
            }
            if(action.equalsIgnoreCase('Draft'))
            {
                PAServiceState.currentRequest.relatedWrappersList = PAServiceState.currentRequest.getListWrappers();
            }
            if(action != null && action.equalsIgnoreCase('ExportPrices') && paServiceState.ogItems.showPopup==false)
            {
                paServiceState.currentRequest.pckcfromKeyComb='';
            }


            return paServiceState.currentRequest;
        }
        else if(name==NAME_REQUESTITEMS)
        {
            /*if(paServiceState.currentRequestItem!=null && paServiceState.currentRequestItem.request.pricingRequest!=null && paServiceState.currentRequestItem.pricingRequest!=null){
                            paServiceState.currentRequestItem.request.pricingRequest.Request_Valid_To__c = paServiceState.currentRequestItem.pricingRequest.Request_Valid_To__c;
                            paServiceState.currentRequestItem.request.pricingRequest.Request_Valid_From__c = paServiceState.currentRequestItem.pricingRequest.Request_Valid_From__c;
            }*/
            //<TJ20140925>
            if(action != null && action.ContainsIgnoreCase('soldtoSelect'))
            {
                if(PAServiceState.erpCustomer==null)
                    paServiceState.erpCustomer = new PAERPCustomer(paServiceState);
                paServiceState.erpCustomer.getAllSoldToList();
                if(paServicestate.erpCustomer.customerCode!=null && paServicestate.erpCustomer.customerCode!='')
                {
                    paServiceState.erpCustomer.allCustomersWrapList= new List<PAWrapper>();
                }
            }           
            //<PP20140425>
            if(action != null && action == 'Cancel' && paServiceState.currentRequestItem.priceViewClicked!=true)
            {
                paServiceState.currentRequestItem = null;
                if(ApexPages.currentPage().getParameters().get('id')<>null)
                    ApexPages.currentPage().getParameters().put('id',null);
            }
            //<MS20140926> Adding task save and continue functionality
            if(action!=null && (action.equalsIgnoreCase('TaskContinue')||action.equalsIgnoreCase('CSPContinue')))
            {
                if(paServiceState.currentRequestItem.continueFlag==false)
                    PAServiceState.currentRequestItem.action('PAEditReqItem', 'PAEditReqItem', 'SaveReqItem');
                system.debug('after continue action');
            }
            //<MS20140926> Adding task save and continue functionality
            if(paServiceState.currentRequestItem == null  || ((action!=null) &&( action.equalsIgnoreCase('NewPricingReqItem')|| (action.containsIgnoreCase('AddPricesPCKC')&& paServiceState.currentRequest.pricingRequest.Request_Type__c.contains('Non Customer Specific')) || action.equalsIgnoreCase('TaskContinue')|| action.equalsIgnoreCase('CSPContinue')|| action.equalsIgnoreCase('NewMaterial') || action.equalsIgnoreCase('done')
                    || action.containsIgnoreCase('ReqCreatedcurrentPrices'))))//1.3 added if condition for 'NewMaterial' 
            {
                
                if(action!=null && (action.equalsIgnoreCase('TaskContinue')||action.equalsIgnoreCase('CSPContinue')) && paServiceState.currentRequestItem.continueFlag==true)
                {
                    paServiceState.currentRequestItem.continueFlag=false;
                    component = paServiceState.currentRequestItem; 
                    return paServiceState.currentRequestItem;
                }
                if(action != null && (action.equalsIgnoreCase('NewPricingReqItem') ||  action.containsIgnoreCase('AddPricesPCKC') || action.equalsIgnoreCase('TaskContinue') || action.equalsIgnoreCase('CSPContinue')|| action.equalsIgnoreCase('NewMaterial')) && paServiceState.currentRequestItem != null)
                {   
                    paServiceState.currentRequestItem.pricingReqItem = new Pricing_Request_Item__c();
                    paServiceState.currentRequestItem.isRequestItemSaved = false;
                }
                if(paServiceState.currentRequest==null)
                {
                    paServiceState.currentRequest = new PARequest('a','b');
                }
                paServiceState.currentRequestItem = new PARequestItem(paServiceState);
                System.debug('test clas check'+paServiceState.currentRequestItem);
                if(paServiceState.currentRequestItem != null)
                {
                    //System.debug('****cur req item actionValue'+paServiceState.currentRequestItem.actionValue);
                    paServiceState.currentRequestItem.actionValue = 'addNewMaterial';
                    paServiceState.currentRequestItem.pricingReqItem = new Pricing_Request_Item__c();
                    if(action!=null && paServiceState!=null && paServiceState.currentRequest!=null && paServiceState.currentRequest.pricingRequest!=null &&!(paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c.contains('Pricing Task') && (action.equalsIgnoreCase('done')||action.equalsIgnoreCase('cancel')))) 
                        paServiceState.currentRequestItem.pcKCOptionsList = paServiceState.currentRequestItem.getListOptions();
                    if(action != null && (action.equalsIgnoreCase('NewPricingReqItem') || action.containsIgnoreCase('AddPricesPCKC')|| action.equalsIgnoreCase('TaskContinue') || action.equalsIgnoreCase('CSPContinue')|| action.equalsIgnoreCase('NewMaterial')))
                    {
                        if(paServiceState.currentRequest.pricingRequest.Request_Type__c!=null
                                && (paServiceState.currentRequest.pricingRequest.Request_Type__c.contains('Non Customer Specific')))
                        {
                            if(paServiceState.currentRequest.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
                                    && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Floor')
                                    && !paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Floor'))
                                paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = 'Floor';
                            else if(paServiceState.currentRequest.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
                                    && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Reference')
                                    && !paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Reference'))
                                paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = 'Reference';
                            else if(paServiceState.currentRequest.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
                                    && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Floor'))
                                paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = 'Net Floor';
                            else if(paServiceState.currentRequest.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition != null && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c != null
                                    && paServiceState.currentRequest.pricingCondition.pricingCondition.Price_Types__c.containsIgnoreCase('Net Reference'))
                                paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = 'Net Reference';
                            else
                                paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = 'Permanent';
                        }
                        //<TJ20140925>
                        else if(paServiceState.currentRequest.pricingRequest.Request_Type__c!=null
                                && (paServiceState.currentRequest.pricingRequest.Request_Type__c.contains('Massive')))
                        {                           
                            //<TJ20141106> START
                            PAServicestate.currentRequestitem.pricingReqItem.Sold_To_Code__c = PAServicestate.erpCustomer.customerCode;
                            PAServicestate.currentRequestitem.pricingReqItem.Sold_To__c = PAServicestate.erpCustomer.customerName;                          
                            //<TJ20141106> END
                            paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c;
                        }
                        else if(paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c!=null && paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c == 'Project Pricing')
                        {
                            paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = 'Project';
                        }
                        else
                        {
                            paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c;
                        }
                        //<TJ20141106> START
                        if(paServiceState.currentRequest.pricingRequest.Request_Type__c!=null
                                && (!paServiceState.currentRequest.pricingRequest.Request_Type__c.contains('Massive')))
                        {
                            paServiceState.currentRequestItem.pricingReqItem.Sold_To_Code__c = paServiceState.currentRequest.pricingRequest.SoldTo_Code__c;
                            paServiceState.currentRequestItem.pricingReqItem.Sold_To__c = paServiceState.currentRequest.pricingRequest.Sold_To__c;
                        }
                        //<TJ20141106> END
                        paServiceState.currentRequestItem.relatedWrappersList = new List<PARelatedList>();
                        if(paServiceState.currentRequest != null)
                            paServiceState.currentRequest.relatedWrappersList = new List<PARelatedList>();

                    }
                    paServiceState.currentRequest.soldToFilter = null;
                    paServiceState.currentRequest.materialFilter = null;
                    paServiceState.currentRequest.phFilter = null;
                    paServiceState.currentRequest.profitCenterFilter = null;
                    paServiceState.currentRequest.cpgFilter = null;
                    paServiceState.currentRequest.priceListTypeFilter = null;
                    paServiceState.currentRequest.discRefFilter = null;
                    paServiceState.currentRequest.mpgFilter = null;
                    paServiceState.currentRequest.paymentTermsFilter = null;
                    paServiceState.currentRequest.salesOfficeFilter = null;
                    paServiceState.currentRequest.salesDistrictFilter = null;
                    paServiceState.currentRequest.shipToFilter = null;
                    paServiceState.currentRequest.priceRefPartnerFilter = null;
                    paServiceState.currentRequest.endUseFilter = null;
                    paServiceState.currentRequest.marketSegmentFilter = null;
                    paServiceState.currentRequest.endUserFilter = null;
                    paServiceState.currentRequest.countryFilter = null;
                    paServiceState.currentRequest.customerHierarchyFilter = null;
                    paServiceState.currentRequest.incotermsFilter = null;
                    paServiceState.currentRequest.comPartnerFilter = null;
                    paServiceState.currentRequest.MaterialGroup5KeyFilter = null;
                    paServiceState.currentRequest.shipToCountryFilter = null;
                    paServiceState.currentRequest.variantFilter = null;
                    paServiceState.currentRequest.contractFilter = null;
                    paServiceState.currentRequest.salesOrderTypeFilter = null;
                    //<MS20141114>
                    paServiceState.currentRequest.salesOrderItemFilter = null;//<SS20220826>
                    //<SS20230501>
                    paServiceState.currentRequest.valueCenterFilter = null;
                    paServiceState.currentRequest.extMaterialGroupFilter = null;
                    paServiceState.currentRequest.materialGroup2Filter = null;
                    paServiceState.currentRequest.prizeZoneFilter = null;
                    
                    paServiceState.currentRequest.projectFilter = null;
                    paServiceState.currentRequest.kcodeFilter = null;
                    paServiceState.currentRequest.materialGroup1Filter = null;
                    paServiceState.currentRequest.payerFilter = null;
                    paServiceState.currentRequest.partnerZFFilter = null;
                    paServiceState.currentRequest.discRefNoFilter = null;
                    paServiceState.currentRequest.fixValDateFilter = null;
                    if(action!=null && (action.equalsIgnoreCase('TaskContinue') || action.equalsIgnoreCase('CSPContinue')))
                        paServiceState.currentRequestitem.continueFlag = true;
                }

            }                   
            //<TJ20140925>
            if(paServiceState.currentRequest.pricingRequest.Request_Type__c!=null
                    && (paServiceState.currentRequest.pricingRequest.Request_Type__c.contains('Massive')) && action!=null && action.containsIgnoreCase('soldToSelect'))
            {
                if(action.containsIgnoreCase('~'))
                    PAServiceState.currentRequestItem.pricingRequestItemId=action;
                //<TJ20141106> START
                PAServicestate.currentRequestitem.pricingReqItem.Sold_To_Code__c = PAServicestate.erpCustomer.customerCode;
                PAServicestate.currentRequestitem.pricingReqItem.Sold_To__c = PAServicestate.erpCustomer.customerName;
                //<TJ20141106> END
                paServiceState.currentRequestItem.pricingReqItem.Pricing_Request_Type__c = paServiceState.currentRequest.pricingRequest.Pricing_Request_Type__c;
            }
            system.debug(paServiceState.currentRequestItem.accseqId);
            if(action== 'generatePCL')
            {
                component = paServiceState.currentRequestItem;
            }

            if(action=='viewLog')
            {
                PAServiceState.currentRequestItem.action('PAImportReqItems', 'PAImportReqItems', action);
            }
            if(action != null && (action.equalsIgnoreCase('AddPricesReqCreated')||action.equalsIgnoreCase('AddPrices')))
            {
                if(paServiceState.currentRequest!=null && paServiceState.currentRequest.salesPriceSAP!=null){
                    paServiceState.currentRequest.salesPriceSAP.pcKCConcatList = new List<SelectOption>();
                    //paServiceState.currentRequest.salesPriceSAP.relatedWrappersList=paServiceState.currentRequest.salesPriceSAP.getListWrappers();
                    paServiceState.currentRequest.salesPriceSAP.pcKCSelected='';
                    if(paServiceState.currentRequest.pricingRequest.Request_Type__c=='Massive' && paServiceState.erpCustomer!=null && paServiceState.erpCustomer.currentPrices!=null)
                        paServiceState.erpCustomer.currentPrices=null;
                    paServiceState.currentRequest.action('','','ViewCustomerPrices');
                }   
            }
            //System.debug('\n\n\n Related Warpper list:-'+paServiceState.currentRequest.salesPriceSAP.relatedWrappersList.size());
            /*System.debug('\n\n\n Related Warpper list:-'+paServiceState.currentRequest.salesPriceSAP.relatedWrappersList);
            System.debug('\n\n\n currentRequest Related Warpper list:-'+paServiceState.currentRequest.relatedWrappersList);
            System.debug('\n\n\n currentRequest relatedListRequestItemsList:-'+paServiceState.currentRequest.relatedListRequestItemsList);
            System.debug('\n\n\n currentRequest relatedListERPSalesList:-'+paServiceState.currentRequest.relatedListERPSalesList);
            System.debug('\n\n\n currentRequest pricingReqItemList:-'+paServiceState.currentRequest.pricingReqItemList);
            System.debug('\n\n\n currentRequest listofwrappertables:-'+paServiceState.currentRequest.listofwrappertables);
             */


            if(action!=null && (action.equalsIgnoreCase('abandonImport') || action.equalsIgnoreCase('Abandon')))
            {                   

                paServiceState.ogItems.selectedUser= null;
                paServiceState.ogItems.userName = null;
                paServiceState.ogItems.paOrgGrp = null;
                paServiceState.ogItems.value = null;
                paServiceState.ogItems.isViewCustomerPrices = null;
                paServiceState.ogItems.isViewPLPrices = null;
                paServiceState.erpCustomer = null;
                //to delete view state data
                pautil.deleteViewState(paServiceState.currentrequest);
                paServiceState.currentrequest = null;
                //paServiceState.currentRequestItem = null;
                paServiceState.approvalSetup = null;
                paServiceState.productHierarchy = null;
                paServiceState.currentProjectPrice = null;
                paServiceState.currentNPCRequest = null;
                paServiceState.ogItems.selectedRecordId = null;
                paServiceState.ogItems.errorMessageDisp = null;
                system.debug('***ogi: '+paServiceState.ogItems.selectedBU);

            }           
            component = paServiceState.currentRequestItem; 
            return paServiceState.currentRequestItem; 
        }
        else if(name==NAME_PROJECT) 
        {
            //<PP20130424>,<PP20130619> -- Ver 1.4,1.5
            if(action != null && (action.equalsIgnoreCase('AddMaterial') || action.equalsIgnoreCase('AddProjectMaterial')
                    || action.containsIgnoreCase('AddPricesPCKC')) || action.equalsIgnoreCase('EditProjectHeader'))
            {
                paServiceState.currentRequestItem=null;
            }
            System.debug('****123324'+paServiceState.currentProjectPrice);
            if(paServiceState.currentProjectPrice==null)
            {
                paServiceState.currentProjectPrice = new PAProjectPrice(paServiceState); 
            }
            //<MS20141011> Making project selection default current
            if(action=='ProjectNewPricingRequest' || action=='cancelNewProject' )
            {   
                if(paServiceState.currentProjectPrice.projectSelection==null)
                    paServiceState.currentProjectPrice.projectSelection='current';
                else if((!paServiceState.currentProjectPrice.projectSelection.containsIgnoreCase('edit'))&&(paServiceState.currentProjectPrice.projectSelection!='clone')&&(paServiceState.currentProjectPrice.projectSelection!='projectId'))
                {
                    paServiceState.currentProjectPrice.projectSelection='current';
                }
            }   
            //issue 244 added by sanjib on 10 Jun 
            if(action !=null &&(action.equalsIgnoreCase('goToRequest')))
            {
                paServiceState.currentRequest=paServiceState.currentProjectPrice.currentRequest;
                //DW20150520 Call the action method of PARequest
                paServiceState.currentRequest.action('','',action);
            }
            //end
            if(action=='ProjectNewPricingRequestCancel') 
            {
                component = paServiceState.currentRequest;
                return paServiceState.currentRequest;
            }
            component = paServiceState.currentProjectPrice;
            return paServiceState.currentProjectPrice;

        }
        else if(name==NAME_APPROVALSETUP)
        {
            //Done for Approval setup Create New
            if(action <> NULL && action.containsignoreCase('gotoApprovalSetup'))
            {
                paServiceState.approvalSetup = NULL;
            }
            if(paServiceState.approvalSetup==null)
            {
                paServiceState.approvalSetup = new PAApprovalSetup(paServiceState); 
            }
            component = paServiceState.approvalSetup;
            return paServiceState.approvalSetup;
        }
        //FOR NPC  -new req screen
        else if(name==NAME_NETPRICEDETAIL)
        {
            System.debug('***npc request'+paServiceState.currentNPCRequest);
            if(paServiceState.currentNPCRequest==null || (action!=null) &&( action.equalsIgnoreCase('NPCRequests')))
            {
                System.debug('****in service'+paServiceState.currentNPCRequest);
                paServiceState.currentNPCRequest = new PANetPriceDetail(paServiceState); 
            }
            component = paServiceState.currentNPCRequest;
            System.debug('***npc request'+paServiceState.currentNPCRequest);
            return paServiceState.currentNPCRequest;
        } 
        return component; 
    }
}