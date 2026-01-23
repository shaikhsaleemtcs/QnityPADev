/*
 * Name              :   PAUtil
 * Description  :   This class is a store for commonly used methods across application
 * Author        :   Infosys Limited
 * Created Date :   NA
 *
 * Version      Modified Date         Modified By       Modification
 *  1.0              09-02-2013             Bala                Added Flr and Ref Logic
 *  1.1              15-02-2013             Bala                Changed the Permission set Names
 *  1.2              15-02-2013             Utkarsh       Added a method to send Email.
 *  1.3              18-02-2013             Bala                Updated Flr And Ref Logic
 *  1.4              19-02-2013             Bala                Updated Flr And Ref Logic 
 *  1.5              21-02-2013             Bala                Added new method for bulk flr and ref
 *  1.6              22-02-2013             Bala                Removed older methods 
 *  1.7              26-02-2013             Bala                added method call to static block
 *  1.8              26-02-2013             Bala                Added condition for below flr and ref if UoM conversion needed for PH KC 
                                                                                         and added type casted rate and New Rate to Decimal
 *   1.9                    30-03-2013              Bala                    Added uOM conversion(using Maps) and concised few logic                                                                   
 *   2.0                    14-06-2013              Neeha             Changed Division code to acces it from Request instead of PRI                                         
 * -------------------------------------------------------------
 ***********************************************Modification Log************************************************
<PP20130424>
Last Modified By    :      Priyanka Pillala
Last Modified Date  :      24 Apr 2013
Description         :      1)Added method for conversion of UoM to base UoM - APAC ROLLOUT1(2.0)
                                        2)Added method to determine locale separator - APAC ROLLOUT1(2.1)
 ***********************************************Modification Log************************************************
<PP20130524>
Last Modified By    :      Priyanka Pillala
Last Modified Date  :      24 May 2013
Description         :      Added logic for Plus/Minus -- If Plus/Minus code is null, sign of the rate remains the 
                                         same as user enters, else sign is in accordance with the Plus/Minus code - APAC ROLLOUT1(2.2)
 ***********************************************Modification Log************************************************
<PP20130610>
Last Modified By    :      Priyanka Pillala
Last Modified Date  :      10 June 2013
Description         :      APAC SIT Issue # 42 - Added null & zero check for Per - APAC ROLLOUT1(2.3) 
 ***********************************************Modification Log************************************************
<BB20130627>
Last Modified By    :      Bisnupriya Budek
Last Modified Date  :      27 June 2013
Description         :      1)Replaced USD with standardized currency in the conversion of requested currency to 
                                         standardized currency. APAC ROLLOUT2(3.0)
                                        2)Replaced Base UoM with standardized UoM in the conversion of requested UoM to 
                                         standardized UoM. - APAC ROLLOUT2(3.0)
 ***********************************************Modification Log************************************************
<BB20130712>
Last Modified By    :      Bisnupriya Budek
Last Modified Date  :      12 July 2013
Description         :      1)Added method for populate the base UoM and alternate UoM from the Material Code  APAC ROLLOUT2(3.1)
                                        2)Added method for get the alternate UoM APAC ROLLOUT2(3.1)
                                        3)Added a condition to check if Standard UoM is present. - APAC ROLLOUT2(3.1)
                                        4)Removed the method populateBaseUoM.- APAC ROLLOUT2(3.1)
                                        5)Added arguments stdCurrency and stdUomM to the method standardizeRate.- APAC ROLLOUT2(3.1)
 *****************************************************************************************************************
<VR20130806>
Last Modified By           :     Vinoth Rajapandian
Last Modified Date         :     06 Aug 2013
Description                       :     Modified floor reference logic to apply for FRB in KC
 *****************************************************************************************************************
<NS20130821>
Last Modified By    :   Neeharika
Last Modified Date  :   21 Aug 2013
Description         :   1)Added Landing Cost functionality
 ******************************************************************************************************************
<PP20131021>
Last Modified By    :      Priyanka Pillala
Last Modified Date  :      21 October 2013
Description         :      1)Rollout SIT Issue # 13 - standardized rate USD according to plus/minus code
                                        1)Rollout SIT Issue # 19 - Base_UoM__c populated with New_UoM__c when base UoM of material
                                               is not available
 ***********************************************************************************************************************
<PP20140101>
Last Modified By    :   Priyanka
Last Modified Date  :   1st January 2014
Description         :   PH Synchronous flow for NPC - ROLLOUT2 ENHANCEMENT
 **********************************************************************************************************************
<PP20140220>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   20 February 2014
Description         :   CAPITAL PROJECT - Customer Prices list views for CSRs
 **********************************************************************************************************************
<PP20140224>
Last Modified By    :   Priyanka Pillala
Last Modified Date  :   24 February 2014
Description         :   CAPITAL PROJECT - Representative Material Info in NPC notification
 **********************************************************************************************************************
<AV20140512>
Last Modified By    :   Abhijeet Vaishnab
Last Modified Date  :   12 March 2014
Description         :   CAPITAL PROJECT - Captured conversion rate and UOM conversion factor in pricing request item object
 *****************************************************************************************************************
 <PR20140916>
Last Modified By    :   Priyanka R
Last Modified Date  :   16 Sep 2014
Description         :   Added logic for calculating the net floor and net reference price from SFDC
 *****************************************************************************************************************
<IS ID-00065733>
Last Modified By  :  Sumit Gupta
Modified Date    :  Feb-9-2016
Description      :  Error Message 'Request status has been changed' was changed to Info message
 *****************************************************************************************************************
<<HN30062016>>
<IS ID-00059139>
Last Modified By  : Haider Naseem
Modified Date    :  Jun-30-2016
Description      :  Error Message 'Apex Heap size too large'

******************************************************************************************************************
<IS SC-00100887>
Last Modified By  : Sapneet Kaur Hora
Modified Date    :  Sept-15-2021
Description      :  Added markForDeletion__c=false in query to skip checking deleted reference prices

******************************************************************************************************************
<IS EI-00094036>
Last Modified By  : Kanchan Solanki
Modified Date    :  May-10-2022
Description      :  Added UoM conversion filters for PricingTask for HSL business

******************************************************************************************************************
<IS EI-00094747>
Last Modified By  : Shantanu Sharma
Modified Date    :  May-25-2022
Description      :  Fixing "Too Many SOQL Queries" error while importing Prices.

*******************************************************************************************************************
<IS SC-00105319,IS SC-00105319>
Last Modified By  : Sapneet Kaur Hora
Modified Date    :  Sept-09-2022
Description      :  added markForDeletion__c=false in where condition to skip checking deleted floor prices 
*******************************************************************************************************************

<MS07022023>
Last Modified By  : Manav Sharma
Modified Date    :  Feb-07-2023
Description      :  added condition to calculate tariff prices which contain Currency as 'CNY'
*******************************************************************************************************************/

public class PAUtil
{
    public static final String NAME_BU='OrganizationalGroupItem';
    public static final String NAME_CUSTOMER='ERPCustomer';
    public static final String NAME_REQUESTS='Requests';
    public static final String NAME_REQUESTITEMS='RequestItems';
    public static final String NAME_PH='PH';
    public static final String NAME_FRB='FRB';
    public static final String NAME_PRICING_CONDITION='PricingConditions';
    public static final String NAME_KEY_COMBINATION = 'KeyCombinations';
    public static final String NAME_SALESPRICESAP='SalesPriceSAP';
    //added for decimal places - bala
    public static final MAP<string,Integer> decimalPlacesMap;
    public static final MAP<string,Double> conversionRateMap;
    private static Map<Id,string> pckcRequestItem;
    public static final string corporateCurrencyCode;
    private static final Map<string,string> numDenoUoM;
    private static final Map<string,string> numDenoNewUoM;
    private static final Map<string,string> materialBaseUoMMap;//changing is to string,string 
    //neeha-NPC
    //<PP20130424> -- Ver 2.0 START
    private static final Map<String,String> sourceUoMNumDenoMap;
    private static final Map<String,String> matCodeToBaseUoMMap;
    //<PP20130424> -- Ver 2.0 END
    //<BB20130712> -- Ver 3.1 START
    private static final Map<String,Set<String>> matCodeToAltUoMMap;
    //<BB20130712> -- Ver 3.1 END
    //<PP20140220>
    public static String profileNameIsCSR;
    //added - bala
    //<GT20150122> Added for massive import
    public static id requestId{get;set;}
    
    //<MS20150522>START
    public static boolean trigExecChk {get;set;}
    public static boolean PRBIIBUATERUPADTEcheck {get;set;}
    public static boolean trigPricingRequestCheck {get;set;}
    public static boolean TaskCreationAfterApproval {get;set;}
    //<MS20150522>END
    //<AJ20160120>START 
      private static boolean run = true;
      public static boolean runOnce()
      {
        if(run)
        {
             run=false;
             return true;
        }
        else
        {
             return run;
        }
      }
    //<AJ20160120>END
    static
    {
        decimalPlacesMap = new Map<string,Integer>();
        conversionRateMap = new Map<string,Double>();
        numDenoUoM = new Map<string,string>();
        numDenoNewUoM = new Map<string,string>();
        materialBaseUoMMap = new Map<string,string>();
        corporateCurrencyCode = getCorporateCurrency();
        getAllCurrencies();
        //<PP20130424> -- Ver 2.0 START
        sourceUoMNumDenoMap = new Map<String,String>();
        matCodeToBaseUoMMap = new Map<String,String>();
        //<PP20130424> -- Ver 2.0 END
        //<BB20130712> -- Ver 3.1 START
        matCodeToAltUoMMap = new Map<String,Set<String>>();
        //<BB20130712> -- Ver 3.1 END
        //neeha
    } 
    /*do not uncomment or remove it ***
       public static void checkGrossFloorRefApplicable(List<Pricing_Request_Item__c> prqiList){
              Set<String> pricingProcedureSet=new Set<String>(); 
              Set<String> sapApplicationIdSet=new Set<String>();
              Set<String> sapClientIdSet=new Set<String>();
              Set<String> sapClusterSet=new Set<String>();
              Set<String> pcSet=new Set<String>();
              Set<String> kCSet=new Set<String>();
              Map<Pricing_Request_Item__c,String> flrRefApplicableCheckMap=new Map<Pricing_Request_Item__c,String>();
              for(Pricing_Request_Item__c prqi:prqiList)
              {
                     pricingProcedureSet.add(prqi.ERP_Pricing_Procedure__c);
                     sapApplicationIdSet.add(prqi.SAP_Application_Id__c);
                     sapClientIdSet.add(prqi.SAP_Client_Id__c);
                     sapClusterSet.add(prqi.SAP_Cluster__c); 
                     pcSet.add(prqi.pricing_condition_code__c);
                     kCSet.add(prqi.key_combination_code__c);

              }

              List<ERP_Access_Sequence__c> accessSequenceList = [SELECT id,pricing_condition__c,Sales_Pricing_Procedure__c,Floor_Pricing_Condition__r.pricing_condition_code__c,pricing_Key_Combination__c,
                                                                                         pricing_key_combination__r.key_combination_code__c,pricing_condition__r.pricing_Condition_code__c,
                                                                                         Reference_Pricing_Condition__r.pricing_condition_code__c,Floor_Key_Combination__r.key_Combination_code__c,
                                                                                         Reference_key_combination__r.key_combination_code__c,Reference_Key_Combination__r.key_Combination__c,
                                                                                         Floor_Key_Combination__r.key_Combination__c,pricing_condition__r.SAP_Cluster__c,pricing_condition__r.SAP_Application_Id__c,
                                                                                         pricing_condition__r.SAP_Client_Id__c,pricing_key_combination__r.SAP_Cluster__c,pricing_key_combination__r.SAP_Application_Id__c,
                                                                                         pricing_key_combination__r.SAP_Client_Id__c
                                                                                         FROM ERP_Access_Sequence__c WHERE 
                                                                                         Sales_Pricing_Procedure__c=:pricingProcedureSet  AND pricing_key_combination__r.SAP_Application_Id__c = :sapApplicationIdSet AND 
                                                                                         pricing_key_combination__r.SAP_Client_Id__c=:sapClientIdSet AND pricing_condition__r.pricing_Condition_code__c =:pcSet
                                                                                         AND pricing_key_combination__r.key_Combination_code__c =:kcSet  AND pricing_condition__r.SAP_Cluster__c=:sapClusterSet AND
                                                                                         pricing_condition__r.SAP_Application_Id__c=:sapApplicationIdSet AND
                                                                                         pricing_condition__r.SAP_Client_Id__c=:sapClientIdSet AND pricing_key_combination__r.SAP_Cluster__c = :sapClusterSet
                                                                                     ];
              //system.debug('AcSq size'+accessSequenceList[0].id+' '+accessSequenceList.size()+accessSequenceList[0].Floor_Key_Combination__r.key_Combination_code__c+' '+accessSequenceList[0].Reference_Key_Combination__r.key_Combination__c);                                                                                     

              Map<String,ERP_Access_Sequence__c> priAccessSeqMap=new Map<String,ERP_Access_Sequence__c>();
              for(ERP_Access_Sequence__c acc: accessSequenceList){
                     priAccessSeqMap.put(acc.Sales_Pricing_Procedure__c+acc.pricing_key_combination__r.SAP_Application_Id__c+acc.pricing_key_combination__r.SAP_Client_Id__c+acc.pricing_key_combination__r.SAP_Cluster__c+acc.pricing_condition__r.pricing_Condition_code__c+acc.pricing_key_combination__r.key_Combination_code__c,acc);
              }

              for(Pricing_Request_Item__c prqi:prqiList)
              {
                 //pushing prqi in to update list updating the flag if no flr/ref pckc is marked for the pc and kc
                 String key=prqi.ERP_Pricing_Procedure__c+prqi.SAP_Application_Id__c+prqi.SAP_Client_Id__c+prqi.SAP_Cluster__c+prqi.Pricing_Condition_Code__c+prqi.Key_Combination_Code__c;
                 if(priAccessSeqMap.containsKey(key))
                 {          priFloorApplicableCheckMap.put(prqi,true);
                                   priRefApplicableCheckMap.put(prqi,true);
                                  ERP_Access_Sequence__c accSeq=  priAccessSeqMap.get(key);
                                  if(accSeq!=null && accSeq.Floor_Pricing_Condition__c==null || accSeq.Floor_Key_Combination__c==null)
                                  {
                                         System.debug('*****priFloorApplicableCheckMap in floor check');
                                         priFloorApplicableCheckMap.put(prqi,false);


                                  } 
                                  if(accSeq!=null && accSeq.Reference_Pricing_Condition__c==null || accSeq.Reference_Key_Combination__c==null)
                                  {
                                         System.debug('*****priFloorApplicableCheckMap in ref check');
                                         priRefApplicableCheckMap.put(prqi,false);
                                  }
                     }
              }

       } **/

    public static List<sObject> sortList(List<sObject> items,String sortField,String order)
    {
        List<sObject> resultList = new List<sObject>();
        //Create a map that can be used for sorting 
        Map<object, List<sObject>> objectMap = new Map<object, List<sObject>>();

        for(sObject ob : items)
        {
            if(objectMap.get(ob.get(sortField)) == null)
            {
                // For non Sobject use obj.ProperyName
                objectMap.put(ob.get(sortField), new List<sObject>());
            }
            objectMap.get(ob.get(sortField)).add(ob);
        }
        //Sort the keys
        List<object> keys = new List<object>(objectMap.keySet());
        keys.sort();

        for(object key : keys)
        {
            resultList.addAll(objectMap.get(key));
        }

        //Apply the sorted values to the source list
        items.clear();
        if(order.toLowerCase() == 'asc')
        {
            for(Sobject ob : resultList)
            {
                items.add(ob);
            }
        }
        else if(order.toLowerCase() == 'desc')
        {
            for(integer i = resultList.size()-1; i >= 0; i--)
            {
                items.add(resultList[i]);
            }
        }
        return items;
    }


    /////////////////////////////////////////////////////////////////////////////////////////////
    //  genID() generate a psudo id used for indexing  Inserts since the ids
    //          do not exist yet when working with trigger    
    /////////////////////////////////////////////////////////////////////////////////////////////        
    public static Id genID(integer i)
    {

        string s = '000000000000'+string.valueOf(i);
        return (ID) ('gen'+s.substring(s.length()-12)); 
    }


    /* Method Name : getAllCurrencies
     *  Description : This method gets all the currencies available in the Org.
     *  This is called as a part of static Block initializer 
     */

    public static void getAllCurrencies()
    {
        List<currencyType> allCurrencies = [select conversionRate,DecimalPlaces,ISOCode FROM currencyType];

        for(CurrencyType curr:allCurrencies)
        {
            decimalPlacesMap.put(curr.ISOCode,curr.DecimalPlaces);
            conversionRateMap.put(curr.ISOCode,curr.ConversionRate);      
        }
    }

    /* Method Name : systemAdminProfileId
     *  Description : This method insert record in ProfileRecordIds__c custom setting for System Admin profile id.
     *  1/21/2017 - Merge&Spin - This code is delta present in SplitUtil and deployed to UTQA
     */
    public static void insertProfileRecordId(){
       String systemAdminProfileId = [Select id from Profile Where Name = 'System Administrator'].Id;
       ProfileRecordIds__c profileRecordId =new ProfileRecordIds__c();
       profileRecordId.Name = 'System Administrator';
       profileRecordId.RecordId__c = systemAdminProfileId.substring(0, 15);
       insert profileRecordId;
    }
    
    /* Method Name : convertCurrencyMethod
     * Arguments : source ISO Code,Target ISO Code , Rate  and CorpCurrency
     *  Description : This method gets the converted rate
     *  
     */
    public static String convertCurrencyMethod(String sourceCurr,String targetCurr,Decimal rate,String corpCurrency)
    {
        return String.valueOf(((rate / conversionRateMap.get(sourceCurr))*conversionRateMap.get(targetCurr)));          
    }
    
    //MS07022023
     public static String convertCurrencyMethodfortariff(String sourceCurr,String targetCurr,Decimal rate,String corpCurrency, Decimal tariff)
    {
        return String.valueOf((((rate / conversionRateMap.get(sourceCurr))/tariff)*conversionRateMap.get(targetCurr)));          
    }

    /* Method Name : convertUoMMethod
     * Arguments : source uOm,Target uOM , Rate , Material Code and boolean 
     *  Description : This method gets the converted rate after performing uOM Conversion
     *                     where boolean identifies if it for Flr / Ref Flag 
     */

    public static String convertUoMMethod(String sourceUoM,String targetUoM,Decimal rate,string materialCode,boolean isFlrRef)
    {

        //Adding isFlrRef to identify which Map has the values (New UOm has it when it is Flr and Ref)
        //system.debug('@#@#@#sourceUom-'+sourceUoM+',targetUom'+targetUoM+','+rate+','+materialCode+','+isFlrRef);
        string numDenoForSource,numDenoForTarget;
        //system.debug('numDenoNewUoM:'+numDenoNewUoM);
        //system.debug('materialBaseUoMMap'+materialBaseUoMMap);
        //system.debug('sourceUoM'+sourceUoM+'targetUoM'+targetUoM);
        if(isFlrRef)
        {
            //<AV20151606>-Production issue-UoM conversion not working for PH flr ref prices 
            if(materialCode.length()>2)
            {
                numDenoForSource = numDenoNewUoM.get(materialCode+materialBaseUoMMap.get(materialCode)+sourceUoM);
                numDenoForTarget = numDenoNewUoM.get(materialCode+materialBaseUoMMap.get(materialCode)+targetUoM);
            }
            else
            {
                numDenoForSource = '1'+':'+'1';
                String conSetting = sourceUoM+'_'+targetUoM;
                Standard_UoM_Conversion__c stdCon=Standard_UoM_Conversion__c.getInstance(conSetting);
                numDenoForTarget = stdCon.Denominator__c+':'+stdCon.Numerator__c;
                
            }
        }
        else
        {
            //changing the map order
            numDenoForSource = numDenoUoM.get(materialCode+materialBaseUoMMap.get(materialCode)+sourceUoM);
            numDenoForTarget = numDenoNewUoM.get(materialCode+materialBaseUoMMap.get(materialCode)+targetUoM);   
        }
        //split the numerator and denominator 
        System.debug('numDenoForSource:-'+numDenoForSource+' '+numDenoForTarget);
        List<string> uoMsNumAndDeno=new List<string>();
        List<string> newUoMsNumAndDeno=new List<string>();
        if(numDenoForSource!=null)
        {
            uoMsNumAndDeno = numDenoForSource.split(':');
        }
        if(numDenoForTarget!=null)
        {
            newUoMsNumAndDeno = numDenoForTarget.split(':');
        }
        //MSCheck16-02023 Start
        Decimal firstStepConversion;
        Decimal finalConversion;
        if(uoMsNumAndDeno.size() >0) {
        if(uoMsNumAndDeno[0].contains(','))
            uoMsNumAndDeno[0] = uoMsNumAndDeno[0].remove(',');
        if(uoMsNumAndDeno[1].contains(','))
            uoMsNumAndDeno[1] = uoMsNumAndDeno[1].remove(',');
            firstStepConversion = rate * (Decimal.valueOf(uoMsNumAndDeno[1]) / Decimal.valueOf(uoMsNumAndDeno[0]));
         }
         if(newUoMsNumAndDeno.size() >0) {
        if(newUoMsNumAndDeno[1].contains(','))
            newUoMsNumAndDeno[1]= newUoMsNumAndDeno[1].remove(',');
        if(newUoMsNumAndDeno[0].contains(','))
            newUoMsNumAndDeno[0] = newUoMsNumAndDeno[0].remove(',');    
            if(firstStepConversion != null)
            finalConversion = firstStepConversion * (Decimal.valueOf(newUoMsNumAndDeno[0]) / Decimal.valueOf(newUoMsNumAndDeno[1]));
          } 
          //MSCheck16-02023 END              
        return String.valueOf(finalConversion);
    }

