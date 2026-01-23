/*
 * Name        :   PAOrganizationalGroupItems
 * Description  :   This class acts as a business component to retrieve the Organizational Group Item details
 * Author         :   Infosys Limited
 * Created Date :   16-01-2013
 *
 * Version       Modified Date         Modified By       Modification
 * ----------------------------------------------------------------------------------------
 * 1.1                15-Feb-2013                Bala                 Added isBUAdmin(to chk if logged in person is BUAdmin)
 * 1.2                26-Feb-2013                Utkarsh              Added isRequester(to chk if logged in person is Requester) 
 * 1.3                28-Feb-2013                Priyanka             Changed sObjectList to sObjectRecord in wrapper
 * 1.4                04-Mar-2013                Bala                 Added PriceMaster required Methods wrt new Architecture
 * 1.5                05-Mar-2013                Neeharika            Added sorted condition for CPG
 * 1.6                05-Mar-2013                Bala                 Added code for MDM
 * 1.7                07-Mar-2013                Bala                 Reverted userName=null and changed references of Util_Sort to PAUtil
 * 1.8                12-Mar-2013                Bala                 Added flag variable to display Project Section
 * 1.9                13-Mar-2013                Priyanka             Added sorting logic for MPG and CPG according to Name
 * 1.10               01-Sep-2014                Priyanka R           Added logic to display Sales Org column in the user report page
 * 1.11               11-Sep-2014                Priyanka R           Added logic to dispaly public groups in user report
 * 1.12               11-Dec-2019                Piyush G             Added logic to display Customer Group 4
 * 1.13               27-Jul-2020                Piyush G             Added logic to display Distributor Code.
 * 1.14               11-Jan-2022                Shantanu Sharma      Added logic to display External ERP ID on VF page based on SourceCluster.
 * 1.15               26-Aug-2022                Shantanu Sharma      Added logic to poupulate Sales Order Item fileds value.
 * 1.16               26-Aug-2022                Shantanu Sharma      Added logic to poupulate retroactive value based on BU and Sales Area combination.
 ***********************************************Modification Log************************************************
<PP20130424>
Last Modified By     :      Priyanka Pillala
Last Modified Date   :      24 Apr 2013
Description          :      Added Display_Standardized_Rate__c in query of Organizational Group Item
                                         - APAC ROLLOUT1(2.0)
 *****************************************************************************************************************
<BR20130424>
Last Modified By     :      Brundha Rajkumar
Last Modified Date   :      24 Apr 2013
Description          :      Added Attachments_on_Customer_Prices__c in query of Organizational Group Item
                                         - APAC ROLLOUT1(2.1)
 ****************************************************************************************************************
<BB20130626>
Last Modified By     :      Bisnupriya Budek
Last Modified Date   :      26 Jun 2013
Description          :      Added Standardized_Currency__c,Standardized_UoM__c in query of Organizational Group Item
                                         - APAC ROLLOUT2(3.0)
 *****************************************************************************************************************
<PP20130711>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   11 July 2013
Description         :   1)Added 'Enable_Request_Class__c','Request_Class__c' fields to Organizational Group Item
                                                queries - APAC ROLLOUT2(3.1)
                                         2)Added List for displaying Request Class picklist values on request page - APAC ROLLOUT2(3.2)
 **********************************************************************************************************************
  <BR20130625>
Last Modified By    :   Brundha Rajkumar
Last Modified Date  :   25 June 2013
Description         :   1)Added 'Pricing_Exception__c' fields to Organizational Group Item
                                                queries - APAC ROLLOUT2(3.3)
                                         2)Added List for displaying Pricing exception picklist values on request page - APAC ROLLOUT2(3.4)
 *****************************************************************************************************************
<BB20130726>
Last Modified By    :   Bisnupriya Budek
Last Modified Date  :   26 July 2013
Description         :   Added logic for new Key Field Incoterms. - ROLLOUT2(3.5) 
 ***********************************************************************************************************************
<NS20130821>
Last Modified By    :   Neeharika
Last Modified Date  :   21 Aug 2013
Description         :   1)Added 'Landing_Cost__c' fields to queries
 ***********************************************************************************************************************
<PP20131022>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   22 October 2013
Description         :   Added logic for fetching Terms of Payment - ROLLOUT2
 ***********************************************************************************************************************
<PP20131030>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   30 October 2013
Description         :   Sorting of BU Names - ROLLOUT2
 *****************************************************************************************************************
<VR20131108>
Last Modified By    :   Vinoth Rajapandian
Last Modified Date  :   08 November 2013
Description         :   DTT Rollout Issue - Payment terms not getting saved
 ***********************************************************************************************************************
<PP20131206>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   6 December 2013
Description         :   Non-customer specific reasons not mandatory - ROLLOUT2
 **********************************************************************************************************************
<PP20140220>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   20 February 2014
Description         :   CAPITAL PROJECT - Customer Prices list views for CSRs
 **********************************************************************************************************************
<PP20140317>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   17 March 2014
Description         :   CAPITAL PROJECT - Show count of Requests on Home Pgae beside respective links
 **********************************************************************************************************************
<AV20140408>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   08 April 2014
Description         :   CAPITAL PROJECT - Orggroupitem updation when sold to is changed in clone request.
 *****************************************************************************************************************
<JM20140422>
Last Modified By    :   Jawahar Muthuadaikalam
Last Modified Date  :   22 April 2014
Description         :   CAPITAL PROJECT - Added 'Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                                          Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests' fields to queries.
 *****************************************************************************************************************
<MS20140424>
Last Modified By    :   Mohit Sinha
Last Modified Date  :   24 April 2014
Description         :   Commented integer comparison conditions for Approval_Escalation_Price_Requests on changing field to picklist

 ********************************************************************************************************************
<JM20140513>
Last Modified By    :   Jawahar
Last Modified Date  :   13 April 2014
Description         :   Added Customer_Price_Payment_Terms__c,Customer_Price_Fixed_Date_Payment_Terms__c,Non_Standard_Payment_terms__c fields to queries.
                        Added listSelectedSOT,listSelectedVariant,getAllCurrency,getAllUom,selectedCurrencyValues,selectedUomValues,getListUnselectedSalesOrderType,getListUnselectedVariant list.
 ********************************************************************************************************************
<JM20140515>
Last Modified By    :   Jawahar
Last Modified Date  :   15 April 2014
Description         :   Capture BUAdmin Name.

 ********************************************************************************************************************
<AV20140515>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   15 May 2014
Description         :   Added isVolumeApplicable_c field in query of orggroupitem.

 ********************************************************************************************************************
<TJ20140515>
Last Modified By    :   Tarun
Last Modified Date  :   15 April 2014
Description         :   Changed access specifier for buIdToNameMape to public from private.

 **********************************************************************************************************************
<JM20140527>
Last Modified By    :   Jawahar M
Last Modified Date  :   27 May 2014
Description         :   Added Default_SalesArea_Currency__c,Default_SalesArea_UoM__c field.

 ***********************************************************************************************************************
 <PR20140901>
Last Modified By    :   Priyanka R
Last Modified Date  :   01 Sep 2014
Description         :   Added logic to display Sales Org column in user report page.
 ***********************************************************************************************************************
<PR20140911>
Last Modified By    :   Priyanka R
Last Modified Date  :   11 Sep 2014
Description         :   Added logic to display public groups column in user report page.
 ***********************************************************************************************************************
<PR20140916>
Last Modified By    :   Priyanka R
Last Modified Date  :   11 Sep 2014
Description         :   Added logic of displaying sales org column in user report page.
***********************************************************************************************************************
<PG20191211>
Last Modified By    :   Piyush G
Last Modified Date  :   11 Dec 2019
Description         :   Added logic of displaying Customer Group 4 in Sales Area SetUp.
 ***********************************************************************************************************************
 <PG20202707>
Last Modified By    :   Piyush Gupta
Last Modified Date  :   27 July 2020
Description         :   Added logic for Distributor Code
 ***********************************************************************************************************************
************************************************************************************************************************
  <SS20220111>
Last Modified By    :   Shantanu Sharma
Last Modified Date  :   11 Jan 2022
Description         :   Added logic for SAP Cluster Field

**********************************************************************************************************************
<SS20220826>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   26 Aug 2022
 Description        :   Added logic to populate Sales Order Item and Sales Order Item Code values- CRM-2022-07-0225
 
**********************************************************************************************************************
<SS20230110>
 Last Modified By   :   Shantanu Sharma
 Last Modified Date :   10 Jan 2023
 Description        :   Added logic to poupulate retroactive value based on BU and Sales Area combination- CRM-2022-07-0225
**********************************************************************************************************************
<IS EI-00097608>
 Last Modified By   :   Bharat Dandu
 Last Modified Date :   27 Mar 2023
 Description        :   Added logic to for Account manager association setup utility
***************************************************************************************************************************/

//<JM20140527> - 
public class PAOrganizationalGroupItems implements IPAServiceComponent
{
    // Maintain the flag to identify if the request is End User Rebate
    public Boolean isEndUserRebate{get; set;}
    // Maintain the flag to identify if the rebate requests already exists
    public Boolean rebatesExists{get; set;}
    public Boolean approvedRebatesExists{get; set;}
    // Maintain the flag to identify if the user has End User Rebate Request permission
    public Boolean isEndUserRebateEnabled{get; set;}
    //String to hold the selected BU from the options 
    public String selectedBU {get;set{
        system.debug('setting value in BU'+value);
        selectedBU = value;
    }}
    //String which determines which list of options has to be displayed -- Business or Request Reasons
    public String value {get;set;} 
    //Boolean to determine Approver Permission
    public boolean approverPermissionSetFlag {get;set;}
    //Boolean to determine salesAdmin for OnBehalfOf
    // boolean to dertemine associate account manager
    
    
    public boolean AccountManagerPermissionSetFlag {get;set;}
    public boolean salesAdminPermissionSetFlag {get;set;}
    //added for Global config set up 
    public Organizational_Group_Item__c orgGroupItems {get;set;}
    //created for Global Config
    public OrgGroup__c paOrgGrp {get;set;}  
    public SelectOption[] selectedMG2 { get; set; }
    //selected onBehalfOf User
    public string selectedUser{get;set;}
    //for pop up display
    public Boolean isOnbehalfOf{get;set;}
    //user list 
    public List<User> allSalesReps{get;set;}
    //username  
    public string userName{get;set{userName=value;system.debug('value:'+ value);if(String.isBlank(userName))selectedUser=null;}}
    //for holding errrorMessage-- Global Config
    public string errorMessageDisp{get;set;}
    //boolean for displaying customer currency in dropdown-- global config
    public Boolean customerCurrency {get;set;}
    public String MG2Values { get; set; }
    //Piyush <PG20191211> start
    public String CG4Values{ get; set; }
    //Piyush <PG20191211> end
    //start PriceMaster
    //public List<ERP_Access_Sequence__c> acSqList{get;set;}
    //<PP20140220>
    
    //<GT20150520> START
    public boolean showPRReport
    {
        get
        {
            if(showPRReport == null && (pautil.hasCSRPermissionSet()|| pautil.getProfileOfLoggedInUser().contains('Viewer')))
                return true;
            else
                return false;
        }
        
        set;
    }
    
    public string reportUrl{
        get
        {
            
            return URL.getSalesforceBaseUrl().toExternalForm()+'/'+PA_Report_Links__c.getValues('Request By Status').ReportId__c+'?pv0='+buIdToNameMap.get(selectedBU);
        }
        set;
    }
    //<GT20150520> END
    public String profileNameIsCSR {get;set;}
    public String isViewCustomerPrices {get;set;}
    public String isViewPLPrices {get;set;}
    public string displaySection{get;set;}
    public SelectOption[] allMG2 { get; set; }
    public ERP_Pricing_Condition__c pc{get;set;}
    public transient ERP_Procedure_Conditions__c proCons{get;set;}
    public string pricCond{
        get;
        set{pricCond = value;
        if(!String.isBlank(pricCond)){
            pc = [SELECT Condition_Class__c,Condition_Class_code__c,Price_Types__c,Pricing_Condition__c,Pricing_Condition_Code__c,Pricing_Condition_Description__c,
                  SAP_Application_Id__c,SAP_Client_Id__c,SAP_Condition_Type__c,scale_Base__c,scale_type__c,Check_Scale__c,
                  calculation_type__c FROM ERP_Pricing_Condition__c WHERE Id=:pricCond];
            proCons = [SELECT Sales_Pricing_Procedure_Condition_Config__c
                       FROM ERP_Procedure_Conditions__c where Pricing_Condition__c=:pricCond AND Sales_Pricing_Procedure__c=:pricingProcedureId];
            acSqList = [SELECT id,Sales_Pricing_Procedure__r.Pricing_Procedure__c,
                        Sales_Pricing_Procedure__r.Pricing_Procedure_Description__c,
                        Floor_Pricing_Condition__r.Pricing_Condition_code__c,
                        Floor_Pricing_Condition__r.Pricing_Condition__c,Reference_Pricing_Condition__r.Pricing_Condition_code__c,Reference_Pricing_Condition__r.Pricing_Condition__c,
                        Pricing_Condition__r.Pricing_Condition_code__c,Pricing_Condition__r.Pricing_Condition__c,sequence_Number__c,
                        Pricing_Key_Combination__r.Key_Combination_Code__c,Pricing_Key_Combination__r.Key_Combination__c,
                        Floor_Key_Combination__r.Key_Combination_Code__c,Floor_Key_Combination__r.Key_Combination__c,
                        Reference_Key_Combination__r.key_Combination_code__c,Reference_Key_Combination__r.key_Combination__c,key_Combination__c,isNPCApplicable__c,isPaymentTermsApplicable__c,isVolumeApplicable__c
                        FROM ERP_Access_Sequence__c WHERE pricing_Condition__c=:pricCond
                        AND Sales_Pricing_Procedure__c=:pricingProcedureId
                        order by sequence_number__c asc nulls last];
            System.debug('****acSqList'+acSqList);
        }      
        system.debug('***pricCond IN Setter:'+pricCond);
        }
    }
    public List<ERP_Access_Sequence__c> acSqList{get;set;}
    public List<PAWrapper> paWrapperList{get;set;}
    public Id pricingProcedureId{get;set;}
    //End PriceMaster
    //added - bala
    //1.8 - bala for project section
    public boolean isProjectGroupMember{get;set;}
    public Map<string,boolean> isVisibleMap{get;set;}
    private map<string,string> custMaterialKeyMap {get;set;} 
    //<TJ20140515> Changed buIdToNameMap from private to public
    //<PP20140317>
    public Map<Id,String> buIdToNameMap;
    public Map<String,String> countOfReqToStatusMap {get; set;}


