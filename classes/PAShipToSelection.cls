/*   Ver.                              Developer                                       Changes                                               Dependencies
--------------------------------------------------------------------------------------------------------------------------*/
//    1.1                                       Priyanka                            Added code for Price ref. Partner                     None

/****************************************** Modification Log *****************************************************
<VR20130509>
Last Modified By  :     Vinoth Rajapandian
Last Modified Date      :     09 may 2013 
Description             :     1)To Query Customer Hierarchy records(1.2)
 *****************************************************************************************************************
<TJ20140519>
 Last Modified By   :   Tarun
 Last Modified Date :   19 May 2014
 Description        :   Label for Help Link.
 *****************************************************************************************************************/
public without sharing class PAShipToSelection implements IPAComponent
{
    public List<ERP_Customer__c> shipToCustomersList{get;set;}
    public boolean shipToLookUp{get;set;}   
    public string shipToCustomerCode {get;set;}
    public string shipToMassiveCustomerCode {get;set;}
    public string shipToCode {get;set;}
    //<VR20130509> Ver 1.2 VR 2013-05-09 APAC Rollout1-Adding extra variable for Customer Hierarchy lookup
    public string customerHierarchyFilterCode {get;set;}    
    public string customer{get;set;}
    public string city{get;set;}
    public string country {get;set;}   
    public string business {get;set;}
    //Ver 1.1
    //String to hold the type of component - Ship To/Price Ref. Partner
    public String componentType {get;set;}
    //String to hold the 
    public String salesOrgCode {get;set;}
    //String to hold the 
    public String dcCode {get;set;}
    //String to hold the 
    public String divisionCode {get;set;}
    public static final Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
    //<VR20130509> Ver 1.2 VR 2013-05-09 APAC Rollout1-Adding extra variable to display currency in Customer Hierarchy lookup
    public List<SelectOption> listOfCountry
    {
        get
        {
            if(componentType=='CustomerHierarchy')
            {
                //List of country-- picklist
                List<Org_Group_ERP_Key__c> orgERPKeyCountry = new List<Org_Group_ERP_Key__c>();
                //Added order by - Bala 4th March
                orgERPKeyCountry = [SELECT id, ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c 
                                    FROM Org_Group_ERP_Key__c 
                                    WHERE Organizational_Group_Item__r.Business__c = :business 
                                    AND Organizational_Group_Item__r.OrgGroup__r.ERP_Sales_Org_Code__c=:salesOrgCode
                                    AND Organizational_Group_Item__r.OrgGroup__r.ERP_Distribution_Channel_Code__c=:dcCode
                                    AND Organizational_Group_Item__r.OrgGroup__r.ERP_Division_Code__c=:divisionCode
                                    AND ERP_Cus_Mat_Compt_Key__r.Type__c = 'Country' 
                                    order by ERP_Cus_Mat_Compt_Key__r.Name__c];
                system.debug('list of ids'+orgERPKeyCountry);
                List<SelectOption> countrySelectList = new List<SelectOption>();
                for(Org_Group_ERP_Key__c X:orgERPKeyCountry)
                {
                    countrySelectList.add(new selectoption(X.ERP_Cus_Mat_Compt_Key__r.Name__c,X.ERP_Cus_Mat_Compt_Key__r.Name__c));
                }     
                return countrySelectList;
            }
            return null;
        }set;}

    //<TJ20140519>
    public String label{get;set;}
    //constructor
    public PAShipToSelection()
    {
        shipToCustomersList=new List<ERP_Customer__c>();
        shipToLookUp = false;
    } 
    //<TJ20150506>
    public String salesRepName{get;set;}
    public list<string> shipToIds = new List<string>();
    public Integer noOfRecords{get; set;}
    public Integer size{get;set;}    
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 25;
                string queryString = 'SELECT Id,Customer_Code__c,Name,Country__c,State_Province__c,City__c,Street__c,Distribution_Channel__c,Division__c, Sales_Org_Code__c,Distribution_Channel_Code__c,Sales_Org__c,Division_Code__c,Sales_Office_Code__c,Sales_Office__c FROM ERP_Customer__c WHERE Id IN :shipToIds AND Sales_Org_Code__c = :salesOrgCode AND Distribution_Channel_Code__c = :dcCode AND Division_Code__c = :divisionCode AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND Deletion_Flag__c = false';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }
    
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
  
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
        }
        set;
    }
  
    public void first() {
        setCon.first();
        shipToCustomersList=returnpartners();
    }
  
    public void last() {
        setCon.last();
        shipToCustomersList=returnpartners();
    }
  
    public void previous() {
        setCon.previous();
        shipToCustomersList=returnpartners();
    }
  
    public void next() {
        setCon.next();
        shipToCustomersList=returnpartners();
        
    }
    //<TJ20150506> - End
    /*
     * Author      : 
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
     * Author      : 
     * Method Name  :   displayPopUpWindowMethod
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference displayPopUpWindow()
    {

        return displayShipTo();
    }
    private boolean displayBoolean = true;
    // Auto Pop up flag
    public boolean enablePopUpBoolean 
    {
        get
        {
            if(enablePopUpBoolean == null) 
            {  
                enablePopUpBoolean = false;
            }

            return enablePopUpBoolean;
        }
        set
        {
            enablePopUpBoolean = value;
            system.debug('enablePopUpBoolean'+enablePopUpBoolean);
            if(enablePopUpBoolean == true && displayBoolean == true)
            {
                displayPopUpWindow();
            }
        }
    }   
    /*
     * Author      : 
     * Method Name  :   searchCustomer
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference dosearch()
    {
        //Ver 1.2 VR 2013-05-09 APAC Rollout1-Adding Code for Customer Hierarchy
        System.debug('****customerHierarchyFilterCode '+customerHierarchyFilterCode);       
        string query = '';
        if(componentType != null && componentType.equalsIgnoreCase('CustomerHierarchy')){
            query = 'SELECT Id,Customer_Code__c,Name,Country__c,State_Province__c,City__c,Street__c,Distribution_Channel__c,Division__c,Sales_Org_Code__c,Distribution_Channel_Code__c,Sales_Org__c,Division_Code__c,Sales_Office_Code__c,Sales_Office__c FROM ERP_Customer__c WHERE (Account_Group_Code__c = \'Z012\' OR Account_Group_Code__c = \'0012\') AND Sales_Org_Code__c = :salesOrgCode AND Distribution_Channel_Code__c = :dcCode AND Division_Code__c = :divisionCode ';

            if(!string.isBlank(customerHierarchyFilterCode))
            {
                query+='AND Customer_code__c like \''+ String.escapeSingleQuotes(customerHierarchyFilterCode.trim())+ '%\'  ';
            }
            if(!string.isBlank(customer))
            {
                query+='AND Name like \''+ String.escapeSingleQuotes(customer.trim())+ '%\'  ';
            }           
            if(!string.isBlank(city))
            {
                query+='AND City__c like \''+ String.escapeSingleQuotes(city.trim())+ '%\'  ';
            }
            if(!string.isBlank(country) && country!='--Select--')
            {
                query+='AND Country__c like \''+ String.escapeSingleQuotes(country.trim())+ '%\'  ';
            }
        }else if(componentType != null && componentType.equalsIgnoreCase('PriceRefPartner')){
            query = 'SELECT Id,Customer_Code__c,Name,Country__c,State_Province__c,City__c,Street__c,Distribution_Channel__c,Division__c,Sales_Org_Code__c,Distribution_Channel_Code__c,Sales_Org__c,Division_Code__c,Sales_Office_Code__c,Sales_Office__c FROM ERP_Customer__c WHERE (Account_Group_Code__c = \'ZPRC\') AND Sales_Org_Code__c = :salesOrgCode AND Distribution_Channel_Code__c = :dcCode AND Division_Code__c = :divisionCode AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND Deletion_Flag__c = false ';

            if(!string.isBlank(customerHierarchyFilterCode))
            {
                query+='AND Customer_code__c like \''+ String.escapeSingleQuotes(customerHierarchyFilterCode.trim())+ '%\'  ';
            }           
            if(!string.isBlank(customer))
            {
                query+='AND Name like \''+ String.escapeSingleQuotes(customer.trim())+ '%\'  ';
            }
            if(!string.isBlank(city))
            {
                query+='AND City__c like \''+ String.escapeSingleQuotes(city.trim())+ '%\'  ';
            }
            query+='limit 200';
        }
        shipToCustomersList = new List<ERP_Customer__c>();
        shipToCustomersList = database.query(query);
        if(shipToCustomersList!=null && shipToCustomersList.size()==0)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
            ApexPages.addMessage(myMsg);
        }
        return null;
    }
    /*
     * Author      : 
     * Method Name  :   returnData
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference returnData()
    {
        system.debug('shipToCode is '+shipToCode);
        return shipToDisplaySelectedClose();
    }

    /*
     * Author      : 
     * Method Name  :   closeWindow
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public  PageReference closeWindow()
    {
        return shipToDisplayClose();
    }
    /*
     * Author      :
     * Method Name : displayShipTo
     * Parameters  : None
     * Return type : PageReference
     * Description : 
     */
     //<TJ20150506>
    private PageReference displayShipTo() 
    {
        shipToLookUp=true;
        displayBoolean = false;
        List<ERP_Relationship__c> shipToList = new List<ERP_Relationship__c>();     
        System.debug('***componentType'+componentType);
        if(!String.isBlank(shipToMassiveCustomerCode))
            shipToCustomerCode = shipToMassiveCustomerCode;
        shipToCustomersList=new List<ERP_Customer__c>();
        System.debug('shipToCustomerCode:'+shipToCustomerCode); 
        //Ver 1.1 START
        //<GT201401106> Added limit to remove the list limit exception      
        if(componentType != null && componentType.equalsIgnoreCase('PriceRefPartner'))
        {
            if(string.isBlank(shipToCode))
            {
                shipToCustomersList = [SELECT Id,Customer_Code__c,Name,Country__c,State_Province__c,City__c,Street__c,Distribution_Channel__c,Division__c,
                                       Sales_Org_Code__c,Distribution_Channel_Code__c,Sales_Org__c,Division_Code__c,Sales_Office_Code__c,Sales_Office__c 
                                       FROM ERP_Customer__c WHERE Account_Group_Code__c = 'ZPRC' AND Sales_Org_Code__c = :salesOrgCode AND Distribution_Channel_Code__c = :dcCode AND Division_Code__c = :divisionCode AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND Deletion_Flag__c = false limit 200];
            }
            else
            {
                shipToCustomersList = [SELECT Id,Customer_Code__c,Name,Country__c,State_Province__c,City__c,Street__c,Distribution_Channel__c,Division__c,
                                       Sales_Org_Code__c,Distribution_Channel_Code__c,Sales_Org__c,Division_Code__c,Sales_Office_Code__c,Sales_Office__c 
                                       FROM ERP_Customer__c WHERE Account_Group_Code__c = 'ZPRC'  AND Sales_Org_Code__c = :salesOrgCode AND Distribution_Channel_Code__c = :dcCode AND Division_Code__c = :divisionCode AND Customer_Code__c LIKE :shipToCode+'%' AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false AND Deletion_Flag__c = false limit 200];

            }
            //Ver 1.1 END
        }
        else if(!String.IsBlank(componentType) && componentType.equalsIgnoreCase('EndUser'))
        {
            shipToList=fetchPartners(new List<String>{'ZH','ZQ'},shipToCode,shipToCustomerCode);            
            for(ERP_Relationship__c X:shipToList)
            {
                shipToIds.add(X.Related_ERP_Customer__c);
            }
            system.debug('\n\n\n shipToIds '+shipToIds+' '+salesOrgCode+' '+dcCode+' '+divisionCode+' '+Customer_RTYPE_Id);
            shipToCustomersList=returnpartners();

        }
        //Ver 1.2 VR 2013-05-09 APAC Rollout1-Adding Code for Customer Hierarchy
        else if(!String.IsBlank(componentType) && componentType.equalsIgnoreCase('ComPartner'))
        {
            System.debug('****shipToCustomerCode'+shipToCustomerCode);
            shipToList=fetchPartners(new List<String>{'ZS'},shipToCode,shipToCustomerCode);         
            for(ERP_Relationship__c X:shipToList)
            {
                shipToIds.add(X.Related_ERP_Customer__c);
            }
            shipToCustomersList=returnpartners();
        }
        else if(!String.IsBlank(componentType) && componentType.equalsIgnoreCase('Partner ZF'))
        {
            shipToList=fetchPartners(new List<String>{'ZF'},shipToCode,shipToCustomerCode);         
            for(ERP_Relationship__c X:shipToList)
            {
                shipToIds.add(X.Related_ERP_Customer__c);
            }
            shipToCustomersList=returnpartners();
        }
        else if(!String.IsBlank(componentType) && componentType.equalsIgnoreCase('Payer'))
        {
            system.debug('\n\n\n shipToCode '+shipToCode + ' '+ shipToCustomerCode);
            shipToList=fetchPartners(new List<String>{'RG'},shipToCode,shipToCustomerCode);         
            system.debug('\n\n\n shipToList '+shipToList);
            for(ERP_Relationship__c X:shipToList)
            {
                shipToIds.add(X.Related_ERP_Customer__c);
            }
            shipToCustomersList=returnpartners();
        }
        else if(componentType!='CustomerHierarchy')
        {
            System.debug('****shipToCustomerCode'+shipToCustomerCode);
            shipToList=fetchPartners(new List<String>{'WE'},shipToCode,shipToCustomerCode);
            for(ERP_Relationship__c X:shipToList)
            {
                shipToIds.add(X.Related_ERP_Customer__c);               
            }
            shipToCustomersList=returnpartners();            
        }
        /*else if(componentType=='CustomerHierarchy')
        {
            dosearch();
        }*/

        if(shipToCustomersList!=null && shipToCustomersList.size()==0)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
            ApexPages.addMessage(myMsg);
        }
        if(shipToCustomersList==null)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
            ApexPages.addMessage(myMsg);
        }
        return null;
    }
     //<TJ20150506> End
    /*
     * Author      : 
     * Method Name : assignedToDisplayClose
     * Parameters  : None
     * Return type : PageReference
     * Description : Used to close the Assigned To Pop Up
     */
    private PageReference shipToDisplayClose() 
    {
        shipToLookUp=false;
        shipToCustomersList.clear();
        customerHierarchyFilterCode='';
        customer='';
        city='';
        country='';
        return null;
    }

    private PageReference shipToDisplaySelectedClose()
    {
        shipToLookUp = false;
        shipToCustomersList=new List<ERP_Customer__c>();
        return null;
    }

    //<TJ20140519>
    public PageReference helpLink()
    {
        PAHelpLinks__c link;
        link = PAHelpLinks__c.getInstance(label);
        system.debug('**Link '+link.Help_Link__c);
        PageReference pref=new PageReference(link.Help_Link__c);
        pref.setRedirect(false);
        system.debug('**PREF '+pref);
        return pref;
    }
    //<TJ20150506> Start
    public List<ERP_Relationship__c> fetchPartners(List<String> pfCode, String shipTo,String shipToCustCode)
    {       system.debug('pfCode '+pfCode);
      system.debug('shipTo '+shipTo);
      system.debug('shipToCustCode '+shipToCustCode);
    
        List<ERP_Relationship__c> shipTocodesList = new List<ERP_Relationship__c>();
        String query='SELECT Id,ERP_Customer__c,Related_ERP_Customer__c,Name__c,Partner_Code__c,Partner_Function__c,Partner_Function_Code__c FROM ERP_Relationship__c WHERE Partner_Function_Code__c IN :pfCode AND ';
        if(shipToCustCode!=null)
        {
            query=query+'ERP_Customer__r.Customer_Code__c =:shipToCustCode';
            if(!string.isBlank(shipTo))
            {
                shipTo=shipTo+'%';
                query=query+' AND Related_ERP_Customer__r.Customer_Code__c LIKE :shipTo';                   
            }
        }
        else
        {
            List<ERP_Relationship__c> customerList=new List<ERP_Relationship__c>();         
            customerList=[Select ERP_Customer__r.Customer_Code__c From ERP_Relationship__c where Partner_Function_Code__c = 'ZU' and User__r.name = :salesRepName];
            List<String> customerCodeList = new List<String>();
            for(ERP_Relationship__c rel:customerList)
                customerCodeList.add(rel.ERP_Customer__r.Customer_Code__c);
            query=query+'ERP_Customer__r.Customer_Code__c IN :customerCodeList';
            if(!string.isBlank(shipTo))
            {
                shipTo=shipTo+'%';
                query=query+' AND Related_ERP_Customer__r.Customer_Code__c LIKE :shipTo';               
            }
        }
      system.debug('query '+query);
     
        shipTocodesList=database.query(query);
      system.debug('shipTocodesList '+shipTocodesList);
        return shipTocodesList; 
    }
    public list<erp_customer__c> returnpartners()
    {
        List<ERP_Customer__c> shipToCustomersList = new List<ERP_Customer__c>();
        for(ERP_Customer__c a : (List<ERP_Customer__c>)setCon.getRecords())
            shipToCustomersList.add(a);
        return shipToCustomersList;
    }
    //<TJ20150506> End
}