    /* Method Name : checkPer
     * Arguments : Currency ISO Code,Previous Per, Requested Per and Rate  
     *  Description : This method gets the converted rate after performing per Conversion
     *                      
     */

    public static String checkPer(String currencyCode,Integer previousPer,Integer perRequested,Decimal rate)
    {
        //<PP20130610> -- Ver 2.3 STARTS
        if(previousPer != null && previousPer != 0)
        {
            return String.valueOf(((rate / previousPer) * perRequested));
        }
        else
        {
            return null;
        }
        //<PP20130610> -- Ver 2.3 ENDS       
    }

    /* Method Name : getMaterialBaseUoM
     * Arguments :  material code   
     *  Description : This method gets the base uOM of the material passed 
     *                      
     */

    public static string getMaterialBaseUoM(string materialCode)
    {
        string s=[SELECT ERP_Base_UOM__c FROM Material__c WHERE  Material__c.ERP_Material_Code__c =:materialCode limit 1].ERP_Base_UOM__c;
        return s;
    }

    /* Method Name : getMaterialBaseUoM
     * Arguments :  None   
     *  Description : This method gets the Corporate Currency for the instance 
     *                      
     */

    public static string getCorporateCurrency()
    {
        string s = [select ISOCode FROM currencyType where IsCorporate =true].ISOCode;
        return s;
    }

