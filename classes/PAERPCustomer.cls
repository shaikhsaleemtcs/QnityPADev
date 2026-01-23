/*
 * Name           :   PAERPCustomer
 * Description  :   This class acts as a business component to retrieve the PA ERP Customer details
 * Author      :   Infosys Limited
 * Created Date :   16-01-2013
 *
 * Version    Modified Date      Modified By    Modification
 * -------------------------------------------------------------
 * 1.1                  20-02-13                Shiva             Changed the getter method of customerCode for 'customer belongs to multiple sales area'
 * 1.2                  07-03-13                Bala              Added validation for onBehalfOf
 * 1.3                  09-03-13                Shiva                   Added a condition to the where clause of a query
 * 1.4                  12-03-2013              Bala              onBehalf Of validation
 * 1.5                  18-03-2013              Bala              Modified More than one sales Area Logic  
 **********************************************Modification Log***************************************************
<PP20130607>
Last Modified By  :     Priyanka Pillala
Last Modified Date      :     07 Jun 2013
Description             :     SIT Issue #19 FIX - Added null check for customerName - APAC ROLLOUT1(1.6)
 *****************************************************************************************************************
<VR20131110>
Last Modified By   :     Vinoth Rajapandian
Last Modified Date :     10 Nov 2013
Description        :     DTT Rollout Issue - Added one more condition in if statement
 *****************************************************************************************************************
<PP20140319>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   19 March 2014
Description         :   CAPITAL PROJECT - On Behalf Of Screen code
 *****************************************************************************************************************
<PP20140324>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 March 2014
Description         :   CAPITAL PROJECT - Customer Detail Screen code
 *****************************************************************************************************************
<SP20140505>
Last Modified By    :   Shiva
Last Modified Date  :   05 May 2014
Description         :   CAPITAL PROJECT - Customer Detail Screen code - Multiple salesarea picklist
 ******************************************************************************************************************
<TJ20140505>
Last Modified By    :   Tarun
Last Modified Date  :   05 May 2014
Description         :   Set Newpagelabel to PAHome for Landing Page Link   
 *****************************************************************************************************************
<BB20140508>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   08 May 2014
Description         :   CAPITAL PROJECT - Added CustomerOrderBlock variable
 *****************************************************************************************************************
<SP20140527>
Last Modified By    :   Shiva
Last Modified Date  :   27 May 2014
Description         :   CAPITAL PROJECT - Enabling Customer Search feature in PACustomerDetail page
 ******************************************************************************************************************
<SP20140605>
Last Modified By    :   Shiva
Last Modified Date  :   05 Jun 2014
Description         :   CAPITAL PROJECT - Warning message diaplayed if customer list exceeding the limit of 750 records
 ******************************************************************************************************************
<PR20140903>
Last Modified By    :   Priyanka R
Last Modified Date  :   09 Sep 2014
Description         :   Displaying sales reps and csr(s) picklists
 *****************************************************************************************************************
<PP20140916>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   16 Sep 2014
Description         :   Fix for IS ID-00046634 - Removed decoding since customer information is no longer passed as
                        parameter across pages
 ******************************************************************************************************************
 <PR20141024>
Last Modified By    :   Priyanka R
Last Modified Date  :   24 Oct 2014
Description         :   Fix for Issue 31
 ******************************************************************************************************************

<PG20191211>
Last Modified By    :   Piyush G
Last Modified Date  :   11 Dec 2019
Description         :   Added Customer Group 4 in the query to fetch the data
 ******************************************************************************************************************
 <SS20230110>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   10 Jan 2023
 Description        :   Added logic to included ZSUB customers in customer list - CRM-2022-08-0227
 *******************************************************************************************************************/
