public class PASoldToSelection implements IPAComponent
{
    /*
     * Name      :   PASoldToSelection
     * Description  :   This class acts as a business component to retrieve the Organizational Group Item details
     * Author      :   Infosys Limited
     * Created Date :   
     *
     * Version    Modified Date    Modified By   Modification
     * -------------------------------------------------------------
     * 1.1        22-Feb-2013        Shiva         Modified the soldToList query(if logged in person is BUAdmin)
     * 1.2        04-March-2013    Bala         Added Order by in sold to country drop down   
     * 1.3        07-Mar-2013        Bala           Commenting version 1.1
     * 1.4        11-Mar-2013        Shiva         Sorting the list by Sold to Name
     * 1.5        02-Jul-2013        Shiva         Adding the code for Dummy Customer(FOC) A693 sales org
     *****************************************************************************************************************
     **********************************************Modification Log***************************************************
<PP20130606>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   06 Jun 2013
Description         :   SIT Issue #3 FIX - Added null check for Id so that additional blank record is not
                        displayed in case of BUs other than Envelopes - APAC ROLLOUT1(1.11)
     ******************************************************************************************************************
<BR20130610>
Last Modified By    :   Brundha Rajkuymar
Last Modified Date  :   10 Jun 2013
Description         :   For BI AP Envelopes D630 sold to code was displayed so changed the to EMEA Envelopes from Envelopes for roll out APAC
     ***********************************************************************************************
<PP20130612>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   12 Jun 2013
Description         :   SIT Issue #75 FIX - Added sorting logic for Sales Org codes list, Distribution Channel codes
                        list,Division codes list - APAC ROLLOUT1(1.12)
     *****************************************************************************************************************
<BB20140404>
Last Modified By    :  Bisnupriya Budek
Last Modified Date  :  04 Arpril 2014  
Description         :  CAPITAL PROJECT - Added the Query to populate the org group item in case the the Sales area is change while cloning
     *****************************************************************************************************************
<BB20140508>
Last Modified By    :  Bisnupriya Budek
Last Modified Date  :  08 May 2014  
Description         :  CAPITAL PROJECT - Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
     *****************************************************************************************************************
<TJ20140519>
 Last Modified By   :   Tarun
 Last Modified Date :   19 May 2014
 Description        :   Label for Help Link.
 
 <SS20230110>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   10 Jan 2023
 Description        :   Added logic to included ZSUB customers in customer list - CRM-2022-08-0227
     *****************************************************************************************************************/
    public boolean displayPopUpWindow{get;set;}
    public boolean displayTableOnSearch{get;set;}

    //variables used for filter the records.
    public string filter_soldTo {get;set;}
    public String filter_soldToCode {get;set;}
    public String filter_country{get;set;}
    public String filter_state {get;set;}
    public String filter_street{get;set;}
    public String filter_city{get;set;}
    public string filter_salesOffice {get;set;}
    public string filter_salesDistrict {get;set;}
    public string filter_salesOrg {get;set;}
    public string filter_distChannel {get;set;}
    public string filter_division {get;set;}
    public string filter_campaign {get;set;}
    public string filter_documentCurrency {get;set;}
    public string filter_state1 {get;set;}
    public string soldToCodeFromPage {get;set;}
    public string BUSelectedFromPage {get;set;}

    public list<string> listOfFilters {get;set;} //TODO
    public map<string,string> mapOfFilters {get;set;} //TODO
    public string whereClause {get;set;} //TODO
    public string query {get;set;} //TODO
    public list<ERP_Customer__c> record {get;set;} 
    public string selectedUser{get;set;} 
    private list<string> listOfOG {get;set;}
    public Organizational_Group_Item__c orgGroupItem{
        set;
        get;}
    public boolean reqClassFlag {
        set;get;}
    public List<String> reqClassList{
        set{

        }get;}
    public Integer dispCount {
        get 
        {
            if(dispCount==null)
                return 0;
            else
                return dispCount;
        }      
        set;
    }