    /* Method Name : getProfileOfLoggedInUser
     * Arguments :  None 
     *  Description : This method gets the Name of the logged in user's profile 
     *                      
     */
    public static String getProfileOfLoggedInUser()
    {
        String profileName = [SELECT Name FROM Profile WHERE Id = :UserInfo.getProfileId()].Name;
        return profileName; 
    }
    /* Method Name : isEndUserRebateEnabled
     * Arguments :  None 
     *  Description : This method returns true / false checking if the logged in user has permission to raise End User Rebate Request  
     *                      
     */
    public static boolean isEndUserRebateEnabled()
    {
        Rebate_Price_Quote_Data__c r = Rebate_Price_Quote_Data__c.getAll().values()[0];
        String rpqgroupname = r.Public_Group__c;
        List<Group> groups = [SELECT Name FROM Group Where Name=:rpqgroupname];
        List<GroupMember> gm = new List<GroupMember>();
        if(groups.size()!=0)
            gm =  [SELECT GroupId, UserOrGroupId FROM GroupMember WHERE UserOrGroupId = :UserInfo.getUserId() and GroupId in :groups];

        if(gm.size() != 0)
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    /* Method Name : hasApproverPermissionSet
     * Arguments :  None 
     *  Description : This method returns true / false checking if the logged in user has Approver Permission set  
     *                      
     */

    public static map<string,boolean> hasApproverPermissionSet()
    {
        map<string,boolean> permissionsetMap = new map<string,boolean>();
        map<string,string> permissionsetidMap = new map<string,string>();
        PermissionSetIds__mdt[] abc = [select PermissionSetId__c,PermissionSetName__c from PermissionSetIds__mdt];
        for(PermissionSetIds__mdt a:abc){
            permissionsetidMap.put(a.PermissionSetName__c,a.PermissionSetId__c);
           
        }
        permissionsetMap.put('Price_Approval_Approver',false);
        permissionsetMap.put('P80_Account_Manager_Creator',false);
        string permissionSetName = PAProfilePermissions__c.getInstance('Approver').API_Name__c;
        List<PermissionSetAssignment> psa = new List<PermissionSetAssignment>();
        psa = [SELECT Id,PermissionSetId FROM PermissionSetAssignment WHERE AssigneeId = :UserInfo.getUserId() AND
                PermissionSetId IN (SELECT Id FROM PermissionSet WHERE Name =:permissionSetName or name='P80_Account_Manager_Creator')];
        for(PermissionSetAssignment p:psa){
            if(p.PermissionSetId==permissionsetidMap.get('Price_Approval_Approver')){
                permissionsetMap.put('Price_Approval_Approver',true);
            }
            
            if(p.PermissionSetId==permissionsetidMap.get('P80_Account_Manager_Creator')){
                permissionsetMap.put('P80_Account_Manager_Creator',true);
            }
            
            
        }
        return permissionsetMap;
        /* if(psa.size() !=0)
        {
            
            
            return true;
        }
        else
        {
            return false;
        }*/
    }

    /* Method Name : hasPriceListAccess
     * Arguments :  None 
     *  Description : This method returns true / false checking if the logged in user is a member of PriceList Group  
     *                      
     */

    public static boolean hasPriceListAccess()
    {
        List<GroupMember> gm = new List<GroupMember>();
        gm =  [SELECT GroupId, UserOrGroupId FROM GroupMember WHERE UserOrGroupId = :UserInfo.getUserId() OR
                UserOrGroupId = :UserInfo.getUserRoleId()];

        if(gm.size() != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /*
     * Author        : 
     * Method Name  :   sortRateList
     * Parameters   :   List<Decimal>,String
     * Return type  :   List<Decimal>
     * Description  :   This method is used to sort the incoming list in ascending or descending order
     */
    public static List<Decimal> sortRateList(List<Decimal> list1,String sortOrder)
    {
        List<Decimal> sortedList = new List<Decimal>();
        if(list1 != null && list1.size() != 0)
        {
            list1.sort();
            if(sortOrder.toLowerCase() == 'asc')
            {
                for(Decimal d : list1)
                {
                    sortedList.add(d);
                }
            }
            else if(sortOrder.toLowerCase() == 'desc')
            {
                for(integer i = list1.size()-1; i >= 0; i--)
                {
                    sortedList.add(list1[i]);
                }
            }
        }
        return sortedList;     
    }

    /*
     * Author        : 
     * Method Name  :   isConversionNeeded
     * Parameters   :   Pricing_Request_Item__c,Sales_Prices__c,boolean
     * Return type  :   Decimal
     * Description  :   This method is to check if any conversion is needed for the flag checking  
     */


    //modifying the method's signature
    @testvisible private static Decimal isConversionNeeded(Pricing_Request_Item__c prqi,Sales_Prices__c sp,boolean isCurrentPriceCheck)
    {
        string val;
        Decimal tempRate ;//= Decimal.valueOf(sp.Rate__c);
        //Changing the converswion to the requested for NPC
        if(isCurrentPriceCheck)
        {
            tempRate = Decimal.valueOf(prqi.Rate__c);
            if(prqi.Unit__c!=prqi.New_Unit__c && prqi.New_Unit__c!='%')
            {
                //calling conver currenct with NewUnit as target - For NPC
                val= PAUtil.convertCurrencyMethod(prqi.Unit__c,prqi.New_Unit__c,Decimal.valueOf(prqi.Rate__c),corporateCurrencyCode);
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
            if(prqi.New_UoM__c!=prqi.UoM__c && tempRate!=null && prqi.New_Unit__c!='%')
            {
                if(!prqi.key_Combination__c.toUpperCase().contains('PH1'))
                    //changed the method signature
                    val= PAUtil.convertUoMMethod(prqi.UoM__c,prqi.New_UoM__c,tempRate,prqi.Material_Code__c,false);
                //to mark below flr or ref.
                else
                    return 0.00000001;
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
            if(prqi.New_Per__c!=prqi.Per__c && tempRate!=null && prqi.New_Unit__c!='%')
            {
                val=PAUtil.checkPer(prqi.New_Unit__c,Integer.valueOf(Prqi.Per__c),Integer.ValueOf(prqi.New_Per__c),tempRate);
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
            if(prqi.New_Unit__c!='%')
                //For NPC - Bala
                prqi.Stamp_Converted_Current_Price__c = String.valueOf(tempRate.setScale(decimalPlacesMap.get(prqi.New_Unit__c),System.Roundingmode.HALF_EVEN));
        }
        else
        {
            tempRate = Decimal.valueOf(sp.Rate__c);
            if(sp.Unit__c!=prqi.New_Unit__c && prqi.New_Unit__c!='%')
            {
                val= PAUtil.convertCurrencyMethod(sp.Unit__c,prqi.New_Unit__c,Decimal.valueOf(sp.Rate__c),corporateCurrencyCode);
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }

            }
            if(sp.UoM__c!=prqi.New_UoM__c && tempRate!=null && prqi.New_Unit__c!='%')
            {
                if(!prqi.key_Combination__c.toUpperCase().contains('PH1') && !prqi.key_Combination__c.toUpperCase().contains('MATERIAL PRICE GROUP'))
                    val= PAUtil.convertUoMMethod(sp.UoM__c,prqi.New_UoM__c,tempRate,prqi.Material_Code__c,true);
                //<AV20151606>-Production issue-UoM conversion not working for PH flr ref prices 
                else if(prqi.key_Combination__c.toUpperCase().contains('PH1') && prqi.Material_Code__c==null && !prqi.key_Combination__c.toUpperCase().contains('MATERIAL PRICE GROUP'))
                {
                    val= PAUtil.convertUoMMethod(sp.UoM__c,prqi.New_UoM__c,tempRate,prqi.PH1_Code__c,true);
                }
                //to mark below flr or ref.
                else if(temprate==null && prqi.key_Combination__c.toUpperCase().contains('PH1'))
                    return 0.00000001;
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
            if(sp.Per__c!=prqi.New_Per__c && tempRate!=null && prqi.New_Unit__c!='%')
            {
                val=PAUtil.checkPer(prqi.New_Unit__c,Integer.valueOf(sp.Per__c),Integer.ValueOf(prqi.New_Per__c),tempRate);
                //if val hads value returning rate?
                if(val!=null)
                {
                    tempRate = Decimal.valueOf(val);
                }
            }
        }
        if(prqi.New_Unit__c!='%')
            tempRate = tempRate.setScale(decimalPlacesMap.get(prqi.New_Unit__c),System.Roundingmode.HALF_EVEN);
        return tempRate;
    }

    //added by Brundha--Feb-11-2013
    public static string getBuAdmin(string profileId)
    {
        String profileName= [Select Name from Profile where Id =:profileId].Name;
        return profileName;
    }      
    public static boolean hasSalesAdminPermissionSet()
    {
        string permissionSetName = PAProfilePermissions__c.getInstance('Sales Admin').API_Name__c;
        List<PermissionSetAssignment> psa = new List<PermissionSetAssignment>();
        psa = [SELECT Id FROM PermissionSetAssignment WHERE AssigneeId = :UserInfo.getUserId() AND
                PermissionSetId IN (SELECT Id FROM PermissionSet WHERE Name =:permissionSetName)];

        if(psa.size() != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static boolean hasCSRPermissionSet()
    {
        string permissionSetName = PAProfilePermissions__c.getInstance('CSR').API_Name__c;
        List<PermissionSetAssignment> psa = new List<PermissionSetAssignment>();
        psa = [SELECT Id FROM PermissionSetAssignment WHERE AssigneeId = :UserInfo.getUserId() AND
                PermissionSetId IN (SELECT Id FROM PermissionSet WHERE Name =:permissionSetName)];

        if(psa.size() != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }  

    /*Added - bala Link Visibility*/  
    public static Map<string,Boolean> displaySectionAndLinks()
    {
        Map<string,Boolean> displayMap = new Map<string,Boolean>();
        /*If Viewer doesnot belong to any groups*/
        string profileName = getProfileOfLoggedInUser();
        boolean isApprover = hasApproverPermissionSet().get('Price_Approval_Approver');
        boolean isCSR = hasCSRPermissionSet();

        //<PP20140220>
        if(isCSR)
        {
            profileNameIsCSR = profileName + ':' + 'true';
        }
        else
        {
            profileNameIsCSR = profileName + ':' + 'false';
        }


        if(profileName.contains('Viewer') && (isApprover || isCSR))
        {
            displayMap.put('ManagePriceLists',true);
            displayMap.put('ManageCustomerPrices',true);
        }
        List<Rebate_Price_Quote_Data__c> rpqDataList = Rebate_Price_Quote_Data__c.getAll().values();
        String rpqgroupname = '';
        String rpqreportgroupname = '';
        if(rpqDataList!=null && rpqDataList.size()!=0){
            Rebate_Price_Quote_Data__c r = rpqDataList.get(0);
            rpqgroupname = r.Public_Group__c;
            rpqreportgroupname = r.RPQ_Report_Public_Group__c;
        }
        List<GroupMember> groupList = [SELECT GroupId,UserOrGroupId FROM GroupMember WHERE UserOrGroupId=:Userinfo.getUserId()];
        List<Id> groupIds = new List<Id>();
        for(GroupMember gm:groupList)
        {
            groupIds.add(gm.GroupId);
        }
        List<Group> groups = [SELECT Name,DeveloperName FROM Group Where Id IN:groupIds];
        string checkVal = '';
        for(Group grp:groups)
        {
            if(grp.Name.contains('NCPR'))
            {
                displayMap.put('ManagePriceLists',true);
                checkVal+='NCPR';
            }
            else if(grp.Name.contains('CPR'))
            {
                displayMap.put('ManageCustomerPrices',true);
                checkVal+='Cust';
            }
            // <IM20150105>
            else if(grp.DeveloperName==rpqgroupname)
            {
                displayMap.put('ManageRebateRequests',true);
                checkVal+='Rebate';
            }
            else if(grp.DeveloperName==rpqreportgroupname){
                displayMap.put('ViewRebateReports',true);
                checkVal+='RPQReports';
            }
        }
        if(!checkVal.contains('NCPR'))
        {
            displayMap.put('ManagePriceLists',false);
        }
        if(!checkVal.contains('Cust'))
        {
            displayMap.put('ManageCustomerPrices',false);
        }
        if(!checkVal.contains('Rebate'))
        {
            displayMap.put('ManageRebateRequests',false);
        }
        if(!checkVal.contains('RPQReports'))
        {
            displayMap.put('ViewRebateReports',false);
        }


        return displayMap;   
    }     
    //This method will be used to send the email:Created by Utkarsh
    public static void sendEmailMethod(String templateId, List<String> toAddress, String whatId, String targetId)
    {
        if(toAddress.size()>0)
        {
            system.debug('To: '+toAddress);
            Messaging.SingleEmailMessage singleEmail = new Messaging.SingleEmailmessage();
            singleEmail.setTemplateId(templateId);
            singleEMail.setTargetObjectId(targetId);
            singleEMail.setSaveAsActivity(false);
            singleEmail.setWhatId(whatId);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {singleEmail});
        }
    }
    
    /*Method added by Sumita Dabas IS ID-00064533 20 Jan 2016 Start  
    * Purpose : To send emails to CSRs upon submission of request
    * created date : 20 Jan 2016
    */
      public static void sendEmailToCSR(String templateId, Map<String, List<Id>> pridCSRMap)
      {
        if(pridCSRMap.size() > 0)
        {
          // create a list of email messages for all CSR   
          List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailmessage>();  
          for(String prId : pridCSRMap.keySet())
          {
            for(Id userId : pridCSRMap.get(prId))
            {
                Messaging.SingleEmailMessage singleEmail = new Messaging.SingleEmailmessage();
                singleEmail.setTemplateId(templateId);
                singleEMail.setTargetObjectId(userId);
                singleEMail.setSaveAsActivity(false);
                singleEmail.setWhatId(prId);
                mails.add(singleEmail);
            }
            
          }
          // one sendemail call for the list of messages formed for all CSRs
          Messaging.sendEmail(mails);
        }
      }
    //Added by Sumita Dabas IS ID-00064533 20 Jan 2016 End 
    
    public static void calculateFloorAndReference(List<Pricing_Request_Item__c> prqiList)
    {
        boolean isBothSame = false;
        List<Pricing_Request_Item__c> toUpdateList = new List<Pricing_Request_Item__c>();
        pckcRequestItem = new Map<Id,string>();
        String regionalSalesOrg;
        Decimal tempRate,convertedSPRate;
        try
        {
            System.debug('******prqiList'+(prqiList!=null && prqiList.size() > 0));
            if(prqiList!=null && prqiList.size()>0)
            {
                Pricing_Request__c pr  = [SELECT Id,is_End_User_Rebate__c,BU__c,Sales_Org_Code__c,division_code__c,dist_channel_code__c FROM Pricing_Request__c
                                          WHERE Id=:prqiList[0].Pricing_Request__c];
                //*populate the pricing procedure*/
                //get pricing procedure from OrgGrpItems (use it to filter out Pcs and kcs)
                Organizational_Group_Item__c orgItem = [SELECT id,ERP_Pricing_Procedure__c,Business__r.Regional_Floor_Pricing__c FROM Organizational_Group_Item__c WHERE 
                                                        Business__r.Business__c=:pr.BU__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:pr.Dist_Channel_Code__c
                                                        AND OrgGroup__r.ERP_Division_Code__c=:pr.Division_Code__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:pr.Sales_Org_Code__c];
                regionalSalesOrg = orgItem.Business__r.Regional_Floor_Pricing__c;

                //get all the pc and kc from prqiList
                Map<Id,string> prqiFlrMap = new Map<Id,string>();
                Map<Id,string> prqiRefMap = new Map<Id,string>();
                Map<Id,string> materialCodeMap = new Map<Id,string>();
                Map<Id,string> customerPGMap = new Map<Id,string>();
                Map<Id,string> countryMap = new Map<Id,string>();
                Map<Id,string> salesDistrictMap = new Map<Id,string>();
                Map<Id,string> salesOfficeMap = new Map<Id,string>();
                Map<Id,string> soldToCodeMap = new Map<Id,string>();
                Map<Id,string> campaignMap = new Map<Id,string>();
                Map<Id,string> documentCurrencyMap = new Map<Id,string>();
                Map<Id,string> stateMap = new Map<Id,string>();
                Map<string,Id> pckcPrqi = new Map<string,Id>();
                Map<string,string> materialPHCodes = new Map<string,string>();
                //<VR20130806> Added to add logic with respect to Profit Center
                Map<string,string> materialFRBCodes = new Map<string,string>();
                Map<string,string> salesOfficeSoldTo = new Map<string,string>();
                Map<string,string> salesDistrictSoldTo = new Map<string,string>();
                Map<string,string> countrySoldTo = new Map<string,string>();
                Map<string,string> cpgSoldTo = new Map<string,string>();
                //Map to store End Use Code 
                Map<string,string> endUseCode = new Map<string,string>();
                Map<string,string> campaignSoldTo = new Map<string,string>();
                Map<string,string> documentCurrencySoldTo = new Map<string,string>();
                Map<string,string> stateSoldTo = new Map<string,string>();
                //Added for UoM Conversion (to avoid too many SOQL)
                Map<Id,string> UoMMap = new Map<Id,string>();
                Map<Id,string> newUoMMap = new Map<Id,string>(); 
                Map<string,List<material__c>> materialMCFMap=new Map<string,List<material__c>>();
                Map<string,List<ERP_Material_Conversion_factor__c>> materialCodeMFC=new map<string,List<ERP_Material_Conversion_factor__c>>();   
                Map<string,List<Pricing_Request_Item__c>> MaterialPrqiId=new Map<string,List<Pricing_Request_Item__c>>();
                Map<string,Pricing_Request_Item__c> MId1=new Map<string,Pricing_Request_Item__c>();
                //*Getting all the pc and kc for the List of Pricing Request Item - Expecting to be same*/
                //Edited   - bala Feb 25 2013 Adding cluster App Id and ClientId
                //got all the accesSequence for the Pcs and Kc of Request Items 
                List<ERP_Access_Sequence__c> accessSequenceList = new List<ERP_Access_Sequence__c>();
                if(!pr.is_End_User_Rebate__c)
                    accessSequenceList = [SELECT id,pricing_condition__c,Floor_Pricing_Condition__r.pricing_condition_code__c,pricing_Key_Combination__c,
                                          pricing_key_combination__r.key_combination_code__c,pricing_condition__r.pricing_Condition_code__c,
                                          Reference_Pricing_Condition__r.pricing_condition_code__c,Floor_Key_Combination__r.key_Combination_code__c,
                                          Reference_key_combination__r.key_combination_code__c,Reference_Key_Combination__r.key_Combination__c,
                                          Floor_Key_Combination__r.key_Combination__c,pricing_condition__r.SAP_Cluster__c,pricing_condition__r.SAP_Application_Id__c,
                                          pricing_condition__r.SAP_Client_Id__c,pricing_key_combination__r.SAP_Cluster__c,pricing_key_combination__r.SAP_Application_Id__c,
                                          pricing_key_combination__r.SAP_Client_Id__c
                                          FROM ERP_Access_Sequence__c WHERE 
                                          Sales_Pricing_Procedure__c=:orgItem.ERP_Pricing_Procedure__c  AND pricing_key_combination__r.SAP_Application_Id__c = :prqiList[0].SAP_Application_Id__c AND 
                                          pricing_key_combination__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_condition__r.pricing_Condition_code__c =:prqiList[0].pricing_condition_code__c
                                          AND pricing_key_combination__r.key_Combination_code__c =:prqiList[0].key_combination_code__c  AND pricing_condition__r.SAP_Cluster__c=:prqiList[0].SAP_Cluster__c AND
                                          pricing_condition__r.SAP_Application_Id__c=:prqiList[0].SAP_Application_Id__c AND
                                          pricing_condition__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_key_combination__r.SAP_Cluster__c = :prqiList[0].SAP_Cluster__c
                                          ];
                else
                    accessSequenceList = [SELECT id,pricing_condition__c,Floor_Pricing_Condition__r.pricing_condition_code__c,pricing_Key_Combination__c,
                                          pricing_key_combination__r.key_combination_code__c,pricing_condition__r.pricing_Condition_code__c,
                                          Reference_Pricing_Condition__r.pricing_condition_code__c,Floor_Key_Combination__r.key_Combination_code__c,
                                          Reference_key_combination__r.key_combination_code__c,Reference_Key_Combination__r.key_Combination__c,
                                          Floor_Key_Combination__r.key_Combination__c,pricing_condition__r.SAP_Cluster__c,pricing_condition__r.SAP_Application_Id__c,
                                          pricing_condition__r.SAP_Client_Id__c,pricing_key_combination__r.SAP_Cluster__c,pricing_key_combination__r.SAP_Application_Id__c,
                                          pricing_key_combination__r.SAP_Client_Id__c
                                          FROM ERP_Access_Sequence__c WHERE is_End_User_Rebate__c=true AND
                                          Sales_Pricing_Procedure__c=:orgItem.ERP_Pricing_Procedure__c  AND pricing_key_combination__r.SAP_Application_Id__c = :prqiList[0].SAP_Application_Id__c AND 
                                          pricing_key_combination__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_condition__r.pricing_Condition_code__c =:prqiList[0].pricing_condition_code__c
                                          AND pricing_key_combination__r.key_Combination_code__c =:prqiList[0].key_combination_code__c  AND pricing_condition__r.SAP_Cluster__c=:prqiList[0].SAP_Cluster__c AND
                                          pricing_condition__r.SAP_Application_Id__c=:prqiList[0].SAP_Application_Id__c AND
                                          pricing_condition__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_key_combination__r.SAP_Cluster__c = :prqiList[0].SAP_Cluster__c
                                          ];
                system.debug('accessSequenceList is '+accessSequenceList);                                                   
                //Added for debug- George
                for(Pricing_Request_Item__c prqi:prqiList)
                {
                    //pushing prqi in to update list updating the flag if no flr/ref pckc is marked for the pc and kc
                    if(accessSequenceList != null && accessSequenceList.size() > 0
                            && (accessSequenceList[0].Floor_Pricing_Condition__c==null || accessSequenceList[0].Floor_Key_Combination__c==null))
                    {
                        prqi.Below_Floor_Flag__c = false;
                   
                    } 
                    if(accessSequenceList != null && accessSequenceList.size() > 0
                            && (accessSequenceList[0].Reference_Pricing_Condition__c==null || accessSequenceList[0].Reference_Key_Combination__c==null))
                    {
                        prqi.Below_Reference_Flag__c = false;
                        
                    }
                    if(accessSequenceList != null && accessSequenceList.size() > 0
                            && (accessSequenceList[0].Floor_Pricing_Condition__c!=null || accessSequenceList[0].Floor_Key_Combination__c!=null))
                        prqiFlrMap.put(prqi.Id,accessSequenceList[0].Floor_Pricing_Condition__r.pricing_Condition_code__c+'-'+accessSequenceList[0].Floor_Key_Combination__r.key_Combination_Code__c+'-'+accessSequenceList[0].Floor_Key_Combination__r.key_Combination__c);
                    if(accessSequenceList != null && accessSequenceList.size() > 0
                            && (accessSequenceList[0].Reference_Pricing_Condition__c!=null || accessSequenceList[0].Reference_Key_Combination__c!=null))
                        prqiRefMap.put(prqi.Id,accessSequenceList[0].Reference_Pricing_Condition__r.pricing_Condition_code__c+'-'+accessSequenceList[0].Reference_Key_Combination__r.key_Combination_code__c+'-'+accessSequenceList[0].Reference_Key_Combination__r.key_Combination__c);

                    //*Maps for KC values*/
                    if(!string.isBlank(prqi.Material_Code__c))
                    {
                        materialCodeMap.put(prqi.id,prqi.Material_Code__c);
                        List<Pricing_Request_Item__c> prqiTempList = new List<Pricing_Request_Item__c>();
                        //Added for UOM Conversion
                        if(MaterialPrqiId.get(prqi.Material_Code__c)!=null)
                        {
                            prqiTempList = MaterialPrqiId.get(prqi.Material_Code__c);
                            prqiTempList.add(prqi);
                            MaterialPrqiId.put(prqi.Material_Code__c,prqiTempList);
                        }
                        else
                        {
                            prqiTempList.add(prqi);
                            MaterialPrqiId.put(prqi.Material_Code__c,prqiTempList);
                        }
                    }
                    if(!string.isBlank(prqi.Sold_To_Code__c))
                        soldToCodeMap.put(prqi.id,prqi.Sold_To_Code__c);
                    if(!string.isBlank(prqi.country_code__c))
                        countryMap.put(prqi.id,prqi.country_code__c);
                    if(!string.isBlank(prqi.Customer_Price_Group_Code__c))
                        customerPGMap.put(prqi.id,prqi.Customer_Price_Group_Code__c);
                    if(!string.isBlank(prqi.Sales_Office_Code__c))
                        salesOfficeMap.put(prqi.id,prqi.Sales_Office_Code__c);
                    if(!string.isBlank(prqi.Sales_District_Code__c))
                        salesDistrictMap.put(prqi.id,prqi.Sales_District_Code__c);  
                    if(!String.isBlank(prqi.End_Use_code__c))
                        endUseCode.put(prqi.id,prqi.End_Use_code__c);                 
                    if(!string.isBlank(prqi.Campaign_Code__c))
                        campaignMap.put(prqi.id,prqi.Campaign_Code__c);
                    if(!string.isBlank(prqi.Document_Currency_Code__c))
                        documentCurrencyMap.put(prqi.id,prqi.Document_Currency_Code__c);
                    if(!string.isBlank(prqi.State_Code__c))
                        stateMap.put(prqi.id,prqi.State_Code__c);                          
                    pckcPrqi.put(prqi.pckc__c,prqi.Id);
                    //Adding for UoM Conversion
                    UoMMap.put(prqi.id,prqi.uoM__c);
                            newUoMMap.put(prqi.id,prqi.new_UoM__c);
                            //moving the current flag logic outside the loop so as to get the UoM 
                            toUpdateList.add(prqi);
                }
                //system.debug('materialCodeMap:'+materialCodeMap.values());
                List<string> materialCodes = materialCodeMap.Values();
                //query all Non SAP 
                Map<id,Sales_Prices__c> mapOfAllSAP = new Map<Id,Sales_Prices__c>();
                Map<id,Sales_Prices__c> mapOfAllSAPRef = new Map<Id,Sales_Prices__c>();
                //when both ref and flr are same
                if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                {
                    if(!prqiRefMap.isEmpty() && prqiRefMap.get(prqiList[0].id).split('-')[2]!=null)
                    {
                        if(prqiFlrMap.get(prqiList[0].id).split('-')[2].equalsIgnoreCase(prqiRefMap.get(prqiList[0].id).split('-')[2]))
                        {
                            isBothSame = true;         
                        }

                    }

                }
                Map<string,List<Sales_Prices__c>> pckcId = new Map<string,List<Sales_Prices__c>>();
                List<Sales_Prices__c> tempList;
                Map<string,string> flrOrRefIdentifier = new Map<string,string>();
                //<VR20130806>
                if(!(prqiList[0].Key_Combination__c.contains('PH1') || prqiList[0].Key_Combination__c.contains('FRB')))
                {
                    //<VR20130806> Added field Profit Center in query
                    //query Material to populate PH 
                    //system.debug('Filters: '+ prqiList[0].Sales_Org_Code__c+' '+ prqiList[0].Dist_Channel_Code__c + ' '+ materialCodes+' '+ prqiList[0].SAP_Cluster__c);
                    List<Material__c> materialList = [SELECT ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                                      ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
                                                      ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Base_UoM__c,
                                                      ERP_Material_Group_3_Code__c,ERP_Profit_Center_Code__c
                                                      FROM Material__c WHERE ERP_Material_Code__c IN:materialCodes
                                                      AND ERP_Sales_Org_Code__c=:prqiList[0].Sales_Org_Code__c AND RecordType.Name='ERP Material - Extended Data'
                                                      AND ERP_Distribution_Channel_Code__c=:pr.Dist_Channel_Code__c
                                                      AND ERP_Source_Cluster__c=:prqiList[0].SAP_Cluster__c AND ERP_Deletion_Flag__c=false];

                    for(Material__c mat:materialList)
                    {
                        materialPHCodes.put(mat.ERP_Material_code__c,mat.ERP_Product_Hierarchy_Code__c);
                        //<VR20130806> Added to add logic with respect to Profit Center
                        materialFRBCodes.put(mat.ERP_Material_code__c,mat.ERP_Profit_Center_Code__c);
                        //For UoM Conversion
                        materialBaseUoMMap.put(mat.ERP_Material_Code__c,mat.ERP_Base_UOM__c);
                        endUseCode.put(mat.ERP_Material_code__c,mat.ERP_Material_Group_3_Code__c);
                    }
                }
                //checking if the prqi kc doesnot contain CPG || Country || Sales Office
                if(!prqiList[0].Key_Combination__c.toUpperCase().contains('CUSTOMER PRICE GROUP') || !prqiList[0].Key_Combination__c.toUpperCase().contains('COUNTRY')
                        || !prqiList[0].Key_Combination__c.toUpperCase().contains('SALES OFFICE'))
                {
                    List<ERP_Customer__c> custList = [SELECT Country_Code__c,Customer_Price_Group_Code__c,Customer_Code__c,sales_Office_code__c FROM ERP_Customer__c 
                                                      WHERE Customer_Code__c IN:soldToCodeMap.values()
                                                      AND RecordType.Name='ERP Customer - Extended Data'];              
                    for(ERP_Customer__c cust:custList)
                    {
                        countrySoldTo.put(cust.Customer_Code__c,cust.Country_code__c);
                        cpgSoldTo.put(cust.Customer_Code__c,cust.Customer_Price_Group_Code__c);
                        salesOfficeSoldTo.put(cust.Customer_Code__c,cust.Sales_Office_Code__c); 
                    }

                }
                //Adding for uoM conversion
                List<ERP_Material_Conversion_factor__c> erpMCFList = [SELECT Numerator_Y__c,Denominator_X__c,Base_UoM__c,Alternative_UoM__c,Material__r.ERP_Material_code__c
                                                                      FROM ERP_Material_Conversion_factor__c where (Alternative_Uom__c IN:UoMMap.values() OR Alternative_Uom__c IN:newUoMMap.values())
                AND base_uom__c IN:materialBaseUoMMap.values() AND Material__r.ERP_Material_code__c IN:materialCodes];

                //<MS20150209> Code fix
                List<Organizational_Group_Item__c> ogiUOM=[SELECT Base_UoM__c from Organizational_Group_Item__c WHERE Business__r.Business__c=:pr.BU__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:pr.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :pr.Dist_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c = :pr.Division_Code__c];

                List<ERP_Material_Conversion_factor__c> mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                for(ERP_Material_Conversion_factor__c erpMC:erpMCFList)
                {

                    if(materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c)!=null)
                    {
                        mcfTempList = materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c);
                        mcfTempList.add(erpMC);
                        materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                    }
                    else
                    {
                        mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                        mcfTempList.add(erpMC);
                        materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                    }
                }

                //populating Num and Deno for UoM and NewUoM
                for(string materialCode:materialCodeMFC.keySet())
                {
                    for(ERP_Material_Conversion_factor__c erpMCF:materialCodeMFC.get(materialCode))
                    {
                        if(MaterialPrqiId.containsKey(erpMCF.Material__r.ERP_Material_code__c) &&  materialBaseUoMMap.get(erpMCF.Material__r.ERP_Material_Code__c)==erpMCF.Base_Uom__c )
                        {
                            for(Pricing_Request_Item__c tempPrqi : MaterialPrqiId.get(erpMCF.Material__r.ERP_Material_code__c))
                            {
                                if(erpMCF.Alternative_Uom__c ==   tempPrqi.UoM__c)
                                {
                                    numDenoUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+tempPrqi.UOM__C,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
                                }
                                if(erpMCF.Alternative_Uom__c ==   tempPrqi.New_UoM__c)
                                {
                                    numDenoNewUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+tempPrqi.New_UoM__C,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
                                }
                                //<MS20150209> Code fix Floor and Ref Conversion
                                else if(ogiUOM[0].Base_Uom__c==true)
                                {
                                    String conSetting = erpMCF.Base_Uom__c+'_'+tempPrqi.New_UoM__c;
                                    Standard_UoM_Conversion__c stdCon=Standard_UoM_Conversion__c.getInstance(conSetting);
                                    numDenoNewUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+tempPrqi.New_UoM__c,stdCon.Numerator__c+':'+stdCon.Denominator__c);
                                }
                            }
                        }
                    }
                }      
                //current Flag check Logic 
                for(Pricing_Request_Item__c prqi:toUpdateList)
                {

                    //current flag check
                    if(String.isBlank(prqi.Rate__c)|| (prqi.Pricing_Request_Type__c=='Import' && prqi.Unit__c!='%'))
                        prqi.Below_Current_Flag__c = true;
                    //conversion for currency when required

                    else if (Decimal.valueOf(prqi.New_Rate__c)!=null && prqi.Pricing_Request_Type__c!='Import')
                    {
                        if(prqi.Rate__c!=null)
                        {
                            tempRate = isConversionNeeded(prqi, null,true);
                            if(Decimal.valueOf(prqi.New_Rate__c) > tempRate)//changing as per NPC
                            prqi.Below_Current_Flag__c = false;
                            else
                                prqi.Below_Current_Flag__c = true;
                        }
                    }
                    else
                        prqi.Below_Current_Flag__c = false;  

                }
                //Make sure the map order is in the order of PCKC formula field, also Landing Cost must be to the last
                Map<Integer,String> kcOrderMap = new Map<Integer,String>{1=>'Sales Org.',2=>'Dist. Channel',3=>'Division',4=>'Sold to',5=>'Material',6 =>'PH1',7 =>'PH2',8 =>'PH3',9 =>'PH4',10 =>'PH5',11 =>'PH6',12 =>'PH7',13 =>'PH8',14 =>'PH9', 15 => 'Ship To', 16 => 'Sales Office', 17 => 'Customer Price Group', 18 => 'Material Price Group', 19 => 'Price List Type', 20 => 'Terms of Payment', 21 => 'End Use', 22 => 'Market Segment', 23 => 'Variant Code',24 => 'Sales Order Type', 25 => 'Country', 26=> 'FRB', 27 => 'Incoterms', 28 => 'Ship-To Country', 29 => 'ComPartner Code', 30 => 'Kcode', 31 => 'Material Group 1', 32 => 'Sales District', 33 => 'Partner ZF Code', 34 => 'Payer Code', 35 => 'Disc Ref No', 36 => 'FixValDate', 37 => 'Campaign Code', 38 => 'Document Currency Code', 39 => 'State Code', 40 => 'Landing Cost', 41=> 'Material Group 5 Key'};
                if(isBothSame)
                {
                    List<string> expectedKCList = new List<string>();
                    List<string> expectedKCList1 = new List<string>();
                    Set<string> expectedKCSet1 = new Set<string>();
                    //system.debug('prqiFlrMap:'+prqiFlrMap +'prqiList[0].id:'+prqiList[0].id);
                    if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                        expectedKCList1 = prqiFlrMap.get(prqiList[0].id).split('-')[2].split('/');
                    expectedKCSet1.addAll(expectedKCList1);
                    for(Integer z : kcOrderMap.keySet())
                    {
                        if(expectedKCSet1.contains(kcOrderMap.get(z)))
                            expectedKCList.add(kcOrderMap.get(z));
                        if(expectedKCList.size() ==expectedKCList1.size())
                            break;
                    }

                    //<VR20130806> Added MaterialFRBCodes in parameter

                    returnAfterFloorReferenceCalc(expectedKCList,null,toUpdateList,countrySoldTo,cpgSoldTo,salesOfficeSoldTo,materialPHCodes,materialFRBCodes,endUseCode,prqiFlrMap,prqiRefMap,pckcId,isBothSame,MaterialPrqiId,uoMMap.values(),newUoMMap.values(),materialCodes,materialCodeMFC,regionalSalesOrg,pr);
                }
                //both flr and Ref KC same 
                else
                {
                    isBothSame =false;
                    List<string> expectedKCList = new List<string>();
                    List<string> expectedKCList1 = new List<string>();
                    Set<string> expectedKCSet1 = new Set<string>();
                    //system.debug('prqiFlrMap:'+prqiFlrMap +'prqiList[0].id:'+prqiList[0].id);
                    if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                        expectedKCList1 = prqiFlrMap.get(prqiList[0].id).split('-')[2].split('/');
                    expectedKCSet1.addAll(expectedKCList1);
                    for(Integer z : kcOrderMap.keySet())
                    {
                        if(expectedKCSet1.contains(kcOrderMap.get(z)))
                            expectedKCList.add(kcOrderMap.get(z));
                        if(expectedKCList.size() ==expectedKCList1.size())
                            break;
                    }
                    List<string> expectedKCListRef = new List<string>();
                    expectedKCSet1 = new Set<string>();
                    if(!prqiRefMap.isEmpty() && prqiRefMap.get(prqiList[0].id).split('-')[2]!=null)
                        expectedKCList1 = prqiRefMap.get(prqiList[0].id).split('-')[2].split('/');
                    expectedKCSet1.addAll(expectedKCList1);
                    for(Integer z : kcOrderMap.keySet())
                    {
                        if(expectedKCSet1.contains(kcOrderMap.get(z)))
                            expectedKCListRef.add(kcOrderMap.get(z));
                        if(expectedKCListRef.size() ==expectedKCList1.size())
                            break;
                    }
                    //<VR20130806> Added MaterialFRBCodes in parameter
                    returnAfterFloorReferenceCalc(expectedKCList,expectedKCListRef,toUpdateList,countrySoldTo,cpgSoldTo,salesOfficeSoldTo,materialPHCodes,materialFRBCodes,endUseCode,prqiFlrMap,prqiRefMap,null,isBothSame,MaterialPrqiId,uoMMap.values(),newUoMMap.values(),materialCodes,materialCodeMFC,regionalSalesOrg,pr);
                }
            }//if not null 
        }   //try
        catch(Exception e)
        {
           /* system.debug('****Exception '+e +' ***line number '+e.getLineNumber());
            throw new PAException('An error has occurred. Please contact your system administrator.',ApexPages.severity.Error); */
        }
        update toUpdateList;
    }
    //IM20150211 Added method to calculate Cost Price
    public static void calculateCost(List<Pricing_Request_Item__c> prqiList)
    {
        system.debug('inside cost calculation');
        List<Pricing_Request_Item__c> toUpdateList = new List<Pricing_Request_Item__c>();
        pckcRequestItem = new Map<Id,string>();
        Map<id,Sales_Prices__c> mapOfAllSAP = new Map<Id,Sales_Prices__c>();
        List<Sales_Prices__c> tempList = new List<Sales_Prices__c>();
        Decimal tempRate,convertedSPRate;
        try
        {
            System.debug('******prqiList'+(prqiList!=null && prqiList.size() > 0));
            if(prqiList!=null && prqiList.size()>0)
            {
                Pricing_Request__c pr  = [SELECT Id,is_End_User_Rebate__c,BU__c,Sales_Org_Code__c,division_code__c,dist_channel_code__c FROM Pricing_Request__c
                                          WHERE Id=:prqiList[0].Pricing_Request__c];
                //*populate the pricing procedure*/
                //get pricing procedure from OrgGrpItems (use it to filter out Pcs and kcs)
                Organizational_Group_Item__c orgItem = [SELECT id,ERP_Pricing_Procedure__c,Business__r.Regional_Floor_Pricing__c FROM Organizational_Group_Item__c WHERE 
                                                        Business__r.Business__c=:pr.BU__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:pr.Dist_Channel_Code__c
                                                        AND OrgGroup__r.ERP_Division_Code__c=:pr.Division_Code__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:pr.Sales_Org_Code__c];

                //get all the pc and kc from prqiList
                Map<Id,string> prqiCostMap = new Map<Id,string>();
                Map<string,Id> pckcPrqi = new Map<string,Id>();
                Map<Id,string> materialCodeMap = new Map<Id,string>();
                Map<string,List<Pricing_Request_Item__c>> MaterialPrqiId=new Map<string,List<Pricing_Request_Item__c>>();

                List<ERP_Access_Sequence__c> accessSequenceList = new List<ERP_Access_Sequence__c>();

                accessSequenceList = [SELECT id,pricing_condition__c,Floor_Pricing_Condition__r.pricing_condition_code__c,pricing_Key_Combination__c,
                                      pricing_key_combination__r.key_combination_code__c,pricing_condition__r.pricing_Condition_code__c,
                                      Reference_Pricing_Condition__r.pricing_condition_code__c,Floor_Key_Combination__r.key_Combination_code__c,
                                      Reference_key_combination__r.key_combination_code__c,Reference_Key_Combination__r.key_Combination__c,Cost_Key_Combination__r.key_Combination__c,
                                      Floor_Key_Combination__r.key_Combination__c,pricing_condition__r.SAP_Cluster__c,pricing_condition__r.SAP_Application_Id__c,
                                      pricing_condition__r.SAP_Client_Id__c,pricing_key_combination__r.SAP_Cluster__c,pricing_key_combination__r.SAP_Application_Id__c,
                                      pricing_key_combination__r.SAP_Client_Id__c,Cost_Key_Combination__c,Cost_Pricing_Condition__c,Cost_Pricing_Condition__r.pricing_Condition_code__c,Cost_Key_Combination__r.key_Combination_code__c
                                      FROM ERP_Access_Sequence__c WHERE is_End_User_Rebate__c=true AND
                                      Sales_Pricing_Procedure__c=:orgItem.ERP_Pricing_Procedure__c  AND pricing_key_combination__r.SAP_Application_Id__c = :prqiList[0].SAP_Application_Id__c AND 
                                      pricing_key_combination__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_condition__r.pricing_Condition_code__c =:prqiList[0].pricing_condition_code__c
                                      AND pricing_key_combination__r.key_Combination_code__c =:prqiList[0].key_combination_code__c  AND pricing_condition__r.SAP_Cluster__c=:prqiList[0].SAP_Cluster__c AND
                                      pricing_condition__r.SAP_Application_Id__c=:prqiList[0].SAP_Application_Id__c AND
                                      pricing_condition__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_key_combination__r.SAP_Cluster__c = :prqiList[0].SAP_Cluster__c
                                      ];
                system.debug('accessSequenceList is '+accessSequenceList);  
                String pcCode = accessSequenceList[0].Cost_Pricing_Condition__r.pricing_Condition_code__c;
                String kcCode = accessSequenceList[0].Cost_Key_Combination__r.key_Combination_code__c;

                Map<Id,string> prqiPckc = new Map<Id,string>();


                for(Pricing_Request_Item__c prqi:prqiList){
                    system.debug(' prqi is '+prqi);
                    String concatPCKC = pcCode+prqi.Sales_Org_Code__c+prqi.Dist_Channel_Code__c+prqi.Division_Code__c+prqi.Material_Code__c;
                    prqiPckc.put(prqi.id,concatPCKC);
                    system.debug(' prqiPckc.put(prqi.id,concatPCKC) is '+prqiPckc.put(prqi.id,concatPCKC));
                    if(accessSequenceList != null && accessSequenceList.size() > 0  && accessSequenceList[0].Cost_Pricing_Condition__c!=null)
                        prqiCostMap.put(prqi.Id,accessSequenceList[0].Cost_Pricing_Condition__r.pricing_Condition_code__c+'-'+accessSequenceList[0].Cost_Key_Combination__r.key_Combination_Code__c+'-'+accessSequenceList[0].Cost_Key_Combination__r.key_Combination__c);  
                }

                system.debug('prqiPckc is '+prqiPckc);
                mapOfAllSAP = new Map<Id,Sales_Prices__c>([SELECT id,Ship_To_Country_Code__c,Ship_To_Country__c, ShipTo__c, ShipTo_Code__c,LastModifiedDate,Rate__c,UoM__c,Unit__c,Country_Code__c,Customer_Price_Group_Code__c,Dist_Channel_Code__c,Division_Code__c,Key_Combination_Code__c,
                                                           Material_Code__c,Material_Price_Group_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,End_use_code__c,
                                                           Product_Hierarchy_Code__c,Sales_Office_Code__c,Sales_Org_Code__c,Sold_To_Code__c,pckc__c,Terms_of_Payment_Code__c,Valid_From__c,Valid_To__c,Per__c,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c
                                                           WHERE Pricing_Condition_code__c=:pcCode AND Key_Combination_code__c=:kcCode AND isPriceHolder__c=false AND BU__c=: prqiList[0].BU__c ORDER BY LastModifiedDate  DESC]);
                system.debug('mapOfAllSAP is '+mapOfAllSAP);
                Map<string,List<Sales_Prices__c>> pckcId = new Map<string,List<Sales_Prices__c>>(); 
                for(Sales_Prices__c sp:mapOfAllSap.Values()){
                    if(pckcId.get(sp.pckc__c)!=null){ 
                        tempList = pckcId.get(sp.pckc__c);
                        tempList.add(sp);
                        pckcId.put(sp.pckc__c,tempList);
                    }
                    else{
                        tempList = new List<Sales_Prices__c>();
                        tempList.add(sp);
                        pckcId.put(sp.pckc__c,tempList);
                    }
                }   


                system.debug('pckcId is '+pckcId);
                for(Pricing_Request_Item__c pricingRequestItem:prqiList){   
                    for(Sales_Prices__c sp:pcKcId.get(prqiPckc.get(pricingRequestItem.id))){
                        pricingRequestItem.Cost_Price__c = Decimal.valueOf(sp.Rate__c);
                        toUpdateList.add(pricingRequestItem);
                    }
                }


            }
        }   
        catch(Exception e){
        }
        update toUpdateList;
    }
    //<PR20140916> START
    public static void calculateNetFloorAndReference(List<Pricing_Request_Item__c> prqiList)
    {
        boolean isBothSame = false;
        List<Pricing_Request_Item__c> toUpdateList = new List<Pricing_Request_Item__c>();
        pckcRequestItem = new Map<Id,string>();
        String regionalSalesOrg;
        Decimal tempRate,convertedSPRate;
        try
        {
            System.debug('******prqiList'+(prqiList!=null && prqiList.size() > 0));
            if(prqiList!=null && prqiList.size()>0)
            {
                Pricing_Request__c pr  = [SELECT Id,BU__c,Sales_Org_Code__c,division_code__c,dist_channel_code__c FROM Pricing_Request__c
                                          WHERE Id=:prqiList[0].Pricing_Request__c];
                //*populate the pricing procedure*/
                //get pricing procedure from OrgGrpItems (use it to filter out Pcs and kcs)
                Organizational_Group_Item__c orgItem = [SELECT id,ERP_Pricing_Procedure__c,Business__r.Regional_Floor_Pricing__c FROM Organizational_Group_Item__c WHERE 
                                                        Business__r.Business__c=:pr.BU__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c=:pr.Dist_Channel_Code__c
                                                        AND OrgGroup__r.ERP_Division_Code__c=:pr.Division_Code__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:pr.Sales_Org_Code__c];
                regionalSalesOrg = orgItem.Business__r.Regional_Floor_Pricing__c;

                //get all the pc and kc from prqiList
                Map<Id,string> prqiFlrMap = new Map<Id,string>();
                Map<Id,string> prqiRefMap = new Map<Id,string>();
                Map<Id,string> materialCodeMap = new Map<Id,string>();
                Map<Id,string> customerPGMap = new Map<Id,string>();
                Map<Id,string> countryMap = new Map<Id,string>();
                Map<Id,string> salesOfficeMap = new Map<Id,string>();
                Map<Id,string> soldToCodeMap = new Map<Id,string>();
                Map<string,Id> pckcPrqi = new Map<string,Id>();
                Map<string,string> materialPHCodes = new Map<string,string>();
                Map<string,string> materialFRBCodes = new Map<string,string>();
                Map<string,string> salesOfficeSoldTo = new Map<string,string>();
                Map<string,string> countrySoldTo = new Map<string,string>();
                Map<string,string> cpgSoldTo = new Map<string,string>();
                Map<string,string> endUseCode = new Map<string,string>();
                Map<Id,string> UoMMap = new Map<Id,string>();
                Map<Id,string> newUoMMap = new Map<Id,string>(); 
                Map<string,List<material__c>> materialMCFMap=new Map<string,List<material__c>>();
                Map<string,List<ERP_Material_Conversion_factor__c>> materialCodeMFC=new map<string,List<ERP_Material_Conversion_factor__c>>();   
                Map<string,List<Pricing_Request_Item__c>> MaterialPrqiId=new Map<string,List<Pricing_Request_Item__c>>();
                Map<string,Pricing_Request_Item__c> MId1=new Map<string,Pricing_Request_Item__c>();
                List<ERP_Access_Sequence__c> accessSequenceList = [SELECT id,pricing_condition__c,Floor_Pricing_Condition__r.pricing_condition_code__c,pricing_Key_Combination__c,
                                                                   pricing_key_combination__r.key_combination_code__c,pricing_condition__r.pricing_Condition_code__c,
                                                                   Reference_Pricing_Condition__r.pricing_condition_code__c,Floor_Key_Combination__r.key_Combination_code__c,
                                                                   Reference_key_combination__r.key_combination_code__c,Reference_Key_Combination__r.key_Combination__c,
                                                                   Floor_Key_Combination__r.key_Combination__c,pricing_condition__r.SAP_Cluster__c,pricing_condition__r.SAP_Application_Id__c,
                                                                   pricing_condition__r.SAP_Client_Id__c,pricing_key_combination__r.SAP_Cluster__c,pricing_key_combination__r.SAP_Application_Id__c,
                                                                   pricing_key_combination__r.SAP_Client_Id__c,Net_Floor_Key_Combination__c,Net_Reference_Key_Combination__c,
                                                                   Net_Floor_Key_Combination__r.Key_Combination_Code__c,Net_Reference_Key_Combination__r.Key_Combination_Code__c,
                                                                   Net_Floor_Key_Combination__r.key_Combination__c,Net_Reference_Key_Combination__r.key_Combination__c 
                                                                   FROM ERP_Access_Sequence__c WHERE 
                                                                   Sales_Pricing_Procedure__c=:orgItem.ERP_Pricing_Procedure__c  AND pricing_key_combination__r.SAP_Application_Id__c = :prqiList[0].SAP_Application_Id__c AND 
                                                                   pricing_key_combination__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_condition__r.pricing_Condition_code__c =:prqiList[0].pricing_condition_code__c
                                                                   AND pricing_key_combination__r.key_Combination_code__c =:prqiList[0].key_combination_code__c  AND pricing_condition__r.SAP_Cluster__c=:prqiList[0].SAP_Cluster__c AND
                                                                   pricing_condition__r.SAP_Application_Id__c=:prqiList[0].SAP_Application_Id__c AND
                                                                   pricing_condition__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND pricing_key_combination__r.SAP_Cluster__c = :prqiList[0].SAP_Cluster__c
                                                                   ];

                List<ERP_Access_Sequence__c> seqForNetFloorPC=[select Pricing_Condition__r.pricing_condition_code__c from ERP_Access_Sequence__c WHERE 
                                                               Sales_Pricing_Procedure__c=:orgItem.ERP_Pricing_Procedure__c  AND pricing_key_combination__r.SAP_Application_Id__c = :prqiList[0].SAP_Application_Id__c AND 
                                                               pricing_key_combination__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND Pricing_Condition__r.Price_Types__c='Net Floor' AND pricing_key_combination__c=:accessSequenceList[0].Net_Floor_Key_Combination__c];

                List<ERP_Access_Sequence__c> seqForNetReferencePC=[select Pricing_Condition__r.pricing_condition_code__c from ERP_Access_Sequence__c WHERE 
                                                                   Sales_Pricing_Procedure__c=:orgItem.ERP_Pricing_Procedure__c  AND pricing_key_combination__r.SAP_Application_Id__c = :prqiList[0].SAP_Application_Id__c AND 
                                                                   pricing_key_combination__r.SAP_Client_Id__c=:prqiList[0].SAP_Client_Id__c AND Pricing_Condition__r.Price_Types__c='Net Reference' AND pricing_key_combination__c=:accessSequenceList[0].Net_Reference_Key_Combination__c];    
                system.debug('seqForNetFloorPC:'+seqForNetFloorPC[0].Pricing_Condition__r.pricing_condition_code__c);                                                                                             
                system.debug('seqForNetReferencePC:'+seqForNetReferencePC[0].Pricing_Condition__r.pricing_condition_code__c);
                for(Pricing_Request_Item__c prqi:prqiList)
                {
                    //pushing prqi in to update list updating the flag if no flr/ref pckc is marked for the pc and kc
                    if(accessSequenceList != null && accessSequenceList.size() > 0 && seqForNetFloorPC != null && seqForNetFloorPC.size() > 0
                            && (accessSequenceList[0].Net_Floor_Key_Combination__c==null))
                    {
                        prqi.Below_Floor_Flag__c = false;
                        
                    } 
                    if(accessSequenceList != null && accessSequenceList.size() > 0 && seqForNetReferencePC != null && seqForNetReferencePC.size() > 0
                            && (accessSequenceList[0].Net_Reference_Key_Combination__c==null))
                    {
                        prqi.Below_Reference_Flag__c = false;
                        
                    }
                    if(accessSequenceList != null && accessSequenceList.size() > 0 && seqForNetFloorPC != null && seqForNetFloorPC.size() > 0
                            && (seqForNetFloorPC[0].Pricing_Condition__r.pricing_condition_code__c!=null || accessSequenceList[0].Net_Floor_Key_Combination__c!=null))
                        prqiFlrMap.put(prqi.Id,seqForNetFloorPC[0].Pricing_Condition__r.pricing_Condition_code__c+'-'+accessSequenceList[0].Net_Floor_Key_Combination__r.key_Combination_Code__c+'-'+accessSequenceList[0].Net_Floor_Key_Combination__r.key_Combination__c);
                    if(accessSequenceList != null && accessSequenceList.size() > 0 && seqForNetReferencePC != null && seqForNetReferencePC.size() > 0
                            && (seqForNetReferencePC[0].Pricing_Condition__c!=null || accessSequenceList[0].Net_Reference_Key_Combination__c!=null))
                        prqiRefMap.put(prqi.Id,seqForNetReferencePC[0].Pricing_Condition__r.pricing_Condition_code__c+'-'+accessSequenceList[0].Net_Reference_Key_Combination__r.key_Combination_code__c+'-'+accessSequenceList[0].Net_Reference_Key_Combination__r.key_Combination__c);

                    //*Maps for KC values*/
                    if(!string.isBlank(prqi.Material_Code__c))
                    {
                        materialCodeMap.put(prqi.id,prqi.Material_Code__c);
                        List<Pricing_Request_Item__c> prqiTempList = new List<Pricing_Request_Item__c>();
                        //Added for UOM Conversion
                        if(MaterialPrqiId.get(prqi.Material_Code__c)!=null)
                        {
                            prqiTempList = MaterialPrqiId.get(prqi.Material_Code__c);
                            prqiTempList.add(prqi);
                            MaterialPrqiId.put(prqi.Material_Code__c,prqiTempList);
                        }
                        else
                        {
                            prqiTempList.add(prqi);
                            MaterialPrqiId.put(prqi.Material_Code__c,prqiTempList);
                        }
                    }
                    if(!string.isBlank(prqi.Sold_To_Code__c))
                        soldToCodeMap.put(prqi.id,prqi.Sold_To_Code__c);
                    if(!string.isBlank(prqi.country_code__c))
                        countryMap.put(prqi.id,prqi.country_code__c);
                    if(!string.isBlank(prqi.Customer_Price_Group_Code__c))
                        customerPGMap.put(prqi.id,prqi.Customer_Price_Group_Code__c);
                    if(!string.isBlank(prqi.Sales_Office_Code__c))
                        salesOfficeMap.put(prqi.id,prqi.Sales_Office_Code__c);
                    if(!String.isBlank(prqi.End_Use_code__c))
                        endUseCode.put(prqi.id,prqi.End_Use_code__c);                 
                    pckcPrqi.put(prqi.pckc__c,prqi.Id);
                    //Adding for UoM Conversion
                    UoMMap.put(prqi.id,prqi.uoM__c);
                            newUoMMap.put(prqi.id,prqi.new_UoM__c);
                            //moving the current flag logic outside the loop so as to get the UoM 
                            toUpdateList.add(prqi);
                }
                List<string> materialCodes = materialCodeMap.Values();
                //query all Non SAP 
                Map<id,Sales_Prices__c> mapOfAllSAP = new Map<Id,Sales_Prices__c>();
                Map<id,Sales_Prices__c> mapOfAllSAPRef = new Map<Id,Sales_Prices__c>();
                //when both ref and flr are same
                if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                {
                    if(!prqiRefMap.isEmpty() && prqiRefMap.get(prqiList[0].id).split('-')[2]!=null)
                    {
                        if(prqiFlrMap.get(prqiList[0].id).split('-')[2].equalsIgnoreCase(prqiRefMap.get(prqiList[0].id).split('-')[2]))
                        {
                            isBothSame = true;         
                        }

                    }

                }
                Map<string,List<Sales_Prices__c>> pckcId = new Map<string,List<Sales_Prices__c>>();
                List<Sales_Prices__c> tempList;
                Map<string,string> flrOrRefIdentifier = new Map<string,string>();
                if(!(prqiList[0].Key_Combination__c.contains('PH1') || prqiList[0].Key_Combination__c.contains('FRB')))
                {
                    //<VR20130806> Added field Profit Center in query
                    //query Material to populate PH 
                    List<Material__c> materialList = [SELECT ERP_Material_Code__c,ERP_Product_Hierarchy_Level_1_Code__c,ERP_Product_Hierarchy_Level_2_Code__c,ERP_Product_Hierarchy_Level_3_Code__c,ERP_Product_Hierarchy_Level_4_Code__c,
                                                      ERP_Product_Hierarchy_Level_5_Code__c,ERP_Product_Hierarchy_Level_6_Code__c,ERP_Product_Hierarchy_Level_7_Code__c,
                                                      ERP_Product_Hierarchy_Level_8_Code__c,ERP_Product_Hierarchy_Level_9_Code__c,ERP_Product_Hierarchy_Code__c,ERP_Base_UoM__c,
                                                      ERP_Material_Group_3_Code__c,ERP_Profit_Center_Code__c
                                                      FROM Material__c WHERE ERP_Material_Code__c IN:materialCodes
                                                      AND ERP_Sales_Org_Code__c=:prqiList[0].Sales_Org_Code__c AND RecordType.Name='ERP Material - Extended Data'
                                                      AND ERP_Distribution_Channel_Code__c=:pr.Dist_Channel_Code__c
                                                      AND ERP_Source_Cluster__c=:prqiList[0].SAP_Cluster__c];

                    for(Material__c mat:materialList)
                    {
                        materialPHCodes.put(mat.ERP_Material_code__c,mat.ERP_Product_Hierarchy_Code__c);
                        materialFRBCodes.put(mat.ERP_Material_code__c,mat.ERP_Profit_Center_Code__c);
                        materialBaseUoMMap.put(mat.ERP_Material_Code__c,mat.ERP_Base_UOM__c);
                        endUseCode.put(mat.ERP_Material_code__c,mat.ERP_Material_Group_3_Code__c);
                    }
                }
                //checking if the prqi kc doesnot contain CPG || Country || Sales Office
                if(!prqiList[0].Key_Combination__c.toUpperCase().contains('CUSTOMER PRICE GROUP') || !prqiList[0].Key_Combination__c.toUpperCase().contains('COUNTRY')
                        || !prqiList[0].Key_Combination__c.toUpperCase().contains('SALES OFFICE'))
                {
                    List<ERP_Customer__c> custList = [SELECT Country_Code__c,Customer_Price_Group_Code__c,Customer_Code__c,sales_Office_code__c FROM ERP_Customer__c 
                                                      WHERE Customer_Code__c IN:soldToCodeMap.values()
                                                      AND RecordType.Name='ERP Customer - Extended Data'];              
                    for(ERP_Customer__c cust:custList)
                    {
                        countrySoldTo.put(cust.Customer_Code__c,cust.Country_code__c);
                        cpgSoldTo.put(cust.Customer_Code__c,cust.Customer_Price_Group_Code__c);
                        salesOfficeSoldTo.put(cust.Customer_Code__c,cust.Sales_Office_Code__c); 
                    }

                }
                //Adding for uoM conversion
                List<ERP_Material_Conversion_factor__c> erpMCFList = [SELECT Numerator_Y__c,Denominator_X__c,Base_UoM__c,Alternative_UoM__c,Material__r.ERP_Material_code__c
                                                                      FROM ERP_Material_Conversion_factor__c where (Alternative_Uom__c IN:UoMMap.values() OR Alternative_Uom__c IN:newUoMMap.values())
                AND base_uom__c IN:materialBaseUoMMap.values() AND Material__r.ERP_Material_code__c IN:materialCodes];

                List<ERP_Material_Conversion_factor__c> mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                for(ERP_Material_Conversion_factor__c erpMC:erpMCFList)
                {

                    if(materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c)!=null)
                    {
                        mcfTempList = materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c);
                        mcfTempList.add(erpMC);
                        materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                    }
                    else
                    {
                        mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                        mcfTempList.add(erpMC);
                        materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                    }
                }

                //populating Num and Deno for UoM and NewUoM
                for(string materialCode:materialCodeMFC.keySet())
                {
                    for(ERP_Material_Conversion_factor__c erpMCF:materialCodeMFC.get(materialCode))
                    {
                        if(MaterialPrqiId.containsKey(erpMCF.Material__r.ERP_Material_code__c) &&  materialBaseUoMMap.get(erpMCF.Material__r.ERP_Material_Code__c)==erpMCF.Base_Uom__c )
                        {
                            for(Pricing_Request_Item__c tempPrqi : MaterialPrqiId.get(erpMCF.Material__r.ERP_Material_code__c))
                            {
                                if(erpMCF.Alternative_Uom__c ==   tempPrqi.UoM__c)
                                {
                                    numDenoUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+tempPrqi.UOM__C,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
                                }
                                if(erpMCF.Alternative_Uom__c ==   tempPrqi.New_UoM__c)
                                {
                                    numDenoNewUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+tempPrqi.New_UoM__C,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
                                }
                            }
                        }
                    }
                }      
                //current Flag check Logic 
                for(Pricing_Request_Item__c prqi:toUpdateList)
                {
                    system.debug('Below Ref Flag: '+prqi.Below_Reference_Flag__c);
                    //current flag check
                    if(String.isBlank(prqi.Rate__c)|| (prqi.Pricing_Request_Type__c=='Import' && prqi.Unit__c!='%'))
                        prqi.Below_Current_Flag__c = true;
                    //conversion for currency when required

                    else if (Decimal.valueOf(prqi.New_Rate__c)!=null && prqi.Pricing_Request_Type__c!='Import')
                    {
                        if(prqi.Rate__c!=null)
                        {
                            tempRate = isConversionNeeded(prqi, null,true);
                            if(Decimal.valueOf(prqi.New_Rate__c) > tempRate)//changing as per NPC
                            prqi.Below_Current_Flag__c = false;
                            else
                                prqi.Below_Current_Flag__c = true;
                        }
                    }
                    else
                        prqi.Below_Current_Flag__c = false;  

                }
                //Make sure the map order is in the order of PCKC formula field, also Landing Cost must be to the last
                Map<Integer,String> kcOrderMap = new Map<Integer,String>{1=>'Sales Org.',2=>'Dist. Channel',3=>'Division',4=>'Sold to',5=>'Material',6 =>'PH1',7 =>'PH2',8 =>'PH3',9 =>'PH4',10 =>'PH5',11 =>'PH6',12 =>'PH7',13 =>'PH8',14 =>'PH9', 15 => 'Ship To', 16 => 'Sales Office', 17 => 'Customer Price Group', 18 => 'Material Price Group Code', 19 => 'Price List Type', 20 => 'Terms of Payment', 21 => 'End Use', 22 => 'Market Segment', 23 => 'Variant Code',24 => 'Sales Order Type', 25 => 'Country', 26=> 'FRB', 27 => 'Incoterms', 28 => 'Ship-To Country', 29 => 'ComPartner Code', 30 => 'Kcode', 31 => 'Material Group 1', 32 => 'Sales District', 33 => 'Partner ZF Code', 34 => 'Payer Code', 35 => 'Disc Ref No', 36 => 'FixValDate', 37 => 'Campaign Code', 38 => 'Document Currency Code', 39 => 'State Code', 40 => 'Landing Cost', 41=>  'Material Group 5 Key'};
                if(isBothSame)
                {
                    List<string> expectedKCList = new List<string>();
                    List<string> expectedKCList1 = new List<string>();
                    Set<string> expectedKCSet1 = new Set<string>();
                    if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                        expectedKCList1 = prqiFlrMap.get(prqiList[0].id).split('-')[2].split('/');
                    expectedKCSet1.addAll(expectedKCList1);
                    for(Integer z : kcOrderMap.keySet())
                    {
                        if(expectedKCSet1.contains(kcOrderMap.get(z)))
                            expectedKCList.add(kcOrderMap.get(z));
                        if(expectedKCList.size() ==expectedKCList1.size())
                            break;
                    }

                    //<VR20130806> Added MaterialFRBCodes in parameter

                    returnAfterNetFloorReferenceCalc(expectedKCList,null,toUpdateList,countrySoldTo,cpgSoldTo,salesOfficeSoldTo,materialPHCodes,materialFRBCodes,endUseCode,prqiFlrMap,prqiRefMap,pckcId,isBothSame,MaterialPrqiId,uoMMap.values(),newUoMMap.values(),materialCodes,materialCodeMFC,regionalSalesOrg);
                }
                //both flr and Ref KC same 
                else
                {
                    isBothSame =false;
                    List<string> expectedKCList = new List<string>();
                    List<string> expectedKCList1 = new List<string>();
                    Set<string> expectedKCSet1 = new Set<string>();
                    if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                        expectedKCList1 = prqiFlrMap.get(prqiList[0].id).split('-')[2].split('/');
                    expectedKCSet1.addAll(expectedKCList1);
                    for(Integer z : kcOrderMap.keySet())
                    {
                        if(expectedKCSet1.contains(kcOrderMap.get(z)))
                            expectedKCList.add(kcOrderMap.get(z));
                        if(expectedKCList.size() ==expectedKCList1.size())
                            break;
                    }
                    List<string> expectedKCListRef = new List<string>();
                    expectedKCSet1 = new Set<string>();
                    if(!prqiRefMap.isEmpty() && prqiRefMap.get(prqiList[0].id).split('-')[2]!=null)
                        expectedKCList1 = prqiRefMap.get(prqiList[0].id).split('-')[2].split('/');
                    expectedKCSet1.addAll(expectedKCList1);
                    for(Integer z : kcOrderMap.keySet())
                    {
                        if(expectedKCSet1.contains(kcOrderMap.get(z)))
                            expectedKCListRef.add(kcOrderMap.get(z));
                        if(expectedKCListRef.size() ==expectedKCList1.size())
                            break;
                    }
                    returnAfterNetFloorReferenceCalc(expectedKCList,expectedKCListRef,toUpdateList,countrySoldTo,cpgSoldTo,salesOfficeSoldTo,materialPHCodes,materialFRBCodes,endUseCode,prqiFlrMap,prqiRefMap,null,isBothSame,MaterialPrqiId,uoMMap.values(),newUoMMap.values(),materialCodes,materialCodeMFC,regionalSalesOrg);
                }
            }//if not null 
            update toUpdateList;
        }   //try
        catch(Exception e)
        {
            system.debug('\n\n\n exception '+e);
        }


    }

    private static List<Pricing_Request_Item__c> returnAfterNetFloorReferenceCalc(List<string> expectedFlrKCList,List<string> expectedRefKCList,List<Pricing_Request_Item__c> prqiList,
            Map<string,string> countrySoldTo,Map<string,string>   cpgSoldTo,Map<string,string> salesOfficeSoldTo,Map<string,string> materialPHCodes,Map<string,string> materialFRBCodes,Map<string,string> endUseCode,Map<Id,string> prqiFlrMap,Map<Id,string> prqiRefMap,
            Map<string,List<Sales_Prices__c>> pckcId,boolean isbothTrue,Map<string,List<Pricing_Request_Item__c>> MaterialPrqiId,List<string> uOmValues,List<string> newUOmValues,List<string> materialCodes,
            Map<string,List<ERP_Material_Conversion_Factor__c>> materialCodeMFC, String regionalSalesOrg)
            {

        Decimal tempRate;
        List<Sales_Prices__c> tempList = new List<Sales_Prices__c>();
        Map<id,Sales_Prices__c> mapOfAllSAP = new Map<Id,Sales_Prices__c>();
        List<string> expectedKCList = new List<string>();   
        Map<Id,string> prqiPckc;
        String pcCode;
        //Added for Sales Prices UoM
        List<string> spUoM = new List<string>();    
                Set<String> phCodesForSearch=new Set<String>();
                for(Pricing_Request_Item__c p:prqiList)
                {
                    if(p.F_Product_Hierarchy_Code__c!=null)
                        phCodesForSearch.add(p.F_Product_Hierarchy_Code__c);
                }
                for(String m:materialPHCodes.values())
                {
                    phCodesForSearch.add(m);
                }
                //sendDebug(expectedFlrKCList);
                //sendDebug(expectedRefKCList);
                for(Integer i = 1;i<=2;i++)
                {
                    if(i==1)
                    {
                        if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                        {
                            /* String BUStr = '%'+prqiList[0].BU__c+'%';
                    system.debug('prqiFlrMap is '+prqiFlrMap);
                    system.debug('prqiList[0].id is'+prqiList[0].id);
                    system.debug('prqiFlrMap.get(prqiList[0].id) is '+prqiFlrMap.get(prqiList[0].id));
                    system.debug('prqiList[0].BU__c is '+prqiList[0].BU__c); */
                            mapOfAllSAP = new Map<Id,Sales_Prices__c>([SELECT id,Ship_To_Country_Code__c,Ship_To_Country__c, ShipTo__c, ShipTo_Code__c,LastModifiedDate,Rate__c,UoM__c,Unit__c,Country_Code__c,Customer_Price_Group_Code__c,Dist_Channel_Code__c,Division_Code__c,Key_Combination_Code__c,
                                                                       Material_Code__c,Material_Price_Group_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,End_use_code__c,
                                                                       Product_Hierarchy_Code__c,Sales_Office_Code__c,Sales_Org_Code__c,Sold_To_Code__c,pckc__c,Terms_of_Payment_Code__c,Valid_From__c,Valid_To__c,Per__c,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c
                                                                       WHERE Pricing_Condition_code__c=:prqiFlrMap.get(prqiList[0].id).split('-')[0]
                                                                               AND Key_Combination_code__c=:prqiFlrMap.get(prqiList[0].id).split('-')[1] AND isPriceHolder__c=false AND BU__c=:prqiList[0].BU__c AND  /*(Product_Hierarchy_Code__c = :materialPHCodes.values() OR Product_Hierarchy_Code__c = :phCodesForSearch OR Material_Code__c =:materialCodes)  AND*/ Sales_Pricing_Procedure__c =:prqiList[0].ERP_Pricing_Procedure__c ORDER BY LastModifiedDate  DESC]);
                            pckcId = new Map<string,List<Sales_Prices__c>>(); 
                            expectedKCList.addAll(expectedFlrKCList);
                            pcCode = prqiFlrMap.get(prqiList[0].id).split('-')[0];
                            prqiPckc = new Map<Id,string>();
                        }
                    }   
                    else
                    { 
                        if(!isbothTrue)
                        {
                            prqiPckc = new Map<Id,string>(); 
                            expectedKCList = new List<string>();
                            expectedKCList.addAll(expectedRefKCList);
                        }
                        if(!prqiRefMap.isEmpty() && prqiRefMap.get(prqiList[0].id).split('-')[2]!=null)
                            mapOfAllSAP = new Map<Id,Sales_Prices__c>([SELECT id,Ship_To_Country__c,Ship_To_Country_Code__c,ShipTo__c,ShipTo_Code__c,LastModifiedDate,Rate__c,UoM__c,Unit__c,Country_Code__c,Customer_Price_Group_Code__c,Dist_Channel_Code__c,Division_Code__c,Key_Combination_Code__c,
                                                                       Material_Code__c,Material_Price_Group_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,End_use_code__c,
                                                                       Product_Hierarchy_Code__c,Sales_Office_Code__c,Sales_Org_Code__c,Sold_To_Code__c,pckc__c,Terms_of_Payment_Code__c,Valid_From__c,Valid_To__c,Per__c,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c
                                                                       WHERE Pricing_Condition_code__c=:prqiRefMap.get(prqiList[0].id).split('-')[0] AND Key_Combination_code__c=:prqiRefMap.get(prqiList[0].id).split('-')[1]
                                                                               AND isPriceHolder__c=false AND BU__c=:prqiList[0].BU__c AND /* (Product_Hierarchy_Code__c = :materialPHCodes.values() OR Product_Hierarchy_Code__c = :phCodesForSearch OR Material_Code__c =:materialCodes)  AND*/ Sales_Pricing_Procedure__c =:prqiList[0].ERP_Pricing_Procedure__c ORDER BY LastModifiedDate  DESC] );
                            pckcId = new Map<string,List<Sales_Prices__c>>();
                            pcCode = prqiRefMap.get(prqiList[0].id).split('-')[0];
                    } 
                    //got all the Non SAPs // Also populate all possible UoM Values

                    //system.debug('prqiFlrMap.get(prqiList[0].id)'+ prqiFlrMap.get(prqiList[0].id));
                    //system.debug(logginglevel.error,'mapofAllSAP'+mapofAllSAP.size() +mapofAllSAP);
                    for(Sales_Prices__c sp:mapOfAllSap.Values())
                    {   
                        if(pckcId.get(sp.pckc__c.replace(pcCode,''))!=null)
                        { 
                            tempList = pckcId.get(sp.pckc__c.replace(pcCode,''));
                            tempList.add(sp);
                            pckcId.put(sp.pckc__c.replace(pcCode,''),tempList);
                        }
                        else
                        {
                            tempList = new List<Sales_Prices__c>();
                            tempList.add(sp);
                            pckcId.put(sp.pckc__c.replace(pcCode,''),tempList);
                        }
                        //adding the Sales Prices UoM
                        spUoM.add(sp.UoM__c); 
                    }//End of For
                    List<ERP_Material_Conversion_Factor__c> spMCFList = new List<ERP_Material_Conversion_Factor__c>();
                    spMCFList = [SELECT Numerator_Y__c,Denominator_X__c,Base_UoM__c,Alternative_UoM__c,Material__r.ERP_Material_code__c
                                 FROM ERP_Material_Conversion_factor__c where Alternative_Uom__c IN:spUoM
                                 AND base_uom__c IN:materialBaseUoMMap.values() AND Material__r.ERP_Material_code__c IN:materialCodes
                                 AND Alternative_Uom__c NOT IN:uoMValues AND Alternative_Uom__c NOT IN:newUoMValues];

                    List<ERP_Material_Conversion_factor__c> mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                    for(ERP_Material_Conversion_factor__c erpMC:spMCFList)
                    {
                        if(materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c)!=null)
                        {
                            mcfTempList = materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c);
                            mcfTempList.add(erpMC);
                            materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                        }
                        else
                        {
                            mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                            mcfTempList.add(erpMC);
                            materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                        }
                    }
                    string prodCode;
                    if(!(i==2 && expectedRefKCList==null))
                    {
                        //getting all the values for prq if available or from master 
                        //system.debug('expectedKCList'+expectedKCList);
                                //Added to debug


                                //sendDebug(expectedKCList);
                        for(string s :expectedKCList)
                        {

                            for(Pricing_Request_Item__c prq:prqiList)
                            {
                                if(s.toUpperCase().contains('COUNTRY'))
                                {
                                    if(prq.Country_code__c!=null)
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.country_code__c);
                                        else
                                            prqiPckc.put(prq.id,prq.country_code__c);
                                    }
                                    else
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+countrySoldTo.get(prq.sold_to_code__c));
                                        else
                                            prqiPckc.put(prq.id,countrySoldTo.get(prq.sold_to_code__c));
                                    }
                                }
                                else if(s.toUpperCase().contains('CUSTOMER PRICE GROUP') || s.contains('CPG') )
                                {
                                    if(prq.Customer_Price_Group_Code__c!=null)
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Customer_Price_Group_Code__c);
                                        else
                                            prqiPckc.put(prq.id,prq.Customer_Price_Group_Code__c);
                                    }   
                                    else
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+cpgSoldTo.get(prq.sold_to_code__c));
                                        else
                                            prqiPckc.put(prq.id,cpgSoldTo.get(prq.sold_to_code__c));
                                    }
                                }
                                else if(s.toUpperCase().contains('SALES ORG.'))
                                {
                                    if(prqiPckc.get(prq.id)!=null)
                                    {
                                        if(!String.isBlank(regionalSalesOrg))
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id) + regionalSalesOrg);
                                        else
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id) + prq.Sales_Org_Code__c);
                                    }

                                    else
                                    {
                                        if(!String.isBlank(regionalSalesOrg))
                                            prqiPckc.put(prq.id,regionalSalesOrg);
                                        else
                                            prqiPckc.put(prq.id,prq.Sales_Org_Code__c);
                                    }

                                }
                                else if(s.toUpperCase().contains('DIST. CHANNEL'))
                                {
                                    if(prqiPckc.get(prq.id)!=null)
                                        prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Pricing_Request__r.Dist_Channel_Code__c);
                                    else
                                        prqiPckc.put(prq.id,prq.Pricing_Request__r.Dist_Channel_Code__c); 
                                }
                                else if(s.toUpperCase().contains('DIVISION'))
                                {      //Ver2.0 START
                                    if(prqiPckc.get(prq.id)!=null)
                                        prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Pricing_Request__r.Division_Code__c);
                                    else
                                        prqiPckc.put(prq.id,prq.Pricing_Request__r.Division_Code__c); 
                                    //VER 2.0 end
                                }
                                else if(s.toUpperCase().contains('SALES OFFICE'))
                                {
                                    if(prq.sales_office_code__c!=null)
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.sales_office_code__c);
                                        else
                                            prqiPckc.put(prq.id,prq.sales_office_code__c);
                                    }   
                                    else
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+salesOfficeSoldTo.get(prq.sold_to_code__c));
                                        else
                                            prqiPckc.put(prq.id,salesOfficeSoldTo.get(prq.sold_to_code__c));
                                    }
                                }                                               
                                else if(s.toUpperCase().contains('FRB'))
                                {
                                    if(prq.Profit_Center_code__c!=null)
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Profit_Center_code__c);
                                        else
                                            prqiPckc.put(prq.id,prq.Profit_Center_code__c);
                                    }   
                                    else
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+materialFRBCodes.get(prq.material_code__c));
                                        else
                                            prqiPckc.put(prq.id,materialFRBCodes.get(prq.material_code__c));
                                    }
                                }                                         

                                else if(s.toUpperCase().contains('PH1'))
                                {
                                    Integer requiredLength;
                                    for(Integer ii=1;i<=9;ii++)
                                    {
                                        if(i==1?!prqiFlrMap.get(prqiList[0].id).split('-')[2].contains('PH'+String.valueOf(ii)):!prqiRefMap.get(prqiList[0].id).split('-')[2].contains('PH'+String.valueOf(ii)))
                                        {
                                            //got the heighest PH available
                                            requiredLength = ii-1;
                                            break;                               
                                        }
                                    }
                                    if(!String.isBlank(prq.F_Product_Hierarchy_Code__c))
                                    {
                                        if(prq.F_Product_Hierarchy_Code__c.length()>=requiredLength*2)
                                        {
                                            prodCode = prq.F_Product_Hierarchy_Code__c.subString(0,requiredLength*2);
                                        }
                                        else
                                            prodCode = prq.F_Product_Hierarchy_Code__c;
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prodCode);
                                        else
                                            prqiPckc.put(prq.id,prodCode);
                                        //System.debug(logginglevel.error,prq.F_Product_Hierarchy_Code__c+'***test'+prqiPcKc+'***'+prodcode+requiredLength);
                                    }
                                    else
                                    {
                                        if(materialPHCodes.get(prq.material_code__c).length()>= requiredLength*2)
                                        {
                                            prodCode = materialPHCodes.get(prq.material_code__c).subString(0,requiredLength*2);
                                        }
                                        else
                                        {
                                            prodCode = materialPHCodes.get(prq.material_code__c);
                                        }
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prodCode);
                                        else
                                            prqiPckc.put(prq.id,prodCode);
                                    }
                                }
                                else if(s.toUpperCase().contains('MATERIAL') && !s.toUpperCase().contains('MATERIAL PRICE GROUP'))
                                {
                                    if(prq.Material_code__c!=null)
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Material_code__c);
                                        else
                                            prqiPckc.put(prq.id,prq.Material_code__c);
                                    }
                                }
                                if(s.toUpperCase().contains('END USE'))
                                {
                                    if(prq.End_Use_Code__c!=null)
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.End_Use_code__c);
                                        else
                                            prqiPckc.put(prq.id,prq.End_Use_code__c);
                                    }
                                    else
                                    {
                                        if(prqiPckc.get(prq.id)!=null)
                                            prqiPckc.put(prq.id,prqiPckc.get(prq.id)+endUseCode.get(prq.Material_code__c));
                                        else
                                            prqiPckc.put(prq.id,endUseCode.get(prq.Material_code__c));
                                    }
                                }
                                if(s.toUpperCase().contains('LANDING COST'))
                                {

                                    if(prqiPckc.get(prq.id)!=null)
                                        prqiPckc.put(prq.id,prqiPckc.get(prq.id)+String.valueof(prq.Pricing_Request__r.Landing_Cost__c));
                                    else
                                        prqiPckc.put(prq.id,String.valueof(prq.Pricing_Request__r.Landing_Cost__c));
                                }

                            }//prqi List loop   
                        }//Expected KC loop
                    }//else part         
                    //populating Map for uom conversion for Sales Prices SAP Record
                    for(string materialCode:materialCodeMFC.keySet())
                    {
                        for(ERP_Material_Conversion_factor__c erpMCF:materialCodeMFC.get(materialCode))
                        {
                            if(MaterialPrqiId.containsKey(erpMCF.Material__r.ERP_Material_code__c) && materialBaseUoMMap.get(erpMCF.Material__r.ERP_Material_code__c)      ==erpMCF.Base_Uom__c )
                            {
                                for(Pricing_Request_Item__c tempPrqi : MaterialPrqiId.get(erpMCF.Material__r.ERP_Material_code__c)) 
                                {
                                    if(prqiPckc.get(tempPrqi.id)==null || pcKcId.get(prqiPckc.get(tempPrqi.id))==null)
                                    {
                                        continue;
                                    }
                                    else
                                    {      
                                        for(Sales_Prices__c spp:pcKcId.get(prqiPckc.get(tempPrqi.id)))
                                        {
                                            if(erpMCF.Alternative_Uom__c ==spp.UoM__c)
                                            {
                                                numDenoNewUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+spp.UoM__C,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
                                            }
                                        }//SAles Prices SAP for
                                    }
                                }//ReqItem For
                            }
                        }
                    }
                    //System.debug('Convat Values '+pcCode+regionalSalesOrg+i+prqiPckc.size()+'***expectedKCList'+expectedKCList+'***prqiList'+prqiList.size()+'****pcKcId'+pcKcId.containsKey('F4181002F42517111106'));
                    //System.debug(logginglevel.error,'Convat Values '+prqiPckc+'***prqiList'+prqiList+'****pcKcId'+pcKcId);
                    if(expectedKCList.size()>0)
                    {
                        //<MS20150520>Start
                        List<NPC_Request__c> npCReqList=[SELECT Id,Below_Floor_Flag__c,Below_Reference_Flag__c,Pricing_Request_Item__c From NPC_Request__c where Pricing_Request_Item__c in:prqiList AND Status__c='Active'];
                        //<MS20150520>Start
                        for(Pricing_Request_Item__c pricingRequestItem:prqiList)
                        {
                            //<MS20150520>Start
                            Integer npcrBFCount=0;
                            Integer npcrBRCount=0;
                            Integer npcRequestCount=0;
                            for(NPC_Request__c npcr:npCReqList)
                            {
                                if(npcr.Pricing_Request_Item__c==pricingRequestItem.Id)
                                {
                                  
                                     npcRequestCount=npcRequestCount+1;
                                    if(npcr.Below_Floor_Flag__c==true)
                                        npcrBFCount=npcrBFCount+1;
                                    if(npcr.Below_Reference_Flag__c==true)
                                        npcrBRCount=npcrBRCount+1;
                                }
                            }
                            //<MS20150520>End
                            
                            //System.debug('prqiPckc.get(pricingRequestItem.id)='+prqiPckc.get(pricingRequestItem.id));
                            //System.debug('pcKcId.get(prqiPckc.get(pricingRequestItem.id))'+pcKcId+' '+pcKcId.get(prqiPckc.get(pricingRequestItem.id)));

                            if(prqiPckc.get(pricingRequestItem.id)==null || pcKcId.get(prqiPckc.get(pricingRequestItem.id))==null)
                            {
                                //expecting here if no match found so marking blw flr and ref corres.
                                if(i==1)
                                {
                                    system.debug('#&&^flr1'+pricingRequestItem.Below_Floor_Flag__c);
                                    pricingRequestItem.Below_Floor_Flag__c = true;
                                }
                                else
                                    pricingRequestItem.Below_Reference_Flag__c = true;
                                // loppoing all pricing req items and checking corresponding SAles price Non SAP
                                //when we do not have record in SALES PRICE NON SAP, WE can't execute the code beneath
                                continue;
                            }
                            //when we do not have record in SALES PRICE NON SAP, WE can't execute the code beneath
                            if(i==1) // for Floor
                            {      
                                if(pcKcId.get(prqiPckc.get(pricingRequestItem.id)).size()>1){
                                    sortList(pcKcId.get(prqiPckc.get(pricingRequestItem.id)), 'LastModifiedDate', 'DESC');
                                }
                                for(Sales_Prices__c sp:pcKcId.get(prqiPckc.get(pricingRequestItem.id)))
                                { //
                                    //System.debug('****salesprices'+sp.Id+'***check this'+prqiPckc.get(pricingRequestItem.id).equals(sp.pckc__c.replace(pcCode,'')));
                                    if(prqiPckc.get(pricingRequestItem.id).equals(sp.pckc__c.replace(pcCode,'')) 
                                            && ( (pricingRequestItem.Pricing_Request_Type__c!='Pricing Task' &&  pricingRequestItem.New_Valid_From__c>=sp.Valid_From__c && pricingRequestItem.New_Valid_From__c<=sp.valid_to__c ) || (pricingRequestItem.Pricing_Request_Type__c=='Pricing Task' &&  System.now().date() >=sp.Valid_From__c && System.now().date() <=sp.valid_to__c)))
                                    {

                                        tempRate=isConversionNeeded(pricingRequestItem, sp,false);

                                        if(pricingRequestItem.New_Unit__c!='%')
                                            tempRate=tempRate.setScale(decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.Roundingmode.HALF_EVEN);
                                        //condition to check if the KC contains PH and UoM conversion is required marking it below
                                        if(tempRate==0.00000001)
                                        {
                                            system.debug('#&&^flr2'+pricingRequestItem.Below_Floor_Flag__c);
                                            pricingRequestItem.Below_Floor_flag__c = true;
                                        }
                                        else if(tempRate<Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                             pricingRequestItem.Below_Floor_flag__c = false;
                                        else if(tempRate>Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                        {
                                            system.debug('#&&^flr3'+pricingRequestItem.Below_Floor_Flag__c);
                                            pricingRequestItem.Below_Floor_flag__c = true;
                                        }
                                        //added else to make sure it is marked above when values are same
                                        else
                                            
                                            pricingRequestItem.Below_Floor_flag__c = false; 
                                        pricingRequestItem.Stamp_Floor_Net_Price__c = String.valueOf(tempRate);   //for NPC
                                        //<MS20150520>Start
                                        if(npcRequestCount>0 && npcrBFCount>0)
                                        { 
                                            
                                            pricingRequestItem.Below_Floor_flag__c = true;
                                        }
                                        //<MS20150520>END
                                        break;
                                    }
                                    else
                                    {
                                        //No match Found
                                        system.debug('#&&^flr4'+pricingRequestItem.Below_Floor_Flag__c);
                                        pricingRequestItem.Below_Floor_flag__c = true;
                                    }
                                    //System.debug(logginglevel.error,'****tempRate'+tempRate);
                                    //for reference
                                }   
                            }
                            else
                            {      
                                if(pcKcId.get(prqiPckc.get(pricingRequestItem.id)).size()>1)
                                {
                                    sortList(pcKcId.get(prqiPckc.get(pricingRequestItem.id)), 'LastModifiedDate', 'DESC');
                                }

                                for(Sales_Prices__c sp:pcKcId.get(prqiPckc.get(pricingRequestItem.id)))
                                {
                                    //system.debug('*** Inside isReference found match'+sp.pckc__c+'*****get'+prqiPckc.get(pricingRequestItem.id)+'****map'+prqiPckc);
                                    if(prqiPckc.get(pricingRequestItem.id).equals(sp.pckc__c.replace(pcCode,'')) 
                                            && ( (pricingRequestItem.Pricing_Request_Type__c!='Pricing Task' &&  pricingRequestItem.New_Valid_From__c>=sp.Valid_From__c && pricingRequestItem.New_Valid_From__c<=sp.valid_to__c ) || (pricingRequestItem.Pricing_Request_Type__c=='Pricing Task' &&  System.now().date() >=sp.Valid_From__c && System.now().date() <=sp.valid_to__c)))
                                    {
                                        tempRate=isConversionNeeded(pricingRequestItem, sp,false);
                                        if(pricingRequestItem.New_Unit__c!='%')
                                            tempRate=tempRate.setScale(decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.Roundingmode.HALF_EVEN);
                                        //condition to check if the KC contains PH and UoM conversion is required marking it below
                                        if(tempRate==0.00000001)
                                            pricingRequestItem.Below_Reference_flag__c = true;
                                        else if(tempRate<Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                            pricingRequestItem.Below_Reference_flag__c = false;
                                        else if(tempRate>Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                            pricingRequestItem.Below_Reference_flag__c = true;
                                        //added else to make sure it is marked above when values are same
                                        else
                                            pricingRequestItem.Below_Reference_flag__c = false;           
                                        pricingRequestItem.Stamp_Reference_Net_Price__c = String.valueOf(tempRate);   //for NPC
                                        //<MS20150520>Start
                                        if(npcRequestCount>1 && npcrBRCount>0)
                                        {
                                            pricingRequestItem.Below_Reference_flag__c = true;
                                        }
                                        //<MS20150520>End
                                        break;
                                    }
                                    else
                                    {
                                        //No match Found 
                                        pricingRequestItem.Below_Reference_flag__c = true;
                                    }
                                }
                            }



                        }
                    }//size > 0 if 
                    else
                    {
                    }
                }
                return null;
            }
    //<PR20140916> END

    //<VR20130806> Added MaterialFRBCodes in parameter
    private static List<Pricing_Request_Item__c> returnAfterFloorReferenceCalc(List<string> expectedFlrKCList,List<string> expectedRefKCList,List<Pricing_Request_Item__c> prqiList,
            Map<string,string> countrySoldTo,Map<string,string> cpgSoldTo,Map<string,string> salesOfficeSoldTo,Map<string,string> materialPHCodes,Map<string,string> materialFRBCodes,Map<string,string> endUseCode,Map<Id,string> prqiFlrMap,Map<Id,string> prqiRefMap,
            Map<string,List<Sales_Prices__c>> pckcId,boolean isbothTrue,Map<string,List<Pricing_Request_Item__c>> MaterialPrqiId,List<string> uOmValues,List<string> newUOmValues,List<string> materialCodes,
            Map<string,List<ERP_Material_Conversion_Factor__c>> materialCodeMFC, String regionalSalesOrg, Pricing_Request__c pr)
            {

        //sendDebug(expectedFlrKCList);
        //sendDebug(expectedRefKCList);
        Decimal tempRate;
        List<Sales_Prices__c> tempList = new List<Sales_Prices__c>();
        Map<id,Sales_Prices__c> mapOfAllSAP = new Map<Id,Sales_Prices__c>();
        //<AV20152905>-Production issue- Too many SOQL queries error
        List<Organizational_Group_Item__c> ogiUOM=[SELECT Base_UoM__c from Organizational_Group_Item__c WHERE Business__r.Business__c=:pr.BU__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:pr.Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :pr.Dist_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c = :pr.Division_Code__c];
        List<string> expectedKCList = new List<string>();   
        Map<Id,string> prqiPckc;
        String pcCode;
        //Added for Sales Prices UoM
        List<string> spUoM = new List<string>();    
        system.debug('prqiFlrMap prqiFlrMap'+prqiFlrMap+'prqiRefMap prqiRefMap'+prqiRefMap);
        for(Integer i = 1;i<=2;i++)
        {
            if(i==1)
            {
                if(!prqiFlrMap.isEmpty() && prqiFlrMap.get(prqiList[0].id).split('-')[2]!=null)
                {
                    //<AV20150804>-Production issue-floor ref values not fetched for material price group
                    //<<HN30062016>> - Production issue - Heap Size Error "AND Valid_To__c >= :date.today()" added to query to skip picking up of expired prices
                    //<SH09092022> <IS SC-00105319,IS SC-00105319> added markForDeletion__c=false in where condition to skip checking deleted prices 
                    mapOfAllSAP = new Map<Id,Sales_Prices__c>([SELECT id,Ship_To_Country_Code__c,Ship_To_Country__c, ShipTo__c, ShipTo_Code__c,LastModifiedDate,Rate__c,UoM__c,Unit__c,Country_Code__c,Customer_Price_Group_Code__c,Dist_Channel_Code__c,Division_Code__c,Key_Combination_Code__c,
                                                               Material_Code__c,Material_Price_Group_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,End_use_code__c,
                                                               Product_Hierarchy_Code__c,Sales_Office_Code__c,Sales_Org_Code__c,Sold_To_Code__c,pckc__c,Terms_of_Payment_Code__c,Valid_From__c,Valid_To__c,Per__c,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c
                                                               WHERE Pricing_Condition_code__c=:prqiFlrMap.get(prqiList[0].id).split('-')[0]
                                                                       AND Key_Combination_code__c=:prqiFlrMap.get(prqiList[0].id).split('-')[1] AND isPriceHolder__c=false AND BU__c=: pr.BU__c AND Valid_To__c >= :date.today() And markForDeletion__c=false ORDER BY LastModifiedDate  DESC]);
                    pckcId = new Map<string,List<Sales_Prices__c>>(); 
                    expectedKCList.addAll(expectedFlrKCList);
                    pcCode = prqiFlrMap.get(prqiList[0].id).split('-')[0];
                    prqiPckc = new Map<Id,string>();
                    //sendDebug(string.valueOf(prqiList[0].BU__c+' '+prqiFlrMap.get(prqiList[0].id).split('-')[0]+' '+prqiFlrMap.get(prqiList[0].id).split('-')[1]));
                }
            }   
            else
            { 
                if(!isbothTrue)
                {
                    prqiPckc = new Map<Id,string>(); 
                    expectedKCList = new List<string>();
                    expectedKCList.addAll(expectedRefKCList);
                }
                if(!prqiRefMap.isEmpty() && prqiRefMap.get(prqiList[0].id).split('-')[2]!=null)
                {
                    //if(mapOfAllSAP==null)
                    {
                        //<AV20150804>-Production issue-floor ref values not fetched for material price group  
                        //added markForDeletion__c=false to skip checking deleted prices <IS SC-00100887>
                        mapOfAllSAP = new Map<Id,Sales_Prices__c>([SELECT id,Ship_To_Country__c,Ship_To_Country_Code__c,ShipTo__c,ShipTo_Code__c,LastModifiedDate,Rate__c,UoM__c,Unit__c,Country_Code__c,Customer_Price_Group_Code__c,Dist_Channel_Code__c,Division_Code__c,Key_Combination_Code__c,
                                                                   Material_Code__c,Material_Price_Group_Code__c,PH1_Code__c,PH2_Code__c,PH3_Code__c,PH4_Code__c,PH5_Code__c,PH6_Code__c,PH7_Code__c,PH8_Code__c,PH9_Code__c,Price_List_Type_Code__c,End_use_code__c,
                                                                   Product_Hierarchy_Code__c,Sales_Office_Code__c,Sales_Org_Code__c,Sold_To_Code__c,pckc__c,Terms_of_Payment_Code__c,Valid_From__c,Valid_To__c,Per__c,Sales_District__c, Sales_District_Code__c,Campaign__c, Campaign_Code__c, Document_Currency__c, Document_Currency_Code__c, State__c, State_Code__c FROM Sales_Prices__c
                                                                   WHERE Pricing_Condition_code__c=:prqiRefMap.get(prqiList[0].id).split('-')[0] AND Key_Combination_code__c=:prqiRefMap.get(prqiList[0].id).split('-')[1]
                                                                           AND isPriceHolder__c=false AND BU__c=: pr.BU__c And markForDeletion__c=false ORDER BY LastModifiedDate  DESC] );
                        //  sendDebug(string.valueOf(prqiList[0].BU__c+' '+prqiRefMap.get(prqiList[0].id).split('-')[0]+' '+prqiRefMap.get(prqiList[0].id).split('-')[1]));
                    }
                }   
                pckcId = new Map<string,List<Sales_Prices__c>>();
                pcCode = prqiRefMap.get(prqiList[0].id).split('-')[0];
            }   

            system.debug('mapOfAllSap.Values() mapOfAllSap.Values()'+mapOfAllSap.Values());     
            //got all the Non SAPs // Also populate all possible UoM Values
            for(Sales_Prices__c sp:mapOfAllSap.Values())
            {   
                if(pckcId.get(sp.pckc__c.replace(pcCode,''))!=null)
                { 
                    tempList = pckcId.get(sp.pckc__c.replace(pcCode,''));
                    tempList.add(sp);
                    pckcId.put(sp.pckc__c.replace(pcCode,''),tempList);
                }
                else
                {
                    tempList = new List<Sales_Prices__c>();
                    tempList.add(sp);
                    pckcId.put(sp.pckc__c.replace(pcCode,''),tempList);
                }
                //adding the Sales Prices UoM
                spUoM.add(sp.UoM__c); 
            }//End of For
            system.debug(system.logginglevel.error,'spUoM: '+spUoM+' materialBaseUoMMap.values(): '+materialBaseUoMMap.values()+' materialCodes '+materialCodes+' '+uoMValues+' '+newUoMValues);
            //system.debug();
            //system.debug();
            //system.debug();
            List<ERP_Material_Conversion_Factor__c> spMCFList = new List<ERP_Material_Conversion_Factor__c>();
            spMCFList = [SELECT Numerator_Y__c,Denominator_X__c,Base_UoM__c,Alternative_UoM__c,Material__r.ERP_Material_code__c
                         FROM ERP_Material_Conversion_factor__c where Alternative_Uom__c IN:spUoM
                         AND base_uom__c IN:materialBaseUoMMap.values() AND Material__r.ERP_Material_code__c IN:materialCodes
                         AND Alternative_Uom__c NOT IN:uoMValues AND Alternative_Uom__c NOT IN:newUoMValues];

            List<ERP_Material_Conversion_factor__c> mcfTempList = new List<ERP_Material_Conversion_factor__c>();
            for(ERP_Material_Conversion_factor__c erpMC:spMCFList)
            {
                if(materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c)!=null)
                {
                    mcfTempList = materialCodeMFC.get(erpMC.Material__r.ERP_Material_code__c);
                    mcfTempList.add(erpMC);
                    materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                }
                else
                {
                    mcfTempList = new List<ERP_Material_Conversion_factor__c>();
                    mcfTempList.add(erpMC);
                    materialCodeMFC.put(erpMC.Material__r.ERP_Material_code__c,mcfTempList);
                }
            }
            string prodCode;
            //sendDebug(string.valueOf(expectedKCList));
            if(!(i==2 && expectedRefKCList==null))
            {
                //getting all the values for prq if available or from master 
                for(string s :expectedKCList)
                {
                    for(Pricing_Request_Item__c prq:prqiList)
                    {
                        if(s.toUpperCase().contains('COUNTRY'))
                        {
                            if(prq.Country_code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.country_code__c);
                                else
                                    prqiPckc.put(prq.id,prq.country_code__c);
                            }
                            else
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+countrySoldTo.get(prq.sold_to_code__c));
                                else
                                    prqiPckc.put(prq.id,countrySoldTo.get(prq.sold_to_code__c));
                            }
                        }
                        else if(s.toUpperCase().contains('CUSTOMER PRICE GROUP') || s.contains('CPG') )
                        {
                            if(prq.Customer_Price_Group_Code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Customer_Price_Group_Code__c);
                                else
                                    prqiPckc.put(prq.id,prq.Customer_Price_Group_Code__c);
                            }   
                            else
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+cpgSoldTo.get(prq.sold_to_code__c));
                                else
                                    prqiPckc.put(prq.id,cpgSoldTo.get(prq.sold_to_code__c));
                            }
                        }
                        else if(s.toUpperCase().contains('SALES ORG.'))
                        {
                            if(prqiPckc.get(prq.id)!=null)
                            {
                                if(!String.isBlank(regionalSalesOrg))
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id) + regionalSalesOrg);
                                else
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id) + prq.Sales_Org_Code__c);
                            }

                            else
                            {
                                if(!String.isBlank(regionalSalesOrg))
                                    prqiPckc.put(prq.id,regionalSalesOrg);
                                else
                                    prqiPckc.put(prq.id,prq.Sales_Org_Code__c);
                            }

                        }
                        else if(s.toUpperCase().contains('DIST. CHANNEL'))
                        {
                            if(prqiPckc.get(prq.id)!=null)
                                //<AV20153103>-Production issue- Floor reff vaues not fetched while adding prices
                                prqiPckc.put(prq.id,prqiPckc.get(prq.id)+pr.Dist_Channel_Code__c);
                            else
                                //<AV20153103>-Production issue- Floor reff vaues not fetched while adding prices
                                prqiPckc.put(prq.id,pr.Dist_Channel_Code__c); 
                        }
                        else if(s.toUpperCase().contains('DIVISION'))
                        {      //Ver2.0 START
                            if(prqiPckc.get(prq.id)!=null)
                                prqiPckc.put(prq.id,prqiPckc.get(prq.id)+pr.Division_Code__c);
                            else
                                prqiPckc.put(prq.id,pr.Division_Code__c); 
                            //prqiPckc.put(prq.id,prq.Division_Code__c); 
                            //VER 2.0 end
                        }
                        else if(s.toUpperCase().contains('SALES OFFICE'))
                        {
                            if(prq.sales_office_code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.sales_office_code__c);
                                else
                                    prqiPckc.put(prq.id,prq.sales_office_code__c);
                            }   
                            else
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+salesOfficeSoldTo.get(prq.sold_to_code__c));
                                else
                                    prqiPckc.put(prq.id,salesOfficeSoldTo.get(prq.sold_to_code__c));
                            }
                        }                                               
                        //<VR20130806> Added to incorporate FRB in floor and reference calculation
                        else if(s.toUpperCase().contains('FRB'))
                        {
                            if(prq.Profit_Center_code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Profit_Center_code__c);
                                else
                                    prqiPckc.put(prq.id,prq.Profit_Center_code__c);
                            }   
                            else
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+materialFRBCodes.get(prq.material_code__c));
                                else
                                    prqiPckc.put(prq.id,materialFRBCodes.get(prq.material_code__c));
                            }
                        }                                         

                        else if(s.toUpperCase().contains('PH1'))
                        {
                            Integer requiredLength;
                            for(Integer ii=1;i<=9;ii++)
                            {
                                if(i==1?!prqiFlrMap.get(prqiList[0].id).split('-')[2].contains('PH'+String.valueOf(ii)):!prqiRefMap.get(prqiList[0].id).split('-')[2].contains('PH'+String.valueOf(ii)))
                                {
                                    //got the heighest PH available
                                    requiredLength = ii-1;
                                    break;                               
                                }
                            }
                            if(!String.isBlank(prq.F_Product_Hierarchy_Code__c))
                            {
                                if(prq.F_Product_Hierarchy_Code__c.length()>=requiredLength*2)
                                {
                                    prodCode = prq.F_Product_Hierarchy_Code__c.subString(0,requiredLength*2);
                                }
                                else
                                    prodCode = prq.F_Product_Hierarchy_Code__c;
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prodCode);
                                else
                                    prqiPckc.put(prq.id,prodCode);
                                //System.debug(logginglevel.error,prq.F_Product_Hierarchy_Code__c+'***test'+prqiPcKc+'***'+prodcode+requiredLength);
                            }
                            else
                            {
                                if(materialPHCodes.get(prq.material_code__c).length()>= requiredLength*2)
                                {
                                    prodCode = materialPHCodes.get(prq.material_code__c).subString(0,requiredLength*2);
                                }
                                else
                                {
                                    prodCode = materialPHCodes.get(prq.material_code__c);
                                }
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prodCode);
                                else
                                    prqiPckc.put(prq.id,prodCode);
                            }
                        }
                        //added for X500 Flr
                        else if(s.toUpperCase().contains('MATERIAL') && !s.toUpperCase().contains('MATERIAL PRICE GROUP'))
                        {
                            if(prq.Material_code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Material_code__c);
                                else
                                    prqiPckc.put(prq.id,prq.Material_code__c);
                            }
                        }
                        //<MS20141121>
                        if(s.toUpperCase().contains('MATERIAL PRICE GROUP'))
                        {
                            if(prq.Material_Price_Group_Code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.Material_Price_Group_Code__c);
                                else
                                    prqiPckc.put(prq.id,prq.Material_Price_Group_Code__c);
                            }
                        }
                        //End Use
                        if(s.toUpperCase().contains('END USE'))
                        {
                            if(prq.End_Use_Code__c!=null)
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+prq.End_Use_code__c);
                                else
                                    prqiPckc.put(prq.id,prq.End_Use_code__c);
                            }
                            else
                            {
                                if(prqiPckc.get(prq.id)!=null)
                                    prqiPckc.put(prq.id,prqiPckc.get(prq.id)+endUseCode.get(prq.Material_code__c));
                                else
                                    prqiPckc.put(prq.id,endUseCode.get(prq.Material_code__c));
                            }
                        }
                        //Landing Cost       -- <NS20130821>            
                        if(s.toUpperCase().contains('LANDING COST'))
                        {

                            if(prqiPckc.get(prq.id)!=null)
                                prqiPckc.put(prq.id,prqiPckc.get(prq.id)+String.valueof(prq.Pricing_Request__r.Landing_Cost__c));
                            else
                                prqiPckc.put(prq.id,String.valueof(prq.Pricing_Request__r.Landing_Cost__c));
                        }

                    }//prqi List loop   
                }//Expected KC loop
            }//else part         
            //populating Map for uom conversion for Sales Prices SAP Record
            //<MS20150123>START
            //Changing BU reference to PRI instead of PRI.pr.bu 
            //List<Organizational_Group_Item__c> ogiUOMBru=[SELECT Base_UoM__c from Organizational_Group_Item__c WHERE Business__r.Business__c=:prqiList[0].BU__c AND OrgGroup__r.ERP_Sales_Org_Code__c=:prqiList[0].Sales_Org_Code__c AND OrgGroup__r.ERP_Distribution_Channel_Code__c = :prqiList[0].Dist_Channel_Code__c AND OrgGroup__r.ERP_Division_Code__c = :prqiList[0].Division_Code__c];
            //system.debug('ogiUOMBruogiUOMBru'+ogiUOMBru+prqiList[0]+prqiList+'Bru pr'+pr);
            if(spMCFList!=null && spMCFList.size()>0)
            {
                for(string materialCode:materialCodeMFC.keySet())
                {
                    for(ERP_Material_Conversion_factor__c erpMCF:materialCodeMFC.get(materialCode))
                    {
                        if(MaterialPrqiId.containsKey(erpMCF.Material__r.ERP_Material_code__c) && materialBaseUoMMap.get(erpMCF.Material__r.ERP_Material_code__c)      ==erpMCF.Base_Uom__c )
                        {
                            for(Pricing_Request_Item__c tempPrqi : MaterialPrqiId.get(erpMCF.Material__r.ERP_Material_code__c)) 
                            {
                                if(prqiPckc.get(tempPrqi.id)==null || pcKcId.get(prqiPckc.get(tempPrqi.id))==null)
                                {
                                    continue;
                                }
                                else
                                {      
                                    for(Sales_Prices__c spp:pcKcId.get(prqiPckc.get(tempPrqi.id)))
                                    {
                                        if(erpMCF.Alternative_Uom__c ==spp.UoM__c)
                                        {
                                            numDenoNewUoM.put(erpMCF.Material__r.ERP_Material_code__c+erpMCF.Base_Uom__c+spp.UoM__C,erpMCF.Numerator_Y__c+':'+erpMCF.Denominator_X__c);
                                        }
                                    }//SAles Prices SAP for
                                }
                            }//ReqItem For
                        }
                    }
                }
            }

            if(ogiUOM[0].Base_UOM__c==true)
            {
                for(string materialCode:materialCodeMFC.keySet())
                {
                    for(Pricing_Request_Item__c tempPrqi : MaterialPrqiId.get(materialCode)) 
                    {
                        if(prqiPckc.get(tempPrqi.id)==null || pcKcId.get(prqiPckc.get(tempPrqi.id))==null)
                        {
                            continue;
                        }
                        else
                        {      
                            for(Sales_Prices__c spp:pcKcId.get(prqiPckc.get(tempPrqi.id)))
                            {
                                String conSetting = spp.UoM__c+'_'+tempPrqi.New_UoM__c;
                                system.debug('consetting' +conSetting);
                                //<JM20150525> IS ID-00055216 - Floor reference fix for prodcution issue.
                                if(Standard_UoM_Conversion__c.getInstance(conSetting)!=null)
                                {
                                    String num=Standard_UoM_Conversion__c.getInstance(conSetting).Numerator__c;
                                    String den=Standard_UoM_Conversion__c.getInstance(conSetting).Denominator__c;
                                    system.debug(num+' '+den+' '+numDenoNewUoM.get(tempPrqi.Material_code__c+tempPrqi.New_UoM__c+spp.UoM__C)+' '+tempPrqi.Material_code__c+' '+tempPrqi.New_UoM__c+' '+spp.UoM__C);
                                    if(num!=null && den!=null && numDenoNewUoM.get(tempPrqi.Material_code__c+tempPrqi.New_UoM__c+spp.UoM__C)==null)
                                    {
                                        numDenoNewUoM.put(tempPrqi.Material_code__c+tempPrqi.New_UoM__c+spp.UoM__C,num+':'+den);
                                    }
                                }
                            }//SAles Prices SAP for
                        }

                    }

                }

            }
            //<MS20150106> END
            System.debug('Convat Values '+pcCode+regionalSalesOrg+i+prqiPckc.size()+'***expectedKCList'+expectedKCList+'***prqiList'+prqiList.size()+'****pcKcId'+pcKcId.containsKey('F4181002F42517111106'));
            System.debug('Convat Values '+prqiPckc+'***prqiList'+prqiList+'****pcKcId'+pcKcId);
            //sendDebug(string.valueOf(pcKcId));
            if(expectedKCList.size()>0)
            {
                for(Pricing_Request_Item__c pricingRequestItem:prqiList)
                {
                    system.debug('prqiPckc prqiPckc'+prqiPckc);
                    system.debug('pcKcId pcKcId'+pcKcId);

                    system.debug('pricingRequestItem.id'+pricingRequestItem.id);
                    system.debug('pcKcId.get(prqiPckc.get(pricingRequestItem.id):'+prqiPckc.get(pricingRequestItem.id)+' '+pcKcId.get(prqiPckc.get(pricingRequestItem.id)));
                    if(prqiPckc.get(pricingRequestItem.id)==null || pcKcId.get(prqiPckc.get(pricingRequestItem.id))==null)
                    {
                        //expecting here if no match found so marking blw flr and ref corres.
                        if(i==1)
                            pricingRequestItem.Below_Floor_Flag__c = true;
                        else
                            pricingRequestItem.Below_Reference_Flag__c = true;
                        
                        // loppoing all pricing req items and checking corresponding SAles price Non SAP
                        //when we do not have record in SALES PRICE NON SAP, WE can't execute the code beneath
                        continue;
                    }
                    //when we do not have record in SALES PRICE NON SAP, WE can't execute the code beneath
                    System.debug('Current i:'+i);
                    if(i==1) // for Floor
                    {      
                        if(pcKcId.get(prqiPckc.get(pricingRequestItem.id)).size()>1){
                            sortList(pcKcId.get(prqiPckc.get(pricingRequestItem.id)), 'LastModifiedDate', 'DESC');
                        }
                        for(Sales_Prices__c sp:pcKcId.get(prqiPckc.get(pricingRequestItem.id)))
                        { //
                            System.debug('****salesprices'+sp.Id+'***check this'+prqiPckc.get(pricingRequestItem.id).equals(sp.pckc__c.replace(pcCode,'')));
                            if(prqiPckc.get(pricingRequestItem.id).equals(sp.pckc__c.replace(pcCode,'')) 
                                    && ( (pricingRequestItem.Pricing_Request_Type__c!='Pricing Task' &&  pricingRequestItem.New_Valid_From__c>=sp.Valid_From__c && pricingRequestItem.New_Valid_From__c<=sp.valid_to__c ) || (pricingRequestItem.Pricing_Request_Type__c=='Pricing Task' &&  System.now().date() >=sp.Valid_From__c && System.now().date() <=sp.valid_to__c)))
                            {

                                tempRate=isConversionNeeded(pricingRequestItem, sp,false);

                                if(pricingRequestItem.New_Unit__c!='%')
                                    tempRate=tempRate.setScale(decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.Roundingmode.HALF_EVEN);
                                //condition to check if the KC contains PH and UoM conversion is required marking it below
                                if(tempRate==0.00000001)
                                    pricingRequestItem.Below_Floor_flag__c = true;
                                else if(tempRate<Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                    pricingRequestItem.Below_Floor_flag__c = false;
                                else if(tempRate>Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                    pricingRequestItem.Below_Floor_flag__c = true;
                                //added else to make sure it is marked above when values are same
                                else
                                    pricingRequestItem.Below_Floor_flag__c = false; 
                                
                                pricingRequestItem.Stamp_Floor_Price__c = String.valueOf(tempRate);   //for NPC
                                system.debug(system.logginglevel.error,'@#hi1234'+pricingRequestItem.Stamp_Floor_Price__c);
                                break;
                            }
                            else
                            {
                                //No match Found
                                pricingRequestItem.Below_Floor_flag__c = true;
                                
                            }
                            //System.debug(logginglevel.error,'****tempRate'+tempRate);
                            //for reference
                        }   
                    }
                    else
                    {   
                        //System.debug('Updating Reference');   
                        if(pcKcId.get(prqiPckc.get(pricingRequestItem.id)).size()>1)
                        {
                            sortList(pcKcId.get(prqiPckc.get(pricingRequestItem.id)), 'LastModifiedDate', 'DESC');
                        }

                        for(Sales_Prices__c sp:pcKcId.get(prqiPckc.get(pricingRequestItem.id)))
                        {
                            system.debug('*** Inside isReference found match'+sp.pckc__c+'*****get'+prqiPckc.get(pricingRequestItem.id)+'****map'+prqiPckc);
                            if(prqiPckc.get(pricingRequestItem.id).equals(sp.pckc__c.replace(pcCode,'')) 
                                    && ( (pricingRequestItem.Pricing_Request_Type__c!='Pricing Task' &&  pricingRequestItem.New_Valid_From__c>=sp.Valid_From__c && pricingRequestItem.New_Valid_From__c<=sp.valid_to__c ) || (pricingRequestItem.Pricing_Request_Type__c=='Pricing Task' &&  System.now().date() >=sp.Valid_From__c && System.now().date() <=sp.valid_to__c)))
                            {
                                tempRate=isConversionNeeded(pricingRequestItem, sp,false);
                                if(pricingRequestItem.New_Unit__c!='%')
                                    tempRate=tempRate.setScale(decimalPlacesMap.get(pricingRequestItem.New_Unit__c),System.Roundingmode.HALF_EVEN);
                                //condition to check if the KC contains PH and UoM conversion is required marking it below
                                if(tempRate==0.00000001)
                                    pricingRequestItem.Below_Reference_flag__c = true;
                                else if(tempRate<Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                    pricingRequestItem.Below_Reference_flag__c = false;
                                else if(tempRate>Decimal.valueOf(pricingRequestItem.New_Rate__c))
                                    pricingRequestItem.Below_Reference_flag__c = true;
                                //added else to make sure it is marked above when values are same
                                else
                                    pricingRequestItem.Below_Reference_flag__c = false;           
                                pricingRequestItem.Stamp_Reference_Price__c = String.valueOf(tempRate);   //for NPC
                                system.debug(system.logginglevel.error,'@#hi12345'+pricingRequestItem.Stamp_Reference_Price__c);
                                break;
                            }
                            else
                            {
                                //No match Found 
                                pricingRequestItem.Below_Reference_flag__c = true;
                            }
                        }
                    }



                }
            }//size > 0 if 
            else
            {
            }
        }
        //system.debug('$$$$$$$$$$$4'+Limits.getScriptStatements());
        return null;
            }
    // <PP20130424> -- Ver 2.0 START
    /*
     * Author            :
     * Method Name       :      convertUoMToBaseUoM
     * Parameters :      String,String,String,String
     * Return type       :      String
     * Description       :      This method is used to convert Source UoM to base UoM of a particular Material
     */
    //<MS20150105> Added checkBaseUOM to method arguments
    @testvisible private static String convertUoMToBaseUoM(String rate, String sourceUoM, String baseUoM, String materialCode,String sourceCluster,boolean checkBaseUOM)
    {
        List<ERP_Material_Conversion_Factor__c> mcfList = new List<ERP_Material_Conversion_Factor__c>();
        ERP_Material_Conversion_Factor__c mcf = new ERP_Material_Conversion_Factor__c();
        boolean conversionDoneFlag = false;
        //<MS20150105> Added checkBaseUOM to method arguments
        String numDeno = getNumDenoFromMaterialCode(materialCode, baseUoM, sourceUoM, sourceCluster,checkBaseUOM);
        List<String> numDenoList = new List<String>();
        if(numDeno != null)
        {
            numDenoList = numDeno.split(':');
        }
        if(numDenoList != null && numDenoList.size()>1 && numDenoList[0] != null && numDenoList[1] != null && Decimal.valueOf(numDenoList[0]) != 0)
        {
            rate = String.valueOf(Decimal.valueOf(rate) * (Decimal.valueOf(numDenoList[1])/Decimal.valueOf(numDenoList[0])));
            conversionDoneFlag = true;
        }

        if(String.isBlank(rate))
        {
            rate = '';
        }

        if(conversionDoneFlag)
        {
            return rate+':true';
        }
        else
        {
            return rate+':false';
        }
    }

    //<BB20130712> --Ver 3.1 Added arguments stdCurrency and stdUomM to the method standardizeRate.
    /*
     * Author            :
     * Method Name       :      standardizeRate
     * Parameters :      No parameters
     * Return type       :      void
     * Description       :      This method is used to convert Source UoM to base UoM of a particular Material
     */
    //<MS20150105> Added checkBaseUOM to method arguments
    public static Pricing_Request_Item__c standardizeRate(Pricing_Request_Item__c pricingReqItem,ERP_Pricing_Condition__c pricingCondition, String salesOrg, String distChannel, String stdCurrency, String stdUoM, boolean checkBaseUOM)
    {
        String baseUoM;
        Integer per;
        String usdRate;
        String BUName;
        String salesArea;
        boolean checkTarrif = false;
        decimal tariffRateVal;   
        system.debug('#$%^@'+pricingCondition+','+salesOrg+','+distChannel+','+stdCurrency+','+stdUoM);
        BUName = pricingReqItem.Pricing_Request__r.BU__c;//SS20220525
        salesArea = pricingReqItem.Pricing_Request__r.Sales_Org_Code__c+'-'+pricingReqItem.Pricing_Request__r.Dist_Channel_Code__c+'-'+pricingReqItem.Pricing_Request__r.Division_Code__c;    //MS07022023
        TariffCheck__mdt[] getTariff = [SELECT BU_Name__c,Currency_Code__c,Sales_Area__c,Tariff_Rate__c FROM TariffCheck__mdt];    //MS07022023
        //Pricing_Request__c pr  = [SELECT Id,BU__c FROM Pricing_Request__c WHERE Id=:pricingReqItem.Pricing_Request__c];//KS20220510
        if(!String.isBlank(pricingReqItem.New_Rate__c) && !String.isBlank(pricingReqItem.New_Unit__c) && pricingReqItem.New_Unit__c != '%')
        {
        //MS07022023 
            if(!getTariff.isEmpty() && getTariff!=null)
             {
                for(TariffCheck__mdt tariff:getTariff)
                {
                    if(BUName== tariff.BU_Name__c  && pricingReqItem.New_Unit__c==tariff.Currency_Code__c && salesArea.contains(tariff.Sales_Area__c) )
                    {
                        checkTarrif = true;
                        tariffRateVal= tariff.Tariff_Rate__c;
                        break;
                    }
                }
                if(checkTarrif)
                    {
                        usdRate = convertCurrencyMethodfortariff(pricingReqItem.New_Unit__c,stdCurrency,Decimal.valueOf(pricingReqItem.New_Rate__c),'USD',tariffRateVal);
                    }
                    else{
                        usdRate = convertCurrencyMethod(pricingReqItem.New_Unit__c,stdCurrency,Decimal.valueOf(pricingReqItem.New_Rate__c),'USD');
                        }
            }
        else{
        //<BB20130627> Ver 3.0  -- sending the Standardized Currency from Pricing request as the parameter instead of USD
                usdRate = convertCurrencyMethod(pricingReqItem.New_Unit__c,stdCurrency,Decimal.valueOf(pricingReqItem.New_Rate__c),'USD');
            }
        }
        String replacedKeyComb;
        if(pricingReqItem.Key_Combination__c != null)
        {
            replacedKeyComb = pricingReqItem.Key_Combination__c.replace('Material Price Group','');
        }
        system.debug('testingSTDuom '+pricingReqItem.New_UoM__c+','+pricingReqItem.Material_Code__c+','+replacedKeyComb+','+usdRate+','+pricingReqItem.Pricing_Request_Type__c);
        if(pricingCondition.Calculation_Type__c.containsIgnoreCase('Quantity') && !String.isBlank(pricingReqItem.New_UoM__c)
                && !String.isBlank(pricingReqItem.Material_Code__c) && replacedKeyComb.contains('Material') && !String.isBlank(usdRate)
                && ((pricingReqItem.Pricing_Request_Type__c!='Pricing Task') || ( PApricingtaskUoMConversion__c.getInstance(BUName)!=null)))//SS20220525
        {
            baseUoM = getBaseUoMFromMaterialCode(pricingReqItem.Material_Code__c,salesOrg+':'+distChannel+':'+
                    pricingCondition.SAP_Cluster__c);
            system.debug('@%^#$!%BaseUoM'+baseUoM);
            //<BB20130627> Ver 3.0  -- fetching Standardized UoM from pricing request.
            //<BB20130712> Ver 3.1 -- getting alternate UoMs from the material Code.
            Set<String> altUoMSet = new Set<String>(); 
            altUoMSet = getAlternateUoMFromMaterialCode(pricingReqItem.Material_Code__c,salesOrg+':'+distChannel+':'+pricingCondition.SAP_Cluster__c);
            system.debug('#%$^&#$altUoMset'+altUoMSet);
            //Convert UoM to Base UoM
            //<BB20130627> Ver 3.0  -- Converting UoM to Standardized UoM
            //<BB20130712> Ver 3.1 -- Adding condition to check if Standardized UoM is Present in Alternate UoMs  START.
            //<AV20141125>-START-Production issue-Added logic to set std UoM with materials base UoM if std UoM is blank in orggroupitem
            if(String.isBlank(stdUoM) && !String.isBlank(baseUoM))
            {
                system.debug('@$#%$#1%std UoM'+stdUoM);
                stdUoM = baseUoM;
                system.debug('@$#%$#%std UoM'+stdUoM);
            }
            //<AV20141125>-END
            if((altUoMSet!=null && !String.isBlank(stdUoM) && altUoMSet.contains(stdUoM)))
            {
                //<AV20140512>-START
                system.debug('#%^$%&#hello');
                String numDen = getNumDenoFromMaterialCode(pricingReqItem.Material_Code__c, baseUoM, pricingReqItem.New_UoM__c,pricingCondition.SAP_Cluster__c,checkBaseUOM);
                List<String> numDenList = new List<String>();
                String uomConvFactor;
                if(numDen!=null)
                {
                    numDenList = numDen.split(':');
                }
                if(numDenList != null && numDenList.size()>1 && numDenList[0] != null && numDenList[1] != null && Decimal.valueOf(numDenList[0]) != 0)
                {
                    uomConvFactor = String.valueOf((Decimal.valueOf(numDenList[1])/Decimal.valueOf(numDenList[0])));
                    pricingReqItem.UOM_Conversion_Factors__c = uomConvFactor;
                }
                //<AV20140512>-END
                //<MS20150105> Added checkBaseUOM to method arguments
                String retStr = convertUoMToBaseUoM(usdRate,pricingReqItem.New_UoM__c,baseUoM,pricingReqItem.Material_Code__c,pricingCondition.SAP_Cluster__c,checkBaseUOM);
                if(retStr != null && retStr.contains('true'))
                {
                    usdRate = retStr.split(':')[0];
                    if(baseUoM != stdUoM)
                    {
                        //<MS20150105> Added checkBaseUOM to method arguments
                        String retStr1 = convertUoMToBaseUoM(usdRate,baseUoM,stdUoM,pricingReqItem.Material_Code__c,pricingCondition.SAP_Cluster__c,checkBaseUOM);       
                        if(retStr1 != null && retStr1.contains('true')) 
                        {
                            usdRate = retStr1.split(':')[0];
                            pricingReqItem.Base_UoM__c = stdUoM;
                        }      
                    }
                    else
                    {
                        pricingReqItem.Base_UoM__c = baseUoM;
                    }                    
                }
            }
            else if((checkBaseUOM==true && (Standard_UoM_Conversion__c.getInstance(pricingReqItem.New_UoM__c+'_'+stdUoM)!=null )))
            {
                String retStr = convertUoMToBaseUoM(usdRate,pricingReqItem.New_UoM__c,stdUoM,pricingReqItem.Material_Code__c,pricingCondition.SAP_Cluster__c,checkBaseUOM);
                if(retStr != null && retStr.contains('true'))
                {
                    usdRate = retStr.split(':')[0];
                    pricingReqItem.Base_UoM__c = stdUoM;
                }
            }
            else
            {
                stdUoM = pricingReqItem.New_UoM__c;
                pricingReqItem.Base_UoM__c = stdUoM;
                system.debug('%#$%&@%stdUoM'+pricingReqItem.Base_UoM__c);
            }
        }

        //<AV20150504>-Production issue-Standardized price-conversion not happening in STD UoM-removed material code!= blank from if condition
        else if(pricingCondition.Calculation_Type__c.containsIgnoreCase('Quantity') && !String.isBlank(pricingReqItem.New_UoM__c)
                 && replacedKeyComb.contains('PH') && !String.isBlank(usdRate)
                && (pricingReqItem.Pricing_Request_Type__c!='Pricing Task') || ( PApricingtaskUoMConversion__c.getInstance(BUName)!=null))//SS20220525
        {
            if((checkBaseUOM==true && (Standard_UoM_Conversion__c.getInstance(pricingReqItem.New_UoM__c+'_'+stdUoM)!=null )))
            {
                String retStr = convertUoMToBaseUoM(usdRate,pricingReqItem.New_UoM__c,stdUoM,pricingReqItem.Material_Code__c,pricingCondition.SAP_Cluster__c,checkBaseUOM);
                if(retStr != null && retStr.contains('true'))
                {
                    usdRate = retStr.split(':')[0];
                    pricingReqItem.Base_UoM__c = stdUoM;
                }
            }
        }

        if(pricingReqItem.New_Per__c != null && !String.isBlank(usdRate) && (pricingReqItem.Pricing_Request_Type__c!='Pricing Task') || ( PApricingtaskUoMConversion__c.getInstance(BUName)!=null))//SS20220525
        {
            per = Integer.valueOf(String.valueOf(pricingReqItem.New_Per__c));
            //<BB20130627> Ver 3.0  -- sending the Standardized Currency from Pricing request as the parameter instead of USD
            usdRate = checkPer(stdCurrency,per,1,Decimal.valueOf(usdRate));
        }

        if(!String.isBlank(usdRate))
        {
            if(!String.isBlank(stdCurrency))
                usdRate = String.valueOf(Decimal.valueOf(usdRate).setScale(PAUtil.decimalPlacesMap.get(stdCurrency),System.Roundingmode.HALF_EVEN).abs()); 
            //<PP20130524> -- Ver 2.2 START
            Decimal rate = Decimal.valueOf(usdRate);
            if(!String.isBlank(pricingCondition.Plus_Minus_Code__c))
            {
                rate = rate.abs();
                if(pricingCondition.Plus_Minus_Code__c == 'X')
                {
                    rate = (-1) * rate;
                }
            }
            //<PP20131021> START
            usdRate = String.valueOf(rate);
            if(String.isBlank(pricingReqItem.Base_UoM__c))
            {
                system.debug(system.logginglevel.error,'@#yo1234'+pricingReqItem.Base_UoM__c);
                pricingReqItem.Base_UoM__c = pricingReqItem.New_UoM__c;
                system.debug(system.logginglevel.error,'@#yo12345'+pricingReqItem.Base_UoM__c);
            }
            //<PP20131021> END
        }
        pricingReqItem.USD_Rate__c = usdRate;
        // to make standardized currency as hiphen -- when current price is -- other wise make usd rate as standardizeRate.
       /* if(pricingReqItem.Rate__C=='--'||pricingReqItem.Rate__C==null){
           
                pricingReqItem.USD_Rate__c = '--';
                //pricingReqItem.Pricing_Request__c=PRid;
                 Pricing_Request__c PRrec=new  Pricing_Request__c();
            PRrec=pricingReqItem.Pricing_Request__r;
                PRrec.Standardized_Currency__c=' -- ';
               PRrec.Standardized_UoM__c=' -- ';
               //update PRrec;
        }
        if(pricingReqItem.Rate__C!=null){
             pricingReqItem.USD_Rate__c = usdRate;
        }*/
        //<AV20140512>-START
        pricingReqItem.Exchange_Rate__c=String.valueOf(conversionRateMap.get(pricingReqItem.New_Unit__c));

        //<AV20140512>-END
        //<PP20130524> -- Ver 2.2 END
        return pricingReqItem;            
    }

    //<BB20130712> --Ver 3.1  Commented the method
    /*
     * Author            :
     * Method Name       :      populateBaseUoMAndAlternateUoM
     * Parameters :      No parameters
     * Return type       :      void
     * Description       :      This method is used to populate matCodeToBaseUoMMap,matCodeToAltUoMMap
     */
    //<BB20130712> --Ver 3.1 Added the method to populate Base UoM and Alternate UoM
    public static void populateBaseUoMAndAlternateUoM(Set<String> materialCodesSet, String salesAreaAndCluster)
    {
        List<String> splitSalesAreaAndCluster = salesAreaAndCluster.split(':');
        List<Material__c> materialList = [SELECT Id,ERP_Base_UOM__c,ERP_Material_Code__c FROM Material__c WHERE ERP_Material_Code__c IN
                                          :materialCodesSet AND ERP_Sales_Org_Code__c = :splitSalesAreaAndCluster[0] AND
                                          ERP_Distribution_Channel_Code__c = :splitSalesAreaAndCluster[1] AND ERP_Source_Cluster__c =
                                          :splitSalesAreaAndCluster[2] AND RecordType.Name='ERP Material - Extended Data' AND ERP_Deletion_Flag__c =
                                          false];
        List<ERP_Material_Conversion_Factor__c> mcflist=[SELECT Id,Alternative_UoM__c,Material__r.ERP_Material_code__c FROM ERP_Material_Conversion_Factor__c 
                                                         WHERE Material__r.ERP_Material_code__c IN :materialCodesSet];
        for(Material__c m : materialList)
        {
            matCodeToBaseUoMMap.put(m.ERP_Material_Code__c+salesAreaAndCluster, m.ERP_Base_UOM__c);
        }

        for(ERP_Material_Conversion_Factor__c mcf : mcflist )
        {
            if(matCodeToAltUoMMap.containsKey(mcf.Material__r.ERP_Material_Code__c+salesAreaAndCluster))
            {
                Set<String> s1=matCodeToAltUoMMap.get(mcf.Material__r.ERP_Material_Code__c+salesAreaAndCluster);
                s1.add(mcf.Alternative_UoM__c);
                matCodeToAltUoMMap.put(mcf.Material__r.ERP_Material_Code__c+salesAreaAndCluster,s1);
            }
            else
            {
                Set<String> s2= new Set<String>();
                s2.add(mcf.Alternative_UoM__c);
                matCodeToAltUoMMap.put(mcf.Material__r.ERP_Material_Code__c+salesAreaAndCluster,s2);
            }
        }

    }

    /*
     * Author            :
     * Method Name       :      getBaseUoMFromMaterialCode
     * Parameters :      No parameters
     * Return type       :      void
     * Description       :      This method is used to get base UoM from Material Code, Sales Org, Distribution Channel and SAP Cluster
     */
    public static String getBaseUoMFromMaterialCode(String materialCode, String salesAreaAndCluster)
    {
        if(matCodeToBaseUoMMap.containsKey(materialCode+salesAreaAndCluster))
        {
            return matCodeToBaseUoMMap.get(materialCode+salesAreaAndCluster);
        }
        else
        {
            return null;
        }             
    }

    /*
     * Author            :
     * Method Name       :      getAlternateUoMFromMaterialCode
     * Parameters :      No parameters
     * Return type       :      void
     * Description       :      This method is used to get alternate UoM from Material Code, Sales Org, Distribution Channel and SAP Cluster
     */
    //<BB20130712> --Ver 3.1  Added method to get Alternate UoM from Material Code.
    public static Set<String> getAlternateUoMFromMaterialCode(String materialCode, String salesAreaAndCluster)
    {
        if(matCodeToAltUoMMap.containsKey(materialCode+salesAreaAndCluster))
        {
            return matCodeToAltUoMMap.get(materialCode+salesAreaAndCluster);
        }
        else
        {
            return null;
        }             
    }

    /*
     * Author            :
     * Method Name       :      populateSourceUoMNumDeno
     * Parameters :      No parameters
     * Return type       :      void
     * Description       :      This method is used to get base UoM from Material Code, Sales Org, Distribution Channel and SAP Cluster
     */
    public static void populateSourceUoMNumDeno(Set<String> materialCodesSet, String sourceCluster)
    {
        List<ERP_Material_Conversion_Factor__c> mcfList = new List<ERP_Material_Conversion_Factor__c>();
        mcfList = [SELECT Numerator_Y__c,Denominator_X__c,Base_UoM__c,Alternative_UoM__c,Material__r.ERP_Material_Code__c,Material__r.ERP_Source_Cluster__c
                   FROM ERP_Material_Conversion_Factor__c WHERE Material__r.ERP_Material_Code__c IN :materialCodesSet AND
                   Material__r.ERP_Deletion_Flag__c = false AND Material__r.ERP_Source_Cluster__c = :sourceCluster];
        for(ERP_Material_Conversion_Factor__c mcf : mcfList)
        {
            //<BB20130712> --Ver 3.1 Modified to put alternate UoM conversions
            sourceUoMNumDenoMap.put(mcf.Material__r.ERP_Material_Code__c+mcf.Base_UoM__c+mcf.Alternative_UoM__c+mcf.Material__r.ERP_Source_Cluster__c,mcf.Numerator_Y__c+':'+mcf.Denominator_X__c);
            sourceUoMNumDenoMap.put(mcf.Material__r.ERP_Material_Code__c+mcf.Alternative_UoM__c+mcf.Base_UoM__c+mcf.Material__r.ERP_Source_Cluster__c,mcf.Denominator_X__c+':'+mcf.Numerator_Y__c);
        }
    }
    /*
     * Author            :
     * Method Name       :      getNumDenoFromMaterialCode
     * Parameters :      No parameters
     * Return type       :      void
     * Description       :      This method is used to get base UoM from Material Code, Sales Org, Distribution Channel and SAP Cluster
     */
    public static String getNumDenoFromMaterialCode(String materialCode, String baseUoM, String alternativeUoM, String sourceCluster,boolean checkBaseUOM)
    {
        //<MS20150105> START
        if(sourceUoMNumDenoMap.containsKey(materialCode + baseUoM + alternativeUoM + sourceCluster))
        {
            return sourceUoMNumDenoMap.get(materialCode + baseUoM + alternativeUoM + sourceCluster);
        }
        else if(checkBaseUOM==true)
        {
            String conSetting = baseUoM+'_'+alternativeUoM;
            String numden=':';
            if(Standard_UoM_Conversion__c.getInstance(conSetting)!=null)
            {
                String num=Standard_UoM_Conversion__c.getInstance(conSetting).Numerator__c;
                String den=Standard_UoM_Conversion__c.getInstance(conSetting).Denominator__c;
                numden=den+':'+num;
            }
            return numden;
        }
        else
        {
            return null;
        }
        //<MS20150105> END
    }
    //<PP20130424> -- Ver 2.0 END
    //<PP20130424> -- Ver 2.1 START
    public static String determineLocaleSeparator()
    {
        Decimal standardDecimal = 1.1;
        String localeDecimalStr = standardDecimal.format();
        String separator = localeDecimalStr.subString(1,2);
        return separator;
    }
    //<PP20130424> -- Ver 2.1 END

    //<PP20140101> START
    public static Map<String, String> checkForSynchronousPH(List<Pricing_Request_Item__c> pricingReqItem)
    {
        Map<String,String> phToRepMaterialMap =new Map<String,String>();
        String materialCode;
        String business;
        Set<String> phSet =new Set<String>();
        for(Pricing_Request_Item__c pri:pricingReqItem)
        {
            business = pri.BU__c;
            phSet.add(pri.F_Product_Hierarchy_Code__c);
        }
        List<BU_PH__c> buPHList = new List<BU_PH__c>();
        //<PP20140224>
        buPHList = [SELECT Id,Representative_Material_Code__c,Representative_Material_Description__c,OrgGroup__c,Product_Hierarchy__c,Product_Hierarchy__r.PH_Code__c FROM BU_PH__c WHERE OrgGroup__r.Business__c = :business AND Product_Hierarchy__r.PH_Code__c IN :phSet];

        if(buPHList != null && buPHList.size() != 0)
        {
            for(BU_PH__c buPH : buPHList)
            {
                //<PP20140224>
                if(!String.isBlank(buPH.Representative_Material_Code__c))
                    phToRepMaterialMap.put(buPH.Product_Hierarchy__r.PH_Code__c,buPH.Representative_Material_Code__c+':'+buPH.Representative_Material_Description__c);
            }
        }  
        return phToRepMaterialMap;       
    }
    //<PP20140101> END
    //gets the name field based on sobjectType
    public static string getNameField(string sobjectType) {
        if (sobjectType.toLowercase()=='case')              return 'CaseNumber';
        else if (sobjectType.toLowercase()=='solution')     return 'SolutionName';
        else return 'Name';
    }


    //<GT20141101> Added to delete the data in view state

    public static void deleteViewState(PARequest request)
    {
        if(request!=null)
        {
            if(request.salesPriceSAP!=null && request.salesPriceSAP.relatedWrappersList!=null && request.salesPriceSAP.relatedWrappersList.size()>0)
                request.salesPriceSAP.relatedWrappersList.clear();
            if(request.salesPriceSAP!=null && request.salesPriceSAP.exportWrapList!=null )
                request.salesPriceSAP.exportWrapList.clear();
            if(request.relatedListRequestItemsList!=null)
                request.relatedListRequestItemsList.clear();
            if(request.relatedListERPSalesList!=null)
                request.relatedListERPSalesList.clear();    
            //if(request.pricingReqItemList!=null)
                //request.pricingReqItemList.clear();   
            if(request.listrequestdetils!=null)
                request.listrequestdetils.clear();  
            if(request.listofProjectPrices!=null)
                request.listofProjectPrices.clear();    
            if(request.listofCustomerContacts!=null)
                request.listofCustomerContacts.clear();
            if(request.listofwrappertables!=null)
                request.listofwrappertables.clear();
            if(request.customer!= null)
            {
                if(request.customer.allCustomersWrapList!=null)
                    request.customer.allCustomersWrapList.clear();
                if(request.customer.allSalesRepsWrapList!=null)
                    request.customer.allSalesRepsWrapList.clear();

            }

        }
    }

    //<MS20141209>n Util Method for Apex Error Messages 
   public static boolean apexErrorMsg(String errorMsg)
  {
    /********************Changes for IS ID-00065733***************************/
        ApexPages.Message myMsg;
        if(errorMsg == Label.Request_Status_Changed){
            myMsg = new ApexPages.Message(ApexPages.Severity.INFO,errorMsg);
        }else{
          myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg);  
        }
        ApexPages.addMessage(myMsg);
        return true;
  }
    public static void apexWarningMsg(String warnMsg)
    {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING,warnMsg);  
        ApexPages.addMessage(myMsg);
    }
//Bypass triggers during migration
Public static Boolean CheckBypassProfile(){
        Boolean Isactive=false;
        try{ 
        Global_On_Off_Switch__c ByPassData =  Global_On_Off_Switch__c.getInstance();
        If(ByPassData!=null){
            Isactive =ByPassData.Triggers__c;
        }
     
        }
        Catch(Exception e){
            
        }
        return Isactive;
    }
/* // Merge&Spin - Logic no longer needed
Method to skip trigger logic for data loading.

 public static boolean skipAllTriggersPACheck(String triggerCode){
    if(Skip_All_Triggers_PA__c.getInstance(triggerCode) != null && 
       Skip_All_Triggers_PA__c.getInstance(triggerCode).Is_skip_trigger__c)
    {
     return false; 
    }else{
     return true;
    }
 }
*/

    /*public static void sendDebug(String msg)
{
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {'test'}; 
                mail.setToAddresses(toAddresses);
                mail.setSubject('Debug:');
                mail.setPlainTextBody('log content '+msg);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}*/
}