    public list<String> ListSelectedCPGReturn {get;set;}
    public list<String> ListSelectedMPGReturn {get;set;}
    public list<String> ListSelectedPLTReturn {get;set;}
    public list<String> ListSelectedSOReturn {get;set;}
    public list<String> listSelectedSDReturn {get;set;}
    public list<String> ListSelectedCountryReturn {get;set;}
    public list<String> ListSelectedMG1Return {get;set;}
    public list<String> ListSelectedMG3Return {get;set;}
    //Piyush<PG20202707>
    public list<String> ListSelectedDistReturn {get;set;}
    //<SS20220826>
    public list<String> ListSelectedItemReturn{get;set;}
    //<SS20230501>
    public list<String> ListSelectedVCReturn{get;set;}
    public list<String> ListSelectedMG2Return{get;set;}
    public list<String> ListSelectedEMGReturn{get;set;}
    public list<String> ListSelectedPZReturn{get;set;}
    
    public list<String> ListSelectedMG4Return {get;set;}
    //<VR20131011> DTT Rollout
    public list<String> ListSelectedIncotermReturn {get;set;}
    //<PG20191211> Added by Piyush
    public list<String> ListSelectedCustomerGroup4return {get;set;}
    //<BR20130625>
    public list<String> ListSelectedPEReturn {get;set;}
    //<PP20131022>
    public List<String> listSelectedTOPReturn {get; set;}
    //<AV20140606>
    public String loggedInUserName{get;set;}
    //<JM20140513>
    public List<String> listSelectedVariantReturn {get; set;}
    public List<String> listSelectedSOTReturn {get; set;}
    //<<SS20220826>
    //public List<String> listSelectedSOIReturn {get; set;} 
    public List<String> listSelectedComPartnerReturn {get; set;}
    //<MS20150213>
    public List<String> listSelectedMaterialGroup5KeyReturn {get;set;}
    public List<String> listSelectedPlantReturn {get; set;} 
    public List<String> listSelectedSCReturn {get; set;} 
    public List<String> listSelectedDCTReturn {get; set;} 

    public List<String> listSelectedPayerReturn{get;set;}
    public List<String> listSelectedPartnerZFReturn{get;set;}

    public List<String> listSelectedCampaignReturn{get;set;}
    public List<String> listSelectedDocumentCurrencyReturn{get;set;}
    public List<String> listSelectedStateReturn{get;set;}
    //<JM20140422> STARTS
    public SelectOption[] selectedCurrency { get; set; }
    public SelectOption[] selectedCG4 { get; set; }
    public SelectOption[] selectedUom { get; set; }
    public SelectOption[] allCurrency { get; set; }
    // <PG20191211> Added by Piyush
    public SelectOption[] allCG4 { get; set; }
    public SelectOption[] allUomValues { get; set; }
    public String currencyValues { get; set; }
    
    public String uomValues { get; set; }  

    // <SP20140603> - START
    public boolean showPopup 
    {
        get
        {
            if(showPopup == null) 
            {  
                showPopup = false;
            }
            return showPopup;
        }
        set
        {
            showPopup = value;
        }
    }

    public string showLookup {get;set;}
    //<SP20140603> - END

    //<JM20140422> ENDS

    //<PP20130711> STARTS
    public List<SelectOption> requestClassList
    {
        set;
        get
        {
            System.debug('******* in request Class'+orgGroupItems);
            if(orgGroupItems != null && orgGroupItems.Enable_Request_Class__c && orgGroupItems.Request_Class__c != null)
            {
                requestClassList = new List<SelectOption>();
                List<String> reqClsList = orgGroupItems.Request_Class__c.split(';');
                for(String rc : reqClsList)
                {
                    requestClassList.add(new SelectOption(rc,rc));
                }
                if(requestClassList.size() > 1 && !(value == 'SASetup' || value == 'CMSetup'))
                {
                    requestClassList.add(0,new SelectOption('--Select--','--Select--'));
                }
            }
            return requestClassList;
        }
    }
    //<PP20130711> ENDS
    public String selectedRecordId ;
    //added - bala for BU Admin profile check
    public boolean isBUAdmin{get;set;} 
    //Added - Utkarsh for Requester
    public boolean isRequester{get;set;}
    public String getselectedRecordId()
    {
        return this.selectedRecordId;
    }
    //<PP20140418>
    public List<PAWrapper> businessUsersWrapList {get;set;}
    //<JM20140515> Capture Bu Admin Name
    public string BUAdminName {get;set;}