    //variables for finding sales area.
    public list<SelectOption> listOfSalesOrg {get;set;}
    public list<SelectOption> listOfDivision {get;set;}
    public list<SelectOption> listOfDistChannel {get;set;}
    public list<SelectOption> listOfCountry {get;set;}
    public static final Id Customer_RTYPE_Id = Rtype.getIdByDevName('ERP_Customer__c','ERP_Customer_Extended_Data');
    //added on 26th feb
    public String desiredAction{get;set;}
    public String currentPageLabel{get;set;}
    public String newPageLabel{get;set;}
    //for dummy customer code
    private string buName;

    //<TJ20140519>
    public String label{get;set;}

    //Constructors
    public PASoldToSelection()
    {
        displayPopUpWindow=false;
        displayTableOnSearch=false;
        system.debug('Inside soldTo constructor');
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
        return displayPopUpWindowMethod();
    }

    public PageReference displayPopUpWindow1()
    {
        return displayPopUpWindowMethod();
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
        return searchCustomer();
    }
    /*
     * Author      : 
     * Method Name  :   returnData
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference returnData() {
        system.debug('@@@in return data:');

        /**List<Organizational_Group_Item__c>  buOrgGrouplist = [SELECT Id,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,ERP_Pricing_Procedure__c,Business__r.Name, Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Customer_Request_Reasons__c,Non_Standard_Payment_terms__c,
                                         Latest_Valid_From_Offset_Non_Cust_Spec__c,Rebate_Agreement__c ,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c, 
                                         Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Type__c,Pricing_Task_Reasons__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                                         Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Landing_Cost__c,
                                         Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                                         Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests
                                          FROM Organizational_Group_Item__c 
                                         WHERE Business__c = :BUSelectedFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :filter_salesOrg
                                           AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :filter_distChannel AND
                                           OrgGroup__r.ERP_Division_Code__c = :filter_division];**/


