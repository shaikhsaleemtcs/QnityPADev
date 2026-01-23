/*
 * Name      :  PAMaterialSelection
 * Description  :  To save the Material LookUp details and actions
 * Author      :  Infosys Limited
 * Created Date :  13-11-2012
 * Version  Modified Date   Modified By Modification
 * -------------------------------------------------------
      1.1       19/03/13        Anand           changed the limit to 500                                          
 ***********************************************Modification Log************************************************
   <VR20130510>
 Last Modified By   :   Vinoth Rajapandian
 Last Modified Date :   10 May 2013
 Description        :   Adding extra filters in Material Lookup - APAC ROLLOUT1(1.11)                       
 *****************************************************************************************************************
  <VR20130508>
 Last Modified By   :   Vinoth Rajapandian
 Last Modified Date :   08 May 2013
 Description        :   Adding extra condition in material to query based on variable config field - APAC ROLLOUT1(1.12)                        
 *****************************************************************************************************************
 <PP20130705>
 Last Modified By   :   Priyanka Pillala
 Last Modified Date :   05 July 2013
 Description        :   APAC SIT Issue #  - Restricting the Materials mapped to MCM Paste PH from the search results of MCM Green Tape
                         - APAC ROLLOUT1(1.13)                  
 *****************************************************************************************************************
 <UD20130827>
 Last Modified By   :   Utkarsh Dixit
 Last Modified Date :   27 aug 2013
 Description        :   Production Issue: Issue #IS ID-00035105. Added Display_Standardized_rate__c in Org groupitems queries 
 *****************************************************************************************************************
<BB20140312>
 Last Modified By   :   Bisnupriya Budek
 Last Modified Date :   12 Mar 2014
 Description        :   Added query to populate Source Cluster. - CAPITAL PROJECT(2.0) 
 *****************************************************************************************************************
 <SP20140428>
 Last Modified By   :   Shiva
 Last Modified Date :   28 Apr 2014
 Description        :   CAPITAL PROJECT - For Config and Non Config materials
 *****************************************************************************************************************
<TJ20140519>
 Last Modified By   :   Tarun
 Last Modified Date :   19 May 2014
 Description        :   Label for Help Link.
 *****************************************************************************************************************
 <SP20140520>
 Last Modified By   :   Shiva
 Last Modified Date :   20 May 2014
 Description        :   CAPITAL PROJECT - Advanced Material Search
 *****************************************************************************************************************
 <MG04042018> 
 Last Modified By   :   Deepanshi Rajput
 Last Modified Date :   04 April 2018
 Description        :   Updated filters for MCM Green Tape
 *****************************************************************************************************************
<DR05142018>
 Last Modified By   :   Deepanshi Rajput
 Last Modified Date :   14 May 2018
 Description        :   Updated where condition for MCM Green Tape
 Issue #            :   IS ID-00083494|| EC CRM
 **************************************************************************************************************
 <CRM-2021-04-0192>
 Last Modified By   :   Harsh Gurvanshi
 Last Modified Date :   01 Sep 2021
 Description        :   Adding extra condition for BusinessUnit with PH in P80
 Issue #            :   CRM-2021-04-0192|| EC CRM
 **************************************************************************************************************/
 
 public with sharing class PAMaterialSelection implements IPAComponent
{
    //variable used in Material Component
    public boolean displayPopUp{get;set;}
    public string filter_materialCode{get;set;}
    public string filter_material{get;set;} 
    public string from_filter_PH{get;set;}
    public string from_filter_FRB{get;set;}
    public boolean mg2OnPricingTask{get;set;}
    //<VR20130508> Ver 1.11 VR 2013-05-10 APAC Rollout1-Adding Extra variables to hold Market Segment and End User filter values
    public transient List<string> filter_marketSegment{get;set;} 
    public transient List<string> filter_endUse{get;set;}
    //<MS20140923> Adding filter for MG5    
    public transient list<string> filter_MG5{get;set;}
    public transient list<string> filter_MG2_In{get;set;}
    public transient list<string> filter_MG2{get;set;}
    public transient list<string> listOfFilters {get;set;}
    public transient list<string> listSplitPH {get;set;}
    public transient map<string,string> mapOfFilters {get;set;}
    public string whereClause {get;set;}
    public string PHClause {get;set;}
    public string query {get;set;}
    public string q {get;set;}
    //public list<PA_ERP_Material__c> listOfMaterials {get;set;}
    public transient list<Material__c> listOfMaterials;// {get;set;}
    //private list<PA_ERP_Material__c> listOfMaterialRecord {get;set;}
    public transient list<Material__c> listOfMaterialRecord;//{get;set;}
    public boolean displayTableBoolean{get;set;}
    public boolean displayTableOnSearch{get;set;}
    public string materialCodeFromPage{get;set;}
    public string selectedBUFromPage{get;set;}
    public Integer  heighestFRBLevel {get;set;}
    //variables used for pagination.
    public Integer incrementer {get;set;}
    public Integer totalRecords{get;set;}
    public Integer noOfRecordsAPage{get;set;}
    public Integer listSize{get;set;}
    public Integer noOfPages{get;set;}
    public Integer noOfLastPageRecords{get;set;}
    public boolean displayPagination{get;set;}
    public boolean previousButton{get;set;}
    public boolean nextButton{get;set;}
    public boolean lastButton{get;set;}
    public boolean firstButton{get;set;}
    //<VR20130508> Ver 1.11 VR 2013-05-10 APAC Rollout1-Adding extra variable to hold orgGroupItemId
    private id orgGroupItemId;
    //<VR20130508> Ver 1.11 VR 2013-05-10 APAC Rollout1-Adding extra variable to hold Variable Config Materail Flag
    private boolean enableVarConfigMaterial;

    /*for Pricing Procedure*/
    public String salesOrgCode{get;set;}
    public String divCode{get;set;}
    public String distiCode{get;set;}
    public String sourceCluster;

    public static final Id Material_RTYPE_Id = Rtype.getIdByDevName('Material__c','ERP_Material_Extended_Data');
    /*end*/
    public String desiredAction{get;set;}
    //Added - Bala for selectAll
    public boolean selectAllFlag{get;set;}
    //<TJ20140519>
    public String label{get;set;}
    //constructor 

    public integer offsetfromPage{get;set;}
    public integer fromSet{get;set;}
    public integer toSet{get;set;}
    public boolean searchCompleted = false;
    //<TJ20141215> For Issue raised in Spinco
    public String materialCode{get;set;}
    public PAMaterialSelection()
    {
        displayPopUp=false;
        selectAllFlag = false;
        displayTableOnSearch=false;
        displayPagination=false;
        previousButton=false;
        nextButton=false;
        lastButton=false;
        firstButton=false;
        noOfRecordsAPage=10;
        incrementer=0;
        offsetfromPage = 0;
        /**
        adding SAP Cluster condition -neeha
         */     
        List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                          Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c  FROM Organizational_Group_Item__c
                                                          WHERE Business__c =:selectedBUFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                                                          AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND
                                                          OrgGroup__r.ERP_Division_Code__c = :divCode];   


        String sppId;
        if(buOrgGroup!=null && buOrgGroup.size()!=0)
        {
            sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
        }
        List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];


        if(sppList!=null && sppList.size()!=0)
        {
            sourceCluster=sppList.get(0).SAP_Cluster__c;
        }
    }
    //Methods

    /*
     * Author      : 
     * Method Name  :   action
     * Parameters   :   
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference action(){
        if(desiredAction.containsIgnoreCase('selectAll')){
            //selectAllMaterial();
            searchMaterial();        
        }
        else if(desiredaction.equalsignorecase('SaveAndClose'))
        { 
            return saveandClose();
        }
        else if(desiredaction.equalsignorecase('SaveAndContinue'))
        {
            return saveandContinue();
        }
        return null;
    } 


    /*
     * Author      : 
     * Method Name  :   displayPopUpWindowMethod
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference displayPopUpWindow() {
        //<TJ20141215> For Issue raised in Spinco
        System.debug('Inside displayPopUpWindow method');
        if(materialCode==null || materialCode=='' || string.IsBlank(materialCode))
            materialsSelected='';
        return displayMaterialPopUp();          
    }

    /*
     * Author      : 
     * Method Name  :   searchCustomer
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference dosearch() {
        offsetfromPage = 0;
        system.debug(filter_materialCode);
        return searchMaterial();
    }
    /*
     * Author      : 
     * Method Name  :   returnData
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference returnData() {
        return returnMaterials();
    }

    /*
     * Author      : 
     * Method Name  :   closeWindow
     * Parameters   :  
     * Return type  :   PageReference
     * Description  :   
     */
    public PageReference closeWindow(){
        return  closeMaterialPopUpWindow();
    }
    /*
     * Author     : Anand Darshi
     * Method Name : displayMaterialPopUp
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method display the popUp window of Material LookUp.
     */

    private PageReference displayMaterialPopUp() 
    {

        //listOfMaterialRecord =new list<PA_ERP_Material__c>();
        //listOfMaterials= new list<PA_ERP_Material__c>();
        listOfMaterialRecord =new list<Material__c>();
        listOfMaterials= new list<Material__c>();
        filter_material = '';
        from_filter_ph='';
        from_filter_frb='';
        //if Material code entered directly in page then search for that material and display the popUp else Display the PopUp only.

        if(materialCodeFromPage== null || materialCodeFromPage=='')
        {

            displayPopUp=true;
            displayTableOnSearch=false; 
        }
        else
        {

            filter_materialCode=materialCodeFromPage;
            displayPopUp=true;
            materialWrapperList=new list<materialWrapper>();

            //<BB20140312>  Ver 2.0 Populated sourceCluster START
            List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,
                                                              Display_Standardized_Rate__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                                              Retroactive_Limit__c,Enable_Variable_Config_Materials__c,Business__r.Business__c FROM
                                                              Organizational_Group_Item__c WHERE Business__c =:selectedBUFromPage AND
                                                              OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode AND
                                                              OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND
                                                              OrgGroup__r.ERP_Division_Code__c = :divCode];   

            System.debug('buOrgGroup'+buOrgGroup);
            String sppId;
            if(buOrgGroup!=null && buOrgGroup.size()!=0){
                sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
                //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Getting the value for configurable field from Organizational Group Item
                enableVarConfigMaterial = buOrgGroup.get(0).Enable_Variable_Config_Materials__c;
                System.debug('enableVarConfigMaterial:'+enableVarConfigMaterial);
            }
            List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                    SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];

            String sourceCluster;
            if(sppList!=null && sppList.size()!=0){
                sourceCluster=sppList.get(0).SAP_Cluster__c;
            }
            //<BB20140312>  END

            
            //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
            //<BB20140312> Ver 2.0 Modified the where clause in the query to remove space in material Code.
            //<SP20140428> START
            //<MS20140922> Adding MG5 to queries
            if(enableVarConfigMaterial)
            {
                listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                      ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                      ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                      FROM Material__c WHERE ERP_Material_Code__c LIKE :filter_materialCode.trim()+'%' AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial limit 201];
            }
            else
            {
                listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                      ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                      ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                      FROM Material__c WHERE ERP_Material_Code__c LIKE :filter_materialCode.trim()+'%' AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id limit 201];
            }

            //<SP20140428> END

            /*if(listOfMaterialRecord.size()>200 )
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more than 200 records,Please use Filters.'); 
                ApexPages.addMessage(myMsg);
                displayTableOnSearch=false; 
            }
            else*/ 
            if(listOfMaterialRecord.size()==0)
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
                ApexPages.addMessage(myMsg);
                displayTableOnSearch=false;
            } 
            else
            {
                listOfMaterials.addAll(listOfMaterialRecord);

                //<SP20140406> START
                if(listOfMaterials.size() == 201)
                {
                    listOfMaterials.remove(200);
                }
                //<SP20140406> END

                //listOfMaterials.addAll(listOfMaterialRecord);
                //<MA20131011> START
                List<BU_PH__c> phDescList = [SELECT Id,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c,OrgGroup__c,Business_Description__c FROM BU_PH__c WHERE OrgGroup__c=:selectedBUFromPage ];
                Map<string,BU_PH__c> phCodeToBUPHRecMap = new Map<string,BU_PH__c>(); 

                for(BU_PH__c X:phDescList)
                {
                    phCodeToBUPHRecMap.put(X.Product_Hierarchy__r.PH_Code__c,X);
                }
                for( Material__c m:listOfMaterials)
                {                   
                    materialWrapper WraperObj=new materialWrapper();
                    if(m.ERP_Product_Hierarchy_Code__c != null)
                    {
                        WraperObj.materialObj=m;
                        WraperObj.phDescBUPH = phCodeToBUPHRecMap.get(m.ERP_Product_Hierarchy_Code__c);
                    }
                    else
                    {
                        WraperObj.materialObj=m;
                    }
                    materialWrapperList.add(WraperObj);
                }
                //<MA20131011> END
                displayTableOnSearch=true; 
            }

            if(listOfMaterialRecord.size()>200 )
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Search returns more than 200 records,Please use Filters.'); 
                ApexPages.addMessage(myMsg);
                //displayTableOnSearch=false; 
            }

        }
        return null;
    }

    //Extra filters for rollout1
    //<VR20130508> Ver 1.11 VR 2013-05-10 APAC Rollout1-Adding Market Segment Filter in lookup
    public List<SelectOption> MaterialGroup4{

        get {
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                              Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c
                                                              FROM Organizational_Group_Item__c
                                                              WHERE Business__c =:selectedBUFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                                                              AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND
                                                              OrgGroup__r.ERP_Division_Code__c = :divCode];

            if(buOrgGroup!=null && buOrgGroup.size()!=0)
            {
                orgGroupItemId = buOrgGroup.get(0).id;
            }                                               

            List<SelectOption> selectOptMG4List = new List<SelectOption>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 4' AND Organizational_Group_Item__c=:orgGroupItemId ORDER BY ERP_Cus_Mat_Compt_Key__r.Code__c asc];
            for(Org_Group_ERP_Key__c OGKeyObj:OGKey)
            {
                selectOptMG4List.add(new SelectOption(OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c));
            }
            return selectOptMG4List;
        }
        set;
    }

    //<VR20130508> Ver 1.11 VR 2013-05-10 APAC Rollout1-Adding End Use Filter in lookup
    public List<SelectOption> MaterialGroup3{
        get{
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                              Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c
                                                              FROM Organizational_Group_Item__c
                                                              WHERE Business__c =:selectedBUFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                                                              AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND
                                                              OrgGroup__r.ERP_Division_Code__c = :divCode];

            if(buOrgGroup!=null && buOrgGroup.size()!=0)
            {
                orgGroupItemId = buOrgGroup.get(0).id;
            }

            List<SelectOption> selectOptMG3List = new List<SelectOption>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 3' AND Organizational_Group_Item__c=:orgGroupItemId ORDER BY ERP_Cus_Mat_Compt_Key__r.Code__c asc limit 1000];
            for(Org_Group_ERP_Key__c OGKeyObj:OGKey)
            {
                selectOptMG3List.add(new SelectOption(OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c));
            }
            return selectOptMG3List;
        }
        set;

    }   
    //<KJ20150705>
    /*public List<SelectOption> MaterialGroup2{
        get{
            List<SelectOption> selectOptMG2List = new List<SelectOption>();
            //List<PAMaterialGroup2__c> MG2Key = new List<PAMaterialGroup2__c>();
            //MG2Key=[Select Material_Group2_Code__c from PAMaterialGroup2__c where Business__c=:selectedBUFromPage AND Sales_Organization__c=:salesOrgCode];
            //system.debug('customMG2 '+PAMaterialGroup2__c.getAll().values());
            //system.debug('mg2values '+MG2Key);
            //MG2Key=PAMaterialGroup2__c.getAll().values();
            OrgGroup__c bsns=[Select Business__c from OrgGroup__c where id=:selectedBUFromPage];
             Organizational_Group_Item__c MG2Key=[SELECT ERP_Material_Group2_Code__c FROM Organizational_Group_Item__c WHERE Business__c =:selectedBUFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                    AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND OrgGroup__r.ERP_Division_Code__c = :divCode];
            //system.debug('customMG2 '+PAMaterialGroup2__c.getAll().values());
            system.debug('mg2selectedBUFromPage '+selectedBUFromPage);  
            system.debug('mg2salesOrgCode '+salesOrgCode);
            List<String> selectedMG2List = New List<String>();
            List<String> MG2CodeList= New List<String>();           
            if(MG2Key.ERP_Material_Group2_Code__c!=null){
             selectedMG2List = MG2Key.ERP_Material_Group2_Code__c.split(';');
             if(selectedMG2List!=null){
                 for(String st: selectedMG2List){
                    MG2CodeList.add(st.substringBefore('-'));
                 }
             }
             for(String mg2 : MG2CodeList)
             {
                //if(mg2.Business__c==bsns.Business__c){
                  //system.debug('mg2values '+mg2.Material_Group2_Code__c);
                  selectOptMG2List.add(new SelectOption(mg2,mg2));
                //}
             }
            }
            return selectOptMG2List;
        }
        set;
    }*/
    
    //<MS20140918>
    public List<SelectOption> MaterialGroup5{
        get{
            List<Org_Group_ERP_Key__c> OGKey = new List<Org_Group_ERP_Key__c>();
            List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,Latest_Valid_To_Offset_Cust_Spec__c,
                                                              Display_Standardized_Rate__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,Retroactive_Limit__c,Enable_Variable_Config_Materials__c
                                                              FROM Organizational_Group_Item__c
                                                              WHERE Business__c =:selectedBUFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode
                                                              AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND
                                                              OrgGroup__r.ERP_Division_Code__c = :divCode];

            if(buOrgGroup!=null && buOrgGroup.size()!=0)
            {
                orgGroupItemId = buOrgGroup.get(0).id;
            }

            List<SelectOption> selectOptMG5List = new List<SelectOption>();
            OGKey = [SELECT id,ERP_Cus_Mat_Compt_Key__c,ERP_Cus_Mat_Compt_Key__r.Code__c,ERP_Cus_Mat_Compt_Key__r.Name__c FROM Org_Group_ERP_Key__c WHERE ERP_Cus_Mat_Compt_Key__r.Type__c = 'Material Group 5' AND Organizational_Group_Item__c=:orgGroupItemId ORDER BY ERP_Cus_Mat_Compt_Key__r.Code__c asc];
            for(Org_Group_ERP_Key__c OGKeyObj:OGKey)
            {
                selectOptMG5List.add(new SelectOption(OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c,OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Code__c+'-'+OGKeyObj.ERP_Cus_Mat_Compt_Key__r.Name__c));
            }
            return selectOptMG5List;
        }
        set;

    }

    /*
     * Author     : Anand Darshi
     * Method Name : searchMaterial
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method reterive records based on filter criteriya.
     */
    public list<materialWrapper> materialWrapperList {get;set;}
    //public list<materialWrapper> materialWrapperList1 {get;set;}
    map<string,string> codeDesMap = new Map<string, string>();
    private PageReference searchMaterial()
    {  
       system.debug('mg2OnPricingTask&& '+mg2OnPricingTask);
        displayTableBoolean = true;
        String phFilterString ;
        listOfMaterials= new list<Material__c>();
        listOfMaterialRecord =new list<Material__c>();
        materialWrapperList=new list<materialWrapper>();
        //materialWrapperList1=new list<materialWrapper>();
        listOfFilters= new list<string>();
        listSplitPH= new list<string>();
        mapOfFilters= new map<string,string>();
        //variable initialization for PHClaues
        list<integer> listOfSelectedPH = new  list<integer>();  
        map<integer,string> mapOfSelectedPH =new  map<integer,string>();
        map<integer,string> mapOfSelectedPHValue =new  map<integer,string>();
        mapOfSelectedPH.put(0,'ERP_Product_Hierarchy_Level_1_Code__c');
        mapOfSelectedPH.put(2,'ERP_Product_Hierarchy_Level_2_Code__c');
        mapOfSelectedPH.put(4,'ERP_Product_Hierarchy_Level_3_Code__c');
        mapOfSelectedPH.put(6,'ERP_Product_Hierarchy_Level_4_Code__c');
        mapOfSelectedPH.put(8,'ERP_Product_Hierarchy_Level_5_Code__c');
        mapOfSelectedPH.put(10,'ERP_Product_Hierarchy_Level_6_Code__c');
        mapOfSelectedPH.put(12,'ERP_Product_Hierarchy_Level_7_Code__c');
        mapOfSelectedPH.put(14,'ERP_Product_Hierarchy_Level_8_Code__c');
        mapOfSelectedPH.put(16,'ERP_Product_Hierarchy_Level_9_Code__c');
        //<KJ20150518> START     
             Organizational_Group_Item__c MG2Key1=[SELECT ERP_Material_Group2_Code__c FROM Organizational_Group_Item__c WHERE Business__c =:selectedBUFromPage AND OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode AND OrgGroup__r.ERP_Distribution_Channel_Code__c =:distiCode AND OrgGroup__r.ERP_Division_Code__c = :divCode];
        List<String> selectedMG2List = New List<String>();  
        List<String> selectedMG2CodeList = New List<String>();          
            if(MG2Key1.ERP_Material_Group2_Code__c!=null){
              selectedMG2List = MG2Key1.ERP_Material_Group2_Code__c.split(';');
            }
            if(selectedMG2List!=null){
                for(String st : selectedMG2List){
                    selectedMG2CodeList.add(st.substringBefore(' -'));
                }
            }
            selectedMG2List.addAll(selectedMG2CodeList);
        //<KJ20150518> END
        if(filter_materialCode==null || filter_materialCode=='')
        {
            filter_materialCode='';   
        }
        else
        {
            listOfFilters.add('filter_materialCode');
            mapOfFilters.put('filter_materialCode','ERP_Material_Code__c like \''+ String.escapeSingleQuotes(filter_materialCode.trim()) + '%\'  ');
        }

        if(filter_material==null || filter_material=='')
        {
        }
        else
        {
            listOfFilters.add('filter_material');
            mapOfFilters.put('filter_material','Name like \''+ String.escapeSingleQuotes(filter_material.trim()) + '%\' ');
        }

        //Adding Extra Filters for Roll out1
        if(filter_marketSegment != null &&filter_marketSegment.size()!=0 && (!(filter_marketSegment.size()==1 && filter_marketSegment[0]=='--Select--')))
        {
            listOfFilters.add('filter_marketSegment');
            mapOfFilters.put('filter_marketSegment','ERP_Material_Group_4_Code__c IN :filter_marketSegment ');
        }

        if(filter_endUse != null && filter_endUse.size()!=0 && (!(filter_endUse.size()==1 && filter_endUse[0]=='--Select--')))
        {
            listOfFilters.add('filter_endUse');
            mapOfFilters.put('filter_endUse','ERP_Material_Group_3_Code__c IN :filter_endUse ');
        }
        //<MS20140923>Adding filter from MG5
        if(filter_MG5 != null && filter_MG5.size()!=0 && (!(filter_MG5.size()==1 && filter_MG5[0]=='--Select--')))
        {
            listOfFilters.add('filter_MG5');
            mapOfFilters.put('filter_MG5','ERP_Material_Group_5_Code__c IN :filter_MG5 ');
        }
        
        //<KJ20150705>Adding filter from MG2 -START     
        if(selectedMG2List.size()!=0 && mg2OnPricingTask==true)
        {
            listOfFilters.add('selectedMG2List');
            mapOfFilters.put('selectedMG2List','ERP_Material_Group_2_Code__c NOT IN :selectedMG2List ');
        }
        if(selectedMG2List.size()!=0 && mg2OnPricingTask==false)
        {
            listOfFilters.add('selectedMG2List');
            mapOfFilters.put('selectedMG2List','ERP_Material_Group_2_Code__c IN :selectedMG2List ');
        }       
        //<KJ20150705>Adding filter from MG2-END    

        if(from_filter_PH==null || from_filter_PH=='')
        {
        }
        else
        {
            listOfFilters.add('filter_PH');

            //<SP20140520> START
            list<string> phSelectedList = new list<string>();
            phSelectedList = from_filter_PH.split(',');
            string phField =' ';

            for(integer i=0; i<phSelectedList.size(); i++)
            {
                if(i != phSelectedList.size()-1)
                    phField = phField+' '+'ERP_Product_Hierarchy_Code__c like \'%' + phSelectedList[i] + '%\' '+' OR';
                else
                    phField = phField+' '+'ERP_Product_Hierarchy_Code__c like \'%' +phSelectedList[i] + '%\' ';
            }
            mapOfFilters.put('filter_PH','('+phField+')');

            //<SP20140520> END

            //mapOfFilters.put('filter_PH','ERP_Product_Hierarchy_Code__c like \'%' + String.escapeSingleQuotes(FinalPH.trim()) + '%\' ');

        }
        system.debug('PH: '+from_filter_PH);

        if(from_filter_FRB==null || from_filter_FRB==''){
            // from_filter_FRB='';
        }
        else{
            listOfFilters.add('from_filter_FRB');
            /* Version 1.2 start Shiva*/
            //String trimFRB=from_filter_FRB.trim();
            //String escapedString = String.escapeSingleQuotes(trimFRB);
            //String.escapeSingleQuotes(from_filter_FRB.trim())
            //mapOfFilters.put('from_filter_FRB','ERP_Profit_Center_'+string.valueOf(heighestFRBLevel)+'_Code__c like \'%' + escapedString + '%\' ');
            /* Version 1.2 end*/

            //<SP20140520> START
            list<string> frbSelectedList = new list<string>();
            frbSelectedList = from_filter_FRB.split(',');
            string frbField =' ';

            for(integer i=0; i<frbSelectedList.size(); i++)
            {
                if(i != frbSelectedList.size()-1)
                    frbField = frbField+' '+'ERP_Profit_Center_Code__c like \'%' +frbSelectedList[i]+ '%\' '+' OR';
                else
                    frbField = frbField+' '+'ERP_Profit_Center_Code__c like \'%' +frbSelectedList[i]+ '%\' ';
            }

            mapOfFilters.put('from_filter_FRB','('+frbField+')');
            //<SP20140520> END

        }

        /**
            adding SAP Cluster condition -neeha
         */
        //<PP20130705> -- Ver 1.13 -- Adding Business__r.Business__c in the query
        List<Organizational_Group_Item__c>  buOrgGroup = [SELECT Id,ERP_Pricing_Procedure__c,Max_Valid_From_Offset_Cust_Spec__c,
                                                          Display_Standardized_Rate__c,Latest_Valid_To_Offset_Cust_Spec__c,Latest_Valid_From_Offset_Non_Cust_Spec__c,
                                                          Retroactive_Limit__c,Enable_Variable_Config_Materials__c,Business__r.Business__c FROM
                                                          Organizational_Group_Item__c WHERE Business__c =:selectedBUFromPage AND
                                                          OrgGroup__r.ERP_Sales_Org_Code__c = :salesOrgCode AND
                                                          OrgGroup__r.ERP_Distribution_Channel_Code__c = :distiCode AND
                                                          OrgGroup__r.ERP_Division_Code__c = :divCode]; 
        //system.debug('buOrgGroup:'+buOrgGroup);                                                           
        String sppId;
        if(buOrgGroup!=null && buOrgGroup.size()!=0){
            sppId=buOrgGroup.get(0).ERP_Pricing_Procedure__c;
            //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Getting the value for configurable field from Organizational Group Item
            enableVarConfigMaterial = buOrgGroup.get(0).Enable_Variable_Config_Materials__c;
        }
        List<ERP_Pricing_Procedure__c> sppList=[select Doc_Type__c,Pricing_Procedure__c,Pricing_Procedure_Code__c,Pricing_Procedure_Description__c,
                                                SAP_Application_Id__c,SAP_Client_Id__c,SAP_Cluster__c,Status__c FROM ERP_Pricing_Procedure__c where Id=:sppId ];
        //system.debug('sppList:'+sppList); 
        String sourceCluster;
        if(sppList!=null && sppList.size()!=0){
            sourceCluster=sppList.get(0).SAP_Cluster__c;
        }                                                
        /*adding source cluster end*/

        //<PP20130705> -- Ver 1.13 START
        boolean isMCMGreenTape = false;
        boolean isMCMPaste = false;
        if(buOrgGroup!=null && buOrgGroup.size()!=0 && (buOrgGroup.get(0).Business__r.Business__c == 'MCM AP Green Tape' ||buOrgGroup.get(0).Business__r.Business__c == 'MCM NA Green Tape' || buOrgGroup.get(0).Business__r.Business__c == 'MCM EMEA Green Tape'))
        {
            isMCMGreenTape = true;
        }
        else if(buOrgGroup!=null && buOrgGroup.size()!=0 && (buOrgGroup.get(0).Business__r.Business__c == 'MCM AP Paste' ||buOrgGroup.get(0).Business__r.Business__c == 'MCM NA Paste' || buOrgGroup.get(0).Business__r.Business__c == 'MCM EMEA Paste'))
        {
            isMCMPaste = true;
        }
        //<PP20130705> -- Ver 1.13 END
        List<BU_PH__c> phList = new List<BU_PH__c>(); 
        //system.debug('Business for BUPH:'+buOrgGroup.get(0).Business__r.Business__c);
        phList=[SELECT Product_Hierarchy__r.PH_Code__c,Product_Hierarchy__r.PH_Level__c from BU_PH__c where OrgGroup__r.Business__c=:buOrgGroup.get(0).Business__r.Business__c AND (Product_Hierarchy__r.PH_Level__c = 2 OR Product_Hierarchy__r.PH_Level__c = 1)];



        List<String> phFilt = new List<String>();       
        for(BU_PH__c ph: phList)
        {
            String phWC;
            if(ph.Product_Hierarchy__r.PH_Level__c == 1)
                phWC = ph.Product_Hierarchy__r.PH_Code__c;
            else
                phWC = ph.Product_Hierarchy__r.PH_Code__c + '%';                
            phFilt.add(phWC);
        }
        System.debug(logginglevel.error,'*****phFilt'+phFilt);
        if(listOfFilters.size()==0)
        {System.debug('Cluster'+sourceCluster+' Material_RTYPE_Id '+ Material_RTYPE_Id+' enableVarConfigMaterial'+ salesOrgCode+' '+distiCode+' '+isMCMGreenTape+' '+isMCMPaste);
            //<PP20130705> -- Ver 1.13 START
            if(isMCMGreenTape)
            {
                //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                //<SP20140428>  START
                //<MS20140922> Adding MG5 to queries
                //<KJ20150518> Adding MG2 to queries
                //<MG04042018> - Updated filters for MCM Green Tape
                 String phCode = System.Label.BusinessSpecific_Material;
                 List<String> splitPhCode = new List<string>();
                 List<String> PHfilter = new List<String>();
                 splitPhCode.addall(phCode.split(','));
                 for(String Str : splitPhCode )
                {
                    Str = str+'%';
                    PHfilter.add(Str);    
                }
                if(enableVarConfigMaterial)
                {
                     //<MG04042018> - Updated filters for MCM Green Tape
                    listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                          ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                          ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                          FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial
                                         AND ERP_Product_Hierarchy_Code__c like :PHfilter limit 201 offset : offsetfromPage];
                }
                else
                {
                    //<MG04042018> - Updated filters for MCM Green Tape
                   listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id 
                                AND ERP_Product_Hierarchy_Code__c like :PHfilter limit 201 offset : offsetfromPage];
        }
                //<SP20140428>  END
            }
            else if(isMCMPaste)
            {
                //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                //<MS20140922> Adding MG5 to queries
                //<KJ20150518> Adding MG2 to queries
                if(enableVarConfigMaterial)
                {
                    listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                          ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                          ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                          FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial AND ERP_Product_Hierarchy_Code__c like :'F423TF%'
                                              AND (NOT ERP_Material_Code__c like :'B%') limit 201 offset : offsetfromPage];
                }
                else
                {   
                    listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                          ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                          ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                          FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Product_Hierarchy_Code__c like :'F423TF%' 
                                              AND (NOT ERP_Material_Code__c like :'B%') limit 201 offset : offsetfromPage];
                }                     
                //System.debug('^^^  inside else if MCMPaste Source_Cluster'+sourceCluster+'Material_RTYPE_Id'+ Material_RTYPE_Id+'enableVarConfigMaterial'+ enableVarConfigMaterial);
            }           
            else
            {
                //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
                //<MS20140922> Adding MG5 to queries
                //<KJ20150518> Adding MG2 to queries
                OrgGroup__c bsns=[Select Business__c from OrgGroup__c where id=:selectedBUFromPage];
                
                if(enableVarConfigMaterial)
                {
                    listOfMaterialRecord=[SELECT Name,ERP_Material_Group_2__c,ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1__c,ERP_Material_Group_2_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,
                                          ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,
                                          ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c
                                          FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial AND ERP_Product_Hierarchy_Code__c like :phFilt limit 201 offset : offsetfromPage];
                }
                else
                { 
                    //Start <CRM-2021-04-0192> - Adding If condition check for the BusinessUnit with PH in P80 and remmoving ERP_Product_Hierarchy_Code__c from where clause.
                    if( sourceCluster  == System.Label.SourceClusterCheckP80 && !BusinessUnitwithPHinP80__c.getAll().containsKey(buOrgGroup.get(0).Business__r.Business__c)){
                    listOfMaterialRecord=[SELECT Name,ERP_Material_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Material_Group_2_Code__c,ERP_Profit_Center__c,ERP_Material_Group_2__c,ERP_Profit_Center_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c 
                                          FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id limit 201 offset : offsetfromPage];
                    }else {
                        System.debug('ERP_Source_Cluster__c'+ sourceCluster + 'ERP_Sales_Org_Code__c'+salesOrgCode );
                        System.debug('ERP_Distribution_Channel_Code__c='+distiCode +'RecordTypeId'+ Material_RTYPE_Id +'ERP_Product_Hierarchy_Code__c like'+phFilt+ 'offset' +offsetfromPage );
                        
                        listOfMaterialRecord=[SELECT Name,ERP_Material_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Material_Group_2_Code__c,ERP_Profit_Center__c,ERP_Material_Group_2__c,ERP_Profit_Center_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c 
                                          FROM Material__c WHERE ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode AND RecordTypeId = :Material_RTYPE_Id AND ERP_Product_Hierarchy_Code__c like :phFilt limit 201 offset : offsetfromPage];
                    
                    }//End <CRM-2021-04-0192>
                }
                
                
            }
            //<PP20130705> -- Ver 1.13 END

            //<SP20140406> START
            /*if(listOfMaterialRecord.size()>200 )
            {
                //system.debug('^^ inside if if'+listOfFilters);
                listOfMaterialRecord.clear();
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more than 200 records,Please use Filters'); 
                ApexPages.addMessage(myMsg); 
                displayTableOnSearch=false;
            }
            else
            {*/ //<SP20140406> END

            if(listOfMaterialRecord.size()> 200 )
            {
                //listOfMaterialRecord.clear(); //<SP20140406>
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Search returns more than 200 records,Please use Filters'); 
                ApexPages.addMessage(myMsg); 
                //displayTableOnSearch=false; //<SP20140406>
            }
            listOfMaterials.clear();
            listOfMaterials.addAll(listOfMaterialRecord);
            listOfMaterialRecord =new list<Material__c>();
            //<SP20140406> START
            if(listOfMaterials.size() == 201)
            {
                listOfMaterials.remove(200);
            }
            //<SP20140406> END
            //<MA20131011> START
            List<BU_PH__c> phDescList = [SELECT Id,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c,OrgGroup__c,Business_Description__c FROM BU_PH__c WHERE OrgGroup__c=:selectedBUFromPage ];
            Map<string,BU_PH__c> phCodeToBUPHRecMap = new Map<string,BU_PH__c>(); 

            for(BU_PH__c X:phDescList)
            {
                phCodeToBUPHRecMap.put(X.Product_Hierarchy__r.PH_Code__c,X);
            }
            phDescList.clear();

            materialWrapperList.clear();
            for( Material__c m:listOfMaterials)
            {
                materialWrapper WraperObj=new materialWrapper();
                codeDesMap.put(m.ERP_Material_Code__c,m.name);
                if(m.ERP_Product_Hierarchy_Code__c != null)
                {
                    WraperObj.materialObj=m;
                    WraperObj.materialCode = m.ERP_Material_Code__c;
                    if(selectAllFlag!=null  && selectAllFlag)
                        WraperObj.isselected = true;
                    //WraperObj.dummy=m.name+'-'+m.ERP_Material_Code__c+m.ERP_Product_Hierarchy_Code__c+m.ERP_Profit_Center_Code__c+m.ERP_Profit_Center__c+m.ERP_Material_Group_3_Code__c+m.ERP_Material_Group_3__c;
                    //WraperObj.phDescBUPH = phCodeToBUPHRecMap.get(m.ERP_Product_Hierarchy_Code__c);
                }
                else
                {
                    WraperObj.materialObj=m;
                    WraperObj.materialCode = m.ERP_Material_Code__c;
                    if(selectAllFlag)
                        WraperObj.isselected = true;
                    //WraperObj.dummy=m.name;materialWrapperList1
                }
                materialWrapperList.add(WraperObj);
                //materialWrapperList1.add(WraperObj);
            }
            listOfMaterials= new list<Material__c>();
            //<MA20131011> END
            displayTableOnSearch=true;
            //} //<SP20140406> START

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
            /* Version 1.2 start Added SO and DC to the where clause- Shiva*/
            //<VR20130510> Ver 1.12 VR 2013-05-10 APAC Rollout1-Adding Extra condition in query to query based on configurable field
            whereClause =whereClause+' '+'AND ERP_Source_Cluster__c=:sourceCluster AND ERP_Deletion_Flag__c=false AND ERP_Sales_Org_Code__c=:salesOrgCode AND ERP_Distribution_Channel_Code__c=:distiCode' /* AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial*/;
            /* Version 1.2 end Shiva*/

            //<SP20140428> START
            if(enableVarConfigMaterial)
            {
                whereClause =whereClause+' '+'AND ERP_Material_General_Data__r.ERP_IsConfigurable__c=:enableVarConfigMaterial';
            }
            //<SP20140428> END
            //Start <CRM-2021-04-0192>
            if( sourceCluster  == System.Label.SourceClusterCheckP80 ){
                phFilterString = '';
            }else{
                phFilterString = ' AND ERP_Product_Hierarchy_Code__c like :phFilt ';
            }//End <CRM-2021-04-0192>
            //<PP20130705> -- Ver 1.13 START
            //<MS20140922> Adding MG5 to queries
            //<KJ20150518> Adding MG2 to queries
            if(isMCMGreenTape)
            {
                //List<String> phCodesMCMAPPasteList = PAUtil.getPHForMCMAPPaste();
                //String phCode = 'F423GT';
                //<MG04042018> - Updated filters for MCM Green Tape
                String phCode = System.Label.BusinessSpecific_Material;
                List<String> splitPhCode = new List<string>();
                splitPhCode.addall(phCode.split(','));
                String wherePHcode ;
                 for (String str:splitPhCode)
                 {
                     if(string.isBlank(wherePHcode))
                     {
                         //wherePHcode = 'ERP_Product_Hierarchy_Code__c like \'%'+str+'\'';
                         //<DR05142018>
                         wherePHcode = 'ERP_Product_Hierarchy_Code__c like \''+ str + '%\' ';
                         system.debug(LoggingLevel.ERROR,'@@@Mansi--inside---');
                     } 
                     else
                     {
                         //wherePHcode+= 'OR ERP_Product_Hierarchy_Code__c like \'%'+str+'\'';
                         //<DR05142018>
                         wherePHcode+= 'OR ERP_Product_Hierarchy_Code__c like \''+ str + '%\' ';
                     }
                     
                 }
                //query='SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Source_Cluster__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c FROM Material__c' +whereClause + ' AND ERP_Product_Hierarchy_Code__c like \''+phCode+'%\' limit 201 offset : offsetfromPage';
                query='SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Source_Cluster__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c FROM Material__c' +whereClause + ' AND ('+wherePHcode+') limit 201 offset : offsetfromPage';
            }
            else if(isMCMPaste)
            {
                String alphabet = 'B';              
                query='SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Source_Cluster__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c FROM Material__c' +whereClause + ' AND (NOT ERP_Material_Code__c like \''+alphabet + '%\') limit 201 offset : offsetfromPage';
            }
            else
            {
                query='SELECT Name,ERP_Material_Group_2__c,ERP_Material_Group_2_Code__c,ERP_Material_Code__c,ERP_Source_Cluster__c,ERP_Product_Hierarchy_Level_1__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4__c,ERP_Product_Hierarchy_Level_4_Code__c,ERP_Product_Hierarchy_Level_5__c,ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7__c,ERP_Product_Hierarchy_Level_7_Code__c,ERP_Product_Hierarchy_Level_8__c,ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9__c,ERP_Product_Hierarchy_Level_9_Code__c,Product_Hierarchy__c,ERP_Product_Hierarchy_Code__c ,ERP_Profit_Center_10__c,ERP_Profit_Center_10_Code__c,ERP_Profit_Center_Code__c,ERP_Profit_Center__c,ERP_Profit_Center_4__c,ERP_Profit_Center_4_Code__c,ERP_Profit_Center_5__c,ERP_Profit_Center_5_Code__c,ERP_Profit_Center_6__c,ERP_Profit_Center_6_Code__c,ERP_Profit_Center_7__c,ERP_Profit_Center_7_Code__c,ERP_Profit_Center_8__c,ERP_Profit_Center_8_Code__c,ERP_Profit_Center_9__c,ERP_Profit_Center_9_Code__c,ERP_Material_Group_3_Code__c,ERP_Material_Group_4_Code__c,ERP_Material_Group_4__c,ERP_Material_Group_3__c,ERP_Material_Group_5__c,ERP_Material_Group_5_Code__c FROM Material__c' +whereClause + phFilterString+' limit 201 offset : offsetfromPage';
            }
            //<PP20130705> -- Ver 1.13 END


            /* Version 1.1 Shiva start*/
            List<BU_PH__c> phDescList = [SELECT Id,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c,OrgGroup__c,Business_Description__c FROM BU_PH__c WHERE OrgGroup__c=:selectedBUFromPage ];
            map<string,BU_PH__c> phCodeToBUPHRecMap = new map<string,BU_PH__c>(); 

            for(BU_PH__c X:phDescList)
            {
                phCodeToBUPHRecMap.put(X.Product_Hierarchy__r.PH_Code__c,X);
            }
            phDescList.clear();
            /* Version 1.1 Shiva end*/
            System.debug('sourceCluster:'+sourceCluster);
            System.debug('salesOrgCode:'+salesOrgCode);
            System.debug('distiCode:'+distiCode);
            System.debug('phFilt:'+phFilt);
            listOfMaterialRecord=database.query(query);

            System.debug(logginglevel.error,'*****listOfMaterialRecord'+listOfMaterialRecord.size()+'**'+query);
            listOfMaterialRecord = PAUtil.sortList(listOfMaterialRecord, 'Name', 'asc');

            //<SP20140406>
            /*
            if(listOfMaterialRecord.size()>200 )
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Search returns more than 200 records,Please use Filters.'); 
                ApexPages.addMessage(myMsg);
                displayTableOnSearch=false; 
            }
            else*/
            if(listOfMaterialRecord.size()==0)
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found.'); 
                ApexPages.addMessage(myMsg);
                displayTableOnSearch=false;
            } 
            else
            {   
                /* Version 1.1 Shiva start -- modified*/
                listOfMaterials.addAll(listOfMaterialRecord);
                //<SP20140406> START
                if(listOfMaterials.size() == 201)
                {
                    listOfMaterials.remove(200);
                }
                //<SP20140406> END
                materialWrapperList.clear();
                for( Material__c m:listOfMaterials)
                {
                    materialWrapper WraperObj=new materialWrapper();
                    if(m.ERP_Product_Hierarchy_Code__c != null)
                    {
                        WraperObj.materialObj=m;
                        WraperObj.phDescBUPH = phCodeToBUPHRecMap.get(m.ERP_Product_Hierarchy_Code__c);
                        if(selectAllFlag)
                            WraperObj.isselected = true;
                    }
                    else
                    {
                        WraperObj.materialObj=m;
                        if(selectAllFlag)
                            WraperObj.isselected = true;
                    }
                    materialWrapperList.add(WraperObj);
                }
                /* Version 1.1 Shiva end*/
                displayTableOnSearch=true; 
            }
            if(listOfMaterialRecord.size()>200 )
            {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Search returns more than 200 records,Please use Filters.'); 
                ApexPages.addMessage(myMsg);
                //displayTableOnSearch=false; 
            }

        }
        if(offsetfromPage<2001)
        {
            fromSet=offsetfromPage+1;
            toSet=fromSet+materialWrapperList.size()-1;
            if(fromSet<1&&materialWrapperList.size()>0)
                fromSet=1;
            if(toSet<1&&materialWrapperList.size()>0)
                toSet=1;
            if(fromSet>2000)
                fromSet=2000;
            if(toSet>2000)
                toSet=2000;
        }

        //PAGINATION COMMENTED FOR TIME BEING
        //pagination logic on searched record.
        return null;
    }
    public void dosearchwithOffsetBack()
    {
        materialWrapperList.clear();
        selectAllFlag = false;
        codeDesMap = new map<string,string>(); 
        if(offsetfromPage>200)
            offsetfromPage = offsetfrompage-200;
        else
            offsetfromPage = 0;
        system.debug('Offset :-'+offsetfromPage);
        selectAllFlag=false;        
        searchMaterial();
    }

    public void dosearchwithOffset()
    {
        materialWrapperList.clear();
        selectAllFlag = false;
        codeDesMap = new map<string,string>(); 
        if(offsetfromPage<=1800)
        {
            offsetfromPage = offsetfromPage+200;
            searchMaterial();
        }
        else
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'search completed on first 2000 records,please filter the results!'); 
            ApexPages.addMessage(myMsg);
            materialWrapperList.clear();

        }
        selectAllFlag=false;
        system.debug('materialWrapperList :-'+materialWrapperList.size());
        system.debug('Offset :-'+offsetfromPage);
    }




    /*
     * Author     : Anand Darshi
     * Method Name : closeMaterialPopUp
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method closes Material LookUp.
     */
    public string materialsSelected {get;set{
        System.debug('Setting value materialsSelected:'+value);
        materialsSelected = value;
    }}
    //added to populate material description
    public String materailDescription{get;set;} 

    public PageReference returnMaterials()
    {
        displayPopUp=false;  
        materialsSelected='';
        materailDescription=''; 
        for(integer i=0;i<materialWrapperList.size();i++)
        {
            if(materialWrapperList[i].isSelected && !materialsSelected.contains(materialWrapperList[i].materialObj.ERP_Material_Code__c))
            {
                materialsSelected= materialsSelected +materialWrapperList[i].materialObj.ERP_Material_Code__c +' ,';
                materailDescription=materailDescription + materialWrapperList[i].materialObj.ERP_Material_Code__c+ '='+materialWrapperList[i].materialObj.Name+' `';
            }
        }
        if(!string.IsBlank(materialsSelected))
        {
            materialsSelected=materialsSelected.substring(0, materialsSelected.length()-1);
        }
        if(!string.IsBlank(materailDescription))
        { 
            materailDescription=materailDescription.substring(0, materailDescription.length()-1);
        } 

        filter_materialCode = '';
        filter_material = '';
        from_filter_PH = '';
        from_filter_FRB='';

        return null;
    }
    /*
     * Author     : Anand Darshi
     * Method Name : closeMaterialPopUp
     * Parameters  : No parameters
     * Return type : Pagereference
     * Description : This Method closes Material LookUp.
     */
    public PageReference closeMaterialPopUpWindow()
    {
        selectAllFlag= false;
        displayPopUp=false;
        filter_materialCode = '';
        filter_material = '';
        from_filter_PH = '';
        from_filter_FRB='';
        materialsSelected='';
        materailDescription=''; 

        return null;
    }

    //Pagination Concept

    /*
     * Author     : Anand Darshi
     * Method Name : nextPage
     * Parameters  : No parameters
     * Return type : void
     * Description : This Method display First page.
     */
    public void nextPage()
    {      
        listSize= listOfMaterials.size();
        noOfPages=listSize/noOfRecordsAPage;
        incrementer=incrementer+noOfRecordsAPage;
        previousButton=true;
        nextButton=true;
        lastButton=true;
        firstButton=true;
        if(incrementer>=noOfPages*noOfRecordsAPage)
        {
            nextButton=false;
            lastButton=false;
        }
    }

    /*
     * Author     : Anand Darshi
     * Method Name : firstPage
     * Parameters  : No parameters
     * Return type : void
     * Description : This Method display First page.
     */
    public void firstPage()
    {
        incrementer=0;  
        previousButton=false;
        nextButton=true;
        lastButton=true;
        firstButton=false;

    }

    /*
     * Author     : Anand Darshi
     * Method Name : lastPage
     * Parameters  : No parameters
     * Return type : void
     * Description : This Method display Last page.
     */
    public void lastPage()
    {   

        lastButton=false;
        previousButton=true;
        nextButton=false;
        firstButton=true;
        listSize= listOfMaterials.size();
        noOfPages=listSize/noOfRecordsAPage;
        noOfLastPageRecords = math.mod(listSize,noOfPages); 

        if(noOfLastPageRecords==0){
            incrementer= listSize - noOfRecordsAPage;
        }
        else {
            incrementer= listSize - noOfLastPageRecords ;
        }
    } 

    /*
     * Author     : Anand Darshi
     * Method Name : previousPage
     * Parameters  : No parameters
     * Return type : void
     * Description : This Method display previous page.
     */
    public void previousPage()
    {
        incrementer=incrementer-noOfRecordsAPage;

        if(incrementer<noOfRecordsAPage){
            incrementer=0;
        }
        nextButton=true;
        lastButton=true;
        firstButton=true;

        if(incrementer==0){
            previousButton=false;
            firstButton=false;
        }
    }   
    public class materialWrapper
    {
        public   boolean isSelected {get;set;}
        //public transient string materialCodeDesc{get;set;}
        public string materialCode;//{get;set;}
        /*
        public string dummy{get;set;}
        public string dummy1{get;set;}
        public string dummy2{get;set;}
        public string dummy3{get;set;}
        public string dummy4{get;set;}
        public string dummy5{get;set;}
        public string dummy6{get;set;}
        public PA_ERP_Material__c materialObj {get;set;}
         */
        public  transient  Material__c materialObj {get;set;}

        public  transient BU_PH__c phDescBUPH {get;set;}

        public materialWrapper(){
            this.isSelected =false;

        }
    }
    //added - bala Feb 27

    /*private void selectAllMaterial()
    {
        //System.debug('materialWrapperList1:-'+materialWrapperList1);
        if(selectAllFlag)
            for(materialWrapper matWrap:materialWrapperList)
            {
                matWrap.isSelected = true;
            }
        else
            for(materialWrapper matWrap:materialWrapperList)
            {
                matWrap.isSelected = false;
            }
    }*/

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

    //<SP2014052014>
    public pagereference saveandContinue()
    {
        System.debug('inside save and continue:'+materialWrapperList);
        boolean flag = false;
        selectAllFlag = false;
        map<integer,boolean> selected = new map<Integer,boolean>();
        integer i=0;
        for(materialWrapper mat: materialWrapperList)
        {
            if(mat.isSelected == true)
            {
                flag = true;
                selected.put(i,true);
                //break;
            }
            i++;
        } 
        searchMaterial();
        i=0;
        for(materialWrapper mat: materialWrapperList)
        {
            if(selected.containsKey(i))
                mat.isSelected = true;
            i++;
        }

        selected = new map<Integer,boolean>();
        if(flag == false)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
            ApexPages.addMessage(myMsg);
        }
        else
        {
            if(!String.isBlank(materialsSelected))
            {
                materialsSelected = materialsSelected+',';
            }
            if(!String.isBlank(materailDescription))
            {
                materailDescription = materailDescription+'==';
            }
            System.debug('materialsSelected:'+materialsSelected);
            for(materialWrapper mat: materialWrapperList)
            {
                System.debug('Material :'+mat);
                if(mat.isSelected == true &&  !materialsSelected.contains(mat.materialObj.ERP_Material_Code__c))
                {
                    /*materialsSelected = materialsSelected +mat.materialObj.ERP_Material_Code__c +',';
                    materailDescription = materailDescription +mat.materialObj.ERP_Material_Code__c+ '='+mat.materialObj.Name+' `';
                     */
                    materialsSelected = materialsSelected +mat.materialObj.ERP_Material_Code__c+',';
                    //materailDescription = materailDescription +mat.materialObj.ERP_Material_Code__c+ '='+mat.materialObj.Name+' `';
                    materailDescription = materailDescription +mat.materialObj.ERP_Material_Code__c+ '='+mat.materialObj.name+' `';
                }
            }
            if(!string.IsBlank(materialsSelected))
            {
                materialsSelected=materialsSelected.substring(0, materialsSelected.length()-1);
            }
            if(!string.IsBlank(materailDescription))
            { 
                materailDescription=materailDescription.substring(0, materailDescription.length()-1);
            }
        } 
        return null;
    }

    public pagereference saveandClose()
    {
        if(selectAllFlag)
            searchMaterial();
        boolean flag = false;
        selectAllFlag = false;
        integer i=0;
        map<integer,boolean> selected = new map<Integer,boolean>();
        for(materialWrapper mat: materialWrapperList)
        {
            if(mat.isSelected == true)
            {
                flag = true;
                selected.put(i,true);
                //break;
            }
            i++;
        } 
        searchMaterial();
        i=0;
        for(materialWrapper mat: materialWrapperList)
        {
            if(selected.containsKey(i))
                mat.isSelected = true;
            i++;
        }

        if(flag == false)
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.No_Record_Selected_Error);  
            ApexPages.addMessage(myMsg);
        }
        else
        {
            System.debug('Material selecyted:'+materialsSelected);
            if(!String.isBlank(materialsSelected))
            {
                materialsSelected = materialsSelected+',';
            }
            if(!String.isBlank(materailDescription))
            {
                materailDescription = materailDescription+'==';
            }

            for(materialWrapper mat: materialWrapperList)
            {
                System.debug('material:'+mat);
                if(mat.isSelected == true && !materialsSelected.contains(mat.materialObj.ERP_Material_Code__c))
                {
                    materialsSelected = materialsSelected +mat.materialObj.ERP_Material_Code__c+',';
                    //materailDescription = materailDescription +mat.materialObj.ERP_Material_Code__c+ '='+mat.materialObj.Name+' `';
                    materailDescription = materailDescription +mat.materialObj.ERP_Material_Code__c+ '='+mat.materialObj.Name+' `';
                }
            }
            System.debug('Material selecyted:'+materialsSelected);
            if(!string.IsBlank(materialsSelected))
            {
                materialsSelected=materialsSelected.substring(0, materialsSelected.length()-1);
            }
            if(!string.IsBlank(materailDescription))
            { 
                materailDescription=materailDescription.substring(0, materailDescription.length()-1);
            } 
            displayPopUp=false; 
            displayTableOnSearch = false;
            System.debug('Material selecyted:'+materialsSelected);
            System.debug('Material materailDescription:'+materailDescription);
        }
        materialWrapperList = new List<materialWrapper>();
        return null;
    }



}