    public void setselectedRecordId(String selRec)
    {
        this.selectedRecordId = selRec;
        if(selRec != null )
        {
            try
            {
                if(value.equalsIgnoreCase('SASetup') || value.equalsIgnoreCase('CMSetup'))
                {
                    system.debug('+++ selRec - '+selRec);
                    //<PP20130424> -- Ver 2.0
                    //<BR20130424> -- Ver 2.1
                    //Bala - 26 April for Non Standard Payment Terms
                    //<BB20130626> -- Ver 3.0
                    //<PP20130711>       START
                    //Brundha Roll out 2 <BR20130625>
                    //<VR20130819> UTQA issue #18 <NS20130821> Added Landing_Cost__c field to query select clause
                    //<PP20140418> - added Default_Prices_Selection__c
                    //<JM20140421> - added Default_Currency__c,Default_Per_UoM_Setup__c,Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_All_other_requests__c
                    //<JM20140513> - added Customer_Price_Payment_Terms__c field,Customer_Price_Fixed_Date_Payment_Terms__c field.
                    //<AV20140515> - Added isVolumeApplicable__c field
                    //<JM20140527> - Added Default_SalesArea_Currency__c,Default_SalesArea_UoM__c field
                    //<MS20140922> - Added Enable MG5 field to query
                    //<KJ20150705> - Added MG2 field to query
                    orgGroupItems=[SELECT Id,ERP_Material_Group2_Code__c,Enable_Variable_Config_Materials__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Description__c,
                                   Business__r.Business__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,Base_UoM__c,
                                   OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c,ERP_Currency__c,Customer_Group_4_Auto_Approval__c,ERP_UoM__c,Customer_Request_Reasons__c, 
                                   Pricing_Task_Type__c,Non_Customer_Permanent_Request_Reasons__c,Non_Standard_Payment_terms__c,
                                   Retroactive_Limit__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                   Latest_Valid_To_Offset_Non_Cust_Spec__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Pricing_Task_Reasons__c,Rebate_Agreement__c,Standardized_Currency__c,Standardized_UoM__c,
                                   Enable_Request_Class__c,Request_Class__c,Landing_Cost__c,Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                                   Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c,
                                   Customer_Price_Payment_Terms__c,Customer_Price_Fixed_Date_Payment_Terms__c,isVolumeApplicable__c,Default_SalesArea_Currency__c,Default_SalesArea_UoM__c,Enable_Material_Group_5__c
                                   FROM Organizational_Group_Item__c WHERE Id =:selRec]; 
                    system.debug('****cheking for cnged orggroup item:'+orgGroupItems+','+orgGroupItems.Enable_Request_Class__c);

                    if(requestClassList != null && requestClassList.size() > 1)
                    {
                        requestClassList.remove(0);
                    }
                    //<PP20130711> END
                }
                else if(value.equalsIgnoreCase('BUSetup'))
                {
                    system.debug('****in else checking for new orggroupitem:'+selRec+','+value);
                    //<JM20140515> Capture Bu Admin Name
                    paOrgGrp = [SELECT Id,Business__c,Owning_Business__c,OwnerId,Regional_Floor_Pricing__c FROM OrgGroup__c WHERE Id =:selRec ];
                    User BUAdminUser = [SELECT Id, Name FROM user WHERE Id =:paOrgGrp.OwnerId];
                    if(BUAdminUser!= null)
                    {
                        BUAdminName = BUAdminUser.Name;
                    }
                    //<JM20140515> ENDS
                    //select name from user__c where Profile=:PAProfilePermissions__c.getInstance('BU Admin').Name__c;
                    //System.debug('BUAdmin Name------'+PAProfilePermissions__c.getInstance('BU Admin').Name__c);
                }

                //<AV20140408>-starts
                //<MS20140922> Added Enable MG5 field to query
                else if(value.equalsIgnoreCase('changeSalesAreaClone'))
                {
                    system.debug('****querying orggroupitem with id from page:'+selRec);
                    orgGroupItems=[SELECT Id,Enable_Variable_Config_Materials__c,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,ERP_Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure__c,ERP_Pricing_Procedure__r.Pricing_Procedure_Description__c,
                                   Business__r.Business__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,Base_UoM__c,
                                   OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c,ERP_Currency__c,Customer_Group_4_Auto_Approval__c,ERP_UoM__c,Customer_Request_Reasons__c, 
                                   Pricing_Task_Type__c,Non_Customer_Permanent_Request_Reasons__c,Non_Standard_Payment_terms__c,
                                   Retroactive_Limit__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                   Latest_Valid_To_Offset_Non_Cust_Spec__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Pricing_Task_Reasons__c,Rebate_Agreement__c,Standardized_Currency__c,Standardized_UoM__c,
                                   Enable_Request_Class__c,Request_Class__c,Landing_Cost__c,Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                                   Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c,Default_SalesArea_Currency__c,Default_SalesArea_UoM__c,Enable_Material_Group_5__c
                                   FROM Organizational_Group_Item__c WHERE Id =:selRec]; 
                    system.debug('****cheking for cnged orggroup item:'+orgGroupItems+','+orgGroupItems.Enable_Request_Class__c);
                }
                //<AV20140408>-ends


            }
            catch(exception e)
            {}
        }
    }
    //Constructor
    public PAOrganizationalGroupItems()
    {
        system.debug('inside PAOrganizationalGroupItems constructor');
        isEndUserRebate = false;
        isEndUserRebateEnabled = false;
        rebatesExists = false;
        approvedRebatesExists = false;
        //isEndUserRebateEnabled = PAUtil.isEndUserRebateEnabled();
        //call to Utils Sort Helper to identify the logged in person's permission
        salesAdminPermissionSetFlag = PAUtil.hasSalesAdminPermissionSet();
        //brundha for approverperm
        Map<string,Boolean> permissionflag = PAUtil.hasApproverPermissionSet();
        approverPermissionSetFlag =permissionflag.get('Price_Approval_Approver');
        //IS EI-00097608 for account manager association 
        AccountManagerPermissionSetFlag=permissionflag.get('P80_Account_Manager_Creator');
        //added - bala 
        string requestedProfileName = PAUtil.getProfileOfLoggedInUser();
        //<AV20140606>
        loggedInUserName = UserInfo.getName();
        //Shiva - For IT Admin profile - Start
        if(requestedProfileName.equalsIgnoreCase(PAProfilePermissions__c.getInstance('BU Admin').Name__c) || requestedProfileName.equalsIgnoreCase(PAProfilePermissions__c.getInstance('IT Admin').Name__c))
        {
            isBUAdmin = true;
        }
        else
            isBUAdmin = false;

        if(requestedProfileName.equalsIgnoreCase(PAProfilePermissions__c.getInstance('Price Requester').Name__c))
        {
            isRequester = true;
        }
        else 
            isRequester = false;
        try
        {
            isVisibleMap = PAUtil.displaySectionAndLinks();
            //<IM20150105>
            isEndUserRebateEnabled = isVisibleMap.get('ManageRebateRequests');
            //<PP20140220>
            profileNameIsCSR = PAUtil.profileNameIsCSR;
            system.debug('*** Map in Comp'+isVisibleMap);
        }//if user not mapped to any public group
        catch(Exception e){} 
        orgGroupItems =new Organizational_Group_Item__c();
        ListSelectedCPGReturn = new list<String>();
        ListSelectedMPGReturn = new list<String>();
        ListSelectedPLTReturn = new list<String>();
        ListSelectedSOReturn = new list<String>();
        listSelectedSDReturn = new list<String>();
        ListSelectedCountryReturn = new list<String>();
        ListSelectedMG1Return = new list<String>();
        ListSelectedMG3Return = new list<String>();
        //Piyush<PG20202707>
        ListSelectedDistReturn = new list<String>();
        //<<SS20220826>
        ListSelectedItemReturn= new list<String>();
        //<SS20230501>
        ListSelectedVCReturn= new list<String>();
        ListSelectedMG2Return= new list<String>();
        ListSelectedEMGReturn= new list<String>();
        ListSelectedPZReturn= new list<String>();
        
        ListSelectedMG4Return = new list<String>();
        //<VR20131011> DTT Rollout
        ListSelectedIncotermReturn  = new list<string>();
        //<PG20191211> Added by Piyush
        ListSelectedCustomerGroup4Return  = new list<string>();
        //<BR20130625>
        ListSelectedPEReturn = new list<String>();
        //<PP20131022>
        listSelectedTOPReturn = new List<String>();
        //<JM20140513>
        listSelectedVariantReturn = new List<String>();
        listSelectedSOTReturn = new List<String>();
        //<KS20220808>
        //listSelectedSOIReturn = new List<String>();
        listSelectedComPartnerReturn  = new List<String>();
        //<MS20150213>
        listSelectedMaterialGroup5KeyReturn = new List<String>();
        listSelectedPlantReturn  = new List<String>();
        listSelectedSCReturn  = new List<String>();
        listSelectedDCTReturn  = new List<String>();
        listSelectedPayerReturn = new List<String>();
        listSelectedPartnerZFReturn = new List<String>();
        listSelectedCampaignReturn = new List<String>();
        listSelectedDocumentCurrencyReturn = new List<String>();
        listSelectedStateReturn = new List<String>();
        selectedMG2 = new List<SelectOption>(); 
        custMaterialKeyMap = new map<string,string>();
        selectedCurrency = new List<SelectOption>();
        //<PG20191211> Added by Piyush
        selectedCG4 = new List<SelectOption>();
        selectedUom=new List<SelectOption>();
        system.debug('***orgGroupItem');
        displaySection = 'procedure';
    }
    //<IM20150113>
    public boolean rebateQuotesCheck(String customerCode, String enduserCode){

        List<Pricing_Request__c> pricingRequestsList = new List<Pricing_Request__c>();
        List<Pricing_Request__c> approvedpricingRequestsList = new List<Pricing_Request__c>();
        String selectedBUName = buIdToNameMap.get(SelectedBU);
        if(isBUAdmin || salesAdminPermissionSetFlag)
        {
            pricingRequestsList = [SELECT id FROM Pricing_Request__c WHERE BU__c = :selectedBUName AND NPC_Status__c != 'Waiting for Net Price' and Is_End_User_Rebate__c=true AND Customer_Specific__c = true AND SoldTo_Code__c = :customerCode AND End_User_Code__c = :enduserCode AND Request_Approval_Status__c != 'Abandoned' Limit 5];
        }
        else
        {    
            pricingRequestsList = [SELECT Id FROM Pricing_Request__c WHERE (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND Is_End_User_Rebate__c=true AND Customer_Specific__c = true AND SoldTo_Code__c = :customerCode AND End_User_Code__c = :enduserCode AND BU__c = :selectedBUName AND NPC_Status__c != 'Waiting for Net Price' AND Request_Approval_Status__c != 'Abandoned' Limit 5];
        }
        if(isBUAdmin || salesAdminPermissionSetFlag)
        {
            approvedpricingRequestsList = [SELECT id FROM Pricing_Request__c WHERE BU__c = :selectedBUName AND NPC_Status__c != 'Waiting for Net Price' AND Request_Approval_Status__c='Approved' and Is_End_User_Rebate__c=true AND Customer_Specific__c = true AND SoldTo_Code__c = :customerCode AND End_User_Code__c = :enduserCode Limit 5];
        }
        else
        {    
            approvedpricingRequestsList = [SELECT Id FROM Pricing_Request__c WHERE (CreatedById = :Userinfo.getUserId() OR On_Behalf_Of__c = :Userinfo.getUserId()) AND Request_Approval_Status__c='Approved' AND Is_End_User_Rebate__c=true AND Customer_Specific__c = true AND SoldTo_Code__c = :customerCode AND End_User_Code__c = :enduserCode AND BU__c = :selectedBUName AND NPC_Status__c != 'Waiting for Net Price' Limit 5];
        }
        if(pricingRequestsList.size()>0) rebatesExists = true;
        if(approvedpricingRequestsList.size()>0) approvedRebatesExists = true;
        system.debug('inside rebateQuotesCheck, rebatesExists is '+rebatesExists);
        return rebatesExists;
    }
    public void ogItemFromRequest(Pricing_Request__c pr)
    {
        system.debug('***orgGroupItem PR'+pr); 
        System.debug('****selected BU'+selectedBU); 
        List<Organizational_Group_Item__c> orgGroupItemsList= new List<Organizational_Group_Item__c>();
        //<PP20130424> -- Ver 2.0
        //<BR20130424> -- Ver 2.1
        //<BB20130626> -- Ver 3.0
        //<PP20130711>
        //Brundha Roll out 2 <BR20130625> <NS20130821> Added Landing_Cost__c field to query select clause
        //<PP20140418>
        //<JM20140421> - added Default_Currency__c,Default_Per_UoM_Setup__c,Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_All_other_requests__c into orgGroupItemsList
        //<JM20140421> - added Customer_Price_Payment_Terms__c,Customer_Price_Fixed_Date_Payment_Terms__c field
        //<AV20140515> - Added isVolumeApplicable__c field
        //<MS20140922> - Added Enable MG5 field
        system.debug('pr.Sales_Org_Code__c is '+pr.Sales_Org_Code__c);
        system.debug('pr.Dist_Channel_Code__c is '+pr.Dist_Channel_Code__c);
        system.debug('pr.Division_Code__c is '+pr.Division_Code__c);
        orgGroupItemsList = [SELECT Enable_Variable_Config_Materials__c,Id,Display_Standardized_Rate__c,Attachments_on_Customer_Prices__c,ERP_Pricing_Procedure__c,Business__r.Name, Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,Customer_Request_Reasons__c,Non_Standard_Payment_terms__c,
                             Latest_Valid_From_Offset_Non_Cust_Spec__c,Rebate_Agreement__c ,Retroactive_Limit__c,ERP_Currency__c,Customer_Group_4_Auto_Approval__c,ERP_UoM__c,/*Customer_Permanent_Request_Reasons__c,*/
                             Non_Customer_Permanent_Request_Reasons__c,Pricing_Task_Type__c,Pricing_Task_Reasons__c,Include_Customer_Currency__c,Project_Request_Reasons__c,Latest_Valid_To_Offset_Non_Cust_Spec__c /*Customer_Interim_Request_Reasons__c*/,
                             Standardized_Currency__c,Standardized_UoM__c,Enable_Request_Class__c,Request_Class__c,Landing_Cost__c,
                             Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,
                             Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c,
                             isPaymentTermsApplicable__c,Customer_Price_Fixed_Date_Payment_Terms__c,Customer_Price_Payment_Terms__c,isVolumeApplicable__c,Default_SalesArea_Currency__c,Default_SalesArea_UoM__c,Enable_Material_Group_5__c,
                             OrgGroup__r.ERP_Sales_Org_Code__c, OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Distribution_Channel_Code__c,Base_UoM__c, 
                             OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c
                             FROM Organizational_Group_Item__c 
                             WHERE Business__c = :selectedBU AND OrgGroup__r.ERP_Sales_Org_Code__c = :pr.Sales_Org_Code__c
                             AND   OrgGroup__r.ERP_Distribution_Channel_Code__c = :pr.Dist_Channel_Code__c AND
                             OrgGroup__r.ERP_Division_Code__c = :pr.Division_Code__c];
        if(orgGroupItemsList!=null && orgGroupItemsList.size()!=0){
            this.orgGroupItems  =   orgGroupItemsList[0];  
        }                 
        system.debug('***orgGroupItem PR method'+orgGroupItems +'landing cost checking'+orgGroupItems.Landing_Cost__c);              

    }

    /*
     * Author        : 
     * Method Name  :   getListOptions
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for BU in the picklist
     */
    public List<SelectOption> getListOptions() 
    {
        List<SelectOption> options = new List<SelectOption>();
        set<SelectOption> optionsSet = new set<SelectOption>();
        String pckcconcattext;
        System.debug('****value'+value);
        //for status links
        if(value==null || value=='Draft' || value=='Rejected'|| value=='Approved' || value=='Submitted' || value=='Recalled'|| value=='Pending' || value=='ApprovalSetup'|| value=='BUSetup' || value=='SASetup' || value=='PCLDisableSelect')
        {
            //List<Organizational_Group_User__c> orgGroupUsersList = new List<Organizational_Group_User__c>();
            List<Organizational_Group_Item__c> orgGroupUsersList = new List<Organizational_Group_Item__c>();
            List<OrgGroup__c> orGroupList = new List<OrgGroup__c>(); 
            // <NS20130821> Added Landing_Cost__c field to query select clause
            orgGroupUsersList = [SELECT Business__r.Id,Business__r.Business__c,Landing_Cost__c FROM Organizational_Group_Item__c WHERE id IN (SELECT Organizational_Group_Item__c FROM Organizational_Group_User__c
                    WHERE Related_User__c =:UserInfo.getUserId())];
            //<PP20131030> START                            
            Set<String> buNamesSet = new Set<String>();
            List<String> buNamesList = new List<String>();
            Map<String,Id> buIdNameMap = new Map<String,Id>();
            //<PP20140317>
            buIdToNameMap = new Map<Id,String>();                     

            for(Organizational_Group_Item__c ogu1 : orgGroupUsersList)
            {
                buNamesSet.add(ogu1.Business__r.Business__c);
                buIdNameMap.put(ogu1.Business__r.Business__c,ogu1.Business__r.Id);
                //<PP20140317>
                buIdToNameMap.put(ogu1.Business__r.Id,ogu1.Business__r.Business__c);
                //optionsSet.add(new SelectOption(ogu1.Business__r.Id,ogu1.Business__r.Business__c));
            }
            buNamesList.addAll(buNamesSet);
            buNamesList.sort();
            for(String s : buNamesList)
            {
                if(s != null && buIdNameMap != null && buIdNameMap.get(s) != null)
                    options.add(new SelectOption(buIdNameMap.get(s),s));
            }             
            //<PP20131030> END
            System.debug('***options'+options+' '+options.size()+buIdNameMap );
        }
        else if(value.equalsIgnoreCase('Import'))
        {
            Schema.DescribeFieldResult fieldResult = Organizational_Group_Item__c.Non_Customer_Permanent_Request_Reasons__c.getDescribe();
            List<Schema.PicklistEntry> pleList= fieldResult.getPicklistValues();
            for(Schema.PicklistEntry ple : pleList)
            {
                options.add(new SelectOption(ple.getLabel(),ple.getValue()));
            }                       
        }       
        if(options.size()>1)
        {
            options.add(0,new SelectOption('--Select--','--Select--'));
        }
        //<PP20140317> START
        if(options.size() == 1)
        {
            system.debug('***business');
            selectedBU = options[0].getValue();
        }
        //if(!String.isBlank(selectedBU) && selectedBU != '--Select')
        //{
        //getCountofRequestsToStatusMap();
        //}
        //<PP20140317> END

        return options;
    }


    /*
     * Author        : 
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
     * Author        : 
     * Method Name  :   getListWrappers
     * Parameters   :   No parameters
     * Return type  :   List<PARelatedList>
     * Description  :   This method implements the interface method 
     */
    public List<PARelatedList> getListWrappers()
    {
        System.debug('******In list wrappers');
        List<Organizational_Group_User__c> ogUserBU = new List<Organizational_Group_User__c>();
        List<Organizational_Group_Item__c> ogItemSASetup = new List<Organizational_Group_Item__c>();
        List<PARelatedList> relatedBUSAList = new List<PARelatedList>();
        List<String> userBU = new List<String>();
        List<String> userBUId = new List<String>();
        List<String> salesOrgList = new List<String>();
        List<String> distChannelList = new List<String>();
        List<String> divList = new List<String>();
        PARelatedList setupGC = new PARelatedList();
        List<OrgGroup__c> paOG = new List<OrgGroup__c>(); 
        //AND OrgGroup__r.RecordType.Name='ERP_Sales_Area' Business
        ogUserBU = [SELECT Id,OrgGroup__r.Business__c,OrgGroup__r.Owning_Business__c,Organizational_Group_Item__r.Business__r.Business__c,Organizational_Group_Item__r.Business__r.Owning_Business__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,
                    OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c  FROM Organizational_Group_User__c WHERE Related_User__c = :UserInfo.getUserId() AND Organizational_Group_Item__r.Business__r.RecordType.Name='Business' AND Organizational_Group_Item__r.Business__c = :selectedBU];
        System.debug('+++ ogUserBU'+ogUserBU);

        for(Organizational_Group_User__c X:ogUserBU)
        {
            userBU.add(X.Organizational_Group_Item__r.Business__r.Business__c);
            userBUId.add(X.Organizational_Group_Item__r.Business__c);
            salesOrgList.add(X.OrgGroup__r.ERP_Sales_Org_Code__c);
            distChannelList.add(X.OrgGroup__r.ERP_Distribution_Channel_Code__c);
            divList.add(X.OrgGroup__r.ERP_Division_Code__c);
        }

        System.debug('+++ userBUId'+userBUId);

        System.debug('+++ value'+value);
        if(value!=null && (value.equalsIgnoreCase('SASetup') || value.equalsIgnoreCase('CMSetup')))
        {
            //<PP20130424> -- Ver 2.0
            // <BR20130424> Ver 2.1 BR 2013-04-24  -- <NS20130821> Added Landing_Cost__c field to query select clause
            //<PP20130711>
            //<BB20130626> -- Ver 3.0
            //<PP20140418>
            //<JM20140421> - added Default_Currency__c,Default_Per_UoM_Setup__c,Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,Approval_Escalation_Pricing_Task__c,Approval_Escalation_All_other_requests__c into ogItemSASetup list

            ogItemSASetup = [SELECT Default_Prices_Selection__c,Default_Currency__c,Default_Per_UoM_Setup__c,Default_Per_Value__c,Default_Value_for_Scaled_Prices__c,
                             Approval_Escalation_Pricing_Task__c,Approval_Escalation_Price_Requests__c,Enable_Request_Class__c,Request_Class__c,Id,Display_Standardized_Rate__c,
                             Attachments_on_Customer_Prices__c,Business__r.Business__c,Business__r.Owning_Business__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Sales_Org__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,Base_UoM__c,
                             OrgGroup__r.ERP_Distribution_Channel__c,OrgGroup__r.ERP_Division_Code__c,OrgGroup__r.ERP_Division__c,Landing_Cost__c,Standardized_Currency__c,Standardized_UoM__c,Default_SalesArea_Currency__c,Default_SalesArea_UoM__c FROM Organizational_Group_Item__c WHERE Business__r.Business__c IN :userBU AND OrgGroup__r.ERP_Sales_Org_Code__c IN :salesOrgList
                             AND OrgGroup__r.ERP_Distribution_Channel_Code__c IN :distChannelList AND OrgGroup__r.ERP_Division_Code__c IN :divList
                             ORDER BY OrgGroup__r.ERP_Sales_Org_Code__c];
            setupGC.sObjectTypeName = Organizational_Group_Item__c.sObjectType.getDescribe().getName().toLowerCase();
            setupGC.wrapperList = new List<PAWrapper>();
            setupGC.keyCombinationColumns = Schema.SObjectType.Organizational_Group_Item__c.fieldSets.getMap().get('SASetupFields').getFields();
            for(Organizational_Group_Item__c X:ogItemSASetup)
            {
                PAWrapper roWrap = new PAWrapper();
                roWrap.isSelected = false;
                roWrap.sObjectRecord = X;
                setupGC.wrapperList.add(roWrap);
            }
        }
        else if(value!=null && (value.equalsIgnoreCase('BUSetup')))
        {
            paOG = [SELECT Id,Business__c,Owning_Business__c FROM OrgGroup__c WHERE Id IN :userBUId];
            system.debug('$$$ oops '+paOG);
            setupGC.sObjectTypeName = OrgGroup__c.sObjectType.getDescribe().getName().toLowerCase();
            setupGC.wrapperList = new List<PAWrapper>();
            setupGC.keyCombinationColumns = Schema.SObjectType.OrgGroup__c.fieldSets.getMap().get('BUSetupFields').getFields();
            for(OrgGroup__c X:paOG)
            {
                PAWrapper roWrap = new PAWrapper();
                roWrap.isSelected = false;
                roWrap.sObjectRecord = X;
                setupGC.wrapperList.add(roWrap);
            }
        }

        relatedBUSAList.add(setupGC);
        system.debug('***## related list '+relatedBUSAList); 
        return relatedBUSAList;
    }   
    /*
     * Author        : 
     * Method Name  :   save
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public  void save()
    {
        system.debug('++ In SAVE method++');
        List<String> splitedValueCode = new List<String>();
        List<String> splitedValueName = new List<String>();
        List<String> finalList = new List<String>();
        set<String> finalUpdateSet = new set<String>();
        set<String> deleteSet = new set<String>();
        set<String> finalDeleteSet = new set<String>();
        system.debug('+++++****ListSelectedPLTReturn----'+ListSelectedPLTReturn);
        system.debug('+++++****ListSelectedPLTReturn size----'+ListSelectedPLTReturn.size());
        finalList.addall(ListSelectedCPGReturn);
        finalList.addall(ListSelectedMPGReturn);
        finalList.addall(ListSelectedPLTReturn);
        finalList.addall(ListSelectedCountryReturn);
        finalList.addall(ListSelectedSOReturn);
        finalList.addall(listSelectedSDReturn);
        finalList.addall(ListSelectedMG1Return);
        finalList.addall(ListSelectedMG3Return);
        //Piyush<PG20202707>
        finalList.addall(ListSelectedDistReturn);
        //Piyush<PG20202707>
        finalList.addall(ListSelectedDistReturn);
        //<<SS20220826>
        finalList.addall(ListSelectedItemReturn);
        //<SS20230501>
        finalList.addall(ListSelectedVCReturn);
        finalList.addall(ListSelectedMG2Return);
        finalList.addall(ListSelectedEMGReturn);
        finalList.addall(ListSelectedPZReturn);
        
        finalList.addall(ListSelectedMG4Return);
        //<VR20131011> DTT Rollout
        finalList.addall(ListSelectedIncotermReturn);
        //<PG20191211> Added by Piyush
        finalList.addall(ListSelectedCustomerGroup4Return);
        //<BR20130625>
        finalList.addall(ListSelectedPEReturn);
        //<VR20131108> DTT Rollout Issue - Payment terms not getting saved
        finalList.addall(listSelectedTOPReturn);
        //<JM20140513> STARTS
        finalList.addall(listSelectedVariantReturn);
        finalList.addall(listSelectedSOTReturn);
        //<KS20220808>
        //finalList.addall(listSelectedSOIReturn);
        finalList.addall(listSelectedPlantReturn);
        finalList.addall(listSelectedSCReturn);
        finalList.addall(listSelectedDCTReturn);
        finalList.addall(listSelectedCampaignReturn);
        finalList.addall(listSelectedDocumentCurrencyReturn);
        finalList.addall(listSelectedStateReturn);
        //<JM20140513> END
        //system.debug('+++++****ListSelectedItemReturn size----'+ListSelectedItemReturn.size());
        //system.debug('+++++****finalList size----'+finalList);
        for(String X:finalList)
        {
            List<String> splitList = new List<String>();
            string PHValue = null;
            splitList = X.split('-');

            system.debug('!!!! '+splitList);
            if(splitList.size()>2)
            {
                system.debug('!!!!@@@ '+splitList);
                system.debug('!!!!@@@ '+splitList.size());
                splitedValueCode.add(splitList[0]);
                for(Integer i=0; i<splitList.size(); i++)
                {
                    if(i < splitList.size()-1)
                    {
                        if(PHValue == null)
                        {
                            PHValue = splitList[i+1];
                        }
                        else
                        {
                            PHValue = PHValue+'-'+splitList[i+1];
                        }
                    }
                    system.debug('!!!!@@@ '+PHValue);
                    splitedValueName.add(PHValue);
                }
            }
            else if(splitList.size()==2)
            {
                splitedValueCode.add(splitList[0]);
                splitedValueName.add(splitList[1]);
            }

        }
        List<ERP_Customer_Material_Key__c> erpCustMatKey = [SELECT Id FROM ERP_Customer_Material_Key__c WHERE Code__c IN :splitedValueCode AND Name__c IN :splitedValueName];
        //system.debug('erpCustMatKey' + erpCustMatKey);
        for(ERP_Customer_Material_Key__c Z:erpCustMatKey)
        {
            finalUpdateSet.add(Z.Id);
            finalDeleteSet.add(Z.Id);   
        }
        finalUpdateSet.addall(custMaterialKeyMap.keyset());
        deleteSet.addall(custMaterialKeyMap.keyset());
        list<Org_Group_ERP_Key__c> ogkeyList = new list<Org_Group_ERP_Key__c>();
        for(string Z:finalDeleteSet)
        {
            deleteSet.remove(Z);
        }
        list<Org_Group_ERP_Key__c> finalDeleteList = new list<Org_Group_ERP_Key__c>();
        finalDeleteList = [SELECT Id FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Id IN :deleteSet AND Organizational_Group_Item__c=:orgGroupItems.Id];
        for(string Z:custMaterialKeyMap.keyset())
        {
            finalUpdateSet.remove(Z);
        }
        //system.debug('finalUpdateSet' + finalUpdateSet);
        for(string X:finalUpdateSet)
        {
            Org_Group_ERP_Key__c ogERPKey = new Org_Group_ERP_Key__c();
            ogERPKey.ERP_Cus_Mat_Compt_Key__c = X;
            ogERPKey.Organizational_Group_Item__c = selectedRecordId;
            ogkeyList.add(ogERPKey);
        }
        //system.debug('ogkeyList' + ogkeyList);
        upsert ogkeyList;
        delete finalDeleteList;
    }
    /*
     * Author        : 
     * Method Name  :   deleteRecord
     * Parameters   :   No parameters
     * Return type  :   void
     * Description  :   This method implements the interface method --  Not applicable for this component
     */
    public  void deleteRecord()
    {
    }
    /*
     * Author        : 
     * Method Name  :   validate
     * Parameters   :   String
     * Return type  :   String
     * Description  :   This method is used to validate the action performed
     */
    public  String validate(String desiredAction)
    {
        String errorMessage;
        system.debug('#*&$R&hello'+desiredAction);

        if(desiredAction.containsIgnoreCase('SASetupSave'))
        {
            //<PP20131206>
            if(orgGroupItems.ERP_Currency__c == null || orgGroupItems.ERP_UoM__c == null || orgGroupItems.Customer_Request_Reasons__c == null || orgGroupItems.Pricing_Task_Reasons__c == null /*||  orgGroupItems.Non_Customer_Permanent_Request_Reasons__c == null || orgGroupItems.Rebate_Agreement__c == null*/ || orgGroupItems.Pricing_Task_Type__c == null
                    || orgGroupItems.Retroactive_Limit__c == null || orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c == null || orgGroupItems.Latest_Valid_From_Offset_Non_Cust_Spec__c == null || orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c == null || orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c == null || orgGroupItems.Approval_Escalation_Price_Requests__c == null)
            {
                if(orgGroupItems.ERP_Currency__c == null)
                {
                    //errorMessage=System.Label.Currency_mandatory_field;
                }
                if(orgGroupItems.ERP_UoM__c == null)
                {
                    //errorMessage=System.Label.UoM_Mandatory_Error;
                }
                //<PP20131206>
                if(orgGroupItems.Customer_Request_Reasons__c == null || (orgGroupItems.Pricing_Task_Reasons__c == null && orgGroupItems.Pricing_Task_Type__c != null) /*|| Commented by Priyanka--orgGroupItems.Rebate_Agreement__c == null ||  orgGroupItems.Non_Customer_Permanent_Request_Reasons__c == null*/)
                {
                    errorMessage=System.Label.Request_Reason_Mandatory_Error;
                }
                if(orgGroupItems.Pricing_Task_Type__c == null && orgGroupItems.Pricing_Task_Reasons__c != null)
                {
                    errorMessage=System.Label.Pricing_Task_Type_Error;
                }
                if(orgGroupItems.Retroactive_Limit__c == null)
                {
                    errorMessage=System.Label.Earliest_Valid_From_Offset_mandatory_field;
                }
                if(orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c == null || orgGroupItems.Latest_Valid_From_Offset_Non_Cust_Spec__c == null)
                {
                    errorMessage=System.Label.Latest_Valid_From_Offset_mandatory_field;
                }
                if(orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c == null || orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c == null)
                {
                    errorMessage=System.Label.Latest_Valid_To_Offset_mandatory_field;
                }
                if(orgGroupItems.Approval_Escalation_Price_Requests__c == null)
                {
                    errorMessage=System.Label.Approval_Setup_Escalation_Time_mandatory_field;
                }
            }
            //<SS20230110> Updadting Retroactive limit based on BU and Sales Area combination - <START>
            Integer retrolimit = 30;
            List<PA_Retroactive_Details__mdt> lstrlimit;
            Integer rlimit;
            String BUSalesarea = orgGroupItems.Business__r.Business__c + '-' + orgGroupItems.OrgGroup__r.ERP_Sales_Org_Code__c + '-' + orgGroupItems.OrgGroup__r.ERP_Distribution_Channel_Code__c + '-'+ orgGroupItems.OrgGroup__r.ERP_Division_Code__c;
            lstrlimit = [Select Retroactive_Limit__c from PA_Retroactive_Details__mdt where label =:BUSalesarea];
            if(lstrlimit.size() > 0)
            {
            rlimit = Integer.valueof(lstrlimit[0].Retroactive_Limit__c);
            }
            if(rlimit != Null)
            {
            retrolimit = rlimit;
            }          
            if(orgGroupItems.Retroactive_Limit__c != null && orgGroupItems.Retroactive_Limit__c > retrolimit)
            {
                errorMessage=System.Label.Earliest_VF_limit + retrolimit +' Days';
            }
            //<SS20230110> Updadting Retroactive limit based on BU and Sales Area combination - <END>
            //<JM20140513> Changed Value 

            if(orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c != null && (orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c > 365 || orgGroupItems.Max_Valid_From_Offset_Cust_Spec__c == 0))
            {
                errorMessage=System.Label.Latest_VF_limit;
            }
            if(orgGroupItems.Latest_Valid_From_Offset_Non_Cust_Spec__c != null && (orgGroupItems.Latest_Valid_From_Offset_Non_Cust_Spec__c > 180 || orgGroupItems.Latest_Valid_From_Offset_Non_Cust_Spec__c == 0))
            {
                errorMessage=System.Label.Latest_VF_NonCuslimit;

            }
            if((orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c != null && (orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c > 120 || orgGroupItems.Latest_Valid_To_Offset_Cust_Spec__c == 0)) || (orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c != null && (orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c > 600 || orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c == 0)))
            {
                errorMessage=System.Label.Latest_VT_limit;
            }
            if((orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c != null && (orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c > 600 || orgGroupItems.Latest_Valid_To_Offset_Non_Cust_Spec__c == 0)))
            {
                errorMessage=System.Label.Latest_VT_Non_Customer_Price_limit;

            }
            //<MS20140424> Commented ineteger for Approval_Escalation_Price_Requests on changing field to picklist 
            //if(orgGroupItems.Approval_Escalation_Duration__c == null /*&& (orgGroupItems.Approval_Escalation_Duration__c > 5 || orgGroupItems.Approval_Escalation_Duration__c == 0)*/)
            //{
            //    errorMessage=System.Label.Approval_Setup_Escalation_Time_limit;
            //}
        }       
        else
        {
            if(getListOptions().size() == 0)
            {
                errorMessage=System.Label.No_Business_Error;
            }
            if(selectedBU == '--Select--' || selectedBU == null)
            {
                errorMessage = errorMessage+'<br>'+System.Label.No_Business_Selected_Error;
            }
        }
        return errorMessage;
    }
    
   

    /*
     * Author        : 
     * Method Name  :   action
     * Parameters   :   String,String,String
     * Return type  :   String
     * Description  :   This method is called when action on the corresponding page is called
     */
    public String action(String newPagelabel,String currentPageLabel, String desiredAction) 
    {
        System.debug('in action of org grp item');
        System.debug('+++ newPagelabel'+newPagelabel);
        System.debug('+++ currentPageLabel'+currentPageLabel);
        System.debug('+++ desiredAction'+desiredAction);
        System.debug('+++ value'+value);
        String errorMsg;
        List<Organizational_Group_User__c> SACount = new List<Organizational_Group_User__c>();
       
        if(!desiredAction.containsIgnoreCase('BackToHome') && !desiredAction.containsIgnoreCase('Cancel') && !desiredAction.containsIgnoreCase('MDM') && !desiredAction.containsIgnoreCase('backPriceMasterToConfig') && !desiredAction.containsIgnoreCase('backPriceMaster') && !desiredAction.containsIgnoreCase('SASetupSave'))
        {
            system.debug('@#&^#&h');
            errorMsg=validate(desiredAction);
        }
        //<GT20150520> START
        if(desiredAction.containsIgnoreCase('openReportPRByStatus'))
        {
            System.debug('Open Report'+reportUrl);
            newPageLabel = reportUrl;
        }
        //<GT20150520> END
        //Added for PriceMaster
        if(desiredAction.containsIgnoreCase('MDM'))
        {
            value = null;
            return newPagelabel;
        }
        if(desiredAction.containsIgnoreCase('backPriceMasterToConfig'))
        {
            value = 'SASetup';
            setselectedRecordId(this.selectedRecordId);
            return newPagelabel;
        }
        if(desiredAction.containsIgnoreCase('backPriceMaster'))
        {
            value = null;
            displaySection='procedure';
            return newPagelabel;
        }
        //PriceMaster End
        if(desiredAction.containsIgnoreCase('BackToHome'))
        {
            value = null;
            selectedRecordId = null;            //<TJ20140624>
            return newPagelabel;
        }
        if(errorMsg!=null)
        {
            System.debug('in throw');
            errorMsg=errorMsg.remove('null');
            //value = null;
            throw new PAException('<html>'+errorMsg+'</html>', ApexPages.Severity.ERROR);
        }
        System.debug('&&&& errorMsg'+errorMsg);
        if(desiredAction.containsIgnoreCase('SASetup')|| desiredAction.containsIgnoreCase('BUSetup') || desiredAction.containsIgnoreCase('PH'))
        {
            if(desiredAction.containsIgnoreCase('SASetupSave'))
            {
                system.debug('++SAVE SalesArea++');
                errorMessageDisp = validate(desiredAction);
                if(errorMessageDisp!=null)
                {
                    System.debug('in throw');
                    System.debug('### errorMessage '+errorMessageDisp);
                    errorMessageDisp=errorMessageDisp.remove('null');
                    throw new PAException(errorMessageDisp, ApexPages.Severity.ERROR);
                }
                else
                {

                    //<JM20140425> <Added selectedCurrency and selectedUom values into orgGroupItems>
                    boolean first = true;
                    currencyValues='';
                    uomValues='';
                    MG2Values='';
                    CG4Values='';
                    System.debug('before saving--->>>>'+selectedCurrency);
                    //set<SelectOption> allcureencies = new set<SelectOption>();
                    //allcureencies.addAll(selectedCurrency);
                    //allcureencies.addAll(selectedCurrencyValues);
                    //List<SelectOption> allcureenciesList = new List<SelectOption>();
                    //allcureenciesList.addAll(allcureencies);
                    for ( SelectOption so : selectedCurrency )
                    {
                        if (!first)
                        {
                            currencyValues += ';';
                        }

                        currencyValues +=so.getLabel();
                        first = false;
                    }
                    first = true;
                    for ( SelectOption so : selectedUom )
                    {
                        if (!first)
                        {
                            uomValues += ';';
                        }                                       
                        uomValues +=so.getLabel();
                        first = false;
                    }
                    //<KJ20150705 start>
                    first = true;
                    for ( SelectOption so : selectedMG2 )
                    {
                        if (!first)
                        {
                            MG2Values += ';';
                        }                                       
                        MG2Values +=so.getLabel();
                        first = false;
                    }
                    //<KJ20150705 start>
                    //<PG20191211> Piyush start
                    first = true;
                    for ( SelectOption so : selectedCG4)
                    {
                        if (!first)
                        {
                            CG4Values+= ';';
                        }                                       
                        CG4Values+=so.getLabel();
                        first = false;
                    }
                    //<PG20191211> Piyush end
                    System.debug('currencyValues-----'+currencyValues);
                    System.debug('uomValues----'+uomValues);

                    List<String> selectedCurrencyList = currencyValues.split(';');
                    String defaultSalesAreaCurrency=selectedCurrencyList.get(0);
                    System.debug('defaultSalesAreaCurrency--->>>>>'+defaultSalesAreaCurrency);
                    orgGroupItems.Default_SalesArea_Currency__c=defaultSalesAreaCurrency;

                    List<String> selectedUoMList = uomValues.split(';');
                    String defaultSalesAreaUoM=selectedUoMList.get(0);
                    System.debug('defaultSalesAreaUOM--->>>>>'+defaultSalesAreaUoM);
                    orgGroupItems.Default_SalesArea_UoM__c=defaultSalesAreaUoM;

                    orgGroupItems.ERP_Currency__c=currencyValues;
                    System.debug('---->>>>>>>>>>'+orgGroupItems.ERP_Currency__c);
                    orgGroupItems.ERP_UoM__c=uomValues;
                    
                    //<KJ20150705>
                    orgGroupItems.ERP_Material_Group2_Code__c=MG2Values;
                    
                    //<JM20140425>
                    //<PG20191211> Piyush start
                    orgGroupItems.Customer_Group_4_Auto_Approval__c=CG4Values;
                    //<PG20191211> Piyush end   
                    update orgGroupItems;
                    save();
                }
            } 
        }

        if(desiredAction.containsIgnoreCase('landingpage'))
        {
            return newpagelabel;
        }
        if(desiredAction.containsIgnoreCase('Cancel'))
        {
            selectedRecordId = null;
            errorMessageDisp = null;
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Massive')) {
            value = 'Massive';
            salesAreaCheck();
        }
        else if(desiredAction!=null && desiredAction.equalsIgnoreCase('ImportPrices')) {
            value = 'Import';           
            salesAreaCheck();
        }       
        else if(desiredAction!=null && desiredAction.equalsIgnoreCase('ExportPrices')) {
            value = 'Export';
            salesAreaCheck();
        }
        else if(desiredAction!=null && desiredAction.equalsIgnoreCase('NonCustomerSpecific')) {
            value = 'NonCustomerSpecific';
            salesAreaCheck();
        }
        // for status links
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Draft'))
        {
            value='Draft';            
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Submitted'))
        {   
            value='Submitted';        
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Approved'))
        {
            value='Approved';         
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Rejected'))
        {
            value='Rejected';      
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Recalled'))
        {
            value='Recalled';         
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('Pending'))
        {
            value='Pending';          
        }
        if(desiredAction!=null && desiredAction.equalsIgnoreCase('ApprovalSetup'))
        {
            value='ApprovalSetup';           
        }

        //<PP20140418> START
        else if(desiredAction.containsIgnoreCase('viewUserRoleReport'))
        {
            errorMessageDisp = validate(desiredAction);
            if(errorMessageDisp!=null)
            {
                System.debug('in throw');
                System.debug('### errorMessage '+errorMessageDisp);
                errorMessageDisp=errorMessageDisp.remove('null');
                throw new PAException(errorMessageDisp, ApexPages.Severity.ERROR);
            }
            else
                businessUsersWrapList = getAllBusinessUsersInfo();
                System.debug('businessUsersWrapList###'+businessUsersWrapList);
        }
        //<PP20140418> END
        return newPagelabel;
    } 


    //<SP20140611>
    public Boolean salesAreaCheck()
    {
        List<Organizational_Group_User__c> ogUsersSA = new List<Organizational_Group_User__c>();
        ogUsersSA = [SELECT OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel__c,
                     OrgGroup__r.ERP_Distribution_Channel_Code__c,OrgGroup__r.ERP_Division__c,OrgGroup__r.ERP_Division_Code__c FROM Organizational_Group_User__c
                     WHERE Related_User__c =:UserInfo.getUserId() AND Organizational_Group_Item__r.Business__c=:selectedBU];
        if(ogUsersSA.size() > 1)
            showpopup = true;
        else
            showpopup = false;

        return showpopup;
    }

    /*
     * Author        : 
     * Method Name  :   getName 
     * Parameters   :   No parameters
     * Return type  :   String
     * Description  :   This method is used to determine the name of the business component
     */
    public String getName()
    {   
        //return null;
        return PAService.NAME_BU;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */    
    public List<String> listUnselectedCPG
    {
        get
        {
            List<String> UnselectedCPGList = new List<String>();
            //added sorted condition V1.5
            List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Customer Price Group' ORDER BY Code__c];
            for(ERP_Customer_Material_Key__c X:CMKey)
            {
                string concat = X.Code__c+'-'+X.Name__c;
                UnselectedCPGList.add(concat);
            }
            return UnselectedCPGList;
        }
        set;
    }
    //<BB20130726> Ver 3.5 2013-07-26 APAC Rollout2-Adding List for Key field Incoterms
    public List<String> listUnselectedIncoterms
    {
        get
        {
            List<String> UnselectedIncotermsList = new List<String>();
            //added sorted condition V1.5
            List<ERP_Customer_Material_Key__c> IncotermsKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Incoterms' ORDER BY Code__c];
            for(ERP_Customer_Material_Key__c X:IncotermsKey)
            {
                string concat = X.Code__c+'-'+X.Name__c;
                UnselectedIncotermsList.add(concat);
            }
            return UnselectedIncotermsList;
        }
        set;
    }
    
    //<PG20191211> Added by Piyush for Key field Customer Group 4
    public List<String> listUnselectedCustomerGroup4
    {
        get
        {
            List<String> UnselectedCustomerGroup4List = new List<String>();
            //added sorted condition
            List<ERP_Customer_Material_Key__c> CustomerGroup4Key = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Customer Group 4' ORDER BY Code__c];
            for(ERP_Customer_Material_Key__c X:CustomerGroup4Key)
            {
                string concat = X.Code__c+'-'+X.Name__c;
                UnselectedCustomerGroup4List.add(concat);
            }
            return UnselectedCustomerGroup4List;
        }
        set;
    }
    
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedMPG() 
    {
        List<String> UnselectedMPGList = new List<String>();
        //added sorted condition ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Price Group' ORDER BY Code__c];
        System.debug('****mpg list'+CMKey.size()); 
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedMPGList.add(concat);
        }
        return UnselectedMPGList;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedPLType() 
    {         
        List<String> UnselectedPLTypeList = new List<String>();
        //added sorted condition ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Price List Type' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedPLTypeList.add(concat);
        }
        return UnselectedPLTypeList;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedCountry() 
    {         
        List<String> UnselectedCountryList = new List<String>();
        //added sorted condition ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Country' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedCountryList.add(concat);
        }
        return UnselectedCountryList;
    }
    public List<String> getListUnselectedCampaign() 
    {         
        List<String> UnselectedCampaignList = new List<String>();
        //added sorted condition ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Campaign' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedCampaignList.add(concat);
        }
        return UnselectedCampaignList;
    }
    public List<String> getListUnselectedDocumentCurrency() 
    {         
        List<String> UnselectedDocumentCurrencyList = new List<String>();
        //added sorted condition ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Document Currency' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedDocumentCurrencyList.add(concat);
        }
        return UnselectedDocumentCurrencyList;
    }
    public List<String> getListUnselectedState() 
    {         
        List<String> UnselectedStateList = new List<String>();
        //added sorted condition ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'State' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedStateList.add(concat);
        }
        return UnselectedStateList;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedSO() 
    {         
        List<String> UnselectedSOList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales Office' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedSOList.add(concat);
        }
        return UnselectedSOList;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedSD() 
    {         
        List<String> UnselectedSDList = new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales District' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedSDList.add(concat);
        }
        return UnselectedSDList;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedMG1() 
    {         
        List<String> UnselectedMG1List = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 1' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedMG1List.add(concat);
        }
        return UnselectedMG1List;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedMG3() 
    {         
        List<String> UnselectedMG3List = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 3' ORDER BY Code__c limit 300];
        System.debug('****mg 3'+CMKey.size());
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedMG3List.add(concat);
        }
        return UnselectedMG3List;
    }
    
    /*
     * Author        : Piyush Gupta <PG20202707>
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedDist() 
    {         
        List<String> UnselectedDistList = new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Distributor Code' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedDistList.add(concat);
        }
        return UnselectedDistList;
    }
    
    /*
     * Author        : <<SS20220826>
     * Method Name  :   getListUnselectedItem
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Sales Order Item 
     */ 
    public List<String> getListUnselectedItem() 
    {         
        List<String> UnselectedItemList= new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales Order Item' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedItemList.add(concat);
        }
        return UnselectedItemList;
    } 
    /*
     * Author        : <<SS20230501>>
     * Method Name  :   getListUnselectedVC
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Sales Order Item 
     */ 
    public List<String> getListUnselectedVC() 
    {         
        List<String> UnselectedVCList= new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Value Center' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedVCList.add(concat);
        }
        return UnselectedVCList;
    } 
    