        return selectedCustomer();
    }

    /*
     * Author      : 
     * Method Name  :   closeWindow
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference closeWindow()
    {
        return closepopup();
    }
    /*
     * Author      : 
     * Method Name  :   action
     * Parameters   :   String,String,String
     * Return type  :   String
     * Description  :   
     */  
    public PageReference action()
    {
        if(desiredAction.containsIgnoreCase('populateDcDDiv'))
        {
            populateDcDiv();

        }
        return null;
    }
    /*
     * Author      : 
     * Method Name  :   getName
     * Parameters   :   No parameters
     * Return type  :   String
     * Description  :   
     */
    public String getName()
    {
        return null;
    }  
    //Methods

    /*
     * Author      : Anand Darshi
     * Method Name : displayPopUpWindowMethod
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method display the PopUp window once lookup image is clicked.
     */
    private PageReference displayPopUpWindowMethod()
    {   System.debug('****in displayPopUpWindowMethod'+displayPopUpWindow);
    displayPopUpWindow = true;
    system.debug('&& Inside soldTo Method'+soldToCodeFromPage);
    // SalesOrg, dist. chennal, divison drop down population  
    listOfOG = new list<string>();
    set<SelectOption> setOfSalesOrg= new set<SelectOption>(); 
    listOfSalesOrg= new list<SelectOption>();
    listOfCountry= new list<SelectOption>();
    set<SelectOption> setOfCountry= new set<SelectOption>(); 
    record= new list<ERP_Customer__c>();
    list<ERP_Customer__c> listOfCustomer= new list<ERP_Customer__c>();
    List<Organizational_Group_User__c> ogUsersSA = new List<Organizational_Group_User__c>(); 
    if(BUSelectedFromPage !=null)
    {
        system.debug('++'+BUSelectedFromPage);
        ogUsersSA = [SELECT OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel__c,
                     OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division__c,OrgGroup__r.ERP_Division_Code__c,
                     Organizational_Group_Item__r.Business__r.Business__c FROM Organizational_Group_User__c
                     WHERE Related_User__c =:UserInfo.getUserId() AND (Organizational_Group_Item__r.Business__c=:BUSelectedFromPage OR Organizational_Group_Item__r.Business__r.Business__c=:BUSelectedFromPage)];
        buName = ogUsersSA[0].Organizational_Group_Item__r.Business__r.Business__c;
    }
    else
    {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'BU Not Selected'); 
        ApexPages.addMessage(myMsg);    
    }   
    //List of country-- picklist    
    List<Org_Group_ERP_Key__c> orgERPKeyCountry = new List<Org_Group_ERP_Key__c>();
    //Added order by - Bala 4th March
    orgERPKeyCountry = [SELECT id, ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE Organizational_Group_Item__r.Business__c = :BUSelectedFromPage AND ERP_Cus_Mat_Compt_Key__r.Type__c = 'Country' 
            order by ERP_Cus_Mat_Compt_Key__r.Name__c];
    system.debug('list of ids'+orgERPKeyCountry);    
    for(Org_Group_ERP_Key__c X:orgERPKeyCountry)
    {
        setOfCountry.add(new selectoption(X.ERP_Cus_Mat_Compt_Key__r.Name__c,X.ERP_Cus_Mat_Compt_Key__r.Name__c));
    }   
    listOfCountry.addall(setOfCountry);
    listOfCountry.sort();   
    if(listOfCountry.size()>1)
    {
        listOfCountry.add(0,new selectoption('','--Select--'));
    }
    else
    {
        if(orgERPKeyCountry!=null && orgERPKeyCountry.size()!=0)
        {
            filter_country=orgERPKeyCountry[0].ERP_Cus_Mat_Compt_Key__r.Name__c;
        }
    }

    for(Organizational_Group_User__c X:ogUsersSA)
    {
        listOfOG.add(X.OrgGroup__c);
        setOfSalesOrg.add(new selectoption(X.OrgGroup__r.ERP_Sales_Org_Code__c,X.OrgGroup__r.ERP_Sales_Org_Code__c));
    }
    listOfSalesOrg.addAll(setOfSalesOrg);
    //<PP20130612> - Sort logic for Sales Org Codes List
    listOfSalesOrg.sort();  
    if(listOfSalesOrg.size()>1)
    {
        listOfSalesOrg.add(0,new selectoption('','--Select--'));
    }
    else
    {   
        if(ogUsersSA!=null && ogUsersSA.size()!=0)
        {
            filter_salesOrg=ogUsersSA[0].OrgGroup__r.ERP_Sales_Org_Code__c;
        }
        populateDcDiv();    
    }   
    //windowpopup code starts from here
    if(soldToCodeFromPage=='' || soldToCodeFromPage==null)
    {
        displayPopUpWindow=true;
        system.debug('&&Inside if'+displayPopUpWindow);
        displayTableOnSearch=false;
    }
    else
    {   
        displayPopUpWindow=true;
        filter_soldToCode=soldToCodeFromPage;  
        if(listOfDivision!=null && listOfDivision.size()==1)
        {
            filter_division = listOfDivision[0].getValue();
        }
        if(listOfDistChannel!=null && listOfDistChannel.size()==1)
        {
            filter_distChannel = listOfDistChannel[0].getValue();
        }
        //Checking from ERP Relation ship and fetching from ERP Customer - bala
        if(String.isBlank(selectedUser))
        {
            selectedUser = UserInfo.getUserId();
        }
        //version 1.3 start commenting 
        //added by shiva version 1.9 start
        List<ERP_Customer__c> soldToList = new List<ERP_Customer__c>();
        //1.10 bala changing parter function to partner func code . and Related Customer = null
        soldToList = [SELECT id,customer_code__c,Name FROM ERP_Customer__c WHERE Id IN
                      (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c='ZU'
                      AND User__c=:selectedUser AND Related_ERP_Customer__c=NULL) AND sales_Org_code__c=:filter_salesOrg AND Distribution_Channel_Code__c=:filter_distChannel
                      AND Division_code__c=:filter_division AND customer_code__c like :filter_soldToCode+'%'
                      AND Account_Group_Code__c IN ('Z001', 'ZSUB')];//<SS20230110> Added ZSUB account group code


        /**
            adding SAP Cluster condition -neeha
         */
        List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                          Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Request_Class__c FROM Organizational_Group_Item__c
                                                          WHERE Business__c =:BUSelectedFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :filter_salesOrg
                                                          AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :filter_distChannel AND
                                                          OrgGroup__r.ERP_Division_Code__c = :filter_division];   
        String sppId;
        if(buOrgGroup!=null && buOrgGroup.size()!=0)
        {
            sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
        }
        //for dummy sold to
        List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];

        String sourceCluster;
        if(sppList!=null && sppList.size()!=0)
        {
            sourceCluster=sppList.get(0).SAP_Cluster__c;
        }
        //Adding the Dummy sold to code into the list in case of Envelopes - bala 23/4/2013 1.5
        //Adding the Dummy sold to code into the list for A693 and D693 Sales org and modified the query for D630- Shiva 07/02/2013 Version-1.5
        //<BR20130610>

        ERP_Customer__c cus = new ERP_Customer__c();
        if(!String.isBlank(BUSelectedFromPage) && filter_salesOrg=='D630' && !String.isBlank(buName) && buName.containsIgnoreCase('BI EMEA Envelopes'))
        {
            //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            cus = [select Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c,Account_Group__c,
                   Distribution_Channel__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,PO_Box__c,
                   Sales_Org__c,Sales_Org_Code__c ,State_Province__c,State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
                   Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                   Customer_Price_Group__c  ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c FROM ERP_Customer__c
                   where Name like 'FREE OF CHARGE CUST - NOW LUX%' AND RecordTypeId = :Customer_RTYPE_Id];
        }
        else if(!String.isBlank(BUSelectedFromPage) && (filter_salesOrg=='A693' || filter_salesOrg=='D693') && !String.isBlank(buName) && (buName.containsIgnoreCase('BI EMEA Envelopes') || buName.containsIgnoreCase('BI EMEA Surfaces')))
        {
            //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            cus = [select Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c,Account_Group__c,
                   Distribution_Channel__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,PO_Box__c,
                   Sales_Org__c,Sales_Org_Code__c ,State_Province__c,State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
                   Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                   Customer_Price_Group__c  ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c FROM ERP_Customer__c
                   where Customer_Code__c ='97002139' AND RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c=:filter_salesOrg];
        }
        // Version-1.5 End
        //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query                    
        listOfCustomer=[SELECT  Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c,Account_Group__c,
                        Distribution_Channel__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,PO_Box__c,
                        Sales_Org__c,Sales_Org_Code__c ,State_Province__c,State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
                        Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                        Customer_Price_Group__c  ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c
                        FROM ERP_Customer__c WHERE id IN :soldToList AND Deletion_Flag__c!=true AND Source_Cluster__c=:sourceCluster AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false limit 101];
        //<PP20130606> - Ver 1.11 START
        if(cus != null && cus.Id != null)
        {
            listOfCustomer.add(cus);
        }
        //<PP20130606> - Ver 1.11 END                       
        //ver 1.4 start  
        listOfCustomer = PAUtil.sortList(listOfCustomer, 'Name', 'asc');
        //ver 1.4 end 
        System.debug('list of customer'+listOfCustomer);
        //adding deletion flag and source cluster condition-neeha
        soldToList.clear(); 
        if(listOfCustomer.size()>100)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more then 100 records,Please use Filters'); 
            ApexPages.addMessage(myMsg); 
            displayTableOnSearch=false;
        }
        else if(listOfCustomer.size()==0)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
            ApexPages.addMessage(myMsg);
            displayTableOnSearch=false;
        } 
        else
        {
            record.addAll(listOfCustomer);
            displayTableOnSearch=true;
        }
    }
    return null;
    }

    /*
     * Author      : Anand Darshi
     * Method Name : populateDcDiv
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method reterive records based on filter criteria.
     */
    private void populateDcDiv()
    {
        set<SelectOption> setOfDistChannel = new set<SelectOption>();
        set<SelectOption> setOfDivision = new set<SelectOption>();
        listOfDistChannel = new list<SelectOption>();
        listOfDivision = new list<SelectOption>();
        list<OrgGroup__c> listOfPA_Org_DcDiv=new list<OrgGroup__c>();

        listOfPA_Org_DcDiv=[select id,ERP_Sales_Org_Code__c,ERP_Distribution_Channel_Code__c,ERP_Division_Code__c,ERP_Sales_Org__c,ERP_Distribution_Channel__c,ERP_Division__c from OrgGroup__c where id IN:listOfOG AND ERP_Sales_Org_Code__c=:filter_salesOrg];

        for(OrgGroup__c X:listOfPA_Org_DcDiv)
        {
            setOfDistChannel.add(new selectoption(X.ERP_Distribution_Channel_Code__c,X.ERP_Distribution_Channel_Code__c));
            setOfDivision.add(new selectoption(X.ERP_Division_Code__c,X.ERP_Division_Code__c));
        }

        listOfDistChannel.addAll(setOfDistChannel);
        //<PP20130612> - Sort logic for Distribution Channel Codes List
        listOfDistChannel.sort();
        listOfDivision.addAll(setOfDivision);
        //<PP20130612> - Sort logic for Division Codes List
        listOfDivision.sort();

        if(listOfDistChannel.size()>1)
            listOfDistChannel.add(0,new selectoption('','--Select--'));
        if(listOfDivision.size()>1)
            listOfDivision.add(0,new selectoption('','--Select--'));
    }

    /*
     * Author      : Anand Darshi
     * Method Name : searchCustomer
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method reterive records based on filter criteria.
     */
    private PageReference searchCustomer()
    {
        List<ERP_Customer__c> listOfCustomer= new List<ERP_Customer__c>();
        record= new List<ERP_Customer__c>();
        listOfFilters= new List<string>();
        mapOfFilters= new map<string,string>();
        if(filter_soldTo==null || filter_soldTo=='')
        {
            filter_soldTo='';
        }
        else
        {
            listOfFilters.add('filter_soldTo');
            mapOfFilters.put('filter_soldTo','Name like \''+ String.escapeSingleQuotes(filter_soldTo.trim()) + '%\'  ');
        }
        if(filter_soldToCode==null || filter_soldToCode=='')
        {
            filter_soldToCode='';
        }
        else
        {
            listOfFilters.add('filter_soldToCode');
            mapOfFilters.put('filter_soldToCode','Customer_code__c like \''+ String.escapeSingleQuotes(filter_soldToCode.trim())+   '%\'  ');
        }
        if(filter_country==null || filter_country=='' || filter_country=='--Select--')
        {
            filter_country='';
        }
        else
        {
            listOfFilters.add('filter_country');
            mapOfFilters.put('filter_country','Country__c like \''+ String.escapeSingleQuotes(filter_country.trim()) + '%\'  ');
        }
        if(filter_state==null || filter_state=='')
        {
            filter_state='';
        }
        else
        {
            listOfFilters.add('filter_state');
            mapOfFilters.put('filter_state','State_Province__c like \''+ String.escapeSingleQuotes(filter_state.trim()) + '%\'  ');
        }
        if(filter_street==null || filter_street=='')
        {
            filter_street='';
        }
        else
        {
            listOfFilters.add('filter_street');
            mapOfFilters.put('filter_street','Street__c like \''+ String.escapeSingleQuotes(filter_street.trim()) + '%\'  ');
        }
        if(filter_city==null || filter_city=='')
        {
            filter_city='';
        }
        else
        {
            listOfFilters.add('filter_city');
            mapOfFilters.put('filter_city','City__c like \''+ String.escapeSingleQuotes(filter_city.trim()) + '%\'  ');
        }
        if(filter_salesOffice==null || filter_salesOffice=='')
        {
            filter_salesOffice='';
        }
        else
        {
            listOfFilters.add('filter_salesOffice');
            mapOfFilters.put('filter_salesOffice','Sales_Office_Code__c like \''+ String.escapeSingleQuotes(filter_salesOffice.trim()) + '%\'  ');
        }
        if(filter_salesDistrict==null || filter_salesDistrict=='')
        {
            filter_salesDistrict='';
        }
        else
        {
            listOfFilters.add('filter_salesDistrict');
            mapOfFilters.put('filter_salesDistrict','Sales_District_Code__c like \''+ String.escapeSingleQuotes(filter_salesDistrict.trim()) + '%\'  ');
        }
        if(filter_salesOrg==null || filter_salesOrg=='')
        {
            filter_salesOrg='';
        }
        else
        {
            listOfFilters.add('filter_salesOrg');
            mapOfFilters.put('filter_salesOrg','Sales_Org_Code__c like \''+ String.escapeSingleQuotes(filter_salesOrg.trim()) + '%\'  ');
        }
        if(filter_distChannel==null || filter_distChannel=='' )
        {
            filter_distChannel='';
        }
        else
        {
            listOfFilters.add('filter_distChannel');
            mapOfFilters.put('filter_distChannel','Distribution_Channel_Code__c like \''+ String.escapeSingleQuotes(filter_distChannel.trim()) + '%\'  ');
        }
        if(filter_division==null || filter_division=='' )
        {
            filter_division='';
        }
        else
        {
            listOfFilters.add('filter_division');
            mapOfFilters.put('filter_division','Division_Code__c like \''+ String.escapeSingleQuotes(filter_division.trim()) + '%\'  ');
        }
        if(filter_campaign==null || filter_campaign=='' || filter_campaign=='--Select--')
        {
            filter_campaign='';
        }
        else
        {
            listOfFilters.add('filter_campaign');
            mapOfFilters.put('filter_campaign','Campaign__c like \''+ String.escapeSingleQuotes(filter_campaign.trim()) + '%\'  ');
        }
        if(filter_documentCurrency==null || filter_documentCurrency=='' || filter_documentCurrency=='--Select--')
        {
            filter_documentCurrency='';
        }
        else
        {
            listOfFilters.add('filter_documentCurrency');
            mapOfFilters.put('filter_documentCurrency','Document_Currency__c like \''+ String.escapeSingleQuotes(filter_documentCurrency.trim()) + '%\'  ');
        }
        if(filter_state1==null || filter_state1=='' || filter_state1=='--Select--')
        {
            filter_state1='';
        }
        else
        {
            listOfFilters.add('filter_state1');
            mapOfFilters.put('filter_state1','State__c like \''+ String.escapeSingleQuotes(filter_state1.trim()) + '%\'  ');
        }
        //adding SAP Cluster condition -neeha
        System.debug('***BUSelectedFromPage'+BUSelectedFromPage+'filter_salesOrg'+filter_salesOrg+'filter_distChannel'+filter_distChannel+'filter_division'+filter_division);
        List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                          Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c  FROM Organizational_Group_Item__c
                                                          WHERE Business__c =:BUSelectedFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :filter_salesOrg
                                                          AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :filter_distChannel AND
                                                          OrgGroup__r.ERP_Division_Code__c = :filter_division];   
        String sppId;
        if(buOrgGroup!=null && buOrgGroup.size()!=0)
        {
            sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
        }
        List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];

        String sourceCluster;
        if(sppList!=null && sppList.size()!=0)
        {
            sourceCluster=sppList.get(0).SAP_Cluster__c;
        }
        Boolean skiponbehalf = false;
        //adding source cluster end


        System.debug('***sourceCluster'+sourceCluster+'***selectedUser'+selectedUser);
        //added by shiva version 1.9 start
        //<BR20130610>
        List<ERP_Customer__c> soldToList = new List<ERP_Customer__c>();
        ERP_Customer__c cus = new ERP_Customer__c();

        soldToList = [SELECT id,customer_code__c,Name FROM ERP_Customer__c WHERE Id IN
                      (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE User__c=:selectedUser AND Partner_Function_Code__c = 'ZR') AND sales_Org_code__c=:filter_salesOrg AND Distribution_Channel_Code__c=:filter_distChannel
                      AND Division_code__c=:filter_division AND Account_Group_Code__c IN ('Z001', 'ZSUB')];//<SS20230110> Added ZSUB account group code
        if(selectedUser=='' || selectedUser==null)
            soldToList = [SELECT id,customer_code__c,Name FROM ERP_Customer__c WHERE sales_Org_code__c=:filter_salesOrg AND Distribution_Channel_Code__c=:filter_distChannel
            AND Division_code__c=:filter_division AND Account_Group_Code__c IN ('Z001', 'ZSUB')];//<SS20230110> Added ZSUB account group code
        else                  
            soldToList = [SELECT id,customer_code__c,Name FROM ERP_Customer__c WHERE Id IN
                          (SELECT ERP_Customer__c FROM ERP_Relationship__c WHERE Partner_Function_code__c='ZU'
                          AND User__c=:selectedUser AND Related_ERP_Customer__c=NULL) AND sales_Org_code__c=:filter_salesOrg AND Distribution_Channel_Code__c=:filter_distChannel
                          AND Division_code__c=:filter_division AND Account_Group_Code__c IN ('Z001', 'ZSUB')];//<SS20230110> Added ZSUB account group code

        if(String.isBlank(selectedUser))
        {
            selectedUser = UserInfo.getUserId();
        }

        //Adding the Dummy sold to code into the list for A693 and D693 Sales org and modified the query for D630- Shiva 07/02/2013 Version-1.5
        if(!String.isBlank(BUSelectedFromPage) && filter_salesOrg=='D630' && !String.isBlank(buName) && buName.containsIgnoreCase('BI EMEA Envelopes'))
        {
            //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            //<TJ20140711> Added condition for sold to code
            cus = [select Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c,Account_Group__c,
                   Distribution_Channel__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,PO_Box__c,
                   Sales_Org__c,Sales_Org_Code__c ,State_Province__c,State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
                   Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                   Customer_Price_Group__c  ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c
                   FROM ERP_Customer__c
                   where Name like 'FREE OF CHARGE CUST - NOW LUX%' AND RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c=:filter_salesOrg];
        }
        else if(!String.isBlank(BUSelectedFromPage) && (filter_salesOrg=='A693' || filter_salesOrg=='D693') && !String.isBlank(buName) && (buName.containsIgnoreCase('BI EMEA Envelopes') || buName.containsIgnoreCase('BI EMEA Surfaces')))
        {
            //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            cus = [select Id,Name,Customer_Code__c,Country__c,Street__c,Sales_Office__c,City__c,Account_Group__c,
                   Distribution_Channel__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,PO_Box__c,
                   Sales_Org__c,Sales_Org_Code__c ,State_Province__c,State__c,Zip_Postal_Code__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,
                   Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,
                   Customer_Price_Group__c  ,Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c FROM ERP_Customer__c
                   where Customer_Code__c ='97002139' AND RecordTypeId = :Customer_RTYPE_Id AND Sales_Org_Code__c=:filter_salesOrg];
        }
        //Ver 1.5 End

        if(listOfFilters.size()==0)
        {
            //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query 
            listOfCustomer =[select  Name,Customer_Code__c,Country__c,Sales_Office__c,Street__c,City__c,Distribution_Channel__c,Zip_Postal_Code__c,Distribution_Channel_Code__c,
                             Division__c,Division_Code__c ,Sales_Org_Code__c ,PO_Box__c,Sales_Org__c,State_Province__c,State__c,
                             Terms_of_Payment_Code__c,Terms_of_Payment__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,
                             Price_List_Type_Code__c,Price_List_Type__c,Sales_Office_Code__c,Currency_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c
                             from ERP_Customer__c WHERE Id IN:soldToList AND Source_Cluster__c =:sourceCluster AND Deletion_Flag__c!=true AND RecordTypeId = :Customer_RTYPE_Id AND Customer_General_Data__r.Deletion_Flag__c = false limit 101];

            //<PP20130606> - Ver 1.11 START
            if(cus != null && cus.Id != null)
            {
                listOfCustomer.add(cus);
            }
            //<PP20130606> - Ver 1.11 END
            //ver 1.4 start                 
            listOfCustomer = PAUtil.sortList(listOfCustomer, 'Name', 'asc');
            //ver 1.4 end
            //added deletion flag condition--neeha
            if(listOfCustomer.size()>100 )
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more then 100 records,Please use Filters'); 
                ApexPages.addMessage(myMsg); 
                displayTableOnSearch=false;
            }
            else
            { 
                record.addAll(listOfCustomer);
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
            //commented - bala 
            // commented - bala end
            //get all the Customers who are to be shown
            //then get the ids of them to query and show .. 
            //<BB20140508> Added Customer_Order_Block_Code__c,Customer_Order_Block__c in the query
            List<String> soldToID = new List<String>();
            system.debug('soldToList'+soldToList);
            for(ERP_Customer__c soldTo: soldToList)
            {
                //soldToID.add('\''+(string)soldTo.id+'\'');
                soldToID.add((string)soldTo.id);
            }
            query='select  Name,Customer_Code__c,Country__c,Sales_Office__c,Sales_Office_Code__c ,Street__c,City__c,Distribution_Channel__c,Zip_Postal_Code__c,Distribution_Channel_Code__c,Division__c,Division_Code__c ,Sales_Org_Code__c ,PO_Box__c,Sales_Org__c,State_Province__c,State__c,Terms_of_Payment_Code__c,Terms_of_Payment__c,Incoterms_1__c,Incoterms_1_Code__c,Incoterms_2__c,Customer_Price_Group_Code__c,Customer_Price_Group__c,Price_List_Type__c,Price_List_Type_Code__c,Currency_Code__c,Customer_Order_Block_Code__c,Customer_Order_Block__c  from ERP_Customer__c'  +whereClause +' AND id IN :soldToID AND Deletion_Flag__c=false  AND Source_Cluster__c=\''+sourceCluster+'\' AND RecordTypeId = \''+Customer_RTYPE_Id+'\' AND Customer_General_Data__r.Deletion_Flag__c = false limit 101';                                                                         
            system.debug(query);
            listOfCustomer =database.query(query);
            //<PP20130606> - Ver 1.11 START
            if(cus != null && cus.Id != null)
            {
                listOfCustomer.add(cus);
            }
            //<PP20130606> - Ver 1.11 END
            //ver 1.4 start
            listOfCustomer = PAUtil.sortList(listOfCustomer, 'Name', 'asc');
            //ver 1.4 end
            System.debug('****listOfCustomer '+listOfCustomer);
            System.debug('****listOfCustomer size '+listOfCustomer.size());
            if(listOfCustomer.size()>100) 
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more then 100 records,Please use Filters.'); 
                ApexPages.addMessage(myMsg);
                displayTableOnSearch=false; 
            }
            else if(listOfCustomer.size()==0)
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
                ApexPages.addMessage(myMsg);
                displayTableOnSearch=false;
            } 
            else
            {
                record.addAll(listOfCustomer);
                displayTableOnSearch=true; 
                //<BB20140404> $ <AV20140404> Added the Query to populate the org group item in case the the Sales area is change while cloning. START
                List<Organizational_Group_Item__c>  buOrgGrouplist = [SELECT Id,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,ERP_Pricing_Procedure__c,Business__r.Name, Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Customer_Request_Reasons__c,Non_Standard_Payment_terms__c,
                                                                      Latest_Valid_From_Offset_Non_Cust_Spec__c,Rebate_Agreement__c ,Retroactive_Limit__c,ERP_Currency__c,ERP_UoM__c, 
                                                                      Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Type__c,Pricing_Task_Reasons__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Latest_Valid_To_Offset_Non_Cust_Spec__c,
                                                                      Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Landing_Cost__c,
                                                                      Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                                                                      Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c
                                                                      FROM Organizational_Group_Item__c 
                                                                      WHERE Business__c = :BUSelectedFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :listOfCustomer.get(0).Sales_Org_Code__c
                                                                      AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :listOfCustomer.get(0).Distribution_Channel_Code__c AND
                                                                      OrgGroup__r.ERP_Division_Code__c = :listOfCustomer.get(0).Division_Code__c];

                system.debug('****new buOrgGrouplisT:'+buOrgGrouplist.size());
                system.debug('****changed sales area detail:'+listOfCustomer.get(0).Sales_Org_Code__c+','+listOfCustomer.get(0).Distribution_Channel_Code__c+','+listOfCustomer.get(0).Division_Code__c); 

                orgGroupItem=buOrgGrouplist.get(0);
                System.debug('*****orgGroupItem.Id'+orgGroupItem.Id);
                reqClassFlag=buOrgGrouplist.get(0).Enable_Request_Class__c;
                //<BB20140404> $ <AV20140404> END
            }
        }
        return null; 
    } 

    /*
     * Author      : Anand Darshi
     * Method Name : selectedCustomer
     * Parameters  : No parameters
     * Return type : void
     * Description : This Method closes the window after selecting the Customer and display message if Customer belongs to more then one sales area.
     */
    public Boolean changeSAFlag {get;set;}

    private PageReference selectedCustomer()
    {
        displayPopUpWindow=false;
        return null;
    }

    /*
     * Author      : Anand Darshi
     * Method Name : closeWindow
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method closes the popUp window when cross button is clicked.
     */
    private PageReference closePopUp() 
    {
        displayPopUpWindow=false;
        filter_soldTo=null;
        filter_soldToCode=null;
        filter_country=null;
        filter_state=null;
        filter_street=null;
        filter_city=null;
        filter_salesOffice=null;
        filter_salesDistrict=null;
        filter_salesOrg=null;
        filter_distChannel=null;
        filter_division=null;
        filter_campaign=null;
        filter_documentCurrency=null;
        filter_state1=null;
        listOfDivision=null;
        listOfDistChannel=null;
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
}