public without sharing class PAERPCustomer implements IPAServiceComponent
{ 
    //Attribute to hold the Organizational Group Item related to the Customer
    public PAOrganizationalGroupItems ogitems {get;set;}
    public PARequestItem requestItem {get;set;}
    //Attribute to hold the Customer
    public ERP_Customer__c paERPCustomer; 
    //Boolean to hold if customer is in multiple sales area
    public boolean changeSAFlag ;
    //Boolean for displaying ship to look up
    //public string shipToLookUp {get;set;}
    //<PP20140324>
    public String currentPrices {get;set;}
    //<AV20140408>
    public PAServiceState serviceState{get;set;}
    public string shipToCode {get;set;}
    public string shipToCustomerCode {get;set;}
    //<PP20140319> START
    public List<PAWrapper> allSalesRepsWrapList {get;set;}
    private Set<String> freqSalesRepSet;
    private Set<String> freqCustomerSet;
    public Map<String,Set<Id>> userNameToOrgGrpMap;//made public to fix view state
    private List<Id> salesAreaIdList;
    public Set<Id> oguIdSet;//made public to resolve view state
    private List<String> salesOrgCodesList;
    public List<String> distChannelCodesList;//made public view state
    public List<String> divisionCodesList;
    private List<Organization_Group_Users_Frequent__c> oguFreqList;
    //<PP20140319> END
    //<PP20140324> START
    public List<PAWrapper> allCustomersWrapList {get;set;}
    public List<Organizational_Group_User__c> orgGroupUserList;//{get;set;}
    //for pricing task
    public List<selectOption> incoterms{
        get
        {
            if(incoterms==null)
            {
                incoterms = new List<selectOption>();
                incoterms.add(new SelectOption(paERPCustomer.Incoterms_1_Code__c+' - '+paERPCustomer.Incoterms_1__c,paERPCustomer.Incoterms_1_Code__c+' - '+paERPCustomer.Incoterms_1__c));
                incoterms.add(new SelectOption('Other','Other'));
            }
            return incoterms;
        }

        set;
    }
    public List<selectOption> paymentTerms{
        get
        {
            if(paymentTerms==null)
            {
                paymentTerms = new List<selectOption>();
                paymentTerms.add(new SelectOption(paERPCustomer.Terms_Of_Payment_Code__c+' - '+paERPCustomer.Terms_Of_Payment__c,paERPCustomer.Terms_Of_Payment_Code__c+' - '+paERPCustomer.Terms_Of_Payment__c));
                paymentTerms.add(new SelectOption('Other','Other'));
            }
            return paymentTerms;
        }
        set;
    }
    
    //<SP20140527> START
    public string searchSoldToCode {get;set;}
    public string searchSoldTo {get;set;}
    public string searchCity {get;set;}
    public string searchCountry {get;set;}
    //<SP20140527> END
    //Constructor

    //<PR20140903> START
    public List<SelectOption> salesrespList{get;set;}
    public String csrList{get;set;}
    public String salesrepString{get;set;}
    public String navgText{get;set;}
    //<PR20140903> END
    //Constructor
    public PAERPCustomer() 
    { 
    }
    public PAERPCustomer(PAServiceState paServiceState) 
    { 
        ogitems = paServiceState.ogItems;
        requestItem = paServiceState.currentRequestItem;
        serviceState = paServiceState;//<AV20140408>
        system.debug('%%%% called ERP Customer'); 
        try
        {
            paERPCustomer = new ERP_Customer__c();
        }
        catch(Exception e)
        {
            system.debug('**** inside PAERP Customer'+e);
        }
        changeSAFlag=false;
        //<PP20140319> START
        orgGroupUserList = new List<Organizational_Group_User__c>();
        system.debug('hema1'+UserInfo.getUserID());
        system.debug('hema11'+ogItems.selectedBU);
        orgGroupUserList = [SELECT OrgGroup__c, OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Distribution_Channel_Code__c,
                            OrgGroup__r.ERP_Division_Code__c, Related_User__c, Related_User__r.Name FROM Organizational_Group_User__c
                            WHERE Related_User__c = :UserInfo.getUserID() AND Organizational_Group_Item__r.Business__c = :ogItems.selectedBU];
        userNameToOrgGrpMap = new Map<String,Set<Id>>();
        salesAreaIdList = new List<Id>();
        oguIdSet = new Set<Id>();
        salesOrgCodesList = new List<String>();
        distChannelCodesList = new List<String>();
        divisionCodesList = new List<String>();
        oguFreqList = new List<Organization_Group_Users_Frequent__c>();
        freqSalesRepSet = new Set<String>();
        freqCustomerSet = new Set<String>(); 
        for(Organizational_Group_User__c ogu : orgGroupUserList)
        {   

            salesAreaIdList.add(ogu.OrgGroup__c);
            if(userNameToOrgGrpMap.containsKey(ogu.Related_User__r.Name))
            {
                Set<Id> ogSet = userNameToOrgGrpMap.get(ogu.Related_User__r.Name);
                ogSet.add(ogu.OrgGroup__c);
                userNameToOrgGrpMap.put(ogu.Related_User__r.Name,ogSet);
            }
            else
            {
                Set<Id> ogSet = new Set<Id>();
                ogSet.add(ogu.OrgGroup__c);
                userNameToOrgGrpMap.put(ogu.Related_User__r.Name,ogSet);
            }
            oguIdSet.add(ogu.Id);
            salesOrgCodesList.add(ogu.OrgGroup__r.ERP_Sales_Org_Code__c);
            distChannelCodesList.add(ogu.OrgGroup__r.ERP_Distribution_Channel_Code__c);
            divisionCodesList.add(ogu.OrgGroup__r.ERP_Division_Code__c);
        }
        oguFreqList = [SELECT Id, Name__c, Type__c FROM Organization_Group_Users_Frequent__c WHERE Organizational_Group_Users__c IN :oguIdSet];
        for(Organization_Group_Users_Frequent__c oguf : oguFreqList)
        {
            if(oguf.Type__c == 'Sales Rep')
            {
                freqSalesRepSet.add(oguf.Name__c);
            }
            else if(oguf.Type__c == 'Customer')
            {
                freqCustomerSet.add(oguf.Name__c);
            }
        }
        //getAllSRList();
        //<PP20140319> END
    }

    /*
     * Author      : 
     * Method Name  :   setPAERPCustomer
     * Parameters   :   ERP_Customer__c
     * Return type  :   void
     * Description  :   This method is used to set the value of paERPCustomer
     */
    public void setPAERPCustomer(ERP_Customer__c pa){
        paERPCustomer=pa;
    }

    /*
     * Author      : 
     * Method Name  :   getSelectedEndUser
     * Parameters   :   End User Filter
     * Return type  :   ERP_Customer__c
     * Description  :   This method is used to get the value of selected End User
     */
     // Piyush <PG20191211> Added Customer Group 4 and Customer group 4 Code
    public static ERP_Customer__c getSelectedEndUser(String endUserFilter){
        ERP_Customer__c selectedEndUs = new ERP_Customer__c();
        if(enduserfilter!=null){
            Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
            List<ERP_Customer__c> selectedEndUserRec = [SELECT Id,Customer_Code__c,Name,Country__c,Customer_Group_4__c,Customer_Group_4_Code__c FROM ERP_Customer__c WHERE Customer_Code__c=:endUserFilter and RecordTypeId = :Customer_RTYPE_Id limit 1];
            if(selectedEndUserRec.size()!=0)
                selectedEndUs = selectedEndUserRec.get(0);
        }
        return selectedEndUs;    
    }
    /*
     * Author      : 
     * Method Name  :   getPAERPCustomer
     * Parameters   :   No parameters
     * Return type  :   ERP_Customer__c
     * Description  :   This method is used to get the value of paERPCustomer
     */
    public ERP_Customer__c getPAERPCustomer(){
        return paERPCustomer;
    }

    /*
     * Author      : 
     * Method Name  :   setChangeSAFlag
     * Parameters   :   Boolean
     * Return type  :   void
     * Description  :   This method is used to set the value of changeSAFlag
     */
    public void setChangeSAFlag(Boolean changeSAFlag)
    {
        this.changeSAFlag=changeSAFlag;
    }

    /*
     * Author      : 
     * Method Name  :   getchangeSAFlag
     * Parameters   :   No parameters
     * Return type  :   Boolean
     * Description  :   This method is used to get the value of changeSAFlag
     */
    public boolean getchangeSAFlag()
    {
        return changeSAFlag;
    }

    /*
     * Author      : 
     * Method Name  :   getListBusinessComponents
     * Parameters   :   No parameters
     * Return type  :   List<sObject>
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public List<sObject> getListBusinessComponents() 
    {
        return null;
    }

    /*
     * Author      : 
     * Method Name  :   getListOptions
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public List<SelectOption> getListOptions() 
    {
        return null;
    }

    /*
     * Author      : 
     * Method Name  :   getListWrappers
     * Parameters   :   No parameters
     * Return type  :   List<PARelatedList>
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public List<PARelatedList> getListWrappers() 
    {
        return null;
    }
    /*
     * Author      : 
     * Method Name  :   save
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public void save()
    {
    }

    /*
     * Author      : 
     * Method Name  :   deleteRecord
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public void deleteRecord()
    {
    }

    /*
     * Author      : 
     * Method Name  :   getName
     * Parameters   :   No parameters
     * Return type  :   String
     * Description  :   This method is used to determine the name of the business component
     */
    public String getName()
    {        
        return PAService.NAME_CUSTOMER; 
    }
    /*
     * Author      :  
     * Method Name  :   validate
     * Parameters   :   String
     * Return type  :   String
     * Description  :   This method is used to validate the action performed
     */
    public String validate(String desiredAction) 
    { 
        string errorMessage = '';
        System.debug(logginglevel.error,'**** in validate');
        System.debug(logginglevel.error,'**** in validate salesArea: '+salesArea);
        System.debug(logginglevel.error,'**** in validate salesAreaSelected: '+salesAreaSelected);
        System.debug(logginglevel.error,'**** in validate salesOrgCode: '+salesOrgCode);
        System.debug(logginglevel.error,'**** in validate distCode: '+distCode);
        System.debug(logginglevel.error,'**** in validate divCode: '+divCode);
        System.debug(logginglevel.error,'**** in validate customerCode: '+customerCode);
        if(desiredAction.containsIgnoreCase('searchCustomer') && !desiredAction.containsIgnoreCase('customerPrices'))
        {
            if(string.isBlank(searchSoldToCode) && string.isBlank(searchSoldTo) && string.isBlank(searchCity) && string.isBlank(searchCountry))
            {
                errorMessage+='Please enter values to search'+'<br>'; 
            }
        }
        //<PP20140417> END
        if(desiredAction.containsIgnoreCase('Next'))
        {   
            //<PP20140417> START
            if(salesArea == 'Multiple' &&  (string.isBlank(salesAreaSelected) || (salesAreaSelected == '--Select--')))
            {
                errorMessage+=System.Label.Select_Sales_Area_Error;
            }
            //<PP20140417> END
            else
            {
                //<SP20140505> START
                if(salesArea == 'Multiple')
                {
                    if(!string.isBlank(salesAreaSelected))
                    {
                        List<String> salesAreaSplit = salesAreaSelected.split('-');
                        salesOrgCode = salesAreaSplit[0];
                        distCode = salesAreaSplit[1];
                        divCode = salesAreaSplit[2];
                    }
                } //<SP20140505> END
                // version 1.2; bala - 07-Mar-2013
                //<VR20131110> DTT Rollout Issue - Added one more condition in if statement
                //<PP20140417>
                /*if(ogitems.salesAdminPermissionSetFlag && ogitems.isRequester==false && !desiredAction.containsIgnoreCase('ViewAllCustomerPrices')
                        && !desiredAction.containsIgnoreCase('customerPrices'))
            {
                if(String.isBlank(ogitems.userName))
                {
                    errorMessage+='<br>'+'Please select onBehalfOf';
                }     
            }

                      if(String.isBlank(CustomerCode)  && !desiredAction.containsIgnoreCase('ViewAllCustomerPrices'))
            {
                errorMessage+='<br>'+System.Label.No_Customer_Error;
            }
                      /*if(String.isBlank(CustomerName))
            {
                errorMessage+='<br>'+System.Label.Use_Sold_To_Lookup_Error;
            }
            //for pop up when onBehalf and sold to doesnot match 1.4
                      if(ogitems.salesAdminPermissionSetFlag  && !desiredAction.containsIgnoreCase('ViewAllCustomerPrices'))
            {
                system.debug('In On Behalf Of');
                Set<String> Dummycustmrs = new Set<String>();
                //To bypass validation for Dummy Customers.
                for(PADummycustomerMapping__c dupcustmr: PADummycustomerMapping__c.getAll().values())
                {
                    Dummycustmrs.add(dupcustmr.Customer_Code__c);
                }
                if(!String.isBlank(ogitems.userName))
                {
                    List<ERP_Customer__c> soldTo = [SELECT id,customer_code__c,Name,Customer_Group_4__c,Customer_Group_4_Code__c FROM ERP_Customer__c WHERE Id IN
                                                    (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c='ZU'
                                                    AND User__c=:ogitems.selectedUser AND Related_ERP_Customer__c=NULL) AND sales_Org_code__c=:salesOrgCode
                                                    AND Distribution_Channel_Code__c=:distCode
                                                    AND Division_code__c=:divCode AND customer_code__c = :customerCode
                                                    AND Account_Group_Code__c ='Z001'];
                    if(soldTo.size()==0 && !Dummycustmrs.contains(customerCode))
                    {
                        errorMessage+='<br>'+' Sold To Code does not match for the On Behalf Of User';
                    }    
                    system.debug('In On Behalf Of Sold To'+soldTo);     
                }     
                      }*/
            }
        }
        return errorMessage.trim();
    }

    /*
     * Author      : 
     * Method Name  :   action
     * Parameters   :   String,String,String
     * Return type  :   String
     * Description  :   This method is called when action on the corresponding page is called
     */
    public String action(String newPageLabel,String currentPageLabel,String desiredAction) 
    {
        //<PP20140418> START
        system.debug('@^%&&Hello'+desiredAction);

        if(desiredAction.containsIgnoreCase('onBehalfOf') && !desiredAction.containsIgnoreCase('customerPrices'))
        {   
            system.debug('\n\n\n desired Action onbehalfof');
            getAllSoldToList();
            return newPageLabel;
        }
        else if(desiredAction!=null && desiredAction.containsIgnoreCase('CheckRequests')){
            system.debug('\n\n\n desired Action CheckRequests inside PAERPCustomer');
            return newPageLabel;
        }
        //<PP20140418> END
        //<TJ20140505> Set newpagelabel to PAHome for Landing Page Link.
        else if(desiredAction.containsIgnoreCase('landingpage'))
        {
            if(newpagelabel.containsIgnoreCase('PAHome'))
            {
                return newpagelabel;
            }
        }
        else if(desiredAction.containsIgnoreCase('customerPrices') || desiredAction.containsIgnoreCase('PCL'))
        {   
            //for Dummy Customer code
            String retErrorMsg;
            string buName;
            retErrorMsg=validate(desiredAction);
            if(!string.isBlank(retErrorMsg))
                //throw exception
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            if(!String.isBlank(ogitems.selectedBU))
            {
                buName = [select id,business__c from OrgGroup__c where Id=:ogitems.selectedBU].business__c;
            }
            //<PR20140903> START
            salesrespList = new List<SelectOption>();
            csrList = '';
            salesrepString = '';
            Map<String,List<ERP_Relationship__c>> erpMap = new Map<String,List<ERP_Relationship__c>>();
            //<AV20150505>-Production issue-Too many SOQL queries error
            String custCode = getCustomerCode();
            List<ERP_Relationship__c> erpRelationList = new List<ERP_Relationship__c>();
            //<AV20150505>-Production issue-Too many SOQL queries error
            erpRelationList = [Select Id, ERP_Customer__r.Customer_Code__c, Partner_Function_Code__c, User__c, User__r.id, User__r.Name from ERP_Relationship__c where 
                               ERP_Customer__r.Customer_Code__c = :custCode and (Partner_Function_Code__c = 'ZU' OR Partner_Function_Code__c = 'ZR') and User__c != null
                               and ERP_Customer__r.Sales_Org_Code__c= :salesOrgCode 
                               and ERP_Customer__r.Distribution_Channel_Code__c = :distCode
                               and ERP_Customer__r.Division_Code__c = :divCode ];
            System.debug('****erpRelationList: '+erpRelationList);
            System.debug('****salesOrgCode: '+salesOrgCode);
            for(ERP_Relationship__c erp : erpRelationList){
                if(erpMap.get(erp.Partner_Function_Code__c) != null){
                    erpMap.get(erp.Partner_Function_Code__c).add(erp);
                }else{
                    List<ERP_Relationship__c> templist = new List<ERP_Relationship__c>();
                    templist.add(erp);
                    erpMap.put(erp.Partner_Function_Code__c,templist);
                }
            }
            if(erpMap != null && erpMap.get('ZU') != null){
                //if(erpMap.get('ZU').size() > 1 || erpMap.get('ZU').size() == 0){
                //  salesrespList.add(new SelectOption('--Select--','--Select--'));
                //}else{
                for(ERP_Relationship__c erp : erpMap.get('ZU')){
                    salesrespList.add(new SelectOption(erp.User__r.Name,erp.User__r.Name));
                    if(salesrepString != ''){
                        salesrepString = salesrepString + ',' + erp.User__r.Name;
                    }else{
                        salesrepString = erp.User__r.Name;
                    }
                }
                //} 
                // <PR20141024> START
                boolean flag=false;
                for(PADummycustomerMapping__c dupcustmr: PADummycustomerMapping__c.getAll().values())
                {
                    //<AV20150505>-Production issue-Too many SOQL queries error
                    if(dupcustmr.Customer_Code__c==custCode)
                    {
                        flag=true;
                    }
                }
                if(salesrespList != null && salesrespList.size()==1 && flag==false){
                    ogItems.userName = salesrespList[0].getValue();
                }   
                // <PR20141024> END 
            }/*else{
                salesrespList.add(new SelectOption('--Select--','--Select--'));
            }*/
            if(erpMap != null && erpMap.get('ZR') != null){
                //if(erpMap.get('ZR').size() > 1 || erpMap.get('ZR').size() == 0){
                //  csrList.add(new SelectOption('--Select--','--Select--'));
                //}else{
                for(ERP_Relationship__c erp : erpMap.get('ZR')){
                    if(csrList != ''){
                        csrList = csrList + ',' + erp.User__r.Name;
                    }else{
                        csrList = erp.User__r.Name;
                    }   
                }
                //}     
            }/*else{
                csrList.add(new SelectOption('--Select--','--Select--'));
            }*/
            //<PR20140903> END
            //<PP20130607> - Ver 1.6
            //if(!String.isBlank(buName) && buName.containsIgnoreCase('Envelopes')  && customerName != null && customerName.containsIgnoreCase('FREE OF CHARGE CUST - NOW LUX'))
            //{

            //}
            if(!String.isBlank(salesOrgCode) && !String.isBlank(customerCode) && ((salesOrgCode=='D630' && customerCode=='55395195') || ((salesOrgCode=='D693' || salesOrgCode=='A693') && customerCode=='97002139')))
            {
            }
            else
                retErrorMsg=validate(desiredAction);
            if(!string.isBlank(retErrorMsg)){
                //throw exception
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            }
            else if(desiredAction.containsIgnoreCase('customerPrices') && !desiredAction.containsIgnoreCase('PCL'))
            {
                System.debug('***next in erp');
                //if(desiredAction.con)
                getCustomerCode();
                //Added to remove the customer wrapper list from view state while navigating out of the customer list screen
                if(desiredAction.containsIgnoreCase('customerPricesViewAllCustomerPricesNext'))
                    allCustomersWrapList = new List<PAWrapper> ();
                
                //<AV20140408> START-added logic to update request header values when soldto is change for clone req
                if(desiredAction.containsIgnoreCase('soldtoChange'))
                {
                    if(serviceState != null)
                    {
                        serviceState.currentRequest.pricingRequest.SoldTo_Code__c = customerCode;
                        serviceState.currentRequest.pricingRequest.Sold_To__c = customerName;
                        serviceState.currentRequest.pricingRequest.Sales_Org_Code__c = salesOrgCode;
                        serviceState.currentRequest.pricingRequest.Sales_Org__c = salesOrg;
                        serviceState.currentRequest.pricingRequest.Dist_Channel_Code__c = distCode;
                        serviceState.currentRequest.pricingRequest.Dist_Channel__c = dist;
                        serviceState.currentRequest.pricingRequest.Division_Code__c = divCode;
                        serviceState.currentRequest.pricingRequest.Division__c = div;
                        serviceState.currentRequest.pricingRequest.Street__c = street;
                        serviceState.currentRequest.pricingRequest.State_Province__c = stateProvince;
                        serviceState.currentRequest.pricingRequest.Country__c = country;
                        serviceState.currentRequest.pricingRequest.Zip_PostalCode__c = zipPostalCode;
                        List<Organizational_Group_Item__c>  buOrgGrouplist = [SELECT Id,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,ERP_Pricing_Procedure__c,Business__r.Name, Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Customer_Request_Reasons__c,Non_Standard_Payment_terms__c,
                                                                              Latest_Valid_From_Offset_Non_Cust_Spec__c,Rebate_Agreement__c ,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c, 
                                                                              Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Type__c,Pricing_Task_Reasons__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                                                                              Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Landing_Cost__c,
                                                                              Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                                                                              Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c
                                                                              FROM Organizational_Group_Item__c 
                                                                              WHERE Business__c = :ogItems.selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                                                                              AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :distCode AND
                                                                              OrgGroup__r.ERP_Division_Code__c = :divCode];

                        system.debug('\n\n\n buOrgGrouplist'+buOrgGrouplist);
                        ogitems.orgGroupItems =  buOrgGrouplist.get(0);

                    }
                }
                //<AV20140408> END
                return newPageLabel;
            }
            else  if(desiredAction.containsIgnoreCase('PCL'))
            {
                getCustomerCode();
                ogitems.value = 'PCLDisableSelect';
                return newPageLabel;
            }
        }

        //<PP20140418> START
        if(desiredAction.equalsIgnoreCase('markCustomerFreq'))
        {
            String retErrorMsg;
            retErrorMsg = validate(desiredAction);
            if(!String.isBlank(retErrorMsg))
            {
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            }
            else
            {
                List<Organization_Group_Users_Frequent__c> oguFreqList1 = new List<Organization_Group_Users_Frequent__c>();
                List<String> selCustCodesList = new List<String>();
                List<String> unCheckedCustCodeList = new List<String>();
                system.debug('allCustomersWrapList----->>>>>>>'+allCustomersWrapList.size());
                for(integer i=0; i<allCustomersWrapList.size() ; i++)//PAWrapper w1 : allCustomersWrapList)
                {
                    if(allCustomersWrapList[i].isSelected)
                    {
                        selCustCodesList.add((String)allCustomersWrapList[i].sObjectRecord.get('Customer_Code__c'));
                        PAWrapper wrap = allCustomersWrapList[i];
                        allCustomersWrapList.remove(i);
                        if(allCustomersWrapList.size() > 0)
                            allCustomersWrapList.add(0,wrap);
                        else
                            allCustomersWrapList.add(wrap);
                    }
                    else if(!allCustomersWrapList[i].isSelected && freqCustomerSet.contains((String)allCustomersWrapList[i].sObjectRecord.get('Customer_Code__c')))
                    {
                        unCheckedCustCodeList.add((String)allCustomersWrapList[i].sObjectRecord.get('Customer_Code__c'));
                    }
                }
                //System.debug('****selCustCodesList'+selCustCodesList+'****'+allCustomersWrapList[0]);
                // Piyush <PG20191211> Added Customer Group 4 and Customer group 4 Code
                Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
                List<ERP_Customer__c> selCustList = [SELECT Customer_Code__c, Sales_Org_Code__c, Distribution_Channel_Code__c, Division_Code__c,Customer_Group_4__c, Customer_Group_4_Code__c
                                                     FROM ERP_Customer__c WHERE Customer_Code__c IN :selCustCodesList
                                                     AND Sales_Org_Code__c  IN :salesOrgCodesList AND Distribution_Channel_Code__c IN
                                                     :distChannelCodesList AND Division_Code__c IN :divisionCodesList AND
                                                     Account_Group_Code__c IN ('Z001', 'ZSUB') AND Deletion_Flag__c = false AND
                                                     RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false]; //<SS20230110> Added ZSUB account group code

                for(ERP_Customer__c cust : selCustList)
                {
                    if(!freqCustomerSet.contains(cust.Customer_Code__c))
                    {                                       
                        for(Organizational_Group_User__c ogu : orgGroupUserList)
                        {
                            if((ogu.OrgGroup__r.ERP_Sales_Org_Code__c + ogu.OrgGroup__r.ERP_Distribution_Channel_Code__c
                                    + ogu.OrgGroup__r.ERP_Division_Code__c) == (cust.Sales_Org_Code__c + cust.Distribution_Channel_Code__c
                                            + cust.Division_Code__c))
                            {
                                Organization_Group_Users_Frequent__c oFreq = new Organization_Group_Users_Frequent__c();
                                oFreq.Name__c = cust.Customer_Code__c;
                                oFreq.Type__c = 'Customer';
                                oFreq.Organizational_Group_Users__c = ogu.Id;
                                oguFreqList1.add(oFreq);
                            }
                        }
                        freqCustomerSet.add(cust.Customer_Code__c);
                    }
                }
                insert oguFreqList1;
                freqCustomerSet.removeAll(unCheckedCustCodeList);
                oguFreqList1 = new List<Organization_Group_Users_Frequent__c>();
                oguFreqList1 = [SELECT Id FROM Organization_Group_Users_Frequent__c WHERE Name__c IN :unCheckedCustCodeList];
                if(oguFreqList1.size() > 0)
                {
                    delete oguFreqList1;
                }
                throw new PAException(System.Label.Customer_Marked_as_Freq_Info,ApexPages.Severity.INFO);
            }               
        }
        if(desiredAction.equalsIgnoreCase('markSalesRepFreq'))
        {
            String retErrorMsg;
            retErrorMsg = validate(desiredAction);
            if(!String.isBlank(retErrorMsg))
            {
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            }
            else
            {
                List<Organization_Group_Users_Frequent__c> oguFreqList1 = new List<Organization_Group_Users_Frequent__c>();
                List<String> unCheckedSalesRepList = new List<String>();
                List<PAWrapper> selectedSalesRepList = new List<PAWrapper>();

                for(integer i=0; i<allSalesRepsWrapList.size() ; i++)
                {
                    if(allSalesRepsWrapList[i].isSelected)
                    {
                        PAWrapper wrap = allSalesRepsWrapList[i];
                        allSalesRepsWrapList.remove(i);
                        if(allSalesRepsWrapList.size() > 0)
                            allSalesRepsWrapList.add(0,wrap);
                        else
                            allSalesRepsWrapList.add(wrap);
                        selectedSalesRepList.add(wrap);
                    }
                    else if(!allSalesRepsWrapList[i].isSelected && freqSalesRepSet.contains((String)allSalesRepsWrapList[i].sObjectRecord.get('Name')))
                    {
                        unCheckedSalesRepList.add((String)allSalesRepsWrapList[i].sObjectRecord.get('Name'));
                    }
                }
                System.debug('***freqSalesRepSet'+freqSalesRepSet+'***userNameToOrgGrpMap'+userNameToOrgGrpMap);
                for(PAWrapper salesRep : selectedSalesRepList)
                {
                    if(!freqSalesRepSet.contains((String)salesRep.sObjectRecord.get('Name'))
                            && userNameToOrgGrpMap.containsKey((String)salesRep.sObjectRecord.get('Name')))
                    {
                        for(Id oGrp : userNameToOrgGrpMap.get((String)salesRep.sObjectRecord.get('Name')))
                        {
                            for(Organizational_Group_User__c ogu : orgGroupUserList)
                            {
                                if(ogu.OrgGroup__r.Id == oGrp)
                                {
                                    Organization_Group_Users_Frequent__c oFreq = new Organization_Group_Users_Frequent__c();
                                    oFreq.Name__c = (String)salesRep.sObjectRecord.get('Name');
                                    oFreq.Type__c = 'Sales Rep';
                                    oFreq.Organizational_Group_Users__c = ogu.Id;
                                    oguFreqList1.add(oFreq);
                                }
                            }
                        }
                        freqSalesRepSet.add((String)salesRep.sObjectRecord.get('Name'));
                    }
                }
                insert oguFreqList1;
                freqSalesRepSet.removeAll(unCheckedSalesRepList);
                oguFreqList1 = new List<Organization_Group_Users_Frequent__c>();
                oguFreqList1 = [SELECT Id FROM Organization_Group_Users_Frequent__c WHERE Name__c IN :unCheckedSalesRepList];
                if(oguFreqList1.size() > 0)
                {
                    delete oguFreqList1;
                }
                throw new PAException(System.Label.Sales_Rep_Marked_as_Freq_Info,ApexPages.Severity.INFO);
            }               
        }
        //<PP20140418> END
        if(desiredAction.equalsIgnoreCase('cancel'))
        {     
            ogitems.value = null;
            system.debug('i am here');
            return newPageLabel;
        }

        if(desiredAction.equalsIgnoreCase('ShipTo'))
        {
        }
        //<SP20140527> START
        if(desiredAction.containsIgnoreCase('searchCustomer'))
        {
            //<HL20150707> Start - To fix production issue to display exception on search of NULL values.
            /*String retErrorMsg;
            retErrorMsg = validate(desiredAction);
            if(!String.isBlank(retErrorMsg))
            {
                throw new  PAException('<html>'+retErrorMsg+'</html>',ApexPages.Severity.ERROR);
            }
            else
            {*/
                //<HL20150707> end
            allCustomersWrapList = searchcustomerMethod();
            return newPageLabel;
            //}
        }
        //<SP20140527> END
        //<AV20140408> START
        if(desiredAction.equalsIgnoreCase('CancelBack'))
        {
            system.debug('@@@###cancel');
            ogitems.value = null;
            return newPageLabel;
        }
        //<TJ20140925>
        if(desiredAction.containsIgnoreCase('soldtoChange') || desiredAction.containsIgnoreCase('soldToSelect') || desiredAction.equals('Massive'))
        {
            system.debug('@@@###cancel from on behalf of/Massive Request');
            return newPageLabel;
        }
        
        
        //<AV20140408> END

        return currentPageLabel;
    }

    public string customerCode;
    public string getCustomerCode()
    {
        system.debug('++++customer code---'+customerCode);
        system.debug('++++salesArea code---'+salesArea);
        //<PP20140417>
        if(!string.isBlank(customerCode))
        {
            if(salesArea == 'Multiple') //<SP20140505> START
            {
                if(!string.isBlank(salesAreaSelected))
                {
                    List<String> salesAreaSplit = salesAreaSelected.split('-');
                    salesOrgCode = salesAreaSplit[0];
                    distCode = salesAreaSplit[1];
                    divCode = salesAreaSplit[2];
                }
            } //<SP20140505> END

            PAERPCustomer.customer_code__c=customerCode;
            System.debug('****customer code'+customerCode);
            List<ERP_Customer__c> paerpCustList=new List<ERP_Customer__c>();
            //<PP20140417> START
            List<Organizational_Group_Item__c> ogiList = new List<Organizational_Group_Item__c>();
            ogiList = [SELECT Id,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.SAP_Cluster__c,ERP_Pricing_Procedure__r.SAP_Client_Id__c,
                       ERP_Pricing_Procedure__r.SAP_Application_Id__c FROM Organizational_Group_Item__c
                       WHERE Business__c = :ogItems.selectedBU AND  OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                       AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :distCode AND OrgGroup__r.ERP_Division_Code__c = :divCode];
            Organizational_Group_Item__c ogi = new Organizational_Group_Item__c();
            if(ogiList.size() != 0)
                ogi = ogiList[0];
            String extERPId = ogi.ERP_Pricing_Procedure__r.SAP_Cluster__c + '-' + customerCode + '-' + salesOrgCode + '-' + distCode
                    + '-' + divCode;
            System.debug('*****extERPId '+extERPId);
            //<BB20140508>  Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query  
            // Piyush <PG20191211> Added Customer Group 4 and Customer group 4 Code           
            paerpCustList = [SELECT id,Name,city__c,country__c,country_code__c,currency_code__c,customer_code__c,
                             Distribution_Channel_Code__c,Distribution_channel__c,
                             Division__c,Division_code__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                             Customer_Price_Group__c,Price_List_type__c,
                             price_list_type_code__c,sales_office__c,sales_office_Code__c,sales_org_code__c,
                             sales_org__c,State_Province__c,Street__c,Terms_Of_Payment__c,Terms_Of_Payment_Code__c,
                             Zip_Postal_Code__c,Customer_Group_2_Code__c,State__c,Source_Cluster__c,Customer_Order_Block_Code__c,Customer_Order_Block__c,
                             Account_Group_Code__c,Customer_Group_4__c,Customer_Group_4_Code__c FROM ERP_Customer__c
                             WHERE External_ERP_ID__c = :extERPId limit 1];
            if(paerpCustList.size()!=0)
            {
                paErpCustomer=paerpCustList[0];
            }
            System.debug('**** street' + paErpCustomer.Street__c);
            System.debug('**** cust' + paErpCustomer.Customer_Group_4__c );
            customerName = paErpCustomer.Name;
            //system.debug('@@###customer name:'+EncodingUtil.urlDecode(customerName,'UTF-8'));
            salesArea = paErpCustomer.Sales_Org_Code__c + '-' + paErpCustomer.Sales_Org__c + '<br>' + paErpCustomer.Distribution_Channel_Code__c
                    + '-' + paErpCustomer.Distribution_Channel__c + '<br>' + paErpCustomer.Division_Code__c + '-' 
                    + paErpCustomer.Division__c;
            salesOrgCode = paErpCustomer.Sales_Org_Code__c;
            salesOrg = paErpCustomer.Sales_Org__c;
            distCode = paErpCustomer.Distribution_Channel_Code__c;
            dist = paErpCustomer.Distribution_Channel__c;
            divCode = paErpCustomer.Division_Code__c;
            div = paErpCustomer.Division__c;
            street = paErpCustomer.Street__c;
            city = paErpCustomer.City__c;
            stateProvince = paErpCustomer.State__c;
            country = paErpCustomer.Country__c;
            zipPostalCode = paErpCustomer.ZIP_Postal_Code__c;
            // Piyush <PG20191211> Added Customer Group 4 and Customer group 4 Code
            custGroupFour = paErpCustomer.Customer_Group_4__c ;
            custGroupFourcode = paErpCustomer.Customer_Group_4_Code__c ;
            system.debug('DDDDDDD ') ;
            //<PP20140417> END

            //For customer belongs to multiple Sales Area
            /*if(!string.isBlank(customerName))
            {
                //Added -- Shiva 20-02-13 version 1.1 start
                //Added - Bala 18 Mar 2013 version 1.5
                string finalUser;
                if(String.IsBlank(ogitems.selectedUser))
                {
                    finalUser=Userinfo.getUserId();
                }
                else
                {
                    finalUser=ogitems.selectedUser;
                }
                system.debug('&*&*& ogitems.selectedUser '+ogitems.selectedUser);
                system.debug('&*&*& User '+Userinfo.getUserId());
                List<Organizational_Group_User__c> ogIU= [SELECT OrgGroup__c FROM Organizational_Group_User__c WHERE Related_User__c=:finalUser AND Organizational_Group_Item__r.Business__c =:ogitems.selectedBU];
                List<String> ogIds = new List<String>();
                for(Organizational_Group_User__c X:ogIU)
                {
                    ogIds.add(X.OrgGroup__c);
                }
                system.debug('&*&*& ogIds'+ogIds);
                system.debug('&*&*& size '+ogIds.size());
                //version 1.1 end
                Integer count = [SELECT Count() FROM ERP_Relationship__c WHERE ERP_Customer__r.Customer_code__c =:customerCode AND ERP_Customer__r.OrgGroup__c IN:ogIds AND Partner_Function_code__c='ZU' AND User__c=:finalUser]; // added Partner_Function_code__c to the where clause ver 1.3
                system.debug('&*&*& count '+count);
                if(count > 1)
                {
                    changeSAFlag = true; 
                }
                else
                {
                    changeSAFlag = false;
                } 
            }*/
            //<Abhijeet>
            List<SelectOption> list1 = ogitems.requestClassList;
        }
         system.debug('EEEEEEEEEv') ;
        return customerCode;
    }

    public void setCustomerCode(string s)
    {
        customerCode = s;
    }
    //<PP20140916> - Fix for IS ID-00046634
    public string customerName{ get; set;}
    //if(customerName!=null)
    //{
    //customerName = EncodingUtil.urlDecode(customerName,'UTF-8');
    //}
    //return customerName;
    public string SalesOffice{get;set;}
    public string SalesArea{get;set;}
    public string PriceListType{get;set;} 

    public string Incotems{get;set;}

    public string TermsOfPayment{get;set;}
    public string CustomerGroupCode{get;set;}

    //<BB20140508> Added CustomerOrderBlock variable
    public string CustomerOrderBlock{get;set;}
    //<PP20140916> - Fix for IS ID-00046634
    public string street{ get; set;}
    //if(street!=null)
    //{
    //  street = EncodingUtil.urlDecode(street,'UTF-8');
    //}
    //return street;
    //<PP20140916> - Fix for IS ID-00046634
    public string StateProvince{ get; set;}
    //if(StateProvince!=null)
    //{
    //System.debug('******STATE PROV b4'+stateProvince);
    //StateProvince = EncodingUtil.urlDecode(StateProvince,'UTF-8');
    //System.debug('******STATE PROV aftr'+stateProvince);
    //}
    //return StateProvince;
    //<PP20140916> - Fix for IS ID-00046634
    public string Country { get; set;}
    //if(Country!=null)
    //{
    //  Country = EncodingUtil.urlDecode(Country,'UTF-8');
    //}
    //return country;
    public string ZipPostalCode{get;set;}
    //<PP20140916> - Fix for IS ID-00046634
    public string City{ get; set;}
    //if(City!=null)
    //{
    //  City = EncodingUtil.urlDecode(city,'UTF-8');
    //}
    //return City;

    public string Location{get;set;}
    public string salesOrg{get;set;}                                  
    public string salesOrgCode{get;set;}
    public string dist{get;set;}                                            
    public string distCode{get;set;}
    public string div{get;set;}   
    public string divCode{get;set;}  
    public String custGroupFour {get;set;}  
    public String custGroupFourcode {get;set;}                                                                                                                   
    public string salesAreaSelected{get;set;}   //<SP20140505>


    //<PP20140319> START
    /*
     * Author           :
     * Method Name      :       allSRList
     * Parameters       :       No parameters
     * Return type      :       List<User>
     * Description      :       This method is used to query for all the sales representatives for the selected BU
     */
    public void getAllSRList()
    {
        List<User> allSalesRepsList = new List<User>();
        allSalesRepsWrapList = new List<PAWrapper>();
        List<Organizational_Group_User__c> orgGroupUserList1 = new List<Organizational_Group_User__c>();
        userNameToOrgGrpMap = new Map<String,Set<Id>>();
        orgGroupUserList1 = [SELECT Related_User__c, Related_User__r.Name, OrgGroup__c FROM Organizational_Group_User__c WHERE OrgGroup__c IN
                             :salesAreaIdList AND Description__c = 'ZU' AND Organizational_Group_Item__r.Business__c = :ogItems.selectedBU];
        List<Id> userIdList = new List<Id>();
        for(Organizational_Group_User__c ogu1 : orgGroupUserList1)
        {
            userIdList.add(ogu1.Related_User__c);
            if(userNameToOrgGrpMap.containsKey(ogu1.Related_User__r.Name))
            {
                Set<Id> ogSet = userNameToOrgGrpMap.get(ogu1.Related_User__r.Name);
                ogSet.add(ogu1.OrgGroup__c);
                userNameToOrgGrpMap.put(ogu1.Related_User__r.Name,ogSet);
            }
            else
            {
                Set<Id> ogSet = new Set<Id>();
                ogSet.add(ogu1.OrgGroup__c);
                userNameToOrgGrpMap.put(ogu1.Related_User__r.Name,ogSet);
            }
        }
        allSalesRepsList = [SELECT Id,Name,FirstName,LastName,E_Pass_ID__c,External_ERP_ID__c,User_Country__c,Email,isActive FROM User 
                            WHERE IsActive = true AND Id IN :userIdList ORDER BY FirstName];
        for(User u : allSalesRepsList)
        {
            PAWrapper wrap1 = new PAWrapper();
            wrap1.isSelected = false;
            wrap1.sobjectRecord = u;
            if(freqSalesRepSet.contains(u.Name) && allSalesRepsWrapList.size() > 0)
            {
                wrap1.isSelected = true;
                allSalesRepsWrapList.add(0,wrap1);
            }
            else
            {
                if(freqSalesRepSet.contains(u.Name))
                    wrap1.isSelected = true;
                allSalesRepsWrapList.add(wrap1);
            }
        }
        allSalesRepsList = new List<User>();
    }                            
    //<PP20140319> END
    //<PP20140324> START
    /*
     * Author           :
     * Method Name      :       getAllSoldToList
     * Parameters       :       No parameters
     * Return type      :       List<User>
     * Description      :       This method is used to query for all the sales representatives for the selected BU
     */
    //<SP20140505> START
    public list<SelectOption> listOfSalesArea {get;set;}
    //<SP20140505> END
    public void getAllSoldToList()
    {
        System.debug(logginglevel.error,'****in getallsoldto'+' '+salesOrgCodesList);
        List<ERP_Customer__c> allCustomersList = new List<ERP_Customer__c>();
        allCustomersWrapList = new List<PAWrapper>();
        Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
        String onBehalfOfUser;
        if(String.isBlank(ogItems.selectedUser))
        {
            if(serviceState.currentRequest!=null && serviceState.currentRequest.pricingRequest.On_Behalf_Of__c!=null)
                onBehalfOfUser = serviceState.currentRequest.pricingRequest.On_Behalf_Of__c;
            else
                onBehalfOfUser = UserInfo.getUserId();
        }
        else
        {
            if(serviceState.currentRequest!=null && serviceState.currentRequest.pricingRequest.On_Behalf_Of__c!=null)
                onBehalfOfUser = serviceState.currentRequest.pricingRequest.On_Behalf_Of__c;
            else
                onBehalfOfUser = ogItems.selectedUser;
        }
        //<TJ20141029>
        if(servicestate.currentRequest!=null && serviceState.currentRequest.pricingRequest.Request_Type__c=='Massive')
        {
            salesOrgCodesList=new List<String>();
            salesOrgCodesList.add(servicestate.currentrequest.pricingrequest.Sales_Org_Code__c);
            system.debug(salesOrgCodesList);
        }
        //<TJ20141215> Added fix for issue raised in Spinco
        User prof=new User();
        prof=[Select profile.name from user where id=:UserInfo.getUserId()]; 
        //<AV20150105>-Production issue- Added sales admin permission set in if condition       
        if(!String.isBlank(ogItems.isViewCustomerPrices) && ogItems.isViewCustomerPrices == 'true' && (prof.profile.name!='Price Approval-Price Requester' || ogitems.salesAdminPermissionSetFlag))
        {
            system.debug('#%^@#%^@admin'+prof.profile.name);
            List<ERP_Sales_Prices_SAP__c> priceAvailableCustomersList = new List<ERP_Sales_Prices_SAP__c>();
            OrgGroup__c BUName=new OrgGroup__c();
            BUName = [SELECT Business__c from OrgGroup__c where id=:ogitems.selectedBU];
            //Added price holder filter to return all customer prices
            priceAvailableCustomersList= [SELECT Sold_To_Code__c FROM ERP_Sales_Prices_SAP__c where BU__c=:BUName.Business__c and Customer_Specific__c = true and isPriceHolder__c =true Limit 40000];
            List<String> priceAvailableSoldToList= new List<String>();
            for(ERP_Sales_Prices_SAP__c customer:priceAvailableCustomersList)
                priceAvailableSoldToList.add(customer.Sold_To_Code__c);
            // <BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            allCustomersList = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,
                                Distribution_Channel_Code__c,Distribution_channel__c, Division__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
                                Zip_Postal_Code__c FROM ERP_Customer__c WHERE Sales_Org_Code__c
                                IN :salesOrgCodesList AND Distribution_Channel_Code__c IN :distChannelCodesList AND Division_Code__c IN
                                :divisionCodesList AND Account_Group_Code__c IN ('Z001','ZSUB') AND Deletion_Flag__c = false AND
                                RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND Customer_Code__c IN: priceAvailableSoldToList   LIMIT 751];//<SS20230110> Added ZSUB account group code

        }
        else
        {
            system.debug('#&#&^$*^req'+prof.profile.name);
            List<ERP_Customer__c> cus = new List<ERP_Customer__c>();
            Set<String> custCode = new Set<String>();

            for(PADummycustomerMapping__c dupcustmr: PADummycustomerMapping__c.getAll().values())
            {
                String buName = '';             
                if(!String.isBlank(ogItems.selectedBU) && ogItems.buIdToNameMap != null && ogItems.buIdToNameMap.containsKey(ogItems.selectedBU)
                        && ogItems.buIdToNameMap.get(ogItems.selectedBU) != null)
                    buName = ogItems.buIdToNameMap.get(ogItems.selectedBU);
                if(dupcustmr.Business__c == buName)
                    custCode.add(dupcustmr.Customer_Code__c);
            }
            if(custCode.size() > 0)
            {
                List<Organizational_Group_User__c> srOGUList = new List<Organizational_Group_User__c>();
                List<String> soCodeList = new List<String>();
                srOGUList = [SELECT OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c = :onBehalfOfUser];
                system.debug('srOGUList345'+srOGUList+'size'+srOGUList.size());
                for(Organizational_Group_User__c o : srOGUList)
                    soCodeList.add(o.OrgGroup__r.ERP_Sales_Org_Code__c);

                system.debug('custCode:'+custCode);
                system.debug('soCodeList:'+soCodeList);
                system.debug('salesOrgCodesList:'+salesOrgCodesList);
                system.debug('distChannelCodesList:'+distChannelCodesList);
                system.debug('distChannelCodesList:'+divisionCodesList);
                //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
                /*cus = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,Distribution_channel__c, Division__c,
                       Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
                       Zip_Postal_Code__c FROM ERP_Customer__c WHERE Id IN (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c = 'ZU' AND User__c = :onBehalfOfUser
                       AND Related_ERP_Customer__c=NULL) AND Customer_Code__c IN :custCode AND RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c IN :soCodeList AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN
                       :distChannelCodesList AND Division_Code__c IN :divisionCodesList];*/
                cus = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,Distribution_channel__c, Division__c,
                       Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
                       Zip_Postal_Code__c FROM ERP_Customer__c WHERE Customer_Code__c IN :custCode AND RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c IN :soCodeList AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN
                       :distChannelCodesList AND Division_Code__c IN :divisionCodesList];
                system.debug('soCodeList345'+soCodeList+'size'+soCodeList.size());
                system.debug('cus345'+cus+'size'+cus.size());
            }           
            // <BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            system.debug('allCustomersList1 :'+allCustomersList);
            system.debug('onBehalfOfUser 1 %%'+onBehalfOfUser);
            system.debug('custCode:'+custCode);
                //system.debug('soCodeList:'+soCodeList);
                system.debug('salesOrgCodesList:'+salesOrgCodesList);
                system.debug('distChannelCodesList:'+distChannelCodesList);
                system.debug('distChannelCodesList:'+divisionCodesList);
            allCustomersList.clear();
            allCustomersList = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,
                                Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,Distribution_channel__c, Division__c,
                                Zip_Postal_Code__c FROM ERP_Customer__c WHERE Id IN
                                (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c = 'ZU' AND User__c = :onBehalfOfUser
                                AND Related_ERP_Customer__c=NULL) AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN
                                :distChannelCodesList AND Division_Code__c IN :divisionCodesList AND Account_Group_Code__c IN ('Z001','ZSUB') AND
                                Deletion_Flag__c = false AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                                LIMIT 751];
            allCustomersList.addAll(cus);
            system.debug('allCustomersList2 :'+allCustomersList);
            system.debug('allCustomersList345'+allCustomersList+'size'+allCustomersList.size());
            system.debug('onBehalfOfUser 2 %%'+onBehalfOfUser);

        }

        //For DEMO - START -  To Be Removed 
        /*  ERP_Customer__c dummyForDemo = new ERP_Customer__c();
        dummyForDemo.Customer_Code__c = '96105569';
        dummyForDemo.Name = 'ESSEX GERMANY GMBH';
        dummyForDemo.Sales_Org_Code__c = 'F431';
        dummyForDemo.Sales_Org__c = 'iTEC DUP LUX 3431';
        dummyForDemo.Distribution_Channel_Code__c = '10'; 
        dummyForDemo.Division_Code__c = '02';
        dummyForDemo.Country__c = 'Germany';
        dummyForDemo.City__c = 'BAD AROLSEN';
        dummyForDemo.Street__c = 'KORBACHER STRASSE 6';
        allCustomersList.add(dummyForDemo);
        //For DEMO - END -  To Be Removed*/

        Map<String,List<ERP_Customer__c>> custCodeSalesAreaMap = new Map<String,List<ERP_Customer__c>>();       
        for(ERP_Customer__c cust : allCustomersList)
        {
            if(custCodeSalesAreaMap.containsKey(cust.Customer_Code__c))
            {
                List<ERP_Customer__c> l1 = custCodeSalesAreaMap.get(cust.Customer_Code__c);
                l1.add(cust);
                custCodeSalesAreaMap.put(cust.Customer_Code__c,l1);
            }
            else
            {
                List<ERP_Customer__c> l1 = new List<ERP_Customer__c>();
                l1.add(cust);
                custCodeSalesAreaMap.put(cust.Customer_Code__c,l1);
            }
        }

        for(String customer : custCodeSalesAreaMap.keySet())
        {           
            listOfSalesArea = new list<SelectOption>();

            PAWrapper wrap = new PAWrapper();
            wrap.isSelected = false;
            wrap.sobjectRecord = custCodeSalesAreaMap.get(customer)[0];
            wrap.stringMap.put('salesArea','');
            wrap.stringMap.put('SASel','');

            List<ERP_Customer__c> multipleCust = custCodeSalesAreaMap.get(customer);
            //<SP20140505> START
            if(multipleCust.size() > 1)
            {
                for(ERP_Customer__c X:multipleCust)
                {
                    //String salesArea = X.Sales_Org_Code__c + '-' + X.Distribution_Channel_Code__c + '-' + X.Division_Code__c ;
                    String salesArea = X.Sales_Org_Code__c + '-' + X.Sales_Org__c + '-' + X.Division_Code__c ;
                    String salesAreaVal = X.Sales_Org_Code__c + '-' + X.Distribution_Channel_Code__c + '-' + X.Division_Code__c ;
                    listOfSalesArea.add(new selectoption(salesAreaVal,salesArea));
                }
                listOfSalesArea.add(0,new selectoption('--Select--','--Select--'));
                wrap.stringMap.put('salesArea','Multiple');
                wrap.stringMapSelectoptions.put('salesArea',listOfSalesArea);
            }
            else
            {
                //String salesArea = (String)wrap.sobjectRecord.get('Sales_Org_Code__c') + '-' + (String)wrap.sobjectRecord.get('Distribution_Channel_Code__c') + '-' +  (String)wrap.sobjectRecord.get('Division_Code__c');
                String salesArea = (String)wrap.sobjectRecord.get('Sales_Org_Code__c') + '-' + (String)wrap.sobjectRecord.get('Sales_Org__c') + '-' +  (String)wrap.sobjectRecord.get('Division_Code__c');
                String salesAreaVal = (String)wrap.sobjectRecord.get('Sales_Org_Code__c') + '-' + (String)wrap.sobjectRecord.get('Distribution_Channel_Code__c') + '-' +  (String)wrap.sobjectRecord.get('Division_Code__c');
                listOfSalesArea.add(new selectoption(salesAreaVal,salesArea));
                wrap.stringMapSelectoptions.put('salesArea',listOfSalesArea);
                wrap.stringMap.put('salesArea',salesArea);
            }
            //<SP20140505> END
            if(freqCustomerSet.contains(customer) && allCustomersWrapList.size() > 0)
            {
                wrap.isSelected = true;
                allCustomersWrapList.add(0,wrap);
            }
            else
            {
                if(freqCustomerSet.contains(customer))
                    wrap.isSelected = true;
                allCustomersWrapList.add(wrap);
            }
        }
        //<SP20140605> START
        if(allCustomersWrapList.size() > 750)
        {
            allCustomersWrapList.remove(750);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Customer list returns more than 750 records,Please use Filters to refine search.'); 
            ApexPages.addMessage(myMsg);
        }
        system.debug('custWrapList567'+allCustomersWrapList);
        //<SP20140605> END
    }                            
    //<PP20140324> END

    //<SP20140527> START
    private List<PAWrapper> searchcustomerMethod()
    {
        system.debug('**** searchSoldToCode ** --'+searchSoldToCode);
        system.debug('**** searchSoldTo  ** --'+searchSoldTo);
        system.debug('**** searchCity ** --'+searchCity);
        system.debug('**** searchCountry ** --'+searchCountry);
        system.debug('checking the sales admin issues');
        Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
        List<String> accGrpCode = new List<String>();
        accGrpCode.add('Z001');
        accGrpCode.add('ZSUB');//<SS20230110> Added ZSUB account group code
        System.Debug('**Acc grp' + accGrpCode);
        string partnerFnCode = 'ZU';
        list<string> filterList = new list<string>();
        map<string,string> filterMap = new map<string,string>();
        List<ERP_Customer__c> allCustomersList = new List<ERP_Customer__c>();
        allCustomersWrapList = new List<PAWrapper>();
        String onBehalfOfUser;

        if(String.isBlank(ogItems.selectedUser))
        {
            onBehalfOfUser = UserInfo.getUserId();
        }
        else
        {
            onBehalfOfUser = ogItems.selectedUser;
        }

        if(string.isBlank(searchSoldToCode))
        {
            searchSoldToCode='';
        }
        else
        {
            filterList.add('searchSoldToCode');
            filterMap.put('searchSoldToCode','Customer_Code__c like \''+ String.escapeSingleQuotes(searchSoldToCode.trim()) + '%\'  ');
        }

        if(string.isBlank(searchSoldTo))
        {
            searchSoldTo='';
        }
        else
        {
            filterList.add('searchSoldTo');
            filterMap.put('searchSoldTo','Name like \''+ String.escapeSingleQuotes(searchSoldTo.trim()) + '%\'  ');
        }

        if(string.isBlank(searchCity))
        {
            searchCity='';
        }
        else
        {
            filterList.add('searchCity');
            filterMap.put('searchCity','City__c like \''+ String.escapeSingleQuotes(searchCity.trim()) + '%\'  ');
        }

        if(string.isBlank(searchCountry))
        {
            searchCountry='';
        }
        else
        {
            filterList.add('searchCountry');
            filterMap.put('searchCountry','Country__c like \''+ String.escapeSingleQuotes(searchCountry.trim()) + '%\'  ');
        }


        if(filterList.size() == 0)
        {
            if(!String.isBlank(ogItems.isViewCustomerPrices) && ogItems.isViewCustomerPrices == 'true')
            {
                allCustomersList = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,
                                    Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
                                    Zip_Postal_Code__c FROM ERP_Customer__c WHERE Sales_Org_Code__c
                                    IN :salesOrgCodesList AND Distribution_Channel_Code__c IN :distChannelCodesList AND Division_Code__c IN
                                    :divisionCodesList AND Account_Group_Code__c IN ('Z001','ZSUB') AND Deletion_Flag__c = false AND
                                    RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false LIMIT 751];//<SS20230110> Added ZSUB account group code
            }
            else
            {
                List<ERP_Customer__c> cus = new List<ERP_Customer__c>();
                Set<String> custCode = new Set<String>();

                for(PADummycustomerMapping__c dupcustmr: PADummycustomerMapping__c.getAll().values())
                {
                    String buName = '';             
                    if(!String.isBlank(ogItems.selectedBU) && ogItems.buIdToNameMap != null && ogItems.buIdToNameMap.containsKey(ogItems.selectedBU)
                            && ogItems.buIdToNameMap.get(ogItems.selectedBU) != null)
                        buName = ogItems.buIdToNameMap.get(ogItems.selectedBU);
                    if(dupcustmr.Business__c == buName)
                        custCode.add(dupcustmr.Customer_Code__c);
                }
                system.debug('custCode is'+custCode);

                system.debug('salesOrgCodesList is'+salesOrgCodesList);
                system.debug('divisionCodesList is'+divisionCodesList);
                if(custCode.size() > 0)
                {
                    List<Organizational_Group_User__c> srOGUList = new List<Organizational_Group_User__c>();
                    List<String> soCodeList = new List<String>();
                    srOGUList = [SELECT OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c = :onBehalfOfUser];
                    for(Organizational_Group_User__c o : srOGUList)
                        soCodeList.add(o.OrgGroup__r.ERP_Sales_Org_Code__c);
                    system.debug('soCodeList is'+soCodeList);
                    //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
                    cus = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,
                           Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
                           Zip_Postal_Code__c FROM ERP_Customer__c WHERE Customer_Code__c IN :custCode AND
                           RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c IN :soCodeList AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN
                           :distChannelCodesList AND Division_Code__c IN :divisionCodesList];
                }
                system.debug('cus is'+cus);
                allCustomersList = [SELECT Id,Name,Customer_Code__c,Country__c,Street__c,City__c,
                                    Distribution_Channel_Code__c,Division_Code__c ,Sales_Org_Code__c,Sales_Org__c,State_Province__c,Sales_Office__c,
                                    Zip_Postal_Code__c FROM ERP_Customer__c WHERE Id IN
                                    (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c = 'ZU' AND User__c = :onBehalfOfUser
                                    AND Related_ERP_Customer__c=NULL) AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN
                                    :distChannelCodesList AND Division_Code__c IN :divisionCodesList AND Account_Group_Code__c IN ('Z001','ZSUB') AND
                                    Deletion_Flag__c = false AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false
                                    LIMIT 751];//<SS20230110> Added ZSUB account group code

                allCustomersList.addAll(cus);
            }
            system.debug('allCustomersList is'+allCustomersList);
        }
        else
        {

            string searchWhereClause=' ';
            string query;

            for(integer i=0;i<filterList.size();i++)
            {   
                if(i!=filterList.size()-1)
                    searchWhereClause = searchWhereClause+' '+filterMap.get(filterList[i])+' '+' AND ';
                else
                    searchWhereClause = searchWhereClause+' '+filterMap.get(filterList[i]);
            }

            system.debug('*** searchWhereClause -- '+searchWhereClause);
            if(!String.isBlank(ogItems.isViewCustomerPrices) && ogItems.isViewCustomerPrices == 'true')
            {
            // Piyush <PG20191211> Added Customer Group 4 and Customer group 4 Code
                query='select  Name,Customer_Code__c,Country__c,Sales_Office__c,Sales_Office_Code__c ,Street__c,City__c,Distribution_Channel__c,Zip_Postal_Code__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,Sales_Org_Code__c ,PO_Box__c,Sales_Org__c,State_Province__c,State__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Group_4__c,Customer_Group_4_Code__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Price_List_Type__c,Price_List_Type_Code__c,Currency_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c  from ERP_Customer__c WHERE Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN :distChannelCodesList AND Division_Code__c IN :divisionCodesList AND Account_Group_Code__c IN :accGrpCode AND Deletion_Flag__c = false AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND '+searchWhereClause+' LIMIT 751';                                                                         
                allCustomersList =database.query(query);
            }
            else
            {
                List<ERP_Customer__c> cus = new List<ERP_Customer__c>();
                Set<String> custCode = new Set<String>();

                for(PADummycustomerMapping__c dupcustmr: PADummycustomerMapping__c.getAll().values())
                {
                    String buName = '';             
                    if(!String.isBlank(ogItems.selectedBU) && ogItems.buIdToNameMap != null && ogItems.buIdToNameMap.containsKey(ogItems.selectedBU)
                            && ogItems.buIdToNameMap.get(ogItems.selectedBU) != null)
                        buName = ogItems.buIdToNameMap.get(ogItems.selectedBU);
                    if(dupcustmr.Business__c == buName)
                        custCode.add(dupcustmr.Customer_Code__c);
                }
                if(custCode.size() > 0)
                {
                    List<Organizational_Group_User__c> srOGUList = new List<Organizational_Group_User__c>();
                    List<String> soCodeList = new List<String>();
                    srOGUList = [SELECT OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE Related_User__c = :onBehalfOfUser];
                    for(Organizational_Group_User__c o : srOGUList)
                        soCodeList.add(o.OrgGroup__r.ERP_Sales_Org_Code__c);
                    //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
                    // Piyush <PG20191211> Added Customer Group 4 and Customer group 4 Code
                    String q1 = 'select  Name,Customer_Code__c,Country__c,Sales_Office__c,Sales_Office_Code__c ,Street__c,City__c,Distribution_Channel__c,Zip_Postal_Code__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,Sales_Org_Code__c ,PO_Box__c,Sales_Org__c,State_Province__c,State__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Group_4_Code__c,Customer_Group_4__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Price_List_Type__c,Price_List_Type_Code__c,Currency_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c  FROM ERP_Customer__c WHERE Customer_Code__c IN :custCode AND RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c IN :soCodeList AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN :distChannelCodesList AND Division_Code__c IN :divisionCodesList AND ' +searchWhereClause;
                    cus = database.query(q1);
                }

                query='select  Name,Customer_Code__c,Country__c,Sales_Office__c,Sales_Office_Code__c ,Street__c,City__c,Distribution_Channel__c,Zip_Postal_Code__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,Sales_Org_Code__c ,PO_Box__c,Sales_Org__c,State_Province__c,State__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Group_4__c,Customer_Group_4_Code__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Price_List_Type__c,Price_List_Type_Code__c,Currency_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c  FROM ERP_Customer__c WHERE Id IN (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c = :partnerFnCode AND User__c = :onBehalfOfUser AND Related_ERP_Customer__c=NULL) AND Sales_Org_Code__c IN :salesOrgCodesList AND Distribution_Channel_Code__c IN :distChannelCodesList AND Division_Code__c IN :divisionCodesList AND Account_Group_Code__c IN :accGrpCode AND Deletion_Flag__c = false AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND ' +searchWhereClause+' LIMIT 751';                                                            
                allCustomersList =database.query(query);
                allCustomersList.addAll(cus);
            }
        }
        system.debug('**** allCustomersList ** --'+allCustomersList);
        system.debug('**** allCustomersList size ** --'+allCustomersList.size());

        Map<String,List<ERP_Customer__c>> custCodeSalesAreaMap = new Map<String,List<ERP_Customer__c>>();       
        for(ERP_Customer__c cust : allCustomersList)
        {
            if(custCodeSalesAreaMap.containsKey(cust.Customer_Code__c))
            {
                List<ERP_Customer__c> l1 = custCodeSalesAreaMap.get(cust.Customer_Code__c);
                l1.add(cust);
                custCodeSalesAreaMap.put(cust.Customer_Code__c,l1);
            }
            else
            {
                List<ERP_Customer__c> l1 = new List<ERP_Customer__c>();
                l1.add(cust);
                custCodeSalesAreaMap.put(cust.Customer_Code__c,l1);
            }
        }

        for(String customer : custCodeSalesAreaMap.keySet())
        {           
            listOfSalesArea = new list<SelectOption>();

            PAWrapper wrap = new PAWrapper();
            wrap.isSelected = false;
            wrap.sobjectRecord = custCodeSalesAreaMap.get(customer)[0];
            wrap.stringMap.put('salesArea','');

            List<ERP_Customer__c> multipleCust = custCodeSalesAreaMap.get(customer);

            if(multipleCust.size() > 1)
            {
                for(ERP_Customer__c X:multipleCust)
                {
                    //String salesArea = X.Sales_Org_Code__c + '-' + X.Distribution_Channel_Code__c + '-' + X.Division_Code__c ;
                    String salesArea = X.Sales_Org_Code__c + '-' + X.Sales_Org__c + '-' + X.Division_Code__c ;
                    String salesAreaVal = X.Sales_Org_Code__c + '-' + X.Distribution_Channel_Code__c + '-' + X.Division_Code__c ;
                    listOfSalesArea.add(new selectoption(salesAreaVal,salesArea));
                }
                listOfSalesArea.add(0,new selectoption('--Select--','--Select--'));
                wrap.stringMap.put('salesArea','Multiple');
                wrap.stringMapSelectoptions.put('salesArea',listOfSalesArea);
            }
            else
            {
                //String salesArea = (String)wrap.sobjectRecord.get('Sales_Org_Code__c') + '-' + (String)wrap.sobjectRecord.get('Distribution_Channel_Code__c') + '-' +  (String)wrap.sobjectRecord.get('Division_Code__c');
                String salesArea = (String)wrap.sobjectRecord.get('Sales_Org_Code__c') + '-' + (String)wrap.sobjectRecord.get('Sales_Org__c') + '-' +  (String)wrap.sobjectRecord.get('Division_Code__c');
                String salesAreaVal = (String)wrap.sobjectRecord.get('Sales_Org_Code__c') + '-' + (String)wrap.sobjectRecord.get('Distribution_Channel_Code__c') + '-' +  (String)wrap.sobjectRecord.get('Division_Code__c');
                listOfSalesArea.add(new selectoption(salesAreaVal,salesArea));
                wrap.stringMapSelectoptions.put('salesArea',listOfSalesArea);
                wrap.stringMap.put('salesArea',salesArea);
            }

            if(freqCustomerSet.contains(customer) && allCustomersWrapList.size() > 0)
            {
                wrap.isSelected = true;
                allCustomersWrapList.add(0,wrap);
            }
            else
            {
                if(freqCustomerSet.contains(customer))
                    wrap.isSelected = true;
                allCustomersWrapList.add(wrap);
            }
        }
        //<SP20140605> START
        if(allCustomersWrapList.size() > 750)
        {
            allCustomersWrapList.remove(750);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Customer list returns more than 750 records,Please use Filters to refine search.'); 
            ApexPages.addMessage(myMsg);
        }
        //<SP20140605> END
        system.debug('Checking All Customer Wrap List'+allCustomersWrapList);
        return allCustomersWrapList;

    }
    //<SP20140527> END
}