    /*
     * Author        : <<SS20230501>
     * Method Name  :   getListUnselectedMG2
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Sales Order Item 
     */ 
    public List<String> getListUnselectedMG2() 
    {         
        List<String> UnselectedMG2List= new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 2' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedMG2List.add(concat);
        }
        return UnselectedMG2List;
    } 
     /*
     * Author        : <<SS20230501>
     * Method Name  :   getListUnselectedEMG
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Sales Order Item 
     */ 
    public List<String> getListUnselectedEMG() 
    {         
        List<String> UnselectedEMGList= new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Ext Matl Grp' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedEMGList.add(concat);
        }
        return UnselectedEMGList;
    } 
     /*
     * Author        : <<SS20230501>
     * Method Name  :   getListUnselectedPZ
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Sales Order Item 
     */ 
    public List<String> getListUnselectedPZ() 
    {         
        List<String> UnselectedPZList= new List<String>();
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Price Zone' ORDER BY Code__c limit 300];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedPZList.add(concat);
        }
        return UnselectedPZList;
    } 
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedMG4() 
    {         
        List<String> UnselectedMG4List = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Material Group 4' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedMG4List.add(concat);
        }
        return UnselectedMG4List;
    }
    //<PP20131022> START
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedTOP() 
    {         
        List<String> UnselectedTOPList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Terms of Payment' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedTOPList.add(concat);
        }
        return UnselectedTOPList;
    }
    //<PP20131022> END
    //<JM20140513> START
    /*
     * Author        : 
     * Method Name  :   getListUnselectedVariant
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedVariant() 
    {         
        List<String> UnselectedVariantList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> variantKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Variant' ORDER BY Code__c];

        for(ERP_Customer_Material_Key__c X:variantKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedVariantList.add(concat);
        }
        return UnselectedVariantList;
    }
    //<JM20140513> END
    //<JM20140513> START
    /*
     * Author        : 
     * Method Name  :   getListUnselectedSalesOrderType
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> getListUnselectedSalesOrderType() 
    {         
        List<String> UnselectedSOPList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> sopKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales Order Type' ORDER BY Code__c];

        for(ERP_Customer_Material_Key__c X:sopKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedSOPList.add(concat);
        }
        return UnselectedSOPList;
    }
    /*<SS20220826> START
     * Author       :   Shantanu Sharma
     * Method Name  :   getListUnselectedSalesOrderItem
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for sales order item
     */ 
    public List<String> getListUnselectedSalesOrderItem() 
    {         
        List<String> UnselectedSOIList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> sopKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Sales Order Item' ORDER BY Code__c];

        for(ERP_Customer_Material_Key__c X:sopKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedSOIList.add(concat);
        }
        return UnselectedSOIList;
    } // <SS20220826> END
    public List<String> getListUnselectedPlant() 
    {         
        List<String> UnselectedPlantList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> plantKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Plant' ORDER BY Code__c];

        for(ERP_Customer_Material_Key__c X:plantKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedPlantList.add(concat);
        }
        return UnselectedPlantList;
    }

    public List<String> getListUnselectedShippingCondition() 
    {         
        List<String> UnselectedSCList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> scKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Shipping Condition' ORDER BY Code__c];

        for(ERP_Customer_Material_Key__c X:scKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedSCList.add(concat);
        }
        return UnselectedSCList;
    }

    public List<String> getListUnselectedDestinationCountry() 
    {         
        List<String> UnselectedDCList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> dcKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Destination Country' ORDER BY Code__c];

        for(ERP_Customer_Material_Key__c X:dcKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedDCList.add(concat);
        }
        return UnselectedDCList;
    }
    //<JM20140513> END
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    //Brundha Roll out 2 <BR20130625> starts
    public List<String> getListUnselectedPE() 
    {         
        List<String> UnselectedPEList = new List<String>();
        //added sorted condtion Ver 1.5
        List<ERP_Customer_Material_Key__c> CMKey = [SELECT Id,Code__c,Name__c,Description__c FROM ERP_Customer_Material_Key__c WHERE Type__c = 'Pricing Exception' ORDER BY Code__c];
        for(ERP_Customer_Material_Key__c X:CMKey)
        {
            string concat = X.Code__c+'-'+X.Name__c;
            UnselectedPEList.add(concat);
        }
        return UnselectedPEList;
    }
    //Brundha Roll out 2 <BR20130625> ends
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */ 
    public List<String> listSelectedCPG 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedCPGList = new List<String>();
            //Ver 1.9
            System.debug('******org item id'+orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Customer Price Group' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedCPGList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedCPGList;
        }
        set;
    }
    //<BB20130726> Ver 3.5 2013-07-26 APAC Rollout2-Adding Logic for Extra field Incoterms
    public List<String> listSelectedIncoterms 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedIncotermsList = new List<String>();
            //Ver 1.9
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Incoterms' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedIncotermsList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedIncotermsList;
        }
        set;
    }
    
    //<PG20191510> Adding Logic for Extra field Customer Group 4
    public List<String> listSelectedCustomerGroup4 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedCustomerGroup4List = new List<String>();
            //Ver 1.9
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Customer Group 4' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedCustomerGroup4List.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedCustomerGroup4List;
        }
        set;
    }
    
    
    
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedMPG
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedMPGList = new List<String>();
            System.debug('******org item id'+orgGroupItems.Id);
            //Ver 1.9
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Price Group' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedMPGList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedMPGList;
        }
        set;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedPLType
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedPLTypeList = new List<String>();
            system.debug('\n\n\n orgGroupItems '+orgGroupItems+' selectedRecordId '+selectedRecordId);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Price List Type' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedPLTypeList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedPLTypeList;
        }
        set;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedCountry 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedCountryList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Country' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedCountryList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedCountryList;
        }
        set;
    }
    public List<String> listSelectedCampaign 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedCampaignList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Campaign' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedCampaignList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedCampaignList;
        }
        set;
    }
    public List<String> listSelectedDocumentCurrency 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedDocumentCurrencyList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Document Currency' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedDocumentCurrencyList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedDocumentCurrencyList;
        }
        set;
    }
    public List<String> listSelectedState
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedStateList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'State' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedStateList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedStateList;
        }
        set;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedSO
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedSOList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Sales Office' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedSOList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedSOList;
        }
        set;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedSD
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedSDList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Sales District' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedSDList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedSDList;
        }
        set;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedMG5
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedSDList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 5' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            system.debug('key5##'+ OGKey);
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedSDList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedSDList;
        }
        set;
    }
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedMG1
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedMG1List = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 1' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedMG1List.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedMG1List;
        }
        set;
    }
    /*
     * Author        : <<SS20220826>
     * Method Name  :   listSelectedSOItem
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Sales Order Item 
     */
      
      public List<String> listSelectedItem
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedItemList = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Sales Order Item' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedItemList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedItemList;
        }
        set;
        }
  /*
  * Author        : <<SS20230501>
     * Method Name  :   listSelectedVC
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Value Center
     */
      
      public List<String> listSelectedVC
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedVCList = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Value Center' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedVCList.add(concat); 
                System.debug('VCList###'+selectedVCList);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedVCList;
        }
        set;
        }
  /*
  * Author        : <<SS20230501>
     * Method Name  :   listSelectedMG2
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Material Group 2
     */
      
      public List<String> listSelectedMG2
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedMG2List = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 2' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedMG2List.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedMG2List;
        }
        set;
        }  
  /*
  * Author        : <<SS20230501>
     * Method Name  :   listSelectedEMG
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for External Material Group
     */
      
      public List<String> listSelectedEMG
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedEMGList = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Ext Matl Grp' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedEMGList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedEMGList;
        }
        set;
        } 
  /*
  * Author        : <<SS20230501>
     * Method Name  :   listSelectedPZ
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options for Price Zone
     */
      
      public List<String> listSelectedPZ
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedPZList = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Price Zone' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedPZList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedPZList;
        }
        set;
        }          
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedMG3
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedMG3List = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 3' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedMG3List.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedMG3List;
        }
        set;
    }
    
    /*
     * Author        : Piyush Gupta <PG20202707>
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedDist
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedDistList = new List<String>();
            system.debug(orgGroupItems.Id);
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Distributor Code' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c limit 300];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedDistList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedDistList;
        }
        set;
        }
    
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedMG4 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedMG4List = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 4' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedMG4List.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedMG4List;
        }
        set;
    }
    //<PP20131022> START
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedTOP 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedTOPList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Terms of Payment' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedTOPList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedTOPList;
        }
        set;
    }
    //<PP20131022> END

    //<JM20140513> START
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedVariant 
    {
        get
        {

            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

            List<String> selectedVariantList = new List<String>();

            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Variant' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedVariantList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedVariantList;
        }
        set;
    }

    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<String> listSelectedSOT
    {
        get
        {

            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

            List<String> selectedSOTList = new List<String>();

            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Sales Order Type' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedSOTList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedSOTList;
        }
        set;
    }
    
    /*
     * Author       :   Kanchan Solanki
     * Method Name  :   getlistSelectedSOI
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options sales order item
     
    public List<String> listSelectedSOI
    {
        get
        {

            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

            List<String> selectedSOIList = new List<String>();

            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Sales Order Item' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedSOIList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedSOIList;
        }
        set;
    }*/

    public List<String> listSelectedPlant
    {
        get
        {

            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

            List<String> SelectedPlantList = new List<String>();

            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Plant' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                SelectedPlantList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return SelectedPlantList;
        }
        set;
    }

    public List<String> listSelectedShippingCondition
    {
        get
        {

            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

            List<String> SelectedSCList = new List<String>();

            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Shipping Condition' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                SelectedSCList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return SelectedSCList;
        }
        set;
    }

    public List<String> listSelectedDestinationCountry
    {
        get
        {

            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();

            List<String> SelectedDCList = new List<String>();

            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Destination Country' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];

            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                SelectedDCList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return SelectedDCList;
        }
        set;
    }



    //<JM20140513> START

    /*
     * Author       : 
     * Method Name  :   getAllCurrency
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */

    public List<SelectOption> getAllCurrency
    {
        get
        {


            Schema.DescribeFieldResult fieldResult = Organizational_Group_Item__c.ERP_Currency__c.getDescribe();
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            allCurrency = new List<SelectOption>();
            Set<SelectOption> allcurrencySet = new Set<SelectOption>();
            //for( Schema.PicklistEntry f : ple)
            //{

            //allCurrency.add(new SelectOption(f.getLabel(), f.getValue()));
            //}

            allCurrency.clear();
            //List<selectOption> selectedcurrencies = selectedCurrencyValues;
            Map<String,String> selectedCurrencyMap = new map<String,String>();
            for(selectOption soptn:selectedCurrencyValues)
            {
                selectedCurrencyMap.put(soptn.getLabel(),soptn.getValue());
            }
            System.debug('Selected Currencies:-'+selectedCurrencyMap);
            for( Schema.PicklistEntry f : ple)
            {

                System.debug('Coming outside Selected Currency Loop'+f);
                if(!selectedCurrencyMap.containsKey(f.getLabel()))
                {
                    allcurrencySet.add(new SelectOption(f.getLabel(), f.getValue()));
                }


            }

            allCurrency.addALL(allcurrencySet);

            //selectedCurrency = new List<SelectOption>();
            System.debug('Ayyappaa--->>>>'+selectedCurrency.size());
            return allCurrency;
        }
        set;
    }
    
    //<JM20140513> START

    /*
     * Author       :   Piyush Gupta <PG20191211>
     * Method Name  :   getAllCG4
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */

    public List<SelectOption> getAllCG4
    {
        get
        {


            Schema.DescribeFieldResult fieldResult = Organizational_Group_Item__c.Customer_Group_4_Auto_Approval__c.getDescribe();
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            allCG4 = new List<SelectOption>();
            Set<SelectOption> allCG4set= new Set<SelectOption>();
            allCG4.clear();
            Map<String,String> selectedCG4Map = new map<String,String>();
            for(selectOption soptn:selectedCG4Values)
            {
                selectedCG4Map.put(soptn.getLabel(),soptn.getValue());
            }
            for( Schema.PicklistEntry f : ple)
            {
                if(!selectedCG4Map.containsKey(f.getLabel()))
                {
                    allCG4Set.add(new SelectOption(f.getLabel(), f.getValue()));
                }


            }

            allCG4.addALL(allCG4Set);
            
            return allCG4;
        }
        set;
    }
    
    

    //<KJ20150508> START

    /*
     * Author       : 
     * Method Name  :   getAllMG2Values
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */

    public List<SelectOption> getAllMG2Values
    {
        get
        {


            Schema.DescribeFieldResult fieldResult = Organizational_Group_Item__c.ERP_Material_Group2_Code__c.getDescribe();
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            allMG2 = new List<SelectOption>();
            Set<SelectOption> allMG2Set = new Set<SelectOption>();
            Map<String,String> selectedMG2Map = new map<String,String>();
            for(selectOption soptn:selectedMG2Values)
            {
                selectedMG2Map.put(soptn.getLabel(),soptn.getValue());
            }
            System.debug('Selected Currencies:-'+selectedMG2Map);
            for( Schema.PicklistEntry f : ple)
            {

                System.debug('Coming outside Selected Currency Loop'+f);
                if(!selectedMG2Map.containsKey(f.getLabel()))
                {
                    allMG2Set.add(new SelectOption(f.getLabel(), f.getValue()));
                }


            }

            allMG2.addALL(allMG2Set);

            //selectedCurrency = new List<SelectOption>();
            //System.debug('Ayyappaa--->>>>'+selectedallMG2 .size());
            return allMG2 ;
        }
        set;
    }
    
    //<KJ20150508> END


    /*
     * Author        : 
     * Method Name  :   getAllUom
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    public List<SelectOption> getAllUom
    {
        get
        {


            Schema.DescribeFieldResult fieldResultValue = Organizational_Group_Item__c.ERP_UoM__c.getDescribe();
            List<Schema.PicklistEntry> pickListValue = fieldResultValue.getPicklistValues();
            allUomValues = new List<SelectOption>();

            //for( Schema.PicklistEntry f : pickListValue)
            //{
            //allUomValues.add(new SelectOption(f.getLabel(), f.getValue()));
            //} 
            Set<SelectOption> allUomSet = new Set<SelectOption>();
            //for( Schema.PicklistEntry f : ple)
            //{

            //allCurrency.add(new SelectOption(f.getLabel(), f.getValue()));
            //}

            allUomValues.clear();
            //List<selectOption> selectedcurrencies = selectedCurrencyValues;
            Map<String,String> selectedUomMap = new map<String,String>();
            for(selectOption soptn:selectedUomValues)
            {
                selectedUomMap.put(soptn.getLabel(),soptn.getValue());
            }
            System.debug('Selected UOM:-'+selectedUomMap);
            for( Schema.PicklistEntry f : pickListValue)
            {

                System.debug('Coming outside Selected UOM Loop'+f);
                if(!selectedUomMap.containsKey(f.getLabel()))
                {
                    allUomSet.add(new SelectOption(f.getLabel(), f.getValue()));
                }


            }

            allUomValues.addALL(allUomSet);
            allUoMValues.sort();

            //selectedUom=new List<SelectOption>();
            return allUomValues;    
        }
        set;
    }

    /*
     * Author       : 
     * Method Name  :   selectedCurrencyValues
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */



    public List<SelectOption> selectedCurrencyValues
    {
        set;
        get
        {

            if(orgGroupItems != null && orgGroupItems.ERP_Currency__c != null)
            {
                //selectedCurrencyValues = new List<SelectOption>();
                List<String> selectedCurrencyValuesList = orgGroupItems.ERP_Currency__c.split(';');
                System.debug('Selected currency size:-'+selectedCurrencyValuesList.size());
                System.debug('ERP CURRENCY'+orgGroupItems.ERP_Currency__c);
                selectedCurrency.clear();

                for(String rc : selectedCurrencyValuesList)
                {
                    if(rc==orgGroupItems.Default_SalesArea_Currency__c && selectedCurrency.size()>0)
                    {
                        selectedCurrency.add(0,new SelectOption(rc,rc));

                    }
                    else
                        selectedCurrency.add(new SelectOption(rc,rc));
                }

            }
            return selectedCurrency;
        }
    }
    
    
    /*
     * Author       :   Piyush Gupta <PG20191211>
     * Method Name  :   selectedCG4Values
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */



    public List<SelectOption> selectedCG4Values
    {
        set;
        get
        {

            if(orgGroupItems != null && orgGroupItems.Customer_Group_4_Auto_Approval__c != null)
            {
                List<String> selectedCG4ValuesList = orgGroupItems.Customer_Group_4_Auto_Approval__c.split(';');
                selectedCG4.clear();

                for(String cg : selectedCG4ValuesList)
                {
                    if(cg==orgGroupItems.Customer_Group_4_Auto_Approval__c && selectedCG4.size()>0)
                    {
                        selectedCG4.add(0,new SelectOption(cg,cg));

                    }
                    else
                        selectedCG4.add(new SelectOption(cg,cg));
                }

            }
            return selectedCG4;
        }
    }


    //<KJ20150805> START
    /*
     * Author       : 
     * Method Name  :   selectedMG2Values
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */



    public List<SelectOption> selectedMG2Values
    {
        set;
        get
        {

            if(orgGroupItems != null && orgGroupItems.ERP_Material_Group2_Code__c != null)
            {
                //selectedCurrencyValues = new List<SelectOption>();
                List<String> selectedMG2ValuesList = orgGroupItems.ERP_Material_Group2_Code__c.split(';');
                System.debug('Selected currency size:-'+selectedMG2ValuesList.size());
                System.debug('ERP CURRENCY'+orgGroupItems.ERP_Material_Group2_Code__c);
                selectedMG2.clear();

                for(String rc : selectedMG2ValuesList)
                {
                    /*if(rc==orgGroupItems.Default_Material_Group2_Code__c && selectedMG2.size()>0)
                    {
                        selectedMG2.add(0,new SelectOption(rc,rc));

                    }
                    else*/
                        selectedMG2.add(new SelectOption(rc,rc));
                }

            }
            return selectedMG2;
        }
    }
    //<KJ20150508> END
    
    /*
     * Author       : 
     * Method Name  :   selectedUomValues
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */

    public List<SelectOption> selectedUomValues
    {
        set;
        get
        {

            if(orgGroupItems != null && orgGroupItems.ERP_UoM__c != null)
            {
                //selectedUomValues = new List<SelectOption>();
                List<String> selectedUoMValuesList = orgGroupItems.ERP_UoM__c.split(';');
                System.debug('ERP UoM'+orgGroupItems.ERP_UoM__c);
                selectedUom.clear();
                selectedUoMValuesList.sort();
                for(String rc : selectedUoMValuesList)
                {
                    if(rc == orgGroupItems.Default_SalesArea_UoM__c && selectedUom.size()>0)
                    {
                        selectedUom.add(0,new SelectOption(rc,rc));
                    }
                    else
                        selectedUom.add(new SelectOption(rc,rc));
                }

            }
            return selectedUom;
        }
    }

    //<JM20140513> ENDS    
    /*
     * Author        : 
     * Method Name  :   getListOptionsSelected
     * Parameters   :   No parameters
     * Return type  :   List<SelectOption>
     * Description  :   This method populates the options 
     */
    //Brundha Roll out 2 <BR20130625> starts
    public List<String> listSelectedPE 
    {
        get
        {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<String> selectedPEList = new List<String>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'pricing Exception' AND Organizational_Group_Item__c=:orgGroupItems.Id ORDER BY ERP_Cus_Mat_Compt_Key__r.Name__c];
            for(Org_Group_ERP_Key__c X:OGKey)
            {
                string concat = X.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+X.ERP_Cus_Mat_Compt_Key__r.Name__c;
                selectedPEList.add(concat);
                custMaterialKeyMap.put(X.ERP_Cus_Mat_Compt_Key__r.Id,X.Id);
            }
            return selectedPEList;
        }
        set;
    }
    //Brundha Roll out 2 <BR20130625> ends
    public pagereference priceMasterPA()
    {
        Organizational_Group_Item__c ogPPId = [SELECT Id, ERP_Pricing_Procedure__c FROM Organizational_Group_Item__c WHERE Id=:selectedRecordId];
        pagereference p = new pagereference('/apex/PAPriceMaster?Id='+ogPPId.ERP_Pricing_Procedure__c);

        return p;
    }
    //added bala-1.6 05-Mar-2013
    public List<PAWrapper> getAccessProcedureWrappper()
    {
        if(pricingProcedureId!=null)
        {
            paWrapperList  = new List<PAWrapper>();
            List<ERP_Pricing_Condition__c> pricingConditionList = new List<ERP_Pricing_Condition__c>(); 
            List<ERP_Procedure_Conditions__c>  ProcedureConditions = 
                    [SELECT Sales_Pricing_Procedure_Condition_Config__c,pricing_condition__c,pricing_condition__r.Pricing_condition_code__c,pricing_condition__r.Pricing_condition__c,
                     step__c,From__c,To__c,
                     pricing_condition__r.Condition_Class_code__c,pricing_condition__r.Condition_Class__c,pricing_condition__r.Sap_Condition_Type__c,Sales_Pricing_Procedure__c,Sales_Pricing_Procedure__r.Id
                     FROM ERP_Procedure_Conditions__c where
                     Sales_Pricing_Procedure__c=:pricingProcedureId
                     order by step__c asc nulls last];
            for(ERP_Procedure_Conditions__c erpProCond:ProcedureConditions)
            {
                pricingConditionList.add(erpProCond.pricing_condition__r);
            }  
            List<ERP_Access_Sequence__c> erpAccessSequence  = 
                    [SELECT sequence_number__c,Floor_Pricing_Condition__r.Pricing_condition_code__c,Reference_Pricing_Condition__r.Pricing_condition_code__c,Sales_Pricing_Procedure__c,
                     Pricing_Condition__c FROM ERP_Access_Sequence__c WHERE Pricing_Condition__c IN :pricingConditionList
                     AND Sales_Pricing_Procedure__c=:pricingProcedureId
                     order by sequence_number__c asc nulls last];
            Map<Id,List<ERP_Access_Sequence__c>> pcIdToAccSeqListMap = new Map<Id,List<ERP_Access_Sequence__c>>();
            if(erpAccessSequence != null)
            {
                for(ERP_Access_Sequence__c ac : erpAccessSequence)
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
            }
            for(ERP_Procedure_Conditions__c erpProCon:ProcedureConditions)
            {
                if(pcIdToAccSeqListMap.containsKey(erpProCon.Pricing_Condition__c))
                {
                    for(ERP_Access_Sequence__c erpAccSq : pcIdToAccSeqListMap.get(erpProCon.Pricing_Condition__c))
                    {
                        if((erpProCon.Sales_Pricing_Procedure__c==erpAccSq.Sales_Pricing_Procedure__c) &&
                                (erpProCon.Pricing_Condition__c==erpAccSq.Pricing_Condition__c))
                        {
                            PAWrapper paWrapper = new PAWrapper();
                            paWrapper.sObjectList = new List<sObject>();
                            paWrapper.sObjectList.add(erpProCon);
                            paWrapper.sObjectList.add(erpAccSq);
                            paWrapperList.add(paWrapper);
                            paWrapper.stringMap.put('displayKCLink','true');
                            break;
                        }
                    }                   
                }
                else
                {
                    PAWrapper paWrapper = new PAWrapper();
                    paWrapper.sObjectList = new List<sObject>();
                    paWrapper.sObjectList.add(erpProCon);
                    paWrapper.stringMap.put('displayKCLink','false');
                    paWrapperList.add(paWrapper);
                }
            }
            /*for(ERP_Procedure_Conditions__c erpProCon:ProcedureConditions)
            {
                for(ERP_Access_Sequence__c erpAccSq:erpAccessSequence)
                {
                    if((erpProCon.Sales_Pricing_Procedure__c==erpAccSq.Sales_Pricing_Procedure__c) &&
                            (erpProCon.Pricing_Condition__c==erpAccSq.Pricing_Condition__c))
                    {
                        PAWrapper paWrapper = new PAWrapper();
                        paWrapper.sObjectList = new List<sObject>();
                        paWrapper.sObjectList.add(erpProCon);
                        paWrapper.sObjectList.add(erpAccSq);
                        paWrapperList.add(paWrapper);
                        break;
                    }
                }
            }*/
            system.debug('Wrap List: '+paWrapperList);
            return paWrapperList;
        }
        return null;
    }

    public List<Organizational_Group_Item__c> getOrgGroupItems()
    {

        if(pricingProcedureId!=null)
        {
            return [SELECT Business__r.Business__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,
                    OrgGroup__r.ERP_Division_Code__c,Enable_Material_Group_5__c FROM Organizational_Group_Item__c WHERE 
                    ERP_Pricing_Procedure__c=:pricingProcedureId];
        } 
        return null;
    }


    public List<Organizational_Group_Item__c> getOrganizationalGroupItem()
    {
        if(Apexpages.currentPage().getParameters().get('id')!=null)
            pricingProcedureId = Apexpages.currentPage().getParameters().get('id');
        if(pricingProcedureId!=null)
            //<PP20130711>
            return [SELECT Enable_Request_Class__c,Request_Class__c,Business__r.Business__c,OrgGroup__r.ERP_Sales_Org_Code__c,OrgGroup__r.ERP_Distribution_Channel_Code__c,
                    OrgGroup__r.ERP_Division_Code__c, Enable_Material_Group_5__c  FROM Organizational_Group_Item__c WHERE 
                    ERP_Pricing_Procedure__c=:pricingProcedureId];
        return null;                                           
    }

    //<PP20140418> START
    /*
     * Author           :
     * Method Name      :       getAllBusinessUsersInfo
     * Parameters       :       
     * Return type      :       List<PAWrapper>
     * Description      :       
     */
    public List<PAWrapper> getAllBusinessUsersInfo()
    {

        List<User> userList = new List<User>();
        userList = [SELECT Id, Name FROM User WHERE Id IN (SELECT OwnerId FROM OrgGroup__c WHERE Id = :selectedBU)];
        if(userList != null && userList.size() > 0)
        {
            BUAdminName = userList[0].Name;
        }

        List<User> allUsersInBUList = new List<User>();
        List<PAWrapper> userWrapList = new List<PAWrapper>();
        Set<Id> delApproverIdSet = new Set<Id>();
        //<PR20140901> Added sales org fields to query
        List<Organizational_Group_User__c> orgGroupUsersList = new List<Organizational_Group_User__c>();
        orgGroupUsersList = [SELECT Id,Organizational_Group_Item__r.ERP_Pricing_Procedure__r.SAP_Cluster__c,PA_Notify_Opt_In__c,Related_User__c, OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c FROM Organizational_Group_User__c WHERE
                             Organizational_Group_Item__r.Business__c = :selectedBU]; //<SS20220111> Added SAPCluster Filed of ERP Pricing Procedure
        
        String sourcecluster;//<SS20220111> Defined a string variable to store sapcluster value
        Map<Id,boolean> userIDReceiveFinalNotifMap = new Map<Id,boolean>();
        Set<Id> allBUUsersIdSet = new Set<Id>(); 
        //<PR20140901> START
        Map<Id,String> salesOrgMap = new Map<Id,String>();
        //<PR20140901> END
        for(Organizational_Group_User__c ogu : orgGroupUsersList)
        {
            userIDReceiveFinalNotifMap.put(ogu.Related_User__c,ogu.PA_Notify_Opt_In__c);
            allBUUsersIdSet.add(ogu.Related_User__c);
            sourcecluster=ogu.Organizational_Group_Item__r.ERP_Pricing_Procedure__r.SAP_Cluster__c;//<SS20220111> Getting SAP Cluster Value
        }

       allUsersInBUList = [SELECT Username, User__c, User_Country__c, UserRoleId,UserRole.Name, TimeZoneSidKey, ProfileId,Profile.Name, Out_of_Office__c,
                            Out_of_Office_Start_Date__c, Out_of_Office_End_Date__c, Name, ManagerId, LocaleSidKey,LanguageLocaleKey, Id, Email,
                            E_Pass_ID__c, DelegatedApproverId, Country, External_ERP_ID__c,P80_External_ERP_ID__c,Manager.Name FROM User
                            WHERE Id IN :allBUUsersIdSet AND isActive = true];//<SS20220111> Added P80_External_ERP_ID */
        
        //<PR20140916> START
           List<Organizational_Group_User__c> orgGrpUsersList = new List<Organizational_Group_User__c>();
           orgGrpUsersList = [SELECT Id,PA_Notify_Opt_In__c,Related_User__c, OrgGroup__r.ERP_Sales_Org__c, OrgGroup__r.ERP_Sales_Org_Code__c, Organizational_Group_Item__r.Business__r.Business__c FROM Organizational_Group_User__c WHERE
                               Related_User__c IN :allBUUsersIdSet]; 
        for(Organizational_Group_User__c ogu : orgGrpUsersList)
        {
            //if(ogu.Organizational_Group_Item__r.Business__r.Business__c!=null)
            //{
                if(salesOrgMap.get(ogu.Related_User__c) != null){
                    salesOrgMap.put(ogu.Related_User__c,salesOrgMap.get(ogu.Related_User__c) + ', \r\n' +ogu.Organizational_Group_Item__r.Business__r.Business__c+'-'+ogu.OrgGroup__r.ERP_Sales_Org_Code__c);
                }else{
                    salesOrgMap.put(ogu.Related_User__c, ogu.Organizational_Group_Item__r.Business__r.Business__c+'-'+ogu.OrgGroup__r.ERP_Sales_Org_Code__c);
                }
            //}
            /*else
            {
                salesOrgMap.put(ogu.Related_User__c,'');
            }*/
        }  
        orgGrpUsersList.clear();   // SS20230501 - Added for Heap size optimisation
        //<PR20140916> END           
        for(User u1 : allUsersInBUList)
        {
            delApproverIdSet.add(u1.DelegatedApproverId);
        }
        List<User> delApproverList = new List<User>();
        delApproverList = [SELECT Id,Name FROM User WHERE Id IN :delApproverIdSet];
        Map<Id,String> delApproverIdNameMap = new Map<Id,String>();
        for(User u2 : delApproverList)
        {
            delApproverIdNameMap.put(u2.Id,u2.Name);
        }
        List<PermissionSetAssignment> permSetAsstList = new List<PermissionSetAssignment>();
        permSetAsstList = [SELECT PermissionSetId,AssigneeId,PermissionSet.Name FROM PermissionSetAssignment WHERE AssigneeId IN :allUsersInBUList];
        Map<Id,String> userIdPermSetNamesListMap = new Map<Id,String>();
        for(PermissionSetAssignment psa : permSetAsstList)
        {
            if(!userIdPermSetNamesListMap.containsKey(psa.AssigneeId))
            {
                userIdPermSetNamesListMap.put(psa.AssigneeId,'');
            }
            if(psa.PermissionSet.Name.containsIgnoreCase('Approver'))
            {
                userIdPermSetNamesListMap.put(psa.AssigneeId,userIdPermSetNamesListMap.get(psa.AssigneeId)+',Approver');
            }
            if(psa.PermissionSet.Name.containsIgnoreCase('CSR'))
            {
                userIdPermSetNamesListMap.put(psa.AssigneeId,userIdPermSetNamesListMap.get(psa.AssigneeId)+',CSR');
            }
            if(psa.PermissionSet.Name.containsIgnoreCase('Sales_Admin'))
            {
                userIdPermSetNamesListMap.put(psa.AssigneeId,userIdPermSetNamesListMap.get(psa.AssigneeId)+',Sales Admin');
            }           
        }
          permSetAsstList.clear(); // SS20230501 - Added for Heap size optimisation
        List<GroupMember> groupList = new List<GroupMember>();
        groupList = [SELECT GroupId,UserOrGroupId,Group.Name FROM GroupMember WHERE UserOrGroupId IN :allUsersInBUList];
        Map<Id,String> userIdGroupMap = new Map<Id,String>();
        //<PR20140911> START
        Map<Id,String> publicGrpMap = new Map<Id,String>();
        //<PR20140911> END
        for(GroupMember gm : groupList)
        {
            if(!userIdGroupMap.containsKey(gm.UserOrGroupId))
                userIdGroupMap.put(gm.UserOrGroupId,'');
            if(gm.Group.Name.contains('CPR') && !gm.Group.Name.contains('NCPR'))
                userIdGroupMap.put(gm.UserOrGroupId,userIdGroupMap.get(gm.UserOrGroupId)+'Customer Price Requester');
            if(gm.Group.Name.contains('NCPR'))
                userIdGroupMap.put(gm.UserOrGroupId,userIdGroupMap.get(gm.UserOrGroupId)+'Price List Requester');
            if(userIdGroupMap.get(gm.UserOrGroupId).contains('Customer') && userIdGroupMap.get(gm.UserOrGroupId).contains('Price List'))
            {
                userIdGroupMap.put(gm.UserOrGroupId,'Customer Price Requester,Price List Requester');
            }
            //<PR20140911> START
            if(publicGrpMap.get(gm.UserOrGroupId) != null){
                publicGrpMap.put(gm.UserOrGroupId,publicGrpMap.get(gm.UserOrGroupId) + ', \r\n' +gm.Group.Name);
            }else{
                publicGrpMap.put(gm.UserOrGroupId,gm.Group.Name);
            }
            //<PR20140911> END           
        }
        groupList.clear(); // SS20230501 - Added for Heap size optimisation
        for(User u : allUsersInBUList)
        {
            PAWrapper wrap = new PAWrapper();
            wrap.sObjectRecord = u;
            wrap.stringMap.put('groupMember','');
            wrap.stringMap.put('permissionSet','');
            wrap.stringMap.put('receiveFinalNotif','');
            wrap.stringMap.put('delegatedApp','');
            wrap.stringMap.put('publicGrp','');
            //<SS20220111> START
            wrap.stringMap.put('SAPCluster','');
            if(sourcecluster != NULL)
            {    
                if(sourcecluster == System.Label.SourceClusterCheckP80) //<SS20220111> Checking for P80/Q80 
                {
                    wrap.stringMap.put('SAPCluster','True');
                } 
                else
                {
                    wrap.stringMap.put('SAPCluster','False');
                }
            }
            //<SS20220111> END
            if(userIdGroupMap.containsKey(u.Id))
            {
                wrap.stringMap.put('groupMember',userIdGroupMap.get(u.Id));
            }
            if(userIdPermSetNamesListMap.containsKey(u.Id))
            {
                wrap.stringMap.put('permissionSet',userIdPermSetNamesListMap.get(u.Id).replaceFirst(',', ''));
            }
            if(userIDReceiveFinalNotifMap.containsKey(u.Id))
            {
                if(userIDReceiveFinalNotifMap.get(u.Id))
                {
                    wrap.stringMap.put('receiveFinalNotif','Yes');
                }
                else
                {
                    wrap.stringMap.put('receiveFinalNotif','No');
                }
            }
            if(delApproverIdNameMap.containsKey(u.DelegatedApproverId))
            {
                wrap.stringMap.put('delegatedApp',delApproverIdNameMap.get(u.DelegatedApproverId));
            }
            //<PR20140901> START
            if(salesOrgMap.containsKey(u.Id)){
                wrap.stringMap.put('salesOrg',salesOrgMap.get(u.Id));               
            }
            //<PR20140901> END
            //<PR20140911> START
            if(publicGrpMap.containsKey(u.Id)){
                wrap.stringMap.put('publicGrp',publicGrpMap.get(u.Id));
            }
            //<PR20140911> END
            userWrapList.add(wrap);
        }  
        return userWrapList;
    }
    //<PP20140418> END  
    //<SP20140529> START
    public static String phSObjectType
    {
        get
        {
            return  String.valueOf(BU_PH__c.sObjectType);
        }
        set;
    }
    public static String phFieldsList
    {
        get
        {
            return 'Business_Description__c';
        }
        set;
    }
    public String phWhereClause
    {
        get
        {
            //OrgGroup__c BU = [SELECT ID,Owning_Business__c FROM OrgGroup__c where Id = :selectedBU AND RecordType.Name = 'Business'];
            String BUId = selectedBU;

            return 'OrgGroup__c = \''+BUId+'\'';    
        }
        set;
    }
    //<SP20140529> END  
}